Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 82D58201E16
	for <lists+dm-devel@lfdr.de>; Sat, 20 Jun 2020 00:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592606303;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5KPTJrMB+f65dvhtNrRhdXcYXW6oEFx9GNh4/g8OeYM=;
	b=CG4oE9+HzjiaAq9rMa6iAM3w1dwTWJvSS6SXPFXo3BrXz9kjbvRuvdh9273R23XLGMU3Xf
	xfOaSxdJ4UEIYtPx5upt37KLUBRSz7XakzTa11x5meAvI2HQwP6UODYonZbicNkcMx1e9Y
	RB2kMEE+DCyY5Q16VUvac//HYoVp99g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-xMgdM-8wPIaXYNJTw4wh0A-1; Fri, 19 Jun 2020 18:38:21 -0400
X-MC-Unique: xMgdM-8wPIaXYNJTw4wh0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F1B3107ACCD;
	Fri, 19 Jun 2020 22:38:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35D0C10021B3;
	Fri, 19 Jun 2020 22:38:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0548E833CB;
	Fri, 19 Jun 2020 22:38:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JMc024018847 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 18:38:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D04EC5BAC7; Fri, 19 Jun 2020 22:38:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-19.pek2.redhat.com [10.72.12.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9BEA5BAD1;
	Fri, 19 Jun 2020 22:37:49 +0000 (UTC)
Date: Sat, 20 Jun 2020 06:37:44 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200619223744.GB353853@T590>
References: <20200619084214.337449-1-ming.lei@redhat.com>
	<20200619094250.GA18410@redhat.com> <20200619101142.GA339442@T590>
	<20200619160657.GA24520@redhat.com>
	<20200619174040.GA24968@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619174040.GA24968@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jun 19, 2020 at 01:40:41PM -0400, Mike Snitzer wrote:
> On Fri, Jun 19 2020 at 12:06pm -0400,
> Mike Snitzer <snitzer@redhat.com> wrote:
> 
> > On Fri, Jun 19 2020 at  6:11am -0400,
> > Ming Lei <ming.lei@redhat.com> wrote:
> > 
> > > Hi Mike,
> > > 
> > > On Fri, Jun 19, 2020 at 05:42:50AM -0400, Mike Snitzer wrote:
> > > > Hi Ming,
> > > > 
> > > > Thanks for the patch!  But I'm having a hard time understanding what
> > > > you've written in the patch header,
> > > > 
> > > > On Fri, Jun 19 2020 at  4:42am -0400,
> > > > Ming Lei <ming.lei@redhat.com> wrote:
> > > > 
> > > > > dm-rq won't stop queue, meantime blk-mq won't stop one queue too, so
> > > > > remove the check.
> > > > 
> > > > It'd be helpful if you could unpack this with more detail before going on
> > > > to explain why using blk_queue_quiesced, despite dm-rq using
> > > > blk_mq_queue_stopped, would also be ineffective.
> > > > 
> > > > SO:
> > > > 
> > > > > dm-rq won't stop queue
> > > > 
> > > > 1) why won't dm-rq stop the queue?  Do you mean it won't reliably
> > > >    _always_ stop the queue because of the blk_mq_queue_stopped() check?
> > > 
> > > device mapper doesn't call blk_mq_stop_hw_queue or blk_mq_stop_hw_queues.
> > > 
> > > > 
> > > > > meantime blk-mq won't stop one queue too, so remove the check.
> > > > 
> > > > 2) Meaning?: blk_mq_queue_stopped() will return true even if only one hw
> > > > queue is stopped, given blk-mq must stop all hw queues a positive return
> > > > from this blk_mq_queue_stopped() check is incorrectly assuming it meanss
> > > > all hw queues are stopped.
> > > 
> > > blk-mq won't call blk_mq_stop_hw_queue or blk_mq_stop_hw_queues for
> > > dm-rq's queue too, so dm-rq's hw queue won't be stopped.
> > > 
> > > BTW blk_mq_stop_hw_queue or blk_mq_stop_hw_queues are supposed to be
> > > used for throttling queue.
> > 
> > I'm going to look at actually stopping the queue (using one of these
> > interfaces).  I didn't realize I wasn't actually stopping the queue.
> > The intent was to do so.
> > 
> > In speaking with Jens yesterday about freeze vs stop: it is clear that
> > dm-rq needs to still be able to allocate new requests, but _not_ call
> > the queue_rq to issue the requests, while "stopped" (due to dm-mpath
> > potentially deferring retries of failed requests because of path failure
> > while quiescing the queue during DM device suspend).  But that freezing
> > the queue goes too far because it won't allow such request allocation.
> 
> Seems I'm damned if I do (stop) or damned if I don't (new reports of
> requests completing after DM device suspend's
> blk_mq_quiesce_queue()+dm_wait_for_completion()).

request(but not new) completing is possible after blk_mq_quiesce_queue()+
dm_wait_for_completion, because blk_mq_rq_inflight() only checks INFLIGHT
request. If all requests are marked as MQ_RQ_COMPLETE, blk_mq_rq_inflight()
still may return false. However, MQ_RQ_COMPLETE is one transient state.

So what does dm-rq expect from dm_wait_for_completion()?

If it is just no new request entering dm_queue_rq(), there shouldn't be
issue.

If dm-rq hopes there aren't any real inflight request(MQ_RQ_COMPLETE &
MQ_RQ_INFLIGHT), we can change blk_mq_rq_inflight to support that.


Thanks, 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

