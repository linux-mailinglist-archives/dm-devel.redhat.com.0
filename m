Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0387A528B42
	for <lists+dm-devel@lfdr.de>; Mon, 16 May 2022 18:55:05 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-shsvpylEN1eJjOtgLSoaqg-1; Mon, 16 May 2022 12:54:46 -0400
X-MC-Unique: shsvpylEN1eJjOtgLSoaqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67F7A29ABA0F;
	Mon, 16 May 2022 16:54:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DEDC40D1B99;
	Mon, 16 May 2022 16:54:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1CBEC1947073;
	Mon, 16 May 2022 16:54:43 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 086EE194704E
 for <dm-devel@listman.corp.redhat.com>; Mon, 16 May 2022 16:54:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D7EB0401E87; Mon, 16 May 2022 16:54:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3AA4492C14
 for <dm-devel@redhat.com>; Mon, 16 May 2022 16:54:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6AD9180075D
 for <dm-devel@redhat.com>; Mon, 16 May 2022 16:54:40 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-rGUYAt37Pa6d1o0HfxVMbA-1; Mon, 16 May 2022 12:54:38 -0400
X-MC-Unique: rGUYAt37Pa6d1o0HfxVMbA-1
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220516165436euoutp01e4fda86045b62a1ec4eaf7c3073df4c4~vpCdBc2tR2837628376euoutp01K
 for <dm-devel@redhat.com>; Mon, 16 May 2022 16:54:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220516165436euoutp01e4fda86045b62a1ec4eaf7c3073df4c4~vpCdBc2tR2837628376euoutp01K
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220516165435eucas1p25e4514aea76156f58bbd4b55393fe2a2~vpCbr4a7r0930109301eucas1p2z;
 Mon, 16 May 2022 16:54:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 14.4A.09887.BC182826; Mon, 16
 May 2022 17:54:35 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220516165434eucas1p12b178fb83cc93470933e3d72c40e9004~vpCahQk6u0957909579eucas1p1t;
 Mon, 16 May 2022 16:54:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220516165434eusmtrp221b0a508a330117089d1382091d5eaa5~vpCagXzN41030710307eusmtrp23;
 Mon, 16 May 2022 16:54:34 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-49-628281cb2e59
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.10.09404.9C182826; Mon, 16
 May 2022 17:54:33 +0100 (BST)
