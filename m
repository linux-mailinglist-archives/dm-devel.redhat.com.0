Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CCB9037FBA2
	for <lists+dm-devel@lfdr.de>; Thu, 13 May 2021 18:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620923811;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aQ01D/BPoBSJ6Zfu5y+OtdBSwO9uwWaVXP2iqBSj9Fg=;
	b=BdgWVt15euVSmwkpSJRb3UoyoNG5j78vJYHxKwPahTwOotLf8N7AThJVT8aEg3qwEmAZLY
	rJQXNuaFw6D1hbru292xg9hhoGLELT9KPIhKLMN8AOBGaBNgzJtVzXjk9ksT2f3XIbkYMe
	izVaxDmbcow+scV183PDKEBvC39IMNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-ywlLZWGoPuWEJj24TaSlCg-1; Thu, 13 May 2021 12:36:48 -0400
X-MC-Unique: ywlLZWGoPuWEJj24TaSlCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F99E801B14;
	Thu, 13 May 2021 16:36:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FD115DDAD;
	Thu, 13 May 2021 16:36:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A79818005B6;
	Thu, 13 May 2021 16:36:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14DGa6aP000916 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 May 2021 12:36:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05D3F19714; Thu, 13 May 2021 16:36:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 669EF19704;
	Thu, 13 May 2021 16:36:02 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14DGa0B6011716; 
	Thu, 13 May 2021 11:36:00 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14DGZx4U011715;
	Thu, 13 May 2021 11:35:59 -0500
Date: Thu, 13 May 2021 11:35:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210513163559.GI25887@octiron.msp.redhat.com>
References: <20210512211705.31561-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210512211705.31561-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd: fix compilation issue with
	liburcu < 0.8
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 12, 2021 at 11:17:05PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> To avoid race conditions with pending RCU callbacks on exit, it's
> necessary to call rcu_barrier() in cleanup_rcu() (see
> https://lists.lttng.org/pipermail/lttng-dev/2021-May/029958.html and
> follow-ups).
> 
> rcu_barrier() is only available in User-space RCU v0.8 and newer.
> Fix it by reverting 5d0dae6 ("multipathd: Fix liburcu memory leak")
> if an older version of liburcu is detected.
> 
> Fixes: 5d0dae6 ("multipathd: Fix liburcu memory leak")
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/Makefile |  2 ++
>  multipathd/main.c   | 17 +++++++++++++++--
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/multipathd/Makefile b/multipathd/Makefile
> index d053c1e..dc7eb32 100644
> --- a/multipathd/Makefile
> +++ b/multipathd/Makefile
> @@ -16,6 +16,8 @@ LDFLAGS += $(BIN_LDFLAGS)
>  LIBDEPS += -L$(multipathdir) -lmultipath -L$(mpathpersistdir) -lmpathpersist \
>  	   -L$(mpathcmddir) -lmpathcmd -ludev -ldl -lurcu -lpthread \
>  	   -ldevmapper -lreadline
> +CFLAGS += $(shell pkg-config --modversion liburcu 2>/dev/null | \
> +	awk -F. '{ printf("-DURCU_VERSION=0x%06x\n", 256 * ( 256 * $$1 + $$2) + $$3); }')

Shouldn't this be

$(shell $(PKGCONFIG) --modversion ...

-Ben

>  
>  ifdef SYSTEMD
>  	CFLAGS += -DUSE_SYSTEMD=$(SYSTEMD)
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 102946b..c34fd9c 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -3031,6 +3031,10 @@ static void cleanup_threads(void)
>  	pthread_attr_destroy(&waiter_attr);
>  }
>  
> +#ifndef URCU_VERSION
> +#  define URCU_VERSION 0
> +#endif
> +#if (URCU_VERSION >= 0x000800)
>  /*
>   * Use a non-default call_rcu_data for child().
>   *
> @@ -3040,6 +3044,9 @@ static void cleanup_threads(void)
>   * can't be joined with pthread_join(), leaving a memory leak.
>   *
>   * Therefore we create our own, which can be destroyed and joined.
> + * The cleanup handler needs to call rcu_barrier(), which is only
> + * available in user-space RCU v0.8 and newer. See
> + * https://lists.lttng.org/pipermail/lttng-dev/2021-May/029958.html
>   */
>  static struct call_rcu_data *setup_rcu(void)
>  {
> @@ -3072,6 +3079,7 @@ static void cleanup_rcu(void)
>  	}
>  	rcu_unregister_thread();
>  }
> +#endif /* URCU_VERSION */
>  
>  static void cleanup_child(void)
>  {
> @@ -3116,9 +3124,14 @@ child (__attribute__((unused)) void *param)
>  	init_unwinder();
>  	mlockall(MCL_CURRENT | MCL_FUTURE);
>  	signal_init();
> +#if (URCU_VERSION >= 0x000800)
>  	mp_rcu_data = setup_rcu();
> -
> -	if (atexit(cleanup_rcu) || atexit(cleanup_child))
> +	if (atexit(cleanup_rcu))
> +		fprintf(stderr, "failed to register RCU cleanup handler\n");
> +#else
> +	rcu_init();
> +#endif
> +	if (atexit(cleanup_child))
>  		fprintf(stderr, "failed to register cleanup handlers\n");
>  
>  	setup_thread_attr(&misc_attr, 64 * 1024, 0);
> -- 
> 2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

