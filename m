Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE363526A
	for <lists+dm-devel@lfdr.de>; Wed, 23 Nov 2022 09:26:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669191968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WamysA6w3DoPofQ70mPuDC9Zcpc+wkiRlyU9+8JFe8A=;
	b=NjOAFqmy7Ml+Y8vsTb/kYCmRyAdQvGszlTl0d6IDslv1+2XqZpjxpIaJfrF0TiLqXdE6wl
	izesmL0bkC4m0T+5DeuxjT2cK7ypZj3ioYJeNwqOfBeJ8FS79+Zvk4gyuY41xsq49iaOJS
	Mhe0BERPbMaZKobDfOJhtjk5QUzY2Q8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-wPiR8wwlNMK6JlJe4exHig-1; Wed, 23 Nov 2022 03:26:06 -0500
X-MC-Unique: wPiR8wwlNMK6JlJe4exHig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7755806026;
	Wed, 23 Nov 2022 08:26:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7C5840C83C5;
	Wed, 23 Nov 2022 08:25:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ACB1D1946A41;
	Wed, 23 Nov 2022 08:25:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4B5FE194658C
 for <dm-devel@listman.corp.redhat.com>; Wed, 23 Nov 2022 06:21:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 30BDF4EA4E; Wed, 23 Nov 2022 06:21:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2899439D7C
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 06:21:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09B4E801585
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 06:21:10 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-JBSdjVF5P7yMWTFMl_YPxg-1; Wed, 23 Nov 2022 01:21:07 -0500
X-MC-Unique: JBSdjVF5P7yMWTFMl_YPxg-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20221123061314epoutp027a158417b5943bde562cb5317b6c8ba1~qIf-eevxl1816518165epoutp02C
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 06:13:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20221123061314epoutp027a158417b5943bde562cb5317b6c8ba1~qIf-eevxl1816518165epoutp02C
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20221123061314epcas5p3537f2e330d9ff8f87bb066bd951304b5~qIf__ssLP1161611616epcas5p3Y;
 Wed, 23 Nov 2022 06:13:14 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.181]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4NH9m83vSKz4x9Q8; Wed, 23 Nov
 2022 06:13:12 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 62.17.56352.8F9BD736; Wed, 23 Nov 2022 15:13:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20221123061014epcas5p150fd8add12fe6d09b63c56972818e6a2~qIdXXVKqr1236112361epcas5p1k;
 Wed, 23 Nov 2022 06:10:14 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221123061014epsmtrp286681bed34e54926cc55e47c00f293d4~qIdXWP0yd0451404514epsmtrp2o;
 Wed, 23 Nov 2022 06:10:14 +0000 (GMT)
X-AuditID: b6c32a4b-383ff7000001dc20-af-637db9f80d43
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 3E.A2.18644.649BD736; Wed, 23 Nov 2022 15:10:14 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221123061010epsmtip11adfbda7ef6ca9c08eb3072605bac6ed~qIdUR2-sC2063320633epsmtip17;
 Wed, 23 Nov 2022 06:10:10 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
 dm-devel@redhat.com, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 james.smart@broadcom.com, kch@nvidia.com, damien.lemoal@opensource.wdc.com,
 naohiro.aota@wdc.com, jth@kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 23 Nov 2022 11:28:18 +0530
