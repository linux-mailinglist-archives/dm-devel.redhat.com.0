Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB575740950
	for <lists+dm-devel@lfdr.de>; Wed, 28 Jun 2023 07:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687931786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GZ0rO3JxoCOwuo8yvPdWXc1i5H5Mos9l6JBkGtoE87Q=;
	b=dsvQRV1j0guZ60mWi9hU3hV8voYLdvgI8tj3+kBzT33LDr41DNi3mgslbp9cYSgFAzYo/x
	e3jDSEN+N1huVNz/fY5M4kA9KMZvpOyAciYjaoaj3F7KX+UIycPLFEeXVihw4GiJBtjwIt
	VgJYqHVttpR4w01RPj/bzKPla1x/OBA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-z2RI7QRmNoecSXyR8QVaYA-1; Wed, 28 Jun 2023 01:56:25 -0400
X-MC-Unique: z2RI7QRmNoecSXyR8QVaYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BDCC3C108C2;
	Wed, 28 Jun 2023 05:56:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24DB714682FA;
	Wed, 28 Jun 2023 05:56:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 74DAD1946A72;
	Wed, 28 Jun 2023 05:55:59 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0B5AC1946589
 for <dm-devel@listman.corp.redhat.com>; Wed, 28 Jun 2023 05:55:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF1342166B26; Wed, 28 Jun 2023 05:55:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D558E2166B25
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B491E3804501
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:12 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-OT46lf61PUaTUxFY1Respg-1; Wed, 28 Jun 2023 01:55:10 -0400
X-MC-Unique: OT46lf61PUaTUxFY1Respg-1
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230628055507epoutp015094cc75e0ef7d1d572daf5290ab804d~svPHpPw0Q2356023560epoutp01N
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230628055507epoutp015094cc75e0ef7d1d572daf5290ab804d~svPHpPw0Q2356023560epoutp01N
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20230628055506epcas5p2de3b04607876dd4670d779fbfa51dfad~svPG7mdvH0721107211epcas5p2Q;
 Wed, 28 Jun 2023 05:55:06 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4QrW55029Kz4x9QG; Wed, 28 Jun
 2023 05:55:04 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 64.C6.44250.83BCB946; Wed, 28 Jun 2023 14:55:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230627184000epcas5p1c7cb01eb1c70bc5a19f76ce21f2ec3f8~smBq_EZIQ3272832728epcas5p1E;
 Tue, 27 Jun 2023 18:40:00 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230627184000epsmtrp1d75d61c9665105b36497d9ea07ee5335~smBq79H0W1784017840epsmtrp1x;
 Tue, 27 Jun 2023 18:40:00 +0000 (GMT)
X-AuditID: b6c32a4a-4c3bea800000acda-d9-649bcb38795d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6C.39.34491.00D2B946; Wed, 28 Jun 2023 03:40:00 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230627183956epsmtip295840d2007e2a19e54f23a74d8bd5c6f~smBnCt6L70383803838epsmtip2Z;
 Tue, 27 Jun 2023 18:39:56 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>
