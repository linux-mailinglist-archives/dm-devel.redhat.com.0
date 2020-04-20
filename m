Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D99431B0649
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 12:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587377374;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4+f8H8PhEovhxLf1MUWYcsCTEk69AqtmBd44snACJZg=;
	b=EPVLAviXSLdT4DlU57g/F517NsbFXeEtQWJiwRWRut89Z178iUXTNdT6eM2BSFpVgkNjrb
	5OuphA751HCGkH0agbYKKEHZhmTrz1R78kq5jgJayOikBeGmSKvFmKvvc4JcJu7veKITMp
	a/LAzRGt+uBPhhP3JjXyhQcTxQQ9Hrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-SYz7UdacNKKvQKbCKJEz5w-1; Mon, 20 Apr 2020 06:09:27 -0400
X-MC-Unique: SYz7UdacNKKvQKbCKJEz5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0DC985EE71;
	Mon, 20 Apr 2020 10:09:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C19705DA76;
	Mon, 20 Apr 2020 10:09:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 417A9938F3;
	Mon, 20 Apr 2020 10:09:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KA8obA008212 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 06:08:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE2EB2166B29; Mon, 20 Apr 2020 10:08:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA8492166B27
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BA071017E43
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-196-R_8VvRKDO5uGQB4RBbauwA-1;
	Mon, 20 Apr 2020 06:08:46 -0400
X-MC-Unique: R_8VvRKDO5uGQB4RBbauwA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 24DD6AFC8;
	Mon, 20 Apr 2020 10:08:42 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 20 Apr 2020 12:08:17 +0200
Message-Id: <20200420100824.124618-7-hare@suse.de>
In-Reply-To: <20200420100824.124618-1-hare@suse.de>
References: <20200420100824.124618-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KA8obA008212
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 06/13] dm-zoned: introduce dmz_metadata_label()
	to format device name
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce dmz_metadata_label() to format the device-mapper device
name and use it instead of the device name of the underlying device.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
---
 drivers/md/dm-zoned-metadata.c | 11 ++++++-
 drivers/md/dm-zoned-reclaim.c  | 15 +++++----
 drivers/md/dm-zoned-target.c   | 74 +++++++++++++++++++++++-------------------
 drivers/md/dm-zoned.h          |  4 ++-
 4 files changed, 62 insertions(+), 42 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index b844ff02ae7b..7cda48683c0b 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -134,6 +134,8 @@ struct dmz_sb {
 struct dmz_metadata {
 	struct dmz_dev		*dev;
 
+	char			devname[BDEVNAME_SIZE];
+
 	sector_t		zone_bitmap_size;
 	unsigned int		zone_nr_bitmap_blocks;
 	unsigned int		zone_bits_per_mblk;
@@ -260,6 +262,11 @@ unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
 	return atomic_read(&zmd->unmap_nr_seq);
 }
 
+const char *dmz_metadata_label(struct dmz_metadata *zmd)
+{
+	return (const char *)zmd->devname;
+}
+
 /*
  * Lock/unlock mapping table.
  * The map lock also protects all the zone lists.
@@ -2439,7 +2446,8 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
 /*
  * Initialize the zoned metadata.
  */
-int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
+int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
+		     const char *devname)
 {
 	struct dmz_metadata *zmd;
 	unsigned int i;
@@ -2450,6 +2458,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 	if (!zmd)
 		return -ENOMEM;
 
+	strcpy(zmd->devname, devname);
 	zmd->dev = dev;
 	zmd->mblk_rbtree = RB_ROOT;
 	init_rwsem(&zmd->mblk_sem);
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 5aa5e5130fe8..699c4145306e 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -480,15 +480,16 @@ static void dmz_reclaim_work(struct work_struct *work)
 		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap_rnd / 2);
 	}
 
-	dmz_dev_debug(zrc->dev,
-		      "Reclaim (%u): %s, %u%% free rnd zones (%u/%u)",
-		      zrc->kc_throttle.throttle,
-		      (dmz_target_idle(zrc) ? "Idle" : "Busy"),
-		      p_unmap_rnd, nr_unmap_rnd, nr_rnd);
+	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free rnd zones (%u/%u)",
+		dmz_metadata_label(zmd),
+		zrc->kc_throttle.throttle,
+		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
+		p_unmap_rnd, nr_unmap_rnd, nr_rnd);
 
 	ret = dmz_do_reclaim(zrc);
 	if (ret) {
-		dmz_dev_debug(zrc->dev, "Reclaim error %d\n", ret);
+		DMDEBUG("(%s): Reclaim error %d\n",
+			dmz_metadata_label(zmd), ret);
 		if (!dmz_check_bdev(zrc->dev))
 			return;
 	}
