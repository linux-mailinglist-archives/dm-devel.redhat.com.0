Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BAF740951
	for <lists+dm-devel@lfdr.de>; Wed, 28 Jun 2023 07:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687931786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qE/Yq0RLzIyb+dB0eUcNgYsEC9c6NG2Ghd1T7AnNU5E=;
	b=B0r+60TRgIjHVCP0wYo+ypPSb63+FY9iNqz8Gmqzo8khDp81AqdElsMAUoAXyTUY8fkSNo
	2zkprE0X4qwZzWeJOAuio4tZofXSL2zo/5x4Fpmvm7skEo3QSfJQW6I0IHvGYL2sI7SlD5
	aU1DGfzPZ4NkcTlM4vykofPbIhLt31E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-JUC4vAKcOlOyxHyPQTD0lw-1; Wed, 28 Jun 2023 01:56:25 -0400
X-MC-Unique: JUC4vAKcOlOyxHyPQTD0lw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5D3F185A78F;
	Wed, 28 Jun 2023 05:56:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD2AB14682F7;
	Wed, 28 Jun 2023 05:56:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 80A0519465A0;
	Wed, 28 Jun 2023 05:55:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0660F1946587
 for <dm-devel@listman.corp.redhat.com>; Wed, 28 Jun 2023 05:55:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 666E8C1ED98; Wed, 28 Jun 2023 05:55:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E71CC09A07
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 400AD1C07582
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:25 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-cQ-sWrK3Ma-D-8iXJAw8-Q-1; Wed, 28 Jun 2023 01:55:23 -0400
X-MC-Unique: cQ-sWrK3Ma-D-8iXJAw8-Q-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230628055520epoutp0407e8f99476428ae5ac7322a8cd9959fe~svPTWnDHe1123911239epoutp04r
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230628055520epoutp0407e8f99476428ae5ac7322a8cd9959fe~svPTWnDHe1123911239epoutp04r
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230628055519epcas5p39c789088bba29dacf3193a6619b747cf~svPSmbKu91655316553epcas5p3B;
 Wed, 28 Jun 2023 05:55:19 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.180]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4QrW5K3grXz4x9Q0; Wed, 28 Jun
 2023 05:55:17 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 13.59.55173.54BCB946; Wed, 28 Jun 2023 14:55:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230627184020epcas5p13fdcea52edead5ffa3fae444f923439e~smB9H_YYq0172101721epcas5p1r;
 Tue, 27 Jun 2023 18:40:20 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230627184020epsmtrp2901427a1af9091266d00b9cedb5989bc~smB9Gzt1c2845228452epsmtrp2Q;
 Tue, 27 Jun 2023 18:40:20 +0000 (GMT)
X-AuditID: b6c32a50-e61c07000001d785-1e-649bcb45da0a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DF.39.34491.41D2B946; Wed, 28 Jun 2023 03:40:20 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230627184016epsmtip27f2682562e4d83a09532283579af691c~smB5KnDhk0383803838epsmtip2d;
 Tue, 27 Jun 2023 18:40:16 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>
