Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 214CA582CA5
	for <lists+dm-devel@lfdr.de>; Wed, 27 Jul 2022 18:49:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658940566;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fYW/reXSS5Ryxg+V+eL52HlGYEst5Keas0GMrfJ08xY=;
	b=HXfE0Wc0uxQs5OEZL7BwnV4c1pmS9DLPqJDGrehjb55drjVSQrq1AlVRvrGpJgWM0znUo4
	4mDItFWWJndef7CgUN/4YoD0LlM4bS8gHMi19jYpSRdR+Yu7Zogpzdg+O+gBsLZaaoKyKl
	IX++60Vs7LoKmQ1NsHmntm+5ob2apRc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-FCJLjakmNuu-htvjU5rQng-1; Wed, 27 Jul 2022 12:49:22 -0400
X-MC-Unique: FCJLjakmNuu-htvjU5rQng-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39F0285A58B;
	Wed, 27 Jul 2022 16:49:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E29CE40315E;
	Wed, 27 Jul 2022 16:49:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 96D9A194704B;
	Wed, 27 Jul 2022 16:49:19 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 475E41945DA8
 for <dm-devel@listman.corp.redhat.com>; Wed, 27 Jul 2022 16:31:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2AC58141511F; Wed, 27 Jul 2022 16:31:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B371415118
 for <dm-devel@redhat.com>; Wed, 27 Jul 2022 16:31:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11284384F80D
 for <dm-devel@redhat.com>; Wed, 27 Jul 2022 16:31:25 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-AS2KXFxwOm6oo5HyGdb3aA-1; Wed, 27 Jul 2022 12:31:23 -0400
X-MC-Unique: AS2KXFxwOm6oo5HyGdb3aA-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220727162252euoutp0188d368b02596890238f023f13ee6e8fa~FvDTN14Tl2257722577euoutp01e
 for <dm-devel@redhat.com>; Wed, 27 Jul 2022 16:22:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220727162252euoutp0188d368b02596890238f023f13ee6e8fa~FvDTN14Tl2257722577euoutp01e
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220727162251eucas1p2adf92628ca134e6467ff47be0e7d1e12~FvDR4EsdW2169421694eucas1p2p;
 Wed, 27 Jul 2022 16:22:51 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 2F.B3.09664.B5661E26; Wed, 27
 Jul 2022 17:22:51 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220727162250eucas1p133e8a814fee934f7161866122ef93273~FvDRCXbtT1278312783eucas1p1p;
 Wed, 27 Jul 2022 16:22:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220727162250eusmtrp27808e4608f064ce737a401d79ddefcfa~FvDRBmw-E0809408094eusmtrp28;
 Wed, 27 Jul 2022 16:22:50 +0000 (GMT)
X-AuditID: cbfec7f2-d81ff700000025c0-ea-62e1665ba4cc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 69.1E.09095.A5661E26; Wed, 27
 Jul 2022 17:22:50 +0100 (BST)
