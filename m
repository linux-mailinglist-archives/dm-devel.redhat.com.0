Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9A887277A09
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 22:14:46 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600978485;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=utRWj2dVtqzHT5KwAmpCKSIfEe5Y9esKyDsPsKI+1Lg=;
	b=PGMdzWcrbVZbrYgzy8scxqINYSgNzEw6EB49+C8x9EXkZfX8FxioCOkGE2UlMWbGTFeoPb
	PuD5ZQpp6jhdLUD3KcjMF3JYjiuD7y0okvm1m6abne3SPiE0ZAD/uLmhyGfwnuufADa8kV
	Le0zd5sLr3V5YG8wHl+EyyYQbu2WO7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-oiyhq7hGPUaQ3J0dGf5twA-1; Thu, 24 Sep 2020 16:14:43 -0400
X-MC-Unique: oiyhq7hGPUaQ3J0dGf5twA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E96C41084D6D;
	Thu, 24 Sep 2020 20:14:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BAAE7368C;
	Thu, 24 Sep 2020 20:14:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 733E51826D2A;
	Thu, 24 Sep 2020 20:14:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OKCojp010012 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 16:12:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD46A55761; Thu, 24 Sep 2020 20:12:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48D6755789;
	Thu, 24 Sep 2020 20:12:47 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08OKCkw6023266; 
	Thu, 24 Sep 2020 15:12:46 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08OKCjK0023265;
	Thu, 24 Sep 2020 15:12:45 -0500
Date: Thu, 24 Sep 2020 15:12:45 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200924201245.GH11108@octiron.msp.redhat.com>
References: <20200924133644.14034-1-mwilck@suse.com>
	<20200924133644.14034-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133644.14034-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 02/11] libmultipath: copy mpp->hwe from
	pp->hwe
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:36:35PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Since f0462f0 ("libmultipath: use vector for for pp->hwe and mp->hwe"),
> we've been trying to fix issues caused by paths getting freed and mpp->hwe
> dangling. This approach couldn't work because we need mpp->hwe to persist,
> even if all paths are removed from the map. Before f0462f0, a simple
> assignment worked, because the lifetime of the hwe wasn't bound to the
> path. But now, we need to copy the vector. It turns out that we need to set
> mpp->hwe only in two places, add_map_with_path() and setup_map(), and
> that the code is simplified overall.

Unless I'm missing someting, it looks like
__mpath_persistent_reserve_out() will call select_all_tg_pt(), which
uses mpp->hwe, without ever setting it.  Granted, I don't see how this
was supposed to work before your patch either.

-Ben

