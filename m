Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DAFE3201E3E
	for <lists+dm-devel@lfdr.de>; Sat, 20 Jun 2020 00:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592607200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ma7gyw3XBfC5ZWRgID6YU3SGCBaZVjkmozHgawWrOJI=;
	b=Dl3BHix8nKbS3lp9xtOXppGu2CEu52rNNcFSnw2OyuN5AGJu3qrB3zYQVSitXI/BIG+q+I
	Y2g9/cGpkaRSn9cYG6VbvvQF5Wzf84L80a/zqMmyfoRU8wfv3Mx1QNjiqjdxZtRy03Jg2Z
	YgbsnEbPwNdaI6Cg8zv7sa0bd8c+t+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-QQpihy3kP8qPaF8ydDAFgg-1; Fri, 19 Jun 2020 18:53:18 -0400
X-MC-Unique: QQpihy3kP8qPaF8ydDAFgg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D89CD107ACCD;
	Fri, 19 Jun 2020 22:53:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F9145D9E8;
	Fri, 19 Jun 2020 22:53:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F22D833CB;
	Fri, 19 Jun 2020 22:53:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JMqv1b021491 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 18:52:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF39E1000329; Fri, 19 Jun 2020 22:52:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-19.pek2.redhat.com [10.72.12.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 620DF1001E91;
	Fri, 19 Jun 2020 22:52:46 +0000 (UTC)
Date: Sat, 20 Jun 2020 06:52:41 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200619225241.GC353853@T590>
References: <20200619084214.337449-1-ming.lei@redhat.com>
	<20200619094250.GA18410@redhat.com> <20200619101142.GA339442@T590>
	<20200619160657.GA24520@redhat.com>
	<20200619174040.GA24968@redhat.com> <20200619223744.GB353853@T590>
MIME-Version: 1.0
In-Reply-To: <20200619223744.GB353853@T590>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Jun 20, 2020 at 06:37:44AM +0800, Ming Lei wrote:
> On Fri, Jun 19, 2020 at 01:40:41PM -0400, Mike Snitzer wrote:
> > On Fri, Jun 19 2020 at 12:06pm -0400,
> > Mike Snitzer <snitzer@redhat.com> wrote:
> > 
> > > On Fri, Jun 19 2020 at  6:11am -0400,
> > > Ming Lei <ming.lei@redhat.com> wrote:
> > > 
> > > > Hi Mike,
> > > > 
> > > > On Fri, Jun 19, 2020 at 05:42:50AM -0400, Mike Snitzer wrote:
> > > > > Hi Ming,
> > > > > 
> > > > > Thanks for the patch!  But I'm having a hard time understanding what
> > > > > you've written in the patch header,
> > > > > 
> > > > > On Fri, Jun 19 2020 at  4:42am -0400,
> > > > > Ming Lei <ming.lei@redhat.com> wrote:
> > > > > 
> > > > > > dm-rq won't stop queue, meantime blk-mq won't stop one queue too, so
> > > > > > remove the check.
> > > > > 
> > > > > It'd be helpful if you could unpack this with more detail before going on
> > > > > to explain why using blk_queue_quiesced, despite dm-rq using
> > > > > blk_mq_queue_stopped, would also be ineffective.
> > > > > 
> > > > > SO:
> > > > > 
> > > > > > dm-rq won't stop queue
> > > > > 
> > > > > 1) why won't dm-rq stop the queue?  Do you mean it won't reliably
> > > > >    _always_ stop the queue because of the blk_mq_queue_stopped() check?
> > > > 
> > > > device mapper doesn't call blk_mq_stop_hw_queue or blk_mq_stop_hw_queues.
> > > > 
> > > > > 
> > > > > > meantime blk-mq won't stop one queue too, so remove the check.
> > > > > 
> > > > > 2) Meaning?: blk_mq_queue_stopped() will return true even if only one hw
> > > > > queue is stopped, given blk-mq must stop all hw queues a positive return
> > > > > from this blk_mq_queue_stopped() check is incorrectly assuming it meanss
> > > > > all hw queues are stopped.
> > > > 
> > > > blk-mq won't call blk_mq_stop_hw_queue or blk_mq_stop_hw_queues for
> > > > dm-rq's queue too, so dm-rq's hw queue won't be stopped.
> > > > 
> > > > BTW blk_mq_stop_hw_queue or blk_mq_stop_hw_queues are supposed to be
> > > > used for throttling queue.
> > > 
> > > I'm going to look at actually stopping the queue (using one of these
> > > interfaces).  I didn't realize I wasn't actually stopping the queue.
> > > The intent was to do so.
> > > 
> > > In speaking with Jens yesterday about freeze vs stop: it is clear that
> > > dm-rq needs to still be able to allocate new requests, but _not_ call
> > > the queue_rq to issue the requests, while "stopped" (due to dm-mpath
> > > potentially deferring retries of failed requests because of path failure
> > > while quiescing the queue during DM device suspend).  But that freezing
> > > the queue goes too far because it won't allow such request allocation.
> > 
> > Seems I'm damned if I do (stop) or damned if I don't (new reports of
> > requests completing after DM device suspend's
> > blk_mq_quiesce_queue()+dm_wait_for_completion()).
> 
> request(but not new) completing is possible after blk_mq_quiesce_queue()+
> dm_wait_for_completion, because blk_mq_rq_inflight() only checks INFLIGHT
> request. If all requests are marked as MQ_RQ_COMPLETE, blk_mq_rq_inflight()
> still may return false. However, MQ_RQ_COMPLETE is one transient state.
> 
> So what does dm-rq expect from dm_wait_for_completion()?
> 
> If it is just no new request entering dm_queue_rq(), there shouldn't be
> issue.
> 
> If dm-rq hopes there aren't any real inflight request(MQ_RQ_COMPLETE &
> MQ_RQ_INFLIGHT), we can change blk_mq_rq_inflight to support that.

Hi Mike,

Please test the following patch and see if the issue can be fixed:

>From faf0f9f15627446e8c35db518e37a4a2e4323eb2 Mon Sep 17 00:00:00 2001
From: Ming Lei <ming.lei@redhat.com>
Date: Sat, 20 Jun 2020 06:45:49 +0800
Subject: [PATCH] blk-mq: cover request of MQ_RQ_COMPLETE as inflight in
 blk_mq_rq_inflight

When request is marked as MQ_RQ_COMPLETE, ->complete isn't called & done
yet, and driver may expect that there isn't any driver related activity since
blk_mq_queue_inflight() returns.

Fixes it by covering request of MQ_RQ_COMPLETE as inflight in blk_mq_rq_inflight().

Cc: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-mq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 4f57d27bfa73..7bc084b5bc37 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -831,7 +831,7 @@ static bool blk_mq_rq_inflight(struct blk_mq_hw_ctx *hctx, struct request *rq,
 	 * If we find a request that is inflight and the queue matches,
 	 * we know the queue is busy. Return false to stop the iteration.
 	 */
-	if (rq->state == MQ_RQ_IN_FLIGHT && rq->q == hctx->queue) {
+	if (rq->state != MQ_RQ_IDLE && rq->q == hctx->queue) {
 		bool *busy = priv;
 
 		*busy = true;
-- 
2.25.2



Thanks, 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

