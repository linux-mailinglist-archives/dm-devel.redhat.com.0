Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 18AAF307C2C
	for <lists+dm-devel@lfdr.de>; Thu, 28 Jan 2021 18:24:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-do2Ja_EWPuyYEy0PsV-Pkg-1; Thu, 28 Jan 2021 12:23:58 -0500
X-MC-Unique: do2Ja_EWPuyYEy0PsV-Pkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C483107ACE4;
	Thu, 28 Jan 2021 17:23:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C87C5C1BB;
	Thu, 28 Jan 2021 17:23:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AD881809C9F;
	Thu, 28 Jan 2021 17:23:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SHNSOW014687 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 12:23:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6F652026D76; Thu, 28 Jan 2021 17:23:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBB3F2026D39
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 17:23:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EE3C187504C
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 17:23:22 +0000 (UTC)
Received: from mx2.veeam.com (mx2.veeam.com [64.129.123.6]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-599-K2BUTRYLPFSP3bq4oX4kcA-1;
	Thu, 28 Jan 2021 12:23:20 -0500
X-MC-Unique: K2BUTRYLPFSP3bq4oX4kcA-1
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.veeam.com (Postfix) with ESMTPS id 6056541278;
	Thu, 28 Jan 2021 12:12:52 -0500 (EST)
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
	prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.721.2; Thu, 28 Jan 2021 18:12:51 +0100
From: Sergei Shtepa <sergei.shtepa@veeam.com>
To: <hare@suse.de>, <ming.lei@redhat.com>, <agk@redhat.com>,
	<snitzer@redhat.com>, <dm-devel@redhat.com>, <linux-block@vger.kernel.org>
Date: Thu, 28 Jan 2021 20:12:34 +0300
Message-ID: <1611853955-32167-2-git-send-email-sergei.shtepa@veeam.com>
In-Reply-To: <1611853955-32167-1-git-send-email-sergei.shtepa@veeam.com>
References: <1611853955-32167-1-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx01.amust.local (172.24.0.171) To prgmbx01.amust.local
	(172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D265677D6B
X-Veeam-MMEX: True
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: pavel.tide@veeam.com, sergei.shtepa@veeam.com
Subject: [dm-devel] [PATCH 1/2] block: blk_interposer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The block layer interposer allows to intercept bio requests.
This allows to connect device mapper and other kernel modules
to the block device stack on the fly.

changes:
  * new BIO_INTERPOSED bio flag.
  * new function __submit_bio_interposed() implements the interposers
    logic.
  * new function blk_mq_is_queue_frozen() allow to assert that
    the queue is frozen.
  * functions blk_interposer_attach() and blk_interposer_detach()
    allow to attach and detach interposers.
Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>
---
 block/bio.c               |  2 +
 block/blk-core.c          | 29 ++++++++++++++
 block/blk-mq.c            | 13 +++++++
 block/genhd.c             | 82 +++++++++++++++++++++++++++++++++++++++
 include/linux/blk-mq.h    |  1 +
 include/linux/blk_types.h |  6 ++-
 include/linux/genhd.h     | 19 +++++++++
 7 files changed, 150 insertions(+), 2 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 1f2cc1fbe283..f6f135eb84b5 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -684,6 +684,8 @@ void __bio_clone_fast(struct bio *bio, struct bio *bio_src)
 	bio_set_flag(bio, BIO_CLONED);
 	if (bio_flagged(bio_src, BIO_THROTTLED))
 		bio_set_flag(bio, BIO_THROTTLED);
+	if (bio_flagged(bio_src, BIO_INTERPOSED))
+		bio_set_flag(bio, BIO_INTERPOSED);
 	bio->bi_opf = bio_src->bi_opf;
 	bio->bi_ioprio = bio_src->bi_ioprio;
 	bio->bi_write_hint = bio_src->bi_write_hint;
diff --git a/block/blk-core.c b/block/blk-core.c
index 7663a9b94b80..07ec82d8fe57 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1032,6 +1032,32 @@ static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
 	return ret;
 }
 
+static blk_qc_t __submit_bio_interposed(struct bio *bio)
+{
+	struct bio_list bio_list[2] = { };
+	blk_qc_t ret = BLK_QC_T_NONE;
+
+	current->bio_list = bio_list;
+	if (likely(bio_queue_enter(bio) == 0)) {
+		struct gendisk *disk = bio->bi_disk;
+
+		bio_set_flag(bio, BIO_INTERPOSED);
+		if (likely(blk_has_interposer(disk)))
+			disk->interposer->ip_submit_bio(bio);
+		else /* interposer was removed */
+			bio_list_add(&current->bio_list[0], bio);
+
+		blk_queue_exit(disk->queue);
+	}
+	current->bio_list = NULL;
+
+	/* Resubmit remaining bios */
+	while ((bio = bio_list_pop(&bio_list[0])))
+		ret = submit_bio_noacct(bio);
+
+	return ret;
+}
+
 /**
  * submit_bio_noacct - re-submit a bio to the block device layer for I/O
  * @bio:  The bio describing the location in memory and on the device.
@@ -1057,6 +1083,9 @@ blk_qc_t submit_bio_noacct(struct bio *bio)
 		return BLK_QC_T_NONE;
 	}
 
+	if (blk_has_interposer(bio->bi_disk) &&
+	    !bio_flagged(bio, BIO_INTERPOSED))
+		return __submit_bio_interposed(bio);
 	if (!bio->bi_disk->fops->submit_bio)
 		return __submit_bio_noacct_mq(bio);
 	return __submit_bio_noacct(bio);
diff --git a/block/blk-mq.c b/block/blk-mq.c
index f285a9123a8b..924ec26fae5f 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -161,6 +161,19 @@ int blk_mq_freeze_queue_wait_timeout(struct request_queue *q,
 }
 EXPORT_SYMBOL_GPL(blk_mq_freeze_queue_wait_timeout);
 
+
+bool blk_mq_is_queue_frozen(struct request_queue *q)
+{
+	bool ret;
+
+	mutex_lock(&q->mq_freeze_lock);
+	ret = percpu_ref_is_dying(&q->q_usage_counter) && percpu_ref_is_zero(&q->q_usage_counter);
+	mutex_unlock(&q->mq_freeze_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(blk_mq_is_queue_frozen);
+
 /*
  * Guarantee no request is in use, so we can change any data structure of
  * the queue afterward.
diff --git a/block/genhd.c b/block/genhd.c
index 419548e92d82..d3459582f56c 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -30,6 +30,7 @@
 static struct kobject *block_depr;
 
 DECLARE_RWSEM(bdev_lookup_sem);
+DEFINE_MUTEX(bdev_interposer_mutex);
 
 /* for extended dynamic devt allocation, currently only one major is used */
 #define NR_EXT_DEVT		(1 << MINORBITS)
@@ -2148,3 +2149,84 @@ static void disk_release_events(struct gendisk *disk)
 	WARN_ON_ONCE(disk->ev && disk->ev->block != 1);
 	kfree(disk->ev);
 }
