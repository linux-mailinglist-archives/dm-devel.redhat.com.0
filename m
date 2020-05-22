Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6751DEC33
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 17:39:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590161995;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IvWp6ziKV5oNsvC1N5TG105xpF/tFdnkACiTnTZBxZM=;
	b=YlYdDrUj18sDkNOqkTgg7Tz7AT7W+db3nXqUHmHpBPs/sWbC64l1FFn1Q+rhPGFVb8RVbo
	5DjJBfpvbkKyn5rhCkQOIYEkbQXZAVhDT5cUcVPzEe/DxiyU2Tnt4oJQpzP6kPzuyySdIV
	0cMb6Jqlsw+nLzsFzkI8nYKsLTXtQcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-LjZY0Ii3OaOrKkXruZJLQA-1; Fri, 22 May 2020 11:39:53 -0400
X-MC-Unique: LjZY0Ii3OaOrKkXruZJLQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C38731030934;
	Fri, 22 May 2020 15:39:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 428171053B2C;
	Fri, 22 May 2020 15:39:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 580AD54D0A;
	Fri, 22 May 2020 15:39:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MFdIJ3012627 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 11:39:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC598101B87A; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D882E1000D80
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB6DF10DCE7D
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-236-BAI3xgqkN9m2RlgpiZ8kwQ-1;
	Fri, 22 May 2020 11:39:14 -0400
X-MC-Unique: BAI3xgqkN9m2RlgpiZ8kwQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C45EDB229;
	Fri, 22 May 2020 15:39:12 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Fri, 22 May 2020 17:38:57 +0200
Message-Id: <20200522153901.133375-9-hare@suse.de>
In-Reply-To: <20200522153901.133375-1-hare@suse.de>
References: <20200522153901.133375-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 08/12] dm-zoned: move random and sequential zones
	into struct dmz_dev
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Random and sequential zones should be part of the respective
device structure to make arbitration between devices possible.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 143 +++++++++++++++++++++++++----------------
 drivers/md/dm-zoned.h          |  10 +++
 2 files changed, 99 insertions(+), 54 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 1b9da698a812..5f44970a6187 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -192,21 +192,12 @@ struct dmz_metadata {
 	/* Zone allocation management */
 	struct mutex		map_lock;
 	struct dmz_mblock	**map_mblk;
-	unsigned int		nr_rnd;
-	atomic_t		unmap_nr_rnd;
-	struct list_head	unmap_rnd_list;
-	struct list_head	map_rnd_list;
 
 	unsigned int		nr_cache;
 	atomic_t		unmap_nr_cache;
 	struct list_head	unmap_cache_list;
 	struct list_head	map_cache_list;
 
-	unsigned int		nr_seq;
-	atomic_t		unmap_nr_seq;
-	struct list_head	unmap_seq_list;
-	struct list_head	map_seq_list;
-
 	atomic_t		nr_reserved_seq_zones;
 	struct list_head	reserved_seq_zones_list;
 
@@ -281,12 +272,22 @@ unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
 
 unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd)
 {
-	return zmd->nr_rnd;
+	unsigned int nr_rnd_zones = 0;
+	int i;
+
+	for (i = 0; i < zmd->nr_devs; i++)
+		nr_rnd_zones += zmd->dev[i].nr_rnd;
+	return nr_rnd_zones;
 }
 
 unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
 {
-	return atomic_read(&zmd->unmap_nr_rnd);
+	unsigned int nr_unmap_rnd_zones = 0;
+	int i;
+
+	for (i = 0; i < zmd->nr_devs; i++)
+		nr_unmap_rnd_zones += atomic_read(&zmd->dev[i].unmap_nr_rnd);
+	return nr_unmap_rnd_zones;
 }
 
 unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd)
