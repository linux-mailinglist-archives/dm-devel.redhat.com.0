Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76444667858
	for <lists+dm-devel@lfdr.de>; Thu, 12 Jan 2023 15:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673535511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l1OGz7mex7y93rT8fDr7Ol3u1Y+6oBmcSmI1us2O5aY=;
	b=VN43kR4+vnQuTCmDdJ2c+6uFrSIJoVOLy5oMvfok01SDZry7DaO26otsWxIHQ7U3n3VTW2
	YQSzTZnzsu1CkkxYa6K4xfwHoAcusWXFC9g8vSPSRHiYHXIseeIUgUU08Q4uXKT3PcvCY1
	T8exiZtyjrIwK/VYa/w39ywmifnwc5g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-0imGegM9PeKZpr6JPNGyXA-1; Thu, 12 Jan 2023 09:58:28 -0500
X-MC-Unique: 0imGegM9PeKZpr6JPNGyXA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FE6E811E9C;
	Thu, 12 Jan 2023 14:58:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED93D492B00;
	Thu, 12 Jan 2023 14:58:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A1A661947075;
	Thu, 12 Jan 2023 14:58:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0A7731946A78
 for <dm-devel@listman.corp.redhat.com>; Thu, 12 Jan 2023 13:37:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E2A82140006B; Thu, 12 Jan 2023 13:37:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9A49140EBF6
 for <dm-devel@redhat.com>; Thu, 12 Jan 2023 13:37:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2B6F29DD99D
 for <dm-devel@redhat.com>; Thu, 12 Jan 2023 13:37:15 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-sj2-BiRGN4qoZ5C2ST2weg-1; Thu, 12 Jan 2023 08:37:14 -0500
X-MC-Unique: sj2-BiRGN4qoZ5C2ST2weg-1
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230112133711epoutp03edb12e7de9fef6ec4bca99254ab3a24d~5kz4LHQFO1387213872epoutp03f
 for <dm-devel@redhat.com>; Thu, 12 Jan 2023 13:37:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230112133711epoutp03edb12e7de9fef6ec4bca99254ab3a24d~5kz4LHQFO1387213872epoutp03f
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20230112133710epcas5p257f267d68794389c2d1b01423de7ba15~5kz3U20ol2066520665epcas5p2K;
 Thu, 12 Jan 2023 13:37:10 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Nt5FJ4fmpz4x9Pw; Thu, 12 Jan
 2023 13:37:08 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4D.6D.62806.40D00C36; Thu, 12 Jan 2023 22:37:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20230112120039epcas5p49ccf70d806c530c8228130cc25737b51~5jflyKk9_2230422304epcas5p4n;
 Thu, 12 Jan 2023 12:00:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230112120039epsmtrp2be8ddd51c8a1847c41530819b85679b1~5jflxLbWW3008130081epsmtrp2I;
 Thu, 12 Jan 2023 12:00:39 +0000 (GMT)
X-AuditID: b6c32a4a-c43ff7000000f556-b1-63c00d042cbb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8B.A5.02211.666FFB36; Thu, 12 Jan 2023 21:00:38 +0900 (KST)
Received: from green5.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230112120036epsmtip221869583c809c8cf44bce7fffa4a1ac7~5jfjHqcvT0888908889epsmtip2a;
 Thu, 12 Jan 2023 12:00:36 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@kernel.org>, dm-devel@redhat.com, Keith Busch
 <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, Chaitanya
 Kulkarni <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>
