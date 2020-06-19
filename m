Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EF4E42002FD
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 09:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592553092;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lWmS9J2mt+5cpMp0YVTBQIxCvldoDpeoIRsintgnM8Y=;
	b=J38zg/XwH6ekiiwSV1Zbv/qYrwuR7ZeyU/6OwpK2Wjzw98UWYRjaWocFc3I2MDJQtMxTiv
	EAdAhMIuhgThiewHfRSiNHe3TJDzXSjzI7OVoTk5hzuMAIrSLwwRFOyO+9+0okfq3auubo
	jNpKZyS+UfFGe1TLWZB99hLKbP4Qoyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Nl43-KedORaW2e51gNZsQA-1; Fri, 19 Jun 2020 03:51:30 -0400
X-MC-Unique: Nl43-KedORaW2e51gNZsQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F24B8035C1;
	Fri, 19 Jun 2020 07:51:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1EC95D9F1;
	Fri, 19 Jun 2020 07:51:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA1D71809557;
	Fri, 19 Jun 2020 07:51:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J7p9Am022295 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 03:51:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 700ED10EE828; Fri, 19 Jun 2020 07:51:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AF3F1000D90
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:51:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A80E8007CB
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:51:06 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-R3KQ2Xe9Nfu8CdojmzFBlg-2; Fri, 19 Jun 2020 03:51:04 -0400
X-MC-Unique: R3KQ2Xe9Nfu8CdojmzFBlg-2
IronPort-SDR: B+TDjyFiyT/3lIBlAoMlNVneHyqsxMgt1L3VQOMhQnIFWL/9sxUKsBic+jUxfMliTE+Ut6AK+U
	CB4jrfoaQbNuUxWHLN0xE0yGv8SYSbSbGDz4jGgTKF7I4xLJ9kjM4UzsmQZYtgpowCkf+KHvlQ
	pC086r63Ku9Lc8e+W/8oGWdQrTRKq70EszhJ4hjhgC9Jf+omp7kzJMiPAkc2RGcoea7pl/wAJy
	UF+JcbxGAoKnArRjUEcEj/9n/N7xI4Ap1g2ZWySu+VpvfGGaU7rV8XiqmwpQuIGth81YK8GTm5
	WMw=
X-IronPort-AV: E=Sophos;i="5.75,254,1589212800"; d="scan'208";a="249594581"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 15:49:58 +0800
IronPort-SDR: LUx//uy1SUB/1hpAcAlqZ6cv7VAcXmJRyojB4cokmgIMHUFtOr0ech8lumcqUxQt45m4HtN5Xq
	mTS1NIDK75CZOVZhlGiEawQlfg4y0X/bM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	19 Jun 2020 00:38:37 -0700
IronPort-SDR: dnSNJ47MK6VOo9E2UZguMXpSa7tzqmz+ikLmOrpfVbAKBCZU7OUrVK50jPV+IDT5ZdK13b0Ayj
	kaR2KHcU/ImQ==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip02.wdc.com with ESMTP; 19 Jun 2020 00:49:58 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Fri, 19 Jun 2020 16:49:55 +0900
Message-Id: <20200619074956.352647-2-damien.lemoal@wdc.com>
In-Reply-To: <20200619074956.352647-1-damien.lemoal@wdc.com>
References: <20200619074956.352647-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [dm-devel] [PATCH 1/2] dm zoned: Fix random zone reclaim selection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 2094045fe5b5 ("dm zoned: prefer full zones for reclaim")
modified dmz_get_rnd_zone_for_reclaim() to add a search for the buffer
zone with the heaviest weight as an optimal candidate for reclaim. This
modification uses the zone pointer variabl "last" which is set only once
and never modified as zones are scanned, resulting in the search being
inefective. Furthermore, if the selected buffer zone at the end of the
search loop is active or already locked for reclaim,
dmz_get_rnd_zone_for_reclaim() returns NULL even if other random zones
with a lesser weight can be reclaimed.

To fix the search and to guarantee that reclaim can make forward
progress, fix dmz_get_rnd_zone_for_reclaim() loop to correctly find
the buffer zone with the heaviest weight using the variable maxw_z.
Also make sure to fallback to finding the first random zone that can
be reclaimed if this best candidate zone cannot be reclaimed.

While at it, also fix the device index check to consider only random
zones, ignoring cache zones belonging to the cache device if one is
used as that device does not have a reclaim process.

Fixes: 2094045fe5b5 ("dm zoned: prefer full zones for reclaim")
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 35 ++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 130b5a6d9f12..8bdf71dce7fb 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1949,7 +1949,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
 						    unsigned int idx, bool idle)
 {
 	struct dm_zone *dzone = NULL;
-	struct dm_zone *zone, *last = NULL;
+	struct dm_zone *zone, *maxw_z = NULL;
 	struct list_head *zone_list;
 
 	/* If we have cache zones select from the cache zone list */
@@ -1961,18 +1961,37 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
 	} else
 		zone_list = &zmd->dev[idx].map_rnd_list;
 
+	/*
+	 * Find the buffer zone with the heaviest weight or the first (oldest)
+	 * data zone that can be reclaimed.
+	 */
 	list_for_each_entry(zone, zone_list, link) {
 		if (dmz_is_buf(zone)) {
 			dzone = zone->bzone;
-			if (dzone->dev->dev_idx != idx)
+			if (dmz_is_rnd(dzone) && dzone->dev->dev_idx != idx)
 				continue;
-			if (!last) {
-				last = dzone;
-				continue;
-			}
-			if (last->weight < dzone->weight)
+			if (!maxw_z || maxw_z->weight < dzone->weight)
+				maxw_z = dzone;
+		} else {
+			dzone = zone;
+			if (dmz_lock_zone_reclaim(dzone))
+				return dzone;
+		}
+	}
+
+	if (maxw_z && dmz_lock_zone_reclaim(maxw_z))
+		return maxw_z;
+
+	/*
+	 * If we come here, none of the zones inspected could be locked for
+	 * reclaim. Try again, being more aggressive, that is, find the
+	 * first zone that can be reclaimed regardless of its weitght.
+	 */
+	list_for_each_entry(zone, zone_list, link) {
+		if (dmz_is_buf(zone)) {
+			dzone = zone->bzone;
+			if (dmz_is_rnd(dzone) && dzone->dev->dev_idx != idx)
 				continue;
-			dzone = last;
 		} else
 			dzone = zone;
 		if (dmz_lock_zone_reclaim(dzone))
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

