Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 57AD71EBA1C
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 13:10:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591096247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CeeOD/KEZD7Mwlg3YN2wZVvSvFApeY0atWRRSHkXV2A=;
	b=U8u+6VkNHCINp40ZaBYZ4yzzpnlArEifeH4QnQPA4eUm8HGW/VCUQ9dHpyM0mWzvi6ncaJ
	rtAD944eXkg6jq0lWNft/BGNGdd812c8LBSFXnT0qeh3hhsdfY6y9gobKhfPuZev0BUHF4
	WH0ZxF6cORHS7sv8qIHOxCwOYkC/wrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-u4lN8Q9kO0StKVFgYRKyDA-1; Tue, 02 Jun 2020 07:10:45 -0400
X-MC-Unique: u4lN8Q9kO0StKVFgYRKyDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97013BFC7;
	Tue,  2 Jun 2020 11:10:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76AA15C1C5;
	Tue,  2 Jun 2020 11:10:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3445697016;
	Tue,  2 Jun 2020 11:10:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BAB8q027448 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:10:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7363F2156A4C; Tue,  2 Jun 2020 11:10:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F6472157F23
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55A5480066D
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:11 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-268-eJsSRkTCMxqIukJt3oYLMg-1;
	Tue, 02 Jun 2020 07:10:06 -0400
X-MC-Unique: eJsSRkTCMxqIukJt3oYLMg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 69679AEA2;
	Tue,  2 Jun 2020 11:10:05 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue,  2 Jun 2020 13:09:49 +0200
Message-Id: <20200602110956.121170-9-hare@suse.de>
In-Reply-To: <20200602110956.121170-1-hare@suse.de>
References: <20200602110956.121170-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 08/15] dm-zoned: add metadata pointer to struct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a metadata pointer to struct dmz_dev and use it as argument
for blkdev_report_zones() instead of the metadata itself.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 14 +++++++++-----
 drivers/md/dm-zoned.h          |  7 ++++---
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 45d6e96cb9a8..e22db3f19422 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1369,8 +1369,8 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
  */
 static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
 {
-	struct dmz_metadata *zmd = data;
-	struct dmz_dev *dev = zmd->nr_devs > 1 ? &zmd->dev[1] : &zmd->dev[0];
+	struct dmz_dev *dev = data;
+	struct dmz_metadata *zmd = dev->metadata;
 	int idx = num + dev->zone_offset;
 	struct dm_zone *zone;
 
@@ -1493,8 +1493,12 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 
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
@@ -1529,7 +1533,7 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 	 * first randomly writable zone.
 	 */
 	ret = blkdev_report_zones(zoned_dev->bdev, 0, BLK_ALL_ZONES,
-				  dmz_init_zone, zmd);
+				  dmz_init_zone, zoned_dev);
 	if (ret < 0) {
 		DMDEBUG("(%s): Failed to report zones, error %d",
 			zmd->devname, ret);
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 316344bf07bd..983f5b5e9fa0 100644
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
@@ -170,9 +174,6 @@ enum {
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

