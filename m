Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D0E69DB58
	for <lists+dm-devel@lfdr.de>; Tue, 21 Feb 2023 08:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676965231;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jeomgWreW848w4OiDPmZpDADn0clAurjMi3SwaH3Vc0=;
	b=cfHyb6koj855z1HItgB2s5mCHWbisi+Eqcgfmh6z/tMkFqxIn0EsF9LzQNKvxIu/clxZ5w
	xQUIUlXqxJyuV7I3VObrrma3/ysYXOZzh3vFIuObzhnhdI2CbF+Cinncf/BQ6ObIWLwyPk
	ITwGeHmJKA+A6triPWVKdmnfDYAX30c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-k89l2It_OuapMquAxnJCfQ-1; Tue, 21 Feb 2023 02:40:28 -0500
X-MC-Unique: k89l2It_OuapMquAxnJCfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D95F85A588;
	Tue, 21 Feb 2023 07:40:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6694B2026D4B;
	Tue, 21 Feb 2023 07:40:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2825C19465BC;
	Tue, 21 Feb 2023 07:40:18 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 141191946589
 for <dm-devel@listman.corp.redhat.com>; Mon, 20 Feb 2023 12:56:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 038D7492B04; Mon, 20 Feb 2023 12:56:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF72C492C3C
 for <dm-devel@redhat.com>; Mon, 20 Feb 2023 12:56:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDCB885A5B1
 for <dm-devel@redhat.com>; Mon, 20 Feb 2023 12:56:12 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-TlFG1s7wMw2KY47T9oTlhg-1; Mon, 20 Feb 2023 07:56:11 -0500
X-MC-Unique: TlFG1s7wMw2KY47T9oTlhg-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230220124827epoutp02661a2904d83819339400c4bc092c53bc~FiTeIpVoR0979409794epoutp02D
 for <dm-devel@redhat.com>; Mon, 20 Feb 2023 12:48:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230220124827epoutp02661a2904d83819339400c4bc092c53bc~FiTeIpVoR0979409794epoutp02D
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20230220124827epcas5p10c02fcbfc8ad7c1c8406a09cbcaf92d8~FiTdncesG1770117701epcas5p1W;
 Mon, 20 Feb 2023 12:48:27 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.180]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4PL2K54hf2z4x9Pv; Mon, 20 Feb
 2023 12:48:25 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DA.16.10528.91C63F36; Mon, 20 Feb 2023 21:48:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20230220105453epcas5p32b30be5c5b4b21fe0bd4500a560b2b9b~FgwUJrj5W0346703467epcas5p3f;
 Mon, 20 Feb 2023 10:54:53 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230220105453epsmtrp2e436f7f567238314bcf78ceaf15ef1b0~FgwUHPt5j1664116641epsmtrp2F;
 Mon, 20 Feb 2023 10:54:53 +0000 (GMT)
X-AuditID: b6c32a49-c17ff70000012920-79-63f36c19eb85
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 13.0A.17995.D7153F36; Mon, 20 Feb 2023 19:54:53 +0900 (KST)
Received: from green5.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230220105446epsmtip2a5a77a55c14a7a033feaba4e4c350199~FgwNNaPcD0727007270epsmtip2i;
 Mon, 20 Feb 2023 10:54:46 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@kernel.org>, dm-devel@redhat.com, Keith Busch
 <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, Chaitanya
 Kulkarni <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>
