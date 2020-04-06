Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADBE19FB6F
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 19:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586194040;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RBtP3pJwYssUSxy9VORqzx5gIyF/CuWw2NnAgzf/+tM=;
	b=TifpDB2rWsrYT5ENqzuzgIi3/bAhFcEZfku2jjNj+mlSXSXiAxe+GCErp3wIFlqkyto3uI
	RMCn2Bjslmeq1QNhLaM4sCGoXSi12wPJ+CPsjm2CBq3rJj0Vczhld/g32mFNKfYEROyBr8
	+N+9oOqZ6UAqCrjdL3DNuzFU0MVaaso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-P25IVP7UOk2je9u__Tousg-1; Mon, 06 Apr 2020 13:27:17 -0400
X-MC-Unique: P25IVP7UOk2je9u__Tousg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73841149E8;
	Mon,  6 Apr 2020 17:27:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC3F59D36D;
	Mon,  6 Apr 2020 17:27:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A4F318089C8;
	Mon,  6 Apr 2020 17:27:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036HQpmK032706 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 13:26:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2ADDC6128; Mon,  6 Apr 2020 17:26:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE4DDC6132
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:26:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 197FF1017E41
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:26:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-424-zfLwVy1nPe-CLMMeC4A-LQ-1;
	Mon, 06 Apr 2020 13:26:46 -0400
X-MC-Unique: zfLwVy1nPe-CLMMeC4A-LQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 0AED4B46C;
	Mon,  6 Apr 2020 17:26:44 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon,  6 Apr 2020 16:34:56 +0200
Message-Id: <20200406143505.133271-3-hare@suse.de>
In-Reply-To: <20200406143505.133271-1-hare@suse.de>
References: <20200406143505.133271-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036HQpmK032706
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 02/11] dm-zoned: use array for superblock zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of storing just the first superblock zone and calculate
the secondary relative to that we should be using an array for
holding the superblock zones.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 41 +++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index afce594067fb..b37d3faec518 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -124,6 +124,7 @@ struct dmz_sb {
 	sector_t		block;
 	struct dmz_mblock	*mblk;
 	struct dmz_super	*sb;
+	struct dm_zone		*zone;
 };
 
 /*
@@ -150,7 +151,6 @@ struct dmz_metadata {
 	/* Zone information array */
 	struct dm_zone		*zones;
 
-	struct dm_zone		*sb_zone;
 	struct dmz_sb		sb[2];
 	unsigned int		mblk_primary;
 	u64			sb_gen;
@@ -844,8 +844,9 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 /*
  * Check super block.
  */
-static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_super *sb)
+static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
 {
+	struct dmz_super *sb = zmd->sb[set].sb;
 	unsigned int nr_meta_zones, nr_data_zones;
 	struct dmz_dev *dev = zmd->dev;
 	u32 crc, stored_crc;
@@ -937,16 +938,20 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 
 	/* Bad first super block: search for the second one */
 	zmd->sb[1].block = zmd->sb[0].block + zone_nr_blocks;
+	zmd->sb[1].zone = zmd->sb[0].zone + 1;
 	for (i = 0; i < zmd->nr_rnd_zones - 1; i++) {
 		if (dmz_read_sb(zmd, 1) != 0)
 			break;
-		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC)
+		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC) {
+			zmd->sb[1].zone += i;
 			return 0;
+		}
 		zmd->sb[1].block += zone_nr_blocks;
 	}
 
 	dmz_free_mblock(zmd, mblk);
 	zmd->sb[1].mblk = NULL;
+	zmd->sb[1].zone = NULL;
 
 	return -EIO;
 }
@@ -990,11 +995,9 @@ static int dmz_recover_mblocks(struct dmz_metadata *zmd, unsigned int dst_set)
 	dmz_dev_warn(zmd->dev, "Metadata set %u invalid: recovering", dst_set);
 
 	if (dst_set == 0)
-		zmd->sb[0].block = dmz_start_block(zmd, zmd->sb_zone);
-	else {
-		zmd->sb[1].block = zmd->sb[0].block +
-			(zmd->nr_meta_zones << zmd->dev->zone_nr_blocks_shift);
-	}
+		zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
+	else
+		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
 
 	page = alloc_page(GFP_NOIO);
 	if (!page)
@@ -1038,21 +1041,27 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 	u64 sb_gen[2] = {0, 0};
 	int ret;
 
+	if (!zmd->sb[0].zone) {
+		dmz_dev_err(zmd->dev, "Primary super block zone not set");
+		return -ENXIO;
+	}
+
 	/* Read and check the primary super block */
-	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb_zone);
+	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
 	ret = dmz_get_sb(zmd, 0);
 	if (ret) {
 		dmz_dev_err(zmd->dev, "Read primary super block failed");
 		return ret;
 	}
 
-	ret = dmz_check_sb(zmd, zmd->sb[0].sb);
+	ret = dmz_check_sb(zmd, 0);
 
 	/* Read and check secondary super block */
 	if (ret == 0) {
 		sb_good[0] = true;
-		zmd->sb[1].block = zmd->sb[0].block +
-			(zmd->nr_meta_zones << zmd->dev->zone_nr_blocks_shift);
+		if (!zmd->sb[1].zone)
+			zmd->sb[1].zone = zmd->sb[0].zone + zmd->nr_meta_zones;
+		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
 		ret = dmz_get_sb(zmd, 1);
 	} else
 		ret = dmz_lookup_secondary_sb(zmd);
@@ -1062,7 +1071,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 		return ret;
 	}
 
-	ret = dmz_check_sb(zmd, zmd->sb[1].sb);
+	ret = dmz_check_sb(zmd, 1);
 	if (ret == 0)
 		sb_good[1] = true;
 
@@ -1147,9 +1156,9 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
 		zmd->nr_useable_zones++;
 		if (dmz_is_rnd(zone)) {
 			zmd->nr_rnd_zones++;
-			if (!zmd->sb_zone) {
+			if (!zmd->sb[0].zone) {
 				/* Super block zone */
-				zmd->sb_zone = zone;
+				zmd->sb[0].zone = zone;
 			}
 		}
 	}
@@ -2420,7 +2429,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 		goto err;
 
 	/* Set metadata zones starting from sb_zone */
-	zid = dmz_id(zmd, zmd->sb_zone);
+	zid = dmz_id(zmd, zmd->sb[0].zone);
 	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
 		zone = dmz_get(zmd, zid + i);
 		if (!dmz_is_rnd(zone))
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

