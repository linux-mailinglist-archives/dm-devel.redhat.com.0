Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6C704F3DCA
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 03:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573178448;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wI/jDkr9m6JFET3Udo0xYDuiyqx959svfEscvZnHz4I=;
	b=d7NkBAEjocB1MBBhQL8dUGluzuRwWT2Uzp5r1yPZ7JBIVoQSkuZKKhHmMs79nBIMIv6wC5
	ohxFwnG8z0mYxd52A9uboym7fo+z0tCudAdadmHQBNXcpYXE40/cNbu5DOppo3s/6CixCX
	V3vFNZRXVuvMpYpn+WDqvsQnGOfyqQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-NE7_6_W9OGC8kfAUQbaoqg-1; Thu, 07 Nov 2019 21:00:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D62E107ACC6;
	Fri,  8 Nov 2019 02:00:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22D4B5C557;
	Fri,  8 Nov 2019 02:00:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EACC18089D0;
	Fri,  8 Nov 2019 02:00:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA81wOZq000684 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 20:58:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A99A260C88; Fri,  8 Nov 2019 01:58:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A145560BE1;
	Fri,  8 Nov 2019 01:58:24 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4937B8AB928;
	Fri,  8 Nov 2019 01:58:00 +0000 (UTC)
IronPort-SDR: oQkgs5Az5SlVNdbKFnHygrS9puKScupN8kgd/eQwYhYqr14aaCNzuy9yNQcnNDAdaHmBPuE4Vc
	kKjfpHkG1k4dB5E2tv9pw3nVlZkphCgKrEZu0b88pGstIvVuBx6IAgVsllGIpKKt1tRHxxvgaj
	ElgJEEP8zJqq8NPAYdtdnG3iwLUVW5v1Yx6MWJYedtnlY9ub4L2qHnH1syuTDUHSRm3+JA+raa
	2w6Kubycs/UX02ULdkIwiXzMNR6sut2Y/ezyiooLCb4vLtmFwtAmyeCduO5z/AV4neqi577fdx
	Iz0=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636913"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:52 +0800
IronPort-SDR: pAKH5e86q5gkgS9LfXyEitrlUxjAd2001gBViHZJb5yarvUU2/avGTU3tFHaY/h288+9QozfAz
	Lp+mFPvGDFbV6khz49zUJYgdkEWRD0U7tILAlE4QJK/ikvuZZUOFFS587wBnVX84nAUfl8SAu9
	+OLvRO04y4UNo3Xi2uw6MEpJxrD4mcvFmINkciKaAuEtUznCVQuotTbo9ozhgjvp+wQvsI8FAZ
	IP3rjsoCp1hMLLQlshMXlQA0U/X/qDH1rpyRXZOMqMicVlhrognnmCwR0U3dKVmX9/jFbeiSDD
	QFf/CpZSZp2SBhhK/eG+lhGM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 17:52:24 -0800
IronPort-SDR: 4CDSQV2+GUtY/DSWWA7Yt1gBV3s2ut6Ip0kWS6IlKPmfz9aw8vAh4foMojfjAlyTPim0pyGsMD
	mGEEU6eq6rRd8UgsEGjut9tEMR4CHv2QWG/j3M0IqThDPNwox1bJjWLJqSgcfa0awC6USbi0Nf
	U9bZJAbu2+rAeYmDFVrAXIp7ruBASpzX6QP6gPPjUByI2iZBnk1Fog/wFVZHvfqYU38/wrLoIg
	o9yNzMe2paRPu3RPanNpjJzi6mGL7Lb94r/a3kJQZCrHpf7XlDJWpWG5Q8/eJD9wrM6unlf8Su
	QDk=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:13 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:59 +0900
Message-Id: <20191108015702.233102-7-damien.lemoal@wdc.com>
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Fri, 08 Nov 2019 01:58:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Fri, 08 Nov 2019 01:58:16 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com 68.232.143.124
	esa2.hgst.iphmx.com <prvs=208d19533=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 6/9] null_blk: clean up report zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: NE7_6_W9OGC8kfAUQbaoqg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christoph Hellwig <hch@lst.de>

Make the instance name match the method name and define the name to NULL
instead of providing an inline stub, which is rather pointless for a
method call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/block/null_blk.h       | 11 +++--------
 drivers/block/null_blk_main.c  |  2 +-
 drivers/block/null_blk_zoned.c |  4 ++--
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/block/null_blk.h b/drivers/block/null_blk.h
index 93c2a3d403da..9bf56fbab091 100644
--- a/drivers/block/null_blk.h
+++ b/drivers/block/null_blk.h
@@ -91,8 +91,8 @@ struct nullb {
 #ifdef CONFIG_BLK_DEV_ZONED
 int null_zone_init(struct nullb_device *dev);
 void null_zone_exit(struct nullb_device *dev);
-int null_zone_report(struct gendisk *disk, sector_t sector,
-		     struct blk_zone *zones, unsigned int *nr_zones);
+int null_report_zones(struct gendisk *disk, sector_t sector,
+		      struct blk_zone *zones, unsigned int *nr_zones);
 blk_status_t null_handle_zoned(struct nullb_cmd *cmd,
 				enum req_opf op, sector_t sector,
 				sector_t nr_sectors);
@@ -105,12 +105,6 @@ static inline int null_zone_init(struct nullb_device *dev)
 	return -EINVAL;
 }
 static inline void null_zone_exit(struct nullb_device *dev) {}
-static inline int null_zone_report(struct gendisk *disk, sector_t sector,
-				   struct blk_zone *zones,
-				   unsigned int *nr_zones)
-{
-	return -EOPNOTSUPP;
-}
 static inline blk_status_t null_handle_zoned(struct nullb_cmd *cmd,
 					     enum req_opf op, sector_t sector,
 					     sector_t nr_sectors)
@@ -123,5 +117,6 @@ static inline size_t null_zone_valid_read_len(struct nullb *nullb,
 {
 	return len;
 }
+#define null_report_zones	NULL
 #endif /* CONFIG_BLK_DEV_ZONED */
 #endif /* __NULL_BLK_H */
diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 89d385bab45b..2687eb36441c 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -1444,7 +1444,7 @@ static void null_config_discard(struct nullb *nullb)
 
 static const struct block_device_operations null_ops = {
 	.owner		= THIS_MODULE,
-	.report_zones	= null_zone_report,
+	.report_zones	= null_report_zones,
 };
 
 static void null_init_queue(struct nullb *nullb, struct nullb_queue *nq)
diff --git a/drivers/block/null_blk_zoned.c b/drivers/block/null_blk_zoned.c
index 02f41a3bc4cb..00696f16664b 100644
--- a/drivers/block/null_blk_zoned.c
+++ b/drivers/block/null_blk_zoned.c
@@ -66,8 +66,8 @@ void null_zone_exit(struct nullb_device *dev)
 	kvfree(dev->zones);
 }
 
-int null_zone_report(struct gendisk *disk, sector_t sector,
-		     struct blk_zone *zones, unsigned int *nr_zones)
+int null_report_zones(struct gendisk *disk, sector_t sector,
+		      struct blk_zone *zones, unsigned int *nr_zones)
 {
 	struct nullb *nullb = disk->private_data;
 	struct nullb_device *dev = nullb->dev;
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

