Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E15F03EF38B
	for <lists+dm-devel@lfdr.de>; Tue, 17 Aug 2021 22:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629232255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4RnaQV9Uh9xYqEqYd3Vjn3bsWFVL3i7SIpl3N46ojxI=;
	b=CF+gtOSD6xugCgSsH1lqeW17nZmTRiagFylUYfkTvsHAvBPIWaz8A43NKf9j4t3vL/f0+2
	bBGIuD+PZupKDeOOWzeuuqQ+bLFrOOGDffI1PqOWNXzBm32CP9DLQDH1i8se0ltA5Lalpy
	bcopL+MS/1McP2eJOmKvg08alqpX7GQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-VJWEM7b9NoOed0sUxpfFuA-1; Tue, 17 Aug 2021 16:30:54 -0400
X-MC-Unique: VJWEM7b9NoOed0sUxpfFuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36F27DF8A0;
	Tue, 17 Aug 2021 20:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 009365C1D5;
	Tue, 17 Aug 2021 20:30:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A68D3181A6E2;
	Tue, 17 Aug 2021 20:30:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17HKU9bL015906 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Aug 2021 16:30:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34BEB18032; Tue, 17 Aug 2021 20:30:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70BBB5C1D5;
	Tue, 17 Aug 2021 20:29:59 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 17HKTwMF031021; Tue, 17 Aug 2021 16:29:58 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 17HKTtxE031017; Tue, 17 Aug 2021 16:29:55 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 17 Aug 2021 16:29:55 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: SelvaKumar S <selvakuma.s1@samsung.com>
In-Reply-To: <20210817101423.12367-8-selvakuma.s1@samsung.com>
Message-ID: <alpine.LRH.2.02.2108171626250.30363@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210817101423.12367-1-selvakuma.s1@samsung.com>
	<CGME20210817101822epcas5p470644cf681d5e8db5367dc7998305c65@epcas5p4.samsung.com>
	<20210817101423.12367-8-selvakuma.s1@samsung.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, djwong@kernel.org, linux-nvme@lists.infradead.org,
	dm-devel@redhat.com, hch@lst.de, agk@redhat.com,
	bvanassche@acm.org, linux-scsi@vger.kernel.org,
	nitheshshetty@gmail.com, willy@infradead.org,
	nj.shetty@samsung.com, kch@kernel.org, selvajove@gmail.com,
	linux-block@vger.kernel.org, joshiiitr@gmail.com,
	kbusch@kernel.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	joshi.k@samsung.com, martin.petersen@oracle.com,
	johannes.thumshirn@wdc.com, linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, javier.gonz@samsung.com,
	asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH 7/7] dm kcopyd: add simple copy offload
 support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 17 Aug 2021, SelvaKumar S wrote:

> Introduce copy_jobs to use copy-offload, if supported by underlying devices
> otherwise fall back to existing method.

dm-kcopyd is usually used on the dm-linear target. And this patchset 
doesn't support passing copy requests through the linear target - so this 
patch doesn't seem useful.

Mikulas