Date: Wed, 28 Jun 2023 00:06:15 +0530
Message-Id: <20230627183629.26571-2-nj.shetty@samsung.com>
In-Reply-To: <20230627183629.26571-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1BUZRie75zdswvT0hGwPmFQZqkhIC6LLH6QSCXiSZiiaZwpphHW3SMQ
 y+6ylwCdxuWyFhSsCBYsIChGCgwoCC2sEAMRN3WNiwQzFOAyjaDcpKA2MeBg+e95n3me732f
 95uXi9vXcpy4CTI1rZSJpHzCltXc5eHhjQZKJH6/NAlRff9POMo4+wRHNRN6As11LQP09eJf
 OLJ0fA7QkMUOTf4QitrmS9horKMFQzcvncPQ1ZpuDHU/fUSgc533AJoZMWCobdwLXTxzmYVu
 tvWx0FBrKYHKq2Y46MtRI4G+61nHUGdBJoaMlnSAmq3lOKqbW2Ch3nFnZH7Sw0bWtVLiTRdq
 aDiCajFMcCjzr9dZVOMVT2rotoZqqM4mqMbLpynTmJagKvMK2FRu5jxBLc2Ms6iF9hGCyrtR
 DajGgVPU44bdVIPlERZFRifuj6dFElrpSsvEckmCLC6EH/FBzMEYYaCfwFsQhPbxXWWiJDqE
 HxYZ5R2eIN1YEd/1U5FUs0FFiVQqvu+B/Uq5Rk27xstV6hA+rZBIFQEKH5UoSaWRxfnIaHWw
 wM/PX7ghjE2Mtw5OsRXtUalFd7rYWjB6MAfYcCEZAH/O/ofIAbZce9IE4P31mu1iGcCh5Smc
 Kf4EcMz4BysHcLcsDX3uDN8G4IWOjm2RDoPFc5NbIoL0ggNPuZu8I6nF4TVTJdjsh5PzODRe
 iNzEDuT7sKZ0lbOJWeSr0PK4aUvDI4NhvrmUwzTzhfrfdmzSNuQb0GT+kc1IdsC+YguLeXIP
 zGwq2ZoBkndsoEmXx2ayhcHKAh1gsAOc7bnBYbATfKA/s41T4NXCKwRjzgLQMGrYNoRCXb8e
 3xwCJz1gfasvQ7vA8/11GNPYDuZaLRjD8zZiPcNusLa+gmDwLnhvNX0bU3BluBhjlpUHYO/D
 KtZZ4Gp4LpDhuUCG/1tXALwa7KIVqqQ4WiVU+MvolP9+WSxPagBbZ+N5xAimJhd9OgHGBZ0A
 cnG+I++ltW8k9jyJKO0krZTHKDVSWtUJhBsLz8eddorlG3cnU8cIAoL8AgIDAwOC9gYK+C/z
 qoZzJfZknEhNJ9K0glY+82FcGyctlpC/U7mHlZZcJFzOWw9bCbWGD9dJEqcFrZ2veerCss5f
 XJMOv65JDpnLllWNvfjCx4uFp/0GhQuG+aLr7R1ltzK8ctimv8XiwwkTbq+EJN233PW++33w
 ianj3VTb7LGZZOe4AyfjjYNev+82fmTvk6EouFT+mXXlYb5HavFslu1R99XAyhGz7t3Ytw9F
 ux/NKdV7uuj0HvQJ7YexNZLJaUGkWM2z6as4Xu+Y9sBYhtv1AN/aY/u+qjNnf1IYruKnX3O+
 Vfat22hKEY/f/o5+ySG1yzv6i3nhNN0bdapgHaXdjtA2Nae/dyTAZa/djF2mqd/x0MMWzD9Z
 suQu6nnLVipy47NU8SKBJ65Uif4FMvPA/78EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe885OzuTFsdl7dUoYRGV1lQ0eMnKbsQhuxh0ww/Wcse50jk3
 LS9drEGlaZqF5ZRsZVZqWXNe5r2ZLau1aKkkWIaTCnNagyjmpU4S9O33/C/wfPhTuGiQ8KOU
 qhRWo5IlSEgvor5T4r9y1soSefD1qlBU8/wpjs4UTOKoaiCfRCOd3wEqGv+FI2fHOYAczjlo
 sD0CtbpKeOhdhxlDLTcLMXSvqgtDXdOjJCq09AI03KPHUGt/IDKcLSdQS2s3gRxNpSQqqxjm
 owt9jSS6Y53CkOWyDkONztMA1XvKcPRgZIxAz/oXIPuklYc8P0vJ9QsZx9tIxqwf4DP2948I
 pvZuAOOwpTLGymySqS0/xTS/yyKZWxcv85g8nYtkvg33E8xYWw/JXDRVAqb2RSbjNi5ijM5R
 LIqO9lojZxOUR1lN0LqDXvGeNx956raotGuvOnlZoG9TDqAoSIdBY/fSHCCgRHQzgE0TGRxD
 2hdWTD7BZ3guvDf1iZ8DvP5kdBg0uX+QXJekA+GLaYrTfegcHGabXQR34PQZAr6sGMK49lx6
 J+yzDpEcE/QS6HTXAY6F9Gp4yV7Kn3kiCOZ/8OZkAR0Om+1PeJws+hMZs0bNpL1hd7GT4Bin
 /aGurgQvALT+P0v/n3UDYJXAl1VrExWJ2hB1iIo9JtXKErWpKoU0NinRCP6OIGB5I2ioHJda
 AEYBC4AULvERzv95VS4SymXpGawm6YAmNYHVWsACipCIheLPeXIRrZClsEdYVs1q/rkYJfDL
 wsK32GDcV/FJU3b1o0PJoU0KVV/uqi95MYdjjq4d2WaIAxZLFvjh2BOUJG5QSxcXRGeG+US4
 yop6v2zQp7UhxdXA05m97RnFyZHh501iRbo1GuXuu1HW7Gdwbbk1EDE7YOdEQo1ferJLZi2y
 uD3+LRvkwYsd4SHSpg/VhWvGv9pTXnW5rcdsyVsNdqFgY1tLzxJB/zLdru37Ww27O8pLh+Gs
 pBPnp0+h1yu2aeqW7j28ebW5I+84ad48ZJ14vbAm7eHjURMv1zv4rHJ2WC8/9FtsTMP7I0p3
 fSa2d9A3dd6hh0Tkdaq7xLZDfLvY2zZ1f77ywtrqKx5PPp5BS37pJYQ2XhYSgGu0st8tOjBj
 cwMAAA==
