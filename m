Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 62C3519FB81
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 19:28:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586194136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wM+1Y181pV0Uwy9bIjDDa+AUWhQlG7cmyp66xBngD4M=;
	b=Sb2cKlEZfN+HbBxf0/ichERMJ2ROz3CvNy3uDt8XpRnhz8MYgAQqFU74ggNCXSEb1z662k
	l9v6xJxcw8Kisi8Qc6ehjJ2A5PXHiN6EA0bGJzLyhf30aKfeWbVUxTgfLz59XspMymKveq
	zYyYeikaaFRQd2wp4rgLlAcVFXpH0aU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-vXVQ6D5PMJ62GSY0sydEoA-1; Mon, 06 Apr 2020 13:28:53 -0400
X-MC-Unique: vXVQ6D5PMJ62GSY0sydEoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51ED28017F4;
	Mon,  6 Apr 2020 17:28:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23F4A5DA60;
	Mon,  6 Apr 2020 17:28:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4A5B18089CE;
	Mon,  6 Apr 2020 17:28:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036HShe1000680 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 13:28:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65BAE10D17A9; Mon,  6 Apr 2020 17:28:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 622D910D178B
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:28:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A3E680029A
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:28:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-25-jeVaBmmNNtWAreCe1aX48w-1;
	Mon, 06 Apr 2020 13:28:36 -0400
X-MC-Unique: jeVaBmmNNtWAreCe1aX48w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id AA136C20D;
	Mon,  6 Apr 2020 17:28:33 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon,  6 Apr 2020 16:34:59 +0200
Message-Id: <20200406143505.133271-6-hare@suse.de>
In-Reply-To: <20200406143505.133271-1-hare@suse.de>
References: <20200406143505.133271-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036HShe1000680
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 05/11] dm-zoned: introduce dmz_metadata_label()
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
---
 drivers/md/dm-zoned-metadata.c | 11 ++++++++++-
 drivers/md/dm-zoned-reclaim.c  | 15 ++++++++-------
 drivers/md/dm-zoned-target.c   | 17 ++++++++++-------
 drivers/md/dm-zoned.h          |  4 +++-
 4 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index ae261bf6452c..f7ae57e78230 100644
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
@@ -265,6 +267,11 @@ unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
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
@@ -2445,7 +2452,8 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
 /*
  * Initialize the zoned metadata.
  */
-int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
+int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
+		     const char *devname)
 {
 	struct dmz_metadata *zmd;
 	unsigned int i, zid;
@@ -2456,6 +2464,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 	if (!zmd)
 		return -ENOMEM;
 
+	strcpy(zmd->devname, devname);
 	zmd->dev = dev;
 	zmd->mblk_rbtree = RB_ROOT;
 	init_rwsem(&zmd->mblk_sem);
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 95d2c8870480..c46159b6fc46 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -481,15 +481,16 @@ static void dmz_reclaim_work(struct work_struct *work)
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
@@ -525,7 +526,7 @@ int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
 	/* Reclaim work */
 	INIT_DELAYED_WORK(&zrc->work, dmz_reclaim_work);
 	zrc->wq = alloc_ordered_workqueue("dmz_rwq_%s", WQ_MEM_RECLAIM,
-					  dev->name);
+					  dmz_metadata_label(zmd));
 	if (!zrc->wq) {
 		ret = -ENOMEM;
 		goto err;
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index f4e3be7f9474..c2c3aa090f97 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -782,7 +782,8 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	/* Initialize metadata */
 	dev = dmz->dev;
-	ret = dmz_ctr_metadata(dev, &dmz->metadata);
+	ret = dmz_ctr_metadata(dev, &dmz->metadata,
+			       dm_table_device_name(ti->table));
 	if (ret) {
 		ti->error = "Metadata initialization failed";
 		goto err_dev;
@@ -811,8 +812,9 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
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
@@ -824,7 +826,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	bio_list_init(&dmz->flush_list);
 	INIT_DELAYED_WORK(&dmz->flush_work, dmz_flush_work);
 	dmz->flush_wq = alloc_ordered_workqueue("dmz_fwq_%s", WQ_MEM_RECLAIM,
-						dev->name);
+						dmz_metadata_label(dmz->metadata));
 	if (!dmz->flush_wq) {
 		ti->error = "Create flush workqueue failed";
 		ret = -ENOMEM;
@@ -839,9 +841,10 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
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
index c1b7b9a729c2..f7df7f67e404 100644
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
 
 unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone);
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

