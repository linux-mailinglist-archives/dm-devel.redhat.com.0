Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 96E6D1E3908
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 08:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590560597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AKr6z+0BIQFycE54EO/q4Geheh7C4MG3qQrNln/PUco=;
	b=B2CONHPlGxEVz11l2kthUnjqhp8u1hy9K1jiJfp0TvJYegSSpd9YsXYu1VD6F1As9ikpmk
	DiBHGy7qLlsKllnPkQQ+gWNPEZSUcVH3AZSiiOosR9AsQkkaTcLCmFe9wDa8158TrXw4E+
	uQgrxb3vrwC8S6yJ6bt5Iddv+jwcOHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-g-b0yxpqMAanZ2drTTxH0w-1; Wed, 27 May 2020 02:23:14 -0400
X-MC-Unique: g-b0yxpqMAanZ2drTTxH0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 556A71085985;
	Wed, 27 May 2020 06:23:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A84B7A1E1;
	Wed, 27 May 2020 06:23:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C38166B4D5;
	Wed, 27 May 2020 06:23:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R6Mq3J015783 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 02:22:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D55FAF799; Wed, 27 May 2020 06:22:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77805AF9AB
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47B008007D9
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:51 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-51-xMbXUxqiPJ-xUMyMcP0Rcw-1;
	Wed, 27 May 2020 02:22:46 -0400
X-MC-Unique: xMbXUxqiPJ-xUMyMcP0Rcw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E03A4B30A;
	Wed, 27 May 2020 06:22:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 27 May 2020 08:22:20 +0200
