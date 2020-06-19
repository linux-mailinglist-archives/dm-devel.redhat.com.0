Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 50DCF20061B
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 12:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592561686;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NERFW9NvDc6u0O+7ciCsvYGMoFJEvSCkia5PLUjrzU0=;
	b=H7xPS9P8yUs93k9IXv+H+ysdbiK4UYaRrJMQT//2+TIlAnReWVj6iktqJjhmK10P7byPjH
	fs8fY8HZQqtV5tJdfd5xL86lIhnx7WrX0GK1hWZkZZWRhK5IMlhQYD6MYFapJX+qw7Am9k
	MjLWScbnbhhnZGGU+tNSd+kMosVBSJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-T_jGFzX6Mymhahuyf-1h-A-1; Fri, 19 Jun 2020 06:14:44 -0400
X-MC-Unique: T_jGFzX6Mymhahuyf-1h-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D34A872FF1;
	Fri, 19 Jun 2020 10:14:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E191A5BAD3;
	Fri, 19 Jun 2020 10:14:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 882C41809547;
	Fri, 19 Jun 2020 10:14:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JABveH009265 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 06:11:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6072F5BAC3; Fri, 19 Jun 2020 10:11:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-44.pek2.redhat.com [10.72.12.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F6F5BAC1;
	Fri, 19 Jun 2020 10:11:46 +0000 (UTC)
Date: Fri, 19 Jun 2020 18:11:42 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200619101142.GA339442@T590>
References: <20200619084214.337449-1-ming.lei@redhat.com>
	<20200619094250.GA18410@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619094250.GA18410@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Mike,

On Fri, Jun 19, 2020 at 05:42:50AM -0400, Mike Snitzer wrote:
> Hi Ming,
> 
> Thanks for the patch!  But I'm having a hard time understanding what
> you've written in the patch header,
> 
> On Fri, Jun 19 2020 at  4:42am -0400,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > dm-rq won't stop queue, meantime blk-mq won't stop one queue too, so
> > remove the check.
> 
> It'd be helpful if you could unpack this with more detail before going on
> to explain why using blk_queue_quiesced, despite dm-rq using
> blk_mq_queue_stopped, would also be ineffective.
> 
> SO:
> 
> > dm-rq won't stop queue
> 
> 1) why won't dm-rq stop the queue?  Do you mean it won't reliably
>    _always_ stop the queue because of the blk_mq_queue_stopped() check?

device mapper doesn't call blk_mq_stop_hw_queue or blk_mq_stop_hw_queues.

> 
> > meantime blk-mq won't stop one queue too, so remove the check.
> 
> 2) Meaning?: blk_mq_queue_stopped() will return true even if only one hw
> queue is stopped, given blk-mq must stop all hw queues a positive return
> from this blk_mq_queue_stopped() check is incorrectly assuming it meanss
> all hw queues are stopped.

blk-mq won't call blk_mq_stop_hw_queue or blk_mq_stop_hw_queues for
dm-rq's queue too, so dm-rq's hw queue won't be stopped.

BTW blk_mq_stop_hw_queue or blk_mq_stop_hw_queues are supposed to be
used for throttling queue.

> 
> > dm_stop_queue() actually tries to quiesce hw queues via blk_mq_quiesce_queue(),
> > we can't check via blk_queue_quiesced for avoiding unnecessary queue
> > quiesce because the flag is set before synchronize_rcu() and dm_stop_queue
> > may be called when synchronize_rcu from another blk_mq_quiesce_queue is
> > in-progress.
> 
> But I'm left with questions/confusion on this too:
> 
> 1) you mention blk_queue_quiesced instead of blk_mq_queue_stopped, so I
>    assume you mean that: not only is blk_mq_queue_stopped()
>    ineffective, blk_queue_quiesced() would be too?

blk_mq_queue_stopped isn't necessary because dm-rq's hw queue won't be
stopped by anyone, meantime replacing it with blk_queue_quiesced() is wrong.

> 
> 2) the race you detail (with competing blk_mq_quiesce_queue) relative to
>    synchronize_rcu() and testing "the flag" is very detailed yet vague.

If two code paths are calling dm_stop_queue() at the same time, one path may
return immediately and it is wrong, sine synchronize_rcu() from another path
may not be done.

> 
> Anyway, once we get this heaader cleaned up a bit more I'll be happy to
> get this staged as a stable@ fix for 5.8 inclusion ASAP.

This patch isn't a fix, and it shouldn't be related with rhel8's issue.

Thanks,
Ming

> 
> Thanks!
> Mike
> 
> > 
> > Cc: linux-block@vger.kernel.org
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> > ---
> >  drivers/md/dm-rq.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
> > index f60c02512121..ed4d5ea66ccc 100644
> > --- a/drivers/md/dm-rq.c
> > +++ b/drivers/md/dm-rq.c
> > @@ -70,9 +70,6 @@ void dm_start_queue(struct request_queue *q)
> >  
> >  void dm_stop_queue(struct request_queue *q)
> >  {
> > -	if (blk_mq_queue_stopped(q))
> > -		return;
> > -
> >  	blk_mq_quiesce_queue(q);
> >  }
> >  
> > -- 
> > 2.25.2
> > 

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