Message-Id: <20221123055827.26996-2-nj.shetty@samsung.com>
In-Reply-To: <20221123055827.26996-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xTZxjmnFNOC0v1UBx+IiJ0M+MSLsWCH0wuy4ieBUNwuD8Mwmp7hHJp
 m7aMOSHcBblDxEAhXOYUgSFakJUCCjjlIowoApYMEFa2IRMUXJwyZC0HN/897/M9z3v78rIw
 TinTmiWWKCm5RBDHxc0Z7bcdHVz+7kgWuuuu7YUtQ3cxmF68gcGm6SIcro+MYrB7udIU6no6
 UNj1XSkKG5ruoLCz7jkK72w+xeHciykGLO2bQODCuAqF3VPOsKt7kAHHtFU4rLm8wIQl/a2m
 UKNPQ2D7eg0G1y5lMuHVpRUGHJjaC0c3+k0DAKmaHcHJDtU0kxyduc4gx0YSSHXjOZxs/T6F
 7NSl4mRBxrJBkDVrSq7cHMfJwrZGhGy9d4ZcU9uS2T15KKnWP0VDdobFHo6mBCJKbkdJhFKR
 WBLlyw0Kjfw00tPLnefC84aHuHYSQTzlyw08FuJyRBxnWATX7mtBXIKBChEoFFw3v8NyaYKS
 souWKpS+XEomipPxZa4KQbwiQRLlKqGUPjx3dw9Pg/Cr2OjVpVymrOL4N+O35k1TkfrAXMSM
 BQg+UL++wsxFzFkcohMBLeeWUTpYRcD89G8IHawhYOTWpEHG2rJMaiOMbg6hRYBm9AStyUJB
 TVXzlgYnnMG9TZaR30UUoiCnswczBhjRiYLisllTo9uS+Bz89UvGFmYQB0Bd8xhmxGzCB3TU
 /4nTxdxA0ayFkTYjPgbD97UoLbEAgxV6hhFjxH6QcaNyKz8gmsxAcX4vk54tECxeWMBpbAme
 9Ldt89Zgbbl7m08EDeev4LQ5EwGqSRVCP/iDrKEizNgERjiCFq0bTe8DZUNXUbrwDlCwrkdp
 ng001W/xB+CHltrt/HvAxMu0bUyCnLZCjN5WIQKePHiEFiN2qncGUr0zkOr/0rUI1ojsoWSK
 +ChK4Sk7KKES//tloTRejWwdh1OQBpl//My1D0FZSB8CWBh3FzvlsyQhhy0SnP6Wkksj5Qlx
 lKIP8TQsvASzfl8oNVyXRBnJ43u78728vPjeB7143N3si+VOQg4RJVBSsRQlo+RvfSjLzDoV
 5Ti1+zhVH2ot8XC44LcvfCnETJV/qi3imcPD1gzzyYunRc1z5Xjw4/a7jllW1ZdtQ9GNgZni
 Df6Pb5IffJlRljP3JtRX91HwPzlVwzaLzkcqYzZMCrKbGLuTOb/rwj38e00KsxeJ2AOWZ8vL
 0/Nui1W+g1zlqlXgo/Ab938KejHqnX1Mx04SKxefZ29+aL7gpz/q0KWpDYu3/eL4r/PBK2df
 B1ZGBFxvtCJeBsR+Upf1ajim3v6VyN569uTDiQbEyiQ4zZEcuGQvLs1PRvN+PvPeyT8yU8Ma
 Q3S21XqGTU5i0rWYHSm9NulS7PzO2aMarf/6ZovHiQq9ej+vYybc4tRNrTOXoYgW8JwwuULw
 L3cPLx6lBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsWy7bCSnK7bztpkg1kb2C3WnzrGbNE04S+z
 xeq7/WwWv8+eZ7bY+242q8XNAzuZLPYsmsRksXL1USaL3Qs/Mlkc/f+WzeLhl1ssFpMOXWO0
 eHp1FpPF3lvaFnv2nmSxuLxrDpvF/GVP2S0mHt/MarHjSSOjxbbf85ktPi9tYbdY9/o9i8WJ
 W9IW5/8eZ3WQ8Jh1/yybx85Zd9k9zt/byOJx+Wypx6ZVnWwem5fUe+y+2cDm0dv8Dqig9T6r
 x/t9V9k8+rasYvTYfLra4/MmOY/2A91MHpuevGUK4I/isklJzcksSy3St0vgyvj0uou9YGZg
 xdX9j1gbGJe7dDFycEgImEhc3xXbxcjFISSwg1Gi4cVj9i5GTqC4pMSyv0eYIWxhiZX/nrND
 FDUzSfz/spQNpJlNQFvi9H8OkLiIwAImicv3XjGDOMwCx5kkzk6fzgrSLSwQILHq3G+wqSwC
 qhIL114Gm8orYCWxc/kbNogr9CX67wuChDkFrCXOXNzFBBIWAirZs0wHolpQ4uTMJywgNrOA
 vETz1tnMExgFZiFJzUKSWsDItIpRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIziutbR2
 MO5Z9UHvECMTB+MhRgkOZiUR3nrPmmQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQn
 lqRmp6YWpBbBZJk4OKUamE5v0syLSHY5anuk1fN5Z7BEeGSRWi3DXrEXOpua7lu9KavV/pno
 kMhiI3U/9tTuT9MbdvrPPnO30lSs2mfaTSm7TKZ39tc1Kptv3dDjMllhf0fa9EbL2aQuEb1P
 nvdU38mG/j+jry7ss/9I7fz/W5pk7K+d4ziq8XXC1CVre4RNlXgjNLMXrZPzZ7t28dIrgSOe
 Pq7RqXcqn4R1TOzqnGGwKssrblOBQrnHxJNfdC9OlyjoEPGb+rN5xWHh81O2zuvaXGzwWHXH
 yloRk42/v73sc/Y+li2rs+4/E+uCmvMzC2r3/RK9bnfhwdlN0+Y1fpYI+LW2v9vkd25i9YHT
 1Rf2VlX57+gX987u1Q+zUmIpzkg01GIuKk4EAMo+pQxaAwAA
