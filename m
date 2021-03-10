Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DEA41333738
	for <lists+dm-devel@lfdr.de>; Wed, 10 Mar 2021 09:27:30 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-GuocZCHlNPqAPGZt98TlyQ-1; Wed, 10 Mar 2021 03:27:27 -0500
X-MC-Unique: GuocZCHlNPqAPGZt98TlyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9210857;
	Wed, 10 Mar 2021 08:27:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E834196E3;
	Wed, 10 Mar 2021 08:27:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08BC057DC2;
	Wed, 10 Mar 2021 08:27:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12A8R1jx025818 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 03:27:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 35FFD200B664; Wed, 10 Mar 2021 08:27:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F352202EA0F
	for <dm-devel@redhat.com>; Wed, 10 Mar 2021 08:26:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F38091018AA2
	for <dm-devel@redhat.com>; Wed, 10 Mar 2021 08:26:57 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-262-8RjwiAmSMtGBTuSC-EXTgg-1; Wed, 10 Mar 2021 03:26:53 -0500
X-MC-Unique: 8RjwiAmSMtGBTuSC-EXTgg-1
IronPort-SDR: XADP7kAJU9znOa4P0YkHh0e/QLp4CTfQ/GaKMcYTy46Y6lNhsic55/R97HUhS+wGFt/aFEl1QP
	OxKpjhWCVhV1oFVboySOlwqX3TNqVOOLdqwdgUi9dlRyUsjY0ptrtaJ3XQrI9Z6nJH2+j6z5/x
	cb41VV/lkXPwKEizVMWZG5ISbgdOJ01WthtancQLk+O0Zw3aTPxw1BKzIbtkUTvkz7YtryAe+R
	sco4SAgzFDolzITqgfsI7NUNC/WBCquVzuQWplSrHkRewqopiD5uYGhZZ66uDQheV58DlZxIFz
	754=
X-IronPort-AV: E=Sophos;i="5.81,237,1610380800"; d="scan'208";a="166297123"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 10 Mar 2021 16:25:48 +0800
IronPort-SDR: zOOJd4kR24rP+vvC7fKPrqWlsdCFzbqkVNDQwU38eKkT47Gzuo17wEiUByg4u6NtkgjFbrAtzK
	WkPcB4e3fuv7x1jedazKuyXkyEnAI57sIoiTEtm86/OdEU3ckytCdWSfzzSx+BShCkrxlSu98P
	SYvfOaaDp2fp9uQ5CL5Z4VPX8HVHtX9WlokaBGqpAICTP0Wcnl7FzKuOfZ+uGoxzK1QIAyAyK6
	IY2JPR9HXbsrR+g0OYHbxWUmtKEv9guhCoYYJL4i1qgD02h3eqaL4kYyDNdNcQesR7IA1PIYUk
	B2eavemC0Z1fKwvdVxXpWHcK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Mar 2021 00:06:45 -0800
IronPort-SDR: Vcamj7wb8fYWnHDCvODNBj0UJpqcBl0VDTsas3kX2lB1GenKsU5j+zUijFxoWbSDJIoXd2DKUK
	ow/Oga14941j1Z8SwFP1qhE+e/VaPoK79v5ajlk3BiAey+W15FAB0NmXItrrC3NvJGSCjd8n5s
	3nxJ42zVJGon72YZlo6eApgpfOLS1v+w6b0Di5Xf+eY/n4He/Ke3WYiwrE0IVIMRW7uquqWdwo
	q/yHmjRpBlvg7DsDOCiITcqGQBtJn5x3TUk8WqiYocwoia1E7TB2F0SUl1cmk0yfNjOnjSeOSF
	OsA=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com ([10.149.52.189])
	by uls-op-cesaip01.wdc.com with ESMTP; 10 Mar 2021 00:25:48 -0800
