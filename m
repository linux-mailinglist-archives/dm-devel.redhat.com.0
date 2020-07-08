Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D541D218AED
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 17:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594221291;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vn0B0oWbILi+xXQ0OgIK4TxUZB20mMIvhMXTpo+UER4=;
	b=hl5TS8K1o1VfRDm1mE/q5ozBNR6YawrIZHQlPVbKfIOB+NigHBI7mdRyJZqQlqJijZKEzE
	z4UHwE9SUtQ0788z8dwWF4tFnpK1zldrODbh2wJvtmMZ8lx+gGfgAS9+4gQTf6bKMnWYHJ
	kh7kQ+bGbiDA3JmtSxD2iYUN3gmR2XM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-blEwzCIsN3Gqr7C-IFMDFw-1; Wed, 08 Jul 2020 11:14:48 -0400
X-MC-Unique: blEwzCIsN3Gqr7C-IFMDFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32993E918;
	Wed,  8 Jul 2020 15:14:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DDD77847B;
	Wed,  8 Jul 2020 15:14:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14F866C9E5;
	Wed,  8 Jul 2020 15:14:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068FDlWB029689 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 11:13:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF4F15C298; Wed,  8 Jul 2020 15:13:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B2A05C1D3;
	Wed,  8 Jul 2020 15:13:44 +0000 (UTC)
Date: Wed, 8 Jul 2020 10:12:24 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20200708141223.GA7582@redhat.com>
References: <20200708002023.738147-1-damien.lemoal@wdc.com>
	<20200708002023.738147-3-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20200708002023.738147-3-damien.lemoal@wdc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/2] dm zoned: Remove set but unused variables
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 07 2020 at  8:20pm -0400,
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> In dmz_reclaim_work(), the variables nr_unmap_rnd and nr_rnd are set but
> unused. Remove them.
> 
> Fixes: f97809aec589 ("dm zoned: per-device reclaim")
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/md/dm-zoned-reclaim.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 9c6e264465bc..9c0ecc9568a4 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -503,7 +503,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  {
>  	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
>  	struct dmz_metadata *zmd = zrc->metadata;
> -	unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
> +	unsigned int p_unmap;
>  	int ret;
>  
>  	if (dmz_dev_is_dying(zmd))
> @@ -529,9 +529,6 @@ static void dmz_reclaim_work(struct work_struct *work)
>  		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
>  	}
>  
> -	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
> -	nr_rnd = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
> -
>  	DMDEBUG("(%s/%u): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
>  		dmz_metadata_label(zmd), zrc->dev_idx,
>  		zrc->kc_throttle.throttle,
> -- 
> 2.26.2
> 

I picked up the same change, that was submitted earlier, for 5.8:
https://patchwork.kernel.org/patch/11641031/

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