+
+/**
+ * blk_interposer_attach - Attach interposer to disk
+ * @disk: target disk
+ * @interposer: block device interposer
+ * @ip_submit_bio: hook for submit_bio()
+ *
+ * Returns:
+ *     -EINVAL if @interposer is NULL.
+ *     -EPERM if queue is not frozen.
+ *     -EBUSY if the block device already has @interposer.
+ *     -EALREADY if the block device already has @interposer with same callback.
+ *
+ * Disk must be frozen by blk_mq_freeze_queue().
+ */
+int blk_interposer_attach(struct gendisk *disk, struct blk_interposer *interposer,
+			  const ip_submit_bio_t ip_submit_bio)
+{
+	int ret = 0;
+
+	if (!interposer)
+		return -EINVAL;
+
+	if (!blk_mq_is_queue_frozen(disk->queue))
+		return -EPERM;
+
+	mutex_lock(&bdev_interposer_mutex);
+	if (blk_has_interposer(disk)) {
+		if (disk->interposer->ip_submit_bio == ip_submit_bio)
+			ret = -EALREADY;
+		else
+			ret = -EBUSY;
+		goto out;
+	}
+
+	interposer->ip_submit_bio = ip_submit_bio;
+	interposer->disk = disk;
+
+	disk->interposer = interposer;
+out:
+	mutex_unlock(&bdev_interposer_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(blk_interposer_attach);
+
+/**
+ * blk_interposer_detach - Detach interposer from disk
+ * @interposer: block device interposer
+ * @ip_submit_bio: hook for submit_bio()
+ *
+ * Disk must be frozen by blk_mq_freeze_queue().
+ */
+void blk_interposer_detach(struct blk_interposer *interposer,
+			  const ip_submit_bio_t ip_submit_bio)
+{
+	struct gendisk *disk;
+
+	if (WARN_ON(!interposer))
+		return;
+
+	mutex_lock(&bdev_interposer_mutex);
+
+	/* Check if the interposer is still active. */
+	disk = interposer->disk;
+	if (WARN_ON(!disk))
+		goto out;
+
+	if (WARN_ON(!blk_mq_is_queue_frozen(disk->queue)))
+		goto out;
+
+	/* Check if it is really our interposer. */
+	if (WARN_ON(disk->interposer->ip_submit_bio != ip_submit_bio))
+		goto out;
+
+	disk->interposer = NULL;
+	interposer->disk = NULL;
+out:
+	mutex_unlock(&bdev_interposer_mutex);
+}
+EXPORT_SYMBOL_GPL(blk_interposer_detach);
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index d705b174d346..9d1e8c4e922e 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -525,6 +525,7 @@ void blk_freeze_queue_start(struct request_queue *q);
 void blk_mq_freeze_queue_wait(struct request_queue *q);
 int blk_mq_freeze_queue_wait_timeout(struct request_queue *q,
 				     unsigned long timeout);
+bool blk_mq_is_queue_frozen(struct request_queue *q);
 
 int blk_mq_map_queues(struct blk_mq_queue_map *qmap);
 void blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set, int nr_hw_queues);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 866f74261b3b..6c1351d7b73f 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -227,7 +227,7 @@ struct bio {
 						 * top bits REQ_OP. Use
 						 * accessors.
 						 */
-	unsigned short		bi_flags;	/* status, etc and bvec pool number */
+	unsigned int		bi_flags;	/* status, etc and bvec pool number */
 	unsigned short		bi_ioprio;
 	unsigned short		bi_write_hint;
 	blk_status_t		bi_status;
@@ -304,6 +304,8 @@ enum {
 				 * of this bio. */
 	BIO_CGROUP_ACCT,	/* has been accounted to a cgroup */
 	BIO_TRACKED,		/* set if bio goes through the rq_qos path */
+	BIO_INTERPOSED,		/* bio has been interposed and can be moved to
+				 * a different disk */
 	BIO_FLAG_LAST
 };
 
@@ -322,7 +324,7 @@ enum {
  * freed.
  */
 #define BVEC_POOL_BITS		(3)
-#define BVEC_POOL_OFFSET	(16 - BVEC_POOL_BITS)
+#define BVEC_POOL_OFFSET	(32 - BVEC_POOL_BITS)
 #define BVEC_POOL_IDX(bio)	((bio)->bi_flags >> BVEC_POOL_OFFSET)
 #if (1<< BVEC_POOL_BITS) < (BVEC_POOL_NR+1)
 # error "BVEC_POOL_BITS is too small"
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 809aaa32d53c..8094af3a3db9 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -134,6 +134,14 @@ struct blk_integrity {
 	unsigned char				tag_size;
 };
 
+struct blk_interposer;
+typedef void (*ip_submit_bio_t) (struct bio *bio);
+
+struct blk_interposer {
+	ip_submit_bio_t ip_submit_bio;
+	struct gendisk *disk;
+};
+
 struct gendisk {
 	/* major, first_minor and minors are input parameters only,
 	 * don't use directly.  Use disk_devt() and disk_max_parts().
@@ -158,6 +166,7 @@ struct gendisk {
 
 	const struct block_device_operations *fops;
 	struct request_queue *queue;
+	struct blk_interposer *interposer;
 	void *private_data;
 
 	int flags;
@@ -346,4 +355,14 @@ static inline void printk_all_partitions(void)
 }
 #endif /* CONFIG_BLOCK */
 
+/*
+ * block layer interposer
+ */
+#define blk_has_interposer(d) ((d)->interposer != NULL)
+
+int blk_interposer_attach(struct gendisk *disk, struct blk_interposer *interposer,
+			  const ip_submit_bio_t ip_submit_bio);
+void blk_interposer_detach(struct blk_interposer *interposer,
+			   const ip_submit_bio_t ip_submit_bio);
+
 #endif /* _LINUX_GENHD_H */
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

