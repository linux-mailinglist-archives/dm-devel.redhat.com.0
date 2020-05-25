Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5966F1E0DB0
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 13:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590407275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9e04ctirwJl0INMz4Wy0xoualHzRkDnoTFMUP2EvYUY=;
	b=QnMp1Fqez1hkdfNJYRekrHhOpBEoHFJAA7dfAOm782YfYLh9c6wutw9u1IWYxXk+dLQguc
	kc17+MId3z0jreVEj90Zg5fifuxmAOmMIq58xvtjpoigwBxlmbUOeU1b+pOFLizpaMQtIy
	PR7y4jVIIqmiByLAD+wLbnnwR7WPsRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-SQyke5xsP3WXJ3zzibCx9g-1; Mon, 25 May 2020 07:47:53 -0400
X-MC-Unique: SQyke5xsP3WXJ3zzibCx9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF18B474;
	Mon, 25 May 2020 11:47:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF57379C2C;
	Mon, 25 May 2020 11:47:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E0BB180954D;
	Mon, 25 May 2020 11:47:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04PBljse006815 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 07:47:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E67032026DFD; Mon, 25 May 2020 11:47:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D93C22026D67
	for <dm-devel@redhat.com>; Mon, 25 May 2020 11:47:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54FDA101A526
	for <dm-devel@redhat.com>; Mon, 25 May 2020 11:47:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-455-sk3o8MtaPdmMyQuYELE7IQ-1; Mon, 25 May 2020 07:47:41 -0400
X-MC-Unique: sk3o8MtaPdmMyQuYELE7IQ-1
Received: from [2001:4bb8:18c:5da7:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdBJh-0002VT-Kp; Mon, 25 May 2020 11:30:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 25 May 2020 13:30:09 +0200
Message-Id: <20200525113014.345997-12-hch@lst.de>
In-Reply-To: <20200525113014.345997-1-hch@lst.de>
References: <20200525113014.345997-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	Nitin Gupta <ngupta@vflare.org>
Subject: [dm-devel] [PATCH 11/16] block: always use a percpu variable for
	disk stats
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

percpu variables have a perfectly fine working stub implementation
for UP kernels, so use that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk.h               |  2 +-
 block/genhd.c             | 12 +++------
 block/partitions/core.c   |  5 ++--
 include/linux/genhd.h     | 13 ---------
 include/linux/part_stat.h | 55 ++++++++-------------------------------
 5 files changed, 18 insertions(+), 69 deletions(-)

diff --git a/block/blk.h b/block/blk.h
index bdf5e94467aa2..0ecba2ab383d6 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -378,7 +378,7 @@ static inline void hd_struct_put(struct hd_struct *part)
 
 static inline void hd_free_part(struct hd_struct *part)
 {
-	free_part_stats(part);
+	free_percpu(part->dkstats);
 	kfree(part->info);
 	percpu_ref_exit(&part->ref);
 }
diff --git a/block/genhd.c b/block/genhd.c
index 094ed90964964..3e7df0a3e6bb0 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -92,7 +92,6 @@ const char *bdevname(struct block_device *bdev, char *buf)
 }
 EXPORT_SYMBOL(bdevname);
 
-#ifdef CONFIG_SMP
 static void part_stat_read_all(struct hd_struct *part, struct disk_stats *stat)
 {
 	int cpu;
@@ -112,12 +111,6 @@ static void part_stat_read_all(struct hd_struct *part, struct disk_stats *stat)
 		stat->io_ticks += ptr->io_ticks;
 	}
 }
-#else /* CONFIG_SMP */
-static void part_stat_read_all(struct hd_struct *part, struct disk_stats *stat)
-{
-	memcpy(stat, &part->dkstats, sizeof(struct disk_stats));
-}
-#endif /* CONFIG_SMP */
 
 static unsigned int part_in_flight(struct request_queue *q,
 		struct hd_struct *part)
