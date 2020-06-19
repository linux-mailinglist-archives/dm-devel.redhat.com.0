Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BED1420199E
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 19:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592588472;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=spXRZHgXi0gdFip1TJS3n6VAgkKLOyTrtscSzRJXwRs=;
	b=ZjlUNi7c8Jrx7zso++v9qJI+4F+mW/mNdrtKISy8R612OUd6FgAC8PQQa8VXz8LMZKAzPV
	p+2WcX7jNTvKPBjxndfWomhQyC3+eml8MmfmdY13W85imBTwu+0K9Sjhn1k2YCmWmjluL7
	1e6v9YDVIrUYMTYkv6JfK2Lk43bAk54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-BopWtk_VPbWfHu3V-7KFRQ-1; Fri, 19 Jun 2020 13:41:10 -0400
X-MC-Unique: BopWtk_VPbWfHu3V-7KFRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1188107ACF5;
	Fri, 19 Jun 2020 17:41:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E3419D7B;
	Fri, 19 Jun 2020 17:41:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1B81833BD;
	Fri, 19 Jun 2020 17:40:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JHemoQ005026 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 13:40:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 41E8119D9E; Fri, 19 Jun 2020 17:40:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 308EB19D7B;
	Fri, 19 Jun 2020 17:40:42 +0000 (UTC)
Date: Fri, 19 Jun 2020 13:40:41 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20200619174040.GA24968@redhat.com>
References: <20200619084214.337449-1-ming.lei@redhat.com>
	<20200619094250.GA18410@redhat.com> <20200619101142.GA339442@T590>
	<20200619160657.GA24520@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619160657.GA24520@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, dm-devel@redhat.com,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] dm-rq: don't call blk_mq_queue_stopped in
	dm_stop_queue()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jun 19 2020 at 12:06pm -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Fri, Jun 19 2020 at  6:11am -0400,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > Hi Mike,
> > 
> > On Fri, Jun 19, 2020 at 05:42:50AM -0400, Mike Snitzer wrote:
> > > Hi Ming,
> > > 
> > > Thanks for the patch!  But I'm having a hard time understanding what
> > > you've written in the patch header,
> > > 
> > > On Fri, Jun 19 2020 at  4:42am -0400,
> > > Ming Lei <ming.lei@redhat.com> wrote:
> > > 
> > > > dm-rq won't stop queue, meantime blk-mq won't stop one queue too, so
> > > > remove the check.
> > > 
> > > It'd be helpful if you could unpack this with more detail before going on
> > > to explain why using blk_queue_quiesced, despite dm-rq using
> > > blk_mq_queue_stopped, would also be ineffective.
> > > 
> > > SO:
> > > 
> > > > dm-rq won't stop queue
> > > 
> > > 1) why won't dm-rq stop the queue?  Do you mean it won't reliably
> > >    _always_ stop the queue because of the blk_mq_queue_stopped() check?
> > 
> > device mapper doesn't call blk_mq_stop_hw_queue or blk_mq_stop_hw_queues.
> > 
> > > 
> > > > meantime blk-mq won't stop one queue too, so remove the check.
> > > 
> > > 2) Meaning?: blk_mq_queue_stopped() will return true even if only one hw
> > > queue is stopped, given blk-mq must stop all hw queues a positive return
> > > from this blk_mq_queue_stopped() check is incorrectly assuming it meanss
> > > all hw queues are stopped.
> > 
> > blk-mq won't call blk_mq_stop_hw_queue or blk_mq_stop_hw_queues for
> > dm-rq's queue too, so dm-rq's hw queue won't be stopped.
> > 
> > BTW blk_mq_stop_hw_queue or blk_mq_stop_hw_queues are supposed to be
> > used for throttling queue.
> 
> I'm going to look at actually stopping the queue (using one of these
> interfaces).  I didn't realize I wasn't actually stopping the queue.
> The intent was to do so.
> 
> In speaking with Jens yesterday about freeze vs stop: it is clear that
> dm-rq needs to still be able to allocate new requests, but _not_ call
> the queue_rq to issue the requests, while "stopped" (due to dm-mpath
> potentially deferring retries of failed requests because of path failure
> while quiescing the queue during DM device suspend).  But that freezing
> the queue goes too far because it won't allow such request allocation.

Seems I'm damned if I do (stop) or damned if I don't (new reports of
requests completing after DM device suspend's
blk_mq_quiesce_queue()+dm_wait_for_completion()).

