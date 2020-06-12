Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 41E571F7234
	for <lists+dm-devel@lfdr.de>; Fri, 12 Jun 2020 04:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591928772;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l7Ly06FYjqK3F8VjwWzVi3hNnC+MG17PLe5IlQqzBfE=;
	b=ZUC+GEoyeZjwylOkA0dwZmPSigG3T+yV2g2ThqNGJ//XtdcXmHSm9E+6lKXCo4x9vci5Jz
	kKVJBGEdojS0bqKmZzPASsE95xXvOLRqL+UzBl3IWmTZBdThrSc7Ndz+b4l5C7pYKEthke
	MHIoOnygLo/yaJj9aB8ei910IdyVs28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-X65qMk4EMNqJma5SbQ0knw-1; Thu, 11 Jun 2020 22:26:10 -0400
X-MC-Unique: X65qMk4EMNqJma5SbQ0knw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41A8FA0BD7;
	Fri, 12 Jun 2020 02:26:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F020101E1C0;
	Fri, 12 Jun 2020 02:25:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F180E1809547;
	Fri, 12 Jun 2020 02:25:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05C2PQOE013875 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Jun 2020 22:25:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D5465118DF54; Fri, 12 Jun 2020 02:25:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0D25118DF5C
	for <dm-devel@redhat.com>; Fri, 12 Jun 2020 02:25:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 558D7811E7A
	for <dm-devel@redhat.com>; Fri, 12 Jun 2020 02:25:24 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-131-6uNvp_sNNsqC3xmhanuaPw-1; Thu, 11 Jun 2020 22:25:21 -0400
X-MC-Unique: 6uNvp_sNNsqC3xmhanuaPw-1
Received: by mail-wm1-f67.google.com with SMTP id c71so6689375wmd.5;
	Thu, 11 Jun 2020 19:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HidI6gwh3UMPw0PMeSXiiV17L9iPdMqGB+7ELF+pYMM=;
	b=Bm9+8tMP75lLqO+70mPjZDCDu/yysIIKPife2MV0GZzKniB0oYovoBBNV7g19O/AG7
	lnAufp7fE6ayK+Gaw51DOLALluMtNNo1CHcUkoxaCt7NBzlahAsGawHMUmddq2l4BoZA
	hOIzDkdshk5XdI64NUvyMpVxmIlqdXv6owWLJDlC+00zS67uN3EcD78kTfeB6UsyWhxk
	lea+/Z1RK5orlcz2LgGxU0qkhxyYY+WN0wt3Siz6yRVF+VmzQXMEeZbPss9NY9C0v3d4
	04n7c3Vx7+EeN5XVWVwEvCG+mUe5zhiZN5kC4y3nH0BPiur+X5Zstfmh9VOtEguWSC6S
	eMkA==
X-Gm-Message-State: AOAM5321VQl+lvlKkW6MKiNbrArPlKyUgdSH0+08UOSn1NZEedGv6SLr
	M5K3FdsEmmlfRmFFiVm/3JJ6TPc=
X-Google-Smtp-Source: ABdhPJzKMmtdGuY58jp7vax34a8MsqpSGJScuzXPnTkS5sqpZJc+EwxwEhQNj2pYDMH+eZNJThmgrw==
X-Received: by 2002:a1c:7717:: with SMTP id t23mr10803069wmi.175.1591928720494;
	Thu, 11 Jun 2020 19:25:20 -0700 (PDT)
Received: from localhost (127.red-81-43-178.staticip.rima-tde.net.
	[81.43.178.127]) by smtp.gmail.com with ESMTPSA id
	t14sm7960257wrb.94.2020.06.11.19.25.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 11 Jun 2020 19:25:19 -0700 (PDT)
To: Marius Bakke <marius@devup.no>, DM-DEVEL ML <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
References: <20200516175508.12412-1-marius@devup.no>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <5310fd01-faa3-bf2c-5c49-b412d7e28e12@gmail.com>
Date: Fri, 12 Jun 2020 04:25:18 +0200
MIME-Version: 1.0
In-Reply-To: <20200516175508.12412-1-marius@devup.no>
Content-Language: en-US
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipath-tools: Fix compiler warnings when
 built without systemd.
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 5/16/20 7:55 PM, Marius Bakke wrote:

You should send it, at least, to the project maintainer.

> ---
>   libmultipath/config.c |  2 +-
>   multipathd/main.c     | 19 +++++++++++++------
>   2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index b4d87689..a28dc4f2 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -696,7 +696,7 @@ process_config_dir(struct config *conf, char *dir)
>   	pthread_cleanup_pop(1);
>   }
>   
> -static void set_max_checkint_from_watchdog(struct config *conf)
> +static void set_max_checkint_from_watchdog(__attribute__((unused)) struct config *conf)
>   {
>   #ifdef USE_SYSTEMD
>   	char *envp = getenv("WATCHDOG_USEC");
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 8baf9abe..8d3eace6 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -176,6 +176,7 @@ daemon_status(void)
>   /*
>    * I love you too, systemd ...
>    */
> +#ifdef USE_SYSTEMD
>   static const char *
>   sd_notify_status(enum daemon_status state)
>   {
> @@ -195,7 +196,6 @@ sd_notify_status(enum daemon_status state)
>   	return NULL;
>   }
>   
> -#ifdef USE_SYSTEMD
>   static void do_sd_notify(enum daemon_status old_state,
>   			 enum daemon_status new_state)
>   {
> @@ -247,7 +247,9 @@ enum daemon_status wait_for_state_change_if(enum daemon_status oldstate,
>   static void __post_config_state(enum daemon_status state)
>   {
>   	if (state != running_state && running_state != DAEMON_SHUTDOWN) {
> -		enum daemon_status old_state = running_state;
> +		/* save state for sd_notify */
> +		enum daemon_status
> +			__attribute__((unused)) old_state = running_state;
>   
>   		running_state = state;
>   		pthread_cond_broadcast(&config_cond);
> @@ -272,7 +274,9 @@ int set_config_state(enum daemon_status state)
>   	pthread_cleanup_push(config_cleanup, NULL);
>   	pthread_mutex_lock(&config_lock);
>   	if (running_state != state) {
> -		enum daemon_status old_state = running_state;
> +		/* save state for sd_notify */
> +		enum daemon_status
> +			__attribute__((unused)) old_state = running_state;
>   
>   		if (running_state == DAEMON_SHUTDOWN)
>   			rc = EINVAL;
> @@ -2280,7 +2284,6 @@ checkerloop (void *ap)
>   	struct timespec last_time;
>   	struct config *conf;
>   	int foreign_tick = 0;
> -	bool use_watchdog;
>   
>   	pthread_cleanup_push(rcu_unregister, NULL);
>   	rcu_register_thread();
> @@ -2292,11 +2295,15 @@ checkerloop (void *ap)
>   	get_monotonic_time(&last_time);
>   	last_time.tv_sec -= 1;
>   
> -	/* use_watchdog is set from process environment and never changes */
>   	conf = get_multipath_config();
> -	use_watchdog = conf->use_watchdog;
>   	put_multipath_config(conf);
>   
> +#ifdef USE_SYSTEMD
> +	/* use_watchdog is set from process environment and never changes */
> +	bool use_watchdog;
> +	use_watchdog = conf->use_watchdog;
> +#endif
> +
>   	while (1) {
>   		struct timespec diff_time, start_time, end_time;
>   		int num_paths = 0, strict_timing, rc = 0;
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

