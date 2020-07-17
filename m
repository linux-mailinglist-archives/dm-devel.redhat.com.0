Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC612245D3
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jul 2020 23:26:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595021181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/8R7kJ8Y4r4u+UxlsWki3GBr7loAWhHnbADMQarSqjA=;
	b=VctydI48SOdbuXVQJflJgPEmjCSkecjvPBoRF6QT1Y6b9QDA9ryUsRpQLure2BkkbQcO5e
	voQF/Js6sjCFl2lZPaxeDnyEiO5qbLilpZ3KaqmNZi3SpDGcltIR+Woo298AUsOumiDx4v
	vfW3/B8WrhHGmT74EytyZM7b2X7SNJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-Nczw2HouPFqhH-LoZmIVUA-1; Fri, 17 Jul 2020 17:26:19 -0400
X-MC-Unique: Nczw2HouPFqhH-LoZmIVUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46B77107ACCA;
	Fri, 17 Jul 2020 21:26:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C420410013C4;
	Fri, 17 Jul 2020 21:26:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DBA31809554;
	Fri, 17 Jul 2020 21:25:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HLPVjY020858 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 17:25:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1268010013D7; Fri, 17 Jul 2020 21:25:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4AF310013C4;
	Fri, 17 Jul 2020 21:25:27 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06HLPQsT030490; 
	Fri, 17 Jul 2020 16:25:26 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06HLPPTQ030489;
	Fri, 17 Jul 2020 16:25:25 -0500
Date: Fri, 17 Jul 2020 16:25:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200717212525.GR11089@octiron.msp.redhat.com>
References: <20200709103623.8302-1-mwilck@suse.com>
	<20200709103623.8302-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709103623.8302-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 44/54] libmultipath: adopt_paths(): don't
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:36:13PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If pathinfo fails for one path to be adopted, we currently
> fail the entire function. This may cause ev_add_path() for a valid
> path to fail because some other path is broken. Fix it by just
> skipping paths that don't look healthy.

This looks problematic to me.  While I agree that we shouldn't make
ev_add_path fail because some other path failed, but what about if the
path we are trying to add fails in pathinfo().  In this case multipathd
won't orphan the path and it will report "path added to devmap", even
though it wasn't. Also what is the correct response for when you try
to create a multipath device but none of the paths can be added.
Should multipathd create a device with no paths? 
 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 55fca9b..bc47d1e 100644
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
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

