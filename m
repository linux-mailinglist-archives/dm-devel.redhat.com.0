Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4AA1F120E
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jun 2020 06:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591590186;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zZiQZnLYlq0n/fuJhxd4nFzllaM/LfzEPsbxohFVuzA=;
	b=XvtmXhrFi/naktANOOYNpGCh4ikle1IpTgVyT1YS4lXqNR5GKHVEnkpzZ+c7+MI2v2FYAa
	okW3URUnTm7wOLOZXOZk+e6+eyTi4kizr5GglQvwt1r/gvDPyt1A8iwYAkzzj4RN47RCrJ
	6T0TBOkbx73dPrjdIQi16GKXTRxvQ7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-l5_0rt1jNUaT8od2b44U2A-1; Mon, 08 Jun 2020 00:23:03 -0400
X-MC-Unique: l5_0rt1jNUaT8od2b44U2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C2791854C44;
	Mon,  8 Jun 2020 04:22:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B0081A933;
	Mon,  8 Jun 2020 04:22:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C3A27CCC6;
	Mon,  8 Jun 2020 04:22:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0584ME7X024823 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 00:22:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A1A572156A2D; Mon,  8 Jun 2020 04:22:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 918EF2157F25
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 04:22:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A19E8007A4
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 04:22:09 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-414-JIGcL0duMhCmOqMc0bQ5kA-1; Mon, 08 Jun 2020 00:22:05 -0400
X-MC-Unique: JIGcL0duMhCmOqMc0bQ5kA-1
IronPort-SDR: 0e4JekNq5G/4osPYNMnl6hM/F2Xs+g3stFAqOHGZ+xtS1UHdh74G/iX86Og1LBIq8st1pZlaEH
	6J92tGvREzKq9yHrSGiJtlzbVzUW86iMzXnrK2EMhWegM+VrOXK4YPKFeC/le6w4ufhQ3kOU6o
	sZeDnH/Zir5+QnDql0jYW2uu9y04QFlXx+TcdYNOGNIY1y+XQsMauG86dQ7OIJvMjLBAeLbDgd
	xbWKLfO8x5ZIudBALAz+GqXjKfh3PmfOs6qyGuetKvA2ADBYcsckbn5DH4/lDT+Ki58KD7Wz2T
	keA=
X-IronPort-AV: E=Sophos;i="5.73,486,1583164800"; d="scan'208";a="143742627"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 08 Jun 2020 12:21:00 +0800
IronPort-SDR: d+pgl+hzRPjlOgSel00yEG3nbSX5f9LeQIT0XZUGEBripcEFmZ7cz/ti1+uNxfGi2pZdh0iYrE
	5FspN59E68kSwTdVfxTYH3nnP2pgwJdlE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Jun 2020 21:10:31 -0700
IronPort-SDR: qqNHx7tggcIJhSV/U4BKFam/i3dJAPOd6MdPB0hzdQRzCEd2Zq0QwatKwAZbYB8YiuWdl8PQQd
	sHS2CoCGWHjg==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Jun 2020 21:21:00 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Mon,  8 Jun 2020 13:20:59 +0900
Message-Id: <20200608042059.1256086-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm zoned: Fix uninitialized pointer dereference
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make sure that the local variable rzone in dmz_do_reclaim() is always
initialized before being used for printing debug messages.

Fixes: f97809aec589 ("dm zoned: per-device reclaim")
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-reclaim.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 2261b4dd60b7..dd1eebf6e50f 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -377,6 +377,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 			dmz_metadata_label(zmd), zrc->dev_idx);
 		return -EBUSY;
 	}
+	rzone = dzone;
 
 	start = jiffies;
 	if (dmz_is_cache(dzone) || dmz_is_rnd(dzone)) {
@@ -391,8 +392,6 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 			 */
 			ret = dmz_reclaim_rnd_data(zrc, dzone);
 		}
-		rzone = dzone;
-
 	} else {
 		struct dm_zone *bzone = dzone->bzone;
 		sector_t chunk_block = 0;
@@ -415,7 +414,6 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 			 * be later reclaimed.
 			 */
 			ret = dmz_reclaim_seq_data(zrc, dzone);
-			rzone = dzone;
 		}
 	}
 out:
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