Date: Wed, 28 Jun 2023 00:06:17 +0530
Message-Id: <20230627183629.26571-4-nj.shetty@samsung.com>
In-Reply-To: <20230627183629.26571-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TaVBbVRTufS95CTjpvLJ5xVaZaHWgBpIawgVBkEXeWJ3iuMzAqDRD3gBC
 FrOIUm2hLLVlTwWmAU0FlLIILWAbllhMVbYq0yIgWGgdQ2cMZWuVUsJi4gPtv+983znnO+fc
 uVzc7WuONzdVoaXVCmk6n3BlXbjs6yuIGaqSCX9r80atgz/i6FjpOo6apkoINHv5DkAVi/dx
 ZO09DtCIdSe6eSkcmeer2GiitxNDPTV6DDU0/YAhvWUMoJlRA4bMk/vQF/l1LNRjHmChka5q
 Ahm/muGggnETger7NjBkOZWDIZM1G6ALdiOOWmYXWKh/8lH0R8EnAA2v97GRfaWaiNhDjfxy
 gOo0THGo4enzLKr9rB818pOOams8QVDtdUep7oksgqotPsWminLmCWppZpJFLXw7SlDFHY2A
 ah86TN1te4xqs85hcWRCWmgKLZXRah9akaSUpSqSw/gHXkuMSgyUCEUCUTAK4vsopHI6jB/9
 cpzgxdR0x4n4Pu9L03UOKk6q0fADng9VK3Va2idFqdGG8WmVLF0lVvlrpHKNTpHsr6C1ISKh
 cH+gI/FQWkp7eTZLZYr84HahgZUF+iUngQsXkmKYc3WWcxK4ct3IHgBnq/UYE9wBsLzw1pay
 7FA2buDbJSXTLWxGMANovFcGmCAPg5Zqp8LlEuQ+OLTJdfIeZBYOz3XXAmc1Ts7jsLbMxYnd
 SQnsWOjFnJhF7oWFg0uEE/PIENhT1YQ5+0AyAJbc2OWkXcjnYPfw92wmZRccOG1lMS0fhznf
 VOFOL0hOusBbU39izKTRcKC+n2CwO7T1dXAY7A3vzpu3+AzY8OlZginOBdAwbgCMEA7zBktw
 5xA46QtbuwIYeg8sH2zBGOOdsMhu3fLiQdPn2/gJ2Nx6Zqv/I3DsXjbB7ELBn0eimFsVA7h6
 upVTCnwMD+xjeGAfw//OZwDeCLxplUaeTCcFqkQCBZ3x3zMnKeVt4N9/4xdnAk3n1v0tAOMC
 C4BcnO/B81qplLnxZNIPM2m1MlGtS6c1FhDoOHgZ7u2ZpHR8PIU2USQOFoolEok4+FmJiP8w
 bzr2hMyNTJZq6TSaVtHq7TqM6+KdhX20I2BMthBrvBQ8HTVjb99dcLCsC2ijTIvI7lqx6tEG
 Jiqla89svjA1V56h34y8Pxpbaftdnvt2+Pm/3OqXU9z7EmTG4o9TYzKbv+vceDrx9bKA/fHX
 Kqre+tLDboxlExGegtjoDkH85Lz2yVdfEYS+h4RBxUc0zYsTeyMX1sjluFbbkfHjtFdN9rUV
 ju1mzNih4foG6GIzH0zIY8t2t9fySPOQamnVHvFGTZn5erTIXbi8Q9ywVpqveujKS3L9lc+E
 QdFqsddVQ2/K9V/Fb3rq85+yphUNclwLjl3823w4zb37Ym5SfN3Au0fNJ2ld0Fwmx2YKqoCb
 nu9sWEJu94v4LE2KVOSHqzXSfwBAUQPYwAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsWy7bCSvK6I7uwUgycfBC3WnzrGbNE04S+z
 xeq7/WwWrw9/YrSY9uEns8WTA+2MFpef8Fk82G9vsffdbFaLmwd2MlnsWTSJyWLl6qNMFpMO
 XWO0eHp1FpPF3lvaFgvblrBY7Nl7ksXi8q45bBbzlz1lt+i+voPNYvnxf0wWhyY3M1nseNLI
 aLHt93xmi3Wv37NYnLglbfG4u4PR4vzf46wWv3/MYXOQ9bh8xdtj56y77B7n721k8di8Qsvj
 8tlSj02rOtk8Ni+p99h9s4HNY3HfZFaP3uZ3bB4fn95i8Xi/7yqbR9+WVYwem09Xe3zeJOex
 6clbpgCBKC6blNSczLLUIn27BK6MzVMbWQp2OFW86ZnF0sB4wqyLkZNDQsBEov/eOtYuRi4O
 IYHdjBLzX1xhg0hISiz7e4QZwhaWWPnvOTtEUTOTxJFPC1i6GDk42AS0JU7/5wCJiwh0MUt0
 7nzHAuIwCzSxSNy88wqsW1jATGLL+wNMIDaLgKpEz6mPYBt4Bawk9sxezQQySEJAX6L/viBI
 mFPAWmL3+SOsIGEhoJL3xwMgqgUlTs58wgJiMwvISzRvnc08gVFgFpLULCSpBYxMqxglUwuK
 c9Nziw0LDPNSy/WKE3OLS/PS9ZLzczcxgpOBluYOxu2rPugdYmTiYDzEKMHBrCTCK/ZjeooQ
 b0piZVVqUX58UWlOavEhRmkOFiVxXvEXvSlCAumJJanZqakFqUUwWSYOTqkGJp2mOl+/hUf+
 7bgS8crjZWiKd8Nrud9cT981NagFBfjwnV3/6k3dD2VhFT7GtNk7ewquPLsa3Xb2VfqnTxO8
 NVxTl/u7vVhff3hieuQjXtuXCwub129OXCjm+n39Se7PFWb8bVMd7Q4x1+3S36J7e/v33mN/
 1yfd653XXtXee9XLVerIjcsbvxsHh8+oX/LptznzlfU6lRXrf7v3HmlweTVBtCnxlN3jE19k
 LB8+Opd5IcpV3ynXc2fqmtUsqww+Tks0/G0ezzxxWcHF0oy0jRXXjRxOxhSsm3hKUGuGz8tZ
 9Rq2Bx0Deh4cX1GlNVfC9ct1keD4qUsXtTTNyuVrXjTbdc3ug9ULI85GFLzkmajEUpyRaKjF
 XFScCAAbHPCQdQMAAA==
