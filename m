Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51251D2E9
	for <lists+dm-devel@lfdr.de>; Fri,  6 May 2022 10:12:03 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-pMJ9KFMvOVe-QJ_pURKpsw-1; Fri, 06 May 2022 04:11:38 -0400
X-MC-Unique: pMJ9KFMvOVe-QJ_pURKpsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7C641014A6C;
	Fri,  6 May 2022 08:11:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 865CF40CF915;
	Fri,  6 May 2022 08:11:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6BA4D1947B87;
	Fri,  6 May 2022 08:11:33 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CF7171947056
 for <dm-devel@listman.corp.redhat.com>; Fri,  6 May 2022 08:11:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BB35E9E93; Fri,  6 May 2022 08:11:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6BB99E92
 for <dm-devel@redhat.com>; Fri,  6 May 2022 08:11:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4765C3C01C06
 for <dm-devel@redhat.com>; Fri,  6 May 2022 08:11:22 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-VSOZGQSUN9SX_PV5ssmgog-1; Fri, 06 May 2022 04:11:20 -0400
X-MC-Unique: VSOZGQSUN9SX_PV5ssmgog-1
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220506081119euoutp028afa10b1ebb8b969a889d3c4bcf04e99~sdctYaRHE2420124201euoutp02s
 for <dm-devel@redhat.com>; Fri,  6 May 2022 08:11:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220506081119euoutp028afa10b1ebb8b969a889d3c4bcf04e99~sdctYaRHE2420124201euoutp02s
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220506081117eucas1p18560a75e4c11c411a21dbd469ad119e1~sdcrdIYrQ1150211502eucas1p1S;
 Fri,  6 May 2022 08:11:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7B.17.10009.528D4726; Fri,  6
 May 2022 09:11:17 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220506081116eucas1p2cce67bbf30f4c9c4e6854965be41b098~sdcq5Y3zG1330813308eucas1p2T;
 Fri,  6 May 2022 08:11:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220506081116eusmtrp2b8dd7ad2a8ccfb56457e86d224868712~sdcq4cJxT2593625936eusmtrp2h;
 Fri,  6 May 2022 08:11:16 +0000 (GMT)
X-AuditID: cbfec7f2-e95ff70000002719-a6-6274d825056e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 42.03.09522.428D4726; Fri,  6
 May 2022 09:11:16 +0100 (BST)
