Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C416FB0A93
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 10:47:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B80948665A;
	Thu, 12 Sep 2019 08:47:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88DAE5DA5B;
	Thu, 12 Sep 2019 08:47:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D1194A486;
	Thu, 12 Sep 2019 08:47:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8C8jw2j027327 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 04:45:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91FE6608AB; Thu, 12 Sep 2019 08:45:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2631D60872;
	Thu, 12 Sep 2019 08:45:57 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1i8Kji-00035n-Mb; Thu, 12 Sep 2019 10:45:55 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Thu, 12 Sep 2019 10:45:50 +0200
Message-Id: <20190912084550.401229120@debian-a64.vm>
User-Agent: quilt/0.65
Date: Thu, 12 Sep 2019 10:44:48 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Martijn Coenen <maco@android.com>, Mike Snitzer <msnitzer@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-bufio-global-cleanup.patch
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dariofreni@google.com, jiyong@google.com, dm-devel@redhat.com,
	maco@google.com, Mikulas Patocka <mpatocka@redhat.com>,
	kernel-team@android.com
Subject: [dm-devel] [PATCH 5/5] dm-bufio: introduce a global cache
	replacement
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 12 Sep 2019 08:47:11 +0000 (UTC)

This patch introduces a global cache replacement (instead of per-client
cleanup).

If one bufio client uses the cache heavily and another client is not using
it, we want to let the first client use most of the cache. The old
algorithm would partition the cache equally betwen the clients and that is
inoptimal.

For cache replacement, we use the clock algorithm because it doesn't
require taking any lock when the buffer is accessed.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c |  103 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 96 insertions(+), 7 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2019-09-11 20:32:15.000000000 +0200
+++ linux-2.6/drivers/md/dm-bufio.c	2019-09-12 10:23:57.000000000 +0200
@@ -34,6 +34,7 @@
 #define DM_BUFIO_MEMORY_PERCENT		2
 #define DM_BUFIO_VMALLOC_PERCENT	25
 #define DM_BUFIO_WRITEBACK_RATIO	3
+#define DM_BUFIO_LOW_WATERMARK		16
 
 /*
  * Check buffer ages in this interval (seconds)
@@ -140,6 +141,7 @@ struct dm_buffer {
 	unsigned char list_mode;		/* LIST_* */
 	blk_status_t read_error;
 	blk_status_t write_error;
+	unsigned accessed;
 	unsigned hold_count;
 	unsigned long state;
 	unsigned long last_accessed;
@@ -198,6 +200,8 @@ static DEFINE_SPINLOCK(global_spinlock);
 
 static LIST_HEAD(global_queue);
 
+static unsigned long global_num = 0;
+
 /*
  * Buffers are freed after this timeout
  */
@@ -227,6 +231,12 @@ static LIST_HEAD(dm_bufio_all_clients);
  */
 static DEFINE_MUTEX(dm_bufio_clients_lock);
 