X-CMS-MailID: 20230627184000epcas5p1c7cb01eb1c70bc5a19f76ce21f2ec3f8
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230627184000epcas5p1c7cb01eb1c70bc5a19f76ce21f2ec3f8
References: <20230627183629.26571-1-nj.shetty@samsung.com>
 <CGME20230627184000epcas5p1c7cb01eb1c70bc5a19f76ce21f2ec3f8@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [PATCH v13 1/9] block: Introduce queue limits for
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
Cc: Anuj Gupta <anuj20.g@samsung.com>, linux-nvme@lists.infradead.org,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org,
 djwong@kernel.org, nitheshshetty@gmail.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, ming.lei@redhat.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dlemoal@kernel.org, martin.petersen@oracle.com,
 Kanchan Joshi <joshi.k@samsung.com>, gost.dev@samsung.com,
 Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
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
 Documentation/ABI/stable/sysfs-block | 33 +++++++++++++++
 block/blk-settings.c                 | 24 +++++++++++
 block/blk-sysfs.c                    | 63 ++++++++++++++++++++++++++++
 include/linux/blkdev.h               | 12 ++++++
 include/uapi/linux/fs.h              |  3 ++
 5 files changed, 135 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-block b/Documentation/ABI/stable/sysfs-block
index c57e5b7cb532..3c97303f658b 100644
--- a/Documentation/ABI/stable/sysfs-block
+++ b/Documentation/ABI/stable/sysfs-block
@@ -155,6 +155,39 @@ Description:
 		last zone of the device which may be smaller.
 
 
+What:		/sys/block/<disk>/queue/copy_offload
+Date:		June 2023
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] When read, this file shows whether offloading copy to a
+		device is enabled (1) or disabled (0). Writing '0' to this
+		file will disable offloading copies for this device.
+		Writing any '1' value will enable this feature. If the device
+		does not support offloading, then writing 1, will result in an
+		error.
+
+
+What:		/sys/block/<disk>/queue/copy_max_bytes
+Date:		June 2023
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] This is the maximum number of bytes that the block layer
+		will allow for a copy request. This will is always smaller or
+		equal to the maximum size allowed by the hardware, indicated by
+		'copy_max_bytes_hw'. An attempt to set a value higher than
+		'copy_max_bytes_hw' will truncate this to 'copy_max_bytes_hw'.
+
+
+What:		/sys/block/<disk>/queue/copy_max_bytes_hw
+Date:		June 2023
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RO] This is the maximum number of bytes that the hardware
+		will allow for single data copy request.
+		A value of 0 means that the device does not support
+		copy offload.
+
+
 What:		/sys/block/<disk>/queue/crypto/
 Date:		February 2022
 Contact:	linux-block@vger.kernel.org
diff --git a/block/blk-settings.c b/block/blk-settings.c
index 4dd59059b788..738cd3f21259 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -59,6 +59,8 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->zoned = BLK_ZONED_NONE;
 	lim->zone_write_granularity = 0;
 	lim->dma_alignment = 511;