Received: from localhost (unknown [106.210.248.174]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220506081116eusmtip2afe9c6ce26251602c1ec15efeec5e217~sdcqkJr1p2097920979eusmtip2b;
 Fri,  6 May 2022 08:11:16 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, hare@suse.de, dsterba@suse.com, axboe@kernel.dk,
 hch@lst.de, damien.lemoal@opensource.wdc.com, snitzer@kernel.org
Date: Fri,  6 May 2022 10:11:04 +0200
Message-Id: <20220506081105.29134-11-p.raghav@samsung.com>
In-Reply-To: <20220506081105.29134-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxjG8/U7PT00KR4KCV8ARTqZDlcciRlfpuJ0GxwyXWYyNqJZpMrh
 ErmYFjYufwwBQcBJxSnSiiBhykWtUgTLpdEayn2aclmp2QhCycBC3QChMnGUg5n//d73e973
 ed7ko6D4FulFxSelsPIkWYKEFBJNRsdvUn9zyrGPSqs8sabHCPGbNiOJ6/8oJvGlFw6IS4ov
 C/By/2OI22fVfPxk6RQPjzzQ8XBbVQkP19Z38PCERgXx2QcvCFybOwbxv2NBeGzeQuASwzDA
 1iEVD7dbtmPTeI0At7V3E3ig5QqJK65bBViZtwCxWWkF+Hynlo/nfs0V4NvP7QTusnh/upEZ
 GPySWem6STLnc2YFzOM/7xLMQH8q01BXQDLXsi5CRlv9E9M6kkUyP+fMkozu9CifseuHSOZc
 Yx1gNI1DBKPtzWSU2rv8r8WHhbuj2YT4H1j5jpAoYVxLeTM8OS5N653+C2YBzZZC4EIheicy
 vxokCoGQEtM1AC0uLAu4Yh6ghrybgCvmACq5/ZB8O/J62MZ3spi+AZBpMp4TTQF0eW4RFgKK
 IukAdKpgbZMHXQRQ8Wi+wDkAaS0fPbkV42R3OhSVjTv1LhRB+6OrttY1AxH9Cbq4+BJyZr6o
 zLS4Nuuy2s++MLWucUPdZRMEt9MX5dxTr+trhUhZ6sHx56jjTgXBsTua7mwUcOyD3ugqeBxn
 Iqt5GTqDIjp3NahOQzoPQPQudK4vwYmQ/gBpWnZw3X1If30Th67IPOPGBXBFJU2lkGuL0Jk8
 MbdbgnSOiXVPhAayr6xnYVDZSi1PCfxU75yieucU1f+2lQDWAU82VZEYyyqCktgfAxWyREVq
 Umzg8eTEBrD6o3tXOv+5D8qn/w40AB4FDABRUOIhclelHBOLomXpGaw8+ag8NYFVGIA3RUg8
 Rcfj78jEdKwshT3BsidZ+dtXHuXilcXzsnh1tB0pju7Hu/M+Hv3OxxHZNfmqIPmwVBrep7aa
 JBF+B6PSctn85w+NTRulfuXpOTUsk/Ht3hMrwV/s37Cn2br/Uc/32yqYpsyl1wdW3CMaN8ds
 zjV+Ftp92u1pyGya6aBtbM9g61BVwGRwmFeIuskUI7of4Tr44aZ7Wx16y6POopehcSP1v9fo
 3Cu2C23ZKTVhSzOZ+b6Vz5r1+qQzect2cKTP29YQrt7Qe9V81NPHrv1mBnp6LDvCWctXU9WR
 i11RsFIZadi7YJgPLop27FKktxqIfVvea/vl6bXgA2q7yG4/u63vkLFnOMNfGmXrrQ7beeF9
 Dx+i50byszF9soRQxMmCAqBcIfsPe4nZZkAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsVy+t/xe7oqN0qSDBr3GlqsP3WM2eL/nmNs
 Fqvv9rNZTPvwk9liUv8MdovfZ88zW+x9N5vV4sKPRiaLmwd2MlnsWTSJyWLl6qNMFk/Wz2K2
 6DnwgcViZctDZos/Dw0tHn65xWIx6dA1RounV2cxWey9pW1x6fEKdos9e0+yWFzeNYfNYv6y
 p+wWE9q+MlvcmPCU0WLi8c2sFp+XtrBbrHv9nsXixC1pB1mPy1e8Pf6dWMPmMbH5HbvH+Xsb
 WTwuny312LSqk81jYcNUZo/NS+o9dt9sYPPobX7H5rGz9T6rx/t9V9k8+rasYvRYv+Uqi8fm
 09UeEzZvZA0QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxL
 LdK3S9DL2DV3O3PBY92K069eMDcwrlfpYuTkkBAwkfh77Q1rFyMXh5DAUkaJK4evsUMkJCRu
 L2xihLCFJf5c62KDKHrOKPG//SZQEQcHm4CWRGMnO0hcRGAqo8SldSdZQBxmgdOsEls3HWAC
 6RYWcJOY+fg7M4jNIqAqMe/NbjYQm1fASmLq92/MEBvkJWZe+g62mRMo3jT5JViNkIClxPwl
 e1gh6gUlTs58wgJiMwPVN2+dzTyBUWAWktQsJKkFjEyrGEVSS4tz03OLDfWKE3OLS/PS9ZLz
 czcxApPKtmM/N+9gnPfqo94hRiYOxkOMEhzMSiK8wrNKkoR4UxIrq1KL8uOLSnNSiw8xmgLd
 PZFZSjQ5H5jW8kriDc0MTA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUamPh5
 otWbW6LLcvnYl5dub7hT0Mi0J+5k2ZKCg74mbC2t3+IWz+dTX5lXWPzBrrXIZ/LdSyIysrl+
 hfM02iQ/SYpcWn3lU92PHQX8ByxMmve9TDBXspw33VA1xfCwXdq8b4/kZYIrUple3pHTEnJ9
 f+/kTq6yiPrWI6e3fVw5LTP1zAXlUuZ2bb6Lp7WZdITeiR65zd2+4/mS4pfsu/buv/GQrXDP
 lHylFc6T+zdsT1vwXUOm3TQu58isGOWcZZ/OSGXqrL11OeKtkVoDj+x1Wal81Y5vJyW2zvCc
 tmrpe96rSXvarJID76mYPm5j336Iec8Wtb57uldu7t7ZapcsMlXg3RZWucUrD2vz/Ph8WIml
 OCPRUIu5qDgRAJTyJ6yzAwAA
X-CMS-MailID: 20220506081116eucas1p2cce67bbf30f4c9c4e6854965be41b098
X-Msg-Generator: CA
X-RootMTR: 20220506081116eucas1p2cce67bbf30f4c9c4e6854965be41b098
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220506081116eucas1p2cce67bbf30f4c9c4e6854965be41b098
References: <20220506081105.29134-1-p.raghav@samsung.com>
 <CGME20220506081116eucas1p2cce67bbf30f4c9c4e6854965be41b098@eucas1p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [dm-devel] [PATCH v3 10/11] null_blk: allow non power of 2 zoned
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
Cc: jiangbo.365@bytedance.com, linux-nvme@lists.infradead.org,
 Chris Mason <clm@fb.com>, dm-devel@redhat.com,
 Alasdair Kergon <agk@redhat.com>, Naohiro Aota <naohiro.aota@wdc.com>,
 bvanassche@acm.org, gost.dev@samsung.com, jonathan.derrick@linux.dev,
 Pankaj Raghav <p.raghav@samsung.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, matias.bjorling@wdc.com,
 Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@fb.com>,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
index 5cb4c92cd..ed9a58201 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1929,9 +1929,8 @@ static int null_validate_conf(struct nullb_device *dev)
 	if (dev->queue_mode == NULL_Q_BIO)
 		dev->mbps = 0;
 
-	if (dev->zoned &&
-	    (!dev->zone_size || !is_power_of_2(dev->zone_size))) {
-		pr_err("zone_size must be power-of-two\n");
+	if (dev->zoned && !dev->zone_size) {
+		pr_err("zone_size must not be zero\n");
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

