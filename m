Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id AB1D120ED3D
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 07:13:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-5K0Tq6_JMKCRRkrZNsdXkg-1; Tue, 30 Jun 2020 01:13:03 -0400
X-MC-Unique: 5K0Tq6_JMKCRRkrZNsdXkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1FEF8015F5;
	Tue, 30 Jun 2020 05:12:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4D1B10013C1;
	Tue, 30 Jun 2020 05:12:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A796180954D;
	Tue, 30 Jun 2020 05:12:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U5Csbi026416 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 01:12:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B1902156A2D; Tue, 30 Jun 2020 05:12:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 070F32157F25
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:12:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1536F858EE2
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:12:52 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-117-TiEmLlyTPv2Y-x69oBJSUA-1;
	Tue, 30 Jun 2020 01:12:49 -0400
X-MC-Unique: TiEmLlyTPv2Y-x69oBJSUA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 38B936736F; Tue, 30 Jun 2020 07:12:47 +0200 (CEST)
Date: Tue, 30 Jun 2020 07:12:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20200630051247.GF27033@lst.de>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-10-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20200629234314.10509-10-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, fangguoju@gmail.com, rdunlap@infradead.org,
	rostedt@goodmis.org, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	mingo@redhat.com, colyli@suse.de, jack@suse.czi, hch@lst.de,
	agk@redhat.com, bvanassche@acm.org
Subject: Re: [dm-devel] [PATCH 09/11] block: remove unsed param in
	blk_fill_rwbs()
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

On Mon, Jun 29, 2020 at 04:43:12PM -0700, Chaitanya Kulkarni wrote:
> The last parameter for the function blk_fill_rwbs() was added in
> 5782138e47 ("tracing/events: convert block trace points to
> TRACE_EVENT()") in order to signal read request and use of that parameter
> was replaced with using switch case REQ_OP_READ with
> 1b9a9ab78b0 ("blktrace: use op accessors"), but the parameter was never
> removed.
> 
> This patch removes unused parameter which also allows us to merge existing
> trace points in the following patch.
> 
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> ---
>  include/linux/blktrace_api.h  |  2 +-
>  include/trace/events/bcache.h | 10 +++++-----
>  include/trace/events/block.h  | 19 +++++++++----------
>  kernel/trace/blktrace.c       |  2 +-
>  4 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/blktrace_api.h b/include/linux/blktrace_api.h
> index 3b6ff5902edc..80123eebf005 100644
> --- a/include/linux/blktrace_api.h
> +++ b/include/linux/blktrace_api.h
> @@ -120,7 +120,7 @@ struct compat_blk_user_trace_setup {
>  
>  #endif
>  
> -extern void blk_fill_rwbs(char *rwbs, unsigned int op, int bytes);
> +extern void blk_fill_rwbs(char *rwbs, unsigned int op);

You might want to drop the extern while you're at it.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

