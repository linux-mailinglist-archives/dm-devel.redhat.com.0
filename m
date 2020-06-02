Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 28B951EBA1A
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 13:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591096246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SLV1RsE+sGKKgjsuUM+o5DD00uZl9UY2/PEMBhpvtiI=;
	b=Lxtm8AmopZTgmcMU0KhX/i8LNWKDCtAsk+jrzdpKJX1qMZAaOl7K6Ml+aWuiy/MIpEx0Sd
	ZL5IjxehfIDkmsveYr27tQjeeS5FCM4S2EWTZWCelbEbZQ3gj73qiFFKU8ZuWT3UjApz15
	MNwI/N72UVmIiNa16fuvZNlm7E2xtO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-H8O4kjkaMMamXT-t3KzVrQ-1; Tue, 02 Jun 2020 07:10:43 -0400
X-MC-Unique: H8O4kjkaMMamXT-t3KzVrQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80F1A100CCC8;
	Tue,  2 Jun 2020 11:10:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60DA17A8C1;
	Tue,  2 Jun 2020 11:10:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19B0597019;
	Tue,  2 Jun 2020 11:10:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BACtU027461 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:10:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 956092026D67; Tue,  2 Jun 2020 11:10:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 915852026971
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C083D82849B
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-75-Fl6PJyAWMsS5YIJ42R1FWw-1;
	Tue, 02 Jun 2020 07:10:06 -0400
X-MC-Unique: Fl6PJyAWMsS5YIJ42R1FWw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6E065AEDA;
	Tue,  2 Jun 2020 11:10:05 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue,  2 Jun 2020 13:09:54 +0200
Message-Id: <20200602110956.121170-14-hare@suse.de>
In-Reply-To: <20200602110956.121170-1-hare@suse.de>
References: <20200602110956.121170-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 13/15] dm-zoned: select reclaim zone based on
	device index
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

per-device reclaim should select zones on that device only.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 50 +++++++++++++++++-------------------------
 drivers/md/dm-zoned-reclaim.c  |  3 ++-
 drivers/md/dm-zoned-target.c   |  1 +
 drivers/md/dm-zoned.h          |  5 ++++-
 4 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 7f46b2ea554c..6c8d4ddd8b27 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1936,7 +1936,7 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
  * Select a cache or random write zone for reclaim.
  */
 static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
-						    bool idle)
+						    unsigned int idx, bool idle)
 {
 	struct dm_zone *dzone = NULL;
 	struct dm_zone *zone;
@@ -1946,24 +1946,17 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
 	if (zmd->nr_cache) {
 		zone_list = &zmd->map_cache_list;
 		/* Try to relaim random zones, too, when idle */
-		if (idle && list_empty(zone_list)) {
-			int i;
-
-			for (i = 1; i < zmd->nr_devs; i++) {
-				zone_list = &zmd->dev[i].map_rnd_list;
-				if (!list_empty(zone_list))
-					break;
-			}
-		}
-	} else {
-		/* Otherwise the random zones are on the first disk */
-		zone_list = &zmd->dev[0].map_rnd_list;
-	}
+		if (idle && list_empty(zone_list))
+			zone_list = &zmd->dev[idx].map_rnd_list;
+	} else
+		zone_list = &zmd->dev[idx].map_rnd_list;
 
 	list_for_each_entry(zone, zone_list, link) {
-		if (dmz_is_buf(zone))
+		if (dmz_is_buf(zone)) {
 			dzone = zone->bzone;
-		else
+			if (dzone->dev->dev_idx != idx)
+				continue;
+		} else
 			dzone = zone;
 		if (dmz_lock_zone_reclaim(dzone))
 			return dzone;
@@ -1975,20 +1968,16 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
 /*
  * Select a buffered sequential zone for reclaim.
  */
-static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
+static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd,
+						    unsigned int idx)
 {
 	struct dm_zone *zone;
-	int i;
-
-	for (i = 0; i < zmd->nr_devs; i++) {
-		struct dmz_dev *dev = &zmd->dev[i];
 
-		list_for_each_entry(zone, &dev->map_seq_list, link) {
-			if (!zone->bzone)
-				continue;
-			if (dmz_lock_zone_reclaim(zone))
-				return zone;
-		}
+	list_for_each_entry(zone, &zmd->dev[idx].map_seq_list, link) {
+		if (!zone->bzone)
+			continue;
+		if (dmz_lock_zone_reclaim(zone))
+			return zone;
 	}
 
 	return NULL;
@@ -1997,7 +1986,8 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 /*
  * Select a zone for reclaim.
  */
-struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle)
+struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd,
+					 unsigned int dev_idx, bool idle)
 {
 	struct dm_zone *zone;
 
@@ -2011,9 +2001,9 @@ struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle)
 	 */
 	dmz_lock_map(zmd);
 	if (list_empty(&zmd->reserved_seq_zones_list))
-		zone = dmz_get_seq_zone_for_reclaim(zmd);
+		zone = dmz_get_seq_zone_for_reclaim(zmd, dev_idx);
 	else
-		zone = dmz_get_rnd_zone_for_reclaim(zmd, idle);
+		zone = dmz_get_rnd_zone_for_reclaim(zmd, dev_idx, idle);
 	dmz_unlock_map(zmd);
 
 	return zone;
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 5a04e34d17a9..2261b4dd60b7 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -370,7 +370,8 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 	int ret;
 
 	/* Get a data zone */
-	dzone = dmz_get_zone_for_reclaim(zmd, dmz_target_idle(zrc));
+	dzone = dmz_get_zone_for_reclaim(zmd, zrc->dev_idx,
+					 dmz_target_idle(zrc));
 	if (!dzone) {
 		DMDEBUG("(%s/%u): No zone found to reclaim",
 			dmz_metadata_label(zmd), zrc->dev_idx);
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 4a51738d4b0d..a23f1fbd208f 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -738,6 +738,7 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path,
 		dev = &dmz->dev[idx];
 	}
 	dev->bdev = bdev;
+	dev->dev_idx = idx;
 	(void)bdevname(dev->bdev, dev->name);
 
 	dev->capacity = i_size_read(bdev->bd_inode) >> SECTOR_SHIFT;
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index ec020bb1caf7..22f11440b423 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -61,6 +61,8 @@ struct dmz_dev {
 
 	sector_t		capacity;
 
+	unsigned int		dev_idx;
+
 	unsigned int		nr_zones;
 	unsigned int		zone_offset;
 
@@ -243,7 +245,8 @@ static inline void dmz_activate_zone(struct dm_zone *zone)
 
 int dmz_lock_zone_reclaim(struct dm_zone *zone);
 void dmz_unlock_zone_reclaim(struct dm_zone *zone);
-struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle);
+struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd,
+					 unsigned int dev_idx, bool idle);
 
 struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd,
 				      unsigned int chunk, int op);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

