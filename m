Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DA9B5129C50
	for <lists+dm-devel@lfdr.de>; Tue, 24 Dec 2019 02:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577149610;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SSMU4Lf6DUay/yBm+5qX1M9k5HMJAHW05DaaLK1TvBQ=;
	b=DNtmvgHZYTrdpPTTUABkKne8yisY9VWnIZWXeQc9x97h7ZeAj48neadokBpfpsLogRL1TU
	Ov17vPrxmPShvZxmQKKEswTrejKh8Nn/r3WdDAw9b6HZQ4nuRAO0E5Au8CU1Vru6Ny5nII
	Z7Ro7NaapD+PiidQLxtbVJb3CVAuHhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-hINHTo1BOQO8tRiYllQwmg-1; Mon, 23 Dec 2019 20:06:48 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D4D7184B459;
	Tue, 24 Dec 2019 01:06:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D8295DA32;
	Tue, 24 Dec 2019 01:06:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBF87825AB;
	Tue, 24 Dec 2019 01:06:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBO15s46020692 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Dec 2019 20:05:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9B82A637BD; Tue, 24 Dec 2019 01:05:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96C6C1DB2F
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 01:05:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BACFE800180
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 01:05:52 +0000 (UTC)
IronPort-SDR: hQVU4rLMSyJNc7pyTj3w4LFVamTwm77vp7mnnvWwxQ8XlBA6MswZHife4OBBepxUyG65otSfkS
	obRQKmN6tb68RgLjm1VTwcUPzt0fPssLR9KJFbdXZa334P5wv+z9+pSMcXARJQ09Gl0nm+iaYc
	pD9dyn2LC31dCxXmXUk5Xha3eoF8UAd50r2Jc1zADAh6mO/tk9p9/2rXactrwU73N597PZIGUJ
	bBVT//gn1PDOeCDNxQnBeT6Z5g8CdxVbrTNyCU7YO6duTRh/qW8Qwqzps1khN2yIWZ0jjwPwd4
	yls=
X-IronPort-AV: E=Sophos;i="5.69,349,1571673600"; d="scan'208";a="233677232"
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-228-oGzSYL4oN8KkgbBkXGswZg-1; Mon, 23 Dec 2019 20:05:50 -0500
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 24 Dec 2019 09:05:49 +0800
IronPort-SDR: 8XAuF73bkTI4P2cDdziCXwXYxZEhOJMSKHnabmV2FW8wz4LXaoQF5tMB6//fH+VqrcIa3W6eUB
	PwFB80+8qISC9DHuMErmnEZMhl9myl/cgc4U2aNlYHGv8EqQNgEJ0WzVKWp4Dx0iuWyz9s7Ubc
	r/6QxG+158dzctnDnKEFPA2oMC/05dW3PYqTQWoCcgfWB7LeqDZa54CcYwO21N6DyUnkh/Mmq0
	UZuFVw+7jaiv5abRMvSUa2nqLdpFrZWjmxzQhxLog7SRyheZLdpYWxyU9XmQbkBFPo1CHzlZZ6
	j6+6GW9b3u1VlWUVNw2gnYuB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	23 Dec 2019 17:00:03 -0800
IronPort-SDR: vfOUAtyGMKq98O3h7V4xwJ8q0S37aV27zQNZmrtmUb6J8Aj4K0La0HCRkcwue/WYI4CjOwexB8
	5T2rR9QCAIxB0ltHKGjg+8oO7EjdAf9RuLcDbw3qSopdxIOTXHYHdnUD8zJY4ej1GkNvJ9Brbk
	eLPy8bwHX+k0HLdTcV4oWtJaqCx2jpI+gD4BrhdpVnn59aPTwsD0jm5j9jRc6r3e6F56y9tFZA
	LB+u5+gH6EJod5u6koFbzBpeNANQp15t2UYjC0l647WSEJApdf7MfeTz5WR80rH0Hlo1ap2K2b
	Ckc=
WDCIronportException: Internal
Received: from dhcp-10-88-173-170.hgst.com (HELO localhost.localdomain)
	([10.88.173.170])
	by uls-op-cesaip02.wdc.com with ESMTP; 23 Dec 2019 17:05:48 -0800
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Mon, 23 Dec 2019 17:05:46 -0800
Message-Id: <20191224010546.20532-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-MC-Unique: oGzSYL4oN8KkgbBkXGswZg-1
X-MC-Unique: hINHTo1BOQO8tRiYllQwmg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBO15s46020692
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH] dm-zoned: support zone sizes smaller than 128MiB
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-zoned is observed to log failed kernel assertions and not to work
correctly when operating against a device with a zone size smaller
than 128MiB (4K block size times 32768 bits per 4K block). The reason
is that the bitmap size per zone is calculated as zero with such a
small zone size. This patch fixes this problem and also makes the code
related to zone bitmap management be able to handle per zone bitmaps
smaller than a single block.