X-CMS-MailID: 20230627184020epcas5p13fdcea52edead5ffa3fae444f923439e
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230627184020epcas5p13fdcea52edead5ffa3fae444f923439e
References: <20230627183629.26571-1-nj.shetty@samsung.com>
 <CGME20230627184020epcas5p13fdcea52edead5ffa3fae444f923439e@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH v13 3/9] block: add emulation for copy
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
Cc: Anuj Gupta <anuj20.g@samsung.com>, Vincent Fu <vincent.fu@samsung.com>,
 linux-nvme@lists.infradead.org, bvanassche@acm.org, linux-scsi@vger.kernel.org,
 linux-doc@vger.kernel.org, djwong@kernel.org, nitheshshetty@gmail.com,
 linux-kernel@vger.kernel.org, willy@infradead.org, ming.lei@redhat.com,
 linux-block@vger.kernel.org, dlemoal@kernel.org, martin.petersen@oracle.com,
 linux-fsdevel@vger.kernel.org, gost.dev@samsung.com,
 Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For the devices which does not support copy, copy emulation is added.
It is required for in-kernel users like fabrics, where file descriptor is
not available and hence they can't use copy_file_range.
Copy-emulation is implemented by reading from source into memory and
writing to the corresponding destination asynchronously.
Also emulation is used, if copy offload fails or partially completes.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Vincent Fu <vincent.fu@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 block/blk-lib.c           | 183 +++++++++++++++++++++++++++++++++++++-
 block/blk-map.c           |   4 +-
 include/linux/blk_types.h |   5 ++
 include/linux/blkdev.h    |   3 +
 4 files changed, 192 insertions(+), 3 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 10c3eadd5bf6..09e0d5d51d03 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -234,6 +234,180 @@ static ssize_t __blkdev_copy_offload(
 	return blkdev_copy_wait_io_completion(cio);
 }
 
