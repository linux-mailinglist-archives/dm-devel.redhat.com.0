Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id D35361951CC
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 08:15:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585293333;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k+mrMmUFajASZTVK3p+I3KKufDLGUIg3t4K4z1E2/W0=;
	b=CLjQ0Ej05MVSu/kdWdopULN8AGJSvhwlSe2xoeqx5A9rhHAQVFhMuf8SVjTLsWlvDfkr72
	ru8mkVdOwBHGGN2EO7C5g/dUAWqLBoK6jPq9ndOZnZC/p+Dx746NauaQKq0Si5/acLbon5
	Msy6Ph9l/Ak3uXjf2m6L4o9Ny39v9M0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-YG8dfCYtNzSrYi59NsM6Iw-1; Fri, 27 Mar 2020 03:15:31 -0400
X-MC-Unique: YG8dfCYtNzSrYi59NsM6Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E66D8800D53;
	Fri, 27 Mar 2020 07:15:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3275E00A;
	Fri, 27 Mar 2020 07:15:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C52768A052;
	Fri, 27 Mar 2020 07:15:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02R7FF1x027381 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 03:15:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47B0B11F4BA; Fri, 27 Mar 2020 07:15:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3772711E1CE
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:15:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EF408007CB
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:15:12 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-1-qORwIfBHO3aUVkvhBFIgfg-1;
	Fri, 27 Mar 2020 03:15:10 -0400
X-MC-Unique: qORwIfBHO3aUVkvhBFIgfg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id AE5A3AF21;
	Fri, 27 Mar 2020 07:15:08 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 27 Mar 2020 08:14:57 +0100
Message-Id: <20200327071459.67796-3-hare@suse.de>
In-Reply-To: <20200327071459.67796-1-hare@suse.de>
References: <20200327071459.67796-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02R7FF1x027381
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/4] dm-zoned: use array for superblock zones
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

Instead of storing just the first superblock zone and calculate
the secondary relative to that we should be using an array for
holding the superblock zones.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index afce594067fb..dc1d17bc3bbb 100644
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
@@ -937,16 +937,20 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 
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
@@ -990,11 +994,9 @@ static int dmz_recover_mblocks(struct dmz_metadata *zmd, unsigned int dst_set)
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
@@ -1038,8 +1040,13 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
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
@@ -1051,8 +1058,9 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
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
@@ -1147,9 +1155,9 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
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
@@ -2420,7 +2428,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
 		goto err;
 
 	/* Set metadata zones starting from sb_zone */
-	zid = dmz_id(zmd, zmd->sb_zone);
+	zid = dmz_id(zmd, zmd->sb[0].zone);
 	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
 		zone = dmz_get(zmd, zid + i);
 		if (!dmz_is_rnd(zone))
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

