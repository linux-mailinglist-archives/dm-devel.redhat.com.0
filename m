Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBECC4F196C
	for <lists+dm-devel@lfdr.de>; Mon,  4 Apr 2022 18:51:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-zCtCTcwlMOy3kPSTcVjZ9g-1; Mon, 04 Apr 2022 12:51:43 -0400
X-MC-Unique: zCtCTcwlMOy3kPSTcVjZ9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64B96185A7A4;
	Mon,  4 Apr 2022 16:51:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67FDFC44CC5;
	Mon,  4 Apr 2022 16:51:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1688E1940370;
	Mon,  4 Apr 2022 16:51:37 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0745119451EF
 for <dm-devel@listman.corp.redhat.com>; Mon,  4 Apr 2022 16:51:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A88EB145BA5D; Mon,  4 Apr 2022 16:51:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5138145BA55
 for <dm-devel@redhat.com>; Mon,  4 Apr 2022 16:51:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BB813811F25
 for <dm-devel@redhat.com>; Mon,  4 Apr 2022 16:51:34 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-rorkeSOLMEmk_GRGQKCEvg-1; Mon, 04 Apr 2022 12:51:33 -0400
X-MC-Unique: rorkeSOLMEmk_GRGQKCEvg-1
Received: by mail-qv1-f52.google.com with SMTP id kk12so7887245qvb.13
 for <dm-devel@redhat.com>; Mon, 04 Apr 2022 09:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JKoTloSRnXPMusp2oIXFpQcP38oU5XFG4syu8CKcOWU=;
 b=OvVsQYzWC1YI1oH6NgL0fzhDhKGvr3c64CJ/ijUQUTRwDwrf9QowfIUZiMbVlsOIhj
 tTqk/p+Q4j/lDA9ubkZ6HcycIfUHfauF1BhCloTAh5xtYTC8cEpoKZ0JVAX0ltKN3phE
 fAhmBs8ESj1WTCg8ieIkAUtn+DJa1ArmmzXU5QzzjlMo6ao6ao63+k2Iv/Oi1W1nzVhV
 anJP+qfY/ih5JYlnuJ35ObIAmokFAVbhEPgm42f1IWEQoD542A0T0pf0CMak5sDQTZch
 TH9qqPmnbwCjJqz4RNJ9jhXS9HfhWdAv+su2nMjkBEKBEGTa7qU1bX8wH/XwCpDMNgkn
 8uRg==
X-Gm-Message-State: AOAM5312TjIwZOX0DXXYcfXqApFi+3f6uWWePRPcO/pismZiQ/jEfuEe
 F55Ay2idGB5KemzY8VTLgixhE0zjJADxBtM=
X-Google-Smtp-Source: ABdhPJx7IPqluhgdpjiDB8QIEhQE0G9Vx7/HAaw4p2DSDWh7Ck9Jafx3+N4Vvo1exetHheaSUfEEuA==
X-Received: by 2002:a05:6214:769:b0:443:e16b:52aa with SMTP id
 f9-20020a056214076900b00443e16b52aamr866647qvz.3.1649091092556; 
 Mon, 04 Apr 2022 09:51:32 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52]) by smtp.gmail.com with ESMTPSA id
 19-20020a05620a079300b0067d1537f35bsm6638715qka.83.2022.04.04.09.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 09:51:31 -0700 (PDT)
Date: Mon, 4 Apr 2022 12:51:30 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <YksiEk+G5QuPG6o8@redhat.com>
References: <20220403114532.180945-1-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220403114532.180945-1-ming.lei@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [dm-devel] [RFC PATCH] io_uring: reissue in case -EAGAIN is
 returned after io issue returns
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
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com, io-uring@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 03 2022 at  7:45P -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> -EAGAIN still may return after io issue returns, and REQ_F_REISSUE is
> set in io_complete_rw_iopoll(), but the req never gets chance to be handled.
> io_iopoll_check doesn't handle this situation, and io hang can be caused.
> 
> Current dm io polling may return -EAGAIN after bio submission is
> returned, also blk-throttle might trigger this situation too.
> 
> Cc: Mike Snitzer <snitzer@kernel.org>
> Signed-off-by: Ming Lei <ming.lei@redhat.com>

I first reverted commit 5291984004ed ("dm: fix bio polling to handle
possibile BLK_STS_AGAIN") then applied this patch and verified this
fixes the DM bio polling hangs.  Nice work!

But interestingly with this fio test (against dm-linear ontop of
null_blk with queue_mode=2 submit_queues=8 poll_queues=2 bs=4096 gb=16):

fio --bs=4096 --ioengine=io_uring --fixedbufs --registerfiles --hipri=1 \
--iodepth=16 --iodepth_batch_submit=16 --iodepth_batch_complete_min=16 \
--filename=/dev/mapper/linear --direct=1 --runtime=20 --numjobs=16 \
--rw=randread --name=test --group_reporting --norandommap

I get 3186k IOPS with your patch to have io_uring retry (and commit
5291984004ed reverted), but 4305k IOPS if leave commit 5291984004ed
applied (and DM resorts to retrying any -EAGAIN _without_ polling).

Jens rightly pointed out to me that polling tests that exhaust tags
are bogus anyway (because such unbounded IO defeats the point of
polling).  Jens also thinks my result, with commit 5291984004ed
applied, is somehow bogus and not to be trusted ;)  He is very likely
correct, and the failing likely in the null_blk driver -- I'm
skeptical of that driver given it cannot pass fio verify testing
(e.g. --do_verify=1 --verify=crc32c --verify_async=1) with or without
polling.

