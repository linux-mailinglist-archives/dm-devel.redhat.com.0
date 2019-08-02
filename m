Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E78157FEB6
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 18:39:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 870BD30C745E;
	Fri,  2 Aug 2019 16:39:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5020B60635;
	Fri,  2 Aug 2019 16:39:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EBCE18089C8;
	Fri,  2 Aug 2019 16:39:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72GXnQr001270 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 12:33:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D6F81001B12; Fri,  2 Aug 2019 16:33:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9D2A10016EA;
	Fri,  2 Aug 2019 16:33:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x72GXjAn031794; 
	Fri, 2 Aug 2019 11:33:45 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x72GXiSq031793;
	Fri, 2 Aug 2019 11:33:44 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri,  2 Aug 2019 11:33:27 -0500
Message-Id: <1564763622-31752-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Muneendra Kumar <mkumar@redhat.com>
Subject: [dm-devel] [PATCH 01/16] libmultipath: make
	vector_foreach_slot_backwards work as expected
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 02 Aug 2019 16:39:07 +0000 (UTC)

All of the code that uses vector_foreach_slot_backwards() treats "i" as
the index of the entry "p", but the way it was coded, that wasn't the
case. "i" was the number of the entry counting from 1, not 0.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/vector.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/vector.h b/libmultipath/vector.h
index 41d2b896..344dffd5 100644
--- a/libmultipath/vector.h
+++ b/libmultipath/vector.h
@@ -40,7 +40,7 @@ typedef struct _vector *vector;
 #define vector_foreach_slot_after(v,p,i) \
 	for (; (v) && i < VECTOR_SIZE(v) && ((p) = (v)->slot[i]); i++)
 #define vector_foreach_slot_backwards(v,p,i) \
-	for (i = VECTOR_SIZE(v); i > 0 && ((p) = (v)->slot[i-1]); i--)
+	for (i = VECTOR_SIZE(v) - 1; (int)i >= 0 && ((p) = (v)->slot[i]); i--)
 
 #define identity(x) (x)
 /*
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
