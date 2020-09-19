Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5320B271014
	for <lists+dm-devel@lfdr.de>; Sat, 19 Sep 2020 21:01:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600542111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aZLBV19U5/5UuRs/jrP1bjIJ/JJVbQ4jXVzfUsaxn44=;
	b=DN8aG1WwNG7o+/7Q+x7mrEwGUWodCjY3lp0+NCr9pFPDGpnpx20OjDDze2R5hAUr74uZOe
	NtAvPVl81kXWNorjlaGUu01DBYXaA/b+QQLe8vFXVZVpD3iA63feliu/3RY6vyy7/2kkgN
	NvX+TnYWoFYp29TWCv6y8ES7MwIHgD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-jOAouaM8P5izancdSJe_Zw-1; Sat, 19 Sep 2020 15:01:48 -0400
X-MC-Unique: jOAouaM8P5izancdSJe_Zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2646802B69;
	Sat, 19 Sep 2020 19:01:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE4DC1002D63;
	Sat, 19 Sep 2020 19:01:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D77E44A47;
	Sat, 19 Sep 2020 19:01:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08JJ18CM016166 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 19 Sep 2020 15:01:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2070860C47; Sat, 19 Sep 2020 19:01:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 775C860C84;
	Sat, 19 Sep 2020 19:01:04 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08JJ12o0018297; 
	Sat, 19 Sep 2020 14:01:02 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08JJ118m018111;
	Sat, 19 Sep 2020 14:01:01 -0500
Date: Sat, 19 Sep 2020 14:01:01 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200919190101.GV11108@octiron.msp.redhat.com>
References: <20200916153718.582-1-mwilck@suse.com>
	<20200916153718.582-8-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200916153718.582-8-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 07/19] multipathd: set_config_state(): avoid
 code duplication
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 16, 2020 at 05:37:06PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Use __post_config_state() and __wait_for_state_change(). This
> way __post_config_state() is the only place where running_state
> is ever changed, and we avoid code duplication.
> 

It's only tangentially related to this patch, but it's possible for
set_conf_state() to timeout, and we'd don't always retry it. That's
fine, be we don't always check for failure and notify the user that the
reconfigure isn't happening, and we probably should. But the patch
itself is fine.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com> 

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/main.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 49809e0..a5c4031 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -292,27 +292,14 @@ int set_config_state(enum daemon_status state)
>  	pthread_cleanup_push(config_cleanup, NULL);
>  	pthread_mutex_lock(&config_lock);
>  	if (running_state != state) {
> -#ifdef USE_SYSTEMD
> -		enum daemon_status old_state = running_state;
> -#endif
>  
>  		if (running_state == DAEMON_SHUTDOWN)
>  			rc = EINVAL;
> -		else if (running_state != DAEMON_IDLE) {
> -			struct timespec ts;
> -
> -			get_monotonic_time(&ts);
> -			ts.tv_sec += 1;
> -			rc = pthread_cond_timedwait(&config_cond,
> -						    &config_lock, &ts);
> -		}
> -		if (!rc && (running_state != DAEMON_SHUTDOWN)) {
> -			running_state = state;
> -			pthread_cond_broadcast(&config_cond);
> -#ifdef USE_SYSTEMD
> -			do_sd_notify(old_state, state);
> -#endif
> -		}
> +		else
> +			rc = __wait_for_state_change(
> +				running_state != DAEMON_IDLE, 1000);
> +		if (!rc)
> +			__post_config_state(state);
>  	}
>  	pthread_cleanup_pop(1);
>  	return rc;
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