> 
> Even now, it can happen that a map is added with add_map_without_paths(),
> and has no paths. In that case, calling do_set_from_hwe() with a NULL
> pointer is not a bug, so remove the message.
> 
> Fixes: f0462f0 ("libmultipath: use vector for for pp->hwe and mp->hwe")
> ---
>  libmultipath/configure.c   |  7 +++++
>  libmultipath/propsel.c     |  4 +--
>  libmultipath/structs.c     | 15 +++++++++++
>  libmultipath/structs.h     |  1 +
>  libmultipath/structs_vec.c | 54 ++++++++++++++++----------------------
>  multipathd/main.c          | 10 -------
>  6 files changed, 46 insertions(+), 45 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index 6fb477f..d7afc91 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -311,6 +311,13 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
>  	if (mpp->disable_queueing && VECTOR_SIZE(mpp->paths) != 0)
>  		mpp->disable_queueing = 0;
>  
> +	/*
> +	 * If this map was created with add_map_without_path(),
> +	 * mpp->hwe might not be set yet.
> +	 */
> +	if (!mpp->hwe)
> +		extract_hwe_from_path(mpp);
> +
>  	/*
>  	 * properties selectors
>  	 *
> diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
> index 7e6e0d6..4020134 100644
> --- a/libmultipath/propsel.c
> +++ b/libmultipath/propsel.c
> @@ -65,9 +65,7 @@ do {									\
>  	__do_set_from_vec(struct hwentry, var, (src)->hwe, dest)
>  
>  #define do_set_from_hwe(var, src, dest, msg)				\
> -	if (!src->hwe) {						\
> -		condlog(0, "BUG: do_set_from_hwe called with hwe == NULL"); \
> -	} else if (__do_set_from_hwe(var, src, dest)) {			\
> +	if (src->hwe && __do_set_from_hwe(var, src, dest)) {		\
>  		origin = msg;						\
>  		goto out;						\
>  	}
> diff --git a/libmultipath/structs.c b/libmultipath/structs.c
> index 464596f..2efad6f 100644
> --- a/libmultipath/structs.c
> +++ b/libmultipath/structs.c
> @@ -234,6 +234,17 @@ alloc_multipath (void)
>  	return mpp;
>  }
>  
> +void *set_mpp_hwe(struct multipath *mpp, const struct path *pp)
> +{
> +	if (!mpp || !pp || !pp->hwe)
> +		return NULL;
> +	if (mpp->hwe)
> +		return mpp->hwe;
> +	mpp->hwe = vector_convert(NULL, pp->hwe,
> +				  struct hwentry, identity);
> +	return mpp->hwe;
> +}
> +
>  void free_multipath_attributes(struct multipath *mpp)
>  {
>  	if (!mpp)
> @@ -290,6 +301,10 @@ free_multipath (struct multipath * mpp, enum free_path_mode free_paths)
>  
>  	free_pathvec(mpp->paths, free_paths);
>  	free_pgvec(mpp->pg, free_paths);
> +	if (mpp->hwe) {
> +		vector_free(mpp->hwe);
> +		mpp->hwe = NULL;
> +	}
>  	FREE_PTR(mpp->mpcontext);
>  	FREE(mpp);
>  }
> diff --git a/libmultipath/structs.h b/libmultipath/structs.h
> index 4afd3e8..3bd2bbd 100644
> --- a/libmultipath/structs.h
> +++ b/libmultipath/structs.h
> @@ -421,6 +421,7 @@ struct host_group {
>  struct path * alloc_path (void);
>  struct pathgroup * alloc_pathgroup (void);
>  struct multipath * alloc_multipath (void);
> +void *set_mpp_hwe(struct multipath *mpp, const struct path *pp);
>  void uninitialize_path(struct path *pp);
>  void free_path (struct path *);
>  void free_pathvec (vector vec, enum free_path_mode free_paths);
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 7fd860e..b10d347 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -282,11 +282,6 @@ err:
>  void orphan_path(struct path *pp, const char *reason)
>  {
>  	condlog(3, "%s: orphan path, %s", pp->dev, reason);
> -	if (pp->mpp && pp->hwe && pp->mpp->hwe == pp->hwe) {
> -		condlog(0, "BUG: orphaning path %s that holds hwe of %s",
> -			pp->dev, pp->mpp->alias);
> -		pp->mpp->hwe = NULL;
> -	}
>  	pp->mpp = NULL;
>  	uninitialize_path(pp);
>  }
> @@ -296,8 +291,6 @@ void orphan_paths(vector pathvec, struct multipath *mpp, const char *reason)
>  	int i;
>  	struct path * pp;
>  
> -	/* Avoid BUG message from orphan_path() */
> -	mpp->hwe = NULL;
>  	vector_foreach_slot (pathvec, pp, i) {
>  		if (pp->mpp == mpp) {
>  			if (pp->initialized == INIT_REMOVED) {
> @@ -385,24 +378,26 @@ extract_hwe_from_path(struct multipath * mpp)
>  	if (mpp->hwe || !mpp->paths)
>  		return;
>  
> -	condlog(3, "%s: searching paths for valid hwe", mpp->alias);
> +	condlog(4, "%s: searching paths for valid hwe", mpp->alias);
>  	/* doing this in two passes seems like paranoia to me */
>  	vector_foreach_slot(mpp->paths, pp, i) {
> -		if (pp->state != PATH_UP)
> -			continue;
> -		if (pp->hwe) {
> -			mpp->hwe = pp->hwe;
> -			return;
> -		}
> +		if (pp->state == PATH_UP &&
> +		    pp->initialized != INIT_REMOVED && pp->hwe)
> +			goto done;
>  	}
>  	vector_foreach_slot(mpp->paths, pp, i) {
> -		if (pp->state == PATH_UP)
> -			continue;
> -		if (pp->hwe) {
> -			mpp->hwe = pp->hwe;
> -			return;
> -		}
> +		if (pp->state != PATH_UP &&
> +		    pp->initialized != INIT_REMOVED && pp->hwe)
> +			goto done;
>  	}
> +done:
> +	if (i < VECTOR_SIZE(mpp->paths))
> +		(void)set_mpp_hwe(mpp, pp);
> +
> +	if (mpp->hwe)
> +		condlog(3, "%s: got hwe from path %s", mpp->alias, pp->dev);
> +	else
> +		condlog(2, "%s: no hwe found", mpp->alias);
>  }
>  
>  int
> @@ -502,8 +497,6 @@ void sync_paths(struct multipath *mpp, vector pathvec)
>  		}
>  		if (!found) {
>  			condlog(3, "%s dropped path %s", mpp->alias, pp->dev);
> -			if (mpp->hwe == pp->hwe)
> -				mpp->hwe = NULL;
>  			vector_del_slot(mpp->paths, i--);
>  			orphan_path(pp, "path removed externally");
>  		}
> @@ -512,8 +505,6 @@ void sync_paths(struct multipath *mpp, vector pathvec)
>  	update_mpp_paths(mpp, pathvec);
>  	vector_foreach_slot (mpp->paths, pp, i)
>  		pp->mpp = mpp;
> -	if (mpp->hwe == NULL)
> -		extract_hwe_from_path(mpp);
>  }
>  
>  int
> @@ -689,9 +680,15 @@ struct multipath *add_map_with_path(struct vectors *vecs, struct path *pp,
>  
>  	conf = get_multipath_config();
>  	mpp->mpe = find_mpe(conf->mptable, pp->wwid);
> -	mpp->hwe = pp->hwe;
>  	put_multipath_config(conf);
>  
> +	/*
> +	 * We need to call this before select_alias(),
> +	 * because that accesses hwe properties.
> +	 */
> +	if (pp->hwe && !set_mpp_hwe(mpp, pp))
> +		goto out;
> +
>  	strcpy(mpp->wwid, pp->wwid);
>  	find_existing_alias(mpp, vecs);
>  	if (select_alias(conf, mpp))
> @@ -742,12 +739,6 @@ int verify_paths(struct multipath *mpp)
>  			vector_del_slot(mpp->paths, i);
>  			i--;
>  
> -			/* Make sure mpp->hwe doesn't point to freed memory.
> -			 * We call extract_hwe_from_path() below to restore
> -			 * mpp->hwe
> -			 */
> -			if (mpp->hwe == pp->hwe)
> -				mpp->hwe = NULL;
>  			/*
>  			 * Don't delete path from pathvec yet. We'll do this
>  			 * after the path has been removed from the map, in
> @@ -759,7 +750,6 @@ int verify_paths(struct multipath *mpp)
>  				mpp->alias, pp->dev, pp->dev_t);
>  		}
>  	}
> -	extract_hwe_from_path(mpp);
>  	return count;
>  }
>  
> diff --git a/multipathd/main.c b/multipathd/main.c
> index a4abbb2..eedc6c1 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -1153,13 +1153,6 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
>  		if (i != -1)
>  			vector_del_slot(mpp->paths, i);
>  
> -		/*
> -		 * Make sure mpp->hwe doesn't point to freed memory
> -		 * We call extract_hwe_from_path() below to restore mpp->hwe
> -		 */
> -		if (mpp->hwe == pp->hwe)
> -			mpp->hwe = NULL;
> -
>  		/*
>  		 * remove the map IF removing the last path
>  		 */
> @@ -1191,9 +1184,6 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
>  			 */
>  		}
>  
> -		if (mpp->hwe == NULL)
> -			extract_hwe_from_path(mpp);
> -
>  		if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
>  			condlog(0, "%s: failed to setup map for"
>  				" removal of path %s", mpp->alias, pp->dev);
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

