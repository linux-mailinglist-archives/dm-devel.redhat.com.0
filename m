Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A2CDE27B4AF
	for <lists+dm-devel@lfdr.de>; Mon, 28 Sep 2020 20:42:27 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601318546;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Bl74lrhtGI9IKkm1EUGsiXsN5vzmSpVOusRLwgMM4lE=;
	b=Lv1yQi7tP8TF6dx2fsZykjFTwFnw2gyc+b4G5ovEj/BqT0rNSv98YD0qxr4ROzN4S6W2wJ
	WjBcYSdhWVy/wnFRj0RLenr7I8AVD8kJbbWEZacOHIJQv6rSt77ij9ruOvAyJF+P1i+R7V
	be95E3sp+3q1QgfnaCmmAc89jVb1KS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-2_v5xFSMPI-hr_QXTOwDiQ-1; Mon, 28 Sep 2020 14:42:24 -0400
X-MC-Unique: 2_v5xFSMPI-hr_QXTOwDiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FB011074645;
	Mon, 28 Sep 2020 18:42:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74D9255763;
	Mon, 28 Sep 2020 18:42:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 491C844A4B;
	Mon, 28 Sep 2020 18:42:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SIfw8O007248 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 14:41:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34D5C27C2A; Mon, 28 Sep 2020 18:41:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 082BD27C21;
	Mon, 28 Sep 2020 18:41:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08SIfr1C023864; 
	Mon, 28 Sep 2020 13:41:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08SIfqf4023863;
	Mon, 28 Sep 2020 13:41:52 -0500
Date: Mon, 28 Sep 2020 13:41:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200928184152.GN3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-15-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924134054.14632-15-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 14/23] libmultipath: add libmp_dm_exit()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:40:45PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This function prepares for calling dm_lib_exit() on program exit.
> It undoes changes to libdm internals done by libmultipath.
> It doesn't call dm_lib_exit(), as the caller may want to keep
> libdm active.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/config.c    |  1 +
>  libmultipath/config.h    |  2 ++
>  libmultipath/devmapper.c | 10 ++++++++++
>  libmultipath/devmapper.h |  1 +
>  4 files changed, 14 insertions(+)
> 
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index fbb66b3..8097838 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -65,6 +65,7 @@ int libmultipath_init(void)
>  static void _libmultipath_exit(void)
>  {
>  	libmultipath_exit_called = true;
> +	libmp_dm_exit();
>  	udev_unref(udev);
>  }

What if the caller wanted to control the dm initialization themselves,
and used skip_libmp_dm_init()? We need to track that and not undo
their changes.

-Ben

>  
> diff --git a/libmultipath/config.h b/libmultipath/config.h
> index dac4e8f..fc614f0 100644
> --- a/libmultipath/config.h
> +++ b/libmultipath/config.h
> @@ -270,6 +270,8 @@ int libmultipath_init(void);
>   *
>   * This function un-initializes libmultipath data structures.
>   * It is recommended to call this function at program exit.
> + * If the application also calls dm_lib_exit(), it should do so
> + * after libmultipath_exit().
>   *
>   * Calls to libmultipath_init() after libmultipath_exit() will fail
>   * (in other words, libmultipath can't be re-initialized).
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 2e3ae8a..5a2e1e7 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -333,6 +333,16 @@ void libmp_udev_set_sync_support(int on)
>  	libmp_dm_udev_sync = !!on;
>  }
>  
> +void libmp_dm_exit(void)
> +{
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

