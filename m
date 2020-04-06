Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4A619FB73
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 19:27:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586194046;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B909eYRQV0xkwbiFlAvDPMzk9NILztKmnbqeOCASt/8=;
	b=AnbrAIxsNZT5MgWsDEW95KBf2tRls5rgMdIjndDQ6pjgVcu7WpZ2auTA/3L5IYFBtqWM6c
	hLiSoKEle0wgLt4d3oicDRj7AyvcOzkQe5LjbkbV5mur9YQTJo8MT8eWHIxFz6lP2rlPvv
	V2/Os+0nABS/PWE3P+ZeYiehIo3xKmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-RrtEAwEFPFW97tT0OY9kfg-1; Mon, 06 Apr 2020 13:27:23 -0400
X-MC-Unique: RrtEAwEFPFW97tT0OY9kfg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25CDE149C7;
	Mon,  6 Apr 2020 17:27:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF1195DA81;
	Mon,  6 Apr 2020 17:27:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81AE04E476;
	Mon,  6 Apr 2020 17:27:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036HR7I2032744 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 13:27:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F406B2166B2A; Mon,  6 Apr 2020 17:27:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED3782166B31
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:27:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46C898F3B8A
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:27:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-170-U8Vw4n5xPw-sahFX_XskzA-1;
	Mon, 06 Apr 2020 13:27:01 -0400
X-MC-Unique: U8Vw4n5xPw-sahFX_XskzA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 95FCCBA71;
	Mon,  6 Apr 2020 17:26:58 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon,  6 Apr 2020 16:35:02 +0200
Message-Id: <20200406143505.133271-9-hare@suse.de>
In-Reply-To: <20200406143505.133271-1-hare@suse.de>
References: <20200406143505.133271-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036HR7I2032744
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 08/11] dm-zoned: use dmz_zone_to_dev() when
	handling metadata I/O
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

Use accessors to retrieve the device pointer in preparation
for adding an additional block device.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 9919aa6210c1..08707c886ca2 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1310,6 +1310,7 @@ static int dmz_update_zone_cb(struct blk_zone *blkz, unsigned int idx,
  */
 static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
+	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int noio_flag;
 	int ret;
 
@@ -1320,16 +1321,16 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	 * GFP_NOIO was specified.
 	 */
 	noio_flag = memalloc_noio_save();
-	ret = blkdev_report_zones(zmd->dev->bdev, dmz_start_sect(zmd, zone), 1,
+	ret = blkdev_report_zones(dev->bdev, dmz_start_sect(zmd, zone), 1,
 				  dmz_update_zone_cb, zone);
 	memalloc_noio_restore(noio_flag);
 
 	if (ret == 0)
 		ret = -EIO;
 	if (ret < 0) {
-		dmz_dev_err(zmd->dev, "Get zone %u report failed",
+		dmz_dev_err(dev, "Get zone %u report failed",
 			    dmz_id(zmd, zone));
-		dmz_check_bdev(zmd->dev);
+		dmz_check_bdev(dev);
 		return ret;
 	}
 
@@ -1343,6 +1344,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 				    struct dm_zone *zone)
 {
+	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int wp = 0;
 	int ret;
 
@@ -1351,7 +1353,7 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 	if (ret)
 		return ret;
 
-	dmz_dev_warn(zmd->dev, "Processing zone %u write error (zone wp %u/%u)",
+	dmz_dev_warn(dev, "Processing zone %u write error (zone wp %u/%u)",
 		     dmz_id(zmd, zone), zone->wp_block, wp);
 
 	if (zone->wp_block < wp) {
@@ -1384,7 +1386,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		return 0;
 
 	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
-		struct dmz_dev *dev = zmd->dev;
+		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 
 		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
 				       dmz_start_sect(zmd, zone),
@@ -2098,12 +2100,13 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
 int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 			sector_t chunk_block, unsigned int nr_blocks)
 {
+	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int count, bit, nr_bits;
 	unsigned int zone_nr_blocks = zmd->zone_nr_blocks;
 	struct dmz_mblock *mblk;
 	unsigned int n = 0;
 
-	dmz_dev_debug(zmd->dev, "=> VALIDATE zone %u, block %llu, %u blocks",
+	dmz_dev_debug(dev, "=> VALIDATE zone %u, block %llu, %u blocks",
 		      dmz_id(zmd, zone), (unsigned long long)chunk_block,
 		      nr_blocks);
 
@@ -2133,7 +2136,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 	if (likely(zone->weight + n <= zone_nr_blocks))
 		zone->weight += n;
 	else {
-		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be <= %u",
+		dmz_dev_warn(dev, "Zone %u: weight %u should be <= %u",
 			     dmz_id(zmd, zone), zone->weight,
 			     zone_nr_blocks - n);
 		zone->weight = zone_nr_blocks;
@@ -2179,11 +2182,12 @@ static int dmz_clear_bits(unsigned long *bitmap, int bit, int nr_bits)
 int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 			  sector_t chunk_block, unsigned int nr_blocks)
 {
+	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int count, bit, nr_bits;
 	struct dmz_mblock *mblk;
 	unsigned int n = 0;
 
-	dmz_dev_debug(zmd->dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
+	dmz_dev_debug(dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
 		      dmz_id(zmd, zone), (u64)chunk_block, nr_blocks);
 
 	WARN_ON(chunk_block + nr_blocks > zmd->zone_nr_blocks);
@@ -2213,7 +2217,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 	if (zone->weight >= n)
 		zone->weight -= n;
 	else {
-		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be >= %u",
+		dmz_dev_warn(dev, "Zone %u: weight %u should be >= %u",
 			     dmz_id(zmd, zone), zone->weight, n);
 		zone->weight = 0;
 	}
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

