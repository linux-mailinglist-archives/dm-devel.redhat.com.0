Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC09079425B
	for <lists+dm-devel@lfdr.de>; Wed,  6 Sep 2023 19:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694022870;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9a5Wec/AX4CnkifFJA2AVwiy4EmL9vbeWDDaGqlu4gY=;
	b=RpKrUDTOaOX1wSADNPtBeyWOlY1KtFEUy4hauLuG9rYRT1MdVA3qG2pHp2Otdh/y3jriRq
	Sr6uopnQ9sLa+yEPkdCAD1QJHq23Yz/bxhlSAxGl+uDw2/oM0ZatTf9b04hNSyYIJgNfCh
	4Om0KgusJMkF5LUaupX74Vv24BpwT1I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-O9l3AUAoMvmQcLiQzKtWjA-1; Wed, 06 Sep 2023 13:54:27 -0400
X-MC-Unique: O9l3AUAoMvmQcLiQzKtWjA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EC49800969;
	Wed,  6 Sep 2023 17:54:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1498B493112;
	Wed,  6 Sep 2023 17:54:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C48A9194658C;
	Wed,  6 Sep 2023 17:54:19 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 085BF194658C
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Sep 2023 17:54:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D06B12012F37; Wed,  6 Sep 2023 17:54:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8F6621D4F3F
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 17:54:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8AC63C0DDC4
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 17:54:18 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-iCT1Tk-PMWaRZhHql8-LSw-1; Wed, 06 Sep 2023 13:54:16 -0400
X-MC-Unique: iCT1Tk-PMWaRZhHql8-LSw-1
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230906175413epoutp0277709acb854d84d4a722dc0ba4f7250c~CYM9dImrV2036620366epoutp02Z
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 17:54:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230906175413epoutp0277709acb854d84d4a722dc0ba4f7250c~CYM9dImrV2036620366epoutp02Z
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20230906175412epcas5p407dfc1c253de2ea0620736f83c6f40f2~CYM8dsE_D0784107841epcas5p4u;
 Wed,  6 Sep 2023 17:54:12 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.180]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4RgqkV6S8Gz4x9Pp; Wed,  6 Sep
 2023 17:54:10 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9B.03.09949.2CCB8F46; Thu,  7 Sep 2023 02:54:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230906164303epcas5p1c2d3ec21feac347f0f1d68adc97c61f5~CXO0LQcqV0246002460epcas5p1r;
 Wed,  6 Sep 2023 16:43:03 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230906164302epsmtrp2a6be0532f56780f4ec95873711f35097~CXO0KJ88E1133211332epsmtrp2D;
 Wed,  6 Sep 2023 16:43:02 +0000 (GMT)
X-AuditID: b6c32a49-98bff700000026dd-de-64f8bcc26343
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 7E.76.08649.61CA8F46; Thu,  7 Sep 2023 01:43:02 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230906164300epsmtip29e2d559526437109c745ed483dbbebe8~CXOxYHflU0395803958epsmtip2B;
 Wed,  6 Sep 2023 16:42:59 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>
