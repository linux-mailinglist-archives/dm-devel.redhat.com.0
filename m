Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D0514421
	for <lists+dm-devel@lfdr.de>; Fri, 29 Apr 2022 10:24:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-10ro9KkWOlK2iSAL5npHhw-1; Fri, 29 Apr 2022 04:23:57 -0400
X-MC-Unique: 10ro9KkWOlK2iSAL5npHhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E270C3C0FAA1;
	Fri, 29 Apr 2022 08:23:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C831840869D9;
	Fri, 29 Apr 2022 08:23:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2D6611947074;
	Fri, 29 Apr 2022 08:23:52 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0FA271947041
 for <dm-devel@listman.corp.redhat.com>; Wed, 27 Apr 2022 18:09:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F077840C1244; Wed, 27 Apr 2022 18:09:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBDFB4010A13
 for <dm-devel@redhat.com>; Wed, 27 Apr 2022 18:09:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCF44811E78
 for <dm-devel@redhat.com>; Wed, 27 Apr 2022 18:09:20 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-1g2r-OMiNPiIOaKyN-WivQ-1; Wed, 27 Apr 2022 14:09:18 -0400
X-MC-Unique: 1g2r-OMiNPiIOaKyN-WivQ-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220427180915epoutp03c544dfec5dfc79a6aec24ad414ebd1b1~p0zNWjiHE1429614296epoutp03_
 for <dm-devel@redhat.com>; Wed, 27 Apr 2022 18:09:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220427180915epoutp03c544dfec5dfc79a6aec24ad414ebd1b1~p0zNWjiHE1429614296epoutp03_
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20220427180915epcas5p3249b4f36723a41f0b5b94f2f1c9276aa~p0zNE4kv82667826678epcas5p3y;
 Wed, 27 Apr 2022 18:09:15 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4KpRbB4sQwz4x9Pr; Wed, 27 Apr
 2022 18:09:10 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B6.94.09827.6C689626; Thu, 28 Apr 2022 03:09:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20220427155356epcas5p4c96a6b254f89300d6f1943f6a8b4d1ff~py9D6ql_d1865118651epcas5p42;
 Wed, 27 Apr 2022 15:53:56 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220427155356epsmtrp1120ee3b3bf7abcd2f5be2a35d7d3a878~py9D57pZ63121031210epsmtrp1g;
 Wed, 27 Apr 2022 15:53:56 +0000 (GMT)
X-AuditID: b6c32a4a-b3bff70000002663-8e-626986c6fcf4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F9.F8.08853.41769626; Thu, 28 Apr 2022 00:53:56 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427155355epsmtip18c536e1a3da7f33b9c3849bfa5691571~py9Cqj4Hu2999929999epsmtip1T;
 Wed, 27 Apr 2022 15:53:55 +0000 (GMT)
