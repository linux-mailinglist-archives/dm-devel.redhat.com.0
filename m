Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 416EC1FE89A
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 04:50:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592448606;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Do5QooTnSPfmEw2Qvsg61pYqPKpZgvkDCHnB5li9A38=;
	b=AZ1niXQqQDUWr2hkE0VvLR4Yq8DDdQAM+1ZZixvI1tUR2fXRvaPdUeHRAU8QD0y9srwVkp
	sIundDwvRuIpo4ebqJFdhX9tzX1jEHlESc6hQ0PiU+o6pntzQhF2pcHqrZngTQqDid9BcI
	q+1DQv+59Utm7HifX1Q/XbkqUzyc2fs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-iIgtG6adMNCH6TQSRFgpLw-1; Wed, 17 Jun 2020 22:50:03 -0400
X-MC-Unique: iIgtG6adMNCH6TQSRFgpLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E0687308E;
	Thu, 18 Jun 2020 02:49:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86D555C1D6;
	Thu, 18 Jun 2020 02:49:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B660A833C6;
	Thu, 18 Jun 2020 02:49:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I2nOva010769 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 22:49:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 451512028E91; Thu, 18 Jun 2020 02:49:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 406BC2026E04
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 02:49:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3836D8007B1
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 02:49:22 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-342-VvYx-R26NU-vbqNNQxfApQ-1; Wed, 17 Jun 2020 22:49:17 -0400
X-MC-Unique: VvYx-R26NU-vbqNNQxfApQ-1
IronPort-SDR: QcUDOZcZkSVMqGlKodP3dUyevM3FRJ6kNumXIVY8sPz+KqQ3G+BGXEYHiWD0viKE4IuaXY/IO2
	f5WWak+E8l+m1MaNJ9sBMpPprwz/F7MutI84S/KgNngnhbvdBY3OYXaI/i4GPTEIeH74YICspE
	L0DGe1Z9I1Ot8zUZQc0Tq0pzItBg23XWTCZiqotoDdAXY4a0axvFASc5jylrXq1EoRmwurbxwo
	muI4QJRK6CpgZHjzFcEe9autASR9pHo0AKoVpx7B82pp/MmSA99pOeQYmLVfbekc05lFZtuE0r
	TeU=
X-IronPort-AV: E=Sophos;i="5.73,524,1583164800"; d="scan'208";a="249458934"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2020 10:48:13 +0800
IronPort-SDR: 6K9a579+R+sdyeYoINq01pfh7UzA4ZnipisCIb6l2Mndrl74i17TEXHEye/FdcxGN8bwvT458v
	xnk/90H6XxGhMgsvkDSCEi3UZi/DsWlCc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Jun 2020 19:36:53 -0700
IronPort-SDR: NwavGtlk+RRGXHgwtrKEzJACe/NfvqQTaTxV/wUVrGLzQX87h3ssL7+xNYlRQzZ1b2Ed+7lDqi
	UuD1xSisMqZg==
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
	([10.149.53.87])
	by uls-op-cesaip02.wdc.com with ESMTP; 17 Jun 2020 19:48:12 -0700
From: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 18 Jun 2020 11:48:10 +0900
Message-Id: <20200618024810.443981-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: [dm-devel] [PATCH] dm zoned: Fix metadata zone size check
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When dm zoned has multiple devices, metadata is on the cache device, not
in random zones of the zoned devices. Then the number of metadata zones
shall be checked with the number of cache zones, not random zones.

Fixes: 34f5affd04c4 ("dm zoned: separate random and cache zones")
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 130b5a6d9f12..fc1329ca3e70 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1078,7 +1078,8 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_sb *dsb,
 	nr_meta_zones = (le32_to_cpu(sb->nr_meta_blocks) + zmd->zone_nr_blocks - 1)
 		>> zmd->zone_nr_blocks_shift;
 	if (!nr_meta_zones ||
-	    nr_meta_zones >= zmd->nr_rnd_zones) {
+	    (zmd->nr_devs <= 1 && nr_meta_zones >= zmd->nr_rnd_zones) ||
+	    (zmd->nr_devs > 1 && nr_meta_zones >= zmd->nr_cache_zones)) {
 		dmz_dev_err(dev, "Invalid number of metadata blocks");
 		return -ENXIO;
 	}
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

