Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 833B170D826
	for <lists+dm-devel@lfdr.de>; Tue, 23 May 2023 11:00:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684832405;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XPSJZ4LHy7+DWlGMz0yR8YOPbtO9Hy8ghHYPX8YYbPw=;
	b=DBxer05x/PIp/xNEsD02+C5nscTOpkMSl6rANhAvcQKV+g1ntJRtQ2jeS4ddeZDpuf2m0e
	ahMVAX18HxaaY5W9HH8osj7LfpNNdHJQL0gJYxGoAH1pnwtdpuwuuLpcKf3yBNOc/x3tPH
	H83PYcNOpC9bkCCsNI8D4tbSicyLC5k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-Cy0UeNzCOga1kKMM-IQGIA-1; Tue, 23 May 2023 05:00:02 -0400
X-MC-Unique: Cy0UeNzCOga1kKMM-IQGIA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B01268032F5;
	Tue, 23 May 2023 08:59:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A7DB492B0B;
	Tue, 23 May 2023 08:59:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 21B7C19465BA;
	Tue, 23 May 2023 08:59:53 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C32201946595
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 08:59:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9D2D5492B0B; Tue, 23 May 2023 08:59:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96023492B0A
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:59:51 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7539F3C17C60
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:59:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-O00IgEnGOFOw4Ke2t8kfcw-1; Tue, 23 May 2023 04:59:50 -0400
X-MC-Unique: O00IgEnGOFOw4Ke2t8kfcw-1
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1MiK-009GWl-20; Tue, 23 May 2023 07:45:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 23 May 2023 09:45:15 +0200
Message-Id: <20230523074535.249802-5-hch@lst.de>
In-Reply-To: <20230523074535.249802-1-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [dm-devel] [PATCH 04/24] PM: hibernate: move finding the resume
 device out of software_resume
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Joern Engel <joern@lazybastard.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

software_resume can be called either from an init call in the boot code,
or from sysfs once the system has finished booting, and the two
invocation methods this can't race with each other.

For the latter case we did just parse the suspend device manually, while
the former might not have one.  Split software_resume so that the search
only happens for the boot case, which also means the special lockdep
nesting annotation can go away as the system transition mutex can be
taken a little later and doesn't have the sysfs locking nest inside it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/power/hibernate.c | 80 ++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 41 deletions(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 78696aa04f5ca3..45e24b02cd50b6 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -907,7 +907,7 @@ int hibernate_quiet_exec(int (*func)(void *data), void *data)
 }
 EXPORT_SYMBOL_GPL(hibernate_quiet_exec);
 
-static int find_resume_device(void)
+static int __init find_resume_device(void)
 {
 	if (!strlen(resume_file))
 		return -ENOENT;
@@ -942,53 +942,16 @@ static int find_resume_device(void)
 	return 0;
 }
 
-/**
- * software_resume - Resume from a saved hibernation image.
- *
- * This routine is called as a late initcall, when all devices have been
- * discovered and initialized already.
- *
- * The image reading code is called to see if there is a hibernation image
- * available for reading.  If that is the case, devices are quiesced and the
- * contents of memory is restored from the saved image.
- *
- * If this is successful, control reappears in the restored target kernel in
- * hibernation_snapshot() which returns to hibernate().  Otherwise, the routine
- * attempts to recover gracefully and make the kernel return to the normal mode
- * of operation.
- */
 static int software_resume(void)
 {
 	int error;
 
-	/*
-	 * If the user said "noresume".. bail out early.
-	 */
-	if (noresume || !hibernation_available())
-		return 0;
-
-	/*
-	 * name_to_dev_t() below takes a sysfs buffer mutex when sysfs
-	 * is configured into the kernel. Since the regular hibernate
-	 * trigger path is via sysfs which takes a buffer mutex before
-	 * calling hibernate functions (which take system_transition_mutex)
-	 * this can cause lockdep to complain about a possible ABBA deadlock
-	 * which cannot happen since we're in the boot code here and
-	 * sysfs can't be invoked yet. Therefore, we use a subclass
-	 * here to avoid lockdep complaining.
-	 */
-	mutex_lock_nested(&system_transition_mutex, SINGLE_DEPTH_NESTING);
-
-	if (!swsusp_resume_device) {
-		error = find_resume_device();
-		if (error)
-			goto Unlock;
-	}
-
 	pm_pr_dbg("Hibernation image partition %d:%d present\n",
 		MAJOR(swsusp_resume_device), MINOR(swsusp_resume_device));
 
 	pm_pr_dbg("Looking for hibernation image.\n");
+
+	mutex_lock(&system_transition_mutex);
 	error = swsusp_check(false);
 	if (error)
 		goto Unlock;
@@ -1035,7 +998,39 @@ static int software_resume(void)
 	goto Finish;
 }
 
-late_initcall_sync(software_resume);
+/**
+ * software_resume_initcall - Resume from a saved hibernation image.
+ *
+ * This routine is called as a late initcall, when all devices have been
+ * discovered and initialized already.
+ *
+ * The image reading code is called to see if there is a hibernation image
+ * available for reading.  If that is the case, devices are quiesced and the
+ * contents of memory is restored from the saved image.
+ *
+ * If this is successful, control reappears in the restored target kernel in
+ * hibernation_snapshot() which returns to hibernate().  Otherwise, the routine
+ * attempts to recover gracefully and make the kernel return to the normal mode
+ * of operation.
+ */
+static int __init software_resume_initcall(void)
+{
+	/*
+	 * If the user said "noresume".. bail out early.
+	 */
+	if (noresume || !hibernation_available())
+		return 0;
+
+	if (!swsusp_resume_device) {
+		int error = find_resume_device();
+
+		if (error)
+			return error;
+	}
+
+	return software_resume();
+}
+late_initcall_sync(software_resume_initcall);
 
 
 static const char * const hibernation_modes[] = {
@@ -1176,6 +1171,9 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	char *name;
 	dev_t res;
 
+	if (!hibernation_available())
+		return 0;
+
 	if (len && buf[len-1] == '\n')
 		len--;
 	name = kstrndup(buf, len, GFP_KERNEL);
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