+	lim->max_copy_sectors_hw = 0;
+	lim->max_copy_sectors = 0;
 }
 
 /**
@@ -82,6 +84,8 @@ void blk_set_stacking_limits(struct queue_limits *lim)
 	lim->max_dev_sectors = UINT_MAX;
 	lim->max_write_zeroes_sectors = UINT_MAX;
 	lim->max_zone_append_sectors = UINT_MAX;
+	lim->max_copy_sectors_hw = UINT_MAX;
+	lim->max_copy_sectors = UINT_MAX;
 }
 EXPORT_SYMBOL(blk_set_stacking_limits);
 
@@ -183,6 +187,22 @@ void blk_queue_max_discard_sectors(struct request_queue *q,
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
+	if (max_copy_sectors > (COPY_MAX_BYTES >> SECTOR_SHIFT))
+		max_copy_sectors = COPY_MAX_BYTES >> SECTOR_SHIFT;
+
+	q->limits.max_copy_sectors_hw = max_copy_sectors;
+	q->limits.max_copy_sectors = max_copy_sectors;
+}
+EXPORT_SYMBOL_GPL(blk_queue_max_copy_sectors_hw);
+
 /**
  * blk_queue_max_secure_erase_sectors - set max sectors for a secure erase
  * @q:  the request queue for the device
@@ -578,6 +598,10 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 	t->max_segment_size = min_not_zero(t->max_segment_size,
 					   b->max_segment_size);
 
+	t->max_copy_sectors = min(t->max_copy_sectors, b->max_copy_sectors);
+	t->max_copy_sectors_hw = min(t->max_copy_sectors_hw,
+						b->max_copy_sectors_hw);
+
 	t->misaligned |= b->misaligned;
 
 	alignment = queue_limit_alignment_offset(b, start);
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index afc797fb0dfc..43551778d035 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -199,6 +199,62 @@ static ssize_t queue_discard_zeroes_data_show(struct request_queue *q, char *pag
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
+	unsigned long copy_offload;
+	ssize_t ret = queue_var_store(&copy_offload, page, count);
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
+	unsigned long max_copy;
+	ssize_t ret = queue_var_store(&max_copy, page, count);
+
+	if (ret < 0)
+		return ret;
+
+	if (max_copy & (queue_logical_block_size(q) - 1))
+		return -EINVAL;
+
+	max_copy >>= SECTOR_SHIFT;
+	q->limits.max_copy_sectors = min_t(unsigned int, max_copy,
+					q->limits.max_copy_sectors_hw);
+
+	return count;
+}
+
 static ssize_t queue_write_same_max_show(struct request_queue *q, char *page)
 {
 	return queue_var_show(0, page);
@@ -522,6 +578,10 @@ QUEUE_RO_ENTRY(queue_nr_zones, "nr_zones");
 QUEUE_RO_ENTRY(queue_max_open_zones, "max_open_zones");
 QUEUE_RO_ENTRY(queue_max_active_zones, "max_active_zones");
 
+QUEUE_RW_ENTRY(queue_copy_offload, "copy_offload");
+QUEUE_RO_ENTRY(queue_copy_max_hw, "copy_max_bytes_hw");
+QUEUE_RW_ENTRY(queue_copy_max, "copy_max_bytes");
+
 QUEUE_RW_ENTRY(queue_nomerges, "nomerges");
 QUEUE_RW_ENTRY(queue_rq_affinity, "rq_affinity");
 QUEUE_RW_ENTRY(queue_poll, "io_poll");
@@ -638,6 +698,9 @@ static struct attribute *queue_attrs[] = {
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
index ed44a997f629..6098665953e6 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -309,6 +309,9 @@ struct queue_limits {
 	unsigned int		discard_alignment;
 	unsigned int		zone_write_granularity;
 
+	unsigned int		max_copy_sectors_hw;
+	unsigned int		max_copy_sectors;
+
 	unsigned short		max_segments;
 	unsigned short		max_integrity_segments;
 	unsigned short		max_discard_segments;
@@ -554,6 +557,7 @@ struct request_queue {
 #define QUEUE_FLAG_NOWAIT       29	/* device supports NOWAIT */
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
 #define QUEUE_FLAG_SKIP_TAGSET_QUIESCE	31 /* quiesce_tagset skip the queue*/
+#define QUEUE_FLAG_COPY		32	/* enable/disable device copy offload */
 
 #define QUEUE_FLAG_MQ_DEFAULT	((1UL << QUEUE_FLAG_IO_STAT) |		\
 				 (1UL << QUEUE_FLAG_SAME_COMP) |	\
@@ -574,6 +578,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 	test_bit(QUEUE_FLAG_STABLE_WRITES, &(q)->queue_flags)
 #define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
 #define blk_queue_add_random(q)	test_bit(QUEUE_FLAG_ADD_RANDOM, &(q)->queue_flags)
+#define blk_queue_copy(q)	test_bit(QUEUE_FLAG_COPY, &(q)->queue_flags)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
 #define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
@@ -891,6 +896,8 @@ extern void blk_queue_chunk_sectors(struct request_queue *, unsigned int);
 extern void blk_queue_max_segments(struct request_queue *, unsigned short);
 extern void blk_queue_max_discard_segments(struct request_queue *,
 		unsigned short);
+extern void blk_queue_max_copy_sectors_hw(struct request_queue *q,
+		unsigned int max_copy_sectors);
 void blk_queue_max_secure_erase_sectors(struct request_queue *q,
 		unsigned int max_sectors);
 extern void blk_queue_max_segment_size(struct request_queue *, unsigned int);
@@ -1210,6 +1217,11 @@ static inline unsigned int bdev_discard_granularity(struct block_device *bdev)
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
index b7b56871029c..dff56813f95a 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -64,6 +64,9 @@ struct fstrim_range {
 	__u64 minlen;
 };
 
+/* maximum copy offload length, this is set to 128MB based on current testing */
+#define COPY_MAX_BYTES	(1 << 27)
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