I'm left at something of a loss about what to do!  Bart? Jens? Ming?

Looking closer at the git history, commit 7b17c2f7292ba takes center
stage:

commit 7b17c2f7292ba1f3f98dae3f7077f9e569653276
Author: Bart Van Assche <bart.vanassche@sandisk.com>
Date:   Fri Oct 28 17:22:16 2016 -0700

    dm: Fix a race condition related to stopping and starting queues

    Ensure that all ongoing dm_mq_queue_rq() and dm_mq_requeue_request()
    calls have stopped before setting the "queue stopped" flag. This
    allows to remove the "queue stopped" test from dm_mq_queue_rq() and
    dm_mq_requeue_request(). This patch fixes a race condition because
    dm_mq_queue_rq() is called without holding the queue lock and hence
    BLK_MQ_S_STOPPED can be set at any time while dm_mq_queue_rq() is
    in progress. This patch prevents that the following hang occurs
    sporadically when using dm-mq:

    INFO: task systemd-udevd:10111 blocked for more than 480 seconds.
    Call Trace:
     [<ffffffff8161f397>] schedule+0x37/0x90
     [<ffffffff816239ef>] schedule_timeout+0x27f/0x470
     [<ffffffff8161e76f>] io_schedule_timeout+0x9f/0x110
     [<ffffffff8161fb36>] bit_wait_io+0x16/0x60
     [<ffffffff8161f929>] __wait_on_bit_lock+0x49/0xa0
     [<ffffffff8114fe69>] __lock_page+0xb9/0xc0
     [<ffffffff81165d90>] truncate_inode_pages_range+0x3e0/0x760
     [<ffffffff81166120>] truncate_inode_pages+0x10/0x20
     [<ffffffff81212a20>] kill_bdev+0x30/0x40
     [<ffffffff81213d41>] __blkdev_put+0x71/0x360
     [<ffffffff81214079>] blkdev_put+0x49/0x170
     [<ffffffff812141c0>] blkdev_close+0x20/0x30
     [<ffffffff811d48e8>] __fput+0xe8/0x1f0
     [<ffffffff811d4a29>] ____fput+0x9/0x10
     [<ffffffff810842d3>] task_work_run+0x83/0xb0
     [<ffffffff8106606e>] do_exit+0x3ee/0xc40
     [<ffffffff8106694b>] do_group_exit+0x4b/0xc0
     [<ffffffff81073d9a>] get_signal+0x2ca/0x940
     [<ffffffff8101bf43>] do_signal+0x23/0x660
     [<ffffffff810022b3>] exit_to_usermode_loop+0x73/0xb0
     [<ffffffff81002cb0>] syscall_return_slowpath+0xb0/0xc0
     [<ffffffff81624e33>] entry_SYSCALL_64_fastpath+0xa6/0xa8

    Signed-off-by: Bart Van Assche <bart.vanassche@sandisk.com>
    Acked-by: Mike Snitzer <snitzer@redhat.com>
    Reviewed-by: Hannes Reinecke <hare@suse.com>
    Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Signed-off-by: Jens Axboe <axboe@fb.com>

diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 09c958b6f038..8b92e066bb69 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -102,7 +102,7 @@ static void dm_mq_stop_queue(struct request_queue *q)
        if (blk_mq_queue_stopped(q))
                return;

-       blk_mq_stop_hw_queues(q);
+       blk_mq_quiesce_queue(q);
 }

 void dm_stop_queue(struct request_queue *q)
@@ -880,17 +880,6 @@ static int dm_mq_queue_rq(struct blk_mq_hw_ctx *hctx,
                dm_put_live_table(md, srcu_idx);
        }

-       /*
-        * On suspend dm_stop_queue() handles stopping the blk-mq
-        * request_queue BUT: even though the hw_queues are marked
-        * BLK_MQ_S_STOPPED at that point there is still a race that
-        * is allowing block/blk-mq.c to call ->queue_rq against a
-        * hctx that it really shouldn't.  The following check guards
-        * against this rarity (albeit _not_ race-free).
-        */
-       if (unlikely(test_bit(BLK_MQ_S_STOPPED, &hctx->state)))
-               return BLK_MQ_RQ_QUEUE_BUSY;
-
        if (ti->type->busy && ti->type->busy(ti))
                return BLK_MQ_RQ_QUEUE_BUSY;


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

