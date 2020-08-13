Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 022FD2440D4
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 23:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597354878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=usRPjQsoo7J9P8pQu0KVL7lNgv0Y0OFcVtKRqBFVI74=;
	b=VIPitj6NHQmGYNJBl0SyRU30zq7hXR64kLxqa3d1Jkh8WvDX0d16oIo0aBmhf/UOl10jDj
	MyA67/iku1ErxcuyeT0YaMFxkiEUAr/oZRYhWwuy036yVPJNOJbPbV6Q7apSh3HnLpSalT
	1KvlVOh1UMpwXpVs7H+0qyjZvS7G+3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-I9IlWRSyOEOqRhhickDqTw-1; Thu, 13 Aug 2020 17:41:15 -0400
X-MC-Unique: I9IlWRSyOEOqRhhickDqTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFE43185519A;
	Thu, 13 Aug 2020 21:41:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1031C6FDC1;
	Thu, 13 Aug 2020 21:41:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A0FDB4EE15;
	Thu, 13 Aug 2020 21:41:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DLf0Jm003340 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 17:41:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ED5176FDC0; Thu, 13 Aug 2020 21:41:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D37F6FDC1;
	Thu, 13 Aug 2020 21:40:58 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07DLeuHl030187; 
	Thu, 13 Aug 2020 16:40:57 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07DLeu8X030186;
	Thu, 13 Aug 2020 16:40:56 -0500
Date: Thu, 13 Aug 2020 16:40:56 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200813214056.GX19233@octiron.msp.redhat.com>
References: <20200812113405.26206-1-mwilck@suse.com>
	<20200812113405.26206-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113405.26206-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