+static void *blkdev_copy_alloc_buf(sector_t req_size, sector_t *alloc_size,
+		gfp_t gfp_mask)
+{
+	int min_size = PAGE_SIZE;
+	void *buf;
+
+	while (req_size >= min_size) {
+		buf = kvmalloc(req_size, gfp_mask);
+		if (buf) {
+			*alloc_size = req_size;
+			return buf;
+		}
+		/* retry half the requested size */
+		req_size >>= 1;
+	}
+
+	return NULL;
+}
+
+static void blkdev_copy_emulate_write_endio(struct bio *bio)
+{
+	struct copy_ctx *ctx = bio->bi_private;
+	struct cio *cio = ctx->cio;
+	sector_t clen;
+
+	if (bio->bi_status) {
+		clen = (bio->bi_iter.bi_sector << SECTOR_SHIFT) - cio->pos_out;
+		cio->comp_len = min_t(sector_t, clen, cio->comp_len);
+	}
+	kfree(bvec_virt(&bio->bi_io_vec[0]));
+	bio_map_kern_endio(bio);
+	kfree(ctx);
+	if (atomic_dec_and_test(&cio->refcount)) {
+		if (cio->endio) {
+			cio->endio(cio->private, cio->comp_len);
+			kfree(cio);
+		} else
+			blk_wake_io_task(cio->waiter);
+	}
+}
+
+static void blkdev_copy_emulate_read_endio(struct bio *read_bio)
+{
+	struct copy_ctx *ctx = read_bio->bi_private;
+	struct cio *cio = ctx->cio;
+	sector_t clen;
+
+	if (read_bio->bi_status) {
+		clen = (read_bio->bi_iter.bi_sector << SECTOR_SHIFT) -
+						cio->pos_in;
+		cio->comp_len = min_t(sector_t, clen, cio->comp_len);
+		kfree(bvec_virt(&read_bio->bi_io_vec[0]));
+		bio_map_kern_endio(read_bio);
+		kfree(ctx);
+
+		if (atomic_dec_and_test(&cio->refcount)) {
+			if (cio->endio) {
+				cio->endio(cio->private, cio->comp_len);
+				kfree(cio);
+			} else
+				blk_wake_io_task(cio->waiter);
+		}
+	}
+	schedule_work(&ctx->dispatch_work);
+	kfree(read_bio);
+}
+
+static void blkdev_copy_dispatch_work(struct work_struct *work)
+{
+	struct copy_ctx *ctx = container_of(work, struct copy_ctx,
+			dispatch_work);
+
+	submit_bio(ctx->write_bio);
+}
+
+/*
+ * If native copy offload feature is absent, this function tries to emulate,
+ * by copying data from source to a temporary buffer and from buffer to
+ * destination device.
+ * Returns the length of bytes copied or error if encountered
+ */
+static ssize_t __blkdev_copy_emulate(
+		struct block_device *bdev_in, loff_t pos_in,
+		struct block_device *bdev_out, loff_t pos_out,
+		size_t len, cio_iodone_t endio, void *private, gfp_t gfp_mask)
+{
+	struct request_queue *in = bdev_get_queue(bdev_in);
+	struct request_queue *out = bdev_get_queue(bdev_out);
+	struct bio *read_bio, *write_bio;
+	void *buf = NULL;
+	struct copy_ctx *ctx;
+	struct cio *cio;
+	sector_t buf_len, req_len, rem = 0;
+	sector_t max_src_hw_len = min_t(unsigned int,
+			queue_max_hw_sectors(in),
+			queue_max_segments(in) << (PAGE_SHIFT - SECTOR_SHIFT))
+			<< SECTOR_SHIFT;
+	sector_t max_dst_hw_len = min_t(unsigned int,
+		queue_max_hw_sectors(out),
+			queue_max_segments(out) << (PAGE_SHIFT - SECTOR_SHIFT))
+			<< SECTOR_SHIFT;
+	sector_t max_hw_len = min_t(unsigned int,
+			max_src_hw_len, max_dst_hw_len);
+
+	cio = kzalloc(sizeof(struct cio), GFP_KERNEL);
+	if (!cio)
+		return -ENOMEM;
+	atomic_set(&cio->refcount, 0);
+	cio->pos_in = pos_in;
+	cio->pos_out = pos_out;
+	cio->waiter = current;
+	cio->endio = endio;
+	cio->private = private;
+
+	for (rem = len; rem > 0; rem -= buf_len) {
+		req_len = min_t(int, max_hw_len, rem);
+
+		buf = blkdev_copy_alloc_buf(req_len, &buf_len, gfp_mask);
+		if (!buf)
+			goto err_alloc_buf;
+
+		ctx = kzalloc(sizeof(struct copy_ctx), gfp_mask);
+		if (!ctx)
+			goto err_ctx;
+
+		read_bio = bio_map_kern(in, buf, buf_len, gfp_mask);
+		if (IS_ERR(read_bio))
+			goto err_read_bio;
+
+		write_bio = bio_map_kern(out, buf, buf_len, gfp_mask);
+		if (IS_ERR(write_bio))
+			goto err_write_bio;
+
+		ctx->cio = cio;
+		ctx->write_bio = write_bio;
+		INIT_WORK(&ctx->dispatch_work, blkdev_copy_dispatch_work);
+
+		read_bio->bi_iter.bi_sector = pos_in >> SECTOR_SHIFT;
+		read_bio->bi_iter.bi_size = buf_len;
+		read_bio->bi_opf = REQ_OP_READ | REQ_SYNC;
+		bio_set_dev(read_bio, bdev_in);
+		read_bio->bi_end_io = blkdev_copy_emulate_read_endio;
+		read_bio->bi_private = ctx;
+
+		write_bio->bi_iter.bi_size = buf_len;
+		write_bio->bi_opf = REQ_OP_WRITE | REQ_SYNC;
+		bio_set_dev(write_bio, bdev_out);
+		write_bio->bi_end_io = blkdev_copy_emulate_write_endio;
+		write_bio->bi_iter.bi_sector = pos_out >> SECTOR_SHIFT;
+		write_bio->bi_private = ctx;
+
+		atomic_inc(&cio->refcount);
+		submit_bio(read_bio);
+
+		pos_in += buf_len;
+		pos_out += buf_len;
+	}
+	return blkdev_copy_wait_io_completion(cio);
+
+err_write_bio:
+	bio_put(read_bio);
+err_read_bio:
+	kfree(ctx);
+err_ctx:
+	kvfree(buf);
+err_alloc_buf:
+	cio->comp_len -= min_t(sector_t, cio->comp_len, len - rem);
+	if (!atomic_read(&cio->refcount)) {
+		kfree(cio);
+		return -ENOMEM;
+	}
+	return blkdev_copy_wait_io_completion(cio);
+}
+
 static inline ssize_t blkdev_copy_sanity_check(
 	struct block_device *bdev_in, loff_t pos_in,
 	struct block_device *bdev_out, loff_t pos_out,
@@ -284,9 +458,16 @@ ssize_t blkdev_copy_offload(
 	if (ret)
 		return ret;
 
-	if (blk_queue_copy(q_in) && blk_queue_copy(q_out))
+	if (blk_queue_copy(q_in) && blk_queue_copy(q_out)) {
 		ret = __blkdev_copy_offload(bdev_in, pos_in, bdev_out, pos_out,
 			   len, endio, private, gfp_mask);
+		if (ret < 0)
+			ret = 0;
+	}
+
+	if (ret != len)
+		ret = __blkdev_copy_emulate(bdev_in, pos_in + ret, bdev_out,
+			 pos_out + ret, len - ret, endio, private, gfp_mask);
 
 	return ret;
 }
diff --git a/block/blk-map.c b/block/blk-map.c
index 44d74a30ddac..ceeb70a95fd1 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -363,7 +363,7 @@ static void bio_invalidate_vmalloc_pages(struct bio *bio)
 #endif
 }
 
