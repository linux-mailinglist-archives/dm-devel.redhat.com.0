Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC55279478
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 01:04:32 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601075071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5zT6DhmQ3ISS2NQv1nVrDcGicp5Wd4FCzWu+eyUmVc4=;
	b=Nnepxu6AfkErdpyyvbwqDIlr/O19C3QaFwjFZe8s8slB8OiCHpt/9s55Prwj/rGQrA7wzh
	5Ak3HP1ChXjRSklgrAtvjUH7FliEDkXLS9QDDnnfqvvXFBD6558z5fFdtOgr8d0fBStgmK
	KR8vfgcjsoX6JxZAsxxVj/XmxXynW+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-Y76WD2qrOse3_gv-DSNEng-1; Fri, 25 Sep 2020 19:04:27 -0400
X-MC-Unique: Y76WD2qrOse3_gv-DSNEng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA821DDFF;
	Fri, 25 Sep 2020 23:04:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE9519C66;
	Fri, 25 Sep 2020 23:04:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDEE18C7A0;
	Fri, 25 Sep 2020 23:04:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PN3nNB008263 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 19:03:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60A105C1C4; Fri, 25 Sep 2020 23:03:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 681015C1BB;
	Fri, 25 Sep 2020 23:03:46 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08PN3iCY004794; 
	Fri, 25 Sep 2020 18:03:44 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08PN3i0I004793;
	Fri, 25 Sep 2020 18:03:44 -0500
Date: Fri, 25 Sep 2020 18:03:43 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200925230343.GD3384@octiron.msp.redhat.com>
References: <20200924133716.14120-1-mwilck@suse.com>
	<20200924133716.14120-18-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924133716.14120-18-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 17/21] libmultipath: add udev and logsink
	symbols
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:37:12PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> With these symbols added, applications using libmultipath don't
> need to define global variables "udev" and "logsink" any more.
> This comes at the cost of having to call an init function.
> Currently, libmultipath_init() does nothing but initialize
> "udev".
> 
> The linker's symbol lookup order still allows applications to use
> their own "logsink" and "udev" variables, which will take precendence
> over libmultipath's internal ones. In this case, calling
> libmultipath_init() can be skipped, but like before,
> udev should be initialized (using udev_new()) before making any
> libmultipath calls.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/config.c             | 46 +++++++++++++++++++++++++++++++
>  libmultipath/config.h             | 46 ++++++++++++++++++++++++++++++-
>  libmultipath/debug.c              |  2 ++
>  libmultipath/libmultipath.version |  8 ++++++
>  4 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index 01b77df..fbb66b3 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -27,6 +27,52 @@
>  #include "mpath_cmd.h"
>  #include "propsel.h"
>  
> +/*
> + * We don't support re-initialization after
> + * libmultipath_exit().
> + */
> +static bool libmultipath_exit_called;
> +static pthread_once_t _init_once = PTHREAD_ONCE_INIT;
> +static pthread_once_t _exit_once = PTHREAD_ONCE_INIT;
> +struct udev *udev;
> +
> +static void _udev_init(void)
> +{
> +	if (udev)
> +		udev_ref(udev);
> +	else
> +		udev = udev_new();
> +	if (!udev)
> +		condlog(0, "%s: failed to initialize udev", __func__);
> +}
> +
> +static void _libmultipath_init(void)
> +{
> +	_udev_init();
> +}

I don't understand why we need both _udev_init() and
_libmultipath_init().

-Ben

> +
> +static bool _is_libmultipath_initialized(void)
> +{
> +	return !libmultipath_exit_called && !!udev;
> +}
> +
> +int libmultipath_init(void)
> +{
> +	pthread_once(&_init_once, _libmultipath_init);
> +	return !_is_libmultipath_initialized();
> +}
> +
> +static void _libmultipath_exit(void)
> +{
> +	libmultipath_exit_called = true;
> +	udev_unref(udev);
> +}
> +
> +void libmultipath_exit(void)
> +{
> +	pthread_once(&_exit_once, _libmultipath_exit);
> +}
> +
>  static struct config __internal_config;
>  struct config *libmp_get_multipath_config(void)
>  {
> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index 5997b71..dac4e8f 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -232,7 +232,51 @@ struct config {
>  	char *enable_foreign;
>  };
>  
> -extern struct udev * udev;
> +/**
> + * extern variable: udev
> + *
> + * A &struct udev instance used by libmultipath. libmultipath expects
> + * a valid, initialized &struct udev in this variable.
> + * An application can define this variable itself, in which case
> + * the applications's instance will take precedence.
> + * The application can initialize and destroy this variable by
> + * calling libmultipath_init() and libmultipath_exit(), respectively,
> + * whether or not it defines the variable itself.
> + * An application can initialize udev with udev_new() before calling
> + * libmultipath_init(), e.g. if it has to make libudev calls before
> + * libmultipath calls. If an application wants to keep using the
> + * udev variable after calling libmultipath_exit(), it should have taken
> + * an additional reference on it beforehand. This is the case e.g.
> + * after initiazing udev with udev_new().
> + */
> +extern struct udev *udev;
> +
> +/**
> + * libmultipath_init() - library initialization
> + *
> + * This function initializes libmultipath data structures.
> + * It is light-weight; some other initializations, like device-mapper
> + * initialization, are done lazily when the respective functionality
> + * is required.
> + *
> + * Clean up by libmultipath_exit() when the program terminates.
> + * It is an error to call libmultipath_init() after libmultipath_exit().
> + * Return: 0 on success, 1 on failure.
> + */
> +int libmultipath_init(void);
> +
> +/**
> + * libmultipath_exit() - library un-initialization
> + *
> + * This function un-initializes libmultipath data structures.
> + * It is recommended to call this function at program exit.
> + *
> + * Calls to libmultipath_init() after libmultipath_exit() will fail
> + * (in other words, libmultipath can't be re-initialized).
> + * Any other libmultipath calls after libmultipath_exit() may cause
> + * undefined behavior.
> + */
> +void libmultipath_exit(void);
>  
>  int find_hwe (const struct _vector *hwtable,
>  	      const char * vendor, const char * product, const char *revision,
> diff --git a/libmultipath/debug.c b/libmultipath/debug.c
> index 4128cb9..b3a1de9 100644
> --- a/libmultipath/debug.c
> +++ b/libmultipath/debug.c
> @@ -15,6 +15,8 @@
>  #include "defaults.h"
>  #include "debug.h"
>  
> +int logsink;
> +
>  void dlog (int sink, int prio, const char * fmt, ...)
>  {
>  	va_list ap;
> diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
> index 81bcc9d..2e531ef 100644
> --- a/libmultipath/libmultipath.version
> +++ b/libmultipath/libmultipath.version
> @@ -228,3 +228,11 @@ global:
>  	init_config;
>  	uninit_config;
>  } LIBMULTIPATH_0.8.4.2;
> +
> +LIBMULTIPATH_0.8.4.4 {
> +global:
> +	udev;
> +	logsink;
> +	libmultipath_init;
> +	libmultipath_exit;
> +} LIBMULTIPATH_0.8.4.3;
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

