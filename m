Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 279D52DCAFF
	for <lists+dm-devel@lfdr.de>; Thu, 17 Dec 2020 03:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608172109;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OXnZH0MTkvlH62RBwhwNi02Uaq//K1A7CETKEANdzN0=;
	b=fGlRIMiH5A0HEoOQjsTHeH/GJjaU2kIqKehoWpDkXit/soxpATibH8o4cXsdEotqQti3ik
	YqlJJJG5L17YT/snHl+vU9qRLu3JBgEyza814DZRZvkjqB5xbvgCGJz77cKwihPTvEEHQK
	4GN5RebBi2hbZ7y37DSrWGmzxgtHpcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-fyzSyJUzOByiTWDfgeOJrg-1; Wed, 16 Dec 2020 21:28:25 -0500
X-MC-Unique: fyzSyJUzOByiTWDfgeOJrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8409E801817;
	Thu, 17 Dec 2020 02:28:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAFBB1E5;
	Thu, 17 Dec 2020 02:28:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E96B2180954D;
	Thu, 17 Dec 2020 02:28:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BH2O6dg005724 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 21:24:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F324560C43; Thu, 17 Dec 2020 02:24:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01DF060C15;
	Thu, 17 Dec 2020 02:24:01 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BH2O064027931; 
	Wed, 16 Dec 2020 20:24:00 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BH2NxPw027930;
	Wed, 16 Dec 2020 20:23:59 -0600
Date: Wed, 16 Dec 2020 20:23:59 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201217022359.GT3103@octiron.msp.redhat.com>
References: <20201216181708.22224-1-mwilck@suse.com>
	<20201216181708.22224-19-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201216181708.22224-19-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 18/29] libmultipath: fix log_thread
 startup and teardown
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

On Wed, Dec 16, 2020 at 07:16:57PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> This fixes several issues with the log_thread. First, the running flag
> logq_running should be set by the thread itself, not by
> log_thread_start()/_stop(). Second, the thread was both cancelled and
> terminated via a flag (again, logq_running). It's sufficient to just cancel
> and join it. Third, the locking wasn't cancel-safe in some places. Forth,
> log_thread_start() didn't wait for startup properly. Fifth, using (pthread_t)0
> is wrong (pthread_t is opaque; there's no guarantee that 0 is not a valid
> pthread_t value). Sixth, pthread_cancel() was called under logq_lock, which
> doesn't make sense to me.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/log_pthread.c | 62 +++++++++++++++++++++++++++-----------
>  1 file changed, 45 insertions(+), 17 deletions(-)
> 
> diff --git a/libmultipath/log_pthread.c b/libmultipath/log_pthread.c
> index 0c327ff..3a2566a 100644
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
> @@ -56,35 +57,52 @@ static void flush_logqueue (void)
>  	} while (empty == 0);
>  }
>  
> +static void cleanup_log_thread(__attribute((unused)) void *arg)
> +{
> +	logdbg(stderr, "log thread exiting");
> +	pthread_mutex_lock(&logev_lock);
> +	logq_running = 0;
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
>  void log_thread_start (pthread_attr_t *attr)
>  {
> -	logdbg(stderr,"enter log_thread_start\n");
> +	int running = 0;
>  
> +	logdbg(stderr,"enter log_thread_start\n");
>  	pthread_mutex_init(&logq_lock, NULL);
>  	pthread_mutex_init(&logev_lock, NULL);
>  	pthread_cond_init(&logev_cond, NULL);
> @@ -93,7 +111,15 @@ void log_thread_start (pthread_attr_t *attr)
>  		fprintf(stderr,"can't initialize log buffer\n");
>  		exit(1);
>  	}
> -	if (pthread_create(&log_thr, attr, log_thread, NULL)) {
> +
> +	pthread_mutex_lock(&logev_lock);
> +	pthread_cleanup_push(cleanup_mutex, &logev_lock);
> +	if (!pthread_create(&log_thr, attr, log_thread, NULL))
> +		while (!(running = logq_running))
> +			pthread_cond_wait(&logev_cond, &logev_lock);
> +	pthread_cleanup_pop(1);
> +
> +	if (!running) {
>  		fprintf(stderr,"can't start log thread\n");
>  		exit(1);
>  	}
> @@ -112,23 +138,25 @@ void log_thread_reset (void)
>  
>  void log_thread_stop (void)
>  {
> +	int running;
> +
>  	if (!la)
>  		return;
>  
>  	logdbg(stderr,"enter log_thread_stop\n");
>  
>  	pthread_mutex_lock(&logev_lock);
> -	logq_running = 0;
> -	pthread_cond_signal(&logev_cond);
> -	pthread_mutex_unlock(&logev_lock);
> -
> -	pthread_mutex_lock(&logq_lock);
> -	pthread_cancel(log_thr);
> -	pthread_mutex_unlock(&logq_lock);
> -	pthread_join(log_thr, NULL);
> -	log_thr = (pthread_t)0;
> +	pthread_cleanup_push(cleanup_mutex, &logev_lock);
> +	running = logq_running;
> +	if (running) {
> +		pthread_cancel(log_thr);
> +		pthread_cond_signal(&logev_cond);
> +	}
> +	pthread_cleanup_pop(1);
>  
>  	flush_logqueue();
> +	if (running)
> +		pthread_join(log_thr, NULL);
>  
>  	pthread_mutex_destroy(&logq_lock);
>  	pthread_mutex_destroy(&logev_lock);
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

