Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 64BE924A8F3
	for <lists+dm-devel@lfdr.de>; Thu, 20 Aug 2020 00:16:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597875373;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YovhWqYbDcsI7WnNszC/ywO0JxjZpLuNBFg8HKZY6B0=;
	b=g4CqA449aMflMdxV6K+xU75hJvOsV0agREpA4R+bLK/a4tyBOtVvl8IO1j0qhI1cqB3dIl
	FfJEaUyQqoI0T4GiW4CyMoFbRAQBjcqZW8KOTA6jRX93rN07Mj4XTBuvVZC3T3VhxQZLXU
	AQmsDSMNTM/OnbgYzzF2EI4U+1pbU/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-CZluQCj3PySA710RF87ZRQ-1; Wed, 19 Aug 2020 18:16:10 -0400
X-MC-Unique: CZluQCj3PySA710RF87ZRQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 320411084C8E;
	Wed, 19 Aug 2020 22:16:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C9F27C0B7;
	Wed, 19 Aug 2020 22:16:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 651C51832FC3;
	Wed, 19 Aug 2020 22:16:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JMFuuW018262 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 18:15:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EAE9A1001281; Wed, 19 Aug 2020 22:15:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2F6D10013C4;
	Wed, 19 Aug 2020 22:15:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07JMFqFw007124; 
	Wed, 19 Aug 2020 17:15:52 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07JMFqFW007123;
	Wed, 19 Aug 2020 17:15:52 -0500
Date: Wed, 19 Aug 2020 17:15:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200819221552.GU19233@octiron.msp.redhat.com>
References: <20200819131819.13493-1-mwilck@suse.com>
	<20200819131819.13493-4-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200819131819.13493-4-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 86/87] libmultipath: adopt_paths(): set
 pp->mpp only on success
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

On Wed, Aug 19, 2020 at 03:18:18PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Make sure that pp->mpp is only set for paths that have been
> successfully added to mpp->paths.
> 
> Suggested-by: Benjamin Marzinki <bmarzins@redhat.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 2d85df9..cc2dafa 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -248,14 +248,10 @@ int adopt_paths(vector pathvec, struct multipath *mpp)
>  					pp->dev, mpp->alias);
>  				continue;
>  			}
> -			pp->mpp = mpp;
>  			if (pp->initialized == INIT_REMOVED)
>  				continue;
> -			condlog(3, "%s: ownership set to %s",
> -				pp->dev, mpp->alias);
> -
>  			if (!mpp->paths && !(mpp->paths = vector_alloc()))
> -				return 1;
> +				goto err;
>  
>  			conf = get_multipath_config();
>  			pthread_cleanup_push(put_multipath_config, conf);
> @@ -270,10 +266,17 @@ int adopt_paths(vector pathvec, struct multipath *mpp)
>  
>  			if (!find_path_by_devt(mpp->paths, pp->dev_t) &&
>  			    store_path(mpp->paths, pp))
> -					return 1;
> +				goto err;
> +
> +			pp->mpp = mpp;
> +			condlog(3, "%s: ownership set to %s",
> +				pp->dev, mpp->alias);
>  		}
>  	}
>  	return 0;
> +err:
> +	condlog(1, "error setting ownership of %s to %s", pp->dev, mpp->alias);
> +	return 1;
>  }
>  
>  void orphan_path(struct path *pp, const char *reason)
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

