Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 01EA1141000
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 18:38:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579282714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L12OUxs+6/GeprxErjwHK9YjibDpYwt+Wl86RQQ9W08=;
	b=Fi7bbjrSZiO28Iuvneo3RqZ5MXO18M8u++2nzb1QxCWkgaG0vYYDXR9r87+vvAAro0wq9W
	a/5vQ5FVqu/jLLl5dp6HHhep/e/b391nMjlBSE2DBr7Qh+ajHQwTOHJQV6Em5Tp/c8MncZ
	n0WlRnOyErqYQ/qDjqxF5INps5n5vMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-CmDr40ghMvupnniXf3ga_g-1; Fri, 17 Jan 2020 12:38:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75462DB21;
	Fri, 17 Jan 2020 17:38:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16D6A60BE1;
	Fri, 17 Jan 2020 17:38:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E3FC1809567;
	Fri, 17 Jan 2020 17:38:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HHcAng024967 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 12:38:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1670B2016F32; Fri, 17 Jan 2020 17:38:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11C1B2026983
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:38:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AA28800FCC
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 17:38:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-15-uYgN-3H_OSCMsLiiFKGttA-1;
	Fri, 17 Jan 2020 12:38:04 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 84A3CAD14;
	Fri, 17 Jan 2020 17:38:02 +0000 (UTC)
Message-ID: <cdc0343992fcf82bc55f167644e4cdccd29b4883.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 18:39:18 +0100
In-Reply-To: <1579227500-17196-13-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-13-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: uYgN-3H_OSCMsLiiFKGttA-1
X-MC-Unique: CmDr40ghMvupnniXf3ga_g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HHcAng024967
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 12/15] multipathd: add new paths under vecs
	lock
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

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> Right now, multipathd only ever calls pathinfo on a path outside of
> the
> vecs lock in one circumstance, when it's adding a new path from a
> uevent. Doing this can cause weirdness or crash multipathd.
> 
> First off, the path checker code is written assuming that only one
> checker instance will be active at a time.  If this isn't the case,
> two
> processes can modify the checker's refcounts at the same time,
> potentially causing a checker to get removed while still in use (if
> two
> threads try to increment the refcount at the same time, causing it to
> only increment once).

The obvious solution to that problem would be making the refcount an
atomic variable.

> Another issue is that since the vecs lock isn't grabbed until after
> all
> of the pathinfo is gathered, and the vecs lock is the only thing
> keeping
> the uevent servicing thread from running at the same time as a
> reconfigure is happening, it is possible to have multipathd add a
> path
> using the old config after reconfigure has already added that path
> using
> the new config. Leading to two versions of the path on the pathvec.

This is a valid argument, but strengthens the gut feeling that I've had
for some time: that it was not a good idea to handle the multipath
configuration with RCU. Using RCU means that while a new configuration
is already in place, other threads may (continue to) use the old
configuration, and that's dangerous. I believe that the configuration
should be protected by a lock. When reconfigure() is called, all
asynchrous processing should essentially stop, and be allowed to
continue only after reconfigure() has finished.

> There are possibly other issues with running pathinfo outside of the
> vecs lock that I haven't noticed, as well.

Sooner or later we should reach a point where it's not necessary
any more to take the global lock just to call pathinfo(). But for the
current situation, I guess you're right.

> The easiest solution is to call pathinfo on the path while holding
> the
> vecs lock, to keep other threads from modifying the checker structure
> or
> the config while setting up the path. This is what happens every
> other
> time multipathd calls pathinfo, including when a path is added
> through
> the multipathd command interface.
> 
> This does mean that any time spent calling pathinfo on new paths will
> block other threads that need the vecs lock, but since the checker is
> now always called in async mode, and the prio function will use a
> short timeout if called on a failed path, this shouldn't be any more
> noticeable than the calls to check_path() for already existing paths.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipathd/main.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Martin Wilck <mwilck@suse.com>



> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 7b364cfe..9e01cfaa 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -906,9 +906,8 @@ uev_add_path (struct uevent *uev, struct vectors
> * vecs, int need_do_map)
>  			}
>  		}
>  	}
> -	lock_cleanup_pop(vecs->lock);
>  	if (pp)
> -		return ret;
> +		goto out;
>  
>  	/*
>  	 * get path vital state
> @@ -920,13 +919,13 @@ uev_add_path (struct uevent *uev, struct
> vectors * vecs, int need_do_map)
>  	pthread_cleanup_pop(1);
>  	if (!pp) {
>  		if (ret == PATHINFO_SKIPPED)
> -			return 0;
> -		condlog(3, "%s: failed to get path info", uev->kernel);
> -		return 1;
> +			ret = 0;
> +		else {
> +			condlog(3, "%s: failed to get path info", uev-
> >kernel);
> +			ret = 1;
> +		}
> +		goto out;
>  	}
> -	pthread_cleanup_push(cleanup_lock, &vecs->lock);
> -	lock(&vecs->lock);
> -	pthread_testcancel();
>  	ret = store_path(vecs->pathvec, pp);
>  	if (!ret) {
>  		conf = get_multipath_config();
> @@ -940,6 +939,7 @@ uev_add_path (struct uevent *uev, struct vectors
> * vecs, int need_do_map)
>  		free_path(pp);
>  		ret = 1;
>  	}
> +out:
>  	lock_cleanup_pop(vecs->lock);
>  	return ret;
>  }



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

