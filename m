Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 62A8A27B60D
	for <lists+dm-devel@lfdr.de>; Mon, 28 Sep 2020 22:16:10 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601324169;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AI4MT4e70lZx3YIC+jcBylbCqPhzwhtHy+FdzOgmfmg=;
	b=bLKH0s0fnDqSpozIjrWtylYCeMPpx0JVDyibytRxu/8YMBsMUn9lEg12wPlysMCYMDmAe9
	SEqoavZwcyE+Dm8DXBJOFL8RohqEZPS6NYPYJuATqeD8ossygqwvUr1XukEHJTOEWlcZCs
	aYerOvL3qbGs2lZB0Rw55+GHeZbPbbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-vXfq-7OfMZagrWAM0Lmd0A-1; Mon, 28 Sep 2020 16:16:06 -0400
X-MC-Unique: vXfq-7OfMZagrWAM0Lmd0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 244571882FB4;
	Mon, 28 Sep 2020 20:15:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6A7B7880B;
	Mon, 28 Sep 2020 20:15:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD0A71826D2A;
	Mon, 28 Sep 2020 20:15:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08SKFUvG017710 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Sep 2020 16:15:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 433617880B; Mon, 28 Sep 2020 20:15:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6588778822;
	Mon, 28 Sep 2020 20:15:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08SKFO6Q024465; 
	Mon, 28 Sep 2020 15:15:24 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08SKFOaR024464;
	Mon, 28 Sep 2020 15:15:24 -0500
Date: Mon, 28 Sep 2020 15:15:23 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200928201523.GO3384@octiron.msp.redhat.com>
References: <20200924134054.14632-1-mwilck@suse.com>
	<20200924134054.14632-19-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200924134054.14632-19-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 18/23] libmultipath: fix log_thread startup
	and teardown
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 03:40:49PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This fixes several issues with the log_thread. First, the running
> flag logq_running should be set by the thread itself, not by
> log_thread_start()/_stop(). Second, the thread was both cancelled and
> terminated via a flag (again, logq_running). It's sufficient,
> and better, to just cancel it and use logq_running as indication for
> successful termination. Third, the locking wasn't cancel-safe in some
> places. Forth, log_thread_start() and log_thread_stop() didn't wait for
> startup/teardown properly. Fifth, using (pthread_t)0 is wrong (pthread_t is
> opaque; there's no guarantee that 0 is not a valid pthread_t value). Finally,
> pthread_cancel() was called under logq_lock, which doesn't make sense to
> me at all.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/log_pthread.c | 59 ++++++++++++++++++++++++++++----------
>  1 file changed, 44 insertions(+), 15 deletions(-)
> 
> diff --git a/libmultipath/log_pthread.c b/libmultipath/log_pthread.c
> index 0c327ff..5825e66 100644
> --- a/libmultipath/log_pthread.c
> +++ b/libmultipath/log_pthread.c
> @@ -13,6 +13,7 @@
>  #include "log_pthread.h"
>  #include "log.h"
>  #include "lock.h"
> +#include "util.h"
>  
>  static pthread_t log_thr;
>  
> @@ -56,28 +57,45 @@ static void flush_logqueue (void)
>  	} while (empty == 0);
>  }
>  
> +static void cleanup_log_thread(__attribute((unused)) void *arg)
> +{
> +	logdbg(stderr, "log thread exiting");
> +	pthread_mutex_lock(&logev_lock);
> +	logq_running = 0;
> +	pthread_cond_signal(&logev_cond);
> +	pthread_mutex_unlock(&logev_lock);
> +}
> +
>  static void * log_thread (__attribute__((unused)) void * et)
>  {
>  	int running;
>  
>  	pthread_mutex_lock(&logev_lock);
> -	logq_running = 1;
> +	running = logq_running;
> +	if (!running)
> +		logq_running = 1;
> +	pthread_cond_signal(&logev_cond);
>  	pthread_mutex_unlock(&logev_lock);
> +	if (running)
> +		/* already started */
> +		return NULL;
> +	pthread_cleanup_push(cleanup_log_thread, NULL);
>  
>  	mlockall(MCL_CURRENT | MCL_FUTURE);
>  	logdbg(stderr,"enter log_thread\n");
>  
>  	while (1) {
>  		pthread_mutex_lock(&logev_lock);
> -		if (logq_running && !log_messages_pending)
> +		pthread_cleanup_push(cleanup_mutex, &logev_lock);
> +		while (!log_messages_pending)
> +			/* this is a cancellation point */
>  			pthread_cond_wait(&logev_cond, &logev_lock);
>  		log_messages_pending = 0;
> -		running = logq_running;
> -		pthread_mutex_unlock(&logev_lock);
> -		if (!running)
> -			break;
> +		pthread_cleanup_pop(1);
> +
>  		flush_logqueue();
>  	}
> +	pthread_cleanup_pop(1);
>  	return NULL;
>  }
>  
> @@ -98,6 +116,12 @@ void log_thread_start (pthread_attr_t *attr)
>  		exit(1);
>  	}
>  
> +	pthread_mutex_lock(&logev_lock);
> +	pthread_cleanup_push(cleanup_mutex, &logev_lock);
> +	/* wait for thread startup */
> +	while (!logq_running)
> +		pthread_cond_wait(&logev_cond, &logev_lock);
> +	pthread_cleanup_pop(1);
>  	return;
>  }
>  
> @@ -112,21 +136,26 @@ void log_thread_reset (void)
>  
>  void log_thread_stop (void)
>  {
> +	int running;
> +
>  	if (!la)
>  		return;
> -
>  	logdbg(stderr,"enter log_thread_stop\n");
>  
>  	pthread_mutex_lock(&logev_lock);
> -	logq_running = 0;
> -	pthread_cond_signal(&logev_cond);
> -	pthread_mutex_unlock(&logev_lock);
> +	pthread_cleanup_push(cleanup_mutex, &logev_lock);
> +	running = logq_running;
> +	if (running) {
> +		pthread_cancel(log_thr);
> +		pthread_cond_signal(&logev_cond);
> +	}
> +	while (logq_running)
> +		pthread_cond_wait(&logev_cond, &logev_lock);

If we're already going to join the thread, why do we have to wait for
the cleanup handler first? Won't the join do the waiting we need?

-Ben

> +	pthread_cleanup_pop(1);
> +
> +	if (running)
> +		pthread_join(log_thr, NULL);
>  
> -	pthread_mutex_lock(&logq_lock);
> -	pthread_cancel(log_thr);
> -	pthread_mutex_unlock(&logq_lock);
> -	pthread_join(log_thr, NULL);
> -	log_thr = (pthread_t)0;
>  
>  	flush_logqueue();
>  
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

