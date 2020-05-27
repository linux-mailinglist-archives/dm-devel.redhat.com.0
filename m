Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 248721E390A
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 08:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590560598;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZpU4u8Jykn+KWUlR2p6X4E68ojlAFgrCa2uswKBJ1VA=;
	b=CCQBMW8Supq9xM5rTHLH+XxpU6nTGLTFgnxF5oHqKTdmEqFEdSmj45EGJF+ppP00Cx0Wdi
	/KIqhBeZ0h062p0KILolJPBF8edwt7wYNv6Symul7BZRR3BR7XJ0t/l5nOGWatkHgdmOek
	xw6HXBCeVqd5Z01czhtCqX8st5PszsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-hqxS6wr-O3-VmKfhKk8h6Q-1; Wed, 27 May 2020 02:23:14 -0400
X-MC-Unique: hqxS6wr-O3-VmKfhKk8h6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5100B1085983;
	Wed, 27 May 2020 06:23:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25AE61A914;
	Wed, 27 May 2020 06:23:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDDFE6B4D7;
	Wed, 27 May 2020 06:23:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R6MmSF015717 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 02:22:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47C232157F26; Wed, 27 May 2020 06:22:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 442532157F24
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A362801036
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-302-LQb6J1Q3NvGY1vtd7USX8Q-1;
	Wed, 27 May 2020 02:22:45 -0400
X-MC-Unique: LQb6J1Q3NvGY1vtd7USX8Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BA61FB305;
	Wed, 27 May 2020 06:22:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 27 May 2020 08:22:23 +0200
Message-Id: <20200527062225.72849-14-hare@suse.de>
In-Reply-To: <20200527062225.72849-1-hare@suse.de>
References: <20200527062225.72849-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 13/15] dm-zoned: allocate zone by device index
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When allocating a zone we should pass in an indicator on which
device the zone should be allocated; this increases performance
for a multi-device setup as then reclaim can allocate zones on
the device for which reclaim is running.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 17 +++++++++++------
 drivers/md/dm-zoned-reclaim.c  |  3 ++-
 drivers/md/dm-zoned.h          |  3 ++-
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 689c1dd7ab20..0d65af94309a 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -2045,7 +2045,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
 			goto out;
 
 		/* Allocate a random zone */
-		dzone = dmz_alloc_zone(zmd, alloc_flags);
+		dzone = dmz_alloc_zone(zmd, 0, alloc_flags);
 		if (!dzone) {
 			if (dmz_dev_is_dying(zmd)) {
 				dzone = ERR_PTR(-EIO);
@@ -2151,7 +2151,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 		goto out;
 
 	/* Allocate a random zone */
-	bzone = dmz_alloc_zone(zmd, alloc_flags);
+	bzone = dmz_alloc_zone(zmd, 0, alloc_flags);
 	if (!bzone) {
 		if (dmz_dev_is_dying(zmd)) {
 			bzone = ERR_PTR(-EIO);
@@ -2182,11 +2182,12 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
  * Get an unmapped (free) zone.
  * This must be called with the mapping lock held.
  */
-struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
+struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned int dev_idx,
+			       unsigned long flags)
 {
 	struct list_head *list;
 	struct dm_zone *zone;
-	unsigned int dev_idx = 0;
+	int i = 0;
 
 again:
 	if (flags & DMZ_ALLOC_CACHE)
@@ -2202,8 +2203,12 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 		 */
 		if (!(flags & DMZ_ALLOC_RECLAIM))
 			return NULL;
-		if (dev_idx < zmd->nr_devs) {
-			dev_idx++;
+		/*
+		 * Try to allocate from other devices
+		 */
+		if (i < zmd->nr_devs) {
+			dev_idx = (dev_idx + 1) % zmd->nr_devs;
+			i++;
 			goto again;
 		}
 
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 18edf1b9bf52..5a04e34d17a9 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -288,7 +288,8 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	/* Get a free random or sequential zone */
 	dmz_lock_map(zmd);
 again:
-	szone = dmz_alloc_zone(zmd, alloc_flags | DMZ_ALLOC_RECLAIM);
+	szone = dmz_alloc_zone(zmd, zrc->dev_idx,
+			       alloc_flags | DMZ_ALLOC_RECLAIM);
 	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
 		alloc_flags = DMZ_ALLOC_RND;
 		goto again;
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index f2a760f62db5..ec020bb1caf7 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -214,7 +214,8 @@ bool dmz_dev_is_dying(struct dmz_metadata *zmd);
 #define DMZ_ALLOC_SEQ		0x04
 #define DMZ_ALLOC_RECLAIM	0x10
 
-struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags);
+struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd,
+			       unsigned int dev_idx, unsigned long flags);
 void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
 
 void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

