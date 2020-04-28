Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFC71BC692
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 19:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588094757;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=thirkNPU9k5q6tNk8DxUsBL648ti+L0vBVqTsZOeLis=;
	b=Zu4Z/vw99Lbs0EN41QkNKMAQ0J8lf7f/QweBJHGjkjVa0CcGBnN67+X74hzU6msXYDrHMZ
	4OXoIgs4Nyg+8WXrsq1Ur/tc+FxgpACI/wR4GesKFpmGwNJ+1kmyOmWcxDXG4RfIFTkOqN
	ezzkmxBq+FYWplUPLgiQG7UR2GsY3pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-Bu9QjLyKO0uc7rjXD8RIvQ-1; Tue, 28 Apr 2020 13:25:53 -0400
X-MC-Unique: Bu9QjLyKO0uc7rjXD8RIvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91478107ACCA;
	Tue, 28 Apr 2020 17:25:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03DE460CD3;
	Tue, 28 Apr 2020 17:25:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11A044CAA0;
	Tue, 28 Apr 2020 17:25:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SHPc3f019082 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 13:25:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A5E55D9F1; Tue, 28 Apr 2020 17:25:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D17185D9E5;
	Tue, 28 Apr 2020 17:25:35 +0000 (UTC)
Date: Tue, 28 Apr 2020 13:25:35 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200428172534.GB17285@redhat.com>
References: <20200428005146.242231-1-krisman@collabora.com>
	<20200428005146.242231-3-krisman@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200428005146.242231-3-krisman@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kernel@collabora.com, khazhy@google.com,
	agk@redhat.com
Subject: Re: [dm-devel] [PATCH v2 2/3] md: multipath: Pass io_start_time to
 the path selector
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 27 2020 at  8:51pm -0400,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> HST need to know the IO start time in order to predict path
> performance. For request-based multipath use the block layer
> io_start_time, while for BIO use the dm_io start_time.
> 
> The dm_start_time_ns_from_clone function was suggested and implemented
> by Mike Snitzer <snitzer@redhat.com>.
> 
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: Khazhismel Kumykov <khazhy@google.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  drivers/md/dm-mpath.c         | 25 +++++++++++++++----------
>  drivers/md/dm-path-selector.h |  1 +
>  drivers/md/dm.c               | 10 ++++++++++
>  include/linux/device-mapper.h |  2 ++
>  4 files changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
> index 1ef4fc2e745b..7af3249948be 100644
> --- a/drivers/md/dm-mpath.c
> +++ b/drivers/md/dm-mpath.c
> @@ -500,8 +500,9 @@ static int multipath_clone_and_map(struct dm_target *ti, struct request *rq,
>  	struct dm_mpath_io *mpio = get_mpio(map_context);
>  	struct request_queue *q;
>  	struct request *clone;
> -	struct path_selector_io_data io_data = {
> +	struct path_selector_io_data ps_io_data = {
>  		.nr_bytes = nr_bytes,
> +		.io_start_time = rq->io_start_time_ns
>  	};
>  
>  	/* Do we need to select a new pgpath? */
> @@ -552,7 +553,7 @@ static int multipath_clone_and_map(struct dm_target *ti, struct request *rq,
>  	if (pgpath->pg->ps.type->start_io)
>  		pgpath->pg->ps.type->start_io(&pgpath->pg->ps,
>  					      &pgpath->path,
> -					      &io_data);
> +					      &ps_io_data);
>  	return DM_MAPIO_REMAPPED;
>  }
>  
> @@ -568,6 +569,7 @@ static void multipath_release_clone(struct request *clone,
>  		struct pgpath *pgpath = mpio->pgpath;
>  		struct path_selector_io_data ps_io_data = {
>  			.nr_bytes = mpio->nr_bytes,
> +			.io_start_time = clone->io_start_time_ns,
>  		};
>  
>  		if (pgpath && pgpath->pg->ps.type->end_io)
> @@ -623,8 +625,9 @@ static int __multipath_map_bio(struct multipath *m, struct bio *bio,
>  			       struct dm_mpath_io *mpio)
>  {
>  	struct pgpath *pgpath = __map_bio(m, bio);
> -	struct path_selector_io_data io_data = {
> +	struct path_selector_io_data ps_io_data = {
>  		.nr_bytes = mpio->nr_bytes,
> +		.io_start_time = dm_start_time_ns_from_clone(bio)
>  	};
>  
>  	if (IS_ERR(pgpath))
> @@ -646,7 +649,7 @@ static int __multipath_map_bio(struct multipath *m, struct bio *bio,
>  	if (pgpath->pg->ps.type->start_io)
>  		pgpath->pg->ps.type->start_io(&pgpath->pg->ps,
>  					      &pgpath->path,
> -					      &io_data);
> +					      &ps_io_data);
>  	return DM_MAPIO_REMAPPED;
>  }
>  

io_start_time_ns isn't needed by any path selector's start_io method.
Please drop that from start_io and only pass it to the end_io hook.

(the need for dm_start_time_ns_from_clone() to access the more nested
nature of a bio clone's start_time showcases why we should avoid
needless collection of parameters that aren't required).

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