Date: Mon, 20 Feb 2023 16:23:26 +0530
Message-Id: <20230220105336.3810-4-nj.shetty@samsung.com>
In-Reply-To: <20230220105336.3810-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHd+4tt8XY7QounOKGWCAMkEddYaeMTrK55RpxIVFZMnHYlDtA
 Slv7EGFj4x3AYFWGY2UqTOMQGEhFUh51pgx5WXAwmBB5GOr+EHm4LrSG11oLm/99zu/3/T1P
 fizcTcP0ZKVIVbRCKpJwiS2Mls6Ad4I5Eos4bLHECzX23cNR7rlVHNVNaAh0cfEFjpZNgzgy
 zFe6oLG7rRjq+OkChm7UdWGovfo5hrrW5wh0wTgK0JMRLYYM40Gow9DLQMNtPxLoyvUnTGQs
 y8OQ3pwDUMvyFRw1zC4wUM/4DjRzpgigwdVul2hIDf9xgNJOmQiqVTvBpAYnmxjUsElN6WqL
 CerWtW+p9rFsgirNm7cLCqZcqIU7IwR1trkWULf6v6IsOi9KZ57DYt/4PDUqmRYl0gpvWiqW
 JaZIk4TcA4cSPkoIjwjjBfME6D2ut1SURgu5+2Jigz9Jkdj3wPU+JZKo7aZYkVLJDf0gSiFT
 q2jvZJlSJeTS8kSJnC8PUYrSlGppUoiUVkXywsL2hNuFx1OTr96xAXll9Onxgd+Z2WCSXwJc
 WZDkw9LnhaAEbGG5ke0Ajl9t2Xj8DeDqowqGQ+VGWgDsuOm+GZFn07k4RW0AmmfMhFOUh8Hf
 zgpLAItFkEGwf53lMG8nH2Gwtd/HocfJAhya7+qZDoc7GQ6bp6cxBzNIPzhVuoI7mE0KYMfl
 asKRB5KhUDO1zYGuZCS05mc4Fdtg7w/ml63h5E6Yd7sSd6SHZJ0rrNWsYM4+98FK25iLk93h
 0+5mppM9oWXeQDg5Hd74roZwBucDqP1TC5yOvbCgT4M7CuNkAGxsC3Wa34blfQ2Ys/DrsHTZ
 vFGLDfWXN9kH1jdWbeTnwFFrzgZTsKrmMebcWymAZ1ZWiXPAW/vKQNpXBtL+X7oK4LWAQ8uV
 aUm0MlzOk9Lp//2xWJamAy8vI3C/HkxML4YYAcYCRgBZOHc7e51tEbuxE0UZmbRClqBQS2il
 EYTb930e93xTLLOfllSVwOMLwvgRERF8wbsRPK4H21/YK3Yjk0QqOpWm5bRiMw5juXpmYzuS
 juqWV4oW2M1HX0yufvN184mhpNGeU9wVo99I/kOfiRNfBFZvjd6T3XkpzuNw12vMnV9GH7bO
 zsbP9AX4Hi9p9F8rfgY7XHJjcgYMHxd+Sp0OFvjXTC7u50Te51y0Hnz/w+vl+gJrrmDX3geG
 X7aqB+hfv9+V2Wn9zOTb31SWZasOiT8SJ8EOvVVxPlQihClrP1cIKk8uPWy7X996qbPM1RSV
 mSyJY+lQY2H8Xxkx0xlLN/WMxzbYz7EN9Mw8a+wbqszySDcOux07GNLzj7q2yGI7hsGmxCGj
 +N6aRzs9frtcc8Trqe/uoGvFD/wW8yXd9Q1NS1NZJlGaOmP3fM7JOS5DmSziBeIKpehffcLW
 eaIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02RaUwTYRCG/XaX7dKkuq01foCIqVekWkRBP4kSYjw23hgxohiosAEjLU0L
 Kp4g4lFEEFFDMSJiiEAQKUe4Y4oVC6moIIRGaJXDAwQFUUBrtaKJ/56Z95mZH0PhggbCmToo
 j2aVcmmkiOQS5fUityUn/UdClxbWi1FR42McnUm14qigM4VE1z+N4+i7sRlHtYOZDqjjYSWG
 au6kYSivQI+h6uzPGNLbPpIoTdcGUO9LDYZqTWJUU2sgUEvVTRJl5fZykO5qAoYqeuIBKv+e
 haP7/UMEemJyQd1JFwBqtjY4+EGmpXUzozEbSaZS08lhmruKCabFGMNo8y+STMnd00x1RxzJ
 JCcM/hYSzQ7MUN1Lkrlcmg+YkqbjzIh2NqPt+YjtmLaXuzqMjTx4mFV6+IZwI3LqxoAi0++o
 6elzThzo8lIDRwrSXjBhTOugBlxKQFcA+LbxBz4ZOMFc66O/PB3m/XzLmZTiMdh3pRioAUWR
 tBg22Sh7X0j3YdDY9Qa3Fzh9DYej1QOkfXo67Q1LLRbMzgQ9H5qTJy/w6FWw5lY2aV8EaQ+Y
 Yubb0ZH2gd/OxtoNwW/jSVoJmLT50JDRQ9gZp91gQlkmngpozX+R5r/oNsDygROrUMnCZSpP
 xTI5e0SikspUMfJwSWiUTAv+/NrdvQLU5H+S6ABGAR2AFC4S8my8kVABL0wae4xVRgUrYyJZ
 lQ64UIRoJu+Z2hAsoMOl0ewhllWwyn8pRjk6x2Fl2168Cmm9kRHIHQh1qdcHXlqfDhtLC1wn
 OIXDQn23q5qJtbYbbW1fjJbcxxvVFS2+yYOzy7ZzDXND5p1d2yV8lxodsGKgSB2/29srOKjO
 sO/UsC12zcqGXQ+iBopGukHY+mdTh/hJ8d79bVNMfnvavxa2jnZmVYUsbvqAnctwk3hO3I44
 X1zfPTxjYf/4urlJ7118s8ab2EUHuBxxIG+TJD1gYolKk15ZbXWqIiaO2so150dXDxUZLQtk
 ozf4s/wDfE5vWbSQUIgP/ThxoOPppnvtW+cs3YDJ97fvXCN6HZT4Yti15K4h0yI2Lef7SDzL
 TIl6oUdfbs5Y9jKzV2N4kohQRUg93XGlSvoL8FFAo1oDAAA=