@@ -524,7 +525,7 @@ int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
 	/* Reclaim work */
 	INIT_DELAYED_WORK(&zrc->work, dmz_reclaim_work);
 	zrc->wq = alloc_ordered_workqueue("dmz_rwq_%s", WQ_MEM_RECLAIM,
-					  dev->name);
+					  dmz_metadata_label(zmd));
 	if (!zrc->wq) {
 		ret = -ENOMEM;
 		goto err;
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 1e22da9d7b40..748d4cd5d62d 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -178,11 +178,12 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 		return 0;
 	}
 
-	dmz_dev_debug(dmz->dev, "READ chunk %llu -> %s zone %u, block %llu, %u blocks",
-		      (unsigned long long)dmz_bio_chunk(zmd, bio),
-		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
-		      zone->id,
-		      (unsigned long long)chunk_block, nr_blocks);
+	DMDEBUG("(%s): READ chunk %llu -> %s zone %u, block %llu, %u blocks",
+		dmz_metadata_label(zmd),
+		(unsigned long long)dmz_bio_chunk(zmd, bio),
+		(dmz_is_rnd(zone) ? "RND" : "SEQ"),
+		zone->id,
+		(unsigned long long)chunk_block, nr_blocks);
 
 	/* Check block validity to determine the read location */
 	bzone = zone->bzone;
@@ -316,11 +317,12 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
 	if (!zone)
 		return -ENOSPC;
 