A dm-zoned-tools patch is required to properly format dm-zoned devices
with zone sizes smaller than 128MiB and this patch is being posted
separately.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 069e4675da6b..91512eb40458 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -134,6 +134,7 @@ struct dmz_metadata {
 
 	sector_t		zone_bitmap_size;
 	unsigned int		zone_nr_bitmap_blocks;
+	unsigned int		zone_bits_per_mblk;
 
 	unsigned int		nr_bitmap_blocks;
 	unsigned int		nr_map_blocks;
@@ -1153,7 +1154,10 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 
 	/* Init */
 	zmd->zone_bitmap_size = dev->zone_nr_blocks >> 3;
-	zmd->zone_nr_bitmap_blocks = zmd->zone_bitmap_size >> DMZ_BLOCK_SHIFT;
+	zmd->zone_nr_bitmap_blocks =
+		max_t(sector_t, 1, zmd->zone_bitmap_size >> DMZ_BLOCK_SHIFT);
+	zmd->zone_bits_per_mblk = min_t(sector_t, dev->zone_nr_blocks,
+					DMZ_BLOCK_SIZE_BITS);
 
 	/* Allocate zone array */
 	zmd->zones = kcalloc(dev->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
@@ -1947,7 +1951,7 @@ int dmz_copy_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
 		dmz_release_mblock(zmd, to_mblk);
 		dmz_release_mblock(zmd, from_mblk);
 
-		chunk_block += DMZ_BLOCK_SIZE_BITS;
+		chunk_block += zmd->zone_bits_per_mblk;
 	}
 
 	to_zone->weight = from_zone->weight;
@@ -2008,7 +2012,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 
 		/* Set bits */
 		bit = chunk_block & DMZ_BLOCK_MASK_BITS;
-		nr_bits = min(nr_blocks, DMZ_BLOCK_SIZE_BITS - bit);
+		nr_bits = min(nr_blocks, zmd->zone_bits_per_mblk - bit);
 
 		count = dmz_set_bits((unsigned long *)mblk->data, bit, nr_bits);
 		if (count) {
@@ -2087,7 +2091,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
 
 		/* Clear bits */
 		bit = chunk_block & DMZ_BLOCK_MASK_BITS;
-		nr_bits = min(nr_blocks, DMZ_BLOCK_SIZE_BITS - bit);
+		nr_bits = min(nr_blocks, zmd->zone_bits_per_mblk - bit);
 
 		count = dmz_clear_bits((unsigned long *)mblk->data,
 				       bit, nr_bits);
@@ -2147,6 +2151,7 @@ static int dmz_to_next_set_block(struct dmz_metadata *zmd, struct dm_zone *zone,
 {
 	struct dmz_mblock *mblk;
 	unsigned int bit, set_bit, nr_bits;
+	unsigned int zone_bits = zmd->zone_bits_per_mblk;
 	unsigned long *bitmap;
 	int n = 0;
 
@@ -2161,15 +2166,15 @@ static int dmz_to_next_set_block(struct dmz_metadata *zmd, struct dm_zone *zone,
 		/* Get offset */
 		bitmap = (unsigned long *) mblk->data;
 		bit = chunk_block & DMZ_BLOCK_MASK_BITS;
-		nr_bits = min(nr_blocks, DMZ_BLOCK_SIZE_BITS - bit);
+		nr_bits = min(nr_blocks, zone_bits - bit);
 		if (set)
-			set_bit = find_next_bit(bitmap, DMZ_BLOCK_SIZE_BITS, bit);
+			set_bit = find_next_bit(bitmap, zone_bits, bit);
 		else
-			set_bit = find_next_zero_bit(bitmap, DMZ_BLOCK_SIZE_BITS, bit);
+			set_bit = find_next_zero_bit(bitmap, zone_bits, bit);
 		dmz_release_mblock(zmd, mblk);
 
 		n += set_bit - bit;
-		if (set_bit < DMZ_BLOCK_SIZE_BITS)
+		if (set_bit < zone_bits)
 			break;
 
 		nr_blocks -= nr_bits;
@@ -2272,7 +2277,7 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone)
 		/* Count bits in this block */
 		bitmap = mblk->data;
 		bit = chunk_block & DMZ_BLOCK_MASK_BITS;
-		nr_bits = min(nr_blocks, DMZ_BLOCK_SIZE_BITS - bit);
+		nr_bits = min(nr_blocks, zmd->zone_bits_per_mblk - bit);
 		n += dmz_count_bits(bitmap, bit, nr_bits);
 
 		dmz_release_mblock(zmd, mblk);
-- 
2.21.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