Date: Wed,  6 Sep 2023 22:08:27 +0530
Message-Id: <20230906163844.18754-3-nj.shetty@samsung.com>
In-Reply-To: <20230906163844.18754-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTZxTnu/f2clG7XF7hs3uAXcgGDGjHww+USaKOa9wIYMw2t9AVei2s
 T/sQNIxVAWWNPARZsMrDwcaACYMp4WEN1DAURgh0PJdSXWBuI4KPBecYupbC5n+/c87v/M75
 nS8fhXs9JnlUplLHapRiOZ/cRHTcCAoKtVz7SyIYuh+OWgd/wNHJ0lUcNdtKSLRw4yFAc72n
 ATIvXuCg6d4uDDU292OozDIB0Py4CUPmmRB06VQ9ga6ZbxHI2n2RRDVfz7ujhoGnGJoqnQeo
 Y6UGRy0LSwS6OfMiGlkd4MT7MiOzbQRjHdYz7U2fk8z39Z8xPdMGkqkrLucwRXmLJPNgfoZg
 lq6Pk0zxlSbAPGp/hWmfu4clbTkk25nBiiWsJoBVpqskmUppHH//AdFuUVS0QBgqjEHb+QFK
 sYKN4+95Jyn07Uy5wys/4KhYrnekksRaLT/8rZ0alV7HBmSotLo4PquWyNWR6jCtWKHVK6Vh
 SlYXKxQI3oxyED+WZcxUGznqqh3Zww2ThAEYBEbgQUE6EpaNznKMYBPlRfcAaH0w4+4KHgK4
 PLuIuYJlAPP6VsiNlif5lYSrYAaw/+4ocAUFGKz7rdzRT1EkHQKHnlHOvA9twOF3PXVrJJxu
 weD5+jHcKeVNfwQn7FbMiQk6EH7Rdp1wYi4dC6c7R0mnEKTDYYnd05n2oHfAkyecw5wUT3jr
 /NwaHaf9Yd7VC7hTH9KnPeByxSjhWnUP/Md2BnNhb/jHwBV3F+bBR4vmdTtZsPHcN6SrOR9A
 06QJuAq7YMFgCe5cAqeDYGt3uCv9MqwYbMFcg1+ARStz6/pc2Fm9gV+F37bWrutvhROPT6xj
 BlbbreunKwbwnPEJVgoCTM8ZMj1nyPT/6FqAN4GtrFqrkLLaKLVQyWb9987pKkU7WPsBwfs6
 ge32/TALwChgAZDC+T7cRf9liRdXIj52nNWoRBq9nNVaQJTj4Gdxnm+6yvGFlDqRMDJGEBkd
 HR0ZExEt5PtxFwqqJF60VKxjZSyrZjUbfRjlwTNgh98Vzat8j1UekmEVg4G5/bSsSbF3mCME
 mpQvIyb0hYWJ237Nk2SHRI1bYopkOXX5xtsNV9OqhtwPphzOfMm2TVEf32VN8U2nujjeW0aq
 LglyjYacLJxnp+y1upybabGfKrJFCf5f+fxYOjq1mQ7mPUV7OuuDP/zJ55f81Ht+vbsKG45Q
 vtxcqdmzuSWrvPqom1tq8tj2pdSO7jcuX/wgosz4nt32t9vUJ3HDlw/mtM1KN999NglEebuP
 dwR2+r1v645f3ZeEEpM99rqn/nm270DQ/p8TquW/L6Dc5OWSxD4yLMG7pPK1I68ry8daGsnU
 tO6aO3Xw1EBo1pn+O9y5rhU+oc0QC4NxjVb8Lx0ugRSKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsWy7bCSvK7Ymh8pBq8WG1qsP3WM2aJpwl9m
 i9V3+9ksXh/+xGjx5EA7o8Xed7NZLW4e2MlksXL1USaLSYeuMVo8vTqLyWLvLW2LhW1LWCz2
 7D3JYnF51xw2i/nLnrJbLD/+j8nixoSnjBbbfs9ntlj3+j2LxYlb0hbn/x5ndRD1OH9vI4vH
 5bOlHptWdbJ5bF5S77H7ZgObx+K+yawevc3v2Dw+Pr3F4vF+31U2j74tqxg9Pm+S89j05C1T
 AE8Ul01Kak5mWWqRvl0CV8ateV2sBXOtK84uv87SwNhg0MXIySEhYCLxs2UGSxcjF4eQwG5G
 iQXNu5ggEpISy/4eYYawhSVW/nvODlHUzCSxrr8VyOHgYBPQljj9nwMkLiLQxSzRufMd2CRm
 gR1MEs//t7GDdAsLREns7mphBLFZBFQlpm3cxwJi8wpYSdzccZENZJCEgL5E/31BkDCngLVE
 U+NFsHIhoJI7q14zQpQLSpyc+QSslVlAXqJ562zmCYwCs5CkZiFJLWBkWsUomVpQnJuem2xY
 YJiXWq5XnJhbXJqXrpecn7uJERyhWho7GO/N/6d3iJGJg/EQowQHs5II7zv5bylCvCmJlVWp
 RfnxRaU5qcWHGKU5WJTEeQ1nzE4REkhPLEnNTk0tSC2CyTJxcEo1MHX75zXuWc3Hl/vha4jV
 JN43z/Vllidf6OI+F/cntWrz7LY9Z44o3GMU2WGwPPYy0/GWPfUrOjzUNxoEzc+L+sVv8c35
 rfeaO0Hv59+N1Zt7ZOf5HbJLb3+9EbT8VNLLwLbTqz36dxy7v61WXU4vZ7734zt8CVNUl9yy
 PS/ad/SgssKcntOs7q932N0SqI4MUlryimn9hlcCx+YHZ+oveGSdKflq4vmntR5TC64nL7FN
 1CoJnZOxvefR/xlfAlvXRsb0TWD6/VvP+etltT+fdtU/O7VGy0iKpZrfuGn6sdbs98EWszZs
 CmeOvqp6z66mZYevqUJ88ruJG18p9ykWqV4+wWDwzaujxIv7fUtz51klluKMREMt5qLiRAAs
 M9dqPwMAAA==
