Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2665E80D3
	for <lists+dm-devel@lfdr.de>; Fri, 23 Sep 2022 19:36:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663954596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ad+JM6xSJjpTmRmlQWqiotaoxVVcKHXpm6CsR+KIJAk=;
	b=NgU+tG4IRpaIW97241vTr7sCmm81VjdfzBn7u1O/TilfZ6NCwnmWzlqGEiCy/NIZx1qpvc
	oxDidpdtIdldCq/wSfj7noSxra5pLK4SIIUZ0aEOvC2YIOYV5sS0Sby+dsAvLoNuM5+sw+
	ysOxdzBX+i5N7MYGtRfSLlGMPwLpPb8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-KKMBiCIwNPyf-hNkqN6ZKQ-1; Fri, 23 Sep 2022 13:36:34 -0400
X-MC-Unique: KKMBiCIwNPyf-hNkqN6ZKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EBD53817A6C;
	Fri, 23 Sep 2022 17:36:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 935992166B2A;
	Fri, 23 Sep 2022 17:36:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 80C7D1946A41;
	Fri, 23 Sep 2022 17:36:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE69C1946A6B
 for <dm-devel@listman.corp.redhat.com>; Fri, 23 Sep 2022 17:36:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9CDC492B09; Fri, 23 Sep 2022 17:36:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 514A7492B23
 for <dm-devel@redhat.com>; Fri, 23 Sep 2022 17:36:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D9133C0ED4C
 for <dm-devel@redhat.com>; Fri, 23 Sep 2022 17:36:28 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-GwcNte1BNU6HgNE6sFovjg-1; Fri, 23 Sep 2022 13:36:26 -0400
X-MC-Unique: GwcNte1BNU6HgNE6sFovjg-1
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220923173624euoutp024210e1e132895605673595f98619ba0d~XjeEEH_kf3253832538euoutp02H
 for <dm-devel@redhat.com>; Fri, 23 Sep 2022 17:36:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220923173624euoutp024210e1e132895605673595f98619ba0d~XjeEEH_kf3253832538euoutp02H
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220923173623eucas1p1dad22e762fe16e9eb6c02b41af6face5~XjeCw0CEW1387913879eucas1p1I;
 Fri, 23 Sep 2022 17:36:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 37.6E.29727.79EED236; Fri, 23
 Sep 2022 18:36:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220923173623eucas1p2aeb5444a1005282b630706d60e18a5ba~XjeCUv3rP2090620906eucas1p2n;
 Fri, 23 Sep 2022 17:36:23 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220923173623eusmtrp2fe054883406ab7055b944b61df5f343e~XjeCT9xQW1023410234eusmtrp26;
 Fri, 23 Sep 2022 17:36:23 +0000 (GMT)
X-AuditID: cbfec7f2-21dff7000001741f-24-632dee976d0a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F6.5F.10862.69EED236; Fri, 23
 Sep 2022 18:36:22 +0100 (BST)
