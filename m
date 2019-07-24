Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 737DD7338E
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jul 2019 18:20:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9102C3082137;
	Wed, 24 Jul 2019 16:20:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A14019C70;
	Wed, 24 Jul 2019 16:20:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37D5F1972D;
	Wed, 24 Jul 2019 16:20:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OGIIjJ007087 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 12:18:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D86F61001B0F; Wed, 24 Jul 2019 16:18:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52E6B102482F;
	Wed, 24 Jul 2019 16:18:14 +0000 (UTC)
Date: Wed, 24 Jul 2019 12:18:13 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20190724161813.GA13896@redhat.com>
References: <20190724031258.31688-1-ming.lei@redhat.com>
	<20190724031258.31688-2-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724031258.31688-2-ming.lei@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>,
	Bart Van Assche <bvanassche@acm.org>, "Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V3 1/2] blk-mq: add callback of .cleanup_rq
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 24 Jul 2019 16:20:20 +0000 (UTC)

On Tue, Jul 23 2019 at 11:12pm -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> dm-rq needs to free request which has been dispatched and not completed
> by underlying queue. However, the underlying queue may have allocated
> private data for this request in .queue_rq(), so the request private data
> will be leaked in dm multipath IO code path.
> 
> Add one new callback of .cleanup_rq() to fix the memory leak.

Think the above kind of glosses over the nature of the issue.  While
this issue _is_ unique to request-based DM multipath's use of blk-mq it
ultimately is a failing of the existing blk-mq interface that SCSI's
per-request private data is leaking.  SO all said, I'd rather this patch
header reflect the nuance of why you skinned the cat like you have.

Something like this would be a better header IMHO:

SCSI maintains its own driver private data hooked off of each SCSI
request.  An upper layer driver (e.g. dm-rq) may need to retry these
SCSI requests, before SCSI has fully dispatched them, due to a lower
level SCSI driver's resource limitation identified in scsi_queue_rq().
Currently SCSI's per-request private data is leaked when the upper layer
driver (dm-rq) frees and then retries these requests in response to
BLK_STS_RESOURCE or BLK_STS_DEV_RESOURCE returns from scsi_queue_rq().

This usecase is so specialized that it doesn't warrant training an
existing blk-mq interface (e.g. blk_mq_free_request) to allow SCSI to
account for freeing its driver private data -- doing so would add an
extra branch for handling a special case that all other consumers of
SCSI (and blk-mq) won't ever need to worry about.

So the most pragmatic way forward is to delegate freeing SCSI driver
private data to the upper layer driver (dm-rq).  Do so by calling a new
blk_mq_cleanup_rq() method from dm-rq.  A following commit will
implement the .cleanup_rq() hook in scsi_mq_ops.


> Another use case is to free request when the hctx is dead during
> cpu hotplug context.

Not seeing any point forecasting this .cleanup_rq() hook's potential
ability to address that cpu hotplug case; the future patch that provides
that fix can deal with it.  Reality is the existing SCSI per-request
private data leak justifies this new hook on its own.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
