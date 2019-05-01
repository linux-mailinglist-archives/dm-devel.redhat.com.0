Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 392261F858
	for <lists+dm-devel@lfdr.de>; Wed, 15 May 2019 18:19:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDBEAC066455;
	Wed, 15 May 2019 16:19:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24A2B60E39;
	Wed, 15 May 2019 16:19:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3CA84BB43;
	Wed, 15 May 2019 16:19:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FGIulM024296 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 12:18:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88AA260F91; Wed, 15 May 2019 16:18:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CF0260F81;
	Wed, 15 May 2019 16:18:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4FGIl20018094; 
	Wed, 15 May 2019 11:18:52 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x41KVQm3030344;
	Wed, 1 May 2019 15:31:26 -0500
Date: Wed, 1 May 2019 15:31:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20190501203125.GD5210@octiron.msp.redhat.com>
References: <20190411104923.13470-1-mwilck@suse.com>
	<20190411104923.13470-5-mwilck@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190411104923.13470-5-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 4/4] libmultipath: get_prio(): don't reset
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 15 May 2019 16:19:06 +0000 (UTC)

On Thu, Apr 11, 2019 at 12:49:23PM +0200, Martin Wilck wrote:
> pathinfo() doesn't call get_prio() if a path is down, now keeping the old
> priority value. But if a path becomes inaccessible between the state check
> and the get_prio() call, retrieving the priority will likely fail, and the
> path priority will be reset to PRIO_UNDEF. This makes it timing-dependent
> how the priority of a failed path is treated. Fix that by checking the path
> state in get_prio() if an error occurs, and not touching pp->priority if
> the path is in inaccessible state. A checker_check() call would be too
> much here, but a quick path_offline() check seems appropriate.
> 
> Keep the previous behavior for the case where getting the priority fails
> although the path is apparently healthy. This is presumably a very rare
> condition, in which it seems actually wrong to preserve the old prio value.
> 

I think I was to hasty in ACKing this one.

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/discovery.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 7a17911d..7d638c20 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -1625,8 +1625,17 @@ get_prio (struct path * pp)
>  	old_prio = pp->priority;
>  	pp->priority = prio_getprio(p, pp, checker_timeout);
>  	if (pp->priority < 0) {
> -		condlog(3, "%s: %s prio error", pp->dev, prio_name(p));
> -		pp->priority = PRIO_UNDEF;
> +		/* this changes pp->offline, but why not */
> +		int state = path_offline(pp);
> +
> +		if (state == PATH_DOWN || state == PATH_PENDING)

Since pp->priority has already been set to something less then 0, most
likely -1 (PRIO_UNDEF), this patch isn't really keeping the old
priority. Don't you want

			pp->priority = old_prio;

here?

-Ben

> +			condlog(3, "%s: %s prio error in state %d, keeping prio = %d",
> +				pp->dev, prio_name(p), state, pp->priority);
> +		else {
> +			condlog(3, "%s: %s prio error in state %d",
> +				pp->dev, prio_name(p), state);
> +			pp->priority = PRIO_UNDEF;
> +		}
>  		return 1;
>  	}
>  	condlog((old_prio == pp->priority ? 4 : 3), "%s: %s prio = %u",
> -- 
> 2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