@@ -301,12 +302,22 @@ unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
 
 unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
 {
-	return zmd->nr_seq;
+	unsigned int nr_seq_zones = 0;
+	int i;
+
+	for (i = 0; i < zmd->nr_devs; i++)
+		nr_seq_zones += zmd->dev[i].nr_seq;
+	return nr_seq_zones;
 }
 
 unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
 {
-	return atomic_read(&zmd->unmap_nr_seq);
+	unsigned int nr_unmap_seq_zones = 0;
+	int i;
+
+	for (i = 0; i < zmd->nr_devs; i++)
+		nr_unmap_seq_zones += atomic_read(&zmd->dev[i].unmap_nr_seq);
+	return nr_unmap_seq_zones;
 }
 
 static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
@@ -1485,6 +1496,14 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 
 		dev->metadata = zmd;
 		zmd->nr_zones += dev->nr_zones;
+
+		atomic_set(&dev->unmap_nr_rnd, 0);
+		INIT_LIST_HEAD(&dev->unmap_rnd_list);
+		INIT_LIST_HEAD(&dev->map_rnd_list);
+
+		atomic_set(&dev->unmap_nr_seq, 0);
+		INIT_LIST_HEAD(&dev->unmap_seq_list);
+		INIT_LIST_HEAD(&dev->map_seq_list);
 	}
 
 	if (!zmd->nr_zones) {
@@ -1702,9 +1721,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		if (dmz_is_cache(dzone))
 			list_add_tail(&dzone->link, &zmd->map_cache_list);
 		else if (dmz_is_rnd(dzone))
-			list_add_tail(&dzone->link, &zmd->map_rnd_list);
+			list_add_tail(&dzone->link, &dzone->dev->map_rnd_list);
 		else
-			list_add_tail(&dzone->link, &zmd->map_seq_list);
+			list_add_tail(&dzone->link, &dzone->dev->map_seq_list);
 
 		/* Check buffer zone */
 		bzone_id = le32_to_cpu(dmap[e].bzone_id);
@@ -1738,7 +1757,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		if (dmz_is_cache(bzone))
 			list_add_tail(&bzone->link, &zmd->map_cache_list);
 		else
-			list_add_tail(&bzone->link, &zmd->map_rnd_list);
+			list_add_tail(&bzone->link, &bzone->dev->map_rnd_list);
 next:
 		chunk++;
 		e++;
@@ -1763,9 +1782,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		if (dmz_is_cache(dzone))
 			zmd->nr_cache++;
 		else if (dmz_is_rnd(dzone))
-			zmd->nr_rnd++;
+			dzone->dev->nr_rnd++;
 		else
-			zmd->nr_seq++;
+			dzone->dev->nr_seq++;
 
 		if (dmz_is_data(dzone)) {
 			/* Already initialized */
@@ -1779,16 +1798,18 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 			list_add_tail(&dzone->link, &zmd->unmap_cache_list);
 			atomic_inc(&zmd->unmap_nr_cache);
 		} else if (dmz_is_rnd(dzone)) {
-			list_add_tail(&dzone->link, &zmd->unmap_rnd_list);
-			atomic_inc(&zmd->unmap_nr_rnd);
+			list_add_tail(&dzone->link,
+				      &dzone->dev->unmap_rnd_list);
+			atomic_inc(&dzone->dev->unmap_nr_rnd);
 		} else if (atomic_read(&zmd->nr_reserved_seq_zones) < zmd->nr_reserved_seq) {
 			list_add_tail(&dzone->link, &zmd->reserved_seq_zones_list);
 			set_bit(DMZ_RESERVED, &dzone->flags);
 			atomic_inc(&zmd->nr_reserved_seq_zones);
-			zmd->nr_seq--;
+			dzone->dev->nr_seq--;
 		} else {
-			list_add_tail(&dzone->link, &zmd->unmap_seq_list);
-			atomic_inc(&zmd->unmap_nr_seq);
+			list_add_tail(&dzone->link,
+				      &dzone->dev->unmap_seq_list);
+			atomic_inc(&dzone->dev->unmap_nr_seq);
 		}
 	}
 