X-CMS-MailID: 20230220105453epcas5p32b30be5c5b4b21fe0bd4500a560b2b9b
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230220105453epcas5p32b30be5c5b4b21fe0bd4500a560b2b9b
References: <20230220105336.3810-1-nj.shetty@samsung.com>
 <CGME20230220105453epcas5p32b30be5c5b4b21fe0bd4500a560b2b9b@epcas5p3.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 21 Feb 2023 07:40:17 +0000
Subject: [dm-devel] [PATCH v7 3/8] block: add emulation for copy
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
Cc: Vincent Fu <vincent.fu@samsung.com>, bvanassche@acm.org,
 joshi.k@samsung.com, gost.dev@samsung.com, anuj20.g@samsung.com,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, nitheshshetty@gmail.com,
 linux-fsdevel@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 block/blk-lib.c        | 171 ++++++++++++++++++++++++++++++++++++++++-
 block/blk-map.c        |   4 +-
 include/linux/blkdev.h |   3 +
 3 files changed, 175 insertions(+), 3 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index c48cee5b6c98..74f58faf82d8 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -289,6 +289,169 @@ static int __blk_copy_offload(struct block_device *bdev_in, loff_t pos_in,
 	return cio_await_completion(cio);
 }
 
+static void *blk_alloc_buf(sector_t req_size, sector_t *alloc_size,
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
+static void blk_copy_emulate_write_end_io(struct bio *bio)
+{
+	struct copy_ctx *ctx = bio->bi_private;
+	struct cio *cio = ctx->cio;
+	sector_t clen;
+
+	if (bio->bi_status) {
+		clen = (bio->bi_iter.bi_sector << SECTOR_SHIFT) - cio->pos_out;
+		cio->comp_len = min_t(sector_t, clen, cio->comp_len);
+	}
+	kvfree(page_address(bio->bi_io_vec[0].bv_page));
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
+static void blk_copy_emulate_read_end_io(struct bio *read_bio)
+{
+	struct copy_ctx *ctx = read_bio->bi_private;
+	struct cio *cio = ctx->cio;
+	sector_t clen;
+
+	if (read_bio->bi_status) {
+		clen = (read_bio->bi_iter.bi_sector << SECTOR_SHIFT) -
+						cio->pos_in;
+		cio->comp_len = min_t(sector_t, clen, cio->comp_len);
+		__free_page(read_bio->bi_io_vec[0].bv_page);
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
+/*
+ * If native copy offload feature is absent, this function tries to emulate,
+ * by copying data from source to a temporary buffer and from buffer to
+ * destination device.
+ * returns the length of bytes copied or negative error value
+ */
+static int __blk_copy_emulate(struct block_device *bdev_in, loff_t pos_in,
+		      struct block_device *bdev_out, loff_t pos_out, size_t len,
+		      cio_iodone_t end_io, void *private, gfp_t gfp_mask)
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
+	cio->endio = end_io;
+	cio->private = private;
+
+	for (rem = len; rem > 0; rem -= buf_len) {
+		req_len = min_t(int, max_hw_len, rem);
+
+		buf = blk_alloc_buf(req_len, &buf_len, gfp_mask);
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
+		INIT_WORK(&ctx->dispatch_work, blk_copy_dispatch_work_fn);
+
+		read_bio->bi_iter.bi_sector = pos_in >> SECTOR_SHIFT;
+		read_bio->bi_iter.bi_size = buf_len;
+		read_bio->bi_opf = REQ_OP_READ | REQ_SYNC;
+		bio_set_dev(read_bio, bdev_in);
+		read_bio->bi_end_io = blk_copy_emulate_read_end_io;
+		read_bio->bi_private = ctx;
+
+		write_bio->bi_iter.bi_size = buf_len;
+		write_bio->bi_opf = REQ_OP_WRITE | REQ_SYNC;
+		bio_set_dev(write_bio, bdev_out);
+		write_bio->bi_end_io = blk_copy_emulate_write_end_io;
+		write_bio->bi_iter.bi_sector = pos_out >> SECTOR_SHIFT;
+		write_bio->bi_private = ctx;
+
+		atomic_inc(&cio->refcount);
+		submit_bio(read_bio);
+
+		pos_in += buf_len;
+		pos_out += buf_len;
+	}
+
+	/* Wait for completion of all IO's*/
+	return cio_await_completion(cio);
+
+err_write_bio:
+	bio_put(read_bio);
+err_read_bio:
+	kfree(ctx);
+err_ctx:
+	kvfree(buf);
+err_alloc_buf:
+	cio->comp_len -= min_t(sector_t, cio->comp_len, len - rem);
+	return cio_await_completion(cio);
+}
+
 static inline int blk_copy_sanity_check(struct block_device *bdev_in,
 	loff_t pos_in, struct block_device *bdev_out, loff_t pos_out,
 	size_t len)
@@ -337,15 +500,21 @@ int blkdev_issue_copy(struct block_device *bdev_in, loff_t pos_in,
 	struct request_queue *q_in = bdev_get_queue(bdev_in);
 	struct request_queue *q_out = bdev_get_queue(bdev_out);
 	int ret = -EINVAL;
+	bool offload = false;
 
 	ret = blk_copy_sanity_check(bdev_in, pos_in, bdev_out, pos_out, len);
 	if (ret)
 		return ret;
 
-	if (blk_check_copy_offload(q_in, q_out))
+	offload = blk_check_copy_offload(q_in, q_out);
+	if (offload)
 		ret = __blk_copy_offload(bdev_in, pos_in, bdev_out, pos_out,
 			   len, end_io, private, gfp_mask);
 
+	if ((ret != len) || !offload)
+		ret = __blk_copy_emulate(bdev_in, pos_in + ret, bdev_out,
+			 pos_out + ret, len - ret, end_io, private, gfp_mask);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(blkdev_issue_copy);
diff --git a/block/blk-map.c b/block/blk-map.c
index 19940c978c73..bcf8db2b75f1 100644
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
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 18d5bd7fc3bf..766761911190 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1066,6 +1066,9 @@ int blkdev_issue_secure_erase(struct block_device *bdev, sector_t sector,
 int blkdev_issue_copy(struct block_device *bdev_in, loff_t pos_in,
 		      struct block_device *bdev_out, loff_t pos_out, size_t len,
 		      cio_iodone_t end_io, void *private, gfp_t gfp_mask);
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

