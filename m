Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 67B921CD3C3
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185525;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YD6QEu9InkbEx/9oDbSL+ET9fdnrMMm5UAaY97kBsO0=;
	b=P7egbPztd+ZhrHLZeS9XZbtdyU9Foq61SJd3WPvp2xWihaJXRc2Th8dPoBk0rxR9OT6nGT
	5qhWOg1fH4d7EpWKhvKT3szY2G/SXny9GWkJplyH4e6vvjrK1S6hJcCljVjEPKaUf90PbW
	9/aVXqYCfcv+gO8YX5VCnb99BFGyjkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-aok1cTcqN4KDo0A__6p0TQ-1; Mon, 11 May 2020 04:25:22 -0400
X-MC-Unique: aok1cTcqN4KDo0A__6p0TQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 522B6107ACF8;
	Mon, 11 May 2020 08:25:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1611D196AE;
	Mon, 11 May 2020 08:25:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90B5C4E565;
	Mon, 11 May 2020 08:25:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8OsBx031924 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:24:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F77510DCF4A; Mon, 11 May 2020 08:24:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BE4710DCF41
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93A0F8001E4
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:51 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-280-ofXvsiVpMHOQZtVQpmdsBw-1;
	Mon, 11 May 2020 04:24:49 -0400
X-MC-Unique: ofXvsiVpMHOQZtVQpmdsBw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 62978AEBD;
	Mon, 11 May 2020 08:24:47 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 11 May 2020 10:24:26 +0200
Message-Id: <20200511082430.39455-12-hare@suse.de>
In-Reply-To: <20200511082430.39455-1-hare@suse.de>
References: <20200511082430.39455-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 11/15] dm-zoned: use dmz_zone_to_dev() when
	handling metadata I/O
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

Use accessors to retrieve the device pointer in preparation
for adding an additional block device.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
---
 drivers/md/dm-zoned-metadata.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 426af738f1ca..312194be4cb0 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1310,6 +1310,7 @@ static int dmz_update_zone_cb(struct blk_zone *blkz, unsigned int idx,
  */
 static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
+	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int noio_flag;
 	int ret;
 
@@ -1320,16 +1321,16 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	 * GFP_NOIO was specified.
 	 */
 	noio_flag = memalloc_noio_save();
-	ret = blkdev_report_zones(zmd->dev->bdev, dmz_start_sect(zmd, zone), 1,
+	ret = blkdev_report_zones(dev->bdev, dmz_start_sect(zmd, zone), 1,
 				  dmz_update_zone_cb, zone);
 	memalloc_noio_restore(noio_flag);
 
 	if (ret == 0)
 		ret = -EIO;
 	if (ret < 0) {
-		dmz_dev_err(zmd->dev, "Get zone %u report failed",
+		dmz_dev_err(dev, "Get zone %u report failed",
 			    zone->id);
-		dmz_check_bdev(zmd->dev);
+		dmz_check_bdev(dev);
 		return ret;
 	}
 
@@ -1343,6 +1344,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 				    struct dm_zone *zone)
 {
+	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int wp = 0;
 	int ret;
 
@@ -1351,7 +1353,7 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 	if (ret)
 		return ret;
 
-	dmz_dev_warn(zmd->dev, "Processing zone %u write error (zone wp %u/%u)",
+	dmz_dev_warn(dev, "Processing zone %u write error (zone wp %u/%u)",
 		     zone->id, zone->wp_block, wp);
 
 	if (zone->wp_block < wp) {
@@ -1384,7 +1386,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		return 0;
 
 	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
-		struct dmz_dev *dev = zmd->dev;
+		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 
 		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
 				       dmz_start_sect(zmd, zone),
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

