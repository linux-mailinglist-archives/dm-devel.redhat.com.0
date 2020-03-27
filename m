Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2AD1951D1
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 08:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585293365;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yzmgJbgNDEoZMaluJBpqVNAhbp/l0L+e/mmNHYjkwcg=;
	b=N04YeNSgpn3YD44DXgGuIl16hMbyVqgFkQkE5IRGh3Hke2E36ZZwKI0g1Z+iYrYjPoz8UI
	fc6lC1GWcIs2S3DwicUGg+I9rL7Wwb5mydMN/UdZy7tvgC36iWS63HB6Fw18sklT6hw03h
	2xEORRcW1VgPRDZnhAp9+pcXzg2m9x4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-8FU-Tx18O6WwROQB8ihNhw-1; Fri, 27 Mar 2020 03:15:35 -0400
X-MC-Unique: 8FU-Tx18O6WwROQB8ihNhw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 077E2DB32;
	Fri, 27 Mar 2020 07:15:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF4BC5C1D4;
	Fri, 27 Mar 2020 07:15:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BF5C18089CE;
	Fri, 27 Mar 2020 07:15:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02R7FFQ8027388 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 03:15:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 942822037E56; Fri, 27 Mar 2020 07:15:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 906AA2037E45
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:15:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BE198007C9
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:15:12 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-379-zYUdeJo6PJKRxJfh7twMPA-1;
	Fri, 27 Mar 2020 03:15:10 -0400
X-MC-Unique: zYUdeJo6PJKRxJfh7twMPA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id AE1FCADDD;
	Fri, 27 Mar 2020 07:15:08 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 27 Mar 2020 08:14:58 +0100
Message-Id: <20200327071459.67796-4-hare@suse.de>
In-Reply-To: <20200327071459.67796-1-hare@suse.de>
References: <20200327071459.67796-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02R7FFQ8027388
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 3/4] dm-zoned: V2 metadata handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add 'V2' metadata which includes UUIDs for the dmz set and for
the device itself.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 80 +++++++++++++++++++++++++++++++++---------
 drivers/md/dm-zoned-target.c   |  2 +-
 2 files changed, 64 insertions(+), 18 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index dc1d17bc3bbb..026f285fba33 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -16,7 +16,8 @@
 /*
  * Metadata version.
  */
-#define DMZ_META_VER	1
+#define DMZ_META_COMPAT_VER 1
+#define DMZ_META_VER	2
 
 /*
  * On-disk super block magic.
@@ -69,8 +70,17 @@ struct dmz_super {
 	/* Checksum */
 	__le32		crc;			/*  48 */
 
