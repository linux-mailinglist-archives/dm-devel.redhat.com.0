Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A33821B064A
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 12:09:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587377375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1u7OqQnmO9WWQ76X17m0XrwgLCikIMPZax6YiEdwj2s=;
	b=e4lwyeeeAM32tCGXWlD5nI3/gNKKD+YHFmUUUP9ZaNRezGgL4ve/sr88zpTNXkeC7xq2nM
	PyazXZ2wMVzw2WZXXIOQx0CGFVDy4pMkAXjXITjp7JxgA+uAyYLD6hfAtCvHVxE88Gtjlf
	bgwRk2miypNR5OBhJTgSSkC4pOYMFrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-WB54Yk9yOf-u5IYd8hC-QA-1; Mon, 20 Apr 2020 06:09:32 -0400
X-MC-Unique: WB54Yk9yOf-u5IYd8hC-QA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A1EB108442A;
	Mon, 20 Apr 2020 10:09:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E98011E7F1;
	Mon, 20 Apr 2020 10:09:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D96E518089D5;
	Mon, 20 Apr 2020 10:09:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KA8peX008233 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 06:08:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C40410E60F0; Mon, 20 Apr 2020 10:08:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 585B910E60EE
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3754C800296
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:08:51 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-99-khvWctu0NPa6IPzYFE8BeA-1;
	Mon, 20 Apr 2020 06:08:46 -0400
X-MC-Unique: khvWctu0NPa6IPzYFE8BeA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 25905AFCF;
	Mon, 20 Apr 2020 10:08:42 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 20 Apr 2020 12:08:21 +0200
Message-Id: <20200420100824.124618-11-hare@suse.de>
In-Reply-To: <20200420100824.124618-1-hare@suse.de>
References: <20200420100824.124618-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KA8peX008233
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 10/13] dm-zoned: use dmz_zone_to_dev() when
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

