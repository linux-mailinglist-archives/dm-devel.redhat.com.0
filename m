Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 98BC527953C
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 01:55:36 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601078135;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KnmqyxFNO0RbMMPZ9yAkHRrCkRw+rkn4m/UHasXBByE=;
	b=Vz++ivVW+S8qNxp2pt8nkwsL5jBu17EtsQ6BdGEeFdqo2jQ8dk9Q2DlmQ0ASf/wsmOX2Am
	MRbWBNSLU/kxwhjmA96rU/qE686Tiiuit3hCe9WGcBtirBjhFD7Yyj+vUb8g7ibNQ2xJoj
	zR/b5cqMOSBVOluFobAOlROBiXD/H44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-DE5L-ZEAMrmcjP2zkvmGOw-1; Fri, 25 Sep 2020 19:55:33 -0400
X-MC-Unique: DE5L-ZEAMrmcjP2zkvmGOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 261A6802B5C;
	Fri, 25 Sep 2020 23:55:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24E4378828;
	Fri, 25 Sep 2020 23:55:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E5E644A7A;
	Fri, 25 Sep 2020 23:55:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PNtHYL013964 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 19:55:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9CE1A5C1C2; Fri, 25 Sep 2020 23:55:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2F885C1BB;
	Fri, 25 Sep 2020 23:55:14 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08PNtDox004888; 
	Fri, 25 Sep 2020 18:55:13 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08PNtCni004887;
	Fri, 25 Sep 2020 18:55:12 -0500
Date: Fri, 25 Sep 2020 18:55:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200925235512.GG3384@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-20-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133716.14120-20-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 19/21] libmpathpersist: call
	libmultipath_{init, exit}()
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:37:14PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Have libmpathpersist_{init,exit} do the udev initialization, too.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathpersist/mpath_persist.c | 11 ++++++++---
>  libmpathpersist/mpath_persist.h |  9 ++++++---
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
> index a529a38..873b419 100644
> --- a/libmpathpersist/mpath_persist.c
> +++ b/libmpathpersist/mpath_persist.c
> @@ -48,6 +48,10 @@ int libmpathpersist_init(void)
>  	struct config *conf;
>  	int rc = 0;
>  
> +	if (libmultipath_init()) {
> +		condlog(0, "Failed to initialize libmultipath.");
> +		return 1;
> +	}
>  	if (init_config(DEFAULT_CONFIGFILE)) {
>  		condlog(0, "Failed to initialize multipath config.");
>  		return 1;
> @@ -74,23 +78,24 @@ mpath_lib_init (void)
>  
>  static void libmpathpersist_cleanup(void)
>  {
> -	dm_lib_exit();
>  	cleanup_prio();
>  	cleanup_checkers();
> +	libmultipath_exit();
> +	dm_lib_exit();
>  }
>  
>  int
>  mpath_lib_exit (struct config *conf)
>  {
> -	libmpathpersist_cleanup();
>  	free_config(conf);
> +	libmpathpersist_cleanup();
>  	return 0;
>  }
>  
>  int libmpathpersist_exit(void)
>  {
> -	libmpathpersist_cleanup();
>  	uninit_config();
> +	libmpathpersist_cleanup();
>  	return 0;
>  }
>  
> diff --git a/libmpathpersist/mpath_persist.h b/libmpathpersist/mpath_persist.h
> index 91606ef..5435eae 100644
> --- a/libmpathpersist/mpath_persist.h
> +++ b/libmpathpersist/mpath_persist.h
> @@ -176,7 +176,8 @@ struct prout_param_descriptor {		/* PROUT parameter descriptor */
>   *	Initialize device mapper multipath configuration. This function must be invoked first
>   *	before performing reservation management functions.
>   *	Either this function or mpath_lib_init() may be used.
> - *	Use this function to work with libmultipath's internal "struct config".
> + *	Use this function to work with libmultipath's internal "struct config"
> + *	and "struct udev". The latter will be initialized automatically.
>   *	Call libmpathpersist_exit() for cleanup.
>   * RESTRICTIONS:
>   *
> @@ -189,7 +190,8 @@ extern int libmpathpersist_init (void);
>   *	Initialize device mapper multipath configuration. This function must be invoked first
>   *	before performing reservation management functions.
>   *	Either this function or libmpathpersist_init() may be used.
> - *	Use this function to work with an application-specific "struct config".
> + *	Use this function to work with an application-specific "struct config"
> + *	and "struct udev". The latter must be initialized by the application.
>   *	Call mpath_lib_exit() for cleanup.
>   * RESTRICTIONS:
>   *
> @@ -211,9 +213,10 @@ extern int mpath_lib_exit (struct config *conf);
>  
>  /*
>   * DESCRIPTION :
> - *	Release device mapper multipath configuration. This function must be invoked after
> + *	Release device mapper multipath configuration a. This function must be invoked after
>   *	performing reservation management functions.
>   *	Use this after initialization with libmpathpersist_init().
> + *	Calling libmpathpersist_init() after libmpathpersist_exit() will fail.
>   * RESTRICTIONS:
>   *
>   * RETURNS: 0->Success, 1->Failed.
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