Review comments inlined below.

> ---
>  fs/io-wq.h    |  13 +++++
>  fs/io_uring.c | 128 ++++++++++++++++++++++++++++----------------------
>  2 files changed, 86 insertions(+), 55 deletions(-)
> 
> diff --git a/fs/io-wq.h b/fs/io-wq.h
> index dbecd27656c7..4ca4863664fb 100644
> --- a/fs/io-wq.h
> +++ b/fs/io-wq.h
> @@ -96,6 +96,19 @@ static inline void wq_list_add_head(struct io_wq_work_node *node,
>  	WRITE_ONCE(list->first, node);
>  }
>  
> +static inline void wq_list_remove(struct io_wq_work_list *list,
> +				  struct io_wq_work_node *prev,
> +				  struct io_wq_work_node *node)
> +{
> +	if (!prev)
> +		WRITE_ONCE(list->first, node->next);
> +	else
> +		prev->next = node->next;
> +
> +	if (node == list->last)
> +		list->last = prev;
> +}
> +
>  static inline void wq_list_cut(struct io_wq_work_list *list,
>  			       struct io_wq_work_node *last,
>  			       struct io_wq_work_node *prev)
> diff --git a/fs/io_uring.c b/fs/io_uring.c
> index 59e54a6854b7..6db5514e10ca 100644
> --- a/fs/io_uring.c
> +++ b/fs/io_uring.c
> @@ -2759,6 +2759,65 @@ static inline bool io_run_task_work(void)
>  	return false;
>  }
>  
> +#ifdef CONFIG_BLOCK
> +static bool io_resubmit_prep(struct io_kiocb *req)
> +{
> +	struct io_async_rw *rw = req->async_data;
> +
> +	if (!req_has_async_data(req))
> +		return !io_req_prep_async(req);
> +	iov_iter_restore(&rw->s.iter, &rw->s.iter_state);
> +	return true;
> +}
> +
> +static bool io_rw_should_reissue(struct io_kiocb *req)
> +{
> +	umode_t mode = file_inode(req->file)->i_mode;
> +	struct io_ring_ctx *ctx = req->ctx;
> +
> +	if (!S_ISBLK(mode) && !S_ISREG(mode))
> +		return false;
> +	if ((req->flags & REQ_F_NOWAIT) || (io_wq_current_is_worker() &&
> +	    !(ctx->flags & IORING_SETUP_IOPOLL)))
> +		return false;
> +	/*
> +	 * If ref is dying, we might be running poll reap from the exit work.
> +	 * Don't attempt to reissue from that path, just let it fail with
> +	 * -EAGAIN.
> +	 */
> +	if (percpu_ref_is_dying(&ctx->refs))
> +		return false;
> +	/*
> +	 * Play it safe and assume not safe to re-import and reissue if we're
> +	 * not in the original thread group (or in task context).
> +	 */
> +	if (!same_thread_group(req->task, current) || !in_task())
> +		return false;
> +	return true;
> +}
> +#else
> +static bool io_resubmit_prep(struct io_kiocb *req)
> +{
> +	return false;
> +}
> +static bool io_rw_should_reissue(struct io_kiocb *req)
> +{
> +	return false;
> +}
> +#endif
> +
> +static void do_io_reissue(struct io_kiocb *req, int ret)
> +{
> +	if (req->flags & REQ_F_REISSUE) {
> +		req->flags &= ~REQ_F_REISSUE;
> +		if (io_resubmit_prep(req))
> +			io_req_task_queue_reissue(req);
> +		else
> +			io_req_task_queue_fail(req, ret);
> +	}
> +}

Minor nit but: I'd leave caller to check for REQ_F_REISSUE.

> +
> +
>  static int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin)
>  {
>  	struct io_wq_work_node *pos, *start, *prev;
> @@ -2786,6 +2845,13 @@ static int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin)
>  		if (READ_ONCE(req->iopoll_completed))
>  			break;
>  
> +		/*
> +		 * Once REISSUE flag is set, the req has been done, and we
> +		 * have to retry
> +		 */
> +		if (req->flags & REQ_F_REISSUE)
> +			break;
> +
>  		ret = kiocb->ki_filp->f_op->iopoll(kiocb, &iob, poll_flags);
>  		if (unlikely(ret < 0))
>  			return ret;
> @@ -2807,6 +2873,12 @@ static int io_do_iopoll(struct io_ring_ctx *ctx, bool force_nonspin)
>  	wq_list_for_each_resume(pos, prev) {
>  		struct io_kiocb *req = container_of(pos, struct io_kiocb, comp_list);
>  
> +		if (req->flags & REQ_F_REISSUE) {
> +			wq_list_remove(&ctx->iopoll_list, prev, pos);
> +			do_io_reissue(req, -EIO);
> +			break;
> +		}
> +

That way you'll avoid redundant checks for REQ_F_REISSUE here.

Other than that:

Reviewed-by: Mike Snitzer <snitzer@kernel.org>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