Date: Wed, 27 Apr 2022 21:18:47 +0530
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20220427154847.GF9558@test-zns>
MIME-Version: 1.0
In-Reply-To: <2082148f-890f-e5f4-c304-b99212aa377e@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmuu6xtswkg73rlC32vpvNarFn0SQm
 i723tC327D3JYnF51xw2i/nLnrJbdF/fwWax40kjowOHx85Zd9k9Ni+p93i/7yqbx+bT1R6f
 N8kFsEZl22SkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA
 HaKkUJaYUwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTAp0CtOzC0uzUvXy0stsTI0MDAy
 BSpMyM6YdngTe8Eli4plc9wbGBfpdDFyckgImEg8uruQrYuRi0NIYDejxPamTcwQzidGibMb
 v7FAON8YJT6dOcrexcgB1vLhqilIt5DAXkaJrlnyEDXPGCW+bF/NBFLDIqAq0f/QE8RkE9CW
 OP2fA6RcREBJ4mP7IXaQcmaBM4wS7e93sYMkhAV8JJafmMYIUs8roCMxYXMQSJhXQFDi5Mwn
 LCA2p4C1xJkHaxhBbFEBZYkD244zgcyREGjlkPj5YAozxDcuEh8bpzFC2MISr45vYYewpSRe
 9rdB2eUS29sWQDW3AN1/6hQLRMJe4uKev0wgNrNAhsS1hoNMEHFZiamn1kHF+SR6fz+BivNK
 7JgHYytLrFm/gA3ClpS49r0RyvaQmLf3CTQQPzBKzFx1h20Co/wsJN/NQrIPwtaRWLD7E9ss
 YGAwC0hLLP/HAWFqSqzfpb+AkXUVo2RqQXFuemqxaYFRXmo5PLqT83M3MYJTqZbXDsaHDz7o
 HWJk4mA8xCjBwawkwvtld0aSEG9KYmVValF+fFFpTmrxIUZTYFxNZJYSTc4HJvO8knhDE0sD
 EzMzMxNLYzNDJXHe0+kbEoUE0hNLUrNTUwtSi2D6mDg4pRqYNuybznPD8ZtaT/v++Vrt8619
 Sn17RVPKMxQXGho9MHk+T/LAy7cxzUdmRxu5+5pwmx1vtPfd0bqye2LM6o2dLz6/XZdTsVT0
 ebZUzActh03Wa25s07BTv1J0cJrd9LMmu5eKy4Zsbe74y7PwIH/E1AkHFW7e0oxdLLmfK2he
 YJbSr7X5EYq/ct6Ebe286Lb06YyLNzSUj77at6xRK/zrSX/R2IQ1F1yzVau7mRqV5bqj/Pao
 KX1r6Y63ulUXuqls113toxft4q+v5DiVVfmQy/Zl1P474h8NTsfFXjL8EHWR44eO8JQHE+sW
 pzT43E+/tl/attJufarezpLktwe/ipV/fuTSbVWx7ND/UEMOJZbijERDLeai4kQAkAXpJi4E
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLLMWRmVeSWpSXmKPExsWy7bCSnK5IemaSwd6Z2hZ7381mtdizaBKT
 xd5b2hZ79p5ksbi8aw6bxfxlT9ktuq/vYLPY8aSR0YHDY+esu+wem5fUe7zfd5XNY/Ppao/P
 m+QCWKO4bFJSczLLUov07RK4Mvas6mEsmGRW0X7lDFsD42/NLkYODgkBE4kPV027GLk4hAR2
 M0qs3/WbtYuREyguKbHs7xFmCFtYYuW/5+wQRU8YJea0v2QGaWYRUJXof+gJYrIJaEuc/s8B
 Ui4ioCTxsf0QWDmzwBlGifb3u9hBEsICPhLLT0xjBKnnFdCRmLA5CGLkB0aJlZu3gNXwCghK
 nJz5hAXEZhbQkrjx7yUTSD2zgLTE8n9g8zkFrCXOPFjDCGKLCihLHNh2nGkCo+AsJN2zkHTP
 QuhewMi8ilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOAa0NHcwbl/1Qe8QIxMH4yFG
 CQ5mJRHeL7szkoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgSTZeLg
 lGpg2pojZS371VN/UuRTHcfmunWNS0Uf7NMUtE/W9nujL5+58BNTukpbc1Pav9AnlzfpvRGZ
 tHqqxfkI3YVPmern/4woO82sm2j5JLTOvfCjj9hfLvWMXVIXlyjmNdnpcX/UzVsRJTV53uTJ
 iStOxPUxmC+QmxQoHsb3oXGfaMr6ap/LIoy9Je4Jzca/o0R1E23Muvb67olVl7g2++Wv7RkF
 ksfaX36vyPLTCXnXvuhEsPVtL1tfpd175K+dPhew5tTnI1xckTL/H62ecvdasaf4nqs3T1m8
 U9CzNeD+vsdq5mXr/AX3/cyuNe/WtuFISr25Qu3EkR7pfbdnaxjy8/TfPHGNfcOO3XnaExYp
 ybgqsRRnJBpqMRcVJwIA/9D3//ACAAA=
X-CMS-MailID: 20220427155356epcas5p4c96a6b254f89300d6f1943f6a8b4d1ff
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220426101921epcas5p341707619b5e836490284a42c92762083
References: <20220426101241.30100-1-nj.shetty@samsung.com>
 <CGME20220426101921epcas5p341707619b5e836490284a42c92762083@epcas5p3.samsung.com>
 <20220426101241.30100-3-nj.shetty@samsung.com>
 <2082148f-890f-e5f4-c304-b99212aa377e@suse.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Fri, 29 Apr 2022 08:23:40 +0000
Subject: Re: [dm-devel] [PATCH v4 02/10] block: Add copy offload support
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
Cc: linux-scsi@vger.kernel.org, nitheshshetty@gmail.com,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="----B60c1XsBAYLlAvSr_Hnug5kZhc5LtmZ3tZiwVK7tFSQflFGl=_18042_"

