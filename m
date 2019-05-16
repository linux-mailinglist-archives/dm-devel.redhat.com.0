Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CBACA20F0E
	for <lists+dm-devel@lfdr.de>; Thu, 16 May 2019 21:10:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C4F73002E07;
	Thu, 16 May 2019 19:10:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6544F608C1;
	Thu, 16 May 2019 19:10:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7D771806B12;
	Thu, 16 May 2019 19:09:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GJ96c1020705 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 15:09:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B83971001938; Thu, 16 May 2019 19:09:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EE7D101E661;
	Thu, 16 May 2019 19:09:02 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4GJ91fI007858; 
	Thu, 16 May 2019 14:09:01 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x4GJ90Ww007857;
	Thu, 16 May 2019 14:09:00 -0500
Date: Thu, 16 May 2019 14:08:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20190516190859.GF3090@octiron.msp.redhat.com>
References: <20190516071024.7230-1-mwilck@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516071024.7230-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: get_prio(): really don't reset
 prio for inaccessible paths
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 16 May 2019 19:10:44 +0000 (UTC)

On Thu, May 16, 2019 at 09:10:24AM +0200, Martin Wilck wrote:
> As pointed out by Ben Marzinski, my previous patch ebbb56f2 doesn't do what
> it pretends to do.
> 
> Fixes: ebbb56f2 "libmultipath: get_prio(): don't reset prio for inaccessible
> paths"

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/discovery.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index b3dc60b1..856c52c6 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -1648,10 +1648,11 @@ get_prio (struct path * pp)
>  		/* this changes pp->offline, but why not */
>  		int state = path_offline(pp);
>  
> -		if (state == PATH_DOWN || state == PATH_PENDING)
> +		if (state == PATH_DOWN || state == PATH_PENDING) {
> +			pp->priority = old_prio;
>  			condlog(3, "%s: %s prio error in state %d, keeping prio = %d",
>  				pp->dev, prio_name(p), state, pp->priority);
> -		else {
> +		} else {
>  			condlog(3, "%s: %s prio error in state %d",
>  				pp->dev, prio_name(p), state);
>  			pp->priority = PRIO_UNDEF;
> -- 
> 2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
