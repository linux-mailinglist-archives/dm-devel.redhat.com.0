Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3261D91E0
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 10:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589876120;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lrq491lcL+g0H8XYTMu99uQ7lmEuSdVJFMJzTzFzpaU=;
	b=BgB+mWdUOUXf9NCG9P57PFu2S4xMmHOwEX2O4joCnb9tUBhf3JiJEhw+Ma7PLYIDMFtyjY
	9SyRibyzOQ/sFiLFMcKgCE0VFjSaU5keTL5PB0W6/vQV48MJTfo+AmCk5a3rml/NPHAdAL
	CEYTsWyrmrJHwkHk1HSy/57A0Tqbis4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-usTceXUpMTqu3mIT22pfqQ-1; Tue, 19 May 2020 04:15:18 -0400
X-MC-Unique: usTceXUpMTqu3mIT22pfqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9833BFC6;
	Tue, 19 May 2020 08:15:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C341960FB9;
	Tue, 19 May 2020 08:15:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B5704ED5B;
	Tue, 19 May 2020 08:15:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J8EqLL030986 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 04:14:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 794A42166BA3; Tue, 19 May 2020 08:14:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 752782166BA2
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2090101A526
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-434-yuFidmDuNJW-aH6bg_XL1Q-1;
	Tue, 19 May 2020 04:14:42 -0400
X-MC-Unique: yuFidmDuNJW-aH6bg_XL1Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 90E7DAF17;
	Tue, 19 May 2020 08:14:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 19 May 2020 10:14:20 +0200
