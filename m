Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 36A5727B647
	for <lists+dm-devel@lfdr.de>; Mon, 28 Sep 2020 22:29:42 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601324981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9ehzYZOSYbTb2dMBT86GHekqZTjcXG4xvZ2Qmetg8VY=;
	b=ZErlOtqfFPw4D0TAo3uiLDXEfTVzGv2ZJGACg58KxMd7vdG7h4v7thYMtrOn1TGHghnVU0
	CkzdmSGGyqlrj/SVW/5beQH8htMufjkrQc0Ch0NqHBsPaUm03ElxZS8DS8GzLGQ3MkLWCi
	3LKQSUAiJqXOptaAZKHK7dPl7JQBMvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-LqRmxWW8NVCQNbAiSFRrYQ-1; Mon, 28 Sep 2020 16:29:38 -0400
X-MC-Unique: LqRmxWW8NVCQNbAiSFRrYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E5FA8030C8;
	Mon, 28 Sep 2020 20:29:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D14357838A;
	Mon, 28 Sep 2020 20:29:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3945D1826D2A;
	Mon, 28 Sep 2020 20:29:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SKQZHF019219 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 16:26:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B9C878482; Mon, 28 Sep 2020 20:26:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AF6973665;
	Mon, 28 Sep 2020 20:26:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08SKQP0U024481; 
	Mon, 28 Sep 2020 15:26:25 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08SKQOVK024480;
	Mon, 28 Sep 2020 15:26:24 -0500
Date: Mon, 28 Sep 2020 15:26:24 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200928202624.GP3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-20-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924134054.14632-20-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 19/23] multipathd: move cleanup_{prio,
 checkers, foreign} to libmultipath_exit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:40:50PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmpathpersist/mpath_persist.c   | 2 --
>  libmultipath/config.c             | 4 ++++
>  libmultipath/libmultipath.version | 5 +----
>  multipathd/main.c                 | 3 ---
>  4 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
> index 873b419..af56a95 100644
> --- a/libmpathpersist/mpath_persist.c
> +++ b/libmpathpersist/mpath_persist.c
> @@ -78,8 +78,6 @@ mpath_lib_init (void)
>  
>  static void libmpathpersist_cleanup(void)
>  {
> -	cleanup_prio();
> -	cleanup_checkers();
>  	libmultipath_exit();
>  	dm_lib_exit();
>  }
> diff --git a/libmultipath/config.c b/libmultipath/config.c
> index 8097838..f115ac2 100644
> --- a/libmultipath/config.c
> +++ b/libmultipath/config.c
> @@ -26,6 +26,7 @@
>  #include "devmapper.h"
>  #include "mpath_cmd.h"
>  #include "propsel.h"
> +#include "foreign.h"
>  
>  /*
>   * We don't support re-initialization after
> @@ -65,6 +66,9 @@ int libmultipath_init(void)
>  static void _libmultipath_exit(void)
>  {
>  	libmultipath_exit_called = true;
> +	cleanup_foreign();

I don't really feel too strongly about this, but it seems to me that
there is a difference between the checkers and prioritizers, which
it seems like most users of libmultipath would want, and the foreign
code, which doesn't seem that way. libmpathpersist, for instance,
will use the checkers and prioritizers, but not the foreign code.
On the other hand, if the caller isn't using the foreign code,
then grabbing the lock and checking the foreign pointer shouldn't
take much time.

-Ben

> +	cleanup_checkers();
> +	cleanup_prio();
>  	libmp_dm_exit();
>  	udev_unref(udev);
>  }
> diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
> index 9abdb22..80f1950 100644
> --- a/libmultipath/libmultipath.version
> +++ b/libmultipath/libmultipath.version
> @@ -1,4 +1,4 @@
> -LIBMULTIPATH_0.8.4.5 {
> +LIBMULTIPATH_0.8.4.6 {
>  global:
>  	/* symbols referenced by multipath and multipathd */
>  	add_foreign;
> @@ -18,10 +18,7 @@ global:
>  	checker_name;
>  	checker_state_name;
>  	check_foreign;
> -	cleanup_checkers;
> -	cleanup_foreign;
>  	cleanup_lock;
> -	cleanup_prio;
>  	close_fd;
>  	coalesce_paths;
>  	convert_dev;
> diff --git a/multipathd/main.c b/multipathd/main.c
> index e7b479a..efed56e 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -3027,9 +3027,6 @@ static void cleanup_child(void)
>  {
>  	cleanup_threads();
>  	cleanup_vecs();
> -	cleanup_foreign();
> -	cleanup_checkers();
> -	cleanup_prio();
>  	if (poll_dmevents)
>  		cleanup_dmevent_waiter();
>  
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