@@ -1822,13 +1843,13 @@ static void __dmz_lru_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	list_del_init(&zone->link);
 	if (dmz_is_seq(zone)) {
 		/* LRU rotate sequential zone */
-		list_add_tail(&zone->link, &zmd->map_seq_list);
+		list_add_tail(&zone->link, &zone->dev->map_seq_list);
 	} else if (dmz_is_cache(zone)) {
 		/* LRU rotate cache zone */
 		list_add_tail(&zone->link, &zmd->map_cache_list);
 	} else {
 		/* LRU rotate random zone */
-		list_add_tail(&zone->link, &zmd->map_rnd_list);
+		list_add_tail(&zone->link, &zone->dev->map_rnd_list);
 	}
 }
 
@@ -1910,14 +1931,24 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
 {
 	struct dm_zone *dzone = NULL;
 	struct dm_zone *zone;
-	struct list_head *zone_list = &zmd->map_rnd_list;
+	struct list_head *zone_list;
 
 	/* If we have cache zones select from the cache zone list */
 	if (zmd->nr_cache) {
 		zone_list = &zmd->map_cache_list;
 		/* Try to relaim random zones, too, when idle */
-		if (idle && list_empty(zone_list))
-			zone_list = &zmd->map_rnd_list;
+		if (idle && list_empty(zone_list)) {
+			int i;
+
+			for (i = 1; i < zmd->nr_devs; i++) {
+				zone_list = &zmd->dev[i].map_rnd_list;
+				if (!list_empty(zone_list))
+					break;
+			}
+		}
+	} else {
+		/* Otherwise the random zones are on the first disk */
+		zone_list = &zmd->dev[0].map_rnd_list;
 	}
 
 	list_for_each_entry(zone, zone_list, link) {
@@ -1938,12 +1969,17 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
 static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 {
 	struct dm_zone *zone;
+	int i;
 
-	list_for_each_entry(zone, &zmd->map_seq_list, link) {
-		if (!zone->bzone)
-			continue;
-		if (dmz_lock_zone_reclaim(zone))
-			return zone;
+	for (i = 0; i < zmd->nr_devs; i++) {
+		struct dmz_dev *dev = &zmd->dev[i];
+
+		list_for_each_entry(zone, &dev->map_seq_list, link) {
+			if (!zone->bzone)
+				continue;
+			if (dmz_lock_zone_reclaim(zone))
+				return zone;
+		}
 	}
 
 	return NULL;
@@ -2129,7 +2165,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 	if (dmz_is_cache(bzone))
 		list_add_tail(&bzone->link, &zmd->map_cache_list);
 	else
-		list_add_tail(&bzone->link, &zmd->map_rnd_list);
+		list_add_tail(&bzone->link, &bzone->dev->map_rnd_list);
 out:
 	dmz_unlock_map(zmd);
 
@@ -2144,21 +2180,27 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 {
 	struct list_head *list;
 	struct dm_zone *zone;
+	unsigned int dev_idx = 0;
 
+again:
 	if (flags & DMZ_ALLOC_CACHE)
 		list = &zmd->unmap_cache_list;
 	else if (flags & DMZ_ALLOC_RND)
-		list = &zmd->unmap_rnd_list;
+		list = &zmd->dev[dev_idx].unmap_rnd_list;
 	else
-		list = &zmd->unmap_seq_list;
+		list = &zmd->dev[dev_idx].unmap_seq_list;
 
-again:
 	if (list_empty(list)) {
 		/*
 		 * No free zone: return NULL if this is for not reclaim.
 		 */
 		if (!(flags & DMZ_ALLOC_RECLAIM))
 			return NULL;
+		if (dev_idx < zmd->nr_devs) {
+			dev_idx++;
+			goto again;
+		}
+
 		/*
 		 * Fallback to the reserved sequential zones
 		 */
@@ -2177,9 +2219,9 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 	if (dmz_is_cache(zone))
 		atomic_dec(&zmd->unmap_nr_cache);
 	else if (dmz_is_rnd(zone))
-		atomic_dec(&zmd->unmap_nr_rnd);
+		atomic_dec(&zone->dev->unmap_nr_rnd);
 	else
-		atomic_dec(&zmd->unmap_nr_seq);
+		atomic_dec(&zone->dev->unmap_nr_seq);
 
 	if (dmz_is_offline(zone)) {
 		dmz_zmd_warn(zmd, "Zone %u is offline", zone->id);
@@ -2209,14 +2251,14 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		list_add_tail(&zone->link, &zmd->unmap_cache_list);
 		atomic_inc(&zmd->unmap_nr_cache);
 	} else if (dmz_is_rnd(zone)) {
-		list_add_tail(&zone->link, &zmd->unmap_rnd_list);
-		atomic_inc(&zmd->unmap_nr_rnd);
+		list_add_tail(&zone->link, &zone->dev->unmap_rnd_list);
+		atomic_inc(&zone->dev->unmap_nr_rnd);
 	} else if (dmz_is_reserved(zone)) {
 		list_add_tail(&zone->link, &zmd->reserved_seq_zones_list);
 		atomic_inc(&zmd->nr_reserved_seq_zones);
 	} else {
-		list_add_tail(&zone->link, &zmd->unmap_seq_list);
-		atomic_inc(&zmd->unmap_nr_seq);
+		list_add_tail(&zone->link, &zone->dev->unmap_seq_list);
+		atomic_inc(&zone->dev->unmap_nr_seq);
 	}
 
 	wake_up_all(&zmd->free_wq);
@@ -2236,9 +2278,9 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *dzone,
 	if (dmz_is_cache(dzone))
 		list_add_tail(&dzone->link, &zmd->map_cache_list);
 	else if (dmz_is_rnd(dzone))
-		list_add_tail(&dzone->link, &zmd->map_rnd_list);
+		list_add_tail(&dzone->link, &dzone->dev->map_rnd_list);
 	else
-		list_add_tail(&dzone->link, &zmd->map_seq_list);
+		list_add_tail(&dzone->link, &dzone->dev->map_seq_list);
 }
 
 /*
@@ -2806,18 +2848,11 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 	INIT_LIST_HEAD(&zmd->mblk_dirty_list);
 
 	mutex_init(&zmd->map_lock);
-	atomic_set(&zmd->unmap_nr_rnd, 0);
-	INIT_LIST_HEAD(&zmd->unmap_rnd_list);
-	INIT_LIST_HEAD(&zmd->map_rnd_list);
 
 	atomic_set(&zmd->unmap_nr_cache, 0);
 	INIT_LIST_HEAD(&zmd->unmap_cache_list);
 	INIT_LIST_HEAD(&zmd->map_cache_list);
 
-	atomic_set(&zmd->unmap_nr_seq, 0);
-	INIT_LIST_HEAD(&zmd->unmap_seq_list);
-	INIT_LIST_HEAD(&zmd->map_seq_list);
-
 	atomic_set(&zmd->nr_reserved_seq_zones, 0);
 	INIT_LIST_HEAD(&zmd->reserved_seq_zones_list);
 
@@ -2887,9 +2922,9 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 	dmz_zmd_debug(zmd, "    %u cache zones (%u unmapped)",
 		      zmd->nr_cache, atomic_read(&zmd->unmap_nr_cache));
 	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
-		      zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
+		      dmz_nr_rnd_zones(zmd), dmz_nr_unmap_rnd_zones(zmd));
 	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
-		      zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
+		      dmz_nr_seq_zones(zmd), dmz_nr_unmap_seq_zones(zmd));
 	dmz_zmd_debug(zmd, "  %u reserved sequential data zones",
 		      zmd->nr_reserved_seq);
 	dmz_zmd_debug(zmd, "Format:");
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 983f5b5e9fa0..56e138586d9b 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -66,6 +66,16 @@ struct dmz_dev {
 	unsigned int		flags;
 
 	sector_t		zone_nr_sectors;
+
+	unsigned int		nr_rnd;
+	atomic_t		unmap_nr_rnd;
+	struct list_head	unmap_rnd_list;
+	struct list_head	map_rnd_list;
+
+	unsigned int		nr_seq;
+	atomic_t		unmap_nr_seq;
+	struct list_head	unmap_seq_list;
+	struct list_head	map_seq_list;
 };
 
 #define dmz_bio_chunk(zmd, bio)	((bio)->bi_iter.bi_sector >> \
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

