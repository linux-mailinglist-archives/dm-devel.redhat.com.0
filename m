Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B2305292E33
	for <lists+dm-devel@lfdr.de>; Mon, 19 Oct 2020 21:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603134510;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WPXqPcshMepmZOjkqW9h1LmqMy2/U+NwpPWURW6u9s0=;
	b=J9FES9ZR+Wxsj4L2i1NGYhSZdN9XWZEeqsW1gBH4Ty+/r06iwR+6qdwLCMAYRVrXXbB6Sj
	awRz6b5j9nD0/3bLWU4Ez3k1vWe2u593OuC/MwMJ/aqUakvoDt6GqhicLEK5JltbErQXWy
	g49n5GLZ9mcAylaAL4d9LE37MESB7c8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-uuW5h7fBPwK8aDvRmo0wzg-1; Mon, 19 Oct 2020 15:08:25 -0400
X-MC-Unique: uuW5h7fBPwK8aDvRmo0wzg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BFA8ADC22;
	Mon, 19 Oct 2020 19:08:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F82C1056340;
	Mon, 19 Oct 2020 19:08:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CAC08C7AE;
	Mon, 19 Oct 2020 19:08:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JJ7tPB022436 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 15:07:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52FBB68D84; Mon, 19 Oct 2020 19:07:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9163A6147F;
	Mon, 19 Oct 2020 19:07:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09JJ7nwC013854; 
	Mon, 19 Oct 2020 14:07:49 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09JJ7mTW013853;
	Mon, 19 Oct 2020 14:07:48 -0500
Date: Mon, 19 Oct 2020 14:07:48 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201019190748.GD3384@octiron.msp.redhat.com>
References: <20201016104501.8700-1-mwilck@suse.com>
	<20201016104501.8700-15-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201016104501.8700-15-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 14/29] libmultipath: add libmp_dm_exit()
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 16, 2020 at 12:44:46PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This function prepares for calling dm_lib_exit() on program exit.
> It undoes changes to libdm internals done by libmultipath.
> It doesn't call dm_lib_exit(), as the caller may want to keep
> libdm active.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/config.c    |  1 +
>  libmultipath/config.h    |  2 ++
>  libmultipath/devmapper.c | 15 +++++++++++++++
>  libmultipath/devmapper.h |  1 +
>  4 files changed, 19 insertions(+)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index f74417c..b9cb413 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -60,6 +60,7 @@ int libmultipath_init(void)
>  static void _libmultipath_exit(void)
>  {
>  	libmultipath_exit_called = true;
> +	libmp_dm_exit();
>  	udev_unref(udev);
>  }
>  
> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index f478df7..5d46035 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -271,6 +271,8 @@ int libmultipath_init(void);
>   *
>   * This function un-initializes libmultipath data structures.
>   * It is recommended to call this function at program exit.
> + * If the application also calls dm_lib_exit(), it should do so
> + * after libmultipath_exit().
>   *
>   * Calls to libmultipath_init() after libmultipath_exit() will fail
>   * (in other words, libmultipath can't be re-initialized).
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 2e3ae8a..a8e0611 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -333,6 +333,20 @@ void libmp_udev_set_sync_support(int on)
>  	libmp_dm_udev_sync = !!on;
>  }
>  
> +static bool libmp_dm_init_called;
> +void libmp_dm_exit(void)
> +{
> +	if (!libmp_dm_init_called)
> +		return;
> +
> +	/* switch back to default libdm logging */
> +	dm_log_init(NULL);
> +#ifdef LIBDM_API_HOLD_CONTROL
> +	/* make sure control fd is closed in dm_lib_release() */
> +	dm_hold_control_dev(0);
> +#endif
> +}
> +
>  static void libmp_dm_init(void)
>  {
>  	struct config *conf;
> @@ -349,6 +363,7 @@ static void libmp_dm_init(void)
>  	dm_hold_control_dev(1);
>  #endif
>  	dm_udev_set_sync_support(libmp_dm_udev_sync);
> +	libmp_dm_init_called = true;
>  }
>  
>  static void _do_skip_libmp_dm_init(void)
> diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
> index 158057e..ecf2e66 100644
> --- a/libmultipath/devmapper.h
> +++ b/libmultipath/devmapper.h
> @@ -35,6 +35,7 @@ enum {
>  
>  int dm_prereq(unsigned int *v);
>  void skip_libmp_dm_init(void);
> +void libmp_dm_exit(void);
>  void libmp_udev_set_sync_support(int on);
>  struct dm_task *libmp_dm_task_create(int task);
>  int dm_simplecmd_flush (int, const char *, uint16_t);
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

