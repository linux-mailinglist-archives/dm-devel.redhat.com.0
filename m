Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 21A852005A2
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 11:44:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592559856;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VZrkdSm1SOff2YpclvIwRisZ1qvfQcpHajd6Efv2QSY=;
	b=UoIsV19blsPWy+c8TsgKjzAFIJ0G6dLpQVuv7qYQZngMNsBYk523HKy10l3rGttRNQvtHF
	j/1BL1oSuMSqRIYuLtBzQFbvlzcpjGW2e80sscg/1xyqCLLyQGtiB8X0EB9XCJZorKSLYD
	Qw3B/kJdCZhei+bbFM9cJJDK+krm8qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-9LNdXn1BP-u4RIdOzDnqrA-1; Fri, 19 Jun 2020 05:43:30 -0400
X-MC-Unique: 9LNdXn1BP-u4RIdOzDnqrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A61D464;
	Fri, 19 Jun 2020 09:43:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB30610013C4;
	Fri, 19 Jun 2020 09:43:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CECE1CA6;
	Fri, 19 Jun 2020 09:43:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J9h0FQ005453 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 05:43:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 647B05C1D0; Fri, 19 Jun 2020 09:43:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DA9D5C1D6;
	Fri, 19 Jun 2020 09:42:51 +0000 (UTC)
Date: Fri, 19 Jun 2020 05:42:50 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20200619094250.GA18410@redhat.com>
References: <20200619084214.337449-1-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200619084214.337449-1-ming.lei@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Ming,

Thanks for the patch!  But I'm having a hard time understanding what
you've written in the patch header,

On Fri, Jun 19 2020 at  4:42am -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> dm-rq won't stop queue, meantime blk-mq won't stop one queue too, so
> remove the check.

It'd be helpful if you could unpack this with more detail before going on
to explain why using blk_queue_quiesced, despite dm-rq using
blk_mq_queue_stopped, would also be ineffective.

SO:

> dm-rq won't stop queue

1) why won't dm-rq stop the queue?  Do you mean it won't reliably
   _always_ stop the queue because of the blk_mq_queue_stopped() check?

> meantime blk-mq won't stop one queue too, so remove the check.

2) Meaning?: blk_mq_queue_stopped() will return true even if only one hw
queue is stopped, given blk-mq must stop all hw queues a positive return
from this blk_mq_queue_stopped() check is incorrectly assuming it meanss
all hw queues are stopped.

> dm_stop_queue() actually tries to quiesce hw queues via blk_mq_quiesce_queue(),
> we can't check via blk_queue_quiesced for avoiding unnecessary queue
> quiesce because the flag is set before synchronize_rcu() and dm_stop_queue
> may be called when synchronize_rcu from another blk_mq_quiesce_queue is
> in-progress.

But I'm left with questions/confusion on this too:

1) you mention blk_queue_quiesced instead of blk_mq_queue_stopped, so I
   assume you mean that: not only is blk_mq_queue_stopped()
   ineffective, blk_queue_quiesced() would be too?

2) the race you detail (with competing blk_mq_quiesce_queue) relative to
   synchronize_rcu() and testing "the flag" is very detailed yet vague.

Anyway, once we get this heaader cleaned up a bit more I'll be happy to
get this staged as a stable@ fix for 5.8 inclusion ASAP.

Thanks!
Mike

> 
> Cc: linux-block@vger.kernel.org
> Signed-off-by: Ming Lei <ming.lei@redhat.com>
> ---
>  drivers/md/dm-rq.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
> index f60c02512121..ed4d5ea66ccc 100644
> --- a/drivers/md/dm-rq.c
> +++ b/drivers/md/dm-rq.c
> @@ -70,9 +70,6 @@ void dm_start_queue(struct request_queue *q)
>  
>  void dm_stop_queue(struct request_queue *q)
>  {
> -	if (blk_mq_queue_stopped(q))
> -		return;
> -
>  	blk_mq_quiesce_queue(q);
>  }
>  
> -- 
> 2.25.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