Received: from localhost (unknown [106.210.248.8]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220727162250eusmtip1cde27cb89575ab05491e19471e0ccebc~FvDQsZyIA0050700507eusmtip1f;
 Wed, 27 Jul 2022 16:22:50 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: damien.lemoal@opensource.wdc.com, hch@lst.de, axboe@kernel.dk,
 snitzer@kernel.org, Johannes.Thumshirn@wdc.com
Date: Wed, 27 Jul 2022 18:22:38 +0200
Message-Id: <20220727162245.209794-5-p.raghav@samsung.com>
In-Reply-To: <20220727162245.209794-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxj33Ht7e8tWuJTOfpMJWqPLUPGRhdyAW+Zilhtd5iPxSTascCmN
 UElLtzGX0clL6iKNRQnl5YunjhJQsAyINFnLhmK2QkJVQGI7MwKodDgaAozLrZn//b7ze53v
 5FC47LFoFaXRZnE6rSpdSYYQbc5A/+bE1LETW4eaJcyN4WKSufQigDNz9x/gTNdUuYjx3LVj
 TOfVCxjTcONXjPHarDgzbxrBmK6HGxl3RwXJVNf6xIy5YAZnhsw+xPhr8sTMTY+PYHofRn4S
 zroH9rB267CYdd83sC2NRSTbej2H/cVjJFl7/qiIfd49SLLnbzUitrXvNOtviWIL757D9r19
 LGRHCpeu+ZrTbfn4eEhazWBMZnvYt+PzG4zootSEJBTQH0KdvZEwoRBKRtcjmLhSioThHwSL
 i91Bxo+god5NvrYM+KqCqjoEBeZykTA8Q5DbM7U0UBRJx8CPRWLeIKf1MDaVv5yE034Mbru6
 EE9E0Efg995KjMcEvR6ueXpJ3iul42GmM1gWDWV//rucI6EToLWkalkupcPhtzIvwWN8SZN7
 uxzn84G2SeBns0/M5wC9C4ZtXwk5ETDuuiUW8HuwaK/GBHwafENzQW8egmK7jRS8CXD+XjoP
 cfoDsHVsEeQ74VER/1y8IhSGJsOFG4TChbZSXDiWwtkCmaBWgj3gDZYCuM9UEAJm4bllHDej
 tdY3drG+sYv1/97LCG9ECs6gz1Bz+m1a7ptYvSpDb9CqY5NPZbSgpQ/Yt+CavoMqx1/GOhBG
 IQcCClfKpccTR0/IpCmq7O843akknSGd0ztQJEUoFdJkTbNKRqtVWdxJjsvkdK9ZjJKsMmKb
 /K/8HmeUem9Jata05klTAxG/Ztf78ryX5OFsw/djr/ak1X00E3WSPlaJcpnLi0/nvjj0U3j1
 u4WbHEkD2NN1xfNT04Mj7WZ1ghyb1XYeXDHQV/sgbqMluT8qdvJzy/REtFO7d2FiwXltXXdF
 deto0t9G5+bMEvYqkedt3l36WYvp8JemHxSfHm0/0xSYLfafW7E/UmGfVLiOSBQ1T8wRZU31
 VtdYIVb7IsYYkD5+hOLywSFfvb/Ay6Ymw0j0PUdKf6LHnWAojN/QvrVK/k7b6p6I2aN92W8F
 Kp+FdcXdWXkzZyar42xoieivnX/Mhm0X7bDYAleMhw7kanLWW3pGlIQ+TbUtBtfpVf8BjbmT
 Be8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xu7pRaQ+TDI59FbJYfbefzWLah5/M
 Fr/Pnme22PtuNqvFzQM7mSz2LJrEZLFy9VEmiyfrZzFb/O26x2Sx95a2xeVdc9gs5i97ym4x
 oe0rs8WNCU8ZLT4vbWG3WHPzKYvFiVvSDoIel694e+ycdZfd4/LZUo9NqzrZPDYvqffYfbOB
 zWNn631Wj/f7rrJ59G1Zxeix+XS1x+dNch7tB7qZAnii9GyK8ktLUhUy8otLbJWiDS2M9Awt
 LfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DKWXtUq2M5f8eqvWgPjVN4uRk4OCQETiStP
 5zF2MXJxCAksZZSYueAsE0RCQuL2wiZGCFtY4s+1LjaIoqeMEgeefQNKcHCwCWhJNHayg5gi
 ApUSZ7/IgpQwCzQyS0zqn80G0issECZxa8F9VhCbRUBVYvHNE2wg9bwCVhJf97BBjJeXmHnp
 OzuIzSlgLbF5yjywE4SASp49+AhWwysgKHFy5hMWEJsZqL5562zmCYwCs5CkZiFJLWBkWsUo
 klpanJueW2yoV5yYW1yal66XnJ+7iREYq9uO/dy8g3Heq496hxiZOBgPMUpwMCuJ8CZE308S
 4k1JrKxKLcqPLyrNSS0+xGgKdPZEZinR5HxgssgriTc0MzA1NDGzNDC1NDNWEuf1LOhIFBJI
 TyxJzU5NLUgtgulj4uCUamAK+Pg4qcZ+gZCj2h3nhxFS/339RJ1VHy2KU187Kf9KW2G8FdMh
 Fqf43sWzeMOzDm76dV5lt6l0/pe5teUi/53F2hdee2CWG767ee7kc1JVex7P/HXfY05Odqeh
 nv9CQYfauN3f1xS7bJrUrSa1YWlJ1Urmm90vtxifta1Wljxs9Tm8LWnXZfYF7s/zBHefb/bK
 11FfdODfAn3Jj4eqOb0153I3bVl4QXB+eo/DwU/r93DvUxW0C17SeeYUq0bQWqEDnDNWKP83
 X7X6WOy/damCcddP9y87uTG+tTsmtfHEtuV/t/Ud82zv4ckqcTcyvcVTdvXSg+SbZbXLDusx
 Z5/vu/rHziu//sOaVUeW/1yoxFKckWioxVxUnAgAVOzeWV4DAAA=
X-CMS-MailID: 20220727162250eucas1p133e8a814fee934f7161866122ef93273
X-Msg-Generator: CA
X-RootMTR: 20220727162250eucas1p133e8a814fee934f7161866122ef93273
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220727162250eucas1p133e8a814fee934f7161866122ef93273
References: <20220727162245.209794-1-p.raghav@samsung.com>
 <CGME20220727162250eucas1p133e8a814fee934f7161866122ef93273@eucas1p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [dm-devel] [PATCH v8 04/11] nvmet: Allow ZNS target to support
 non-power_of_2 zone sizes
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A generic bdev_zone_no() helper is added to calculate zone number for a
given sector in a block device. This helper internally uses disk_zone_no()
to find the zone number.

Use the helper bdev_zone_no() to calculate nr of zones. This let's us
make modifications to the math if needed in one place and adds now
support for npo2 zone devices.

Reviewed by: Adam Manzanares <a.manzanares@samsung.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 drivers/nvme/target/zns.c | 3 +--
 include/linux/blkdev.h    | 5 +++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index c7ef69f29fe4..662f1a92f39b 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -241,8 +241,7 @@ static unsigned long nvmet_req_nr_zones_from_slba(struct nvmet_req *req)
 {
 	unsigned int sect = nvmet_lba_to_sect(req->ns, req->cmd->zmr.slba);
 
-	return bdev_nr_zones(req->ns->bdev) -
-		(sect >> ilog2(bdev_zone_sectors(req->ns->bdev)));
+	return bdev_nr_zones(req->ns->bdev) - bdev_zone_no(req->ns->bdev, sect);
 }
 
 static unsigned long get_nr_zones_from_buf(struct nvmet_req *req, u32 bufsize)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 1be805223026..d1ef9b9552ed 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1350,6 +1350,11 @@ static inline enum blk_zoned_model bdev_zoned_model(struct block_device *bdev)
 	return BLK_ZONED_NONE;
 }
 
+static inline unsigned int bdev_zone_no(struct block_device *bdev, sector_t sec)
+{
+	return disk_zone_no(bdev->bd_disk, sec);
+}
+
 static inline int queue_dma_alignment(const struct request_queue *q)
 {
 	return q ? q->dma_alignment : 511;
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