@@ -1688,14 +1681,15 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
 
 	disk = kzalloc_node(sizeof(struct gendisk), GFP_KERNEL, node_id);
 	if (disk) {
-		if (!init_part_stats(&disk->part0)) {
+		disk->part0.dkstats = alloc_percpu(struct disk_stats);
+		if (!disk->part0.dkstats) {
 			kfree(disk);
 			return NULL;
 		}
 		init_rwsem(&disk->lookup_sem);
 		disk->node_id = node_id;
 		if (disk_expand_part_tbl(disk, 0)) {
-			free_part_stats(&disk->part0);
+			free_percpu(disk->part0.dkstats);
 			kfree(disk);
 			return NULL;
 		}
diff --git a/block/partitions/core.c b/block/partitions/core.c
index 297004fd22648..78951e33b2d7c 100644
--- a/block/partitions/core.c
+++ b/block/partitions/core.c
@@ -387,7 +387,8 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	if (!p)
 		return ERR_PTR(-EBUSY);
 
-	if (!init_part_stats(p)) {
+	p->dkstats = alloc_percpu(struct disk_stats);
+	if (!p->dkstats) {
 		err = -ENOMEM;
 		goto out_free;
 	}
@@ -468,7 +469,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
 out_free_info:
 	kfree(p->info);
 out_free_stats:
-	free_part_stats(p);
+	free_percpu(p->dkstats);
 out_free:
 	kfree(p);
 	return ERR_PTR(err);
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index a9384449465a3..f0d6d77309a54 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -39,15 +39,6 @@ extern struct class block_class;
 #include <linux/fs.h>
 #include <linux/workqueue.h>
 
-struct disk_stats {
-	u64 nsecs[NR_STAT_GROUPS];
-	unsigned long sectors[NR_STAT_GROUPS];
-	unsigned long ios[NR_STAT_GROUPS];
-	unsigned long merges[NR_STAT_GROUPS];
-	unsigned long io_ticks;
-	local_t in_flight[2];
-};
-
 #define PARTITION_META_INFO_VOLNAMELTH	64
 /*
  * Enough for the string representation of any kind of UUID plus NULL.
@@ -72,11 +63,7 @@ struct hd_struct {
 	seqcount_t nr_sects_seq;
 #endif
 	unsigned long stamp;
-#ifdef	CONFIG_SMP
 	struct disk_stats __percpu *dkstats;
-#else
-	struct disk_stats dkstats;
-#endif
 	struct percpu_ref ref;
 
 	sector_t alignment_offset;
diff --git a/include/linux/part_stat.h b/include/linux/part_stat.h
index ece607607a864..6644197980b92 100644
--- a/include/linux/part_stat.h
+++ b/include/linux/part_stat.h
@@ -4,19 +4,23 @@
 
 #include <linux/genhd.h>
 
+struct disk_stats {
+	u64 nsecs[NR_STAT_GROUPS];
+	unsigned long sectors[NR_STAT_GROUPS];
+	unsigned long ios[NR_STAT_GROUPS];
+	unsigned long merges[NR_STAT_GROUPS];
+	unsigned long io_ticks;
+	local_t in_flight[2];
+};
+
 /*
  * Macros to operate on percpu disk statistics:
  *
- * {disk|part|all}_stat_{add|sub|inc|dec}() modify the stat counters
- * and should be called between disk_stat_lock() and
- * disk_stat_unlock().
+ * {disk|part|all}_stat_{add|sub|inc|dec}() modify the stat counters and should
+ * be called between disk_stat_lock() and disk_stat_unlock().
  *
  * part_stat_read() can be called at any time.
- *
- * part_stat_{add|set_all}() and {init|free}_part_stats are for
- * internal use only.
  */
-#ifdef	CONFIG_SMP
 #define part_stat_lock()	({ rcu_read_lock(); get_cpu(); })
 #define part_stat_unlock()	do { put_cpu(); rcu_read_unlock(); } while (0)
 
@@ -44,43 +48,6 @@ static inline void part_stat_set_all(struct hd_struct *part, int value)
 				sizeof(struct disk_stats));
 }
 
-static inline int init_part_stats(struct hd_struct *part)
-{
-	part->dkstats = alloc_percpu(struct disk_stats);
-	if (!part->dkstats)
-		return 0;
-	return 1;
-}
-
-static inline void free_part_stats(struct hd_struct *part)
-{
-	free_percpu(part->dkstats);
-}
-
-#else /* !CONFIG_SMP */
-#define part_stat_lock()	({ rcu_read_lock(); 0; })
-#define part_stat_unlock()	rcu_read_unlock()
-
-#define part_stat_get(part, field)		((part)->dkstats.field)
-#define part_stat_get_cpu(part, field, cpu)	part_stat_get(part, field)
-#define part_stat_read(part, field)		part_stat_get(part, field)
-
-static inline void part_stat_set_all(struct hd_struct *part, int value)
-{
-	memset(&part->dkstats, value, sizeof(struct disk_stats));
-}
-
-static inline int init_part_stats(struct hd_struct *part)
-{
-	return 1;
-}
-
-static inline void free_part_stats(struct hd_struct *part)
-{
-}
-
-#endif /* CONFIG_SMP */
-
 #define part_stat_read_accum(part, field)				\
 	(part_stat_read(part, field[STAT_READ]) +			\
 	 part_stat_read(part, field[STAT_WRITE]) +			\
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

