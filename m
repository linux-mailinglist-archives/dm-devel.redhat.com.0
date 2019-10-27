Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DD63BE62EA
	for <lists+dm-devel@lfdr.de>; Sun, 27 Oct 2019 15:07:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572185226;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ovbr3mI7gTPKZmAg49CVD/ZKwpMKg2um+R/om2Faw4I=;
	b=Czl2wGY7rR+Yf6+s1a+pH/2NkifY/sSWW9GLGc/XHe/Jyd2Je7g+Zwf9KLwOrHwZDuJ1uc
	kdSJ9yyGHVWdndBaP46xeIeYxy2rCi2H+k8C1hB4202zWc/im0NWOPkWE+P6Q/90RZs5Aa
	+M+Qh7PzljXgBXG5LVEp9vcOk411Kek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-b2ePK5l9MiuTsk_w0VHKXA-1; Sun, 27 Oct 2019 10:07:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 118C6801E5C;
	Sun, 27 Oct 2019 14:06:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D91985C1D4;
	Sun, 27 Oct 2019 14:06:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34E681803B4B;
	Sun, 27 Oct 2019 14:06:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9RE6kM3007618 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Oct 2019 10:06:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD5345C207; Sun, 27 Oct 2019 14:06:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9513A5C1D4;
	Sun, 27 Oct 2019 14:06:42 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0151308FC22;
	Sun, 27 Oct 2019 14:06:21 +0000 (UTC)
IronPort-SDR: L8KTBiLLtHsSYVspoWnJMkIrbVCnGE/D1u+HoSJI+UYY4mhoIlFpYyOzG+hVgNHgwREND57Yg/
	ujaWSoyhcTW0SpBJ134i6HxBfmYi5T9khw8hbXC5SgGRHAzHwOPadlBSoHIReyrJeqLdPu3LXU
	FVCFhjH8Ma6vgwZ9Xp+U6cp3qoTRWFcd/iBbnilnLFXu5WWWgoPvfyopV9OHoRrLuqLPNltPfS
	GdYYYWT9xFlNsvKolJmeIzdTBpGn3sWHPQrCQwlzC6k7vp2sf5oF30AmOq5cbYBaj2UJaDBa0d
	7e4=
X-IronPort-AV: E=Sophos;i="5.68,236,1569254400"; d="scan'208";a="122197756"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2019 22:05:56 +0800
IronPort-SDR: i87f5Dk2WnhuzcIj2TcTpY95GBTXhRvPLb5caGlQtHUH99Slye6pn38jZo6MiVKkoTYROuZ1GQ
	tbMjWtJm9VR32qe6Hx/jbKlHEmc7KKpbRtvx/mMdJtADzXL6zTsvx7N4fARdgwTgf0pAvVmPr/
	M5qbkvBmiLxlWuNKND2ibo7uMewtTPiBaw1aSoetx65PNFbSLbQmXGtN2M86SJq9KKCD6vVNAb
	k0op43oEDRmUFtS/VhKPc4hO1nVF5F6pPcvvpmsBtR+BoKzgOpU3WyvJe4PEhP0o72BKyGQviu
	sQVJRi5v2hDBlPav7XEzWg87
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Oct 2019 07:01:24 -0700
IronPort-SDR: 2YCBqSRDcWASCl8YStSibU0PXrCLarn1VLq9+3nOA39lnDeEgKmjffRs2FSLIdBt78B6g289Y+
	4H/Kzpq2H96aNY2aPyxHEYRl6ePMHPqZ7cySs7eQ6fxx1skDkE7z2v0bDvbGp4/FuGBTWAw4aK
	NU0bmCoQbWs8QW4qLu31wFfBFJzIB3fGED0OTfdwTb02nWewnAkkdWnAMvsrc/h6GsCQwSs6j8
	kFQRz5XJaBP/OUQy9IJZfENs78yPLPaKK9vkrWUkoNeun+zShcID70uSObMwfyXRXCKKoyu8bT
	nMA=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 07:05:54 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sun, 27 Oct 2019 23:05:43 +0900
