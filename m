Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2115F1A2F74
	for <lists+dm-devel@lfdr.de>; Thu,  9 Apr 2020 08:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586414773;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FQJl3xfG53onh6ofJDN84EsymtVY28DtOgK63K/mZhE=;
	b=dCimzP+FRC0xWvXYCTlwjm9L6wpqBR5A3kKVqLXBQRZk2OqrrXgo9Shz9JEpjoNVxVzp55
	66+eLpxKuAtBnkySPV2RTOKlYbJX/Bd4+LH+Pe/ACK2ALuWa/+hEx6JFSJQuwYwj06AnD7
	FlXI+vlu9EtmTAlxMVhaqfcAWLeJ09k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-dI5KLbP-OwOWDnMX-5DbGA-1; Thu, 09 Apr 2020 02:46:11 -0400
X-MC-Unique: dI5KLbP-OwOWDnMX-5DbGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90A1518AB2CC;
	Thu,  9 Apr 2020 06:46:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61DF810013A1;
	Thu,  9 Apr 2020 06:46:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C19693023;
	Thu,  9 Apr 2020 06:45:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0396jdlC004747 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 02:45:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A32AC1005E22; Thu,  9 Apr 2020 06:45:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FF0F10054FF
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:45:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86D528007D0
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:45:39 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-215-5NB1fEmSO9Gr6v4gnipZ1A-1;
	Thu, 09 Apr 2020 02:45:35 -0400
X-MC-Unique: 5NB1fEmSO9Gr6v4gnipZ1A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BA06FAE0D;
	Thu,  9 Apr 2020 06:45:30 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Thu,  9 Apr 2020 08:45:24 +0200
Message-Id: <20200409064527.82992-9-hare@suse.de>
In-Reply-To: <20200409064527.82992-1-hare@suse.de>
References: <20200409064527.82992-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0396jdlC004747
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 08/11] dm-zoned: use dmz_zone_to_dev() when
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use accessors to retrieve the device pointer in preparation
for adding an additional block device.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index cd4a8093da24..34dc5f3abf09 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1305,6 +1305,7 @@ static int dmz_update_zone_cb(struct blk_zone *blkz, unsigned int idx,
  */
 static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
+	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int noio_flag;
 	int ret;
 
@@ -1315,16 +1316,16 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
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
 
@@ -1338,6 +1339,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 				    struct dm_zone *zone)
 {
+	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 	unsigned int wp = 0;
 	int ret;
 
@@ -1346,7 +1348,7 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
 	if (ret)
 		return ret;
 
-	dmz_dev_warn(zmd->dev, "Processing zone %u write error (zone wp %u/%u)",
+	dmz_dev_warn(dev, "Processing zone %u write error (zone wp %u/%u)",
 		     zone->id, zone->wp_block, wp);
 
 	if (zone->wp_block < wp) {
@@ -1379,7 +1381,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 		return 0;
 
 	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
-		struct dmz_dev *dev = zmd->dev;
+		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
 
 		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
 				       dmz_start_sect(zmd, zone),
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