------B60c1XsBAYLlAvSr_Hnug5kZhc5LtmZ3tZiwVK7tFSQflFGl=_18042_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 27, 2022 at 12:29:15PM +0200, Hannes Reinecke wrote:
> On 4/26/22 12:12, Nitesh Shetty wrote:
> > Introduce blkdev_issue_copy which supports source and destination bdevs,
> > and an array of (source, destination and copy length) tuples.
> > Introduce REQ_COPY copy offload operation flag. Create a read-write
> > bio pair with a token as payload and submitted to the device in order.
> > Read request populates token with source specific information which
> > is then passed with write request.
> > This design is courtesy Mikulas Patocka's token based copy
> > 
> > Larger copy will be divided, based on max_copy_sectors,
> > max_copy_range_sector limits.
> > 
> > Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
> > Signed-off-by: Arnav Dawn <arnav.dawn@samsung.com>
> > ---
> >   block/blk-lib.c           | 232 ++++++++++++++++++++++++++++++++++++++
> >   block/blk.h               |   2 +
> >   include/linux/blk_types.h |  21 ++++
> >   include/linux/blkdev.h    |   2 +
> >   include/uapi/linux/fs.h   |  14 +++
> >   5 files changed, 271 insertions(+)
> > 
> > diff --git a/block/blk-lib.c b/block/blk-lib.c
> > index 09b7e1200c0f..ba9da2d2f429 100644
> > --- a/block/blk-lib.c
> > +++ b/block/blk-lib.c
> > @@ -117,6 +117,238 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
> >   }
> >   EXPORT_SYMBOL(blkdev_issue_discard);
> > +/*
> > + * Wait on and process all in-flight BIOs.  This must only be called once
> > + * all bios have been issued so that the refcount can only decrease.
> > + * This just waits for all bios to make it through bio_copy_end_io. IO
> > + * errors are propagated through cio->io_error.
> > + */
> > +static int cio_await_completion(struct cio *cio)
> > +{
> > +	int ret = 0;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&cio->lock, flags);
> > +	if (cio->refcount) {
> > +		cio->waiter = current;
> > +		__set_current_state(TASK_UNINTERRUPTIBLE);
> > +		spin_unlock_irqrestore(&cio->lock, flags);
> > +		blk_io_schedule();
> > +		/* wake up sets us TASK_RUNNING */
> > +		spin_lock_irqsave(&cio->lock, flags);
> > +		cio->waiter = NULL;
> > +		ret = cio->io_err;
> > +	}
> > +	spin_unlock_irqrestore(&cio->lock, flags);
> > +	kvfree(cio);
> > +
> > +	return ret;
> > +}
> > +
> > +static void bio_copy_end_io(struct bio *bio)
> > +{
> > +	struct copy_ctx *ctx = bio->bi_private;
> > +	struct cio *cio = ctx->cio;
> > +	sector_t clen;
> > +	int ri = ctx->range_idx;
> > +	unsigned long flags;
> > +	bool wake = false;
> > +
> > +	if (bio->bi_status) {
> > +		cio->io_err = bio->bi_status;
> > +		clen = (bio->bi_iter.bi_sector << SECTOR_SHIFT) - ctx->start_sec;
> > +		cio->rlist[ri].comp_len = min_t(sector_t, clen, cio->rlist[ri].comp_len);
> > +	}
> > +	__free_page(bio->bi_io_vec[0].bv_page);
> > +	kfree(ctx);
> > +	bio_put(bio);
> > +
> > +	spin_lock_irqsave(&cio->lock, flags);
> > +	if (((--cio->refcount) <= 0) && cio->waiter)
> > +		wake = true;
> > +	spin_unlock_irqrestore(&cio->lock, flags);
> > +	if (wake)
> > +		wake_up_process(cio->waiter);
> > +}
> > +
> > +/*
> > + * blk_copy_offload	- Use device's native copy offload feature
> > + * Go through user provide payload, prepare new payload based on device's copy offload limits.
> > + */
> > +int blk_copy_offload(struct block_device *src_bdev, int nr_srcs,
> > +		struct range_entry *rlist, struct block_device *dst_bdev, gfp_t gfp_mask)
> > +{
> > +	struct request_queue *sq = bdev_get_queue(src_bdev);
> > +	struct request_queue *dq = bdev_get_queue(dst_bdev);
> > +	struct bio *read_bio, *write_bio;
> > +	struct copy_ctx *ctx;
> > +	struct cio *cio;
> > +	struct page *token;
> > +	sector_t src_blk, copy_len, dst_blk;
> > +	sector_t remaining, max_copy_len = LONG_MAX;
> > +	unsigned long flags;
> > +	int ri = 0, ret = 0;
> > +
> > +	cio = kzalloc(sizeof(struct cio), GFP_KERNEL);
> > +	if (!cio)
> > +		return -ENOMEM;
> > +	cio->rlist = rlist;
> > +	spin_lock_init(&cio->lock);
> > +
> > +	max_copy_len = min_t(sector_t, sq->limits.max_copy_sectors, dq->limits.max_copy_sectors);
> > +	max_copy_len = min3(max_copy_len, (sector_t)sq->limits.max_copy_range_sectors,
> > +			(sector_t)dq->limits.max_copy_range_sectors) << SECTOR_SHIFT;
> > +
> > +	for (ri = 0; ri < nr_srcs; ri++) {
> > +		cio->rlist[ri].comp_len = rlist[ri].len;
> > +		src_blk = rlist[ri].src;
> > +		dst_blk = rlist[ri].dst;
> > +		for (remaining = rlist[ri].len; remaining > 0; remaining -= copy_len) {
> > +			copy_len = min(remaining, max_copy_len);
> > +
> > +			token = alloc_page(gfp_mask);
> > +			if (unlikely(!token)) {
> > +				ret = -ENOMEM;
> > +				goto err_token;
> > +			}
> > +
> > +			ctx = kzalloc(sizeof(struct copy_ctx), gfp_mask);
> > +			if (!ctx) {
> > +				ret = -ENOMEM;
> > +				goto err_ctx;
> > +			}
> > +			ctx->cio = cio;
> > +			ctx->range_idx = ri;
> > +			ctx->start_sec = dst_blk;
> > +
> > +			read_bio = bio_alloc(src_bdev, 1, REQ_OP_READ | REQ_COPY | REQ_NOMERGE,
> > +					gfp_mask);
> > +			if (!read_bio) {
> > +				ret = -ENOMEM;
> > +				goto err_read_bio;
> > +			}
> > +			read_bio->bi_iter.bi_sector = src_blk >> SECTOR_SHIFT;
> > +			__bio_add_page(read_bio, token, PAGE_SIZE, 0);
> > +			/*__bio_add_page increases bi_size by len, so overwrite it with copy len*/
> > +			read_bio->bi_iter.bi_size = copy_len;
> > +			ret = submit_bio_wait(read_bio);
> > +			bio_put(read_bio);
> > +			if (ret)
> > +				goto err_read_bio;
> > +
> > +			write_bio = bio_alloc(dst_bdev, 1, REQ_OP_WRITE | REQ_COPY | REQ_NOMERGE,
> > +					gfp_mask);
> > +			if (!write_bio) {
> > +				ret = -ENOMEM;
> > +				goto err_read_bio;
> > +			}
> > +			write_bio->bi_iter.bi_sector = dst_blk >> SECTOR_SHIFT;
> > +			__bio_add_page(write_bio, token, PAGE_SIZE, 0);
> > +			/*__bio_add_page increases bi_size by len, so overwrite it with copy len*/
> > +			write_bio->bi_iter.bi_size = copy_len;
> > +			write_bio->bi_end_io = bio_copy_end_io;
> > +			write_bio->bi_private = ctx;
> > +
> > +			spin_lock_irqsave(&cio->lock, flags);
> > +			++cio->refcount;
> > +			spin_unlock_irqrestore(&cio->lock, flags);
> > +
> > +			submit_bio(write_bio);
> > +			src_blk += copy_len;
> > +			dst_blk += copy_len;
> > +		}
> > +	}
> > +
> 
> Hmm. I'm not sure if I like the copy loop.
> What I definitely would do is to allocate the write bio before reading data;
> after all, if we can't allocate the write bio reading is pretty much
> pointless.
> 
> But the real issue I have with this is that it's doing synchronous reads,
> thereby limiting the performance.
> 
> Can't you submit the write bio from the end_io function of the read bio?
> That would disentangle things, and we should be getting a better
> performance.
> 

Agree, it will make code efficient.

--
Thank you 
Nitesh Shetty

------B60c1XsBAYLlAvSr_Hnug5kZhc5LtmZ3tZiwVK7tFSQflFGl=_18042_
Content-Type: text/plain; charset="utf-8"


------B60c1XsBAYLlAvSr_Hnug5kZhc5LtmZ3tZiwVK7tFSQflFGl=_18042_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

------B60c1XsBAYLlAvSr_Hnug5kZhc5LtmZ3tZiwVK7tFSQflFGl=_18042_--