-	dmz_dev_debug(dmz->dev, "WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
-		      (unsigned long long)dmz_bio_chunk(zmd, bio),
-		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
-		      zone->id,
-		      (unsigned long long)chunk_block, nr_blocks);
+	DMDEBUG("(%s): WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
+		dmz_metadata_label(zmd),
+		(unsigned long long)dmz_bio_chunk(zmd, bio),
+		(dmz_is_rnd(zone) ? "RND" : "SEQ"),
+		zone->id,
+		(unsigned long long)chunk_block, nr_blocks);
 
 	if (dmz_is_rnd(zone) || chunk_block == zone->wp_block) {
 		/*
@@ -357,10 +359,11 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
 	if (dmz_is_readonly(zone))
 		return -EROFS;
 
-	dmz_dev_debug(dmz->dev, "DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
-		      (unsigned long long)dmz_bio_chunk(zmd, bio),
-		      zone->id,
-		      (unsigned long long)chunk_block, nr_blocks);
+	DMDEBUG("(%s): DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
+		dmz_metadata_label(dmz->metadata),
+		(unsigned long long)dmz_bio_chunk(zmd, bio),
+		zone->id,
+		(unsigned long long)chunk_block, nr_blocks);
 
 	/*
 	 * Invalidate blocks in the data zone and its
@@ -429,8 +432,8 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 		ret = dmz_handle_discard(dmz, zone, bio);
 		break;
 	default:
-		dmz_dev_err(dmz->dev, "Unsupported BIO operation 0x%x",
-			    bio_op(bio));
+		DMERR("(%s): Unsupported BIO operation 0x%x",
+		      dmz_metadata_label(dmz->metadata), bio_op(bio));
 		ret = -EIO;
 	}
 
@@ -504,7 +507,8 @@ static void dmz_flush_work(struct work_struct *work)
 	/* Flush dirty metadata blocks */
 	ret = dmz_flush_metadata(dmz->metadata);
 	if (ret)
-		dmz_dev_debug(dmz->dev, "Metadata flush failed, rc=%d\n", ret);
+		DMDEBUG("(%s): Metadata flush failed, rc=%d\n",
+			dmz_metadata_label(dmz->metadata), ret);
 
 	/* Process queued flush requests */
 	while (1) {
@@ -631,11 +635,12 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 	if (dmz_bdev_is_dying(dmz->dev))
 		return DM_MAPIO_KILL;
 
-	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
-		      bio_op(bio), (unsigned long long)sector, nr_sectors,
-		      (unsigned long long)dmz_bio_chunk(zmd, bio),
-		      (unsigned long long)dmz_chunk_block(zmd, dmz_bio_block(bio)),
-		      (unsigned int)dmz_bio_blocks(bio));
+	DMDEBUG("(%s): BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
+		dmz_metadata_label(zmd),
+		bio_op(bio), (unsigned long long)sector, nr_sectors,
+		(unsigned long long)dmz_bio_chunk(zmd, bio),
+		(unsigned long long)dmz_chunk_block(zmd, dmz_bio_block(bio)),
+		(unsigned int)dmz_bio_blocks(bio));
 
 	bio_set_dev(bio, dev->bdev);
 
@@ -669,10 +674,10 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 	/* Now ready to handle this BIO */
 	ret = dmz_queue_chunk_work(dmz, bio);
 	if (ret) {
-		dmz_dev_debug(dmz->dev,
-			      "BIO op %d, can't process chunk %llu, err %i\n",
-			      bio_op(bio), (u64)dmz_bio_chunk(zmd, bio),
-			      ret);
+		DMDEBUG("(%s): BIO op %d, can't process chunk %llu, err %i\n",
+			dmz_metadata_label(zmd),
+			bio_op(bio), (u64)dmz_bio_chunk(zmd, bio),
+			ret);
 		return DM_MAPIO_REQUEUE;
 	}
 
@@ -782,7 +787,8 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	/* Initialize metadata */
 	dev = dmz->dev;
-	ret = dmz_ctr_metadata(dev, &dmz->metadata);
+	ret = dmz_ctr_metadata(dev, &dmz->metadata,
+			       dm_table_device_name(ti->table));
 	if (ret) {
 		ti->error = "Metadata initialization failed";
 		goto err_dev;
@@ -811,8 +817,9 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	/* Chunk BIO work */
 	mutex_init(&dmz->chunk_lock);
 	INIT_RADIX_TREE(&dmz->chunk_rxtree, GFP_NOIO);
-	dmz->chunk_wq = alloc_workqueue("dmz_cwq_%s", WQ_MEM_RECLAIM | WQ_UNBOUND,
-					0, dev->name);
+	dmz->chunk_wq = alloc_workqueue("dmz_cwq_%s",
+					WQ_MEM_RECLAIM | WQ_UNBOUND, 0,
+					dmz_metadata_label(dmz->metadata));
 	if (!dmz->chunk_wq) {
 		ti->error = "Create chunk workqueue failed";
 		ret = -ENOMEM;
@@ -824,7 +831,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	bio_list_init(&dmz->flush_list);
 	INIT_DELAYED_WORK(&dmz->flush_work, dmz_flush_work);
 	dmz->flush_wq = alloc_ordered_workqueue("dmz_fwq_%s", WQ_MEM_RECLAIM,
-						dev->name);
+						dmz_metadata_label(dmz->metadata));
 	if (!dmz->flush_wq) {
 		ti->error = "Create flush workqueue failed";
 		ret = -ENOMEM;
@@ -839,9 +846,10 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto err_fwq;
 	}
 
-	dmz_dev_info(dev, "Target device: %llu 512-byte logical sectors (%llu blocks)",
-		     (unsigned long long)ti->len,
-		     (unsigned long long)dmz_sect2blk(ti->len));
+	DMINFO("(%s): Target device: %llu 512-byte logical sectors (%llu blocks)",
+	       dmz_metadata_label(dmz->metadata),
+	       (unsigned long long)ti->len,
+	       (unsigned long long)dmz_sect2blk(ti->len));
 
 	return 0;
 err_fwq:
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index f997ad62c7b4..dd768dc60341 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -163,7 +163,8 @@ struct dmz_reclaim;
 /*
  * Functions defined in dm-zoned-metadata.c
  */
-int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **zmd);
+int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **zmd,
+		     const char *devname);
 void dmz_dtr_metadata(struct dmz_metadata *zmd);
 int dmz_resume_metadata(struct dmz_metadata *zmd);
 
@@ -174,6 +175,7 @@ void dmz_unlock_metadata(struct dmz_metadata *zmd);
 void dmz_lock_flush(struct dmz_metadata *zmd);
 void dmz_unlock_flush(struct dmz_metadata *zmd);
 int dmz_flush_metadata(struct dmz_metadata *zmd);
+const char *dmz_metadata_label(struct dmz_metadata *zmd);
 
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
 sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

