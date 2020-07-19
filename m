Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 84542224FB9
	for <lists+dm-devel@lfdr.de>; Sun, 19 Jul 2020 07:14:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595135639;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z3pDZtB+GzKztLlq/w/6jgP3qyDNGcQpi5EjCcOsyzY=;
	b=L/bYDL3DVGSfAw76s7VTAQQ9e21PwgA0VOc+QZp8dByU7RWNYDXFkHi09ZrBcSZSGXIwBm
	o2LIxLPkgi9dyU2UPeJ0LjR5IjoVKhJfJM0VDaIUwbAuW3994sQ1ANgPYpPGy2vQFqVKUu
	rAy4nII+sw8KtBT6FHIvC6LbOnbmKx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-uWrH3UKzPnyLYZarQs7F8Q-1; Sun, 19 Jul 2020 01:13:57 -0400
X-MC-Unique: uWrH3UKzPnyLYZarQs7F8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 242618015FB;
	Sun, 19 Jul 2020 05:13:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B81D7556B;
	Sun, 19 Jul 2020 05:13:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8D6B1809554;
	Sun, 19 Jul 2020 05:13:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06J5C56r018358 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Jul 2020 01:12:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 625F07557E; Sun, 19 Jul 2020 05:12:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 767367556B;
	Sun, 19 Jul 2020 05:12:02 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06J5C1Ej007148; 
	Sun, 19 Jul 2020 00:12:01 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06J5C0up007147;
	Sun, 19 Jul 2020 00:12:00 -0500
Date: Sun, 19 Jul 2020 00:12:00 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200719051200.GX11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-14-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709105145.9211-14-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 66/74] libmultipath: update_pathvec_from_dm:
 handle pp->mpp mismatch
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:51:37PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Treat this like a WWID mismatch.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 37 +++++++++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 5dd37d5..8651b98 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -118,6 +118,12 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
>  			goto delete_pg;
>  
>  		vector_foreach_slot(pgp->paths, pp, j) {
> +
> +			if (pp->mpp && pp->mpp != mpp) {
> +				condlog(0, "BUG: %s: found path %s which is already in %s",
> +					mpp->alias, pp->dev, pp->mpp->alias);
> +				goto bad_path;
> +			}
>  			pp->mpp = mpp;
>  
>  			if (pp->udev) {
> @@ -163,25 +169,28 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
>  
>  					condlog(0, "%s: path %s WWID %s doesn't match, removing from map",
>  						mpp->wwid, pp->dev_t, pp->wwid);
> -					/*
> -					 * This path exists, but in the wong map.
> -					 * We can't reload the map from here.
> -					 * Instead, treat this path like "missing udev",
> -					 * which it probably is.
> -					 * check_path() will trigger an uevent
> -					 * and reset pp->tick.
> -					 */
> -					must_reload = true;
> -					pp->mpp = NULL;
> -					dm_fail_path(mpp->alias, pp->dev_t);
> -					vector_del_slot(pgp->paths, j--);
> -					pp->initialized = INIT_MISSING_UDEV;
> -					pp->tick = 1;
> +					goto bad_path;
>  				}
>  				condlog(2, "%s: adding new path %s",
>  					mpp->alias, pp->dev);
>  				store_path(pathvec, pp);
> +
>  			}
> +			continue;
> +
> +		bad_path:
> +			/*
> +			 * This path exists, but in the wrong map.
> +			 * We can't reload the map from here.
> +			 * Instead, treat this path like "missing udev".
> +			 * check_path() will trigger an uevent and reset pp->tick.
> +			 */
> +			must_reload = true;
> +			pp->mpp = NULL;
> +			dm_fail_path(mpp->alias, pp->dev_t);
> +			vector_del_slot(pgp->paths, j--);
> +			pp->initialized = INIT_MISSING_UDEV;
> +			pp->tick = 1;

Is there a reason not to call orphan_path() to clean up things like any
open fd, until we figure out what to do with the path.

>  		}
>  		if (VECTOR_SIZE(pgp->paths) != 0)
>  			continue;
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

