Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 08A0924A7DF
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 22:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597869994;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eSOmP+4veq9jPCZYHQvCfgDFw/MNus1oG0VzDX2O57g=;
	b=RCh5kbxMw6g+EcaivGeWiGf0Z+p1dvE8uiqmSLqTWhepCkySK/k8vRF/ATrZxgFek/uhVN
	xBZi6lQsvFeTIxOPxz73YIJTOo28sPgxzVWtDBw19BntO/g9SmdxvsQ3246Nlm4KzLZWSD
	RJ6uWtaVPWV86ERkF+nfbsTbgf6eYnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-RmqnFxcLOS6adrlfQP2QxA-1; Wed, 19 Aug 2020 16:46:31 -0400
X-MC-Unique: RmqnFxcLOS6adrlfQP2QxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06DAE51B3;
	Wed, 19 Aug 2020 20:46:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F30B96F120;
	Wed, 19 Aug 2020 20:46:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB95D1832FC2;
	Wed, 19 Aug 2020 20:46:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JKjkkf009552 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 16:45:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A6B3756B6; Wed, 19 Aug 2020 20:45:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02DEE60BF4;
	Wed, 19 Aug 2020 20:45:42 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07JKjfSp006643; 
	Wed, 19 Aug 2020 15:45:41 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07JKjfX0006642;
	Wed, 19 Aug 2020 15:45:41 -0500
Date: Wed, 19 Aug 2020 15:45:40 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200819204540.GR19233@octiron.msp.redhat.com>
References: <20200819131747.13400-1-mwilck@suse.com>
	<20200819131747.13400-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200819131747.13400-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 76/80] libmultipath: select_action():
 force udev reload for uninitialized maps
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

On Wed, Aug 19, 2020 at 03:17:46PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If we are in the reconfigure() code path, and we encounter maps to
> be reloaded, we usually set the DM_SUBSYSTEM_UDEV_FLAG0 flag to tell
> udev not to repeat device detection steps above the multipath layer.
> However, if the map was previously uninitialized, we have to force
> udev to reload.
> 

Better now.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/configure.c | 62 ++++++++++++++++++++++++----------------
>  1 file changed, 38 insertions(+), 24 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index cc54818..a492e0a 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -660,6 +660,33 @@ sysfs_set_max_sectors_kb(struct multipath *mpp, int is_reload)
>  	return err;
>  }
>  
> +static void
> +select_reload_action(struct multipath *mpp, const struct multipath *cmpp,
> +		     const char *reason)
> +{
> +	struct udev_device *mpp_ud;
> +	const char *env;
> +
> +	/*
> +	 * MPATH_DEVICE_READY != 1 can mean two things:
> +	 *  (a) no usable paths
> +	 *  (b) device was never fully processed (e.g. udev killed)
> +	 * If we are in this code path (startup or forced reconfigure),
> +	 * (b) can mean that upper layers like kpartx have never been
> +	 * run for this map. Thus force udev reload.
> +	 */
> +
> +	mpp_ud = get_udev_for_mpp(cmpp);
> +	env = udev_device_get_property_value(mpp_ud, "MPATH_DEVICE_READY");
> +	if ((!env || strcmp(env, "1")) && count_active_paths(mpp) > 0)
> +		mpp->force_udev_reload = 1;
> +	udev_device_unref(mpp_ud);
> +	mpp->action = ACT_RELOAD;
> +	condlog(3, "%s: set ACT_RELOAD (%s%s)", mpp->alias,
> +		mpp->force_udev_reload ? "forced, " : "",
> +		reason);
> +}
> +
>  static void
>  select_action (struct multipath * mpp, vector curmp, int force_reload)
>  {
> @@ -728,9 +755,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  	if (mpp->no_path_retry != NO_PATH_RETRY_UNDEF &&
>  	    !!strstr(mpp->features, "queue_if_no_path") !=
>  	    !!strstr(cmpp->features, "queue_if_no_path")) {
> -		mpp->action =  ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (no_path_retry change)",
> -			mpp->alias);
> +		select_reload_action(mpp, cmpp, "no_path_retry change");
>  		return;
>  	}
>  	if ((mpp->retain_hwhandler != RETAIN_HWHANDLER_ON ||
> @@ -738,9 +763,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  	    (strlen(cmpp->hwhandler) != strlen(mpp->hwhandler) ||
>  	     strncmp(cmpp->hwhandler, mpp->hwhandler,
>  		    strlen(mpp->hwhandler)))) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (hwhandler change)",
> -			mpp->alias);
> +		select_reload_action(mpp, cmpp, "hwhandler change");
>  		return;
>  	}
>  
> @@ -748,9 +771,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  	    !!strstr(mpp->features, "retain_attached_hw_handler") !=
>  	    !!strstr(cmpp->features, "retain_attached_hw_handler") &&
>  	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0)) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (retain_hwhandler change)",
> -			mpp->alias);
> +		select_reload_action(mpp, cmpp, "retain_hwhandler change");
>  		return;
>  	}
>  
> @@ -762,9 +783,10 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  		remove_feature(&cmpp_feat, "queue_if_no_path");
>  		remove_feature(&cmpp_feat, "retain_attached_hw_handler");
>  		if (strncmp(mpp_feat, cmpp_feat, PARAMS_SIZE)) {
> -			mpp->action =  ACT_RELOAD;
> -			condlog(3, "%s: set ACT_RELOAD (features change)",
> -				mpp->alias);
> +			select_reload_action(mpp, cmpp, "features change");
> +			FREE(cmpp_feat);
> +			FREE(mpp_feat);
> +			return;
>  		}
>  	}
>  	FREE(cmpp_feat);
> @@ -772,27 +794,19 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  
>  	if (!cmpp->selector || strncmp(cmpp->selector, mpp->selector,
>  		    strlen(mpp->selector))) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (selector change)",
> -			mpp->alias);
> +		select_reload_action(mpp, cmpp, "selector change");
>  		return;
>  	}
>  	if (cmpp->minio != mpp->minio) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (minio change, %u->%u)",
> -			mpp->alias, cmpp->minio, mpp->minio);
> +		select_reload_action(mpp, cmpp, "minio change");
>  		return;
>  	}
>  	if (!cmpp->pg || VECTOR_SIZE(cmpp->pg) != VECTOR_SIZE(mpp->pg)) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (path group number change)",
> -			mpp->alias);
> +		select_reload_action(mpp, cmpp, "path group number change");
>  		return;
>  	}
>  	if (pgcmp(mpp, cmpp)) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (path group topology change)",
> -			mpp->alias);
> +		select_reload_action(mpp, cmpp, "path group topology change");
>  		return;
>  	}
>  	if (cmpp->nextpg != mpp->bestpg) {
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

