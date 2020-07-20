Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2F922563D
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 05:45:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595216728;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3PriaofO8rAnO0oiYpY1IgqJGHew6Ym/hfXYpEA1XOM=;
	b=WgnIWjWNHo9k6HuqnAxuoCbFk8i6PIPFcbd4RTU8hjIH+HZDbeglMJXRuhrT0fz6bD8yqX
	vWuTwP3bDEG5zSWR4LbJ2WxGHllPHltehf1Ab3bf75ws1kCHY8Dybv5OUx8TqDTieaES8R
	Z9bAo9tTQIlUErVVotX7zao+U42rkNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-1uG-CUw2Osq9Yk2QXB1JsQ-1; Sun, 19 Jul 2020 23:45:25 -0400
X-MC-Unique: 1uG-CUw2Osq9Yk2QXB1JsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F17F91005260;
	Mon, 20 Jul 2020 03:45:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82ABB16C01;
	Mon, 20 Jul 2020 03:45:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62CB394EFC;
	Mon, 20 Jul 2020 03:45:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K3j0er018835 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Jul 2020 23:45:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 885172B5B6; Mon, 20 Jul 2020 03:45:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB19116C01;
	Mon, 20 Jul 2020 03:44:57 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06K3iugV013363; 
	Sun, 19 Jul 2020 22:44:56 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06K3itkJ013362;
	Sun, 19 Jul 2020 22:44:55 -0500
Date: Sun, 19 Jul 2020 22:44:55 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200720034455.GA11089@octiron.msp.redhat.com>
References: <20200709110330.9917-1-mwilck@suse.com>
	<20200709110330.9917-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709110330.9917-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 76/80] libmultipath: select_action(): force
 udev reload for uninitialized maps
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 01:03:26PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> If we are in the reconfigure() code path, and we encounter maps to
> be reloaded, we usually set the DM_SUBSYSTEM_UDEV_FLAG0 flag to tell
> udev not to repeat device detection steps above the multipath layer.
> However, if the map was previously uninitialized, we have to force
> udev to reload.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/configure.c | 61 ++++++++++++++++++++++++----------------
>  1 file changed, 37 insertions(+), 24 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index 2509053..efb5808 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -660,6 +660,32 @@ sysfs_set_max_sectors_kb(struct multipath *mpp, int is_reload)
>  	return err;
>  }
>  
> +static void
> +select_reload_action(struct multipath *mpp, const char *reason)
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

This looks like it wants multipath to check if there are valid devices
before setting force reload.  But looking at the udev rules, I'm pretty
sure it's safe. If we have no valid paths, then we will have

ENV{DM_NOSCAN}="1 and ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"

which means it doesn't matter that force_udev_reload will cause

ENV{DM_ACTIVATION}="1" and ENV{MPATH_UNCHANGED}=""

It does get sort of confusing with the number of udev properties that can
effect things.  So nothing really needs to get done for this to be
correct, but perhaps this code should only set force reload is there are
valid paths, just to be clear.

-Ben

> +	mpp_ud = get_udev_for_mpp(mpp);
> +	env = udev_device_get_property_value(mpp_ud, "MPATH_DEVICE_READY");
> +	if (!env || strcmp(env, "1"))
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
> @@ -728,9 +754,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  	if (mpp->no_path_retry != NO_PATH_RETRY_UNDEF &&
>  	    !!strstr(mpp->features, "queue_if_no_path") !=
>  	    !!strstr(cmpp->features, "queue_if_no_path")) {
> -		mpp->action =  ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (no_path_retry change)",
> -			mpp->alias);
> +		select_reload_action(cmpp, "no_path_retry change");
>  		return;
>  	}
>  	if ((mpp->retain_hwhandler != RETAIN_HWHANDLER_ON ||
> @@ -738,9 +762,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  	    (strlen(cmpp->hwhandler) != strlen(mpp->hwhandler) ||
>  	     strncmp(cmpp->hwhandler, mpp->hwhandler,
>  		    strlen(mpp->hwhandler)))) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (hwhandler change)",
> -			mpp->alias);
> +		select_reload_action(cmpp, "hwhandler change");
>  		return;
>  	}
>  
> @@ -748,9 +770,7 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  	    !!strstr(mpp->features, "retain_attached_hw_handler") !=
>  	    !!strstr(cmpp->features, "retain_attached_hw_handler") &&
>  	    get_linux_version_code() < KERNEL_VERSION(4, 3, 0)) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (retain_hwhandler change)",
> -			mpp->alias);
> +		select_reload_action(cmpp, "retain_hwhandler change");
>  		return;
>  	}
>  
> @@ -762,9 +782,10 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  		remove_feature(&cmpp_feat, "queue_if_no_path");
>  		remove_feature(&cmpp_feat, "retain_attached_hw_handler");
>  		if (strncmp(mpp_feat, cmpp_feat, PARAMS_SIZE)) {
> -			mpp->action =  ACT_RELOAD;
> -			condlog(3, "%s: set ACT_RELOAD (features change)",
> -				mpp->alias);
> +			select_reload_action(cmpp, "features change");
> +			FREE(cmpp_feat);
> +			FREE(mpp_feat);
> +			return;
>  		}
>  	}
>  	FREE(cmpp_feat);
> @@ -772,27 +793,19 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
>  
>  	if (!cmpp->selector || strncmp(cmpp->selector, mpp->selector,
>  		    strlen(mpp->selector))) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (selector change)",
> -			mpp->alias);
> +		select_reload_action(cmpp, "selector change");
>  		return;
>  	}
>  	if (cmpp->minio != mpp->minio) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (minio change, %u->%u)",
> -			mpp->alias, cmpp->minio, mpp->minio);
> +		select_reload_action(cmpp, "minio change");
>  		return;
>  	}
>  	if (!cmpp->pg || VECTOR_SIZE(cmpp->pg) != VECTOR_SIZE(mpp->pg)) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (path group number change)",
> -			mpp->alias);
> +		select_reload_action(cmpp, "path group number change");
>  		return;
>  	}
>  	if (pgcmp(mpp, cmpp)) {
> -		mpp->action = ACT_RELOAD;
> -		condlog(3, "%s: set ACT_RELOAD (path group topology change)",
> -			mpp->alias);
> +		select_reload_action(cmpp, "path group topology change");
>  		return;
>  	}
>  	if (cmpp->nextpg != mpp->bestpg) {
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

