Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 01BDB273286
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 21:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600715492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SvFSRIqcQ8Spl2g4gnSE4NvEq0OsASpk0cu79l8M1i4=;
	b=Ef0Q3YwXkYrVzvmch6iokMaOWTZTTaeLhmDEd9H+BULU7jnFaDQovgmM7W4Gmw/UpcUy3/
	hfWrk5czRympJd0pcJN75DDogB7mnuYx8Ysm3NSDQcVan2WvCsj3pppZk+dFb8trHgIu4v
	Gw1OS/0D71PmUaNmn5FVBsLqu13xsYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-HxRAHJsLMcapji-GiXHmvw-1; Mon, 21 Sep 2020 15:11:25 -0400
X-MC-Unique: HxRAHJsLMcapji-GiXHmvw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B5BA80F054;
	Mon, 21 Sep 2020 19:11:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E41B65C1D0;
	Mon, 21 Sep 2020 19:11:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B95A1888B46;
	Mon, 21 Sep 2020 19:11:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LJ96kw031317 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 15:09:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7474B1B57F; Mon, 21 Sep 2020 19:09:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F4D5DA7B;
	Mon, 21 Sep 2020 19:09:01 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08LJ90Du032677; 
	Mon, 21 Sep 2020 14:09:00 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08LJ8xSg032676;
	Mon, 21 Sep 2020 14:08:59 -0500
Date: Mon, 21 Sep 2020 14:08:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200921190859.GX11108@octiron.msp.redhat.com>
References: <20200916153718.582-1-mwilck@suse.com>
	<20200916153718.582-14-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200916153718.582-14-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 13/19] libmultipath: provide defaults for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 16, 2020 at 05:37:12PM +0200, mwilck@suse.com wrote:
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
> which always allocates a new struct for backward compatibility.
> free_config() can be used in both cases.

free_config() doesn't actually work for configs that are initialized by
init_config(). That's fine, but the commit message is wrong. Also, I
wonder if uninit_config() should zero out __internal_config, so that
it's in the same state as it was before init_config() is called.

-Ben

> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/config.c | 70 ++++++++++++++++++++++++++++++++++++-------
>  libmultipath/config.h | 21 +++++++++++--
>  2 files changed, 78 insertions(+), 13 deletions(-)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index 2011a29..b83e5cd 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -27,6 +27,23 @@
>  #include "mpath_cmd.h"
>  #include "propsel.h"
>  
> +static struct config __internal_config;
> +struct config *libmp_get_multipath_config(void)
> +{
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
> @@ -574,17 +591,15 @@ restart:
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
> @@ -650,7 +665,25 @@ free_config (struct config * conf)
>  	free_hwtable(conf->hwtable);
>  	free_hwe(conf->overrides);
>  	free_keywords(conf->keywords);
> -	FREE(conf);
> +}
> +
> +void uninit_config(void)
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
> @@ -719,12 +752,29 @@ static void set_max_checkint_from_watchdog(struct config *conf)
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
> @@ -896,10 +946,10 @@ struct config *load_config(const char *file)
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
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

