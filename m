Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CEBD71CD3B8
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=murfJWJOirQVFdwgLyXvHkq3Q9u+KyI2pXKLbNPbbcU=;
	b=U4ClJWJpc0CtGy8WfMWh3FtA1gG3Lz6+t/Krkiq05TzQwZ8qCZvZGoTZBS7e8SXPjiWT7U
	fj7aXvkHwnHtbgnVt2mv8mFPHSts2tpq0o22OkU1wU+R4vrj+BoiH2nvf+5eTSt+l3Td09
	/zRu1/bRXo+JoZs9Bp8dVplqh1sv91I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-ddRb9Mi5Msuzql3qxbufpw-1; Mon, 11 May 2020 04:25:08 -0400
X-MC-Unique: ddRb9Mi5Msuzql3qxbufpw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20958107ACF8;
	Mon, 11 May 2020 08:25:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C173A5D788;
	Mon, 11 May 2020 08:24:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 401624CAA0;
	Mon, 11 May 2020 08:24:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8Orb0031898 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:24:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D465D0B3C; Mon, 11 May 2020 08:24:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 582FAD0198
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A1C180CDAF
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-255-Tic-H7mGOiWn22Pxjs2bnA-1;
	Mon, 11 May 2020 04:24:50 -0400
X-MC-Unique: Tic-H7mGOiWn22Pxjs2bnA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8F561AF76;
	Mon, 11 May 2020 08:24:47 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 11 May 2020 10:24:30 +0200
Message-Id: <20200511082430.39455-16-hare@suse.de>
In-Reply-To: <20200511082430.39455-1-hare@suse.de>
References: <20200511082430.39455-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 15/15] dm-zoned: metadata version 2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement handling for metadata version 2. The new metadata adds
a label and UUID for the device mapper device, and additional UUID
for the underlying block devices.
It also allows for an additional regular drive to be used for
emulating random access zones. The emulated zones will be placed
logically in front of the zones from the zoned block device, causing
the superblocks and metadata to be stored on that device.
The first zone of the original zoned device will be used to hold
another, tertiary copy of the metadata; this copy carries a
generation number of 0 and is never updated; it's just used
for identification.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../admin-guide/device-mapper/dm-zoned.rst         |  34 ++-
 drivers/md/dm-zoned-metadata.c                     | 310 +++++++++++++++++----
 drivers/md/dm-zoned-target.c                       | 185 ++++++++----
 drivers/md/dm-zoned.h                              |   7 +-
 4 files changed, 427 insertions(+), 109 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-zoned.rst b/Documentation/admin-guide/device-mapper/dm-zoned.rst
index 7547ce635161..553752ea2521 100644
--- a/Documentation/admin-guide/device-mapper/dm-zoned.rst
+++ b/Documentation/admin-guide/device-mapper/dm-zoned.rst
@@ -37,9 +37,13 @@ Algorithm
 dm-zoned implements an on-disk buffering scheme to handle non-sequential
 write accesses to the sequential zones of a zoned block device.
 Conventional zones are used for caching as well as for storing internal
-metadata.
+metadata. It can also use a regular block device together with the zoned
+block device; in that case the regular block device will be split logically
+in zones with the same size as the zoned block device. These zones will be
+placed in front of the zones from the zoned block device and will be handled
+just like conventional zones.
 
-The zones of the device are separated into 2 types:
+The zones of the device(s) are separated into 2 types:
 
 1) Metadata zones: these are conventional zones used to store metadata.
 Metadata zones are not reported as useable capacity to the user.
@@ -127,6 +131,13 @@ resumed. Flushing metadata thus only temporarily delays write and
 discard requests. Read requests can be processed concurrently while
 metadata flush is being executed.
 
+If a regular device is used in conjunction with the zoned block device,
+a third set of metadata (without the zone bitmaps) is written to the
+start of the zoned block device. This metadata has a generation counter of
+'0' and will never be updated during normal operation; it just serves for
+identification purposes. The first and second copy of the metadata
+are located at the start of the regular block device.
+
 Usage
 =====
 
@@ -138,12 +149,21 @@ Ex::
 
 	dmzadm --format /dev/sdxx
 
-For a formatted device, the target can be created normally with the
-dmsetup utility. The only parameter that dm-zoned requires is the
-underlying zoned block device name. Ex::
 
-	echo "0 `blockdev --getsize ${dev}` zoned ${dev}" | \
-	dmsetup create dmz-`basename ${dev}`
+If two drives are to be used, both devices must be specified, with the
+regular block device as the first device.
+
+Ex::
+
+	dmzadm --format /dev/sdxx /dev/sdyy
+
+
+Fomatted device(s) can be started with the dmzadm utility, too.:
+
+Ex::
+
+	dmzadm --start /dev/sdxx /dev/sdyy
+
 
 Information about the internal layout and current usage of the zones can
 be obtained with the 'status' callback from dmsetup:
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 067ce010f457..d9e256762eff 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -16,7 +16,7 @@
 /*
  * Metadata version.
  */
