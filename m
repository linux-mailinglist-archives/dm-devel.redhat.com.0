Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 573C4277F16
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 06:35:32 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601008531;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SrveSKiKQsVVLdphc+VUN9bJQveteZs0Gezlh5WGZr8=;
	b=fjScz0NDU/CdRb4RlAhDrT38ptOmZEL0LzS8NsYDq63lfps5nnjanMXEO2HfbcV22JPqx7
	eclt5q5XIHPHVqZu+GbrinAHTvkaGo9kVDdbxlfypbq9jN9HsM1ZzZNaNy8fqH2Fhx8R31
	ZseZKN5jfXSWoO1cNHY++YVm2zoo1as=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-z61lk12tO5aTuI_uCjrtrQ-1; Fri, 25 Sep 2020 00:35:28 -0400
X-MC-Unique: z61lk12tO5aTuI_uCjrtrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41C9E10066FC;
	Fri, 25 Sep 2020 04:35:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8C460C17;
	Fri, 25 Sep 2020 04:35:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33CFF180B656;
	Fri, 25 Sep 2020 04:35:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08P4Z33q002008 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 00:35:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D061660C15; Fri, 25 Sep 2020 04:35:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEF8B60C07;
	Fri, 25 Sep 2020 04:35:00 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08P4Yx3o025262; 
	Thu, 24 Sep 2020 23:34:59 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08P4YwAS025261;
	Thu, 24 Sep 2020 23:34:58 -0500
Date: Thu, 24 Sep 2020 23:34:58 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200925043458.GO11108@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-14-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133716.14120-14-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 13/21] libmultipath: provide defaults for
 {get, put}_multipath_config
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:37:08PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Add an implementation of get_multipath_config() and put_multipath_config()
> to libmultipath. The linker's symbol lookup rules will make sure that
> applications can override these functions if they need to. Defining
> these functions in libmultipath avoids the need to provide stubs
> for these functions in every appliation linking to libmultipath.
> 
> libmultipath's internal functions simply refer to a static "struct config".
> It must be initialized with init_config() rather than load_config(),
> which always allocates a new struct for backward compatibility, and must
> be teared down using uninit_config().
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/config.c             | 75 ++++++++++++++++++++++++++-----
>  libmultipath/config.h             | 21 +++++++--
>  libmultipath/libmultipath.version | 10 +++++
>  3 files changed, 93 insertions(+), 13 deletions(-)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index 5c91a09..01b77df 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -27,6 +27,26 @@
>  #include "mpath_cmd.h"
>  #include "propsel.h"
>  
> +static struct config __internal_config;
> +struct config *libmp_get_multipath_config(void)

This causes problems with the libmpathvalid library code I wrote.  The
issue is that right now, when you run _init_config() if
get_multipath_config() returns NULL, you will use the default loglevel.
I would like the library user to have control of the log level, even
during the calls to _init_config().

One possiblity would be to make init_config() take verbosity as an
argument.  There would also need to be some other config variable that
gets set at the start of init_config(), which is used by
libmp_get_multipath_config() to check if it is initialized.

-Ben

> +{
> +	if (!__internal_config.hwtable)
> +		/* not initialized */
> +		return NULL;
> +	return &__internal_config;
> +}
> +
> +struct config *get_multipath_config(void)
> +	__attribute__((weak, alias("libmp_get_multipath_config")));
> +
> +void libmp_put_multipath_config(void *conf __attribute__((unused)))
> +{
> +	/* empty */
> +}
> +
> +void put_multipath_config(void *conf)
> +	__attribute__((weak, alias("libmp_put_multipath_config")));
> +
>  static int
>  hwe_strmatch (const struct hwentry *hwe1, const struct hwentry *hwe2)
>  {
> @@ -574,17 +594,15 @@ restart:
>  	return;
>  }
>  
> -struct config *
> -alloc_config (void)
> +static struct config *alloc_config (void)
>  {
>  	return (struct config *)MALLOC(sizeof(struct config));
>  }
>  
> -void
> -free_config (struct config * conf)
> +static void _uninit_config(struct config *conf)
>  {
>  	if (!conf)
> -		return;
> +		conf = &__internal_config;
>  
>  	if (conf->multipath_dir)
>  		FREE(conf->multipath_dir);
> @@ -650,7 +668,27 @@ free_config (struct config * conf)
>  	free_hwtable(conf->hwtable);
>  	free_hwe(conf->overrides);
>  	free_keywords(conf->keywords);
> -	FREE(conf);
> +
> +	memset(conf, 0, sizeof(*conf));
> +}
> +
> +void uninit_config(void)