-static void bio_map_kern_endio(struct bio *bio)
+void bio_map_kern_endio(struct bio *bio)
 {
 	bio_invalidate_vmalloc_pages(bio);
 	bio_uninit(bio);
@@ -380,7 +380,7 @@ static void bio_map_kern_endio(struct bio *bio)
  *	Map the kernel address into a bio suitable for io to a block
  *	device. Returns an error pointer in case of error.
  */
-static struct bio *bio_map_kern(struct request_queue *q, void *data,
+struct bio *bio_map_kern(struct request_queue *q, void *data,
 		unsigned int len, gfp_t gfp_mask)
 {
 	unsigned long kaddr = (unsigned long)data;
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 336146798e56..f8c80940c7ad 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -562,4 +562,9 @@ struct cio {
 	atomic_t refcount;
 };
 
+struct copy_ctx {
+	struct cio *cio;
+	struct work_struct dispatch_work;
+	struct bio *write_bio;
+};
 #endif /* __LINUX_BLK_TYPES_H */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 963f5c97dec0..c176bf6173c5 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1047,6 +1047,9 @@ ssize_t blkdev_copy_offload(
 		struct block_device *bdev_in, loff_t pos_in,
 		struct block_device *bdev_out, loff_t pos_out,
 		size_t len, cio_iodone_t end_io, void *private, gfp_t gfp_mask);
+struct bio *bio_map_kern(struct request_queue *q, void *data, unsigned int len,
+		gfp_t gfp_mask);
+void bio_map_kern_endio(struct bio *bio);
 
 #define BLKDEV_ZERO_NOUNMAP	(1 << 0)  /* do not free blocks */
 #define BLKDEV_ZERO_NOFALLBACK	(1 << 1)  /* don't write explicit zeroes */
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