+
+static struct workqueue_struct *dm_bufio_wq;
+static struct delayed_work dm_bufio_cleanup_old_work;
+static struct work_struct dm_bufio_replacement_work;
+
+
 #ifdef CONFIG_DM_DEBUG_BLOCK_STACK_TRACING
 static void buffer_record_stack(struct dm_buffer *b)
 {
@@ -308,10 +318,16 @@ static void adjust_total_allocated(struc
 	if (dm_bufio_current_allocated > dm_bufio_peak_allocated)
 		dm_bufio_peak_allocated = dm_bufio_current_allocated;
 
+	b->accessed = 1;
+
 	if (!unlink) {
 		list_add(&b->global_list, &global_queue);
+		global_num++;
+		if (dm_bufio_current_allocated > dm_bufio_cache_size)
+			queue_work(dm_bufio_wq, &dm_bufio_replacement_work);
 	} else {
 		list_del(&b->global_list);
+		global_num--;
 	}
 
 	spin_unlock(&global_spinlock);
@@ -497,6 +513,8 @@ static void __relink_lru(struct dm_buffe
 {
 	struct dm_bufio_client *c = b->c;
 
+	b->accessed = 1;
+
 	BUG_ON(!c->n_buffers[b->list_mode]);
 
 	c->n_buffers[b->list_mode]--;
@@ -1814,6 +1832,78 @@ static void __evict_old_buffers(struct d
 	dm_bufio_unlock(c);
 }
 
+static void do_global_cleanup(struct work_struct *w)
+{
+	struct dm_bufio_client *locked_client = NULL;
+	struct dm_bufio_client *current_client;
+	struct dm_buffer *b;
+	unsigned spinlock_hold_count;
+	unsigned long threshold = dm_bufio_cache_size - dm_bufio_cache_size / DM_BUFIO_LOW_WATERMARK;
+	unsigned long loops = global_num * 2;
+
+	mutex_lock(&dm_bufio_clients_lock);
+
+reacquire_spinlock:
+	cond_resched();
+
+	spin_lock(&global_spinlock);
+	if (unlikely(dm_bufio_current_allocated <= threshold))
+		goto exit;
+
+	spinlock_hold_count = 0;
+get_next:
+	if (!loops--)
+		goto exit;
+	if (unlikely(list_empty(&global_queue)))
+		goto exit;
+	b = list_entry(global_queue.prev, struct dm_buffer, global_list);
+
+	if (b->accessed) {
+		b->accessed = 0;
+		list_del(&b->global_list);
+		list_add(&b->global_list, &global_queue);
+		if (likely(++spinlock_hold_count < 16)) {
+			goto get_next;
+		}
+		spin_unlock(&global_spinlock);
+		goto reacquire_spinlock;
+	}
+
+	current_client = b->c;
+	if (unlikely(current_client != locked_client)) {
+		if (locked_client)
+			dm_bufio_unlock(locked_client);
+
+		if (!dm_bufio_trylock(current_client)) {
+			spin_unlock(&global_spinlock);
+			dm_bufio_lock(current_client);
+			locked_client = current_client;
+			goto reacquire_spinlock;
+		}
+
+		locked_client = current_client;
+	}
+
+	spin_unlock(&global_spinlock);
+
+	if (unlikely(!__try_evict_buffer(b, GFP_KERNEL))) {
+		spin_lock(&global_spinlock);
+		list_del(&b->global_list);
+		list_add(&b->global_list, &global_queue);
+		spin_unlock(&global_spinlock);
+	}
+
+	goto reacquire_spinlock;
+
+exit:
+	spin_unlock(&global_spinlock);
+
+	if (locked_client)
+		dm_bufio_unlock(locked_client);
+
+	mutex_unlock(&dm_bufio_clients_lock);
+}
+
 static void cleanup_old_buffers(void)
 {
 	unsigned long max_age_hz = get_max_age_hz();
@@ -1829,14 +1919,11 @@ static void cleanup_old_buffers(void)
 	mutex_unlock(&dm_bufio_clients_lock);
 }
 
-static struct workqueue_struct *dm_bufio_wq;
-static struct delayed_work dm_bufio_work;
-
 static void work_fn(struct work_struct *w)
 {
 	cleanup_old_buffers();
 
-	queue_delayed_work(dm_bufio_wq, &dm_bufio_work,
+	queue_delayed_work(dm_bufio_wq, &dm_bufio_cleanup_old_work,
 			   DM_BUFIO_WORK_TIMER_SECS * HZ);
 }
 
@@ -1878,8 +1965,9 @@ static int __init dm_bufio_init(void)
 	if (!dm_bufio_wq)
 		return -ENOMEM;
 
-	INIT_DELAYED_WORK(&dm_bufio_work, work_fn);
-	queue_delayed_work(dm_bufio_wq, &dm_bufio_work,
+	INIT_DELAYED_WORK(&dm_bufio_cleanup_old_work, work_fn);
+	INIT_WORK(&dm_bufio_replacement_work, do_global_cleanup);
+	queue_delayed_work(dm_bufio_wq, &dm_bufio_cleanup_old_work,
 			   DM_BUFIO_WORK_TIMER_SECS * HZ);
 
 	return 0;
@@ -1892,7 +1980,8 @@ static void __exit dm_bufio_exit(void)
 {
 	int bug = 0;
 
-	cancel_delayed_work_sync(&dm_bufio_work);
+	cancel_delayed_work_sync(&dm_bufio_cleanup_old_work);
+	flush_workqueue(dm_bufio_wq);
 	destroy_workqueue(dm_bufio_wq);
 
 	if (dm_bufio_client_count) {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
