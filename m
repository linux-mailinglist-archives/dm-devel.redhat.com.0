Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C441A70C357
	for <lists+dm-devel@lfdr.de>; Mon, 22 May 2023 18:29:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684772984;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pKPeByic1qWpnYoTvCcfBGnOxiuPcXXzvfpzRYP8y70=;
	b=e+gAjlEXkc3R9bYd/VDPtQnG5LsZFDVoORN8fH8S17LocEveGc1d/V2t96xf4Rvo/kQSWG
	dHLOOvf3XbJfCUsxkG5WtCd5cngthbGJeKvwXNEO1x++8fDXE66L4HgBWUjK0VgDo5OBqp
	NTBvv4iZcFywwpZ2engCIA3mb1OMLP0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-_8Dnr4J0Obad1PHfbbRvxQ-1; Mon, 22 May 2023 12:29:40 -0400
X-MC-Unique: _8Dnr4J0Obad1PHfbbRvxQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9733685A5BD;
	Mon, 22 May 2023 16:29:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97E74492B0A;
	Mon, 22 May 2023 16:29:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9EB6419452C8;
	Mon, 22 May 2023 16:29:20 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 901D7194658C
 for <dm-devel@listman.corp.redhat.com>; Mon, 22 May 2023 11:10:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7E0631121318; Mon, 22 May 2023 11:10:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75F681121315
 for <dm-devel@redhat.com>; Mon, 22 May 2023 11:10:42 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55750185A793
 for <dm-devel@redhat.com>; Mon, 22 May 2023 11:10:42 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-5iSfHoKgP_aZ0bHstqJQYA-1; Mon, 22 May 2023 07:10:40 -0400
X-MC-Unique: 5iSfHoKgP_aZ0bHstqJQYA-1
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230522111037epoutp0279892e4d75033ad32e461d36db04af79~hcrBUa88w1029410294epoutp02z
 for <dm-devel@redhat.com>; Mon, 22 May 2023 11:10:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230522111037epoutp0279892e4d75033ad32e461d36db04af79~hcrBUa88w1029410294epoutp02z
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230522111036epcas5p31976ea6f82d59aff10da72023e4f959e~hcrAu4Lxa1165311653epcas5p3u;
 Mon, 22 May 2023 11:10:36 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.175]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4QPvrB4ymmz4x9Pv; Mon, 22 May
 2023 11:10:34 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BE.29.16380.AAD4B646; Mon, 22 May 2023 20:10:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230522104607epcas5p11b718b8ed5006e92eca0e628b8196f08~hcVowuHWW1779017790epcas5p1I;
 Mon, 22 May 2023 10:46:07 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230522104607epsmtrp228a1c1b0e7d220836a3c8ca6c072bc51~hcVoqAutM0041200412epsmtrp2Y;
 Mon, 22 May 2023 10:46:07 +0000 (GMT)
X-AuditID: b6c32a4b-56fff70000013ffc-df-646b4daa3a6c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 95.EF.28392.FE74B646; Mon, 22 May 2023 19:46:07 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230522104603epsmtip2c628a826770c4b1d5efde2819688ccea~hcVkviBrY1645716457epsmtip2s;
 Mon, 22 May 2023 10:46:03 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@kernel.org>, dm-devel@redhat.com, Keith Busch
 <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, Chaitanya
 Kulkarni <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 22 May 2023 16:11:34 +0530
