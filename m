Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2A552217C29
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 02:21:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-48_BQMFiPVK6Fi6QxjlPiA-1; Tue, 07 Jul 2020 20:21:54 -0400
X-MC-Unique: 48_BQMFiPVK6Fi6QxjlPiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A8A410059A9;
	Wed,  8 Jul 2020 00:21:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA791797E0;
	Wed,  8 Jul 2020 00:21:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 02DEE180954D;
	Wed,  8 Jul 2020 00:21:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0680LYSB030883 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 20:21:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29EBF7AEF; Wed,  8 Jul 2020 00:21:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 251DA82864
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 00:21:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1519E101A525
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 00:21:32 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-i0NjXa61PTCjJ2mljYXCnA-2; Tue, 07 Jul 2020 20:21:30 -0400
X-MC-Unique: i0NjXa61PTCjJ2mljYXCnA-2
IronPort-SDR: Xp7a/0lAEwTKpXhcPtjcXXTlmCOo0yTnuzXCVMO7I7VsNqJ9YYdw3WPPiJJhiG3oLV8zOrVTD7
	zdQ30Mw8gAGNxhSie+oybPGALI1nC3sACnqDIiBzSkT2NjID8R4K1u74HbwqqPQZNBtlp3D2ee
	rnD6s+ncMdgsVp+zErIbD+boecSZBKg/0x9KnLANYX/7mxQ729d5E54wOQ4LbJ2pO+dyrewXZG
	9EsYzzEFvwO4aqwCPgOQuySMJ8J5Z9wT6RKs06+92j1t+h7CQ4DHjOBzMHaUJt9EPiu4dwBF4G
	qOk=
X-IronPort-AV: E=Sophos;i="5.75,325,1589212800"; d="scan'208";a="146187471"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2020 08:20:26 +0800
IronPort-SDR: WsAao1qumCH8ATBIfh3P17c7xigLiyPCFXr7DUTsLHykHM892DmASZy5hmLa9kVBYzEVDZL4ir
	8/8lit0Dzlc2ZXAMgy1mCPNVW/2Hj1raY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Jul 2020 17:08:32 -0700
IronPort-SDR: LyzTzeBUN7oULFPiMOYImKxkrFkjdKlnHdIOWMtZMo99KfyvIoGgcKlFQ6AyRF5gOt50yKG3Zd
	qd7dyayDT9xQ==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Jul 2020 17:20:25 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed,  8 Jul 2020 09:20:22 +0900
Message-Id: <20200708002023.738147-2-damien.lemoal@wdc.com>
In-Reply-To: <20200708002023.738147-1-damien.lemoal@wdc.com>
References: <20200708002023.738147-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 1/2] dm zoned: Fix zone reclaim trigger
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Triggerring reclaim only based on the percentage of unmapped cache
zones can fail to detect cases where reclaim is needed, e.g. if the
target has only 2 or 3 cache zones and only one unmapped cache zone,
the percentage of free cache zone is higher than
DMZ_RECLAIM_LOW_UNMAP_ZONES (30%) and reclaim does not trigger.
This problem, combined with the fact that dmz_schedule_reclaim() is
called from dmz_handle_bio() without the map lock held leads to a race
between zone allocation and dmz_should_reclaim() result. Depending on
the workload applied, this race can lead to the write path forever
waiting for a free zone without reclaim being triggerred.

Fix this by moving dmz_schedule_reclaim() inside dmz_alloc_zone()
under the map lock, checking the need for zone reclaim whenever a new
data or buffer zone needs to be allocated.

Also fix dmz_reclaim_percentage() to always return 0 if the number of
unmapped cache (or random) zone is less than or equal to 1.

Suggested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c |  9 ++++++++-
 drivers/md/dm-zoned-reclaim.c  |  2 ++
 drivers/md/dm-zoned-target.c   | 10 +---------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 5cf6f5f552e0..b298fefb022e 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -2217,8 +2217,15 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned int dev_idx,
 {
 	struct list_head *list;
 	struct dm_zone *zone;
-	int i = 0;
+	int i;
+
+	/* Schedule reclaim to ensure free zones are available */
+	if (!(flags & DMZ_ALLOC_RECLAIM)) {
+		for (i = 0; i < zmd->nr_devs; i++)
+			dmz_schedule_reclaim(zmd->dev[i].reclaim);
+	}
 
+	i = 0;
 again:
 	if (flags & DMZ_ALLOC_CACHE)
 		list = &zmd->unmap_cache_list;
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index dd1eebf6e50f..9c6e264465bc 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -456,6 +456,8 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
 		nr_zones = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
 		nr_unmap = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
 	}
+	if (nr_unmap <= 1)
+		return 0;
 	return nr_unmap * 100 / nr_zones;
 }
 
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index cf915009c306..42aa5139df7c 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -400,15 +400,7 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
 		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
 	struct dmz_metadata *zmd = dmz->metadata;
 	struct dm_zone *zone;
-	int i, ret;
-
-	/*
-	 * Write may trigger a zone allocation. So make sure the
-	 * allocation can succeed.
-	 */
-	if (bio_op(bio) == REQ_OP_WRITE)
-		for (i = 0; i < dmz->nr_ddevs; i++)
-			dmz_schedule_reclaim(dmz->dev[i].reclaim);
+	int ret;
 
 	dmz_lock_metadata(zmd);
 
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

