Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C1A70E64
	for <lists+dm-devel@lfdr.de>; Tue, 23 Jul 2019 03:01:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D96A46671;
	Tue, 23 Jul 2019 01:01:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC8CB60BEC;
	Tue, 23 Jul 2019 01:01:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58F2C41F40;
	Tue, 23 Jul 2019 01:01:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6N11Mr6025633 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 21:01:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D110C5B686; Tue, 23 Jul 2019 01:01:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ming.t460p (ovpn-8-21.pek2.redhat.com [10.72.8.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 511BD5B685;
	Tue, 23 Jul 2019 01:01:02 +0000 (UTC)
Date: Tue, 23 Jul 2019 09:00:55 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <20190723010053.GA30776@ming.t460p>
References: <20190720030637.14447-1-ming.lei@redhat.com>
	<20190720030637.14447-2-ming.lei@redhat.com>
	<4ffe9dd8-9e86-fd93-828e-78c1e5931c5f@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ffe9dd8-9e86-fd93-828e-78c1e5931c5f@acm.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, stable@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V2 1/2] blk-mq: add callback of .cleanup_rq
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 23 Jul 2019 01:01:54 +0000 (UTC)

On Mon, Jul 22, 2019 at 09:51:27AM -0700, Bart Van Assche wrote:
> On 7/19/19 8:06 PM, Ming Lei wrote:
> > diff --git a/block/blk-mq.c b/block/blk-mq.c
> > index b038ec680e84..fc38d95c557f 100644
> > --- a/block/blk-mq.c
> > +++ b/block/blk-mq.c
> > @@ -502,6 +502,9 @@ void blk_mq_free_request(struct request *rq)
> >   	struct blk_mq_ctx *ctx = rq->mq_ctx;
> >   	struct blk_mq_hw_ctx *hctx = rq->mq_hctx;
> > +	if (q->mq_ops->cleanup_rq)
> > +		q->mq_ops->cleanup_rq(rq);
> > +
> >   	if (rq->rq_flags & RQF_ELVPRIV) {
> >   		if (e && e->type->ops.finish_request)
> >   			e->type->ops.finish_request(rq);
> 
> I'm concerned about the performance impact of this change. How about not

Not see any performance impact in my test, and q->mq_ops should be in
data cache at that time.

> introducing .cleanup_rq() and adding a call to
> scsi_mq_uninit_cmd() in scsi_queue_rq() just before that function returns
> BLK_STS_RESOURCE or BLK_STS_DEV_RESOURCE?

The problem is that only dm-rq needs to free the request private data
when BLK_STS_RESOURCE or BLK_STS_DEV_RESOURCE is returned. If we do that
unconditionally, performance impact might be visible.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
