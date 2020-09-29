Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC33627D90D
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 22:41:00 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601412059;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WIzCjvhZT99aK/O9Y5CAzqAcPMGKHz1PopCTXRY3tOc=;
	b=VqirZbe1vk40h+f9d5GpSIUqfiLrRKg/UPDheQupuQ/y9la7iKfKHIPKxiF8YkVvteAFpb
	7BqUNcId6OQR/ARAd1XZRTpuO/EWM8WJ4Y1KedNHAVovMUHvi/tZsVcyazNe6yM79t4ymv
	YUSbBnU8gskJKerhLsEI1Mh/MDqTklA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-_ub6Bs1QMJOGvT8wa6oZtA-1; Tue, 29 Sep 2020 16:40:56 -0400
X-MC-Unique: _ub6Bs1QMJOGvT8wa6oZtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8000F56C31;
	Tue, 29 Sep 2020 20:40:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DC6F7A431;
	Tue, 29 Sep 2020 20:40:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFFAB44A4C;
	Tue, 29 Sep 2020 20:40:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08TKdxWT005928 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 16:39:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B28A2156A3B; Tue, 29 Sep 2020 20:39:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 666932156A3A
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 20:39:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 056AE80121D
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 20:39:57 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-VXRiHBdCO5KGvNOl6PuKHQ-1; Tue, 29 Sep 2020 16:39:54 -0400
X-MC-Unique: VXRiHBdCO5KGvNOl6PuKHQ-1
Received: by mail-qk1-f195.google.com with SMTP id f142so5811816qke.13;
	Tue, 29 Sep 2020 13:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=sMTUhRtCxJUsKQa8lWSMtjMRe19Fo8nho/L0Qwh7iyo=;
	b=BoTGHyhAfNASkjC/bbuntABPbhJhAXmHi87t8zPN0dyCIyBNh0pNxnR74elQE5Pi0h
	hf7Fp2pW/gGaLuCLXWnGjy//mjfr5n7dUr5wP08zazRxdcsSkTcinh4UE+Zr1RQSZhzD
	LIalro4qvdAbl3o6ENSD67/rxXkqY2FBr1TZCaSfWa0v2PcVafi0/HLEkBHYUaxc+Poe
	Pdb1w4+Pde5aV5AhFx9BwYrJ3VjDJkC94zZcumUnq0v7I2rks5OQwMEL/Hwg/dRm1h60
	ymYPjO5tSo2sllTgvaTZ8FYZxb0gX6z3oeJnzboX1xFJ6ZljQZgJAtTLH3Mk+lrkWXdp
	f1Kw==
X-Gm-Message-State: AOAM533DLqG8xjocFeIxAP6OpI1/7yTWhvuDQLyPv2jeXnlwO05HWyc/
	hYjdvlPXNq7IG/uBBlnxXC8=
X-Google-Smtp-Source: ABdhPJw6/0w3PjPmwfjKAedASq1Q1IPvzg5LFAs40kuAwjsyHSs8b1oYGcpeCJ4D+icBI79osgAznQ==
X-Received: by 2002:a37:e218:: with SMTP id g24mr6151311qki.496.1601411994170; 
	Tue, 29 Sep 2020 13:39:54 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	y29sm7015653qtj.20.2020.09.29.13.39.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Sep 2020 13:39:53 -0700 (PDT)
Date: Tue, 29 Sep 2020 16:39:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20200929203952.GA19218@lobo>
References: <20200927120435.44118-1-jefflexu@linux.alibaba.com>
	<20200928160322.GA23320@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200928160322.GA23320@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, ming.lei@redhat.com
Subject: [dm-devel] [PATCH] dm: fix missing imposition of queue_limits from
 dm_wq_work() thread
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 28 2020 at 12:03P -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Sun, Sep 27 2020 at  8:04am -0400,
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> 
> > Hi Mike, would you mind further expalin why bio processed by dm_wq_work()
> > always gets a previous ->submit_bio. Considering the following call graph:
> > 
> > ->submit_bio, that is, dm_submit_bio
> >   DMF_BLOCK_IO_FOR_SUSPEND set, thus queue_io()
> > 
> > then worker thread dm_wq_work()
> >   dm_process_bio  // at this point. the input bio is the original bio
> >                      submitted to dm device
> > 
> > Please let me know if I missed something.
> > 
> > Thanks.
> > Jeffle
> 
> In general you have a valid point, that blk_queue_split() won't have
> been done for the suspended device case, but blk_queue_split() cannot be
> used if not in ->submit_bio -- IIUC you cannot just do it from a worker
> thread and hope to have proper submission order (depth first) as
> provided by __submit_bio_noacct().  Because this IO will be submitted
> from worker you could have multiple threads allocating from the
> q->bio_split mempool at the same time.
> 
> All said, I'm not quite sure how to address this report.  But I'll keep
> at it and see what I can come up with.

Here is what I've staged for 5.10:

From: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 28 Sep 2020 13:41:36 -0400
Subject: [PATCH] dm: fix missing imposition of queue_limits from dm_wq_work() thread

