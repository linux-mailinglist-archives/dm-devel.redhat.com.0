Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 985FE273383
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 22:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600719082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zjvorf+Yp1+tAraw9m2Qi+jU4ZbXVeXrs9nKBL1hL48=;
	b=VekE5sL2Gza7yeO2IjBsOPl6fJiZwGZ6RWq5rDfDySqGgGkgmAhpVvIBZ63ufHxT7fjF9I
	i6ChkpiN2xpLAIQE4UInCyFI5c44IVeJM5YByPN050N9aWqctCu+gO4kONSxBo+iWTGWSk
	vIZuDQaGClkj6GD5pQdt6MKcwPRuGmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-a06c7lBjPmS9eCb6nq6h_w-1; Mon, 21 Sep 2020 16:11:19 -0400
X-MC-Unique: a06c7lBjPmS9eCb6nq6h_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E8DC10BBEC1;
	Mon, 21 Sep 2020 20:11:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0C15277B7;
	Mon, 21 Sep 2020 20:11:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7B218C7AA;
	Mon, 21 Sep 2020 20:11:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LKAwGM007551 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 16:10:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43B2A19744; Mon, 21 Sep 2020 20:10:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40C1919C4F;
	Mon, 21 Sep 2020 20:10:55 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08LKAr9w000469; 
	Mon, 21 Sep 2020 15:10:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08LKArVn000468;
	Mon, 21 Sep 2020 15:10:53 -0500
Date: Mon, 21 Sep 2020 15:10:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200921201052.GY11108@octiron.msp.redhat.com>
References: <20200916153718.582-1-mwilck@suse.com>
	<20200916153718.582-18-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200916153718.582-18-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 17/19] libmultipath: add udev and logsink
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 16, 2020 at 05:37:16PM +0200, mwilck@suse.com wrote:
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
>  libmultipath/config.c | 22 ++++++++++++++++++++++
>  libmultipath/config.h |  4 +++-
>  libmultipath/debug.c  |  2 ++
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index b83e5cd..4b48b27 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -27,6 +27,28 @@
>  #include "mpath_cmd.h"
>  #include "propsel.h"
>  
> +static pthread_once_t _udev_once = PTHREAD_ONCE_INIT;
> +struct udev *udev;
> +
> +void _udev_init(void)
> +{
> +	udev = udev_new();
> +	if (!udev)
> +		condlog(0, "%s: failed to initialize udev", __func__);
> +}
> +
> +int libmultipath_init(void)
> +{
> +	if (!udev)
> +		pthread_once(&_udev_once, _udev_init);
> +	return udev ? 0 : 1;
> +}
> +
> +void libmultipath_exit(void)
> +{
> +	udev_unref(udev);
> +}

After calling libmultipath_exit(), you can never reinitialized the udev
device.  That seems fine, but it should probably set udev to null, so
that future calls to libmultipath_init() don't return success. Either
that or multipath_init() should use a mutex instead of pthread_once() to
avoid races, so that you can reinitialize udev after a call to
libmultipath_exit().

-Ben

> +
>  static struct config __internal_config;
>  struct config *libmp_get_multipath_config(void)
>  {
> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index 5997b71..541b2e4 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -232,7 +232,9 @@ struct config {
>  	char *enable_foreign;
>  };
>  
> -extern struct udev * udev;
> +extern struct udev *udev;
> +int libmultipath_init(void);
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
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