> run_copy_jobs() calls block layer copy offload API, if both source and
> destination request queue are same and support copy offload.
> On successful completion, destination regions copied count is made zero,
> failed regions are processed via existing method.
> 
> Signed-off-by: SelvaKumar S <selvakuma.s1@samsung.com>
> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
> ---
>  drivers/md/dm-kcopyd.c | 56 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
> index 37b03ab7e5c9..d9ee105a6127 100644
> --- a/drivers/md/dm-kcopyd.c
> +++ b/drivers/md/dm-kcopyd.c
> @@ -74,18 +74,20 @@ struct dm_kcopyd_client {
>  	atomic_t nr_jobs;
>  
>  /*
> - * We maintain four lists of jobs:
> + * We maintain five lists of jobs:
>   *
> - * i)   jobs waiting for pages
> - * ii)  jobs that have pages, and are waiting for the io to be issued.
> - * iii) jobs that don't need to do any IO and just run a callback
> - * iv) jobs that have completed.
> + * i)	jobs waiting to try copy offload
> + * ii)   jobs waiting for pages
> + * iii)  jobs that have pages, and are waiting for the io to be issued.
> + * iv) jobs that don't need to do any IO and just run a callback
> + * v) jobs that have completed.
>   *
> - * All four of these are protected by job_lock.
> + * All five of these are protected by job_lock.
>   */
>  	spinlock_t job_lock;
>  	struct list_head callback_jobs;
>  	struct list_head complete_jobs;
> +	struct list_head copy_jobs;
>  	struct list_head io_jobs;
>  	struct list_head pages_jobs;
>  };
> @@ -579,6 +581,43 @@ static int run_io_job(struct kcopyd_job *job)
>  	return r;
>  }
>  
> +static int run_copy_job(struct kcopyd_job *job)
> +{
> +	int r, i, count = 0;
> +	unsigned long flags = 0;
> +	struct range_entry srange;
> +
> +	struct request_queue *src_q, *dest_q;
> +
> +	for (i = 0; i < job->num_dests; i++) {
> +		srange.src = job->source.sector;
> +		srange.len = job->source.count;
> +
> +		src_q = bdev_get_queue(job->source.bdev);
> +		dest_q = bdev_get_queue(job->dests[i].bdev);
> +
> +		if (src_q != dest_q && !src_q->limits.copy_offload)
> +			break;
> +
> +		r = blkdev_issue_copy(job->source.bdev, 1, &srange,
> +			job->dests[i].bdev, job->dests[i].sector, GFP_KERNEL, flags);
> +		if (r)
> +			break;
> +
> +		job->dests[i].count = 0;
> +		count++;
> +	}
> +
> +	if (count == job->num_dests) {
> +		push(&job->kc->complete_jobs, job);
> +	} else {
> +		push(&job->kc->pages_jobs, job);
> +		r = 0;
> +	}
> +
> +	return r;
> +}
> +
>  static int run_pages_job(struct kcopyd_job *job)
>  {
>  	int r;
> @@ -659,6 +698,7 @@ static void do_work(struct work_struct *work)
>  	spin_unlock_irq(&kc->job_lock);
>  
>  	blk_start_plug(&plug);
> +	process_jobs(&kc->copy_jobs, kc, run_copy_job);
>  	process_jobs(&kc->complete_jobs, kc, run_complete_job);
>  	process_jobs(&kc->pages_jobs, kc, run_pages_job);
>  	process_jobs(&kc->io_jobs, kc, run_io_job);
> @@ -676,6 +716,8 @@ static void dispatch_job(struct kcopyd_job *job)
>  	atomic_inc(&kc->nr_jobs);
>  	if (unlikely(!job->source.count))
>  		push(&kc->callback_jobs, job);
> +	else if (job->source.bdev->bd_disk == job->dests[0].bdev->bd_disk)
> +		push(&kc->copy_jobs, job);
>  	else if (job->pages == &zero_page_list)
>  		push(&kc->io_jobs, job);
>  	else
> @@ -916,6 +958,7 @@ struct dm_kcopyd_client *dm_kcopyd_client_create(struct dm_kcopyd_throttle *thro
>  	spin_lock_init(&kc->job_lock);
>  	INIT_LIST_HEAD(&kc->callback_jobs);
>  	INIT_LIST_HEAD(&kc->complete_jobs);
> +	INIT_LIST_HEAD(&kc->copy_jobs);
>  	INIT_LIST_HEAD(&kc->io_jobs);
>  	INIT_LIST_HEAD(&kc->pages_jobs);
>  	kc->throttle = throttle;
> @@ -971,6 +1014,7 @@ void dm_kcopyd_client_destroy(struct dm_kcopyd_client *kc)
>  
>  	BUG_ON(!list_empty(&kc->callback_jobs));
>  	BUG_ON(!list_empty(&kc->complete_jobs));
> +	WARN_ON(!list_empty(&kc->copy_jobs));
>  	BUG_ON(!list_empty(&kc->io_jobs));
>  	BUG_ON(!list_empty(&kc->pages_jobs));
>  	destroy_workqueue(kc->kcopyd_wq);
> -- 
> 2.25.1
> 
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