If a DM device was suspended when bios were issued to it, those bios
would be deferred using queue_io(). Once the DM device was resumed
dm_process_bio() could be called by dm_wq_work() for original bio that
still needs splitting. dm_process_bio()'s check for current->bio_list
(meaning call chain is within ->submit_bio) as a prerequisite for
calling blk_queue_split() for "abnormal IO" would result in
dm_process_bio() never imposing corresponding queue_limits
(e.g. discard_granularity, discard_max_bytes, etc).

Fix this by folding dm_process_bio() into dm_submit_bio() and
always have dm_wq_work() resubmit deferred bios using
submit_bio_noacct().

Side-effect is blk_queue_split() is always called for "abnormal IO" from
->submit_bio, be it from application thread or dm_wq_work() workqueue,
so proper bio splitting and depth-first bio submission is performed.

While at it, cleanup dm_submit_bio()'s DMF_BLOCK_IO_FOR_SUSPEND related
branching and expand scope of dm_get_live_table() rcu reference on map
via common 'out' label to dm_put_live_table(). Also, rename bio variable
in dm_wq_work() from 'c' to 'bio'.

Fixes: cf9c37865557 ("dm: fix comment in dm_process_bio()")
Reported-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm.c | 67 +++++++++++++++++++++------------------------------------
 1 file changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index a1adcf0ab821..1813201d772a 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1665,34 +1665,6 @@ static blk_qc_t __process_bio(struct mapped_device *md, struct dm_table *map,
 	return ret;
 }
 
-static blk_qc_t dm_process_bio(struct mapped_device *md,
-			       struct dm_table *map, struct bio *bio)
-{
-	blk_qc_t ret = BLK_QC_T_NONE;
-
-	if (unlikely(!map)) {
-		bio_io_error(bio);
-		return ret;
-	}
-
-	/*
-	 * If in ->submit_bio we need to use blk_queue_split(), otherwise
-	 * queue_limits for abnormal requests (e.g. discard, writesame, etc)
-	 * won't be imposed.
-	 * If called from dm_wq_work() for deferred bio processing, bio
-	 * was already handled by following code with previous ->submit_bio.
-	 */
-	if (current->bio_list) {
-		if (is_abnormal_io(bio))
-			blk_queue_split(&bio);
-		/* regular IO is split by __split_and_process_bio */
-	}
-
-	if (dm_get_md_type(md) == DM_TYPE_NVME_BIO_BASED)
-		return __process_bio(md, map, bio);
-	return __split_and_process_bio(md, map, bio);
-}
-
 static blk_qc_t dm_submit_bio(struct bio *bio)
 {
 	struct mapped_device *md = bio->bi_disk->private_data;
@@ -1713,22 +1685,34 @@ static blk_qc_t dm_submit_bio(struct bio *bio)
 	}
 
 	map = dm_get_live_table(md, &srcu_idx);
+	if (unlikely(!map)) {
+		bio_io_error(bio);
+		goto out;
+	}
 
-	/* if we're suspended, we have to queue this io for later */
+	/* If suspended, queue this IO for later */
 	if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags))) {
-		dm_put_live_table(md, srcu_idx);
-
 		if (bio->bi_opf & REQ_NOWAIT)
 			bio_wouldblock_error(bio);
-		else if (!(bio->bi_opf & REQ_RAHEAD))
-			queue_io(md, bio);
-		else
+		else if (bio->bi_opf & REQ_RAHEAD)
 			bio_io_error(bio);
-		return ret;
+		else
+			queue_io(md, bio);
+		goto out;
 	}
 
-	ret = dm_process_bio(md, map, bio);
+	/*
+	 * Use blk_queue_split() for abnormal IO (e.g. discard, writesame, etc)
+	 * otherwise associated queue_limits won't be imposed.
+	 */
+	if (is_abnormal_io(bio))
+		blk_queue_split(&bio);
 
+	if (dm_get_md_type(md) == DM_TYPE_NVME_BIO_BASED)
+		ret = __process_bio(md, map, bio);
+	else
+		ret = __split_and_process_bio(md, map, bio);
+out:
 	dm_put_live_table(md, srcu_idx);
 	return ret;
 }
@@ -2385,7 +2369,7 @@ static void dm_wq_work(struct work_struct *work)
 {
 	struct mapped_device *md = container_of(work, struct mapped_device,
 						work);
-	struct bio *c;
+	struct bio *bio;
 	int srcu_idx;
 	struct dm_table *map;
 
@@ -2393,16 +2377,13 @@ static void dm_wq_work(struct work_struct *work)
 
 	while (!test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags)) {
 		spin_lock_irq(&md->deferred_lock);
-		c = bio_list_pop(&md->deferred);
+		bio = bio_list_pop(&md->deferred);
 		spin_unlock_irq(&md->deferred_lock);
 
-		if (!c)
+		if (!bio)
 			break;
 
-		if (dm_request_based(md))
-			(void) submit_bio_noacct(c);
-		else
-			(void) dm_process_bio(md, map, c);
+		submit_bio_noacct(bio);
 	}
 
 	dm_put_live_table(md, srcu_idx);
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

