Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2910B1CA6C5
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 11:04:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588928679;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mlkaIAeF05oerD85U6y31BsSmU1NjtHqL0RglfYmroM=;
	b=gPssO1ekyzhvNA9FQpyJIt/ABbhziJ6d6LgQuz8ZDp8xtaemt9m6h+Y50H2S4qDtwDW3KF
	cxdb+RWJsaKgGu9GH7mId+akKlvb75Q2gDFAaHH80c6CZYFqOFmtUZGoxAHW7ahWVmQXVN
	Bt8YNIsSRaXO7dfrjTgVFuEiBIN/fp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-G6qO4TQwNDCBBEg72pwlLg-1; Fri, 08 May 2020 05:04:34 -0400
X-MC-Unique: G6qO4TQwNDCBBEg72pwlLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D16F100A62F;
	Fri,  8 May 2020 09:04:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 729336E71F;
	Fri,  8 May 2020 09:04:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AA8C4E560;
	Fri,  8 May 2020 09:04:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048944Mb000807 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 05:04:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5625210AF437; Fri,  8 May 2020 09:04:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5115610AF430
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:04:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F0BB1859164
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:04:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-198-VHlxu4OhP9uDika7FUCoOg-1;
	Fri, 08 May 2020 05:03:59 -0400
X-MC-Unique: VHlxu4OhP9uDika7FUCoOg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9779BAE7D;
	Fri,  8 May 2020 09:03:57 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri,  8 May 2020 11:03:25 +0200
Message-Id: <20200508090332.40716-8-hare@suse.de>
In-Reply-To: <20200508090332.40716-1-hare@suse.de>
References: <20200508090332.40716-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 048944Mb000807
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 07/14] dm-zoned: Introduce dmz_dev_is_dying() and
	dmz_check_dev()
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

Introduce accessors dmz_dev_is_dying() and dmz_check_dev() to
avoid having to reference the devices directly.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 14 ++++++++++++--
 drivers/md/dm-zoned-reclaim.c  |  4 ++--
 drivers/md/dm-zoned-target.c   |  2 +-
 drivers/md/dm-zoned.h          |  3 +++
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 7cda48683c0b..426af738f1ca 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -267,6 +267,16 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd)
 	return (const char *)zmd->devname;
 }
 
+bool dmz_check_dev(struct dmz_metadata *zmd)
+{
+	return dmz_check_bdev(&zmd->dev[0]);
+}
+
+bool dmz_dev_is_dying(struct dmz_metadata *zmd)
+{
+	return dmz_bdev_is_dying(&zmd->dev[0]);
+}
+
 /*
  * Lock/unlock mapping table.
  * The map lock also protects all the zone lists.
@@ -1719,7 +1729,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
 		/* Allocate a random zone */
 		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
 		if (!dzone) {
-			if (dmz_bdev_is_dying(zmd->dev)) {
+			if (dmz_dev_is_dying(zmd)) {
 				dzone = ERR_PTR(-EIO);
 				goto out;
 			}
@@ -1820,7 +1830,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 	/* Allocate a random zone */
 	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
 	if (!bzone) {
-		if (dmz_bdev_is_dying(zmd->dev)) {
+		if (dmz_dev_is_dying(zmd)) {
 			bzone = ERR_PTR(-EIO);
 			goto out;
 		}
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 699c4145306e..5daede0daf92 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -455,7 +455,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 	unsigned int p_unmap_rnd;
 	int ret;
 
-	if (dmz_bdev_is_dying(zrc->dev))
+	if (dmz_dev_is_dying(zmd))
 		return;
 
 	if (!dmz_should_reclaim(zrc)) {
@@ -490,7 +490,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 	if (ret) {
 		DMDEBUG("(%s): Reclaim error %d\n",
 			dmz_metadata_label(zmd), ret);
-		if (!dmz_check_bdev(zrc->dev))
+		if (!dmz_check_dev(zmd))
 			return;
 	}
 
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index ba5b8c507c98..b32e791b8a5c 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -632,7 +632,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 	sector_t chunk_sector;
 	int ret;
 
-	if (dmz_bdev_is_dying(dmz->dev))
+	if (dmz_dev_is_dying(zmd))
 		return DM_MAPIO_KILL;
 
 	DMDEBUG("(%s): BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index dd768dc60341..e0883df8a903 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -181,6 +181,9 @@ sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
 sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
 unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
 
+bool dmz_check_dev(struct dmz_metadata *zmd);
+bool dmz_dev_is_dying(struct dmz_metadata *zmd);
+
 #define DMZ_ALLOC_RND		0x01
 #define DMZ_ALLOC_RECLAIM	0x02
 
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

