Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 356171E3902
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 08:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590560589;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xBARtRuqJ8n/ng4zu+6DXXmlHYO4uTPXVYJpZdC46YM=;
	b=EN1dVrHFsixcT10EXBFt/XoSM7ft36/shMurFqvF8bqY2O/M+MPMz+B4VlswgYfzi7YryH
	1qlhQ0ThxMZ/uB0y4Dq+S44vNdwZE4T1S7fjZt1wInXQPj8jqWXA2meP7VJUAXnzHoScIH
	y5q6Gb/gpyclCck4RkIQcq7jrntY8Zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-NKDn4DV2OnKjQFx_i3TLRA-1; Wed, 27 May 2020 02:23:04 -0400
X-MC-Unique: NKDn4DV2OnKjQFx_i3TLRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 616E880183C;
	Wed, 27 May 2020 06:22:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB5A21BCBE;
	Wed, 27 May 2020 06:22:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DDEE55322;
	Wed, 27 May 2020 06:22:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R6MlDt015676 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 02:22:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AE5910073CD; Wed, 27 May 2020 06:22:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5738410073C6
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EBAB1049880
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-182-PqmhaVPAM2KwmC9aU57ONg-1;
	Wed, 27 May 2020 02:22:44 -0400
X-MC-Unique: PqmhaVPAM2KwmC9aU57ONg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B5317B300;
	Wed, 27 May 2020 06:22:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 27 May 2020 08:22:19 +0200
Message-Id: <20200527062225.72849-10-hare@suse.de>
In-Reply-To: <20200527062225.72849-1-hare@suse.de>
References: <20200527062225.72849-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 09/15] dm-zoned: allocate dm devices dynamically
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

Allocate dm devices dynamically to allow for expansion to
several devices.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-target.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 087dd4801663..fec1b6a9c6f1 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -40,9 +40,10 @@ struct dm_chunk_work {
  * Target descriptor.
  */
 struct dmz_target {
-	struct dm_dev		*ddev[DMZ_MAX_DEVS];
+	struct dm_dev		**ddev;
+	unsigned int		nr_ddevs;
 
-	unsigned long		flags;
+	unsigned int		flags;
 
 	/* Zoned block device information */
 	struct dmz_dev		*dev;
@@ -836,12 +837,20 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		ti->error = "Unable to allocate the zoned target descriptor";
 		return -ENOMEM;
 	}
-	dmz->dev = kcalloc(2, sizeof(struct dmz_dev), GFP_KERNEL);
+	dmz->dev = kcalloc(argc, sizeof(struct dmz_dev), GFP_KERNEL);
 	if (!dmz->dev) {
 		ti->error = "Unable to allocate the zoned device descriptors";
 		kfree(dmz);
 		return -ENOMEM;
 	}
+	dmz->ddev = kcalloc(argc, sizeof(struct dm_dev *), GFP_KERNEL);
+	if (!dmz->ddev) {
+		ti->error = "Unable to allocate the dm device descriptors";
+		ret = -ENOMEM;
+		goto err;
+	}
+	dmz->nr_ddevs = argc;
+
 	ti->private = dmz;
 
 	/* Get the target zoned block device */
@@ -1048,13 +1057,13 @@ static int dmz_iterate_devices(struct dm_target *ti,
 	struct dmz_target *dmz = ti->private;
 	unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
 	sector_t capacity;
-	int r;
+	int i, r;
 
-	capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);
-	r = fn(ti, dmz->ddev[0], 0, capacity, data);
-	if (!r && dmz->ddev[1]) {
-		capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
-		r = fn(ti, dmz->ddev[1], 0, capacity, data);
+	for (i = 0; i < dmz->nr_ddevs; i++) {
+		capacity = dmz->dev[i].capacity & ~(zone_nr_sectors - 1);
+		r = fn(ti, dmz->ddev[i], 0, capacity, data);
+		if (r)
+			break;
 	}
 	return r;
 }
@@ -1083,7 +1092,7 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
 		dev = &dmz->dev[0];
 		format_dev_t(buf, dev->bdev->bd_dev);
 		DMEMIT("%s", buf);
-		if (dmz->dev[1].bdev) {
+		if (dmz->nr_ddevs > 1) {
 			dev = &dmz->dev[1];
 			format_dev_t(buf, dev->bdev->bd_dev);
 			DMEMIT(" %s", buf);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