Received: from localhost (unknown [106.210.248.7]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220516165433eusmtip1f24d790faf28b78ebae9f4ad2376538f~vpCaBwBE00975309753eusmtip1g;
 Mon, 16 May 2022 16:54:33 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: axboe@kernel.dk, damien.lemoal@opensource.wdc.com, pankydev8@gmail.com,
 dsterba@suse.com, hch@lst.de
Date: Mon, 16 May 2022 18:54:14 +0200
Message-Id: <20220516165416.171196-12-p.raghav@samsung.com>
In-Reply-To: <20220516165416.171196-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBKsWRmVeSWpSXmKPExsWy7djPc7qnG5uSDP6dEbRYfbefzeL32fPM
 FnvfzWa1uPCjkcni5oGdTBZ7Fk1isli5+iiTRc+BDywWe29pW1x6vILdYs/ekywWl3fNYbOY
 v+wpu8WNCU8ZLT4vbWG3WHPzKYuDgMe/E2vYPHbOusvucflsqcemVZ1sHpuX1HvsvtkAFG69
 z+rxft9VNo++LasYPdZvucrisfl0tcfnTXIBPFFcNimpOZllqUX6dglcGX9X3WcvuK9b8fVu
 O1MD4xqVLkZODgkBE4ljTw8xdzFycQgJrGCUePJoGiOE84VRou/CaXYI5zOjxI+7s5hgWg5P
 WMzaxcgBlFjOKLHWESQsJPCcUeLE4hSQMJuAlkRjJztIWEQgS2LaiYdgM5kFDjNJPD86nxUk
 ISzgJvG5YxkLiM0ioCqx7+gGsDivgLXE//3vGSFWyUvMvPSdHWQmJ1B8dRc3RImgxMmZT8Ba
 mYFKmrfOBntAQmA5p8S3mYdZIXpdJBr/vWGHsIUlXh3fAmXLSPzfOR/qlWqJpzd+QzW3MEr0
 71zPBrJMAmhZ35kcEJNZQFNi/S59iHJHiV93jrBDVPBJ3HgrCHECn8SkbdOZIcK8Eh1tQhDV
 ShI7fz6BWiohcblpDgtEiYfE2vlGExgVZyH5ZRaSX2YhrF3AyLyKUTy1tDg3PbXYKC+1XK84
 Mbe4NC9dLzk/dxMjMPGd/nf8yw7G5a8+6h1iZOJgPMQowcGsJMJrUNGQJMSbklhZlVqUH19U
 mpNafIhRmoNFSZw3OXNDopBAemJJanZqakFqEUyWiYNTqoHJ5cXMyuX9W+VlX3/j803S51Pv
 1vn9Kcg/+PVxoQZTkYQVdfsi3mm84ZWPmBhsf7JYOrdr5fNmy8NXJA7d//v39dEY21Wqz8yZ
 TLxqtAwfqll4ixa+zFvjUmmpuvrymiQOtjus5/pP6xXtvlVTcehRimaDz/Y1YuKOEsWzV7ac
 fszlb35M+MPXC8Xu/Fp37VNu7F9wtqRgmnaD8up191UPbnr2VHF6dfSkuS3pwR+ulXk/9F1x
 W85n87SNiY7fPLRS/wg4O75I3HVdL13II3xxjaVm2L9KgdC33HKKF23LHj7KrZfjDzBaoM4U
 pP/k5Rmh8qy8K3PEM38+mdzJNzklIPj5g7jLS16uKnwSXq7EUpyRaKjFXFScCABUiwk/6wMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7onG5uSDGYcsrBYfbefzeL32fPM
 FnvfzWa1uPCjkcni5oGdTBZ7Fk1isli5+iiTRc+BDywWe29pW1x6vILdYs/ekywWl3fNYbOY
 v+wpu8WNCU8ZLT4vbWG3WHPzKYuDgMe/E2vYPHbOusvucflsqcemVZ1sHpuX1HvsvtkAFG69
 z+rxft9VNo++LasYPdZvucrisfl0tcfnTXIBPFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYm
 lnqGxuaxVkamSvp2NimpOZllqUX6dgl6GX9X3WcvuK9b8fVuO1MD4xqVLkZODgkBE4nDExaz
 djFycQgJLGWUuHzrFBtEQkLi9sImRghbWOLPtS42iKKnjBIzz78Dcjg42AS0JBo72UFqRAQK
 JOb0b2EBsZkFzjNJ7F/vDmILC7hJfO5YBhZnEVCV2Hd0AyuIzStgLfF//3uo+fISMy99ZwcZ
 yQkUX93FDRIWErCS+PrkFjtEuaDEyZlPoMbLSzRvnc08gVFgFpLULCSpBYxMqxhFUkuLc9Nz
 i430ihNzi0vz0vWS83M3MQIjdduxn1t2MK589VHvECMTB+MhRgkOZiURXoOKhiQh3pTEyqrU
 ovz4otKc1OJDjKZAZ09klhJNzgemirySeEMzA1NDEzNLA1NLM2MlcV7Pgo5EIYH0xJLU7NTU
 gtQimD4mDk6pBibRZ7c1v+UW/8pmsdngc7QoccO2z3KKRxmaZ9lt+nXt5rUDc9/+PbDd11V/
 roJ9yh+PE0fC5Ip8tS+dulrhX6wsEvB8vv41exshrZ+Mm5bfspSRabXwXfzuoKSlunpl0Eb1
 ++q8zo7LVwsv+yP+jO2F3PHrH+dt2VMwecaNwKcPn62fsp+PtWOayAbV339XZL4/3ntqxaVZ
 0fVTlnK/3tpbOjNFIXnJvAfy3bcmzxKQb/QwfmT3dXPZ5XkCBwrlM2QcGflWMbwJnDp75vML
 m+OVXJVbH1g9Y17Pamu43q1f3NA5ypQ5Ke3GBj3Bi3llGV+WFU1g4zrY6FxYyPqX+7yEz40v
 VzcIHJ0Z67P0jeNqJZbijERDLeai4kQAX7lHJV0DAAA=
X-CMS-MailID: 20220516165434eucas1p12b178fb83cc93470933e3d72c40e9004
X-Msg-Generator: CA
X-RootMTR: 20220516165434eucas1p12b178fb83cc93470933e3d72c40e9004
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220516165434eucas1p12b178fb83cc93470933e3d72c40e9004
References: <20220516165416.171196-1-p.raghav@samsung.com>
 <CGME20220516165434eucas1p12b178fb83cc93470933e3d72c40e9004@eucas1p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [dm-devel] [PATCH v4 11/13] null_blk: allow non power of 2 zoned
 devices
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
Cc: p.raghav@samsung.com, gost.dev@samsung.com, jiangbo.365@bytedance.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert the power of 2 based calculation with zone size to be generic in
null_zone_no with optimization for power of 2 based zone sizes.

The nr_zones calculation in null_init_zoned_dev has been replaced with a
division without special handling for power of 2 based zone sizes as
this function is called only during the initialization and will not
invoked in the hot path.

Performance Measurement:

Device:
zone size = 128M, blocksize=4k

FIO cmd:

fio --name=zbc --filename=/dev/nullb0 --direct=1 --zonemode=zbd  --size=23G
--io_size=<iosize> --ioengine=io_uring --iodepth=<iod> --rw=<mode> --bs=4k
--loops=4

The following results are an average of 4 runs on AMD Ryzen 5 5600X with
32GB of RAM:

Sequential Write:

x-----------------x---------------------------------x---------------------------------x
|     IOdepth     |            8                    |            16                   |
x-----------------x---------------------------------x---------------------------------x
|                 |  KIOPS   |BW(MiB/s) | Lat(usec) |  KIOPS   |BW(MiB/s) | Lat(usec) |
x-----------------x---------------------------------x---------------------------------x
| Without patch   |  578     |  2257    |   12.80   |  576     |  2248    |   25.78   |
x-----------------x---------------------------------x---------------------------------x
|  With patch     |  581     |  2268    |   12.74   |  576     |  2248    |   25.85   |
x-----------------x---------------------------------x---------------------------------x

Sequential read:

x-----------------x---------------------------------x---------------------------------x
| IOdepth         |            8                    |            16                   |
x-----------------x---------------------------------x---------------------------------x
|                 |  KIOPS   |BW(MiB/s) | Lat(usec) |  KIOPS   |BW(MiB/s) | Lat(usec) |
x-----------------x---------------------------------x---------------------------------x
| Without patch   |  667     |  2605    |   11.79   |  675     |  2637    |   23.49   |
x-----------------x---------------------------------x---------------------------------x
|  With patch     |  667     |  2605    |   11.79   |  675     |  2638    |   23.48   |
x-----------------x---------------------------------x---------------------------------x

Random read:

x-----------------x---------------------------------x---------------------------------x
| IOdepth         |            8                    |            16                   |
x-----------------x---------------------------------x---------------------------------x
|                 |  KIOPS   |BW(MiB/s) | Lat(usec) |  KIOPS   |BW(MiB/s) | Lat(usec) |
x-----------------x---------------------------------x---------------------------------x
| Without patch   |  522     |  2038    |   15.05   |  514     |  2006    |   30.87   |
x-----------------x---------------------------------x---------------------------------x
|  With patch     |  522     |  2039    |   15.04   |  523     |  2042    |   30.33   |
x-----------------x---------------------------------x---------------------------------x

Minor variations are noticed in Sequential write with io depth 8 and
in random read with io depth 16. But overall no noticeable differences
were noticed

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Reviewed by: Adam Manzanares <a.manzanares@samsung.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 drivers/block/null_blk/main.c  |  5 ++---
 drivers/block/null_blk/zoned.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 5cb4c92cd..53557e014 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1929,9 +1929,8 @@ static int null_validate_conf(struct nullb_device *dev)
 	if (dev->queue_mode == NULL_Q_BIO)
 		dev->mbps = 0;
 
-	if (dev->zoned &&
-	    (!dev->zone_size || !is_power_of_2(dev->zone_size))) {
-		pr_err("zone_size must be power-of-two\n");
+	if (dev->zoned && !dev->zone_size) {
+		pr_err("Invalid zero zone size\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
index dae54dd1a..00c34e65e 100644
--- a/drivers/block/null_blk/zoned.c
+++ b/drivers/block/null_blk/zoned.c
@@ -13,7 +13,10 @@ static inline sector_t mb_to_sects(unsigned long mb)
 
 static inline unsigned int null_zone_no(struct nullb_device *dev, sector_t sect)
 {
-	return sect >> ilog2(dev->zone_size_sects);
+	if (is_power_of_2(dev->zone_size_sects))
+		return sect >> ilog2(dev->zone_size_sects);
+
+	return div64_u64(sect, dev->zone_size_sects);
 }
 
 static inline void null_lock_zone_res(struct nullb_device *dev)
@@ -62,10 +65,6 @@ int null_init_zoned_dev(struct nullb_device *dev, struct request_queue *q)
 	sector_t sector = 0;
 	unsigned int i;
 
-	if (!is_power_of_2(dev->zone_size)) {
-		pr_err("zone_size must be power-of-two\n");
-		return -EINVAL;
-	}
 	if (dev->zone_size > dev->size) {
 		pr_err("Zone size larger than device capacity\n");
 		return -EINVAL;
@@ -83,8 +82,9 @@ int null_init_zoned_dev(struct nullb_device *dev, struct request_queue *q)
 	zone_capacity_sects = mb_to_sects(dev->zone_capacity);
 	dev_capacity_sects = mb_to_sects(dev->size);
 	dev->zone_size_sects = mb_to_sects(dev->zone_size);
-	dev->nr_zones = round_up(dev_capacity_sects, dev->zone_size_sects)
-		>> ilog2(dev->zone_size_sects);
+	dev->nr_zones =
+		div64_u64(roundup(dev_capacity_sects, dev->zone_size_sects),
+			  dev->zone_size_sects);
 
 	dev->zones = kvmalloc_array(dev->nr_zones, sizeof(struct nullb_zone),
 				    GFP_KERNEL | __GFP_ZERO);
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

