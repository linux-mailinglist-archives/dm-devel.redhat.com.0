Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E9E1420EA94
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 03:06:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-wSmsv2pNPeOu6Z8HxDaBSA-1; Mon, 29 Jun 2020 21:05:56 -0400
X-MC-Unique: wSmsv2pNPeOu6Z8HxDaBSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 491FEBFC2;
	Tue, 30 Jun 2020 01:05:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDBF29CFF1;
	Tue, 30 Jun 2020 01:05:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6BE387595;
	Tue, 30 Jun 2020 01:05:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U15MlI030734 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 21:05:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43427110DA03; Tue, 30 Jun 2020 01:05:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E8D8110DA12
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 01:05:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D07F924904
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 01:05:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-468-xFze1OXYOpmIuD77aUUibw-1;
	Mon, 29 Jun 2020 21:05:17 -0400
X-MC-Unique: xFze1OXYOpmIuD77aUUibw-1
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
	[66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AD71B20781;
	Tue, 30 Jun 2020 00:58:54 +0000 (UTC)
Date: Mon, 29 Jun 2020 20:58:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20200629205853.38628a63@oasis.local.home>
In-Reply-To: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05U15MlI030734
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, fangguoju@gmail.com, rdunlap@infradead.org,
	ming.lei@redhat.com, linux-block@vger.kernel.org,
	dm-devel@redhat.com, mingo@redhat.com, colyli@suse.de,
	jack@suse.czi, hch@lst.de, agk@redhat.com, bvanassche@acm.org
Subject: Re: [dm-devel] [PATCH 00/10] block: blktrace framework cleanup
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

On Mon, 29 Jun 2020 16:43:03 -0700
Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com> wrote:

> Hi,
> 
> There are many places where trace API accepts the struct request_queue*
> parameter which can be derived from other function parameters.
> 
> This patch-series removes the struct request queue parameter from the
> blktrace framework and adjusts the tracepoints definition and usage
> along with the tracing API itself.
> 
> Also with the queue parameter removed now we can merge some of the trace
> events with creating generic event class for bio based tarce events.
> 
> Finally few of more cleanups to remove the trace_block_rq_insert()
> wrapper blk_mq_sched_request_inserted(), get rid of the extra parameter
> for trace_block_getrq, remove the blk_trace_request_get_cgid(),
> fix tracepoint comment header,  and blk_fill_rwbs() related triggred
> cleanup.
> 
> I've added patches after first cleanup as I scan the code for more
> cleanup. I think patch distribution can be better but it will be great
> to have some feedback as the amount of clenaup has grown bigger.
> 
> Any comments are welcome.
> 
> Regards,
> Chaitanya
> 
> Chaitanya Kulkarni (11):
>   block: blktrace framework cleanup
>   block: rename block_bio_merge class to block_bio
>   block: use block_bio event class for bio_queue
>   block: use block_bio event class for bio_bounce
>   block: get rid of the trace rq insert wrapper
>   block: remove extra param for trace_block_getrq()
>   block: get rid of blk_trace_request_get_cgid()
>   block: fix the comments in the trace event block.h
>   block: remove unsed param in blk_fill_rwbs()
>   block: use block_bio class for getrq and sleeprq
>   block: remove block_get_rq event class

>From a tracing perspective:

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve


> 
>  block/bfq-iosched.c           |   4 +-
>  block/blk-core.c              |   6 +-
>  block/blk-merge.c             |   4 +-
>  block/blk-mq-sched.c          |   6 -
>  block/blk-mq-sched.h          |   1 -
>  block/blk-mq.c                |  10 +-
>  block/bounce.c                |   2 +-
>  block/kyber-iosched.c         |   4 +-
>  block/mq-deadline.c           |   4 +-
>  drivers/md/dm.c               |   4 +-
>  include/linux/blktrace_api.h  |   2 +-
>  include/trace/events/bcache.h |  10 +-
>  include/trace/events/block.h  | 226 +++++++++++-----------------------
>  kernel/trace/blktrace.c       | 129 +++++++++----------
>  14 files changed, 161 insertions(+), 251 deletions(-)
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

