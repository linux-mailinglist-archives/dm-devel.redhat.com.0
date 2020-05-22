Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 898771DEC38
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 17:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590162009;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4P2KVGLZPU7rzarjoqkPJ6QlaGTpesCDRlGqNgPnzdU=;
	b=YIoUj0kEve5vrGxQrq2lDgXgYuRLF3cqqfBYWL5ABVGS6PsqcsvDaXH2fzVvRRhg7uC2c5
	2SRyDdPgPEiUNSOSnYuMQGaRa62dUYMtf7HtdSDU3NADQvCaZmsY5HDKq3umSV4Kj5tRXS
	KvxvJ/MBIDM4Vf+3aFPBYEiTZVh8pv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-X8EI6SKeORO27rpaaDVrBw-1; Fri, 22 May 2020 11:40:04 -0400
X-MC-Unique: X8EI6SKeORO27rpaaDVrBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CA511855A23;
	Fri, 22 May 2020 15:39:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3725D9D5;
	Fri, 22 May 2020 15:39:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 795C71809543;
	Fri, 22 May 2020 15:39:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MFdIgi012605 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 11:39:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CADF1000D80; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56142101B87A
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1168D10DCE82
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-173-a05I9UigOQezlgyOr4GYPw-1;
	Fri, 22 May 2020 11:39:13 -0400
X-MC-Unique: a05I9UigOQezlgyOr4GYPw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C497BB22A;
	Fri, 22 May 2020 15:39:12 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Fri, 22 May 2020 17:38:55 +0200
Message-Id: <20200522153901.133375-7-hare@suse.de>
In-Reply-To: <20200522153901.133375-1-hare@suse.de>
References: <20200522153901.133375-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 06/12] dm-zoned: add metadata pointer to struct
	dmz_dev
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

Add a metadata pointer to struct dmz_dev and use it as argument
for blkdev_report_zones() instead of the metadata itself.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 14 +++++++++-----
 drivers/md/dm-zoned.h          |  7 ++++---
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 7b6e7404f1e8..73479b4c8bca 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1343,8 +1343,8 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
  */
 static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
 {
-	struct dmz_metadata *zmd = data;
-	struct dmz_dev *dev = zmd->nr_devs > 1 ? &zmd->dev[1] : &zmd->dev[0];
+	struct dmz_dev *dev = data;
+	struct dmz_metadata *zmd = dev->metadata;
 	int idx = num + dev->zone_offset;
 	struct dm_zone *zone = kzalloc(sizeof(struct dm_zone), GFP_KERNEL);
 
@@ -1480,8 +1480,12 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 
 	/* Allocate zone array */
 	zmd->nr_zones = 0;
-	for (i = 0; i < zmd->nr_devs; i++)
-		zmd->nr_zones += zmd->dev[i].nr_zones;
+	for (i = 0; i < zmd->nr_devs; i++) {
+		struct dmz_dev *dev = &zmd->dev[i];
+
+		dev->metadata = zmd;
+		zmd->nr_zones += dev->nr_zones;
+	}
 
 	if (!zmd->nr_zones) {
 		DMERR("(%s): No zones found", zmd->devname);
@@ -1516,7 +1520,7 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 	 * first randomly writable zone.
 	 */
 	ret = blkdev_report_zones(zoned_dev->bdev, 0, BLK_ALL_ZONES,
-				  dmz_init_zone, zmd);
+				  dmz_init_zone, zoned_dev);
 	if (ret < 0) {
 		DMDEBUG("(%s): Failed to report zones, error %d",
 			zmd->devname, ret);
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 356b436425e4..dab701893b67 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -45,11 +45,15 @@
 #define dmz_bio_block(bio)	dmz_sect2blk((bio)->bi_iter.bi_sector)
 #define dmz_bio_blocks(bio)	dmz_sect2blk(bio_sectors(bio))
 
+struct dmz_metadata;
+struct dmz_reclaim;
+
 /*
  * Zoned block device information.
  */
 struct dmz_dev {
 	struct block_device	*bdev;
+	struct dmz_metadata	*metadata;
 
 	char			name[BDEVNAME_SIZE];
 	uuid_t			uuid;
@@ -168,9 +172,6 @@ enum {
 #define dmz_dev_debug(dev, format, args...)	\
 	DMDEBUG("(%s): " format, (dev)->name, ## args)
 
-struct dmz_metadata;
-struct dmz_reclaim;
-
 /*
  * Functions defined in dm-zoned-metadata.c
  */
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