X-CMS-MailID: 20230906164303epcas5p1c2d3ec21feac347f0f1d68adc97c61f5
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230906164303epcas5p1c2d3ec21feac347f0f1d68adc97c61f5
References: <20230906163844.18754-1-nj.shetty@samsung.com>
 <CGME20230906164303epcas5p1c2d3ec21feac347f0f1d68adc97c61f5@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [PATCH v15 02/12] Add infrastructure for copy offload in
 block and request layer.
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
Cc: martin.petersen@oracle.com, linux-doc@vger.kernel.org, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org, mcgrof@kernel.org,
 linux-fsdevel@vger.kernel.org, Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add two new opcode REQ_OP_COPY_SRC, REQ_OP_COPY_DST.
Since copy is a composite operation involving src and dst sectors/lba,
each needs to be represented by a separate bio to make it compatible
with device mapper.
We expect caller to take a plug and send bio with source information,
followed by bio with destination information.
Once the src bio arrives we form a request and wait for destination
bio. Upon arrival of destination we merge these two bio's and send
corresponding request down to device driver.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 block/blk-core.c          |  7 +++++++
 block/blk-merge.c         | 41 +++++++++++++++++++++++++++++++++++++++
 block/blk.h               | 16 +++++++++++++++
 block/elevator.h          |  1 +
 include/linux/bio.h       |  6 +-----
 include/linux/blk_types.h | 10 ++++++++++
 6 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 9d51e9894ece..33aadafdb7f9 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -121,6 +121,8 @@ static const char *const blk_op_name[] = {
 	REQ_OP_NAME(ZONE_FINISH),
 	REQ_OP_NAME(ZONE_APPEND),
 	REQ_OP_NAME(WRITE_ZEROES),
+	REQ_OP_NAME(COPY_SRC),
+	REQ_OP_NAME(COPY_DST),
 	REQ_OP_NAME(DRV_IN),
 	REQ_OP_NAME(DRV_OUT),
 };
@@ -792,6 +794,11 @@ void submit_bio_noacct(struct bio *bio)
 		if (!q->limits.max_write_zeroes_sectors)
 			goto not_supported;
 		break;
+	case REQ_OP_COPY_SRC:
+	case REQ_OP_COPY_DST:
+		if (!q->limits.max_copy_sectors)
+			goto not_supported;
+		break;
 	default:
 		break;
 	}
diff --git a/block/blk-merge.c b/block/blk-merge.c
index 65e75efa9bd3..bcb55ba48107 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -158,6 +158,20 @@ static struct bio *bio_split_write_zeroes(struct bio *bio,
 	return bio_split(bio, lim->max_write_zeroes_sectors, GFP_NOIO, bs);
 }
 