-#define DMZ_META_VER	1
+#define DMZ_META_VER	2
 
 /*
  * On-disk super block magic.
@@ -69,8 +69,17 @@ struct dmz_super {
 	/* Checksum */
 	__le32		crc;			/*  48 */
 
+	/* DM-Zoned label */
+	u8		dmz_label[32];		/*  80 */
+
+	/* DM-Zoned UUID */
+	u8		dmz_uuid[16];		/*  96 */
+
+	/* Device UUID */
+	u8		dev_uuid[16];		/* 112 */
+
 	/* Padding to full 512B sector */
-	u8		reserved[464];		/* 512 */
+	u8		reserved[400];		/* 512 */
 };
 
 /*
@@ -133,8 +142,11 @@ struct dmz_sb {
  */
 struct dmz_metadata {
 	struct dmz_dev		*dev;
+	unsigned int		nr_devs;
 
 	char			devname[BDEVNAME_SIZE];
+	char			label[BDEVNAME_SIZE];
+	uuid_t			uuid;
 
 	sector_t		zone_bitmap_size;
 	unsigned int		zone_nr_bitmap_blocks;
@@ -161,8 +173,9 @@ struct dmz_metadata {
 	/* Zone information array */
 	struct dm_zone		*zones;
 
-	struct dmz_sb		sb[2];
+	struct dmz_sb		sb[3];
 	unsigned int		mblk_primary;
+	unsigned int		sb_version;
 	u64			sb_gen;
 	unsigned int		min_nr_mblks;
 	unsigned int		max_nr_mblks;
@@ -195,31 +208,56 @@ struct dmz_metadata {
 };
 
 #define dmz_zmd_info(zmd, format, args...)	\
-	DMINFO("(%s): " format, (zmd)->devname, ## args)
+	DMINFO("(%s): " format, (zmd)->label, ## args)
 
 #define dmz_zmd_err(zmd, format, args...)	\
-	DMERR("(%s): " format, (zmd)->devname, ## args)
+	DMERR("(%s): " format, (zmd)->label, ## args)
 
 #define dmz_zmd_warn(zmd, format, args...)	\
-	DMWARN("(%s): " format, (zmd)->devname, ## args)
+	DMWARN("(%s): " format, (zmd)->label, ## args)
 
 #define dmz_zmd_debug(zmd, format, args...)	\
-	DMDEBUG("(%s): " format, (zmd)->devname, ## args)
+	DMDEBUG("(%s): " format, (zmd)->label, ## args)
 /*
  * Various accessors
  */
+unsigned int dmz_dev_zone_id(struct dmz_metadata *zmd, struct dm_zone *zone)
+{
+	unsigned int zone_id;
+
+	if (WARN_ON(!zone))
+		return 0;
+
+	zone_id = zone->id;
+	if (zmd->nr_devs > 1 &&
+	    (zone_id >= zmd->dev[1].zone_offset))
+		zone_id -= zmd->dev[1].zone_offset;
+	return zone_id;
+}
+
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	return (sector_t)zone->id << zmd->zone_nr_sectors_shift;
+	unsigned int zone_id = dmz_dev_zone_id(zmd, zone);
+
+	return (sector_t)zone_id << zmd->zone_nr_sectors_shift;
 }
 
 sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	return (sector_t)zone->id << zmd->zone_nr_blocks_shift;
+	unsigned int zone_id = dmz_dev_zone_id(zmd, zone);
+
+	return (sector_t)zone_id << zmd->zone_nr_blocks_shift;
 }
 
 struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
+	if (WARN_ON(!zone))
+		return &zmd->dev[0];
+
+	if (zmd->nr_devs > 1 &&
+	    zone->id >= zmd->dev[1].zone_offset)
+		return &zmd->dev[1];
+
 	return &zmd->dev[0];
 }
 
@@ -275,17 +313,29 @@ unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
 
 const char *dmz_metadata_label(struct dmz_metadata *zmd)
 {
-	return (const char *)zmd->devname;
+	return (const char *)zmd->label;
 }
 
 bool dmz_check_dev(struct dmz_metadata *zmd)
 {
-	return dmz_check_bdev(&zmd->dev[0]);
+	unsigned int i;
+
+	for (i = 0; i < zmd->nr_devs; i++) {
+		if (!dmz_check_bdev(&zmd->dev[i]))
+			return false;
+	}
+	return true;
 }
 
 bool dmz_dev_is_dying(struct dmz_metadata *zmd)
 {
-	return dmz_bdev_is_dying(&zmd->dev[0]);
+	unsigned int i;
+
+	for (i = 0; i < zmd->nr_devs; i++) {
+		if (dmz_bdev_is_dying(&zmd->dev[i]))
+			return true;
+	}
+	return false;
 }
 
 /*
@@ -687,6 +737,9 @@ static int dmz_rdwr_block(struct dmz_dev *dev, int op,
 	struct bio *bio;
 	int ret;
 
+	if (WARN_ON(!dev))
+		return -EIO;
+
 	if (dmz_bdev_is_dying(dev))
 		return -EIO;
 
@@ -711,19 +764,32 @@ static int dmz_rdwr_block(struct dmz_dev *dev, int op,
  */
 static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
 {
-	sector_t block = zmd->sb[set].block;
 	struct dmz_mblock *mblk = zmd->sb[set].mblk;
 	struct dmz_super *sb = zmd->sb[set].sb;
 	struct dmz_dev *dev = zmd->sb[set].dev;
+	sector_t sb_block;
 	u64 sb_gen = zmd->sb_gen + 1;
 	int ret;
 
 	sb->magic = cpu_to_le32(DMZ_MAGIC);
-	sb->version = cpu_to_le32(DMZ_META_VER);
+
+	sb->version = cpu_to_le32(zmd->sb_version);
+	if (zmd->sb_version > 1) {
+		BUILD_BUG_ON(UUID_SIZE != 16);
+		export_uuid(sb->dmz_uuid, &zmd->uuid);
+		memcpy(sb->dmz_label, zmd->label, BDEVNAME_SIZE);
+		export_uuid(sb->dev_uuid, &dev->uuid);
+	}
 
 	sb->gen = cpu_to_le64(sb_gen);
 
-	sb->sb_block = cpu_to_le64(block);
+	/*
+	 * The metadata always references the absolute block address,
+	 * ie relative to the entire block range, not the per-device
+	 * block address.
+	 */
+	sb_block = zmd->sb[set].zone->id << zmd->zone_nr_blocks_shift;
+	sb->sb_block = cpu_to_le64(sb_block);
 	sb->nr_meta_blocks = cpu_to_le32(zmd->nr_meta_blocks);
 	sb->nr_reserved_seq = cpu_to_le32(zmd->nr_reserved_seq);
 	sb->nr_chunks = cpu_to_le32(zmd->nr_chunks);
@@ -734,7 +800,8 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
 	sb->crc = 0;
 	sb->crc = cpu_to_le32(crc32_le(sb_gen, (unsigned char *)sb, DMZ_BLOCK_SIZE));
 
-	ret = dmz_rdwr_block(dev, REQ_OP_WRITE, block, mblk->page);
+	ret = dmz_rdwr_block(dev, REQ_OP_WRITE, zmd->sb[set].block,
+			     mblk->page);
 	if (ret == 0)
 		ret = blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
 
@@ -915,6 +982,23 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
 	u32 crc, stored_crc;
 	u64 gen;
 
+	if (le32_to_cpu(sb->magic) != DMZ_MAGIC) {
+		dmz_dev_err(dev, "Invalid meta magic (needed 0x%08x, got 0x%08x)",
+			    DMZ_MAGIC, le32_to_cpu(sb->magic));
+		return -ENXIO;
+	}
+
+	zmd->sb_version = le32_to_cpu(sb->version);
+	if (zmd->sb_version > DMZ_META_VER) {
+		dmz_dev_err(dev, "Invalid meta version (needed %d, got %d)",
+			    DMZ_META_VER, zmd->sb_version);
+		return -EINVAL;
+	}
+	if ((zmd->sb_version < 1) && (set == 2)) {
+		dmz_dev_err(dev, "Tertiary superblocks are not supported");
+		return -EINVAL;
+	}
+
 	gen = le64_to_cpu(sb->gen);
 	stored_crc = le32_to_cpu(sb->crc);
 	sb->crc = 0;
@@ -925,16 +1009,45 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
 		return -ENXIO;
 	}
 
-	if (le32_to_cpu(sb->magic) != DMZ_MAGIC) {
-		dmz_dev_err(dev, "Invalid meta magic (needed 0x%08x, got 0x%08x)",
-			    DMZ_MAGIC, le32_to_cpu(sb->magic));
-		return -ENXIO;
-	}
+	if (zmd->sb_version > 1) {
+		uuid_t sb_uuid;
+
+		import_uuid(&sb_uuid, sb->dmz_uuid);
+		if (uuid_is_null(&sb_uuid)) {
+			dmz_dev_err(dev, "NULL DM-Zoned uuid");
+			return -ENXIO;
+		} else if (uuid_is_null(&zmd->uuid)) {
+			uuid_copy(&zmd->uuid, &sb_uuid);
+		} else if (!uuid_equal(&zmd->uuid, &sb_uuid)) {
+			dmz_dev_err(dev, "mismatching DM-Zoned uuid, "
+				    "is %pUl expected %pUl",
+				    &sb_uuid, &zmd->uuid);
+			return -ENXIO;
+		}
+		if (!strlen(zmd->label))
+			memcpy(zmd->label, sb->dmz_label, BDEVNAME_SIZE);
+		else if (memcmp(zmd->label, sb->dmz_label, BDEVNAME_SIZE)) {
+			dmz_dev_err(dev, "mismatching DM-Zoned label, "
+				    "is %s expected %s",
+				    sb->dmz_label, zmd->label);
+			return -ENXIO;
+		}
+		import_uuid(&dev->uuid, sb->dev_uuid);
+		if (uuid_is_null(&dev->uuid)) {
+			dmz_dev_err(dev, "NULL device uuid");
+			return -ENXIO;
+		}
 
-	if (le32_to_cpu(sb->version) != DMZ_META_VER) {
-		dmz_dev_err(dev, "Invalid meta version (needed %d, got %d)",
-			    DMZ_META_VER, le32_to_cpu(sb->version));
-		return -ENXIO;
+		if (set == 2) {
+			/*
+			 * Generation number should be 0, but it doesn't
+			 * really matter if it isn't.
+			 */
+			if (gen != 0)
+				dmz_dev_warn(dev, "Invalid generation %llu",
+					    gen);
+			return 0;
+		}
 	}
 
 	nr_meta_zones = (le32_to_cpu(sb->nr_meta_blocks) + zmd->zone_nr_blocks - 1)
@@ -1185,21 +1298,38 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 		      "Using super block %u (gen %llu)",
 		      zmd->mblk_primary, zmd->sb_gen);
 
+	if ((zmd->sb_version > 1) && zmd->sb[2].zone) {
+		zmd->sb[2].block = dmz_start_block(zmd, zmd->sb[2].zone);
+		zmd->sb[2].dev = dmz_zone_to_dev(zmd, zmd->sb[2].zone);
+		ret = dmz_get_sb(zmd, 2);
+		if (ret) {
+			dmz_dev_err(zmd->sb[2].dev,
+				    "Read tertiary super block failed");
+			return ret;
+		}
+		ret = dmz_check_sb(zmd, 2);
+		if (ret == -EINVAL)
+			return ret;
+	}
 	return 0;
 }
 
 /*
  * Initialize a zone descriptor.
  */
-static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
+static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
 {
 	struct dmz_metadata *zmd = data;
+	struct dmz_dev *dev = zmd->nr_devs > 1 ? &zmd->dev[1] : &zmd->dev[0];
+	int idx = num + dev->zone_offset;
 	struct dm_zone *zone = &zmd->zones[idx];
-	struct dmz_dev *dev = zmd->dev;
 
-	/* Ignore the eventual last runt (smaller) zone */
 	if (blkz->len != zmd->zone_nr_sectors) {
-		if (blkz->start + blkz->len == dev->capacity)
+		if (zmd->sb_version > 1) {
+			/* Ignore the eventual runt (smaller) zone */
+			set_bit(DMZ_OFFLINE, &zone->flags);
+			return 0;
+		} else if (blkz->start + blkz->len == dev->capacity)
 			return 0;
 		return -ENXIO;
 	}
@@ -1234,16 +1364,45 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
 		zmd->nr_useable_zones++;
 		if (dmz_is_rnd(zone)) {
 			zmd->nr_rnd_zones++;
-			if (!zmd->sb[0].zone) {
-				/* Super block zone */
+			if (zmd->nr_devs == 1 && !zmd->sb[0].zone) {
+				/* Primary super block zone */
 				zmd->sb[0].zone = zone;
 			}
 		}
+		if (zmd->nr_devs > 1 && !zmd->sb[2].zone) {
+			/* Tertiary superblock zone */
+			zmd->sb[2].zone = zone;
+		}
 	}
 
 	return 0;
 }
 
+static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
+{
+	int idx;
+	sector_t zone_offset = 0;
+
+	for(idx = 0; idx < dev->nr_zones; idx++) {
+		struct dm_zone *zone = &zmd->zones[idx];
+
+		INIT_LIST_HEAD(&zone->link);
+		atomic_set(&zone->refcount, 0);
+		zone->id = idx;
+		zone->chunk = DMZ_MAP_UNMAPPED;
+		set_bit(DMZ_RND, &zone->flags);
+		zone->wp_block = 0;
+		zmd->nr_rnd_zones++;
+		zmd->nr_useable_zones++;
+		if (dev->capacity - zone_offset < zmd->zone_nr_sectors) {
+			/* Disable runt zone */
+			set_bit(DMZ_OFFLINE, &zone->flags);
+			break;
+		}
+		zone_offset += zmd->zone_nr_sectors;
+	}
+}
+
 /*
  * Free zones descriptors.
  */
@@ -1259,11 +1418,11 @@ static void dmz_drop_zones(struct dmz_metadata *zmd)
  */
 static int dmz_init_zones(struct dmz_metadata *zmd)
 {
-	struct dmz_dev *dev = &zmd->dev[0];
-	int ret;
+	int i, ret;
+	struct dmz_dev *zoned_dev = &zmd->dev[0];
 
 	/* Init */
-	zmd->zone_nr_sectors = dev->zone_nr_sectors;
+	zmd->zone_nr_sectors = zmd->dev[0].zone_nr_sectors;
 	zmd->zone_nr_sectors_shift = ilog2(zmd->zone_nr_sectors);
 	zmd->zone_nr_blocks = dmz_sect2blk(zmd->zone_nr_sectors);
 	zmd->zone_nr_blocks_shift = ilog2(zmd->zone_nr_blocks);
@@ -1274,7 +1433,14 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 					DMZ_BLOCK_SIZE_BITS);
 
 	/* Allocate zone array */
-	zmd->nr_zones = dev->nr_zones;
+	zmd->nr_zones = 0;
+	for (i = 0; i < zmd->nr_devs; i++)
+		zmd->nr_zones += zmd->dev[i].nr_zones;
+
+	if (!zmd->nr_zones) {
+		DMERR("(%s): No zones found", zmd->devname);
+		return -ENXIO;
+	}
 	zmd->zones = kcalloc(zmd->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
 	if (!zmd->zones)
 		return -ENOMEM;
@@ -1282,14 +1448,27 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 	DMDEBUG("(%s): Using %zu B for zone information",
 		zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
 
+	if (zmd->nr_devs > 1) {
+		dmz_emulate_zones(zmd, &zmd->dev[0]);
+		/*
+		 * Primary superblock zone is always at zone 0 when multiple
+		 * drives are present.
+		 */
+		zmd->sb[0].zone = &zmd->zones[0];
+
+		zoned_dev = &zmd->dev[1];
+	}
+
 	/*
 	 * Get zone information and initialize zone descriptors.  At the same
 	 * time, determine where the super block should be: first block of the
 	 * first randomly writable zone.
 	 */
-	ret = blkdev_report_zones(dev->bdev, 0, BLK_ALL_ZONES, dmz_init_zone,
-				  zmd);
+	ret = blkdev_report_zones(zoned_dev->bdev, 0, BLK_ALL_ZONES,
+				  dmz_init_zone, zmd);
 	if (ret < 0) {
+		DMDEBUG("(%s): Failed to report zones, error %d",
+			zmd->devname, ret);
 		dmz_drop_zones(zmd);
 		return ret;
 	}
@@ -1325,6 +1504,9 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	unsigned int noio_flag;
 	int ret;
 
+	if (dev->flags & DMZ_BDEV_REGULAR)
+		return 0;
+
 	/*
 	 * Get zone information from disk. Since blkdev_report_zones() uses
 	 * GFP_KERNEL by default for memory allocations, set the per-task
@@ -2475,18 +2657,33 @@ void dmz_print_dev(struct dmz_metadata *zmd, int num)
 {
 	struct dmz_dev *dev = &zmd->dev[num];
 
-	dmz_dev_info(dev, "Host-%s zoned block device",
-		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
-		     "aware" : "managed");
-	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
-		     (u64)dev->capacity);
-	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
-		     dev->nr_zones, (u64)zmd->zone_nr_sectors);
+	if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE)
+		dmz_dev_info(dev, "Regular block device");
+	else
+		dmz_dev_info(dev, "Host-%s zoned block device",
+			     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
+			     "aware" : "managed");
+	if (zmd->sb_version > 1) {
+		sector_t sector_offset =
+			dev->zone_offset << zmd->zone_nr_sectors_shift;
+
+		dmz_dev_info(dev, "  %llu 512-byte logical sectors (offset %llu)",
+			     (u64)dev->capacity, (u64)sector_offset);
+		dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors (offset %llu)",
+			     dev->nr_zones, (u64)zmd->zone_nr_sectors,
+			     (u64)dev->zone_offset);
+	} else {
+		dmz_dev_info(dev, "  %llu 512-byte logical sectors",
+			     (u64)dev->capacity);
+		dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
+			     dev->nr_zones, (u64)zmd->zone_nr_sectors);
+	}
 }
 /*
  * Initialize the zoned metadata.
  */
-int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
+int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
+		     struct dmz_metadata **metadata,
 		     const char *devname)
 {
 	struct dmz_metadata *zmd;
@@ -2500,6 +2697,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
 
 	strcpy(zmd->devname, devname);
 	zmd->dev = dev;
+	zmd->nr_devs = num_dev;
 	zmd->mblk_rbtree = RB_ROOT;
 	init_rwsem(&zmd->mblk_sem);
 	mutex_init(&zmd->mblk_flush_lock);
@@ -2534,11 +2732,24 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
 	/* Set metadata zones starting from sb_zone */
 	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
 		zone = dmz_get(zmd, zmd->sb[0].zone->id + i);
-		if (!dmz_is_rnd(zone))
+		if (!dmz_is_rnd(zone)) {
+			dmz_zmd_err(zmd,
+				    "metadata zone %d is not random", i);
+			ret = -ENXIO;
 			goto err;
+		}
+		set_bit(DMZ_META, &zone->flags);
+	}
+	if (zmd->sb[2].zone) {
+		zone = dmz_get(zmd, zmd->sb[2].zone->id);
+		if (!zone) {
+			dmz_zmd_err(zmd,
+				    "Tertiary metadata zone not present");
+			ret = -ENXIO;
+			goto err;
+		}
 		set_bit(DMZ_META, &zone->flags);
 	}
-
 	/* Load mapping table */
 	ret = dmz_load_mapping(zmd);
 	if (ret)
@@ -2563,8 +2774,9 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
 		goto err;
 	}
 
-	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", DMZ_META_VER);
-	dmz_print_dev(zmd, 0);
+	dmz_zmd_info(zmd, "DM-Zoned metadata version %d", zmd->sb_version);
+	for (i = 0; i < zmd->nr_devs; i++)
+		dmz_print_dev(zmd, i);
 
 	dmz_zmd_info(zmd, "  %u zones of %llu 512-byte logical sectors",
 		     zmd->nr_zones, (u64)zmd->zone_nr_sectors);
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index a09fb78ffe88..ea43f6892ced 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -13,6 +13,8 @@
 
 #define DMZ_MIN_BIOS		8192
 
+#define DMZ_MAX_DEVS		2
+
 /*
  * Zone BIO context.
  */
@@ -38,7 +40,7 @@ struct dm_chunk_work {
  * Target descriptor.
  */
 struct dmz_target {
-	struct dm_dev		*ddev;
+	struct dm_dev		*ddev[DMZ_MAX_DEVS];
 
 	unsigned long		flags;
 
@@ -81,7 +83,7 @@ static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
 
 	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
 		bio->bi_status = status;
-	if (bio->bi_status != BLK_STS_OK)
+	if (bioctx->dev && bio->bi_status != BLK_STS_OK)
 		bioctx->dev->flags |= DMZ_CHECK_BDEV;
 
 	if (refcount_dec_and_test(&bioctx->ref)) {
@@ -690,60 +692,64 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 /*
  * Get zoned device information.
  */
-static int dmz_get_zoned_device(struct dm_target *ti, char *path)
+static int dmz_get_zoned_device(struct dm_target *ti, char *path,
+				int idx, int nr_devs)
 {
 	struct dmz_target *dmz = ti->private;
-	struct request_queue *q;
+	struct dm_dev *ddev;
 	struct dmz_dev *dev;
-	sector_t aligned_capacity;
 	int ret;
+	struct block_device *bdev;
 
 	/* Get the target device */
-	ret = dm_get_device(ti, path, dm_table_get_mode(ti->table), &dmz->ddev);
+	ret = dm_get_device(ti, path, dm_table_get_mode(ti->table), &ddev);
 	if (ret) {
 		ti->error = "Get target device failed";
-		dmz->ddev = NULL;
 		return ret;
 	}
 
-	dev = kzalloc(sizeof(struct dmz_dev), GFP_KERNEL);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto err;
+	bdev = ddev->bdev;
+	if (bdev_zoned_model(bdev) == BLK_ZONED_NONE) {
+		if (nr_devs == 1) {
+			ti->error = "Invalid regular device";
+			goto err;
+		}
+		if (idx != 0) {
+			ti->error = "First device must be a regular device";
+			goto err;
+		}
+		if (dmz->ddev[0]) {
+			ti->error = "Too many regular devices";
+			goto err;
+		}
+		dev = &dmz->dev[idx];
+		dev->flags = DMZ_BDEV_REGULAR;
+	} else {
+		if (dmz->ddev[idx]) {
+			ti->error = "Too many zoned devices";
+			goto err;
+		}
+		if (nr_devs > 1 && idx == 0) {
+			ti->error = "First device must be a regular device";
+			goto err;
+		}
+		dev = &dmz->dev[idx];
 	}
-
-	dev->bdev = dmz->ddev->bdev;
+	dev->bdev = bdev;
 	(void)bdevname(dev->bdev, dev->name);
 
-	if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE) {
-		ti->error = "Not a zoned block device";
-		ret = -EINVAL;
-		goto err;
-	}
-
-	q = bdev_get_queue(dev->bdev);
-	dev->capacity = i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT;
-	aligned_capacity = dev->capacity &
-				~((sector_t)blk_queue_zone_sectors(q) - 1);
-	if (ti->begin ||
-	    ((ti->len != dev->capacity) && (ti->len != aligned_capacity))) {
-		ti->error = "Partial mapping not supported";
-		ret = -EINVAL;
+	dev->capacity = i_size_read(bdev->bd_inode) >> SECTOR_SHIFT;
+	if (ti->begin) {
+		ti->error = "Partial mapping is not supported";
 		goto err;
 	}
 
-	dev->zone_nr_sectors = blk_queue_zone_sectors(q);
-
-	dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
-
-	dmz->dev = dev;
+	dmz->ddev[idx] = ddev;
 
 	return 0;
 err:
-	dm_put_device(ti, dmz->ddev);
-	kfree(dev);
-
-	return ret;
+	dm_put_device(ti, ddev);
+	return -EINVAL;
 }
 
 /*
@@ -752,10 +758,56 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
 static void dmz_put_zoned_device(struct dm_target *ti)
 {
 	struct dmz_target *dmz = ti->private;
+	int i;
 
-	dm_put_device(ti, dmz->ddev);
-	kfree(dmz->dev);
-	dmz->dev = NULL;
+	for (i = 0; i < DMZ_MAX_DEVS; i++) {
+		if (dmz->ddev[i]) {
+			dm_put_device(ti, dmz->ddev[i]);
+			dmz->ddev[i] = NULL;
+		}
+	}
+}
+
+static int dmz_fixup_devices(struct dm_target *ti)
+{
+	struct dmz_target *dmz = ti->private;
+	struct dmz_dev *reg_dev, *zoned_dev;
+	struct request_queue *q;
+
+	/*
+	 * When we have two devices, the first one must be a regular block
+	 * device and the second a zoned block device.
+	 */
+	if (dmz->ddev[0] && dmz->ddev[1]) {
+		reg_dev = &dmz->dev[0];
+		if (!(reg_dev->flags & DMZ_BDEV_REGULAR)) {
+			ti->error = "Primary disk is not a regular device";
+			return -EINVAL;
+		}
+		zoned_dev = &dmz->dev[1];
+		if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
+			ti->error = "Secondary disk is not a zoned device";
+			return -EINVAL;
+		}
+	} else {
+		reg_dev = NULL;
+		zoned_dev = &dmz->dev[0];
+		if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
+			ti->error = "Disk is not a zoned device";
+			return -EINVAL;
+		}
+	}
+	q = bdev_get_queue(zoned_dev->bdev);
+	zoned_dev->zone_nr_sectors = blk_queue_zone_sectors(q);
+	zoned_dev->nr_zones = blkdev_nr_zones(zoned_dev->bdev->bd_disk);
+
+	if (reg_dev) {
+		reg_dev->zone_nr_sectors = zoned_dev->zone_nr_sectors;
+		reg_dev->nr_zones = DIV_ROUND_UP(reg_dev->capacity,
+						 reg_dev->zone_nr_sectors);
+		zoned_dev->zone_offset = reg_dev->nr_zones;
+	}
+	return 0;
 }
 
 /*
@@ -764,11 +816,10 @@ static void dmz_put_zoned_device(struct dm_target *ti)
 static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 {
 	struct dmz_target *dmz;
-	struct dmz_dev *dev;
 	int ret;
 
 	/* Check arguments */
-	if (argc != 1) {
+	if (argc < 1 || argc > 2) {
 		ti->error = "Invalid argument count";
 		return -EINVAL;
 	}
@@ -779,18 +830,34 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		ti->error = "Unable to allocate the zoned target descriptor";
 		return -ENOMEM;
 	}
+	dmz->dev = kcalloc(2, sizeof(struct dmz_dev), GFP_KERNEL);
+	if (!dmz->dev) {
+		ti->error = "Unable to allocate the zoned device descriptors";
+		kfree(dmz);
+		return -ENOMEM;
+	}
 	ti->private = dmz;
 
 	/* Get the target zoned block device */
-	ret = dmz_get_zoned_device(ti, argv[0]);
+	ret = dmz_get_zoned_device(ti, argv[0], 0, argc);
+	if (ret)
+		goto err;
+
+	if (argc == 2) {
+		ret = dmz_get_zoned_device(ti, argv[1], 1, argc);
+		if (ret) {
+			dmz_put_zoned_device(ti);
+			goto err;
+		}
+	}
+	ret = dmz_fixup_devices(ti);
 	if (ret) {
-		dmz->ddev = NULL;
+		dmz_put_zoned_device(ti);
 		goto err;
 	}
 
 	/* Initialize metadata */
-	dev = dmz->dev;
-	ret = dmz_ctr_metadata(dev, &dmz->metadata,
+	ret = dmz_ctr_metadata(dmz->dev, argc, &dmz->metadata,
 			       dm_table_device_name(ti->table));
 	if (ret) {
 		ti->error = "Metadata initialization failed";
@@ -867,6 +934,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 err_dev:
 	dmz_put_zoned_device(ti);
 err:
+	kfree(dmz->dev);
 	kfree(dmz);
 
 	return ret;
@@ -897,6 +965,7 @@ static void dmz_dtr(struct dm_target *ti)
 
 	mutex_destroy(&dmz->chunk_lock);
 
+	kfree(dmz->dev);
 	kfree(dmz);
 }
 
@@ -971,10 +1040,17 @@ static int dmz_iterate_devices(struct dm_target *ti,
 			       iterate_devices_callout_fn fn, void *data)
 {
 	struct dmz_target *dmz = ti->private;
-	struct dmz_dev *dev = dmz->dev;
-	sector_t capacity = dev->capacity & ~(dmz_zone_nr_sectors(dmz->metadata) - 1);
-
-	return fn(ti, dmz->ddev, 0, capacity, data);
+	unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
+	sector_t capacity;
+	int r;
+
+	capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);
+	r = fn(ti, dmz->ddev[0], 0, capacity, data);
+	if (!r && dmz->ddev[1]) {
+		capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
+		r = fn(ti, dmz->ddev[1], 0, capacity, data);
+	}
+	return r;
 }
 
 static void dmz_status(struct dm_target *ti, status_type_t type,
@@ -984,6 +1060,7 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 	struct dmz_target *dmz = ti->private;
 	ssize_t sz = 0;
 	char buf[BDEVNAME_SIZE];
+	struct dmz_dev *dev;
 
 	switch (type) {
 	case STATUSTYPE_INFO:
@@ -995,8 +1072,14 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 		       dmz_nr_seq_zones(dmz->metadata));
 		break;
 	case STATUSTYPE_TABLE:
-		format_dev_t(buf, dmz->dev->bdev->bd_dev);
+		dev = &dmz->dev[0];
+		format_dev_t(buf, dev->bdev->bd_dev);
 		DMEMIT("%s", buf);
+		if (dmz->dev[1].bdev) {
+			dev = &dmz->dev[1];
+			format_dev_t(buf, dev->bdev->bd_dev);
+			DMEMIT(" %s", buf);
+		}
 		break;
 	}
 	return;
@@ -1018,7 +1101,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
 
 static struct target_type dmz_type = {
 	.name		 = "zoned",
-	.version	 = {1, 1, 0},
+	.version	 = {2, 0, 0},
 	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
 	.module		 = THIS_MODULE,
 	.ctr		 = dmz_ctr,
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 2629bd51fa26..4971a765be55 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -52,10 +52,12 @@ struct dmz_dev {
 	struct block_device	*bdev;
 
 	char			name[BDEVNAME_SIZE];
+	uuid_t			uuid;
 
 	sector_t		capacity;
 
 	unsigned int		nr_zones;
+	unsigned int		zone_offset;
 
 	unsigned int		flags;
 
@@ -69,6 +71,7 @@ struct dmz_dev {
 /* Device flags. */
 #define DMZ_BDEV_DYING		(1 << 0)
 #define DMZ_CHECK_BDEV		(2 << 0)
+#define DMZ_BDEV_REGULAR	(4 << 0)
 
 /*
  * Zone descriptor.
@@ -163,8 +166,8 @@ struct dmz_reclaim;
 /*
  * Functions defined in dm-zoned-metadata.c
  */
-int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **zmd,
-		     const char *devname);
+int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
+		     struct dmz_metadata **zmd, const char *devname);
 void dmz_dtr_metadata(struct dmz_metadata *zmd);
 int dmz_resume_metadata(struct dmz_metadata *zmd);
 
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

