Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5D01B201DFF
	for <lists+dm-devel@lfdr.de>; Sat, 20 Jun 2020 00:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592605493;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zn2+fEmAKYxtahyCb1Ln1A3B6SCI3gV13qdiv2k7K00=;
	b=jRa1AIzTNXBZI1NPTG6u8neWg/a0EI8XscNzDJLO3SRofquXXtY9MRBR5Cf88a+VHzDC6i
	jmb2c0OdWK27KXYeL6KPOShMXjW3HmkLWRhk4G4J8Kqz6mzzp/7UnJYpt0f36gyZc8RQ0U
	ls3da7+7HKkTHUH6qRtPDLy5E8sXRgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-nn7BRoDCPsmeEHD0KycrUA-1; Fri, 19 Jun 2020 18:24:51 -0400
X-MC-Unique: nn7BRoDCPsmeEHD0KycrUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 201E31883619;
	Fri, 19 Jun 2020 22:24:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32DB019D9E;
	Fri, 19 Jun 2020 22:24:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F05FB833C8;
	Fri, 19 Jun 2020 22:24:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JMOFsc017764 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 18:24:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 157185D9E8; Fri, 19 Jun 2020 22:24:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-19.pek2.redhat.com [10.72.12.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ADDE5D9E5;
	Fri, 19 Jun 2020 22:24:03 +0000 (UTC)
Date: Sat, 20 Jun 2020 06:23:59 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200619222359.GA353853@T590>
References: <20200619084214.337449-1-ming.lei@redhat.com>
	<20200619094250.GA18410@redhat.com> <20200619101142.GA339442@T590>
	<20200619160657.GA24520@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619160657.GA24520@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, dm-devel@redhat.com
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

On Fri, Jun 19, 2020 at 12:06:57PM -0400, Mike Snitzer wrote:
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

Freezing shouldn't be a good choice for driver usually, and quiesce is
exactly what you expect: request allocation is allowed, meantime, no
.queue_rq is possible.

> 
> > > > dm_stop_queue() actually tries to quiesce hw queues via blk_mq_quiesce_queue(),
> > > > we can't check via blk_queue_quiesced for avoiding unnecessary queue
> > > > quiesce because the flag is set before synchronize_rcu() and dm_stop_queue
> > > > may be called when synchronize_rcu from another blk_mq_quiesce_queue is
> > > > in-progress.
> > > 
> > > But I'm left with questions/confusion on this too:
> > > 
> > > 1) you mention blk_queue_quiesced instead of blk_mq_queue_stopped, so I
> > >    assume you mean that: not only is blk_mq_queue_stopped()
> > >    ineffective, blk_queue_quiesced() would be too?
> > 
> > blk_mq_queue_stopped isn't necessary because dm-rq's hw queue won't be
> > stopped by anyone, meantime replacing it with blk_queue_quiesced() is wrong.
> > 
> > > 
> > > 2) the race you detail (with competing blk_mq_quiesce_queue) relative to
> > >    synchronize_rcu() and testing "the flag" is very detailed yet vague.
> > 
> > If two code paths are calling dm_stop_queue() at the same time, one path may
> > return immediately and it is wrong, sine synchronize_rcu() from another path
> > may not be done.
> > 
> > > 
> > > Anyway, once we get this heaader cleaned up a bit more I'll be happy to
> > > get this staged as a stable@ fix for 5.8 inclusion ASAP.
> > 
> > This patch isn't a fix, and it shouldn't be related with rhel8's issue.
> 
> I realize that now.  I've changed the patch header to be a bit clearer
> and staged it for 5.9, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.9&id=06e788ed59e0095b679bdce9e39c1a251032ae62

Thanks!

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