X-CMS-MailID: 20221123061014epcas5p150fd8add12fe6d09b63c56972818e6a2
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221123061014epcas5p150fd8add12fe6d09b63c56972818e6a2
References: <20221123055827.26996-1-nj.shetty@samsung.com>
 <CGME20221123061014epcas5p150fd8add12fe6d09b63c56972818e6a2@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Wed, 23 Nov 2022 08:25:56 +0000
Subject: [dm-devel] [PATCH v5 01/10] block: Introduce queue limits for
 copy-offload support
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
Cc: p.raghav@samsung.com, joshi.k@samsung.com, gost.dev@samsung.com,
 anuj20.g@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Nitesh Shetty <nj.shetty@samsung.com>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 nitheshshetty@gmail.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add device limits as sysfs entries,
        - copy_offload (RW)
        - copy_max_bytes (RW)
        - copy_max_bytes_hw (RO)

Above limits help to split the copy payload in block layer.
copy_offload: used for setting copy offload(1) or emulation(0).
copy_max_bytes: maximum total length of copy in single payload.
copy_max_bytes_hw: Reflects the device supported maximum limit.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 Documentation/ABI/stable/sysfs-block | 36 ++++++++++++++++
 block/blk-settings.c                 | 24 +++++++++++
 block/blk-sysfs.c                    | 64 ++++++++++++++++++++++++++++
 include/linux/blkdev.h               | 12 ++++++
 include/uapi/linux/fs.h              |  3 ++
 5 files changed, 139 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-block b/Documentation/ABI/stable/sysfs-block
index cd14ecb3c9a5..e0c9be009706 100644
--- a/Documentation/ABI/stable/sysfs-block
+++ b/Documentation/ABI/stable/sysfs-block
@@ -155,6 +155,42 @@ Description:
 		last zone of the device which may be smaller.
 
 
+What:		/sys/block/<disk>/queue/copy_offload
+Date:		November 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] When read, this file shows whether offloading copy to
+		device is enabled (1) or disabled (0). Writing '0' to this
+		file will disable offloading copies for this device.
+		Writing any '1' value will enable this feature. If device
+		does not support offloading, then writing 1, will result in
+		error.
+
+
+What:		/sys/block/<disk>/queue/copy_max_bytes
+Date:		November 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] While 'copy_max_bytes_hw' is the hardware limit for the
+		device, 'copy_max_bytes' setting is the software limit.
+		Setting this value lower will make Linux issue smaller size
+		copies from block layer.
+
+
+What:		/sys/block/<disk>/queue/copy_max_bytes_hw
+Date:		November 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RO] Devices that support offloading copy functionality may have
+		internal limits on the number of bytes that can be offloaded
+		in a single operation. The `copy_max_bytes_hw`
+		parameter is set by the device driver to the maximum number of
+		bytes that can be copied in a single operation. Copy
+		requests issued to the device must not exceed this limit.
+		A value of 0 means that the device does not
+		support copy offload.
+
+
 What:		/sys/block/<disk>/queue/crypto/
 Date:		February 2022
 Contact:	linux-block@vger.kernel.org
diff --git a/block/blk-settings.c b/block/blk-settings.c
index 0477c4d527fe..ca6f15a70fdc 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -58,6 +58,8 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->zoned = BLK_ZONED_NONE;
 	lim->zone_write_granularity = 0;
 	lim->dma_alignment = 511;