Message-Id: <20200527062225.72849-11-hare@suse.de>
In-Reply-To: <20200527062225.72849-1-hare@suse.de>
References: <20200527062225.72849-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 10/15] dm-zoned: per-device reclaim
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of having one reclaim workqueue for the entire set we should
be allocating a reclaim workqueue per device; that will reduce
contention and should boost performance for a multi-device setup.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-reclaim.c | 66 +++++++++++++++++++++++++++----------------
 drivers/md/dm-zoned-target.c  | 39 +++++++++++++++----------
 drivers/md/dm-zoned.h         | 38 +++++++++++++------------
 3 files changed, 86 insertions(+), 57 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index e9e3b730e258..09843645248a 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -21,6 +21,8 @@ struct dmz_reclaim {
 	struct dm_kcopyd_throttle kc_throttle;
 	int			kc_err;
 
+	int			dev_idx;
+
 	unsigned long		flags;
 
 	/* Last target access time */
@@ -198,8 +200,8 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	struct dmz_metadata *zmd = zrc->metadata;
 	int ret;
 
-	DMDEBUG("(%s): Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
-		dmz_metadata_label(zmd),
+	DMDEBUG("(%s/%u): Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
+		dmz_metadata_label(zmd), zrc->dev_idx,
 		dzone->chunk, bzone->id, dmz_weight(bzone),
 		dzone->id, dmz_weight(dzone));
 
@@ -237,8 +239,8 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	struct dmz_metadata *zmd = zrc->metadata;
 	int ret = 0;
 
-	DMDEBUG("(%s): Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
-		dmz_metadata_label(zmd),
+	DMDEBUG("(%s/%u): Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
+		dmz_metadata_label(zmd), zrc->dev_idx,
 		chunk, dzone->id, dmz_weight(dzone),
 		bzone->id, dmz_weight(bzone));
 
@@ -295,8 +297,8 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	if (!szone)
 		return -ENOSPC;
 
-	DMDEBUG("(%s): Chunk %u, move %s zone %u (weight %u) to %s zone %u",
-		dmz_metadata_label(zmd), chunk,
+	DMDEBUG("(%s/%u): Chunk %u, move %s zone %u (weight %u) to %s zone %u",
+		dmz_metadata_label(zmd), zrc->dev_idx, chunk,
 		dmz_is_cache(dzone) ? "cache" : "rnd",
 		dzone->id, dmz_weight(dzone),
 		dmz_is_rnd(szone) ? "rnd" : "seq", szone->id);
@@ -369,8 +371,8 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 	/* Get a data zone */
 	dzone = dmz_get_zone_for_reclaim(zmd, dmz_target_idle(zrc));
 	if (!dzone) {
-		DMDEBUG("(%s): No zone found to reclaim",
-			dmz_metadata_label(zmd));
+		DMDEBUG("(%s/%u): No zone found to reclaim",
+			dmz_metadata_label(zmd), zrc->dev_idx);
 		return -EBUSY;
 	}
 
@@ -417,24 +419,26 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 out:
 	if (ret) {
 		if (ret == -EINTR)
-			DMDEBUG("(%s): reclaim zone %u interrupted",
-				dmz_metadata_label(zmd), rzone->id);
+			DMDEBUG("(%s/%u): reclaim zone %u interrupted",
+				dmz_metadata_label(zmd), zrc->dev_idx,
+				rzone->id);
 		else
-			DMDEBUG("(%s): Failed to reclaim zone %u, err %d",
-				dmz_metadata_label(zmd), rzone->id, ret);
+			DMDEBUG("(%s/%u): Failed to reclaim zone %u, err %d",
+				dmz_metadata_label(zmd), zrc->dev_idx,
+				rzone->id, ret);
 		dmz_unlock_zone_reclaim(dzone);
 		return ret;
 	}
 
 	ret = dmz_flush_metadata(zrc->metadata);
 	if (ret) {
-		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d",
-			dmz_metadata_label(zmd), rzone->id, ret);
+		DMDEBUG("(%s/%u): Metadata flush for zone %u failed, err %d",
+			dmz_metadata_label(zmd), zrc->dev_idx, rzone->id, ret);
 		return ret;
 	}
 
-	DMDEBUG("(%s): Reclaimed zone %u in %u ms",
-		dmz_metadata_label(zmd),
+	DMDEBUG("(%s/%u): Reclaimed zone %u in %u ms",
+		dmz_metadata_label(zmd), zrc->dev_idx,
 		rzone->id, jiffies_to_msecs(jiffies - start));
 	return 0;
 }
@@ -461,10 +465,20 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
  */
 static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
 {
-	unsigned int nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);
+	unsigned int nr_reclaim;
+
+	nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);
 
-	if (dmz_nr_cache_zones(zrc->metadata))
+	if (dmz_nr_cache_zones(zrc->metadata)) {
+		/*
+		 * The first device in a multi-device
+		 * setup only contains cache zones, so
+		 * never start reclaim there.
+		 */
+		if (zrc->dev_idx == 0)
+			return false;
 		nr_reclaim += dmz_nr_cache_zones(zrc->metadata);
+	}
 
 	/* Reclaim when idle */
 	if (dmz_target_idle(zrc) && nr_reclaim)
@@ -488,7 +502,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 {
 	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
 	struct dmz_metadata *zmd = zrc->metadata;
-	unsigned int p_unmap;
+	unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
 	int ret;
 
 	if (dmz_dev_is_dying(zmd))
@@ -514,8 +528,11 @@ static void dmz_reclaim_work(struct work_struct *work)
 		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
 	}
 
-	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
-		dmz_metadata_label(zmd),
+	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd);
+	nr_rnd = dmz_nr_rnd_zones(zmd);
+
+	DMDEBUG("(%s/%u): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
+		dmz_metadata_label(zmd), zrc->dev_idx,
 		zrc->kc_throttle.throttle,
 		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
 		p_unmap, dmz_nr_unmap_cache_zones(zmd),
@@ -536,7 +553,7 @@ static void dmz_reclaim_work(struct work_struct *work)
  * Initialize reclaim.
  */
 int dmz_ctr_reclaim(struct dmz_metadata *zmd,
-		    struct dmz_reclaim **reclaim)
+		    struct dmz_reclaim **reclaim, int idx)
 {
 	struct dmz_reclaim *zrc;
 	int ret;
@@ -547,6 +564,7 @@ int dmz_ctr_reclaim(struct dmz_metadata *zmd,
 
 	zrc->metadata = zmd;
 	zrc->atime = jiffies;
+	zrc->dev_idx = idx;
 
 	/* Reclaim kcopyd client */
 	zrc->kc = dm_kcopyd_client_create(&zrc->kc_throttle);
@@ -558,8 +576,8 @@ int dmz_ctr_reclaim(struct dmz_metadata *zmd,
 
 	/* Reclaim work */
 	INIT_DELAYED_WORK(&zrc->work, dmz_reclaim_work);
-	zrc->wq = alloc_ordered_workqueue("dmz_rwq_%s", WQ_MEM_RECLAIM,
-					  dmz_metadata_label(zmd));
+	zrc->wq = alloc_ordered_workqueue("dmz_rwq_%s_%d", WQ_MEM_RECLAIM,
+					  dmz_metadata_label(zmd), idx);
 	if (!zrc->wq) {
 		ret = -ENOMEM;
 		goto err;
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index fec1b6a9c6f1..fc1df9714f63 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -51,9 +51,6 @@ struct dmz_target {
 	/* For metadata handling */
 	struct dmz_metadata     *metadata;
 
-	/* For reclaim */
-	struct dmz_reclaim	*reclaim;
-
 	/* For chunk work */
 	struct radix_tree_root	chunk_rxtree;
 	struct workqueue_struct *chunk_wq;
@@ -405,14 +402,15 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
 	struct dmz_metadata *zmd = dmz->metadata;
 	struct dm_zone *zone;
-	int ret;
+	int i, ret;
 
 	/*
 	 * Write may trigger a zone allocation. So make sure the
 	 * allocation can succeed.
 	 */
 	if (bio_op(bio) == REQ_OP_WRITE)
-		dmz_schedule_reclaim(dmz->reclaim);
+		for (i = 0; i < dmz->nr_ddevs; i++)
+			dmz_schedule_reclaim(dmz->dev[i].reclaim);
 
 	dmz_lock_metadata(zmd);
 
@@ -432,6 +430,7 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 	if (zone) {
 		dmz_activate_zone(zone);
 		bioctx->zone = zone;
+		dmz_reclaim_bio_acc(zone->dev->reclaim);
 	}
 
 	switch (bio_op(bio)) {
@@ -578,7 +577,6 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 
 	bio_list_add(&cw->bio_list, bio);
 
-	dmz_reclaim_bio_acc(dmz->reclaim);
 	if (queue_work(dmz->chunk_wq, &cw->work))
 		dmz_get_chunk_work(cw);
 out:
@@ -823,7 +821,7 @@ static int dmz_fixup_devices(struct dm_target *ti)
 static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 {
 	struct dmz_target *dmz;
-	int ret;
+	int ret, i;
 
 	/* Check arguments */
 	if (argc < 1 || argc > 2) {
@@ -925,10 +923,12 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	mod_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
 
 	/* Initialize reclaim */
-	ret = dmz_ctr_reclaim(dmz->metadata, &dmz->reclaim);
-	if (ret) {
-		ti->error = "Zone reclaim initialization failed";
-		goto err_fwq;
+	for (i = 0; i < dmz->nr_ddevs; i++) {
+		ret = dmz_ctr_reclaim(dmz->metadata, &dmz->dev[i].reclaim, i);
+		if (ret) {
+			ti->error = "Zone reclaim initialization failed";
+			goto err_fwq;
+		}
 	}
 
 	DMINFO("(%s): Target device: %llu 512-byte logical sectors (%llu blocks)",
@@ -961,11 +961,13 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 static void dmz_dtr(struct dm_target *ti)
 {
 	struct dmz_target *dmz = ti->private;
+	int i;
 
 	flush_workqueue(dmz->chunk_wq);
 	destroy_workqueue(dmz->chunk_wq);
 
-	dmz_dtr_reclaim(dmz->reclaim);
+	for (i = 0; i < dmz->nr_ddevs; i++)
+		dmz_dtr_reclaim(dmz->dev[i].reclaim);
 
 	cancel_delayed_work_sync(&dmz->flush_work);
 	destroy_workqueue(dmz->flush_wq);
@@ -1034,9 +1036,11 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
 static void dmz_suspend(struct dm_target *ti)
 {
 	struct dmz_target *dmz = ti->private;
+	int i;
 
 	flush_workqueue(dmz->chunk_wq);
-	dmz_suspend_reclaim(dmz->reclaim);
+	for (i = 0; i < dmz->nr_ddevs; i++)
+		dmz_suspend_reclaim(dmz->dev[i].reclaim);
 	cancel_delayed_work_sync(&dmz->flush_work);
 }
 
@@ -1046,9 +1050,11 @@ static void dmz_suspend(struct dm_target *ti)
 static void dmz_resume(struct dm_target *ti)
 {
 	struct dmz_target *dmz = ti->private;
+	int i;
 
 	queue_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
-	dmz_resume_reclaim(dmz->reclaim);
+	for (i = 0; i < dmz->nr_ddevs; i++)
+		dmz_resume_reclaim(dmz->dev[i].reclaim);
 }
 
 static int dmz_iterate_devices(struct dm_target *ti,
@@ -1109,7 +1115,10 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
 	int r = -EINVAL;
 
 	if (!strcasecmp(argv[0], "reclaim")) {
-		dmz_schedule_reclaim(dmz->reclaim);
+		int i;
+
+		for (i = 0; i < dmz->nr_ddevs; i++)
+			dmz_schedule_reclaim(dmz->dev[i].reclaim);
 		r = 0;
 	} else
 		DMERR("unrecognized message %s", argv[0]);
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 983f5b5e9fa0..0cc3459f78ce 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -54,6 +54,7 @@ struct dmz_reclaim;
 struct dmz_dev {
 	struct block_device	*bdev;
 	struct dmz_metadata	*metadata;
+	struct dmz_reclaim	*reclaim;
 
 	char			name[BDEVNAME_SIZE];
 	uuid_t			uuid;
@@ -229,23 +230,6 @@ static inline void dmz_activate_zone(struct dm_zone *zone)
 	atomic_inc(&zone->refcount);
 }
 
-/*
- * Deactivate a zone. This decrement the zone reference counter
- * indicating that all BIOs to the zone have completed when the count is 0.
- */
-static inline void dmz_deactivate_zone(struct dm_zone *zone)
-{
-	atomic_dec(&zone->refcount);
-}
-
-/*
- * Test if a zone is active, that is, has a refcount > 0.
- */
-static inline bool dmz_is_active(struct dm_zone *zone)
-{
-	return atomic_read(&zone->refcount);
-}
-
 int dmz_lock_zone_reclaim(struct dm_zone *zone);
 void dmz_unlock_zone_reclaim(struct dm_zone *zone);
 struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle);
@@ -272,7 +256,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
 /*
  * Functions defined in dm-zoned-reclaim.c
  */
-int dmz_ctr_reclaim(struct dmz_metadata *zmd, struct dmz_reclaim **zrc);
+int dmz_ctr_reclaim(struct dmz_metadata *zmd, struct dmz_reclaim **zrc, int idx);
 void dmz_dtr_reclaim(struct dmz_reclaim *zrc);
 void dmz_suspend_reclaim(struct dmz_reclaim *zrc);
 void dmz_resume_reclaim(struct dmz_reclaim *zrc);
@@ -285,4 +269,22 @@ void dmz_schedule_reclaim(struct dmz_reclaim *zrc);
 bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev);
 bool dmz_check_bdev(struct dmz_dev *dmz_dev);
 
+/*
+ * Deactivate a zone. This decrement the zone reference counter
+ * indicating that all BIOs to the zone have completed when the count is 0.
+ */
+static inline void dmz_deactivate_zone(struct dm_zone *zone)
+{
+	dmz_reclaim_bio_acc(zone->dev->reclaim);
+	atomic_dec(&zone->refcount);
+}
+
+/*
+ * Test if a zone is active, that is, has a refcount > 0.
+ */
+static inline bool dmz_is_active(struct dm_zone *zone)
+{
+	return atomic_read(&zone->refcount);
+}
+
 #endif /* DM_ZONED_H */
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