Message-Id: <20200519081424.103318-3-hare@suse.de>
In-Reply-To: <20200519081424.103318-1-hare@suse.de>
References: <20200519081424.103318-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/6] dm-zoned: separate random and cache zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of lumping emulated zones together with random zones we
should be handling them as separate 'cache' zones. This improves
code readability and allows to for an easier implementation of
different cache policies.
This patch also add additional allocation flags, to separate
the type (cache, random, or sequential) from the purpose
(eg reclaim).
With this patch we're also switching the allocation policy to
not use random zones as buffer zones if cache zones are present.
This avoids a performance drop when all cache zones are used.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 123 ++++++++++++++++++++++++++++++-----------
 drivers/md/dm-zoned-reclaim.c  |  76 +++++++++++++++----------
 drivers/md/dm-zoned-target.c   |  19 +++++--
 drivers/md/dm-zoned.h          |   8 ++-
 4 files changed, 159 insertions(+), 67 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 65e196cfb443..c7d44686a5ea 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -166,6 +166,7 @@ struct dmz_metadata {
 	unsigned int		nr_meta_blocks;
 	unsigned int		nr_meta_zones;
 	unsigned int		nr_data_zones;
+	unsigned int		nr_cache_zones;
 	unsigned int		nr_rnd_zones;
 	unsigned int		nr_reserved_seq;
 	unsigned int		nr_chunks;
@@ -196,6 +197,11 @@ struct dmz_metadata {
 	struct list_head	unmap_rnd_list;
 	struct list_head	map_rnd_list;
 
+	unsigned int		nr_cache;
+	atomic_t		unmap_nr_cache;
+	struct list_head	unmap_cache_list;
+	struct list_head	map_cache_list;
+
 	unsigned int		nr_seq;
 	atomic_t		unmap_nr_seq;
 	struct list_head	unmap_seq_list;
@@ -301,6 +307,16 @@ unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
 	return atomic_read(&zmd->unmap_nr_rnd);
 }
 
+unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd)
+{
+	return zmd->nr_cache;
+}
+
+unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
+{
+	return atomic_read(&zmd->unmap_nr_cache);
+}
+
 unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
 {
 	return zmd->nr_seq;
@@ -1390,9 +1406,9 @@ static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
 		atomic_set(&zone->refcount, 0);
 		zone->id = idx;
 		zone->chunk = DMZ_MAP_UNMAPPED;
-		set_bit(DMZ_RND, &zone->flags);
+		set_bit(DMZ_CACHE, &zone->flags);
 		zone->wp_block = 0;
-		zmd->nr_rnd_zones++;
+		zmd->nr_cache_zones++;
 		zmd->nr_useable_zones++;
 		if (dev->capacity - zone_offset < zmd->zone_nr_sectors) {
 			/* Disable runt zone */
@@ -1647,7 +1663,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		dzone->chunk = chunk;
 		dmz_get_zone_weight(zmd, dzone);
 
-		if (dmz_is_rnd(dzone))
+		if (dmz_is_cache(dzone))
+			list_add_tail(&dzone->link, &zmd->map_cache_list);
+		else if (dmz_is_rnd(dzone))
 			list_add_tail(&dzone->link, &zmd->map_rnd_list);
 		else
 			list_add_tail(&dzone->link, &zmd->map_seq_list);
@@ -1664,7 +1682,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		}
 
 		bzone = dmz_get(zmd, bzone_id);
-		if (!dmz_is_rnd(bzone)) {
+		if (!dmz_is_rnd(bzone) && !dmz_is_cache(bzone)) {
 			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone %u",
 				    chunk, bzone_id);
 			return -EIO;
@@ -1676,7 +1694,10 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		bzone->bzone = dzone;
 		dzone->bzone = bzone;
 		dmz_get_zone_weight(zmd, bzone);
-		list_add_tail(&bzone->link, &zmd->map_rnd_list);
+		if (dmz_is_cache(bzone))
+			list_add_tail(&bzone->link, &zmd->map_cache_list);
+		else
+			list_add_tail(&bzone->link, &zmd->map_rnd_list);
 next:
 		chunk++;
 		e++;
@@ -1693,8 +1714,12 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		dzone = dmz_get(zmd, i);
 		if (dmz_is_meta(dzone))
 			continue;
+		if (dmz_is_offline(dzone))
+			continue;
 
-		if (dmz_is_rnd(dzone))
+		if (dmz_is_cache(dzone))
+			zmd->nr_cache++;
+		else if (dmz_is_rnd(dzone))
 			zmd->nr_rnd++;
 		else
 			zmd->nr_seq++;
@@ -1707,7 +1732,10 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 		/* Unmapped data zone */
 		set_bit(DMZ_DATA, &dzone->flags);
 		dzone->chunk = DMZ_MAP_UNMAPPED;
-		if (dmz_is_rnd(dzone)) {
+		if (dmz_is_cache(dzone)) {
+			list_add_tail(&dzone->link, &zmd->unmap_cache_list);
+			atomic_inc(&zmd->unmap_nr_cache);
+		} else if (dmz_is_rnd(dzone)) {
 			list_add_tail(&dzone->link, &zmd->unmap_rnd_list);
 			atomic_inc(&zmd->unmap_nr_rnd);
 		} else if (atomic_read(&zmd->nr_reserved_seq_zones) < zmd->nr_reserved_seq) {
@@ -1751,6 +1779,9 @@ static void __dmz_lru_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	if (dmz_is_seq(zone)) {
 		/* LRU rotate sequential zone */
 		list_add_tail(&zone->link, &zmd->map_seq_list);
+	} else if (dmz_is_cache(zone)) {
+		/* LRU rotate cache zone */
+		list_add_tail(&zone->link, &zmd->map_cache_list);
 	} else {
 		/* LRU rotate random zone */
 		list_add_tail(&zone->link, &zmd->map_rnd_list);
@@ -1826,17 +1857,19 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
 }
 
 /*
- * Select a random write zone for reclaim.
+ * Select a cache or random write zone for reclaim.
  */
 static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
 {
 	struct dm_zone *dzone = NULL;
 	struct dm_zone *zone;
+	struct list_head *zone_list = &zmd->map_rnd_list;
 
-	if (list_empty(&zmd->map_rnd_list))
-		return ERR_PTR(-EBUSY);
+	/* If we have cache zones select from the cache zone list */
+	if (zmd->nr_cache)
+		zone_list = &zmd->map_cache_list;
 
-	list_for_each_entry(zone, &zmd->map_rnd_list, link) {
+	list_for_each_entry(zone, zone_list, link) {
 		if (dmz_is_buf(zone))
 			dzone = zone->bzone;
 		else
@@ -1855,9 +1888,6 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 {
 	struct dm_zone *zone;
 
-	if (list_empty(&zmd->map_seq_list))
-		return ERR_PTR(-EBUSY);
-
 	list_for_each_entry(zone, &zmd->map_seq_list, link) {
 		if (!zone->bzone)
 			continue;
@@ -1907,6 +1937,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
 	unsigned int dzone_id;
 	struct dm_zone *dzone = NULL;
 	int ret = 0;
+	int alloc_flags = zmd->nr_cache ? DMZ_ALLOC_CACHE : DMZ_ALLOC_RND;
 
 	dmz_lock_map(zmd);
 again:
@@ -1921,7 +1952,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
 			goto out;
 
 		/* Allocate a random zone */
-		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
+		dzone = dmz_alloc_zone(zmd, alloc_flags);
 		if (!dzone) {
 			if (dmz_dev_is_dying(zmd)) {
 				dzone = ERR_PTR(-EIO);
@@ -2014,6 +2045,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 				     struct dm_zone *dzone)
 {
 	struct dm_zone *bzone;
+	int alloc_flags = zmd->nr_cache ? DMZ_ALLOC_CACHE : DMZ_ALLOC_RND;
 
 	dmz_lock_map(zmd);
 again:
@@ -2022,7 +2054,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 		goto out;
 
 	/* Allocate a random zone */
-	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
+	bzone = dmz_alloc_zone(zmd, alloc_flags);
 	if (!bzone) {
 		if (dmz_dev_is_dying(zmd)) {
 			bzone = ERR_PTR(-EIO);
@@ -2039,7 +2071,10 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 	bzone->chunk = dzone->chunk;
 	bzone->bzone = dzone;
 	dzone->bzone = bzone;
-	list_add_tail(&bzone->link, &zmd->map_rnd_list);
+	if (dmz_is_cache(bzone))
+		list_add_tail(&bzone->link, &zmd->map_cache_list);
+	else
+		list_add_tail(&bzone->link, &zmd->map_rnd_list);
 out:
 	dmz_unlock_map(zmd);
 
@@ -2055,31 +2090,46 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 	struct list_head *list;
 	struct dm_zone *zone;
 
-	if (flags & DMZ_ALLOC_RND)
+	if (flags & DMZ_ALLOC_CACHE)
+		list = &zmd->unmap_cache_list;
+	else if (flags & DMZ_ALLOC_RND)
 		list = &zmd->unmap_rnd_list;
 	else
 		list = &zmd->unmap_seq_list;
+
 again:
 	if (list_empty(list)) {
 		/*
-		 * No free zone: if this is for reclaim, allow using the
-		 * reserved sequential zones.
+		 * No free zone: return NULL if this is for not reclaim.
 		 */
-		if (!(flags & DMZ_ALLOC_RECLAIM) ||
-		    list_empty(&zmd->reserved_seq_zones_list))
+		if (!(flags & DMZ_ALLOC_RECLAIM))
 			return NULL;
-
-		zone = list_first_entry(&zmd->reserved_seq_zones_list,
-					struct dm_zone, link);
-		list_del_init(&zone->link);
-		atomic_dec(&zmd->nr_reserved_seq_zones);
+		/*
+		 * Use sequential write zones if we started off with random
+		 * zones and the list is empty
+		 */
+		if (list == &zmd->unmap_rnd_list) {
+			list = &zmd->unmap_seq_list;
+			goto again;
+		}
+		/*
+		 * Fallback to the reserved sequential zones
+		 */
+		zone = list_first_entry_or_null(&zmd->reserved_seq_zones_list,
+						struct dm_zone, link);
+		if (zone) {
+			list_del_init(&zone->link);
+			atomic_dec(&zmd->nr_reserved_seq_zones);
+		}
 		return zone;
 	}
 
 	zone = list_first_entry(list, struct dm_zone, link);
 	list_del_init(&zone->link);
 
-	if (dmz_is_rnd(zone))
+	if (dmz_is_cache(zone))
+		atomic_dec(&zmd->unmap_nr_cache);
+	else if (dmz_is_rnd(zone))
 		atomic_dec(&zmd->unmap_nr_rnd);
 	else
 		atomic_dec(&zmd->unmap_nr_seq);
@@ -2110,7 +2160,10 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		dmz_reset_zone(zmd, zone);
 
 	/* Return the zone to its type unmap list */
-	if (dmz_is_rnd(zone)) {
+	if (dmz_is_cache(zone)) {
+		list_add_tail(&zone->link, &zmd->unmap_cache_list);
+		atomic_inc(&zmd->unmap_nr_cache);
+	} else if (dmz_is_rnd(zone)) {
 		list_add_tail(&zone->link, &zmd->unmap_rnd_list);
 		atomic_inc(&zmd->unmap_nr_rnd);
 	} else if (atomic_read(&zmd->nr_reserved_seq_zones) <
@@ -2136,7 +2189,9 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *dzone,
 	dmz_set_chunk_mapping(zmd, chunk, dzone->id,
 			      DMZ_MAP_UNMAPPED);
 	dzone->chunk = chunk;
-	if (dmz_is_rnd(dzone))
+	if (dmz_is_cache(dzone))
+		list_add_tail(&dzone->link, &zmd->map_cache_list);
+	else if (dmz_is_rnd(dzone))
 		list_add_tail(&dzone->link, &zmd->map_rnd_list);
 	else
 		list_add_tail(&dzone->link, &zmd->map_seq_list);
@@ -2710,6 +2765,10 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 	INIT_LIST_HEAD(&zmd->unmap_rnd_list);
 	INIT_LIST_HEAD(&zmd->map_rnd_list);
 
+	atomic_set(&zmd->unmap_nr_cache, 0);
+	INIT_LIST_HEAD(&zmd->unmap_cache_list);
+	INIT_LIST_HEAD(&zmd->map_cache_list);
+
 	atomic_set(&zmd->unmap_nr_seq, 0);
 	INIT_LIST_HEAD(&zmd->unmap_seq_list);
 	INIT_LIST_HEAD(&zmd->map_seq_list);
@@ -2732,7 +2791,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 	/* Set metadata zones starting from sb_zone */
 	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
 		zone = dmz_get(zmd, zmd->sb[0].zone->id + i);
-		if (!dmz_is_rnd(zone)) {
+		if (!dmz_is_rnd(zone) && !dmz_is_cache(zone)) {
 			dmz_zmd_err(zmd,
 				    "metadata zone %d is not random", i);
 			ret = -ENXIO;
@@ -2784,6 +2843,8 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 		      zmd->nr_meta_zones * 2);
 	dmz_zmd_debug(zmd, "  %u data zones for %u chunks",
 		      zmd->nr_data_zones, zmd->nr_chunks);
+	dmz_zmd_debug(zmd, "    %u cache zones (%u unmapped)",
+		      zmd->nr_cache, atomic_read(&zmd->unmap_nr_cache));
 	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
 		      zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
 	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 77f02170cdd3..9e3760091fcf 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -43,13 +43,13 @@ enum {
  * Percentage of unmapped (free) random zones below which reclaim starts
  * even if the target is busy.
  */
-#define DMZ_RECLAIM_LOW_UNMAP_RND	30
+#define DMZ_RECLAIM_LOW_UNMAP_ZONES	30
 
 /*
  * Percentage of unmapped (free) random zones above which reclaim will
  * stop if the target is busy.
  */
-#define DMZ_RECLAIM_HIGH_UNMAP_RND	50
+#define DMZ_RECLAIM_HIGH_UNMAP_ZONES	50
 
 /*
  * Align a sequential zone write pointer to chunk_block.
@@ -281,17 +281,21 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	struct dm_zone *szone = NULL;
 	struct dmz_metadata *zmd = zrc->metadata;
 	int ret;
+	int alloc_flags = dmz_nr_cache_zones(zmd) ?
+		DMZ_ALLOC_RND : DMZ_ALLOC_SEQ;
 
 	/* Get a free sequential zone */
 	dmz_lock_map(zmd);
-	szone = dmz_alloc_zone(zmd, DMZ_ALLOC_RECLAIM);
+	szone = dmz_alloc_zone(zmd, alloc_flags | DMZ_ALLOC_RECLAIM);
 	dmz_unlock_map(zmd);
 	if (!szone)
 		return -ENOSPC;
 
-	DMDEBUG("(%s): Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
-		dmz_metadata_label(zmd),
-		chunk, dzone->id, dmz_weight(dzone), szone->id);
+	DMDEBUG("(%s): Chunk %u, move %s zone %u (weight %u) to %s zone %u",
+		dmz_metadata_label(zmd), chunk,
+		dmz_is_cache(dzone) ? "cache" : "rnd",
+		dzone->id, dmz_weight(dzone),
+		dmz_is_rnd(szone) ? "rnd" : "seq", szone->id);
 
 	/* Flush the random data zone into the sequential zone */
 	ret = dmz_reclaim_copy(zrc, dzone, szone);
@@ -358,7 +362,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 
 	start = jiffies;
 	dev = dmz_zone_to_dev(zmd, dzone);
-	if (dmz_is_rnd(dzone)) {
+	if (dmz_is_cache(dzone) || dmz_is_rnd(dzone)) {
 		if (!dmz_weight(dzone)) {
 			/* Empty zone */
 			dmz_reclaim_empty(zrc, dzone);
@@ -424,29 +428,41 @@ static inline int dmz_target_idle(struct dmz_reclaim *zrc)
 	return time_is_before_jiffies(zrc->atime + DMZ_IDLE_PERIOD);
 }
 
-/*
- * Test if reclaim is necessary.
- */
-static bool dmz_should_reclaim(struct dmz_reclaim *zrc)
+static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
+	unsigned int nr_cache = dmz_nr_cache_zones(zmd);
 	unsigned int nr_rnd = dmz_nr_rnd_zones(zmd);
-	unsigned int nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd);
-	unsigned int p_unmap_rnd = nr_unmap_rnd * 100 / nr_rnd;
+	unsigned int nr_unmap, nr_zones;
 
+	if (nr_cache) {
+		nr_zones = nr_cache;
+		nr_unmap = dmz_nr_unmap_cache_zones(zmd);
+	} else {
+		nr_zones = nr_rnd;
+		nr_unmap = dmz_nr_unmap_rnd_zones(zmd);
+	}
+	return nr_unmap * 100 / nr_zones;
+}
+
+/*
+ * Test if reclaim is necessary.
+ */
+static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
+{
 	/* Reclaim when idle */
-	if (dmz_target_idle(zrc) && nr_unmap_rnd < nr_rnd)
+	if (dmz_target_idle(zrc) && p_unmap < 100)
 		return true;
 
-	/* If there are still plenty of random zones, do not reclaim */
-	if (p_unmap_rnd >= DMZ_RECLAIM_HIGH_UNMAP_RND)
+	/* If there are still plenty of cache zones, do not reclaim */
+	if (p_unmap >= DMZ_RECLAIM_HIGH_UNMAP_ZONES)
 		return false;
 
 	/*
-	 * If the percentage of unmapped random zones is low,
+	 * If the percentage of unmapped cache zones is low,
 	 * reclaim even if the target is busy.
 	 */
-	return p_unmap_rnd <= DMZ_RECLAIM_LOW_UNMAP_RND;
+	return p_unmap <= DMZ_RECLAIM_LOW_UNMAP_ZONES;
 }
 
 /*
@@ -456,14 +472,14 @@ static void dmz_reclaim_work(struct work_struct *work)
 {
 	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
 	struct dmz_metadata *zmd = zrc->metadata;
-	unsigned int nr_rnd, nr_unmap_rnd;
-	unsigned int p_unmap_rnd;
+	unsigned int p_unmap;
 	int ret;
 
 	if (dmz_dev_is_dying(zmd))
 		return;
 
-	if (!dmz_should_reclaim(zrc)) {
+	p_unmap = dmz_reclaim_percentage(zrc);
+	if (!dmz_should_reclaim(zrc, p_unmap)) {
 		mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
 		return;
 	}
@@ -474,22 +490,22 @@ static void dmz_reclaim_work(struct work_struct *work)
 	 * and slower if there are still some free random zones to avoid
 	 * as much as possible to negatively impact the user workload.
 	 */
-	nr_rnd = dmz_nr_rnd_zones(zmd);
-	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd);
-	p_unmap_rnd = nr_unmap_rnd * 100 / nr_rnd;
-	if (dmz_target_idle(zrc) || p_unmap_rnd < DMZ_RECLAIM_LOW_UNMAP_RND / 2) {
+	if (dmz_target_idle(zrc) || p_unmap < DMZ_RECLAIM_LOW_UNMAP_ZONES / 2) {
 		/* Idle or very low percentage: go fast */
 		zrc->kc_throttle.throttle = 100;
 	} else {
 		/* Busy but we still have some random zone: throttle */
-		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap_rnd / 2);
+		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
 	}
 
-	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free rnd zones (%u/%u)",
+	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
 		dmz_metadata_label(zmd),
 		zrc->kc_throttle.throttle,
 		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
-		p_unmap_rnd, nr_unmap_rnd, nr_rnd);
+		p_unmap, dmz_nr_unmap_cache_zones(zmd),
+		dmz_nr_cache_zones(zmd),
+		dmz_nr_unmap_rnd_zones(zmd),
+		dmz_nr_rnd_zones(zmd));
 
 	ret = dmz_do_reclaim(zrc);
 	if (ret) {
@@ -587,7 +603,9 @@ void dmz_reclaim_bio_acc(struct dmz_reclaim *zrc)
  */
 void dmz_schedule_reclaim(struct dmz_reclaim *zrc)
 {
-	if (dmz_should_reclaim(zrc))
+	unsigned int p_unmap = dmz_reclaim_percentage(zrc);
+
+	if (dmz_should_reclaim(zrc, p_unmap))
 		mod_delayed_work(zrc->wq, &zrc->work, 0);
 }
 
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index b586fc67d931..2770e293a97b 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -190,7 +190,8 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 	DMDEBUG("(%s): READ chunk %llu -> %s zone %u, block %llu, %u blocks",
 		dmz_metadata_label(zmd),
 		(unsigned long long)dmz_bio_chunk(zmd, bio),
-		(dmz_is_rnd(zone) ? "RND" : "SEQ"),
+		(dmz_is_rnd(zone) ? "RND" :
+		 (dmz_is_cache(zone) ? "CACHE" : "SEQ")),
 		zone->id,
 		(unsigned long long)chunk_block, nr_blocks);
 
@@ -198,7 +199,8 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
 	bzone = zone->bzone;
 	while (chunk_block < end_block) {
 		nr_blocks = 0;
-		if (dmz_is_rnd(zone) || chunk_block < zone->wp_block) {
+		if (dmz_is_rnd(zone) || dmz_is_cache(zone) ||
+		    chunk_block < zone->wp_block) {
 			/* Test block validity in the data zone */
 			ret = dmz_block_valid(zmd, zone, chunk_block);
 			if (ret < 0)
@@ -331,11 +333,13 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
 	DMDEBUG("(%s): WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
 		dmz_metadata_label(zmd),
 		(unsigned long long)dmz_bio_chunk(zmd, bio),
-		(dmz_is_rnd(zone) ? "RND" : "SEQ"),
+		(dmz_is_rnd(zone) ? "RND" :
+		 (dmz_is_cache(zone) ? "CACHE" : "SEQ")),
 		zone->id,
 		(unsigned long long)chunk_block, nr_blocks);
 
-	if (dmz_is_rnd(zone) || chunk_block == zone->wp_block) {
+	if (dmz_is_rnd(zone) || dmz_is_cache(zone) ||
+	    chunk_block == zone->wp_block) {
 		/*
 		 * zone is a random zone or it is a sequential zone
 		 * and the BIO is aligned to the zone write pointer:
@@ -381,7 +385,8 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
 	 * Invalidate blocks in the data zone and its
 	 * buffer zone if one is mapped.
 	 */
-	if (dmz_is_rnd(zone) || chunk_block < zone->wp_block)
+	if (dmz_is_rnd(zone) || dmz_is_cache(zone) ||
+	    chunk_block < zone->wp_block)
 		ret = dmz_invalidate_blocks(zmd, zone, chunk_block, nr_blocks);
 	if (ret == 0 && zone->bzone)
 		ret = dmz_invalidate_blocks(zmd, zone->bzone,
@@ -1065,8 +1070,10 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 
 	switch (type) {
 	case STATUSTYPE_INFO:
-		DMEMIT("%u zones %u/%u random %u/%u sequential",
+		DMEMIT("%u zones %u/%u cache %u/%u random %u/%u sequential",
 		       dmz_nr_zones(dmz->metadata),
+		       dmz_nr_unmap_cache_zones(dmz->metadata),
+		       dmz_nr_cache_zones(dmz->metadata),
 		       dmz_nr_unmap_rnd_zones(dmz->metadata),
 		       dmz_nr_rnd_zones(dmz->metadata),
 		       dmz_nr_unmap_seq_zones(dmz->metadata),
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 4971a765be55..29e01a853f84 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -111,6 +111,7 @@ struct dm_zone {
  */
 enum {
 	/* Zone write type */
+	DMZ_CACHE,
 	DMZ_RND,
 	DMZ_SEQ,
 
@@ -131,6 +132,7 @@ enum {
 /*
  * Zone data accessors.
  */
+#define dmz_is_cache(z)		test_bit(DMZ_CACHE, &(z)->flags)
 #define dmz_is_rnd(z)		test_bit(DMZ_RND, &(z)->flags)
 #define dmz_is_seq(z)		test_bit(DMZ_SEQ, &(z)->flags)
 #define dmz_is_empty(z)		((z)->wp_block == 0)
@@ -189,7 +191,9 @@ bool dmz_check_dev(struct dmz_metadata *zmd);
 bool dmz_dev_is_dying(struct dmz_metadata *zmd);
 
 #define DMZ_ALLOC_RND		0x01
-#define DMZ_ALLOC_RECLAIM	0x02
+#define DMZ_ALLOC_CACHE		0x02
+#define DMZ_ALLOC_SEQ		0x04
+#define DMZ_ALLOC_RECLAIM	0x10
 
 struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags);
 void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
@@ -198,6 +202,8 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
 		  unsigned int chunk);
 void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
 unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
+unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd);
+unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

