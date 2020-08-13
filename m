Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAE6244187
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 00:55:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597359351;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ao+iEzt0YIwjJhelh3AAx8Z28bbV85M8Oy3maemTNOY=;
	b=hEaOO83jzdATECm27DO0Ko4s3SZC84yczlRJ+2I5oNN9dxaBA/mpUmNoB30+aB2c6nc1ax
	ebKQpkpEECXPZrs60S8pEmpylwWdSJWHPvywQ/MiZQNzY/UIBw4BSfljxMYBrm12Ip1zmz
	y2v7unixAdKI5vNmep08eZxoejAQX8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-co82yRH6OLGvE6JvkuZhOg-1; Thu, 13 Aug 2020 18:55:49 -0400
X-MC-Unique: co82yRH6OLGvE6JvkuZhOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34E0C100CEC0;
	Thu, 13 Aug 2020 22:55:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E83A600D4;
	Thu, 13 Aug 2020 22:55:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88D5E4EE19;
	Thu, 13 Aug 2020 22:55:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DMtAkG013041 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 18:55:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3878B1992D; Thu, 13 Aug 2020 22:55:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A3DB19646;
	Thu, 13 Aug 2020 22:55:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07DMt5bv030445; 
	Thu, 13 Aug 2020 17:55:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07DMt5na030444;
	Thu, 13 Aug 2020 17:55:05 -0500
Date: Thu, 13 Aug 2020 17:55:05 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200813225505.GZ19233@octiron.msp.redhat.com>
References: <20200812113429.26314-1-mwilck@suse.com>
	<20200812113429.26314-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113429.26314-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 44/54] libmultipath: adopt_paths(): don't
 bail out on single path failure
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:34:28PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If pathinfo fails for one path to be adopted, we currently
> fail the entire function. This may cause ev_add_path() for a valid
> path to fail because some other path is broken. Fix it by just
> skipping paths that don't look healthy.
> 
> adopt_paths() may now succeed even if some paths couldn't be
> added (e.g. because of pathinfo() failure). If this happens while we are
> trying to add a specific path, we need to check after successful call to
> adopt_paths() if that specific path had been actually added, and fail in the
> caller otherwise.
> 
The changes the patch makes look fine, but right before the first line of the
patch, isn't there a line with

pp->mpp = mpp;

It seems like we should reset this if we don't actually add the path the
the multipath device. But since that bug was already there we can fix it
in a seperate patch, so

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 17 +++++++++++------
>  multipathd/main.c          |  3 ++-
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index b1f83c6..fb225f1 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -75,16 +75,20 @@ int adopt_paths(vector pathvec, struct multipath *mpp)
>  			if (!mpp->paths && !(mpp->paths = vector_alloc()))
>  				return 1;
>  
> -			if (!find_path_by_devt(mpp->paths, pp->dev_t) &&
> -			    store_path(mpp->paths, pp))
> -					return 1;
>  			conf = get_multipath_config();
>  			pthread_cleanup_push(put_multipath_config, conf);
>  			ret = pathinfo(pp, conf,
>  				       DI_PRIO | DI_CHECKER);
>  			pthread_cleanup_pop(1);
> -			if (ret)
> -				return 1;
> +			if (ret) {
> +				condlog(3, "%s: pathinfo failed for %s",
> +					__func__, pp->dev);
> +				continue;
> +			}
> +
> +			if (!find_path_by_devt(mpp->paths, pp->dev_t) &&
> +			    store_path(mpp->paths, pp))
> +					return 1;
>  		}
>  	}
>  	return 0;
> @@ -456,7 +460,8 @@ struct multipath *add_map_with_path(struct vectors *vecs, struct path *pp,
>  		goto out;
>  	mpp->size = pp->size;
>  
> -	if (adopt_paths(vecs->pathvec, mpp))
> +	if (adopt_paths(vecs->pathvec, mpp) ||
> +	    find_slot(vecs->pathvec, pp) == -1)
>  		goto out;
>  
>  	if (add_vec) {
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 61929a7..5902e7c 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -956,7 +956,8 @@ rescan:
>  	if (mpp) {
>  		condlog(4,"%s: adopting all paths for path %s",
>  			mpp->alias, pp->dev);
> -		if (adopt_paths(vecs->pathvec, mpp))
> +		if (adopt_paths(vecs->pathvec, mpp) ||
> +		    find_slot(vecs->pathvec, pp) == -1)
>  			goto fail; /* leave path added to pathvec */
>  
>  		verify_paths(mpp, vecs);
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