Received: from localhost (unknown [106.210.248.168]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220923173622eusmtip2c0540e9f14c865c26a3d716ffafd7507~XjeB8pCXF2337923379eusmtip2b;
 Fri, 23 Sep 2022 17:36:22 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: snitzer@kernel.org, axboe@kernel.dk, agk@redhat.com, hch@lst.de,
 damien.lemoal@opensource.wdc.com
Date: Fri, 23 Sep 2022 19:36:08 +0200
Message-Id: <20220923173618.6899-4-p.raghav@samsung.com>
In-Reply-To: <20220923173618.6899-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7djPc7rT3+kmG6xcIG2x/tQxZovVd/vZ
 LKZ9+Mls8fvseWaLve9ms1rcPLCTyWLPoklMFitXH2WyeLJ+FrPF3657TBZ7b2lbXN41h81i
 /rKn7BYT2r4yW9yY8JTR4vPSFnaLNTefslicuCXtIORx+Yq3x85Zd9k9Lp8t9di0qpPNY/OS
 eo/dNxvYPHa23mf1eL/vKptH35ZVjB6bT1d7fN4k59F+oJspgCeKyyYlNSezLLVI3y6BK2P9
 vh6mgpUaFbfONLI2MH5U6GLk5JAQMJHY9XgPexcjF4eQwApGifcNLxkhnC+MErdvTGaFcD4z
 SvybNIURpuXbpo1sEInljBLLH1yFcl4CtXxuBBrGwcEmoCXR2MkO0iAikC5xfOtNMJtZoJ9Z
 4va+XBBbWCBG4sz0XrChLAKqEjNbv4PV8ApYSMw+944VYpm8xMxL38FGcgpYSvQ31kCUCEqc
 nPmEBWKkvETz1tnMICdICGzmlDi6cSkLRK+LRNOZXqijhSVeHd/CDmHLSPzfOZ8Jwq6WeHrj
 N1RzC6NE/871bCDLJASsJfrO5ICYzAKaEut36UOUO0pcWb2KHaKCT+LGW0GIE/gkJm2bzgwR
 5pXoaBOCqFaS2PnzCdRSCYnLTXOgDvOQWH62lXUCo+IsJM/MQvLMLIS9CxiZVzGKp5YW56an
 FhvmpZbrFSfmFpfmpesl5+duYgSmw9P/jn/awTj31Ue9Q4xMHIyHGCU4mJVEeFMu6iYL8aYk
 VlalFuXHF5XmpBYfYpTmYFES52WboZUsJJCeWJKanZpakFoEk2Xi4JRqYOp5Yq4UfWFPoYyZ
 33G38GtRq0Mj/thsCPs62zD23vJ/B5ftfPTxbLXz/6gfOpt5/sk+OdmQV7dy/cXb18qThMR9
 Xn6TbjrTLnuk5naem36X+cGpm6f0mj+V/Wa9a2Wv/pILTAu7LGxuljz5qvAnwmLmp960M9cj
 2F8nMiZf54vvkth7sm9Kkkdk14uCI/bnusU+3TRxvT7hke1yfW0HN9fV54XfTp3DtO9yy7/g
 zPro2wpqx45ufsjov09YdYVtXMmhQqWXtwv7dt7QuKO5z6frasNeu31vlItDLmhNiH3rwLrn
 S+1coaVHZntP3Lk9fnrY3d63Xbn/6w5wZc58ZcXzJMutzK32SJDn+sTtcbJKLMUZiYZazEXF
 iQD4xOOz9gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xe7rT3ukmGzxoMLNYf+oYs8Xqu/1s
 FtM+/GS2+H32PLPF3nezWS1uHtjJZLFn0SQmi5WrjzJZPFk/i9nib9c9Jou9t7QtLu+aw2Yx
 f9lTdosJbV+ZLW5MeMpo8XlpC7vFmptPWSxO3JJ2EPK4fMXbY+esu+wel8+Wemxa1cnmsXlJ
 vcfumw1sHjtb77N6vN93lc2jb8sqRo/Np6s9Pm+S82g/0M0UwBOlZ1OUX1qSqpCRX1xiqxRt
 aGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl7F+Xw9TwUqNiltnGlkbGD8qdDFy
 ckgImEh827SRrYuRi0NIYCmjxJuGH6wQCQmJ2wubGCFsYYk/17qgip4zSpxauwCoiIODTUBL
 orGTHaRGRCBX4tjae6wgNcwC85klvk4+xAaSEBaIklj9fA9YEYuAqsTM1u9gNq+AhcTsc++g
 lslLzLwEEufg4BSwlOhvrAEJCwGVnF/8CKpcUOLkzCcsIDYzUHnz1tnMExgFZiFJzUKSWsDI
 tIpRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwdrcd+7llB+PKVx/1DjEycTAeYpTgYFYS4U25
 qJssxJuSWFmVWpQfX1Sak1p8iNEU6OyJzFKiyfnA5JFXEm9oZmBqaGJmaWBqaWasJM7rWdCR
 KCSQnliSmp2aWpBaBNPHxMEp1cC0YemBvKgqxTnhFZrRcy37zk/7ZLD1ost+zWMlN5bmJYoe
 +DLRUufgTJvcYwcOciULG666YNiaVm+xYImFPQNHWsixN5u1F4iE3i1/fvOjWW7Pqmsvj7Vf
 TGArv+7+qdT9wnsxrX+pjlk/OifV8Cy63zGxMF9NiOXqm4eJ7vvZ+HfO2PjiQKslY9PlHfuT
 3Ve8P/wz+FilvV7d1t6824LaL0VX1vIYn3K6FHeu42JOsJ6Y/54nQVw7+x+ebTt647dMlNiX
 mNikc/FnZnvtbavyaDn6Oal+Tqdo780J0TMmJgrrmD0L+miT5Ncg0LCEjfM9/ySZ/W7ZjT0b
 BXv3au38Zleu9tP8sSzztZe3DoYpsRRnJBpqMRcVJwIATUNGzGYDAAA=
X-CMS-MailID: 20220923173623eucas1p2aeb5444a1005282b630706d60e18a5ba
X-Msg-Generator: CA
X-RootMTR: 20220923173623eucas1p2aeb5444a1005282b630706d60e18a5ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220923173623eucas1p2aeb5444a1005282b630706d60e18a5ba
References: <20220923173618.6899-1-p.raghav@samsung.com>
 <CGME20220923173623eucas1p2aeb5444a1005282b630706d60e18a5ba@eucas1p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [dm-devel] [PATCH v15 03/13] block: allow blk-zoned devices to have
 non-power-of-2 zone size
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Pankaj Raghav <p.raghav@samsung.com>, bvanassche@acm.org,
 pankydev8@gmail.com, gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com, Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 jaegeuk@kernel.org, matias.bjorling@wdc.com,
 Luis Chamberlain <mcgrof@kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Checking if a given sector is aligned to a zone is a common
operation that is performed for zoned devices. Add
bdev_is_zone_start helper to check for this instead of opencoding it
everywhere.

Convert the calculations on zone size to be generic instead of relying on
power-of-2(po2) based arithmetic in the block layer using the helpers
wherever possible.

The only hot path affected by this change for zoned devices with po2
zone size is in blk_check_zone_append() but bdev_is_zone_start() helper is
used to optimize the calculation for po2 zone sizes.

Finally, allow zoned devices with non po2 zone sizes provided that their
zone capacity and zone size are equal. The main motivation to allow zoned
devices with non po2 zone size is to remove the unmapped LBA between
zone capcity and zone size for devices that cannot have a po2 zone
capacity.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 block/blk-core.c       |  2 +-
 block/blk-zoned.c      | 24 ++++++++++++++++++------
 include/linux/blkdev.h | 30 ++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 203be672da52..ed5afdb39751 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -559,7 +559,7 @@ static inline blk_status_t blk_check_zone_append(struct request_queue *q,
 		return BLK_STS_NOTSUPP;
 
 	/* The bio sector must point to the start of a sequential zone */
-	if (bio->bi_iter.bi_sector & (bdev_zone_sectors(bio->bi_bdev) - 1) ||
+	if (!bdev_is_zone_start(bio->bi_bdev, bio->bi_iter.bi_sector) ||
 	    !bio_zone_is_seq(bio))
 		return BLK_STS_IOERR;
 
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index dce9c95b4bcd..6806c69c81dc 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -285,10 +285,10 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_op op,
 		return -EINVAL;
 
 	/* Check alignment (handle eventual smaller last zone) */
-	if (sector & (zone_sectors - 1))
+	if (!bdev_is_zone_start(bdev, sector))
 		return -EINVAL;
 
-	if ((nr_sectors & (zone_sectors - 1)) && end_sector != capacity)
+	if (!bdev_is_zone_start(bdev, nr_sectors) && end_sector != capacity)
 		return -EINVAL;
 
 	/*
@@ -486,14 +486,26 @@ static int blk_revalidate_zone_cb(struct blk_zone *zone, unsigned int idx,
 	 * smaller last zone.
 	 */
 	if (zone->start == 0) {
-		if (zone->len == 0 || !is_power_of_2(zone->len)) {
-			pr_warn("%s: Invalid zoned device with non power of two zone size (%llu)\n",
-				disk->disk_name, zone->len);
+		if (zone->len == 0) {
+			pr_warn("%s: Invalid zero zone size", disk->disk_name);
+			return -ENODEV;
+		}
+
+		/*
+		 * Non power-of-2 zone size support was added to remove the
+		 * gap between zone capacity and zone size. Though it is technically
+		 * possible to have gaps in a non power-of-2 device, Linux requires
+		 * the zone size to be equal to zone capacity for non power-of-2
+		 * zoned devices.
+		 */
+		if (!is_power_of_2(zone->len) && zone->capacity < zone->len) {
+			pr_err("%s: Invalid zone capacity %lld with non power-of-2 zone size %lld",
+			       disk->disk_name, zone->capacity, zone->len);
 			return -ENODEV;
 		}
 
 		args->zone_sectors = zone->len;
-		args->nr_zones = (capacity + zone->len - 1) >> ilog2(zone->len);
+		args->nr_zones = div64_u64(capacity + zone->len - 1, zone->len);
 	} else if (zone->start + args->zone_sectors < capacity) {
 		if (zone->len != args->zone_sectors) {
 			pr_warn("%s: Invalid zoned device with non constant zone size\n",
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 6cf43f9384cc..e29799076298 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -704,6 +704,30 @@ static inline unsigned int disk_zone_no(struct gendisk *disk, sector_t sector)
 	return div64_u64(sector, zone_sectors);
 }
 
+static inline sector_t bdev_offset_from_zone_start(struct block_device *bdev,
+						   sector_t sec)
+{
+	sector_t zone_sectors = bdev_zone_sectors(bdev);
+	u64 remainder = 0;
+
+	if (!bdev_is_zoned(bdev))
+		return 0;
+
+	if (is_power_of_2(zone_sectors))
+		return sec & (zone_sectors - 1);
+
+	div64_u64_rem(sec, zone_sectors, &remainder);
+	return remainder;
+}
+
+static inline bool bdev_is_zone_start(struct block_device *bdev, sector_t sec)
+{
+	if (!bdev_is_zoned(bdev))
+		return false;
+
+	return bdev_offset_from_zone_start(bdev, sec) == 0;
+}
+
 static inline bool disk_zone_is_seq(struct gendisk *disk, sector_t sector)
 {
 	if (!blk_queue_is_zoned(disk->queue))
@@ -748,6 +772,12 @@ static inline unsigned int disk_zone_no(struct gendisk *disk, sector_t sector)
 {
 	return 0;
 }
+
+static inline bool bdev_is_zone_start(struct block_device *bdev, sector_t sec)
+{
+	return false;
+}
+
 static inline unsigned int bdev_max_open_zones(struct block_device *bdev)
 {
 	return 0;
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