Date: Thu, 12 Jan 2023 17:28:56 +0530
Message-Id: <20230112115908.23662-3-nj.shetty@samsung.com>
In-Reply-To: <20230112115908.23662-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1ATVxjl7obNQhtZEcYLtkoXmQ44QKIhXagIHVF3aqdDR35oK4ZtWIGS
 bDJ5iHVKQR4jYhVpwRmDvBzwAUhaJEx4pEJaykMpg4g2KEVamE61iVQY1FJKExJa/53v3PM9
 znfvxVFfOxaIZ3BaVs0xchLz5rV9FxoWzhN0y4SmX96gDIM/oFTe2SWUapwowSizvcKTsna3
 I9TVxl6E6qz9E6F6l20Y9aXlLqBmxvQIZR7fQnWZB3jUaMcFjKq+NMOnTNPHAdW2WI1Sc/UF
 fKr58RMe1T++gRpe6vOM96P1k0MY3a6f4NPDP3/Do0eHdHRLw0mMvl6XQ3daczH6dL4do598
 O4bRZ1obAD3XspFumbYhia9+mLk9nWVSWXUQy8mUqRlcWiy5d590pzRKIhSFi6Kpt8ggjlGw
 sWTCe4nhuzPkDptk0BFGrnNQiYxGQ0bu2K5W6rRsULpSo40lWVWqXCVWRWgYhUbHpUVwrDZG
 JBRujXIIUzLTi3ouIqr6nKP3TswiucCQVgy8cEiIYdFiPVIMvHFfohPAAvOiO3jqCJ4/cgcL
 APYVl4DVlJHvyzEn9iXMAN434S5RPgJv1S3xiwGOY8QWeHMZd2r8iAcIbL8Z7NSgRAUC+21T
 ns6DdcRuaL1YuYJ5RAhc+rqd58QCIgaWD9hW6kAiEpZMrnXSXsTbsOmnebdkLRw4P72CUWIT
 zDdWoM76kFjG4bmRBZ5r0ARYf+oF5sLr4KO+Vr4LB8I5u9nNZ8GrZVcwV3IBgPp7erfLOFg4
 WII6h0CJUGjoiHTRr8PywWbE1XgNPL04jbh4ATRVreJg2GSocdcPgHefHcdcXmjYWMlz7e0M
 gPbbkWdBkP4lO/qX7Oj/b1wD0AYQwKo0ijRWE6XayrFZ/92xTKloASsPP+xdE5h6OBthAQgO
 LADiKOkn6Oq9IfMVpDKfHmPVSqlaJ2c1FhDlWHcpGugvUzp+DqeVisTRQrFEIhFHb5OIyPUC
 1lgt8yXSGC2bybIqVr2ah+BegblI8sdC2V+Gg2teKMZtO1lL9vyujXHoH4Pcjtpr8WNteerS
 GOK1yMoDaEi4T9+GPac+vzxfWLWnUD6x+dD6kQdZfzfXvfIjqZduHs1p7Q7t7/JqFHeGDGT5
 T4WlxNtPlvVwhw4myj3Un5w4Pz9269dJy+Fj244mBCyilvHk0ejDvXE+s8klVv1n089tdzJN
 fU+l7VU3ZiT9nudymSveHrXNeffTjyR1CD00vwXX5HLDPtk1zwKl4xnDb6qsQ7ebeu4o/vG6
 3ORfl2J+32o8kMS/vilbV1bqIXlH1GYILbs2FGFMapqAvxttXyUzwoWH+79ofWwENR/tz8xr
 DPigt6IobF/5JZKnSWdEYahaw/wLQJ7G44EEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSvG7at/3JBg9umFusP3WM2aJpwl9m
 i9V3+9ks9r6bzWpx88BOJouVq48yWexe+JHJ4uj/t2wWkw5dY7R4enUWk8XeW9oWe/aeZLG4
 vGsOm8X8ZU/ZLXY8aWS02PZ7PrPF56Ut7BbrXr9nsThxS9ri/N/jrA4iHrPun2Xz2DnrLrvH
 +XsbWTwuny312LSqk81j85J6j903G9g8epvfsXm833eVzaNvyypGj8+b5Dw2PXnLFMATxWWT
 kpqTWZZapG+XwJXRcXARU8HS+orr7R+YGhjXp3cxcnJICJhIXDwyla2LkYtDSGA3o0Rrx35W
 iISkxLK/R5ghbGGJlf+es0MUNTJJzH2wg6WLkYODTUBb4vR/DpC4iMAzJomz9x4xgzjMAkuZ
 JBbsawSbJCzgJnFz0Vwwm0VAVeLvhp0sIDavgJXE1JNv2UEGSQjoS/TfFwQJcwpYS6y58QWs
 RAioZNaeq0wQ5YISJ2c+AYszC8hLNG+dzTyBUWAWktQsJKkFjEyrGCVTC4pz03OLDQsM81LL
 9YoTc4tL89L1kvNzNzGC41JLcwfj9lUf9A4xMnEwHmKU4GBWEuHdc3R/shBvSmJlVWpRfnxR
 aU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1Met+mtAmsFVNYvbSCaYKWtMyd
 uXM5lRqrf9s1Bznxz/QpEf8e5q6u8pPvnaWvCK8tk44hP08lS6nF2pprQes1N5SnF1Xncv97
 KCAfVyzt6ywiccKmQqnQ89fpKzyqu6Nfmq+6+DL66teYc1abXnq4d/yftHX566Ztq+LWJb+5
 IrOSY0/p874srqV7cgXvnYkTP6v40Dt8xr5gS94zue2M9YmH/t7bq7ZlM+/Kt9+cGt48/vey
 aX5V9JQz3boLmv+dXSWWx/AlzsV5ovX6c9me9murpFR+CZtd/yt5kGnvOv+YqWtiVt41eLri
 u3it6yTPuEvvbfpN+lWFxdi/L5701lPE8eEU0Q7vw62TIruUWIozEg21mIuKEwECdCPAOgMA
 AA==
