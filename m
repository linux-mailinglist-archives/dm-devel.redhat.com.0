Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC98244074
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 23:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597354443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=usRPjQsoo7J9P8pQu0KVL7lNgv0Y0OFcVtKRqBFVI74=;
	b=BnbcfOP8yXmtg29xcT2sYH9/IQQY9V0WVxw3xPpkQ5D7xQQoIidSDDSR31zE69EBqbrcCm
	vU7l+OituNg05MoZ9shulZhA18JGBHwvcAfCA2UIFem9JLKwNe8gkhSukoQjdesOcbmUoJ
	0ZVdvfuhIMr7aIDiwQovuA2utl77/3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-gVCq2_9eMFGKpz6haAEycA-1; Thu, 13 Aug 2020 17:34:01 -0400
X-MC-Unique: gVCq2_9eMFGKpz6haAEycA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 101B6183587C;
	Thu, 13 Aug 2020 21:33:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CACC5C1A3;
	Thu, 13 Aug 2020 21:33:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFC6B1826D29;
	Thu, 13 Aug 2020 21:33:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DLWwYm002305 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 17:32:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F35C5C1C2; Thu, 13 Aug 2020 21:32:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE2A75C1A3;
	Thu, 13 Aug 2020 21:32:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07DLWrYD030176; 
	Thu, 13 Aug 2020 16:32:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07DLWrg0030175;
	Thu, 13 Aug 2020 16:32:53 -0500
Date: Thu, 13 Aug 2020 16:32:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200813213252.GW19233@octiron.msp.redhat.com>
References: <20200812113405.26206-1-mwilck@suse.com>
	<20200812113405.26206-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113405.26206-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 40/42] libmultipath: free_multipath():
 remove mpp references
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:34:04PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If free_paths is false, make sure no references to the dropped
> multipath remain. Otherwise multipathd may crash later when
> trying to access these.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/libmultipath/structs.c b/libmultipath/structs.c
> index da898b7..d227ec0 100644
> --- a/libmultipath/structs.c
> +++ b/libmultipath/structs.c
> @@ -258,6 +258,21 @@ free_multipath (struct multipath * mpp, enum free_path_mode free_paths)
>  		mpp->dmi = NULL;
>  	}
>  
> +	if (!free_paths && mpp->pg) {
> +		struct pathgroup *pgp;
> +		struct path *pp;
> +		int i, j;
> +
> +		/*
> +		 * Make sure paths carry no reference to this mpp any more
> +		 */
> +		vector_foreach_slot(mpp->pg, pgp, i) {
> +			vector_foreach_slot(pgp->paths, pp, j)
> +				if (pp->mpp == mpp)
> +					pp->mpp = NULL;
> +		}
> +	}
> +
>  	free_pathvec(mpp->paths, free_paths);
>  	free_pgvec(mpp->pg, free_paths);
>  	FREE_PTR(mpp->mpcontext);
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

