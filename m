Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A94F21B4C
	for <lists+dm-devel@lfdr.de>; Fri, 17 May 2019 18:16:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC07C64391;
	Fri, 17 May 2019 16:16:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FB055C241;
	Fri, 17 May 2019 16:16:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 841A01806B14;
	Fri, 17 May 2019 16:16:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HGEKWj030061 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 12:14:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFFDD5C1B5; Fri, 17 May 2019 16:14:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A0C55C21E;
	Fri, 17 May 2019 16:14:18 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4HGEG1r021227; 
	Fri, 17 May 2019 11:14:17 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x4HGEG0L021226;
	Fri, 17 May 2019 11:14:16 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 17 May 2019 11:14:09 -0500
Message-Id: <1558109650-21179-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1558109650-21179-1-git-send-email-bmarzins@redhat.com>
References: <1558109650-21179-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 3/4] multipathd: fix REALLOC_REPLY with max
	length reply
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 17 May 2019 16:16:30 +0000 (UTC)

Commit cd5a9797e added code to REALLOC_REPLY() that intended to stop
growing the reply buffer after it reached a maximum size. However this
code didn't stop the realloc() from happening. Worse, if the realloc()
failed, multipathd would double free the reply buffer. Found by
Coverity.

Fixes: cd5a9797e "libmpathcmd(coverity): limit reply length"
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/cli.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/multipathd/cli.h b/multipathd/cli.h
index f3fa077a..32dcffac 100644
--- a/multipathd/cli.h
+++ b/multipathd/cli.h
@@ -100,15 +100,16 @@ enum {
 			if (m >= MAX_REPLY_LEN) {		\
 				condlog(1, "Warning: max reply length exceeded"); \
 				free(tmp);			\
-				r = NULL;			\
+				(r) = NULL;			\
+			} else {				\
+				(r) = REALLOC((r), (m) * 2);	\
+				if ((r)) {			\
+					memset((r) + (m), 0, (m)); \
+					(m) *= 2;		\
+				}				\
+				else				\
+					free(tmp);		\
 			}					\
-			(r) = REALLOC((r), (m) * 2);		\
-			if ((r)) {				\
-				memset((r) + (m), 0, (m));	\
-				(m) *= 2;			\
-			}					\
-			else					\
-				free(tmp);			\
 		}						\
 	} while (0)
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
