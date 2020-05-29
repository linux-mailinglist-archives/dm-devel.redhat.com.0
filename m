Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B51C41E852F
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 19:39:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590773990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8x1o46Td9YQpYLKlhypr3USJ/gRi60WIFg9nkLwRgy8=;
	b=JnQ86LIVmC5/RMEzUKrnqC0QJDG7HBwuf1kQBMF2k7y8eRJEVRL6F9lz+NWyCTn7FlG5cO
	b8yw3FOE0CPnE1T00RtFw44kE+fGMKf0KRqhfiXMq9wUDb8bMrit3nBKJMBzxFmxsG9G3b
	Et5p1Gv7nGZHzEhLnWzVZyW06AZW3ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-Xo0R1xO9OwGVpF2DY0PNlQ-1; Fri, 29 May 2020 13:39:48 -0400
X-MC-Unique: Xo0R1xO9OwGVpF2DY0PNlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83165100CC8A;
	Fri, 29 May 2020 17:39:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60DF35C1B5;
	Fri, 29 May 2020 17:39:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B29C7CCC5;
	Fri, 29 May 2020 17:39:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04THdPtE004847 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 13:39:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC2C810BBCE1; Fri, 29 May 2020 17:39:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 906FB10BC2BE
	for <dm-devel@redhat.com>; Fri, 29 May 2020 17:39:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C116D81C88F
	for <dm-devel@redhat.com>; Fri, 29 May 2020 17:39:23 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-266-lWTnvLuFPJ-y2HK8DIh5XA-1;
	Fri, 29 May 2020 13:39:19 -0400
X-MC-Unique: lWTnvLuFPJ-y2HK8DIh5XA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B7747B1BE;
	Fri, 29 May 2020 17:39:15 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 29 May 2020 19:39:03 +0200
Message-Id: <20200529173907.40529-11-hare@suse.de>
In-Reply-To: <20200529173907.40529-1-hare@suse.de>
References: <20200529173907.40529-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 10/14] dm-zoned: move random and sequential zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Random and sequential zones should be part of the respective
device structure to make arbitration between devices possible.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 139 +++++++++++++++++++++++------------------
 drivers/md/dm-zoned-reclaim.c  |  15 +++--
 drivers/md/dm-zoned-target.c   |  25 ++++++--
 drivers/md/dm-zoned.h          |  18 ++++--
 4 files changed, 119 insertions(+), 78 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index e22db3f19422..044c152eb756 100644
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
 
@@ -279,14 +270,14 @@ unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
 	return zmd->nr_chunks;
 }
 
-unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd)
+unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd, int idx)
 {
-	return zmd->nr_rnd;
+	return zmd->dev[idx].nr_rnd;
 }
 
-unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
+unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd, int idx)
 {
-	return atomic_read(&zmd->unmap_nr_rnd);
+	return atomic_read(&zmd->dev[idx].unmap_nr_rnd);
 }
 
 unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd)
@@ -299,14 +290,14 @@ unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
 	return atomic_read(&zmd->unmap_nr_cache);
 }
 
-unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
+unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd, int idx)
 {
-	return zmd->nr_seq;
+	return zmd->dev[idx].nr_seq;
 }
 
-unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
+unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd, int idx)
 {
-	return atomic_read(&zmd->unmap_nr_seq);
+	return atomic_read(&zmd->dev[idx].unmap_nr_seq);
 }
 
 static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
@@ -1498,6 +1489,14 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 
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
@@ -1718,9 +1717,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
@@ -1754,7 +1753,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		if (dmz_is_cache(bzone))
 			list_add_tail(&bzone->link, &zmd->map_cache_list);
 		else
-			list_add_tail(&bzone->link, &zmd->map_rnd_list);
+			list_add_tail(&bzone->link, &bzone->dev->map_rnd_list);
 next:
 		chunk++;
 		e++;
@@ -1779,9 +1778,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
@@ -1795,16 +1794,18 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
 
@@ -1838,13 +1839,13 @@ static void __dmz_lru_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
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
 
@@ -1926,14 +1927,24 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
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
@@ -1954,12 +1965,17 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
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
@@ -2145,7 +2161,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 	if (dmz_is_cache(bzone))
 		list_add_tail(&bzone->link, &zmd->map_cache_list);
 	else
-		list_add_tail(&bzone->link, &zmd->map_rnd_list);
+		list_add_tail(&bzone->link, &bzone->dev->map_rnd_list);
 out:
 	dmz_unlock_map(zmd);
 
@@ -2160,21 +2176,27 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
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
@@ -2193,9 +2215,9 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
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
@@ -2225,14 +2247,14 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
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
@@ -2252,9 +2274,9 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *dzone,
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
@@ -2822,18 +2844,11 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
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
 
@@ -2902,10 +2917,14 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 		      zmd->nr_data_zones, zmd->nr_chunks);
 	dmz_zmd_debug(zmd, "    %u cache zones (%u unmapped)",
 		      zmd->nr_cache, atomic_read(&zmd->unmap_nr_cache));
