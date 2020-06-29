Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7098D20F784
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-4NHYeWXgPyaN7mx-zIXsag-1; Tue, 30 Jun 2020 10:49:06 -0400
X-MC-Unique: 4NHYeWXgPyaN7mx-zIXsag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D79EB107B267;
	Tue, 30 Jun 2020 14:48:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B34672B472;
	Tue, 30 Jun 2020 14:48:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 773031809542;
	Tue, 30 Jun 2020 14:48:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNhOd2020306 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:43:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12D122156709; Mon, 29 Jun 2020 23:43:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E9162156A4F
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:43:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13D73800260
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 23:43:22 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-224-p_WW_hBXOk6mZdp6NgC_PQ-1; Mon, 29 Jun 2020 19:43:19 -0400
X-MC-Unique: p_WW_hBXOk6mZdp6NgC_PQ-1
IronPort-SDR: zD9KqV1lgSf4XjdmaFBEgqQQDYLQYNah4j0Uqb4ki+CQIj4+ZBypTpIV5Q2EaeloUpvbScXxM5
	u75hkwgKYWIR/z3mAo4TSxxFrWq+KqXEoskmTUGANgXwJgPhkaPWeizrViwml+nCCX7TmZorU6
	D4oWUAubMDC2Fa5cACU6Xz8lW7OcQksDnTds57dXMoXdipBD635g9+z9x5jSXKxDZpZ8H0U9nH
	k4kEEjdaxaOtrVGgyTYZH5DZ2fSw54B9XJX02r1FKDcdinSmjyqISmb6Zxxj+D1ZTm2vRXxfM4
	o8k=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="145544703"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 07:43:18 +0800
IronPort-SDR: ecG2bDU3D4sh5BbX4b2veMD6Yg2w5/vTbOrXZCvLpYGRMdptDkb8kHz0Xp0DLeFN0N4YyXE0Nz
	mpgci6GPJwOTnEm3LPd4x+uvWHyJRZalU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	29 Jun 2020 16:31:37 -0700
IronPort-SDR: cdZUopfc86SzUbc+do8Bt/k3tYAC+fjpzS1YCOddzou9iU5sux+DCySCmUpRnd8k3W+iGrHmAT
	9O3G2G7A9rIw==
WDCIronportException: Internal
Received: from iouring.labspan.wdc.com (HELO iouring.sc.wdc.com)
	([10.6.138.107])
	by uls-op-cesaip01.wdc.com with ESMTP; 29 Jun 2020 16:43:17 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, dm-devel@redhat.com
Date: Mon, 29 Jun 2020 16:43:03 -0700
Message-Id: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jun 2020 10:48:45 -0400
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	fangguoju@gmail.com, rdunlap@infradead.org, rostedt@goodmis.org,
	ming.lei@redhat.com, mingo@redhat.com, colyli@suse.de,
	jack@suse.czi, hch@lst.de, agk@redhat.com, bvanassche@acm.org
Subject: [dm-devel] [PATCH 00/10] block: blktrace framework cleanup
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

There are many places where trace API accepts the struct request_queue*
parameter which can be derived from other function parameters.

This patch-series removes the struct request queue parameter from the
blktrace framework and adjusts the tracepoints definition and usage
along with the tracing API itself.

Also with the queue parameter removed now we can merge some of the trace
events with creating generic event class for bio based tarce events.

Finally few of more cleanups to remove the trace_block_rq_insert()
wrapper blk_mq_sched_request_inserted(), get rid of the extra parameter
for trace_block_getrq, remove the blk_trace_request_get_cgid(),
fix tracepoint comment header,  and blk_fill_rwbs() related triggred
cleanup.

I've added patches after first cleanup as I scan the code for more
cleanup. I think patch distribution can be better but it will be great
to have some feedback as the amount of clenaup has grown bigger.

Any comments are welcome.

Regards,
Chaitanya

Chaitanya Kulkarni (11):
  block: blktrace framework cleanup
  block: rename block_bio_merge class to block_bio
  block: use block_bio event class for bio_queue
  block: use block_bio event class for bio_bounce
  block: get rid of the trace rq insert wrapper
  block: remove extra param for trace_block_getrq()
  block: get rid of blk_trace_request_get_cgid()
  block: fix the comments in the trace event block.h
  block: remove unsed param in blk_fill_rwbs()
  block: use block_bio class for getrq and sleeprq
  block: remove block_get_rq event class

 block/bfq-iosched.c           |   4 +-
 block/blk-core.c              |   6 +-
 block/blk-merge.c             |   4 +-
 block/blk-mq-sched.c          |   6 -
 block/blk-mq-sched.h          |   1 -
 block/blk-mq.c                |  10 +-
 block/bounce.c                |   2 +-
 block/kyber-iosched.c         |   4 +-
 block/mq-deadline.c           |   4 +-
 drivers/md/dm.c               |   4 +-
 include/linux/blktrace_api.h  |   2 +-
 include/trace/events/bcache.h |  10 +-
 include/trace/events/block.h  | 226 +++++++++++-----------------------
 kernel/trace/blktrace.c       | 129 +++++++++----------
 14 files changed, 161 insertions(+), 251 deletions(-)

-- 
2.26.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