Message-Id: <20191027140549.26272-3-damien.lemoal@wdc.com>
In-Reply-To: <20191027140549.26272-1-damien.lemoal@wdc.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Sun, 27 Oct 2019 14:06:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sun, 27 Oct 2019 14:06:30 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=196f58c8b=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 2/8] block: Simplify REQ_OP_ZONE_RESET_ALL
	handling
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
X-MC-Unique: b2ePK5l9MiuTsk_w0VHKXA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is no need for the function __blkdev_reset_all_zones() as
REQ_OP_ZONE_RESET_ALL can be handled directly in blkdev_reset_zones()
bio loop with an early break from the loop. This patch removes this
function and modifies blkdev_reset_zones(), simplifying the code.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c | 40 +++++++++++++---------------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 7fe376eede86..14785011e798 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -202,32 +202,14 @@ int blkdev_report_zones(struct block_device *bdev, sector_t sector,
 }
 EXPORT_SYMBOL_GPL(blkdev_report_zones);
 
-/*
- * Special case of zone reset operation to reset all zones in one command,
- * useful for applications like mkfs.
- */
-static int __blkdev_reset_all_zones(struct block_device *bdev, gfp_t gfp_mask)
-{
-	struct bio *bio = bio_alloc(gfp_mask, 0);
-	int ret;
-
-	/* across the zones operations, don't need any sectors */
-	bio_set_dev(bio, bdev);
-	bio_set_op_attrs(bio, REQ_OP_ZONE_RESET_ALL, 0);
-
-	ret = submit_bio_wait(bio);
-	bio_put(bio);
-
-	return ret;
-}
-
 static inline bool blkdev_allow_reset_all_zones(struct block_device *bdev,
+						sector_t sector,
 						sector_t nr_sectors)
 {
 	if (!blk_queue_zone_resetall(bdev_get_queue(bdev)))
 		return false;
 
-	if (nr_sectors != part_nr_sects_read(bdev->bd_part))
+	if (sector || nr_sectors != part_nr_sects_read(bdev->bd_part))
 		return false;
 	/*
 	 * REQ_OP_ZONE_RESET_ALL can be executed only if the block device is
@@ -270,9 +252,6 @@ int blkdev_reset_zones(struct block_device *bdev,
 		/* Out of range */
 		return -EINVAL;
 
-	if (blkdev_allow_reset_all_zones(bdev, nr_sectors))
-		return  __blkdev_reset_all_zones(bdev, gfp_mask);
-
 	/* Check alignment (handle eventual smaller last zone) */
 	zone_sectors = blk_queue_zone_sectors(q);
 	if (sector & (zone_sectors - 1))
@@ -283,17 +262,24 @@ int blkdev_reset_zones(struct block_device *bdev,
 		return -EINVAL;
 
 	while (sector < end_sector) {
-
 		bio = blk_next_bio(bio, 0, gfp_mask);
-		bio->bi_iter.bi_sector = sector;
 		bio_set_dev(bio, bdev);
-		bio_set_op_attrs(bio, REQ_OP_ZONE_RESET, 0);
 
+		/*
+		 * Special case for the zone reset operation that reset all
+		 * zones, this is useful for applications like mkfs.
+		 */
+		if (blkdev_allow_reset_all_zones(bdev, sector, nr_sectors)) {
+			bio->bi_opf = REQ_OP_ZONE_RESET_ALL;
+			break;
+		}
+
+		bio->bi_opf = REQ_OP_ZONE_RESET;
+		bio->bi_iter.bi_sector = sector;
 		sector += zone_sectors;
 
 		/* This may take a while, so be nice to others */
 		cond_resched();
-
 	}
 
 	ret = submit_bio_wait(bio);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

