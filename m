Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BBF261CD3BB
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7A9yYwm89opjCOJV1bdg5wNjOQmlBLyBuANRHfSEgwo=;
	b=JLaAXpHTHBVihSUROrgMM5281e62BKc1eucJtdNSNbBJH77U4EREP21UMcjZV0lLF7J5o2
	Rl3TNxs5s65zpActc3u3DjsIA4Dt8TvRy5OawntZMelv3WRc2tGE87AXxB9SbkWEWjvgq8
	m7sCu7k2Pa3q1KNMVqw9GZ9SYRtYP+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-adJHZwdOOCmX-PSBmaR2UQ-1; Mon, 11 May 2020 04:25:13 -0400
X-MC-Unique: adJHZwdOOCmX-PSBmaR2UQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D7F518FE864;
	Mon, 11 May 2020 08:25:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4860E6C787;
	Mon, 11 May 2020 08:25:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B145D1809563;
	Mon, 11 May 2020 08:25:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8OrDe031900 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:24:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60D042156A4A; Mon, 11 May 2020 08:24:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BFF92157F24
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62206101A526
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-273-_fpmmVTUPSKnIpYkeW8CJw-1;
	Mon, 11 May 2020 04:24:48 -0400
X-MC-Unique: _fpmmVTUPSKnIpYkeW8CJw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 59ED8AEA3;
	Mon, 11 May 2020 08:24:47 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 11 May 2020 10:24:23 +0200
Message-Id: <20200511082430.39455-9-hare@suse.de>
In-Reply-To: <20200511082430.39455-1-hare@suse.de>
References: <20200511082430.39455-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 08/15] dm-zoned: Introduce dmz_dev_is_dying() and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

