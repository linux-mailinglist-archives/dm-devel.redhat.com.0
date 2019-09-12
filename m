Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D0CB0A8F
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 10:46:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 045E52A09D0;
	Thu, 12 Sep 2019 08:46:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6954B1001B08;
	Thu, 12 Sep 2019 08:46:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8EEC180085A;
	Thu, 12 Sep 2019 08:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8C8jvbw027312 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 04:45:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0CB4F5DA5B; Thu, 12 Sep 2019 08:45:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0E25D9E2;
	Thu, 12 Sep 2019 08:45:54 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1i8Kjg-00035f-4Z; Thu, 12 Sep 2019 10:45:53 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Thu, 12 Sep 2019 10:45:48 +0200
Message-Id: <20190912084547.836289000@debian-a64.vm>
User-Agent: quilt/0.65
Date: Thu, 12 Sep 2019 10:44:46 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Martijn Coenen <maco@android.com>, Mike Snitzer <msnitzer@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-bufio-global-queue.patch
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dariofreni@google.com, jiyong@google.com, dm-devel@redhat.com,
	maco@google.com, Mikulas Patocka <mpatocka@redhat.com>,
	kernel-team@android.com
Subject: [dm-devel] [PATCH 3/5] dm-bufio: introduce a global queue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 12 Sep 2019 08:46:30 +0000 (UTC)

Rename param_spinlock to global_spinlock and introduce a global queue of
all used buffers. The queue will be used in the following patches.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2019-09-10 16:54:13.000000000 +0200
+++ linux-2.6/drivers/md/dm-bufio.c	2019-09-11 19:40:27.000000000 +0200
@@ -133,6 +133,7 @@ enum data_mode {
 struct dm_buffer {
 	struct rb_node node;
 	struct list_head lru_list;
+	struct list_head global_list;
 	sector_t block;
 	void *data;
 	unsigned char data_mode;		/* DATA_MODE_* */
@@ -193,7 +194,9 @@ static unsigned long dm_bufio_cache_size
  */
 static unsigned long dm_bufio_cache_size_latch;
 
-static DEFINE_SPINLOCK(param_spinlock);
+static DEFINE_SPINLOCK(global_spinlock);
+
+static LIST_HEAD(global_queue);
 
 /*
  * Buffers are freed after this timeout
@@ -302,7 +305,7 @@ static void adjust_total_allocated(struc
 	if (unlink)
 		diff = -diff;
 
-	spin_lock(&param_spinlock);
+	spin_lock(&global_spinlock);
 
 	*class_ptr[data_mode] += diff;
 
@@ -311,7 +314,13 @@ static void adjust_total_allocated(struc
 	if (dm_bufio_current_allocated > dm_bufio_peak_allocated)
 		dm_bufio_peak_allocated = dm_bufio_current_allocated;
 
-	spin_unlock(&param_spinlock);
+	if (!unlink) {
+		list_add(&b->global_list, &global_queue);
+	} else {
+		list_del(&b->global_list);
+	}
+
+	spin_unlock(&global_spinlock);
 }
 
 /*

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
