Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 036291FC136
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jun 2020 23:54:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592344461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y1AqSNjUnWbXAjap56hts3jHtsZtjHN28r727cicg80=;
	b=e1+2coYDbK/P3QhX7Ttoy+CjmBW0qXFn9jmhhtO+sqD/LQze7z5YqmD1H/YiYqe2viWWln
	tbn151g6+tqD373426d3t3PyA4Z6dqidxjr2qDAoqNIgcX/5RSmivZ4SSVw4UJbbrbpzKg
	wMNKjPPwfrJZAtJG1KacZ2ZChri7ixo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-kGEbjc3PM8yi4w9fSR1wyw-1; Tue, 16 Jun 2020 17:54:17 -0400
X-MC-Unique: kGEbjc3PM8yi4w9fSR1wyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 090DC1883619;
	Tue, 16 Jun 2020 21:54:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D436C82473;
	Tue, 16 Jun 2020 21:54:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81DC21809547;
	Tue, 16 Jun 2020 21:53:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GLrUZD011651 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 17:53:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8950810CD910; Tue, 16 Jun 2020 21:53:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 848AE10CD914
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 21:53:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60F9A811768
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 21:53:27 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-210-PvHO53t_O-un36s32RV3Ow-1;
	Tue, 16 Jun 2020 17:53:25 -0400
X-MC-Unique: PvHO53t_O-un36s32RV3Ow-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id BBF29AC84;
	Tue, 16 Jun 2020 21:53:27 +0000 (UTC)
Message-ID: <d909fc0a2383f028ae7c3ad00c142193ca8d9ae7.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Marius Bakke <marius@devup.no>, dm-devel@redhat.com
Date: Tue, 16 Jun 2020 23:53:22 +0200
In-Reply-To: <20200516175508.12412-1-marius@devup.no>
References: <20200516175508.12412-1-marius@devup.no>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Marius,

On Sat, 2020-05-16 at 19:55 +0200, Marius Bakke wrote:
> ---
>  libmultipath/config.c |  2 +-
>  multipathd/main.c     | 19 +++++++++++++------
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 

thank you for the patch, and sorry for the late reply.
Thanks to Xose, too, for making me aware of it.

This patch needs some improvements, see remarks below.

In general, please note that the development and in particular the
testing of multipath-tools has been done almost exclusively on systems
using systemd for several years now. The compilation issues you
encountered may only be the tip of the iceberg. In particular, the udev
rules shipped with multipath-tools rely on systemd for proper device
setup.

> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index b4d87689..a28dc4f2 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -696,7 +696,7 @@ process_config_dir(struct config *conf, char
> *dir)
>  	pthread_cleanup_pop(1);
>  }
>  
> -static void set_max_checkint_from_watchdog(struct config *conf)
> +static void set_max_checkint_from_watchdog(__attribute__((unused))
> struct config *conf)

Rather than adding the attribute, please put the whole function in an
#if conditional, and the call in load_config(), too. We don't need this
without systemd.

>  {
>  #ifdef USE_SYSTEMD
>  	char *envp = getenv("WATCHDOG_USEC");
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 8baf9abe..8d3eace6 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -176,6 +176,7 @@ daemon_status(void)
>  /*
>   * I love you too, systemd ...
>   */
> +#ifdef USE_SYSTEMD
>  static const char *
>  sd_notify_status(enum daemon_status state)
>  {
> @@ -195,7 +196,6 @@ sd_notify_status(enum daemon_status state)
>  	return NULL;
>  }
>  
> -#ifdef USE_SYSTEMD
>  static void do_sd_notify(enum daemon_status old_state,
>  			 enum daemon_status new_state)
>  {
> @@ -247,7 +247,9 @@ enum daemon_status wait_for_state_change_if(enum
> daemon_status oldstate,
>  static void __post_config_state(enum daemon_status state)
>  {
>  	if (state != running_state && running_state != DAEMON_SHUTDOWN)
> {
> -		enum daemon_status old_state = running_state;
> +		/* save state for sd_notify */
> +		enum daemon_status
> +			__attribute__((unused)) old_state =
> running_state;

again, please put the declaration of old_state in an #if conditional.

>  
>  		running_state = state;
>  		pthread_cond_broadcast(&config_cond);
> @@ -272,7 +274,9 @@ int set_config_state(enum daemon_status state)
>  	pthread_cleanup_push(config_cleanup, NULL);
>  	pthread_mutex_lock(&config_lock);
>  	if (running_state != state) {
> -		enum daemon_status old_state = running_state;
> +		/* save state for sd_notify */
> +		enum daemon_status
> +			__attribute__((unused)) old_state =
> running_state;

likewise

>  
>  		if (running_state == DAEMON_SHUTDOWN)
>  			rc = EINVAL;
> @@ -2280,7 +2284,6 @@ checkerloop (void *ap)
>  	struct timespec last_time;
>  	struct config *conf;
>  	int foreign_tick = 0;
> -	bool use_watchdog;
>  
>  	pthread_cleanup_push(rcu_unregister, NULL);
>  	rcu_register_thread();
> @@ -2292,11 +2295,15 @@ checkerloop (void *ap)
>  	get_monotonic_time(&last_time);
>  	last_time.tv_sec -= 1;
>  
> -	/* use_watchdog is set from process environment and never
> changes */
>  	conf = get_multipath_config();
> -	use_watchdog = conf->use_watchdog;
>  	put_multipath_config(conf);
>  
> +#ifdef USE_SYSTEMD
> +	/* use_watchdog is set from process environment and never
> changes */
> +	bool use_watchdog;
> +	use_watchdog = conf->use_watchdog;
> +#endif
> +

This is wrong. You have to access conf between get_multipath_config()
and put_multipath_config().

I'd prefer to simply add conditionals around the declaration of
use_watchdog, both in the function header and where it's set.

Regards,
Martin

>  	while (1) {
>  		struct timespec diff_time, start_time, end_time;
>  		int num_paths = 0, strict_timing, rc = 0;


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

