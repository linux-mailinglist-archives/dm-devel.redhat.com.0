Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C3D91316B95
	for <lists+dm-devel@lfdr.de>; Wed, 10 Feb 2021 17:46:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612975618;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hTwZvHCWpB5NGnurgy+JzQiRG9evLJ0xUUyLlThamHU=;
	b=eDUelJbQPjhgvE7mxbjvRGmAyNHNziue1WxH6uOKbkmLe67ei0B07PJ3FRFv0k+V0FasJx
	LguaOgsk06H/NzlHEeNVnVbFELNc2QCHgaaydM3miVSyhzCpQDSxlsWl1P2uogxxJURhKo
	MyfsVNToZ1MDC4Au/RUhh75FNZNpTmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-ZcVQpnAMP0KHH-Ft8SOQJg-1; Wed, 10 Feb 2021 11:46:56 -0500
X-MC-Unique: ZcVQpnAMP0KHH-Ft8SOQJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 317F986A064;
	Wed, 10 Feb 2021 16:46:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1CEC1F433;
	Wed, 10 Feb 2021 16:46:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A9034E58E;
	Wed, 10 Feb 2021 16:46:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AGkSMs013290 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 11:46:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3CD519CAD; Wed, 10 Feb 2021 16:46:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52C2918B42;
	Wed, 10 Feb 2021 16:46:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 11AGkNZc020085; 
	Wed, 10 Feb 2021 10:46:24 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 11AGkNHe020084;
	Wed, 10 Feb 2021 10:46:23 -0600
Date: Wed, 10 Feb 2021 10:46:23 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210210164623.GG15006@octiron.msp.redhat.com>
References: <20210210122457.3415-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210210122457.3415-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipath-tools tests: fix stringop-overflow
 build errors with gcc 11
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

On Wed, Feb 10, 2021 at 01:24:57PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> gcc-11 throws an error compiling alias.c and dmevents.c:
> 
> In file included from ../libmultipath/checkers.h:4,
>                  from ../libmultipath/prio.h:7,
>                  from ../libmultipath/structs.h:8,
>                  from dmevents.c:29:
> ../multipathd/dmevents.c: In function 'dmevent_loop':
> ../multipathd/dmevents.c:357:17: error: '__sigsetjmp' accessing 200 bytes in a region of size 72 [-Werror=stringop-overflow=]
>   357 |                 pthread_cleanup_push(cleanup_lock, &waiter->vecs->lock);
>       |                 ^~~~~~~~~~~~~~~~~~~~
> ../multipathd/dmevents.c:357:17: note: referencing argument 1 of type 'struct __jmp_buf_tag *'
> /usr/include/pthread.h:734:12: note: in a call to function '__sigsetjmp'
>   734 | extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __THROWNL;
>       |            ^~~~~~~~~~~
> 
> The reason seems to be a mismatch between the __sigsetjmp() prototype
> in <setjmp.h> and <pthread.h>. Until this is fixed in the toolchain,
> work around it by including <pthread.h> first.
> 
Reviewed-by: Benjamin Marzinski <bmazins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  tests/alias.c    | 1 +
>  tests/dmevents.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/tests/alias.c b/tests/alias.c
> index 0311faa..5e0bfea 100644
> --- a/tests/alias.c
> +++ b/tests/alias.c
> @@ -1,3 +1,4 @@
> +#include <pthread.h>
>  #include <stdint.h>
>  #include <setjmp.h>
>  #include <stdio.h>
> diff --git a/tests/dmevents.c b/tests/dmevents.c
> index b7c5122..29eaa6d 100644
> --- a/tests/dmevents.c
> +++ b/tests/dmevents.c
> @@ -16,6 +16,7 @@
>   *
>   */
>  
> +#include <pthread.h>
>  #include <stdint.h>
>  #include <stdbool.h>
>  #include <stdarg.h>
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