Message-Id: <20230522104146.2856-4-nj.shetty@samsung.com>
In-Reply-To: <20230522104146.2856-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xbZRjed045LTPgAYZ8gIRaMWQQKHUFvi4gRgYexSnO+yB2tT0WArRN
 W7ZpdDIum9zGRQR3ioVtRC5jEC5DVkAmC+O+ZeE6DIOwkimVcpvZlAyktOj+Pc/zvu/zXr58
 HNzZwPbgJCq0tFohSeYRe1ltN/b7BtQdTpIFbT32QY2DN3FU3lhPoPTCJzi6PFNAINONNYBK
 V/7G0Vx3BOoy6+zQ3evXMNR5sRhDtZd7MdRUwEEdF1Yx1Lu1RKDingmAFsYZDHVN+6POrgEW
 GjWUE+he/ZYdqvhpgY1yJ9sJVN23iaGe7zIw1G48DVDbRgWOGkzLLNQ/7Ynu534L0O0nfXZo
 43E58ao3NToWQzGzIwR1jZlhU7fvNbGo0uJBgmqp8aNGR1Kp5rpsgmpeK2ZT/T9ssKiWqm+o
 jrtpBJWfYSao1YVpFrX8yzhBnWutA7EuR5PCEmiJjFZzaYVUKUtUyMN5Me+JI8XBIUGCAIEI
 hfK4CkkKHc479FZsQHRi8va5eNzjkuTUbSlWotHw+K+EqZWpWpqboNRow3m0SpasEqoCNZIU
 TapCHqigtQcFQUEvB28nHktKuKVLt1O1RZwsq3lApIEzwhxgz4GkED4aqGLlgL0cZ7IDQFNn
 i42sAZg28cBG1gHU/XwT2y1pma0mrAEDgFPNOsxKsjB4ZXRlm3A4BOkPh7Y4Fn0facThkuFP
 3EJw0ozD9E0TsFi5kCGwKj93B7PIl2BZ7uwOdiBF8FIdg1uMIMmHBbNOFtmePAh/v2ORLSlO
 cOC8kWXBOOkNM67qdvwhOW8Pl/tr2dZRD0FTUbdtbBe42Ndq0z3gurmLsOITsLakhrAWZwLI
 TDLAGoiAWYMFO0Pg5H7YaOBbZS/4/WADZm3sCPM3jDZ/B9iu38UvwvrGSpu/O5x4dNqGKVja
 XoJbr5UP4NjgP3gh4DJPLcQ8tRDzf+tKgNcBd1qlSZHTmmDVAQV94r93lipTmsHOJ/KLaQfz
 cyuBPQDjgB4AOThvn8O756QyZweZ5IsvabVSrE5NpjU9IHj74EW4h6tUuf0LFVqxQCgKEoaE
 hAhFB0IEPDcH3/ABqTMpl2jpJJpW0erdOoxj75GG+YBxz89bGK83xvOy71QsLT4f85nYVObo
 OyJLkGb2Rcqj9ay6+DxXQ9aY65TKy/3qdGikvl4iZ0dxf5vLLHwGlzt+IFwret/rOdYLBa4f
 5r99Bn1VyXx6YaQzXe+27pVXnOcpuBRwPj3Ge/VUVNPZzaHI1xrMYv7wvOiPqabjboxPYeeV
 OP/EYUNmvC78lrJsz0O+cdxvTz2KbzUWOWnctzy1gQkdWpHRg2dSZptzfnwY+vrUqTljoJIn
 PXpxoCEmak6ZFx0c13tf+fUxrd1M7skxZuidT6ozPp4sWecX+B6ZG/21IcsXnA07olx8Nvgj
 fa7e9XDHsFtOdbd88fpfb8bxWJoEicAPV2sk/wL30b77zQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxzFfe69vb0wOi+FxAd1I9QtJpW3GrI8bMtcosZnc0s0JsL4IHT0
 phpKqb2AoglD0ImQUlYMSGFDsfJSHATQpkCBWV4EDCKiIGQFoxDMGC2QmLRj0FmaJX475/zO
 /3z6M6TYSe1kzqgzOa1arpLQgZSlTxIe5TqSpoidvx2BWkYGSVTdcpdG+aUbJGpy6Gm01LcG
 UPmKh0Qvew+gbmeVAE3/0UEgW62BQI1NAwRq1TOo69YqgQa8yzQy2CcBWnhuJFD3zD5k6x6m
 0ERnNY1m73oFqKZuQYiKp6w0qn+4SSB7WQGBrPOXALKs15CoeclFoaGZXeh1cSFAYxsPBWjd
 XU1/HY4nnh3FxrlRGncYHUI8NttK4XLDCI3bG6R4YjQLt5mv0bhtzSDEQzfWKdxu+gl3TefR
 WFfgpPHqwgyFXT3PaVxyzwyOhSQFfqngVGeyOW3MVymBpx9X5Qs0lgPnKxoW6Tzwc1wRCGAg
 Gwfb5+rpIhDIiFkrgHV95YQfhMG6jX7Sr0Ng4+ai0F8qIODVzWfvDMPQ7D74yMv48lB2hYQt
 92qBz5BsPgULLz+gfNch7GfQpCsGPk2xn8KK4rktLWLj4W2zkfQNQTYG6ueCfXEA+zl8M+6P
 xe8qpXX7/e1gOFw5v7VIsuGw4H4VWQpY43vI+B66CQgzCOM0fLoynZdp9qu5c9G8PJ3PUiuj
 UzPS28DWS0ilVmAzr0TbAcEAO4AMKQkVHS9JVYhFCnnOBU6bkazNUnG8HexiKMkO0ZOi4WQx
 q5Rncmkcp+G0/1OCCdiZR9T3VSm8H51dPPqJPGRH2cidKw4mvqf14rLXddC7959s4yNnTO21
 fyUnXwW9yn3TpjWlgFG98xcLGRWU67qemIAqKt0541Nq/Jdue9jQYc/1yfLB7w5/HHnsbcpA
 eCLnjsjoL31sVeHsVOGPe5XVb52V7iPJexoPWdAyH6ytOS9N9ET92Tyc0Gz/bSoiyGYSXc5W
 fB+kTOLHJLrQtHHT0oUbUbIrOoP796beUyWNzTX9gy93f9Pe6qj0ZCmXar/9Iu3Dbdvm18dd
 sjtlJ88mqDYaOq++iLfIYp+O5PzaFXwp+cTuxfjOlExN7sWknLW/HcuTsXGF+g8if7AJSBas
 JnkkFH9aLpOSWl7+H6pWFG2BAwAA
