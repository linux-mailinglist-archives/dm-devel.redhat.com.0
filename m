Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 895BD1D91DE
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 10:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589876118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XTJwCyI0ik04HtavXqrZTyFfCVc5FAZTpzhFsCRfjfw=;
	b=bPtFbG9Lpm7+e9VjLEfpxXFkpvL33CqVw6sHWYjeum94IuiBwUiSNq9kGsk8FsewVWsJTI
	zXB3LBoVtGjIP8ti6LrEgWVc9f9xqwPO4ynAcRFgm+sBjo0rXQpHqY/oHImBXk9FiI1euF
	B9NKLxr9ZCw/Xk84FcTBdu86my2hJz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-larRcC1LM22wRo47eWoktw-1; Tue, 19 May 2020 04:15:16 -0400
X-MC-Unique: larRcC1LM22wRo47eWoktw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 611F5107B765;
	Tue, 19 May 2020 08:15:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6998B5C1BB;
	Tue, 19 May 2020 08:15:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71B5C1809543;
	Tue, 19 May 2020 08:14:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J8ElGg030921 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 04:14:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FA9A10F270F; Tue, 19 May 2020 08:14:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B18610F270A
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D77E988856F
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-55-wwd7Mc3xP-W-rMJBhtB8ow-1;
	Tue, 19 May 2020 04:14:42 -0400
X-MC-Unique: wwd7Mc3xP-W-rMJBhtB8ow-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9131AAFCD;
	Tue, 19 May 2020 08:14:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 19 May 2020 10:14:21 +0200
Message-Id: <20200519081424.103318-4-hare@suse.de>
In-Reply-To: <20200519081424.103318-1-hare@suse.de>
References: <20200519081424.103318-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 3/6] dm-zoned: reclaim random zones when idle
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

When the system is idle we should be starting reclaiming
random zones, too.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 13 +++++++++----
 drivers/md/dm-zoned-reclaim.c  | 30 +++++++++++++++++++-----------
 drivers/md/dm-zoned.h          |  2 +-
 3 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index c7d44686a5ea..ee613ba2e8aa 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1859,15 +1859,20 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
 /*
  * Select a cache or random write zone for reclaim.
  */
-static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
+static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
+						    bool idle)
 {
 	struct dm_zone *dzone = NULL;
 	struct dm_zone *zone;
 	struct list_head *zone_list = &zmd->map_rnd_list;
 
 	/* If we have cache zones select from the cache zone list */
-	if (zmd->nr_cache)
+	if (zmd->nr_cache) {
 		zone_list = &zmd->map_cache_list;
+		/* Try to relaim random zones, too, when idle */
+		if (idle && list_empty(zone_list))
+			zone_list = &zmd->map_rnd_list;
+	}
 
 	list_for_each_entry(zone, zone_list, link) {
 		if (dmz_is_buf(zone))
@@ -1901,7 +1906,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 /*
  * Select a zone for reclaim.
  */
-struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd)
+struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle)
 {
 	struct dm_zone *zone;
 
@@ -1917,7 +1922,7 @@ struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd)
 	if (list_empty(&zmd->reserved_seq_zones_list))
 		zone = dmz_get_seq_zone_for_reclaim(zmd);
 	else
-		zone = dmz_get_rnd_zone_for_reclaim(zmd);
+		zone = dmz_get_rnd_zone_for_reclaim(zmd, idle);
 	dmz_unlock_map(zmd);
 
 	return zone;
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 9e3760091fcf..1855c056d6a4 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -284,7 +284,10 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	int alloc_flags = dmz_nr_cache_zones(zmd) ?
 		DMZ_ALLOC_RND : DMZ_ALLOC_SEQ;
 
-	/* Get a free sequential zone */
+	/* Always use sequential zones to reclaim random zones */
+	if (dmz_is_rnd(dzone))
+		alloc_flags = DMZ_ALLOC_SEQ;
+	/* Get a free random or sequential zone */
 	dmz_lock_map(zmd);
 	szone = dmz_alloc_zone(zmd, alloc_flags | DMZ_ALLOC_RECLAIM);
 	dmz_unlock_map(zmd);
@@ -343,6 +346,14 @@ static void dmz_reclaim_empty(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	dmz_unlock_flush(zmd);
 }
 
+/*
+ * Test if the target device is idle.
+ */
+static inline int dmz_target_idle(struct dmz_reclaim *zrc)
+{
+	return time_is_before_jiffies(zrc->atime + DMZ_IDLE_PERIOD);
+}
+
 /*
  * Find a candidate zone for reclaim and process it.
  */
@@ -356,7 +367,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 	int ret;
 
 	/* Get a data zone */
-	dzone = dmz_get_zone_for_reclaim(zmd);
+	dzone = dmz_get_zone_for_reclaim(zmd, dmz_target_idle(zrc));
 	if (!dzone)
 		return -EBUSY;
 
@@ -420,14 +431,6 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 	return 0;
 }
 
-/*
- * Test if the target device is idle.
- */
-static inline int dmz_target_idle(struct dmz_reclaim *zrc)
-{
-	return time_is_before_jiffies(zrc->atime + DMZ_IDLE_PERIOD);
-}
-
 static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
@@ -450,8 +453,13 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
  */
 static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
 {
+	unsigned int nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);
+
+	if (dmz_nr_cache_zones(zrc->metadata))
+		nr_reclaim += dmz_nr_cache_zones(zrc->metadata);
+
 	/* Reclaim when idle */
-	if (dmz_target_idle(zrc) && p_unmap < 100)
+	if (dmz_target_idle(zrc) && nr_reclaim)
 		return true;
 
 	/* If there are still plenty of cache zones, do not reclaim */
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 29e01a853f84..288054dd7cf4 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -240,7 +240,7 @@ static inline bool dmz_is_active(struct dm_zone *zone)
 
 int dmz_lock_zone_reclaim(struct dm_zone *zone);
 void dmz_unlock_zone_reclaim(struct dm_zone *zone);
-struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd);
+struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle);
 
 struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd,
 				      unsigned int chunk, int op);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