From: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 10 Mar 2021 17:25:47 +0900
Message-Id: <20210310082547.576372-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jeffle Xu <jefflexu@linux.alibaba.com>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: [dm-devel] [PATCH] dm table: Fix zoned model check and zone sectors
	check
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 24f6b6036c9e ("dm table: fix zoned iterate_devices based device
capability checks") triggered dm table load failure when dm-zoned device
is set up for zoned block devices and a regular device for cache.

The commit inverted logic of two callback functions for iterate_devices:
device_is_zoned_model() and device_matches_zone_sectors(). The logic of
device_is_zoned_model() was inverted then all destination devices of all
targets in dm table are required to have the expected zoned model. This
is fine for dm-linear, dm-flakey and dm-crypt on zoned block devices
since each target has only one destination device. However, this results
in failure for dm-zoned with regular cache device since that target has
both regular block device and zoned block devices.

As for device_matches_zone_sectors(), the commit inverted the logic to
require all zoned block devices in each target have the specified
zone_sectors. This check also fails for regular block device which does
not have zones.

To avoid the check failures, fix the zone model check and the zone
sectors check. For zone model check, invert the device_is_zoned_model()
logic again to require at least one destination device in one target has
the specified zoned model. For zone sectors check, skip the check if the
destination device is not a zoned block device. Also add comments and
improve error messages to clarify expectations to the two checks.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Fixes: 24f6b6036c9e ("dm table: fix zoned iterate_devices based device capability checks")
---
 drivers/md/dm-table.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 95391f78b8d5..04b7a3978ef8 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1585,13 +1585,13 @@ bool dm_table_has_no_data_devices(struct dm_table *table)
 	return true;
 }
 
-static int device_not_zoned_model(struct dm_target *ti, struct dm_dev *dev,
-				  sector_t start, sector_t len, void *data)
+static int device_is_zoned_model(struct dm_target *ti, struct dm_dev *dev,
+				 sector_t start, sector_t len, void *data)
 {
 	struct request_queue *q = bdev_get_queue(dev->bdev);
 	enum blk_zoned_model *zoned_model = data;
 
-	return blk_queue_zoned_model(q) != *zoned_model;
+	return blk_queue_zoned_model(q) == *zoned_model;
 }
 
 static bool dm_table_supports_zoned_model(struct dm_table *t,
@@ -1608,7 +1608,7 @@ static bool dm_table_supports_zoned_model(struct dm_table *t,
 			return false;
 
 		if (!ti->type->iterate_devices ||
-		    ti->type->iterate_devices(ti, device_not_zoned_model, &zoned_model))
+		    !ti->type->iterate_devices(ti, device_is_zoned_model, &zoned_model))
 			return false;
 	}
 
@@ -1621,9 +1621,18 @@ static int device_not_matches_zone_sectors(struct dm_target *ti, struct dm_dev *
 	struct request_queue *q = bdev_get_queue(dev->bdev);
 	unsigned int *zone_sectors = data;
 
+	if (blk_queue_zoned_model(q) == BLK_ZONED_NONE)
+		return 0;
+
 	return blk_queue_zone_sectors(q) != *zone_sectors;
 }
 
+/*
+ * Check consistency of zoned model and zone sectors across all targets.
+ * For zoned model, at least one destination device used by each target shall
+ * have the zoned model. For zone sectors, if the destination device is a zoned
+ * block device, it shall have the specified zone_sectors.
+ */
 static int validate_hardware_zoned_model(struct dm_table *table,
 					 enum blk_zoned_model zoned_model,
 					 unsigned int zone_sectors)
@@ -1632,7 +1641,7 @@ static int validate_hardware_zoned_model(struct dm_table *table,
 		return 0;
 
 	if (!dm_table_supports_zoned_model(table, zoned_model)) {
-		DMERR("%s: zoned model is not consistent across all devices",
+		DMERR("%s: zoned model is not consistent across all targets",
 		      dm_device_name(table->md));
 		return -EINVAL;
 	}
@@ -1642,7 +1651,7 @@ static int validate_hardware_zoned_model(struct dm_table *table,
 		return -EINVAL;
 
 	if (dm_table_any_dev_attr(table, device_not_matches_zone_sectors, &zone_sectors)) {
-		DMERR("%s: zone sectors is not consistent across all devices",
+		DMERR("%s: zone sectors is not consistent across all zoned devices",
 		      dm_device_name(table->md));
 		return -EINVAL;
 	}
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

