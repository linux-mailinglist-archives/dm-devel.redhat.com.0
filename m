Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4006524418C
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 00:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597359509;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T7tY1ijtU5ujGiRvFwPTAV+NKHnFnVD7fBB7ufwip0k=;
	b=Vt2vVwIGiEonnKT4TMG2o+cofAW8J6KeIpEyCtlyYL/bj5388EbPs021L+i//1fks9BzAL
	Jq0Na5Sr9H8Dyxh7olUNNlrc7MMimsEk0LklZ1deLd57S/hNS2idSyJz03Brabl7je4x3N
	74AbZ0bZmu9K1uQz5u6fBfR3FVoCKcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-wvFo3AeoMrGGylixGTscOQ-1; Thu, 13 Aug 2020 18:58:26 -0400
X-MC-Unique: wvFo3AeoMrGGylixGTscOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0595D100CEC1;
	Thu, 13 Aug 2020 22:58:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93F4C10021AA;
	Thu, 13 Aug 2020 22:58:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67F294EE16;
	Thu, 13 Aug 2020 22:58:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DMwFb6013288 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 18:58:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE8A1100238E; Thu, 13 Aug 2020 22:58:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15AF110021AA;
	Thu, 13 Aug 2020 22:58:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07DMwB8l030453; 
	Thu, 13 Aug 2020 17:58:11 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07DMwBep030452;
	Thu, 13 Aug 2020 17:58:11 -0500
Date: Thu, 13 Aug 2020 17:58:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200813225811.GA19233@octiron.msp.redhat.com>
References: <20200812113429.26314-1-mwilck@suse.com>
	<20200812113429.26314-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113429.26314-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 46/54] libmultipath: path_discover():
 explain pathinfo flags
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:34:29PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Add a comment explaining why we use different flags for "new" and
> existing paths.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/discovery.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> index 5f4ebf0..64d3473 100644
> --- a/libmultipath/discovery.c
> +++ b/libmultipath/discovery.c
> @@ -137,6 +137,11 @@ path_discover (vector pathvec, struct config * conf,
>  				      udevice, flag | DI_BLACKLIST,
>  				      NULL);
>  	else
> +		/*
> +		 * Don't use DI_BLACKLIST on paths already in pathvec. We rely
> +		 * on the caller to pre-populate the pathvec with valid paths
> +		 * only.
> +		 */
>  		return pathinfo(pp, conf, flag);
>  }
>  
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