-	/* Padding to full 512B sector */
-	u8		reserved[464];		/* 512 */
+	/* DM-Zoned label */
+	u8		dmz_label[32];		/*  80 */
+
+	/* DM-Zoned UUID */
+	u8		dmz_uuid[16];		/*  96 */
+
+	/* Device UUID */
+	u8		dev_uuid[16];		/* 112 */
+
+	/* Padding to full 512B - CRC sector */
+	u8		reserved[400];		/* 512 */
 };
 
 /*
@@ -133,6 +143,10 @@ struct dmz_sb {
 struct dmz_metadata {
 	struct dmz_dev		*dev;
 
+	char			dmz_label[BDEVNAME_SIZE];
+	uuid_t			dmz_uuid;
+	uuid_t			dev_uuid;
+
 	sector_t		zone_bitmap_size;
 	unsigned int		zone_nr_bitmap_blocks;
 	unsigned int		zone_bits_per_mblk;
@@ -659,7 +673,14 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
 	int ret;
 
 	sb->magic = cpu_to_le32(DMZ_MAGIC);
-	sb->version = cpu_to_le32(DMZ_META_VER);
+
+	if (!uuid_is_null(&zmd->dmz_uuid)) {
+		sb->version = cpu_to_le32(DMZ_META_VER);
+		uuid_copy((uuid_t *)sb->dmz_uuid, &zmd->dmz_uuid);
+		memcpy(sb->dmz_label, zmd->dmz_label, BDEVNAME_SIZE);
+		uuid_copy((uuid_t *)sb->dev_uuid, &zmd->dev_uuid);
+	} else
+		sb->version = cpu_to_le32(DMZ_META_COMPAT_VER);
 
 	sb->gen = cpu_to_le64(sb_gen);
 
@@ -848,28 +869,29 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_super *sb)
 {
 	unsigned int nr_meta_zones, nr_data_zones;
 	struct dmz_dev *dev = zmd->dev;
-	u32 crc, stored_crc;
+	u32 crc, stored_crc, dmz_version;
 	u64 gen;
 
-	gen = le64_to_cpu(sb->gen);
-	stored_crc = le32_to_cpu(sb->crc);
-	sb->crc = 0;
-	crc = crc32_le(gen, (unsigned char *)sb, DMZ_BLOCK_SIZE);
-	if (crc != stored_crc) {
-		dmz_dev_err(dev, "Invalid checksum (needed 0x%08x, got 0x%08x)",
-			    crc, stored_crc);
-		return -ENXIO;
-	}
-
 	if (le32_to_cpu(sb->magic) != DMZ_MAGIC) {
 		dmz_dev_err(dev, "Invalid meta magic (needed 0x%08x, got 0x%08x)",
 			    DMZ_MAGIC, le32_to_cpu(sb->magic));
 		return -ENXIO;
 	}
 
-	if (le32_to_cpu(sb->version) != DMZ_META_VER) {
+	dmz_version = le32_to_cpu(sb->version);
+	if (dmz_version > DMZ_META_VER) {
 		dmz_dev_err(dev, "Invalid meta version (needed %d, got %d)",
-			    DMZ_META_VER, le32_to_cpu(sb->version));
+			    DMZ_META_VER, dmz_version);
+		return -ENXIO;
+	}
+
+	gen = le64_to_cpu(sb->gen);
+	stored_crc = le32_to_cpu(sb->crc);
+	sb->crc = 0;
+	crc = crc32_le(gen, (unsigned char *)sb, DMZ_BLOCK_SIZE);
+	if (crc != stored_crc) {
+		dmz_dev_err(dev, "Invalid checksum (needed 0x%08x, got 0x%08x)",
+			    crc, stored_crc);
 		return -ENXIO;
 	}
 
@@ -895,6 +917,21 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_super *sb)
 		return -ENXIO;
 	}
 
+	if (dmz_version == DMZ_META_VER) {
+		if (uuid_is_null((uuid_t *)sb->dmz_uuid)) {
+			dmz_dev_err(dev, "NULL DM-Zoned uuid");
+			return -ENXIO;
+		}
+		uuid_copy(&zmd->dmz_uuid, (uuid_t *)sb->dmz_uuid);
+		memcpy(zmd->dmz_label, sb->dmz_label, BDEVNAME_SIZE);
+		if (uuid_is_null((uuid_t *)sb->dev_uuid)) {
+			dmz_dev_err(dev, "NULL device uuid");
+			return -ENXIO;
+		}
+		uuid_copy(&zmd->dev_uuid, (uuid_t *)sb->dev_uuid);
+
+	}
+
 	/* OK */
 	zmd->nr_meta_blocks = le32_to_cpu(sb->nr_meta_blocks);
 	zmd->nr_reserved_seq = le32_to_cpu(sb->nr_reserved_seq);
@@ -2460,9 +2497,18 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 		goto err;
 	}
 
+	dmz_dev_info(dev, "DM-Zoned version %d",
+		     uuid_is_null(&zmd->dmz_uuid) ?
+		     DMZ_META_COMPAT_VER : DMZ_META_VER);
+	if (!uuid_is_null(&zmd->dmz_uuid))
+		dmz_dev_info(dev, "DM UUID %pUl", &zmd->dmz_uuid);
+	if (strlen(zmd->dmz_label))
+		dmz_dev_info(dev, "DM Label %s", zmd->dmz_label);
 	dmz_dev_info(dev, "Host-%s zoned block device",
 		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
 		     "aware" : "managed");
+	if (!uuid_is_null(&zmd->dev_uuid))
+		dmz_dev_info(dev, "  uuid %pUl", &zmd->dev_uuid);
 	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
 		     (u64)dev->capacity);
 	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 44e30a7de8b9..7ec9dde24516 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -1008,7 +1008,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
 
 static struct target_type dmz_type = {
 	.name		 = "zoned",
-	.version	 = {1, 1, 0},
+	.version	 = {1, 2, 0},
 	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
 	.module		 = THIS_MODULE,
 	.ctr		 = dmz_ctr,
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

