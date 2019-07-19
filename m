Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB896D876
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jul 2019 03:36:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47DF03092676;
	Fri, 19 Jul 2019 01:36:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB2C67121;
	Fri, 19 Jul 2019 01:36:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC0A84E58E;
	Fri, 19 Jul 2019 01:36:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6J1aBxl031766 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 21:36:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F2BC6103C; Fri, 19 Jul 2019 01:36:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ming.t460p (ovpn-8-21.pek2.redhat.com [10.72.8.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE9D360CD7;
	Fri, 19 Jul 2019 01:35:53 +0000 (UTC)
Date: Fri, 19 Jul 2019 09:35:47 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190719013546.GA12004@ming.t460p>
References: <20190718032519.28306-1-ming.lei@redhat.com>
	<20190718032519.28306-2-ming.lei@redhat.com>
	<20190718145201.GA2305@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718145201.GA2305@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH 1/2] blk-mq: add callback of .cleanup_rq
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 19 Jul 2019 01:36:43 +0000 (UTC)

On Thu, Jul 18, 2019 at 10:52:01AM -0400, Mike Snitzer wrote:
> On Wed, Jul 17 2019 at 11:25pm -0400,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > dm-rq needs to free request which has been dispatched and not completed
> > by underlying queue. However, the underlying queue may have allocated
> > private stuff for this request in .queue_rq(), so dm-rq will leak the
> > request private part.
> 
> No, SCSI (and blk-mq) will leak.  DM doesn't know anything about the
> internal memory SCSI uses.  That memory is a SCSI implementation detail.

It isn't noting to do with dm-rq, which frees one request after BLK_STS_*RESOURCE
is returned from blk_insert_cloned_request(), in this case it has to be
the user for releasing the request private data.

> 
> Please fix header to properly reflect which layer is doing the leaking.

Fine.

> 
> > Add one new callback of .cleanup_rq() to fix the memory leak issue.
> > 
> > Another use case is to free request when the hctx is dead during
> > cpu hotplug context.
> > 
> > Cc: Ewan D. Milne <emilne@redhat.com>
> > Cc: Bart Van Assche <bvanassche@acm.org>
> > Cc: Hannes Reinecke <hare@suse.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Mike Snitzer <snitzer@redhat.com>
> > Cc: dm-devel@redhat.com
> > Cc: <stable@vger.kernel.org>
> > Fixes: 396eaf21ee17 ("blk-mq: improve DM's blk-mq IO merging via blk_insert_cloned_request feedback")
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> > ---
> >  drivers/md/dm-rq.c     |  1 +
> >  include/linux/blk-mq.h | 13 +++++++++++++
> >  2 files changed, 14 insertions(+)
> > 
> > diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
> > index c9e44ac1f9a6..21d5c1784d0c 100644
> > --- a/drivers/md/dm-rq.c
> > +++ b/drivers/md/dm-rq.c
> > @@ -408,6 +408,7 @@ static int map_request(struct dm_rq_target_io *tio)
> >  		ret = dm_dispatch_clone_request(clone, rq);
> >  		if (ret == BLK_STS_RESOURCE || ret == BLK_STS_DEV_RESOURCE) {
> >  			blk_rq_unprep_clone(clone);
> > +			blk_mq_cleanup_rq(clone);
> >  			tio->ti->type->release_clone_rq(clone, &tio->info);
> >  			tio->clone = NULL;
> >  			return DM_MAPIO_REQUEUE;
> 
> Requiring upper layer driver (dm-rq) to explicitly call blk_mq_cleanup_rq() 
> seems wrong.  In this instance tio->ti->type->release_clone_rq()
> (dm-mpath's multipath_release_clone) calls blk_put_request().  Why can't
> blk_put_request(), or blk_mq_free_request(), call blk_mq_cleanup_rq()?

I did think about doing it in blk_put_request(), and I just want to
avoid the little cost in generic fast path, given freeing request after
dispatch is very unusual, so far only nvme multipath and dm-rq did in
that way.

However, if no one objects to move blk_mq_cleanup_rq() to blk_put_request()
or blk_mq_free_request(), I am fine to do that in V2.

> 
> Not looked at the cpu hotplug case you mention, but my naive thought is
> it'd be pretty weird to also sprinkle a call to blk_mq_cleanup_rq() from
> that specific "dead hctx" code path.

It isn't weird, and it is exactly what NVMe multipath is doing, please see
nvme_failover_req(). And it is just that nvme doesn't allocate request
private data.

Wrt. blk-mq cpu hotplug handling: after one hctx is dead, we can't dispatch
request to this hctx any more, however one request has been bounded to its
hctx since its allocation and the association can't(or quite hard to) be
changed any more, do you have any better idea to deal with this issue?


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