+	lim->max_copy_sectors_hw = 0;
+	lim->max_copy_sectors = 0;
 }
 
 /**
@@ -81,6 +83,8 @@ void blk_set_stacking_limits(struct queue_limits *lim)
 	lim->max_dev_sectors = UINT_MAX;
 	lim->max_write_zeroes_sectors = UINT_MAX;
 	lim->max_zone_append_sectors = UINT_MAX;
+	lim->max_copy_sectors_hw = ULONG_MAX;
+	lim->max_copy_sectors = ULONG_MAX;
 }
 EXPORT_SYMBOL(blk_set_stacking_limits);
 
@@ -177,6 +181,22 @@ void blk_queue_max_discard_sectors(struct request_queue *q,
 }
 EXPORT_SYMBOL(blk_queue_max_discard_sectors);
 
+/**
+ * blk_queue_max_copy_sectors_hw - set max sectors for a single copy payload
+ * @q:  the request queue for the device
+ * @max_copy_sectors: maximum number of sectors to copy
+ **/
+void blk_queue_max_copy_sectors_hw(struct request_queue *q,
+		unsigned int max_copy_sectors)
+{
+	if (max_copy_sectors >= MAX_COPY_TOTAL_LENGTH)
+		max_copy_sectors = MAX_COPY_TOTAL_LENGTH;
+
+	q->limits.max_copy_sectors_hw = max_copy_sectors;
+	q->limits.max_copy_sectors = max_copy_sectors;
+}
+EXPORT_SYMBOL_GPL(blk_queue_max_copy_sectors_hw);
+
 /**
  * blk_queue_max_secure_erase_sectors - set max sectors for a secure erase
  * @q:  the request queue for the device
@@ -572,6 +592,10 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 	t->max_segment_size = min_not_zero(t->max_segment_size,
 					   b->max_segment_size);
 
+	t->max_copy_sectors = min(t->max_copy_sectors, b->max_copy_sectors);
+	t->max_copy_sectors_hw = min(t->max_copy_sectors_hw,
+						b->max_copy_sectors_hw);
+
 	t->misaligned |= b->misaligned;
 
 	alignment = queue_limit_alignment_offset(b, start);
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 02e94c4beff1..903285b04029 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -212,6 +212,63 @@ static ssize_t queue_discard_zeroes_data_show(struct request_queue *q, char *pag
 	return queue_var_show(0, page);
 }
 
+static ssize_t queue_copy_offload_show(struct request_queue *q, char *page)
+{
+	return queue_var_show(blk_queue_copy(q), page);
+}
+
+static ssize_t queue_copy_offload_store(struct request_queue *q,
+				       const char *page, size_t count)
+{
+	s64 copy_offload;
+	ssize_t ret = queue_var_store64(&copy_offload, page);
+
+	if (ret < 0)
+		return ret;
+
+	if (copy_offload && !q->limits.max_copy_sectors_hw)
+		return -EINVAL;
+
+	if (copy_offload)
+		blk_queue_flag_set(QUEUE_FLAG_COPY, q);
+	else
+		blk_queue_flag_clear(QUEUE_FLAG_COPY, q);
+
+	return count;
+}
+
+static ssize_t queue_copy_max_hw_show(struct request_queue *q, char *page)
+{
+	return sprintf(page, "%llu\n", (unsigned long long)
+			q->limits.max_copy_sectors_hw << SECTOR_SHIFT);
+}
+
+static ssize_t queue_copy_max_show(struct request_queue *q, char *page)
+{
+	return sprintf(page, "%llu\n", (unsigned long long)
+			q->limits.max_copy_sectors << SECTOR_SHIFT);
+}
+
+static ssize_t queue_copy_max_store(struct request_queue *q,
+				       const char *page, size_t count)
+{
+	s64 max_copy;
+	ssize_t ret = queue_var_store64(&max_copy, page);
+
+	if (ret < 0)
+		return ret;
+
+	if (max_copy & (queue_logical_block_size(q) - 1))
+		return -EINVAL;
+
+	max_copy >>= SECTOR_SHIFT;
+	if (max_copy > q->limits.max_copy_sectors_hw)
+		max_copy = q->limits.max_copy_sectors_hw;
+
+	q->limits.max_copy_sectors = max_copy;
+	return count;
+}
+
 static ssize_t queue_write_same_max_show(struct request_queue *q, char *page)
 {
 	return queue_var_show(0, page);
@@ -604,6 +661,10 @@ QUEUE_RO_ENTRY(queue_nr_zones, "nr_zones");
 QUEUE_RO_ENTRY(queue_max_open_zones, "max_open_zones");
 QUEUE_RO_ENTRY(queue_max_active_zones, "max_active_zones");
 
+QUEUE_RW_ENTRY(queue_copy_offload, "copy_offload");
+QUEUE_RO_ENTRY(queue_copy_max_hw, "copy_max_bytes_hw");
+QUEUE_RW_ENTRY(queue_copy_max, "copy_max_bytes");
+
 QUEUE_RW_ENTRY(queue_nomerges, "nomerges");
 QUEUE_RW_ENTRY(queue_rq_affinity, "rq_affinity");
 QUEUE_RW_ENTRY(queue_poll, "io_poll");
@@ -651,6 +712,9 @@ static struct attribute *queue_attrs[] = {
 	&queue_discard_max_entry.attr,
 	&queue_discard_max_hw_entry.attr,
 	&queue_discard_zeroes_data_entry.attr,
+	&queue_copy_offload_entry.attr,
+	&queue_copy_max_hw_entry.attr,
+	&queue_copy_max_entry.attr,
 	&queue_write_same_max_entry.attr,
 	&queue_write_zeroes_max_entry.attr,
 	&queue_zone_append_max_entry.attr,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index a0452ba08e9a..3ac324208f2f 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -302,6 +302,9 @@ struct queue_limits {
 	unsigned int		discard_alignment;
 	unsigned int		zone_write_granularity;
 
+	unsigned long		max_copy_sectors_hw;
+	unsigned long		max_copy_sectors;
+
 	unsigned short		max_segments;
 	unsigned short		max_integrity_segments;
 	unsigned short		max_discard_segments;
@@ -573,6 +576,7 @@ struct request_queue {
 #define QUEUE_FLAG_NOWAIT       29	/* device supports NOWAIT */
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
 #define QUEUE_FLAG_SKIP_TAGSET_QUIESCE	31 /* quiesce_tagset skip the queue*/