-	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
-		      zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
-	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
-		      zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
+	for (i = 0; i < zmd->nr_devs; i++) {
+		dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
+			      dmz_nr_rnd_zones(zmd, i),
+			      dmz_nr_unmap_rnd_zones(zmd, i));
+		dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
+			      dmz_nr_seq_zones(zmd, i),
+			      dmz_nr_unmap_seq_zones(zmd, i));
+	}
 	dmz_zmd_debug(zmd, "  %u reserved sequential data zones",
 		      zmd->nr_reserved_seq);
 	dmz_zmd_debug(zmd, "Format:");
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 09843645248a..18edf1b9bf52 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -447,15 +447,14 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
 	unsigned int nr_cache = dmz_nr_cache_zones(zmd);
-	unsigned int nr_rnd = dmz_nr_rnd_zones(zmd);
 	unsigned int nr_unmap, nr_zones;
 
 	if (nr_cache) {
 		nr_zones = nr_cache;
 		nr_unmap = dmz_nr_unmap_cache_zones(zmd);
 	} else {
-		nr_zones = nr_rnd;
-		nr_unmap = dmz_nr_unmap_rnd_zones(zmd);
+		nr_zones = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
+		nr_unmap = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
 	}
 	return nr_unmap * 100 / nr_zones;
 }
@@ -467,7 +466,7 @@ static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
 {
 	unsigned int nr_reclaim;
 
-	nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);
+	nr_reclaim = dmz_nr_rnd_zones(zrc->metadata, zrc->dev_idx);
 
 	if (dmz_nr_cache_zones(zrc->metadata)) {
 		/*
@@ -528,8 +527,8 @@ static void dmz_reclaim_work(struct work_struct *work)
 		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
 	}
 
-	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd);
-	nr_rnd = dmz_nr_rnd_zones(zmd);
+	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
+	nr_rnd = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
 
 	DMDEBUG("(%s/%u): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
 		dmz_metadata_label(zmd), zrc->dev_idx,
@@ -537,8 +536,8 @@ static void dmz_reclaim_work(struct work_struct *work)
 		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
 		p_unmap, dmz_nr_unmap_cache_zones(zmd),
 		dmz_nr_cache_zones(zmd),
-		dmz_nr_unmap_rnd_zones(zmd),
-		dmz_nr_rnd_zones(zmd));
+		dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx),
+		dmz_nr_rnd_zones(zmd, zrc->dev_idx));
 
 	ret = dmz_do_reclaim(zrc);
 	if (ret && ret != -EINTR) {
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 97d63d8e6c19..aa3d26d16441 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -1075,17 +1075,30 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 	ssize_t sz = 0;
 	char buf[BDEVNAME_SIZE];
 	struct dmz_dev *dev;
+	int i;
 
 	switch (type) {
 	case STATUSTYPE_INFO:
-		DMEMIT("%u zones %u/%u cache %u/%u random %u/%u sequential",
+		DMEMIT("%u zones %u/%u cache",
 		       dmz_nr_zones(dmz->metadata),
 		       dmz_nr_unmap_cache_zones(dmz->metadata),
-		       dmz_nr_cache_zones(dmz->metadata),
-		       dmz_nr_unmap_rnd_zones(dmz->metadata),
-		       dmz_nr_rnd_zones(dmz->metadata),
-		       dmz_nr_unmap_seq_zones(dmz->metadata),
-		       dmz_nr_seq_zones(dmz->metadata));
+		       dmz_nr_cache_zones(dmz->metadata));
+		for (i = 0; i < DMZ_MAX_DEVS; i++) {
+			if (!dmz->ddev[i])
+				continue;
+			/*
+			 * For a multi-device setup the first device
+			 * contains only cache zones.
+			 */
+			if ((i == 0) &&
+			    (dmz_nr_cache_zones(dmz->metadata) > 0))
+				continue;
+			DMEMIT(" %u/%u random %u/%u sequential",
+			       dmz_nr_unmap_rnd_zones(dmz->metadata, i),
+			       dmz_nr_rnd_zones(dmz->metadata, i),
+			       dmz_nr_unmap_seq_zones(dmz->metadata, i),
+			       dmz_nr_seq_zones(dmz->metadata, i));
+		}
 		break;
 	case STATUSTYPE_TABLE:
 		dev = &dmz->dev[0];
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 0cc3459f78ce..f2a760f62db5 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -67,6 +67,16 @@ struct dmz_dev {
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
@@ -213,10 +223,10 @@ void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
 unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd);
-unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
-unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
-unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
-unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd);
+unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd, int idx);
+unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd, int idx);
+unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd, int idx);
+unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd, int idx);
 unsigned int dmz_zone_nr_blocks(struct dmz_metadata *zmd);
 unsigned int dmz_zone_nr_blocks_shift(struct dmz_metadata *zmd);
 unsigned int dmz_zone_nr_sectors(struct dmz_metadata *zmd);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