X-CMS-MailID: 20230112120039epcas5p49ccf70d806c530c8228130cc25737b51
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230112120039epcas5p49ccf70d806c530c8228130cc25737b51
References: <20230112115908.23662-1-nj.shetty@samsung.com>
 <CGME20230112120039epcas5p49ccf70d806c530c8228130cc25737b51@epcas5p4.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 12 Jan 2023 14:58:20 +0000
Subject: [dm-devel] [PATCH v6 2/9] block: Add copy offload support
 infrastructure
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce blkdev_issue_copy which supports source and destination bdevs,
and an array of (source, destination and copy length) tuples.
Introduce REQ_COPY copy offload operation flag. Create a read-write
bio pair with a token as payload and submitted to the device in order.
Read request populates token with source specific information which
is then passed with write request.
This design is courtesy Mikulas Patocka's token based copy

Larger copy will be divided, based on max_copy_sectors limit.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 block/blk-lib.c           | 358 ++++++++++++++++++++++++++++++++++++++
 block/blk.h               |   2 +
 include/linux/blk_types.h |  44 +++++
 include/linux/blkdev.h    |   3 +
 include/uapi/linux/fs.h   |  15 ++
 5 files changed, 422 insertions(+)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index e59c3069e835..2ce3c872ca49 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -115,6 +115,364 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 }
 EXPORT_SYMBOL(blkdev_issue_discard);
 