+#define QUEUE_FLAG_COPY		32	/* supports copy offload */
 
 #define QUEUE_FLAG_MQ_DEFAULT	((1UL << QUEUE_FLAG_IO_STAT) |		\
 				 (1UL << QUEUE_FLAG_SAME_COMP) |	\
@@ -593,6 +597,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 	test_bit(QUEUE_FLAG_STABLE_WRITES, &(q)->queue_flags)
 #define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
 #define blk_queue_add_random(q)	test_bit(QUEUE_FLAG_ADD_RANDOM, &(q)->queue_flags)
+#define blk_queue_copy(q)	test_bit(QUEUE_FLAG_COPY, &(q)->queue_flags)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
 #define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
@@ -913,6 +918,8 @@ extern void blk_queue_chunk_sectors(struct request_queue *, unsigned int);
 extern void blk_queue_max_segments(struct request_queue *, unsigned short);
 extern void blk_queue_max_discard_segments(struct request_queue *,
 		unsigned short);
+extern void blk_queue_max_copy_sectors_hw(struct request_queue *q,
+		unsigned int max_copy_sectors);
 void blk_queue_max_secure_erase_sectors(struct request_queue *q,
 		unsigned int max_sectors);
 extern void blk_queue_max_segment_size(struct request_queue *, unsigned int);
@@ -1231,6 +1238,11 @@ static inline unsigned int bdev_discard_granularity(struct block_device *bdev)
 	return bdev_get_queue(bdev)->limits.discard_granularity;
 }
 
+static inline unsigned int bdev_max_copy_sectors(struct block_device *bdev)
+{
+	return bdev_get_queue(bdev)->limits.max_copy_sectors;
+}
+
 static inline unsigned int
 bdev_max_secure_erase_sectors(struct block_device *bdev)
 {
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index b7b56871029c..b3ad173f619c 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -64,6 +64,9 @@ struct fstrim_range {
 	__u64 minlen;
 };
 
+/* maximum total copy length */
+#define MAX_COPY_TOTAL_LENGTH	(1 << 27)
+
 /* extent-same (dedupe) ioctls; these MUST match the btrfs ioctl definitions */
 #define FILE_DEDUPE_RANGE_SAME		0
 #define FILE_DEDUPE_RANGE_DIFFERS	1
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

