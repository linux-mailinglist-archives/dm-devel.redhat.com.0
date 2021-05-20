Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BA0AA38B3B5
	for <lists+dm-devel@lfdr.de>; Thu, 20 May 2021 17:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621525811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lrTHDmWPbF9yX9O7uRKMWJrDmBBJKz0+EcBsTX8A4+k=;
	b=YXNlag7JYxrWRltGFZu59XORMK0Yzv0p0GZJqGdO0IA5Og9bF2juIEWDIMwU17ZSCq6dAC
	GKvJg5DHwZCCwwzGbsdXL2r3t/8gjdt2mhnhyov2c83OjIWypwtQH/GlBnLH2AFO/0tsBB
	2ORKyWeced3lXVQ7NQ9q6Zpo8ovetB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-ICvEW7TiOTm-k4q0i_gVvg-1; Thu, 20 May 2021 11:50:09 -0400
X-MC-Unique: ICvEW7TiOTm-k4q0i_gVvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 219E880EDA3;
	Thu, 20 May 2021 15:50:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 496555D74D;
	Thu, 20 May 2021 15:50:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 164F744A5D;
	Thu, 20 May 2021 15:49:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KFfD0s021274 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 11:41:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8757210016F4; Thu, 20 May 2021 15:41:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA7D310013C1;
	Thu, 20 May 2021 15:41:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14KFf7NJ029699; 
	Thu, 20 May 2021 10:41:08 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14KFf7Lq029698;
	Thu, 20 May 2021 10:41:07 -0500
Date: Thu, 20 May 2021 10:41:07 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210520154107.GQ25887@octiron.msp.redhat.com>
References: <20210517212727.25229-1-mwilck@suse.com>
	<20210517212727.25229-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210517212727.25229-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH v2 2/4] multipathd: cli_getprkey(): fix
	return value
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

On Mon, May 17, 2021 at 11:27:25PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> By setting (*reply)[19] = '\0', we always truncated a possible
> ":aptpl" suffix. Fix it, and use the return value of snprintf()
> as length.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipathd/cli_handlers.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
> index 9606494..59d44b4 100644
> --- a/multipathd/cli_handlers.c
> +++ b/multipathd/cli_handlers.c
> @@ -1540,7 +1540,7 @@ cli_getprkey(void * v, char ** reply, int * len, void * data)
>  	struct multipath * mpp;
>  	struct vectors * vecs = (struct vectors *)data;
>  	char *mapname = get_keyparam(v, MAP);
> -	char *flagstr = "";
> +	uint64_t key;
>  
>  	mapname = convert_dev(mapname, 0);
>  	condlog(3, "%s: get persistent reservation key (operator)", mapname);
> @@ -1553,17 +1553,16 @@ cli_getprkey(void * v, char ** reply, int * len, void * data)
>  	if (!*reply)
>  		return 1;
>  
> -	if (!get_be64(mpp->reservation_key)) {
> +	key = get_be64(mpp->reservation_key);
> +	if (!key) {
>  		sprintf(*reply, "none\n");
> -		*len = strlen(*reply) + 1;
> +		*len = sizeof("none\n");
>  		return 0;
>  	}
> -	if (mpp->sa_flags & MPATH_F_APTPL_MASK)
> -		flagstr = ":aptpl";
> -	snprintf(*reply, 26, "0x%" PRIx64 "%s\n",
> -		 get_be64(mpp->reservation_key), flagstr);
> -	(*reply)[19] = '\0';
> -	*len = strlen(*reply) + 1;
> +
> +	/* This snprintf() can't overflow - PRIx64 needs max 16 chars */
> +	*len = snprintf(*reply, 26, "0x%" PRIx64 "%s\n", key,
> +			mpp->sa_flags & MPATH_F_APTPL_MASK ? ":aptpl" : "") + 1;
>  	return 0;
>  }
>  
> -- 
> 2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

