Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F17E730B635
	for <lists+dm-devel@lfdr.de>; Tue,  2 Feb 2021 05:11:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612239066;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Of32AVpxdi6gdIJorGzKJPTJaFe8de7LqofbyhQ8kPk=;
	b=h4qnX8Qog/lr+dCcGGE2KyWMEm7Cb3LzSylqRgaTRP7ni6lP+mNmAaVzTHm1LmvIH7qFYe
	XZpFQD7Hd7b2peREDPL7l1rUEu5LmHI6XuGkwettTe2G26lq/xq3lRFkMYitXxM7rq3KFC
	dmCSq1IazFUKgxpTk5DBQa9m0oa16xU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-qJT7BYMRP76S1qTTgnYkgQ-1; Mon, 01 Feb 2021 23:11:03 -0500
X-MC-Unique: qJT7BYMRP76S1qTTgnYkgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD5F91572E;
	Tue,  2 Feb 2021 04:10:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC28927C23;
	Tue,  2 Feb 2021 04:10:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A747350038;
	Tue,  2 Feb 2021 04:10:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1124Ai9A028149 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Feb 2021 23:10:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D01A02D103; Tue,  2 Feb 2021 04:10:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C059E6267B;
	Tue,  2 Feb 2021 04:10:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1124AeN9025574; 
	Mon, 1 Feb 2021 22:10:40 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1124AdjI025573;
	Mon, 1 Feb 2021 22:10:39 -0600
Date: Mon, 1 Feb 2021 22:10:39 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210202041039.GO15006@octiron.msp.redhat.com>
References: <20210128204544.18563-1-mwilck@suse.com>
	<20210128204544.18563-4-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210128204544.18563-4-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 3/3] multipathd: add code to initalize
	unwinder
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

On Thu, Jan 28, 2021 at 09:45:44PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> glibc's implementation of pthread_cancel() loads symbols from
> libgcc_s.so using dlopen() when pthread_cancel() is called
> for the first time. This happens even with LD_BIND_NOW=1.
> This may imply the need for file system access when a thread is
> cancelled, which in the case of multipath-tools might be in a
> dangerous situation where multipathd must avoid blocking.
> 
> Call load_unwinder() during startup to make sure the dynamic
> linker has all necessary symbols resolved early on.
> 
> This implementation simply creates a dummy thread and cancels
> it. This way all necessary symbols for thread cancellation
> will be loaded, no matter what the C library needs to implement
> cancellation.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipathd/Makefile        |  2 +-
>  multipathd/init_unwinder.c | 34 ++++++++++++++++++++++++++++++++++
>  multipathd/init_unwinder.h | 21 +++++++++++++++++++++
>  multipathd/main.c          |  2 ++
>  4 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 multipathd/init_unwinder.c
>  create mode 100644 multipathd/init_unwinder.h
> 
> diff --git a/multipathd/Makefile b/multipathd/Makefile
> index 632b82b..d053c1e 100644
> --- a/multipathd/Makefile
> +++ b/multipathd/Makefile
> @@ -30,7 +30,7 @@ ifeq ($(ENABLE_DMEVENTS_POLL),0)
>  endif
>  
>  OBJS = main.o pidfile.o uxlsnr.o uxclnt.o cli.o cli_handlers.o waiter.o \
> -       dmevents.o
> +       dmevents.o init_unwinder.o
>  
>  EXEC = multipathd
>  
> diff --git a/multipathd/init_unwinder.c b/multipathd/init_unwinder.c
> new file mode 100644
> index 0000000..14467f3
> --- /dev/null
> +++ b/multipathd/init_unwinder.c
> @@ -0,0 +1,34 @@
> +#include <pthread.h>
> +#include <unistd.h>
> +#include "init_unwinder.h"
> +
> +static pthread_mutex_t dummy_mtx = PTHREAD_MUTEX_INITIALIZER;
> +static pthread_cond_t dummy_cond = PTHREAD_COND_INITIALIZER;
> +
> +static void *dummy_thread(void *arg __attribute__((unused)))
> +{
> +	pthread_mutex_lock(&dummy_mtx);
> +	pthread_cond_broadcast(&dummy_cond);
> +	pthread_mutex_unlock(&dummy_mtx);
> +	pause();
> +	return NULL;
> +}
> +
> +int init_unwinder(void)
> +{
> +	pthread_t dummy;
> +	int rc;
> +
> +	pthread_mutex_lock(&dummy_mtx);
> +
> +	rc = pthread_create(&dummy, NULL, dummy_thread, NULL);
> +	if (rc != 0) {
> +		pthread_mutex_unlock(&dummy_mtx);
> +		return rc;
> +	}
> +
> +	pthread_cond_wait(&dummy_cond, &dummy_mtx);
> +	pthread_mutex_unlock(&dummy_mtx);
> +
> +	return pthread_cancel(dummy);
> +}
> diff --git a/multipathd/init_unwinder.h b/multipathd/init_unwinder.h
> new file mode 100644
> index 0000000..ada09f8
> --- /dev/null
> +++ b/multipathd/init_unwinder.h
> @@ -0,0 +1,21 @@
> +#ifndef _INIT_UNWINDER_H
> +#define _INIT_UNWINDER_H 1
> +
> +/*
> + * init_unwinder(): make sure unwinder symbols are loaded
> + *
> + * libc's implementation of pthread_cancel() loads symbols from
> + * libgcc_s.so using dlopen() when pthread_cancel() is called
> + * for the first time. This happens even with LD_BIND_NOW=1.
> + * This may imply the need for file system access when a thread is
> + * cancelled, which in the case of multipath-tools might be in a
> + * dangerous situation where multipathd must avoid blocking.
> + *
> + * Call load_unwinder() during startup to make sure the dynamic
> + * linker has all necessary symbols resolved early on.
> + *
> + * Return: 0 if successful, an error number otherwise.
> + */
> +int init_unwinder(void);
> +
> +#endif
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 99a89a6..6f851ae 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -83,6 +83,7 @@
>  #include "wwids.h"
>  #include "foreign.h"
>  #include "../third-party/valgrind/drd.h"
> +#include "init_unwinder.h"
>  
>  #define FILE_NAME_SIZE 256
>  #define CMDSIZE 160
> @@ -3041,6 +3042,7 @@ child (__attribute__((unused)) void *param)
>  	enum daemon_status state;
>  	int exit_code = 1;
>  
> +	init_unwinder();
>  	mlockall(MCL_CURRENT | MCL_FUTURE);
>  	signal_init();
>  	mp_rcu_data = setup_rcu();
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

