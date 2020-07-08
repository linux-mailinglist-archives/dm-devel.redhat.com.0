Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DA508217C2A
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 02:21:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-16yyKFcVNO-DHvVQHZnTkg-1; Tue, 07 Jul 2020 20:21:55 -0400
X-MC-Unique: 16yyKFcVNO-DHvVQHZnTkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AA10107ACF5;
	Wed,  8 Jul 2020 00:21:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66FB010013C2;
	Wed,  8 Jul 2020 00:21:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BC22180954D;
	Wed,  8 Jul 2020 00:21:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0680LZLK030889 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 20:21:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 541742026D69; Wed,  8 Jul 2020 00:21:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FCAF2026D5D
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 00:21:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 157A080013F
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 00:21:33 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-m5aGAESAOpiu-JSYsoRppQ-3; Tue, 07 Jul 2020 20:21:31 -0400
X-MC-Unique: m5aGAESAOpiu-JSYsoRppQ-3
IronPort-SDR: 7y1UoH0MSSfV3VcIl0YI+Q6kxaDZewCIpojLfADJ6dY1QTGEPqvQq7cHZ5nfbOEjUoSgTGDcqL
	HI/v10JXlfg0nlDCbEn2Hxe+GjGLmYBS+rNxpfCQkpRwGgVwwKvbquimkoYxrijFcYIDDsPkIY
	qYF/YTpfXO7rUMHMRFhU4chSyBX5eu/MDZdU9gt2Aw6QgOTluIBuT/k07+ekYaFXqzuQI/T4K4
	ghUX2yqDio5a9zXRUo9il76jIq1vBfI04ce75G7z73CB2oWN92K6QFsZ1CJXVvfNm4o6hd7lIH
	X40=
X-IronPort-AV: E=Sophos;i="5.75,325,1589212800"; d="scan'208";a="146187473"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2020 08:20:27 +0800
IronPort-SDR: jTAm7rL0u89J7TW5U94xz0Fp2CE0qFP/KPupI3Yuxfm8bENDQsAfyS4BLeCO56qSivYAboHtE/
	4LBKLOWPJ4+bp2KQk2Tn8d9UsiLt0CYJE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Jul 2020 17:08:33 -0700
IronPort-SDR: bHbn4XD38LR2C3wkP/xeAgtjhowVfhjZ70s2tx3q+R4lmRJmdnlHgttLnuP+7Lfd9C/bZKpZCI
	6dJUNStkWw5w==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Jul 2020 17:20:26 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed,  8 Jul 2020 09:20:23 +0900
Message-Id: <20200708002023.738147-3-damien.lemoal@wdc.com>
In-Reply-To: <20200708002023.738147-1-damien.lemoal@wdc.com>
References: <20200708002023.738147-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 2/2] dm zoned: Remove set but unused variables
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In dmz_reclaim_work(), the variables nr_unmap_rnd and nr_rnd are set but
unused. Remove them.

Fixes: f97809aec589 ("dm zoned: per-device reclaim")
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-reclaim.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 9c6e264465bc..9c0ecc9568a4 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -503,7 +503,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 {
 	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
 	struct dmz_metadata *zmd = zrc->metadata;
-	unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
+	unsigned int p_unmap;
 	int ret;
 
 	if (dmz_dev_is_dying(zmd))
@@ -529,9 +529,6 @@ static void dmz_reclaim_work(struct work_struct *work)
 		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
 	}
 
-	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
-	nr_rnd = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
-
 	DMDEBUG("(%s/%u): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
 		dmz_metadata_label(zmd), zrc->dev_idx,
 		zrc->kc_throttle.throttle,
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