+static struct bio *bio_split_copy(struct bio *bio,
+				  const struct queue_limits *lim,
+				  unsigned int *nsegs)
+{
+	*nsegs = 1;
+	if (bio_sectors(bio) <= lim->max_copy_sectors)
+		return NULL;
+	/*
+	 * We don't support splitting for a copy bio. End it with EIO if
+	 * splitting is required and return an error pointer.
+	 */
+	return ERR_PTR(-EIO);
+}
+
 /*
  * Return the maximum number of sectors from the start of a bio that may be
  * submitted as a single request to a block device. If enough sectors remain,
@@ -366,6 +380,12 @@ struct bio *__bio_split_to_limits(struct bio *bio,
 	case REQ_OP_WRITE_ZEROES:
 		split = bio_split_write_zeroes(bio, lim, nr_segs, bs);
 		break;
+	case REQ_OP_COPY_SRC:
+	case REQ_OP_COPY_DST:
+		split = bio_split_copy(bio, lim, nr_segs);
+		if (IS_ERR(split))
+			return NULL;
+		break;
 	default:
 		split = bio_split_rw(bio, lim, nr_segs, bs,
 				get_max_io_size(bio, lim) << SECTOR_SHIFT);
@@ -922,6 +942,9 @@ bool blk_rq_merge_ok(struct request *rq, struct bio *bio)
 	if (!rq_mergeable(rq) || !bio_mergeable(bio))
 		return false;
 
+	if (blk_copy_offload_mergable(rq, bio))
+		return true;
+
 	if (req_op(rq) != bio_op(bio))
 		return false;
 
@@ -951,6 +974,8 @@ enum elv_merge blk_try_merge(struct request *rq, struct bio *bio)
 {
 	if (blk_discard_mergable(rq))
 		return ELEVATOR_DISCARD_MERGE;
+	else if (blk_copy_offload_mergable(rq, bio))
+		return ELEVATOR_COPY_OFFLOAD_MERGE;
 	else if (blk_rq_pos(rq) + blk_rq_sectors(rq) == bio->bi_iter.bi_sector)
 		return ELEVATOR_BACK_MERGE;
 	else if (blk_rq_pos(rq) - bio_sectors(bio) == bio->bi_iter.bi_sector)
@@ -1053,6 +1078,20 @@ static enum bio_merge_status bio_attempt_discard_merge(struct request_queue *q,
 	return BIO_MERGE_FAILED;
 }
 
+static enum bio_merge_status bio_attempt_copy_offload_merge(struct request *req,
+							    struct bio *bio)
+{
+	if (req->__data_len != bio->bi_iter.bi_size)
+		return BIO_MERGE_FAILED;
+
+	req->biotail->bi_next = bio;
+	req->biotail = bio;
+	req->nr_phys_segments++;
+	req->__data_len += bio->bi_iter.bi_size;
+
+	return BIO_MERGE_OK;
+}
+
 static enum bio_merge_status blk_attempt_bio_merge(struct request_queue *q,
 						   struct request *rq,
 						   struct bio *bio,
@@ -1073,6 +1112,8 @@ static enum bio_merge_status blk_attempt_bio_merge(struct request_queue *q,
 		break;
 	case ELEVATOR_DISCARD_MERGE:
 		return bio_attempt_discard_merge(q, rq, bio);
+	case ELEVATOR_COPY_OFFLOAD_MERGE:
+		return bio_attempt_copy_offload_merge(rq, bio);
 	default:
 		return BIO_MERGE_NONE;
 	}
diff --git a/block/blk.h b/block/blk.h
index 08a358bc0919..b0c17ad635a5 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -159,6 +159,20 @@ static inline bool blk_discard_mergable(struct request *req)
 	return false;
 }
 
+/*
+ * Copy offload sends a pair of bio with REQ_OP_COPY_SRC and REQ_OP_COPY_DST
+ * operation by taking a plug.
+ * Initially SRC bio is sent which forms a request and
+ * waits for DST bio to arrive. Once DST bio arrives
+ * we merge it and send request down to driver.
+ */
+static inline bool blk_copy_offload_mergable(struct request *req,
+					     struct bio *bio)
+{
+	return (req_op(req) == REQ_OP_COPY_SRC &&
+		bio_op(bio) == REQ_OP_COPY_DST);
+}
+
 static inline unsigned int blk_rq_get_max_segments(struct request *rq)
 {
 	if (req_op(rq) == REQ_OP_DISCARD)
@@ -300,6 +314,8 @@ static inline bool bio_may_exceed_limits(struct bio *bio,
 	case REQ_OP_DISCARD:
 	case REQ_OP_SECURE_ERASE:
 	case REQ_OP_WRITE_ZEROES:
+	case REQ_OP_COPY_SRC:
+	case REQ_OP_COPY_DST:
 		return true; /* non-trivial splitting decisions */
 	default:
 		break;
diff --git a/block/elevator.h b/block/elevator.h
index 7ca3d7b6ed82..eec442bbf384 100644
--- a/block/elevator.h
+++ b/block/elevator.h
@@ -18,6 +18,7 @@ enum elv_merge {
 	ELEVATOR_FRONT_MERGE	= 1,
 	ELEVATOR_BACK_MERGE	= 2,
 	ELEVATOR_DISCARD_MERGE	= 3,
+	ELEVATOR_COPY_OFFLOAD_MERGE	= 4,
 };
 
 struct blk_mq_alloc_data;
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 41d417ee1349..ed746738755a 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -53,11 +53,7 @@ static inline unsigned int bio_max_segs(unsigned int nr_segs)
  */
 static inline bool bio_has_data(struct bio *bio)
 {
-	if (bio &&
-	    bio->bi_iter.bi_size &&
-	    bio_op(bio) != REQ_OP_DISCARD &&
-	    bio_op(bio) != REQ_OP_SECURE_ERASE &&
-	    bio_op(bio) != REQ_OP_WRITE_ZEROES)
+	if (bio && (bio_op(bio) == REQ_OP_READ || bio_op(bio) == REQ_OP_WRITE))
 		return true;
 
 	return false;
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index d5c5e59ddbd2..78624e8f4ab4 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -393,6 +393,10 @@ enum req_op {
 	/* reset all the zone present on the device */
 	REQ_OP_ZONE_RESET_ALL	= (__force blk_opf_t)17,
 
+	/* copy offload dst and src operation */
+	REQ_OP_COPY_SRC		= (__force blk_opf_t)19,
+	REQ_OP_COPY_DST		= (__force blk_opf_t)21,
+
 	/* Driver private requests */
 	REQ_OP_DRV_IN		= (__force blk_opf_t)34,
 	REQ_OP_DRV_OUT		= (__force blk_opf_t)35,
@@ -481,6 +485,12 @@ static inline bool op_is_write(blk_opf_t op)
 	return !!(op & (__force blk_opf_t)1);
 }
 
+static inline bool op_is_copy(blk_opf_t op)
+{
+	return ((op & REQ_OP_MASK) == REQ_OP_COPY_SRC ||
+		(op & REQ_OP_MASK) == REQ_OP_COPY_DST);
+}
+
 /*
  * Check if the bio or request is one that needs special treatment in the
  * flush state machine.
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