I didn't realize that this was o.k. I thought you had to specify static
in the function definition, even if it was specified in the protype.

> +{
> +	_uninit_config(&__internal_config);
> +}
> +
> +void free_config(struct config *conf)
> +{
> +	if (!conf)
> +		return;
> +	else if (conf == &__internal_config) {
> +		condlog(0, "ERROR: %s called for internal config. Use uninit_config() instead",
> +			__func__);
> +		return;
> +	}
> +
> +	_uninit_config(conf);
> +	free(conf);
>  }
>  
>  /* if multipath fails to process the config directory, it should continue,
> @@ -719,12 +757,29 @@ static void set_max_checkint_from_watchdog(struct config *conf)
>  }
>  #endif
>  
> +static int _init_config (const char *file, struct config *conf);
> +
> +int init_config(const char *file)
> +{
> +	return _init_config(file, &__internal_config);
> +}
> +
>  struct config *load_config(const char *file)
>  {
>  	struct config *conf = alloc_config();
>  
> +	if (conf && !_init_config(file, conf))
> +		return conf;
> +
> +	free(conf);
> +	return NULL;
> +}
> +
> +int _init_config (const char *file, struct config *conf)
> +{
> +
>  	if (!conf)
> -		return NULL;
> +		conf = &__internal_config;
>  
>  	/*
>  	 * internal defaults
> @@ -896,10 +951,10 @@ struct config *load_config(const char *file)
>  	    !conf->wwids_file || !conf->prkeys_file)
>  		goto out;
>  
> -	return conf;
> +	return 0;
>  out:
> -	free_config(conf);
> -	return NULL;
> +	_uninit_config(conf);
> +	return 1;
>  }
>  
>  char *get_uid_attribute_by_attrs(struct config *conf,
> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index 116fe37..5997b71 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -251,10 +251,25 @@ void free_mptable (vector mptable);
>  int store_hwe (vector hwtable, struct hwentry *);
>  
>  struct config *load_config (const char *file);
> -struct config * alloc_config (void);
>  void free_config (struct config * conf);
> -extern struct config *get_multipath_config(void);
> -extern void put_multipath_config(void *);
> +int init_config(const char *file);
> +void uninit_config(void);
> +
> +/*
> + * libmultipath provides default implementations of
> + * get_multipath_config() and put_multipath_config().
> + * Applications using these should use init_config(file, NULL)
> + * to load the configuration, rather than load_config(file).
> + * Likewise, uninit_config() should be used for teardown, but
> + * using free_config() for that is supported, too.
> + * Applications can define their own {get,put}_multipath_config()
> + * functions, which override the library-internal ones, but
> + * could still call libmp_{get,put}_multipath_config().
> + */
> +struct config *libmp_get_multipath_config(void);
> +struct config *get_multipath_config(void);
> +void libmp_put_multipath_config(void *);
> +void put_multipath_config(void *);
>  
>  int parse_uid_attrs(char *uid_attrs, struct config *conf);
>  char *get_uid_attribute_by_attrs(struct config *conf,
> diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
> index 0a96010..81bcc9d 100644
> --- a/libmultipath/libmultipath.version
> +++ b/libmultipath/libmultipath.version
> @@ -218,3 +218,13 @@ global:
>  	libmp_dm_task_run;
>  	cleanup_mutex;
>  } LIBMULTIPATH_0.8.4.1;
> +
> +LIBMULTIPATH_0.8.4.3 {
> +global:
> +	libmp_get_multipath_config;
> +	get_multipath_config;
> +	libmp_put_multipath_config;
> +	put_multipath_config;
> +	init_config;
> +	uninit_config;
> +} LIBMULTIPATH_0.8.4.2;
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