+/*
+ * For synchronous copy offload/emulation, wait and process all in-flight BIOs.
+ * This must only be called once all bios have been issued so that the refcount
+ * can only decrease. This just waits for all bios to make it through
+ * bio_copy_*_write_end_io. IO errors are propagated through cio->io_error.
+ */
+static int cio_await_completion(struct cio *cio)
+{
+	int ret = 0;
+
+	atomic_dec(&cio->refcount);
+
+	if (cio->endio)
+		return 0;
+
+	if (atomic_read(&cio->refcount)) {
+		__set_current_state(TASK_UNINTERRUPTIBLE);
+		blk_io_schedule();
+	}
+
+	ret = cio->io_err;
+	kfree(cio);
+
+	return ret;
+}
+
+static void blk_copy_offload_write_end_io(struct bio *bio)
+{
+	struct copy_ctx *ctx = bio->bi_private;
+	struct cio *cio = ctx->cio;
+	sector_t clen;
+	int ri = ctx->range_idx;
+
+	if (bio->bi_status) {
+		cio->io_err = blk_status_to_errno(bio->bi_status);
+		clen = (bio->bi_iter.bi_sector << SECTOR_SHIFT) -
+			cio->ranges[ri].dst;
+		cio->ranges[ri].comp_len = min_t(sector_t, clen,
+				cio->ranges[ri].comp_len);
+	}
+	__free_page(bio->bi_io_vec[0].bv_page);
+	bio_put(bio);
+
+	if (atomic_dec_and_test(&ctx->refcount))
+		kfree(ctx);
+	if (atomic_dec_and_test(&cio->refcount)) {
+		if (cio->endio) {
+			cio->endio(cio->private, cio->io_err);
+			kfree(cio);
+		} else
+			blk_wake_io_task(cio->waiter);
+	}
+}
+
+static void blk_copy_offload_read_end_io(struct bio *read_bio)
+{
+	struct copy_ctx *ctx = read_bio->bi_private;
+	struct cio *cio = ctx->cio;
+	sector_t clen;
+	int ri = ctx->range_idx;
+	unsigned long flags;
+
+	if (read_bio->bi_status) {
+		cio->io_err = blk_status_to_errno(read_bio->bi_status);
+		goto err_rw_bio;
+	}
+
+	/* For zoned device, we check if completed bio is first entry in linked
+	 * list,
+	 * if yes, we start the worker to submit write bios.
+	 * if not, then we just update status of bio in ctx,
+	 * once the worker gets scheduled, it will submit writes for all
+	 * the consecutive REQ_COPY_READ_COMPLETE bios.
+	 */
+	if (bdev_is_zoned(ctx->write_bio->bi_bdev)) {
+		spin_lock_irqsave(&cio->list_lock, flags);
+		ctx->status = REQ_COPY_READ_COMPLETE;
+		if (ctx == list_first_entry(&cio->list,
+					struct copy_ctx, list)) {
+			spin_unlock_irqrestore(&cio->list_lock, flags);
+			schedule_work(&ctx->dispatch_work);
+			goto free_read_bio;
+		}
+		spin_unlock_irqrestore(&cio->list_lock, flags);
+	} else
+		schedule_work(&ctx->dispatch_work);
+
+free_read_bio:
+	bio_put(read_bio);
+
+	return;
+
+err_rw_bio:
+	clen = (read_bio->bi_iter.bi_sector << SECTOR_SHIFT) -
+					cio->ranges[ri].src;
+	cio->ranges[ri].comp_len = min_t(sector_t, clen,
+					cio->ranges[ri].comp_len);
+	__free_page(read_bio->bi_io_vec[0].bv_page);
+	bio_put(ctx->write_bio);
+	bio_put(read_bio);
+	if (atomic_dec_and_test(&ctx->refcount))
+		kfree(ctx);
+	if (atomic_dec_and_test(&cio->refcount)) {
+		if (cio->endio) {
+			cio->endio(cio->private, cio->io_err);
+			kfree(cio);
+		} else
+			blk_wake_io_task(cio->waiter);
+	}
+}
+
+static void blk_copy_dispatch_work_fn(struct work_struct *work)
+{
+	struct copy_ctx *ctx = container_of(work, struct copy_ctx,
+			dispatch_work);
+
+	submit_bio(ctx->write_bio);
+}
+
+static void blk_zoned_copy_dispatch_work_fn(struct work_struct *work)
+{
+	struct copy_ctx *ctx = container_of(work, struct copy_ctx,
+			dispatch_work);
+	struct cio *cio = ctx->cio;
+	unsigned long flags = 0;
+
+	atomic_inc(&cio->refcount);
+	spin_lock_irqsave(&cio->list_lock, flags);
+
+	while (!list_empty(&cio->list)) {
+		ctx = list_first_entry(&cio->list, struct copy_ctx, list);
+
+		if (ctx->status == REQ_COPY_READ_PROGRESS)
+			break;
+
+		atomic_inc(&ctx->refcount);
+		ctx->status = REQ_COPY_WRITE_PROGRESS;
+		spin_unlock_irqrestore(&cio->list_lock, flags);
+		submit_bio(ctx->write_bio);
+		spin_lock_irqsave(&cio->list_lock, flags);
+
+		list_del(&ctx->list);
+		if (atomic_dec_and_test(&ctx->refcount))
+			kfree(ctx);
+	}
+
+	spin_unlock_irqrestore(&cio->list_lock, flags);
+	if (atomic_dec_and_test(&cio->refcount))
+		blk_wake_io_task(cio->waiter);
+}
+
+/*
+ * blk_copy_offload	- Use device's native copy offload feature.
+ * we perform copy operation by sending 2 bio.
+ * 1. First we send a read bio with REQ_COPY flag along with a token and source
+ * and length. Once read bio reaches driver layer, device driver adds all the
+ * source info to token and does a fake completion.
+ * 2. Once read opration completes, we issue write with REQ_COPY flag with same
+ * token. In driver layer, token info is used to form a copy offload command.
+ *
+ * For conventional devices we submit write bio independentenly once read
+ * completes. For zoned devices , reads can complete out of order, so we
+ * maintain a linked list and submit writes in the order, reads are submitted.
+ */
+static int blk_copy_offload(struct block_device *src_bdev,
+		struct block_device *dst_bdev, struct range_entry *ranges,
+		int nr, cio_iodone_t end_io, void *private, gfp_t gfp_mask)
+{
+	struct cio *cio;
+	struct copy_ctx *ctx;
+	struct bio *read_bio, *write_bio;
+	struct page *token;
+	sector_t src_blk, copy_len, dst_blk;
+	sector_t rem, max_copy_len;
+	int ri = 0, ret = 0;
+	unsigned long flags;
+
+	cio = kzalloc(sizeof(struct cio), GFP_KERNEL);
+	if (!cio)
+		return -ENOMEM;
+	cio->ranges = ranges;
+	atomic_set(&cio->refcount, 1);
+	cio->waiter = current;
+	cio->endio = end_io;
+	cio->private = private;
+	if (bdev_is_zoned(dst_bdev)) {
+		INIT_LIST_HEAD(&cio->list);
+		spin_lock_init(&cio->list_lock);
+	}
+
+	max_copy_len = min(bdev_max_copy_sectors(src_bdev),
+			bdev_max_copy_sectors(dst_bdev)) << SECTOR_SHIFT;
+
+	for (ri = 0; ri < nr; ri++) {
+		cio->ranges[ri].comp_len = ranges[ri].len;
+		src_blk = ranges[ri].src;
+		dst_blk = ranges[ri].dst;
+		for (rem = ranges[ri].len; rem > 0; rem -= copy_len) {
+			copy_len = min(rem, max_copy_len);
+
+			token = alloc_page(gfp_mask);
+			if (unlikely(!token)) {
+				ret = -ENOMEM;
+				goto err_token;
+			}
+
+			ctx = kzalloc(sizeof(struct copy_ctx), gfp_mask);
+			if (!ctx) {
+				ret = -ENOMEM;
+				goto err_ctx;
+			}
+			read_bio = bio_alloc(src_bdev, 1, REQ_OP_READ | REQ_COPY
+					| REQ_SYNC | REQ_NOMERGE, gfp_mask);
+			if (!read_bio) {
+				ret = -ENOMEM;
+				goto err_read_bio;
+			}
+			write_bio = bio_alloc(dst_bdev, 1, REQ_OP_WRITE
+					| REQ_COPY | REQ_SYNC | REQ_NOMERGE,
+					gfp_mask);
+			if (!write_bio) {
+				cio->io_err = -ENOMEM;
+				goto err_write_bio;
+			}
+
+			ctx->cio = cio;
+			ctx->range_idx = ri;
+			ctx->write_bio = write_bio;
+			atomic_set(&ctx->refcount, 1);
+
+			if (bdev_is_zoned(dst_bdev)) {
+				INIT_WORK(&ctx->dispatch_work,
+					blk_zoned_copy_dispatch_work_fn);
+				INIT_LIST_HEAD(&ctx->list);
+				spin_lock_irqsave(&cio->list_lock, flags);
+				ctx->status = REQ_COPY_READ_PROGRESS;
+				list_add_tail(&ctx->list, &cio->list);
+				spin_unlock_irqrestore(&cio->list_lock, flags);
+			} else
+				INIT_WORK(&ctx->dispatch_work,
+					blk_copy_dispatch_work_fn);
+
+			__bio_add_page(read_bio, token, PAGE_SIZE, 0);
+			read_bio->bi_iter.bi_size = copy_len;
+			read_bio->bi_iter.bi_sector = src_blk >> SECTOR_SHIFT;
+			read_bio->bi_end_io = blk_copy_offload_read_end_io;
+			read_bio->bi_private = ctx;
+
+			__bio_add_page(write_bio, token, PAGE_SIZE, 0);
+			write_bio->bi_iter.bi_size = copy_len;
+			write_bio->bi_end_io = blk_copy_offload_write_end_io;
+			write_bio->bi_iter.bi_sector = dst_blk >> SECTOR_SHIFT;
+			write_bio->bi_private = ctx;
+
+			atomic_inc(&cio->refcount);
+			submit_bio(read_bio);
+			src_blk += copy_len;
+			dst_blk += copy_len;
+		}
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
+	__free_page(token);
+err_token:
+	ranges[ri].comp_len = min_t(sector_t,
+			ranges[ri].comp_len, (ranges[ri].len - rem));
+
+	cio->io_err = ret;
+	return cio_await_completion(cio);
+}
+
+static inline int blk_copy_sanity_check(struct block_device *src_bdev,
+	struct block_device *dst_bdev, struct range_entry *ranges, int nr)
+{
+	unsigned int align_mask = max(bdev_logical_block_size(dst_bdev),
+					bdev_logical_block_size(src_bdev)) - 1;
+	sector_t len = 0;
+	int i;
+
+	if (!nr)
+		return -EINVAL;
+
+	if (nr >= MAX_COPY_NR_RANGE)
+		return -EINVAL;
+
+	if (bdev_read_only(dst_bdev))
+		return -EPERM;
+
+	for (i = 0; i < nr; i++) {
+		if (!ranges[i].len)
+			return -EINVAL;
+
+		len += ranges[i].len;
+		if ((ranges[i].dst & align_mask) ||
+				(ranges[i].src & align_mask) ||
+				(ranges[i].len & align_mask))
+			return -EINVAL;
+		ranges[i].comp_len = 0;
+	}
+
+	if (len && len >= MAX_COPY_TOTAL_LENGTH)
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline bool blk_check_copy_offload(struct request_queue *src_q,
+		struct request_queue *dst_q)
+{
+	return blk_queue_copy(dst_q) && blk_queue_copy(src_q);
+}
+
+/*
+ * blkdev_issue_copy - queue a copy
+ * @src_bdev:	source block device
+ * @dst_bdev:	destination block device
+ * @ranges:	array of source/dest/len,
+ *		ranges are expected to be allocated/freed by caller
+ * @nr:		number of source ranges to copy
+ * @end_io:	end_io function to be called on completion of copy operation,
+ *		for synchronous operation this should be NULL
+ * @private:	end_io function will be called with this private data, should be
+ *		NULL, if operation is synchronous in nature
+ * @gfp_mask:   memory allocation flags (for bio_alloc)
+ *
+ * Description:
+ *	Copy source ranges from source block device to destination block
+ *	device. length of a source range cannot be zero. Max total length of
+ *	copy is limited to MAX_COPY_TOTAL_LENGTH and also maximum number of
+ *	entries is limited to MAX_COPY_NR_RANGE
+ */
+int blkdev_issue_copy(struct block_device *src_bdev,
+	struct block_device *dst_bdev, struct range_entry *ranges, int nr,
+	cio_iodone_t end_io, void *private, gfp_t gfp_mask)
+{
+	struct request_queue *src_q = bdev_get_queue(src_bdev);
+	struct request_queue *dst_q = bdev_get_queue(dst_bdev);
+	int ret = -EINVAL;
+
+	ret = blk_copy_sanity_check(src_bdev, dst_bdev, ranges, nr);
+	if (ret)
+		return ret;
+
+	if (blk_check_copy_offload(src_q, dst_q))
+		ret = blk_copy_offload(src_bdev, dst_bdev, ranges, nr,
+				end_io, private, gfp_mask);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(blkdev_issue_copy);
+
 static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
 		struct bio **biop, unsigned flags)
diff --git a/block/blk.h b/block/blk.h
index 4c3b3325219a..6d9924a7d559 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -304,6 +304,8 @@ static inline bool bio_may_exceed_limits(struct bio *bio,
 		break;
 	}
 
+	if (unlikely(op_is_copy(bio->bi_opf)))
+		return false;
 	/*
 	 * All drivers must accept single-segments bios that are <= PAGE_SIZE.
 	 * This is a quick and dirty check that relies on the fact that
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 99be590f952f..de1638c87ecf 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -422,6 +422,7 @@ enum req_flag_bits {
 	 */
 	/* for REQ_OP_WRITE_ZEROES: */
 	__REQ_NOUNMAP,		/* do not free blocks when zeroing */
+	__REQ_COPY,		/* copy request */
 
 	__REQ_NR_BITS,		/* stops here */
 };
@@ -451,6 +452,7 @@ enum req_flag_bits {
 
 #define REQ_DRV		(__force blk_opf_t)(1ULL << __REQ_DRV)
 #define REQ_SWAP	(__force blk_opf_t)(1ULL << __REQ_SWAP)
+#define REQ_COPY	((__force blk_opf_t)(1ULL << __REQ_COPY))
 
 #define REQ_FAILFAST_MASK \
 	(REQ_FAILFAST_DEV | REQ_FAILFAST_TRANSPORT | REQ_FAILFAST_DRIVER)
@@ -477,6 +479,11 @@ static inline bool op_is_write(blk_opf_t op)
 	return !!(op & (__force blk_opf_t)1);
 }
 
+static inline bool op_is_copy(blk_opf_t op)
+{
+	return (op & REQ_COPY);
+}
+
 /*
  * Check if the bio or request is one that needs special treatment in the
  * flush state machine.
@@ -536,4 +543,41 @@ struct blk_rq_stat {
 	u64 batch;
 };
 
+typedef void (cio_iodone_t)(void *private, int status);
+
+struct cio {
+	struct range_entry *ranges;
+	struct task_struct *waiter;     /* waiting task (NULL if none) */
+	atomic_t refcount;
+	int io_err;
+	cio_iodone_t *endio;		/* applicable for async operation */
+	void *private;			/* applicable for async operation */
+
+	/* For zoned device we maintain a linked list of IO submissions.
+	 * This is to make sure we maintain the order of submissions.
+	 * Otherwise some reads completing out of order, will submit writes not
+	 * aligned with zone write pointer.
+	 */
+	struct list_head list;
+	spinlock_t list_lock;
+};
+
+enum copy_io_status {
+	REQ_COPY_READ_PROGRESS,
+	REQ_COPY_READ_COMPLETE,
+	REQ_COPY_WRITE_PROGRESS,
+};
+
+struct copy_ctx {
+	struct cio *cio;
+	struct work_struct dispatch_work;
+	struct bio *write_bio;
+	atomic_t refcount;
+	int range_idx;			/* used in error/partial completion */
+
+	/* For zoned device linked list is maintained. Along with state of IO */
+	struct list_head list;
+	enum copy_io_status status;
+};
+
 #endif /* __LINUX_BLK_TYPES_H */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 807ffb5f715d..48e9160b7195 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1063,6 +1063,9 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp_mask, struct bio **biop);
 int blkdev_issue_secure_erase(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp);
+int blkdev_issue_copy(struct block_device *src_bdev,
+		struct block_device *dst_bdev, struct range_entry *ranges,
+		int nr, cio_iodone_t end_io, void *private, gfp_t gfp_mask);
 
 #define BLKDEV_ZERO_NOUNMAP	(1 << 0)  /* do not free blocks */
 #define BLKDEV_ZERO_NOFALLBACK	(1 << 1)  /* don't write explicit zeroes */
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index b3ad173f619c..9248b6d259de 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -67,6 +67,21 @@ struct fstrim_range {
 /* maximum total copy length */
 #define MAX_COPY_TOTAL_LENGTH	(1 << 27)
 
+/* Maximum no of entries supported */
+#define MAX_COPY_NR_RANGE	(1 << 12)
+
+/* range entry for copy offload, all fields should be byte addressed */
+struct range_entry {
+	__u64 src;		/* source to be copied */
+	__u64 dst;		/* destination */
+	__u64 len;		/* length in bytes to be copied */
+
+	/* length of data copy actually completed. This will be filled by
+	 * kernel, once copy completes
+	 */
+	__u64 comp_len;
+};
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