X-CMS-MailID: 20230522104607epcas5p11b718b8ed5006e92eca0e628b8196f08
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230522104607epcas5p11b718b8ed5006e92eca0e628b8196f08
References: <20230522104146.2856-1-nj.shetty@samsung.com>
 <CGME20230522104607epcas5p11b718b8ed5006e92eca0e628b8196f08@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 22 May 2023 16:29:19 +0000
Subject: [dm-devel] [PATCH v11 3/9] block: add emulation for copy
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
Cc: Vincent Fu <vincent.fu@samsung.com>, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-mm@kvack.org, gost.dev@samsung.com,
 anuj20.g@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, ming.lei@redhat.com,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 dlemoal@kernel.org, linux-block@vger.kernel.org,
 Nitesh Shetty <nj.shetty@samsung.com>, joshi.k@samsung.com,
 nitheshshetty@gmail.com, bvanassche@acm.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
 block/blk-lib.c        | 175 ++++++++++++++++++++++++++++++++++++++++-
 block/blk-map.c        |   4 +-
 include/linux/blkdev.h |   3 +
 3 files changed, 179 insertions(+), 3 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index ed089e703cb1..ba32545eb8d5 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -295,6 +295,172 @@ static int __blkdev_copy_offload(struct block_device *bdev_in, loff_t pos_in,
 	return blkdev_copy_wait_completion(cio);
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
+ * Returns the length of bytes copied or error if encountered
+ */
+static int __blkdev_copy_emulate(struct block_device *bdev_in, loff_t pos_in,
+		      struct block_device *bdev_out, loff_t pos_out, size_t len,
+		      cio_iodone_t endio, void *private, gfp_t gfp_mask)
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
+
+	/* Wait for completion of all IO's*/
+	return blkdev_copy_wait_completion(cio);
+
+err_write_bio:
+	bio_put(read_bio);
+err_read_bio:
+	kfree(ctx);
+err_ctx:
+	kvfree(buf);
+err_alloc_buf:
+	cio->comp_len -= min_t(sector_t, cio->comp_len, len - rem);
+	if (!atomic_read(&cio->refcount))
+		return -ENOMEM;
+	/* Wait for submitted IOs to complete */
+	return blkdev_copy_wait_completion(cio);
+}
+
 static inline int blkdev_copy_sanity_check(struct block_device *bdev_in,
 	loff_t pos_in, struct block_device *bdev_out, loff_t pos_out,
 	size_t len)
@@ -342,9 +508,16 @@ int blkdev_issue_copy(struct block_device *bdev_in, loff_t pos_in,
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
index 04c55f1c492e..e79eb4d2e545 100644
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
index 6f2814ab4741..a95c26faa8b6 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1054,6 +1054,9 @@ int blkdev_issue_secure_erase(struct block_device *bdev, sector_t sector,
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

