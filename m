Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 078F1316E2F
	for <lists+dm-devel@lfdr.de>; Wed, 10 Feb 2021 19:12:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612980760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2ZwXhHpavm1NgGhF3KiEjvdKDJgd1Afn1ZEEudeaf9o=;
	b=YsHI02g/3BzApPgClo+pkgW1VkxTPns9NNZuDswvfimyM2VxdwNJlfWh6Xqz/KFP1KkVHU
	Oteie1saxy8W6TxMuAl+6OSo6pKQPB3V1z24T8BOlvD12g1JCenZF2Xl73BHCxI6X28PPu
	QABxZNhVpvfBrrx3dAZEu2ShDUekjEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-oYxk5YvzPbyr9rzG_wJkEQ-1; Wed, 10 Feb 2021 13:12:37 -0500
X-MC-Unique: oYxk5YvzPbyr9rzG_wJkEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0051F1005501;
	Wed, 10 Feb 2021 18:12:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B9331ACB9;
	Wed, 10 Feb 2021 18:12:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0BE518095C9;
	Wed, 10 Feb 2021 18:12:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AICDD2028012 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 13:12:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6679E10016FE; Wed, 10 Feb 2021 18:12:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DCBA10013D7;
	Wed, 10 Feb 2021 18:12:06 +0000 (UTC)
Date: Wed, 10 Feb 2021 13:12:05 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20210210181205.GA7904@redhat.com>
References: <20210122152556.24822-1-ntsironis@arrikto.com>
	<20210122152556.24822-5-ntsironis@arrikto.com>
MIME-Version: 1.0
In-Reply-To: <20210122152556.24822-5-ntsironis@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, ejt@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 4/4] dm era: Remove unreachable resize
 operation in pre-resume function
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 22 2021 at 10:25am -0500,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> The device metadata are resized in era_ctr(), so the metadata resize
> operation in era_preresume() never runs.
> 
> Also, note, that if the operation did ever run it would deadlock, since
> the worker has not been started at this point.
> 
> Fixes: eec40579d84873 ("dm: add era target")
> Cc: stable@vger.kernel.org # v3.15+
> Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
> ---
>  drivers/md/dm-era-target.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/md/dm-era-target.c b/drivers/md/dm-era-target.c
> index 104fb110cd4e..c40e132e50cd 100644
> --- a/drivers/md/dm-era-target.c
> +++ b/drivers/md/dm-era-target.c
> @@ -1567,15 +1567,6 @@ static int era_preresume(struct dm_target *ti)
>  {
>  	int r;
>  	struct era *era = ti->private;
> -	dm_block_t new_size = calc_nr_blocks(era);
> -
> -	if (era->nr_blocks != new_size) {
> -		r = in_worker1(era, metadata_resize, &new_size);
> -		if (r)
> -			return r;
> -
> -		era->nr_blocks = new_size;
> -	}
>  
>  	start_worker(era);
>  
> -- 
> 2.11.0
> 

Resize shouldn't actually happen in the ctr.  The ctr loads a temporary
(inactive) table that will only become active upon resume.  That is why
resize should always be done in terms of resume.

I'll look closer but ctr shouldn't do the actual resize, and the
start_worker() should be moved above the resize code you've removed
above.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

