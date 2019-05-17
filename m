Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D7E21B4F
	for <lists+dm-devel@lfdr.de>; Fri, 17 May 2019 18:16:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0A7FF20260;
	Fri, 17 May 2019 16:16:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF6E160FB3;
	Fri, 17 May 2019 16:16:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CE6F1806B13;
	Fri, 17 May 2019 16:15:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HGELMa030070 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 12:14:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B86275DC1B; Fri, 17 May 2019 16:14:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 092075DD64;
	Fri, 17 May 2019 16:14:14 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4HGEDvN021219; 
	Fri, 17 May 2019 11:14:13 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x4HGEC7M021218;
	Fri, 17 May 2019 11:14:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 17 May 2019 11:14:07 -0500
Message-Id: <1558109650-21179-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1558109650-21179-1-git-send-email-bmarzins@redhat.com>
References: <1558109650-21179-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 1/4] libmultipath: handle clock_gettime failures
	in tur checker
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 17 May 2019 16:16:41 +0000 (UTC)

If clock_gettime() fails, and multipathd can't figure out when it should
time out, it should just default to assuming that it has already timed
out. Found by coverity.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers/tur.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/libmultipath/checkers/tur.c b/libmultipath/checkers/tur.c
index 6b08dbbb..717353ef 100644
--- a/libmultipath/checkers/tur.c
+++ b/libmultipath/checkers/tur.c
@@ -290,7 +290,12 @@ static void *tur_thread(void *ctx)
 
 static void tur_timeout(struct timespec *tsp)
 {
-	clock_gettime(CLOCK_MONOTONIC, tsp);
+	if (clock_gettime(CLOCK_MONOTONIC, tsp) != 0) {
+		/* can't get time. clear tsp to not wait */
+		tsp->tv_sec = 0;
+		tsp->tv_nsec = 0;
+		return;
+	}
 	tsp->tv_nsec += 1000 * 1000; /* 1 millisecond */
 	normalize_timespec(tsp);
 }
@@ -300,8 +305,12 @@ static void tur_set_async_timeout(struct checker *c)
 	struct tur_checker_context *ct = c->context;
 	struct timespec now;
 
-	clock_gettime(CLOCK_MONOTONIC, &now);
-	ct->time = now.tv_sec + c->timeout;
+	if (clock_gettime(CLOCK_MONOTONIC, &now) != 0)
+		/* can't get time. clear time to always timeout on
+		 * next path check */
+		ct->time = 0;
+	else
+		ct->time = now.tv_sec + c->timeout;
 }
 
 static int tur_check_async_timeout(struct checker *c)
@@ -309,7 +318,9 @@ static int tur_check_async_timeout(struct checker *c)
 	struct tur_checker_context *ct = c->context;
 	struct timespec now;
 
-	clock_gettime(CLOCK_MONOTONIC, &now);
+	if (clock_gettime(CLOCK_MONOTONIC, &now) != 0)
+		/* can't get time. assume we've timed out */
+		return 1;
 	return (now.tv_sec > ct->time);
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
