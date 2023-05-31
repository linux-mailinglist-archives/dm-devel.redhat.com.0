Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D74718416
	for <lists+dm-devel@lfdr.de>; Wed, 31 May 2023 16:02:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685541739;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oX3TVxUn+zTCKQRZx1MQVsSm00XWaySUbnMyVgskyLc=;
	b=bHaZOZm18h6o0nIegpVEuSflyjGjEN6FNtNssIh9DKuoxCBadZokvMzyDmXzt97yS1ucLf
	nRrg/2mLqte3X//XwERslz++2JHzYV0v05bjtcqXdGuLUqx8FHR5ZESQvCo4WLNKhe0LPn
	IiZqhGr5xAy6z4lmJ/v9Qo9Zemnkteo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-WkccZ5ueMfaRjFxYJEc7zw-1; Wed, 31 May 2023 10:02:17 -0400
X-MC-Unique: WkccZ5ueMfaRjFxYJEc7zw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04A4D101A53B;
	Wed, 31 May 2023 14:02:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42AE540CFD45;
	Wed, 31 May 2023 14:02:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B389319465A0;
	Wed, 31 May 2023 14:02:02 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7C2081946595
 for <dm-devel@listman.corp.redhat.com>; Wed, 31 May 2023 13:52:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6599D40C6EC4; Wed, 31 May 2023 13:52:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EBBD40C1282
 for <dm-devel@redhat.com>; Wed, 31 May 2023 13:52:54 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C5271C08781
 for <dm-devel@redhat.com>; Wed, 31 May 2023 13:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-RjIaPj64MpaXZ2xX_suxhg-1; Wed, 31 May 2023 09:52:52 -0400
X-MC-Unique: RjIaPj64MpaXZ2xX_suxhg-1
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4LMq-00HQy6-2x; Wed, 31 May 2023 12:55:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 14:55:14 +0200
Message-Id: <20230531125535.676098-4-hch@lst.de>
In-Reply-To: <20230531125535.676098-1-hch@lst.de>
References: <20230531125535.676098-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH 03/24] PM: hibernate: remove the global
 snapshot_test variable
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Loic Poulain <loic.poulain@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Joern Engel <joern@lazybastard.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Passing call dependent variable in global variables is a huge
antipattern.  Fix it up.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
 kernel/power/hibernate.c | 17 ++++++-----------
 kernel/power/power.h     |  3 +--
 kernel/power/swap.c      |  2 +-
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 07279506366255..78696aa04f5ca3 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -64,7 +64,6 @@ enum {
 static int hibernation_mode = HIBERNATION_SHUTDOWN;
 
 bool freezer_test_done;
-bool snapshot_test;
 
 static const struct platform_hibernation_ops *hibernation_ops;
 
@@ -684,7 +683,7 @@ static void power_down(void)
 		cpu_relax();
 }
 
-static int load_image_and_restore(void)
+static int load_image_and_restore(bool snapshot_test)
 {
 	int error;
 	unsigned int flags;
@@ -721,6 +720,7 @@ static int load_image_and_restore(void)
  */
 int hibernate(void)
 {
+	bool snapshot_test = false;
 	unsigned int sleep_flags;
 	int error;
 
@@ -748,9 +748,6 @@ int hibernate(void)
 	if (error)
 		goto Exit;
 
-	/* protected by system_transition_mutex */
-	snapshot_test = false;
-
 	lock_device_hotplug();
 	/* Allocate memory management structures */
 	error = create_basic_memory_bitmaps();
@@ -792,9 +789,9 @@ int hibernate(void)
 	unlock_device_hotplug();
 	if (snapshot_test) {
 		pm_pr_dbg("Checking hibernation image\n");
-		error = swsusp_check();
+		error = swsusp_check(snapshot_test);
 		if (!error)
-			error = load_image_and_restore();
+			error = load_image_and_restore(snapshot_test);
 	}
 	thaw_processes();
 
@@ -982,8 +979,6 @@ static int software_resume(void)
 	 */
 	mutex_lock_nested(&system_transition_mutex, SINGLE_DEPTH_NESTING);
 
-	snapshot_test = false;
-
 	if (!swsusp_resume_device) {
 		error = find_resume_device();
 		if (error)
@@ -994,7 +989,7 @@ static int software_resume(void)
 		MAJOR(swsusp_resume_device), MINOR(swsusp_resume_device));
 
 	pm_pr_dbg("Looking for hibernation image.\n");
-	error = swsusp_check();
+	error = swsusp_check(false);
 	if (error)
 		goto Unlock;
 
@@ -1022,7 +1017,7 @@ static int software_resume(void)
 		goto Close_Finish;
 	}
 
-	error = load_image_and_restore();
+	error = load_image_and_restore(false);
 	thaw_processes();
  Finish:
 	pm_notifier_call_chain(PM_POST_RESTORE);
diff --git a/kernel/power/power.h b/kernel/power/power.h
index b83c8d5e188dec..978189fcafd124 100644
--- a/kernel/power/power.h
+++ b/kernel/power/power.h
@@ -59,7 +59,6 @@ asmlinkage int swsusp_save(void);
 
 /* kernel/power/hibernate.c */
 extern bool freezer_test_done;
-extern bool snapshot_test;
 
 extern int hibernation_snapshot(int platform_mode);
 extern int hibernation_restore(int platform_mode);
@@ -174,7 +173,7 @@ extern int swsusp_swap_in_use(void);
 #define SF_HW_SIG		8
 
 /* kernel/power/hibernate.c */
-extern int swsusp_check(void);
+int swsusp_check(bool snapshot_test);
 extern void swsusp_free(void);
 extern int swsusp_read(unsigned int *flags_p);
 extern int swsusp_write(unsigned int flags);
diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index 92e41ed292ada8..efed11568bfc72 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -1514,7 +1514,7 @@ int swsusp_read(unsigned int *flags_p)
  *      swsusp_check - Check for swsusp signature in the resume device
  */
 
-int swsusp_check(void)
+int swsusp_check(bool snapshot_test)
 {
 	int error;
 	void *holder;
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

