Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CA8102DDC37
	for <lists+dm-devel@lfdr.de>; Fri, 18 Dec 2020 01:00:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608249618;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KuM6yt91FcasK4RTvJtGoZVu7rDssXVG/FyAE4Z3bUA=;
	b=Dw0mC9c4xrCyZAHEpvBm/T5ELMRFyG+OOzSnh5Z2LVicgzRBd/VOS6uqitDMu3Ql4YC8V6
	yXdnpbBsm4a2MWvYLbIoingx0qxb5e0Wd6c7cdw3Ubx2gmo0UWWUo2S5jdZauM6SL3Bmw9
	wZWYwYqLlsmJs2mdwMwM+SSzhiaoOaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-gOmWJFiwP3WPvQVm-0C3tw-1; Thu, 17 Dec 2020 19:00:16 -0500
X-MC-Unique: gOmWJFiwP3WPvQVm-0C3tw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 212DE59;
	Fri, 18 Dec 2020 00:00:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 005232CE56;
	Fri, 18 Dec 2020 00:00:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BADB64BB7B;
	Thu, 17 Dec 2020 23:59:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BHNueCE015342 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 18:56:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 97643669FC; Thu, 17 Dec 2020 23:56:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B51D5D737;
	Thu, 17 Dec 2020 23:56:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BHNuZfF002197; 
	Thu, 17 Dec 2020 17:56:35 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BHNuZ93002196;
	Thu, 17 Dec 2020 17:56:35 -0600
Date: Thu, 17 Dec 2020 17:56:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201217235635.GC3103@octiron.msp.redhat.com>
References: <20201217110018.3347-1-mwilck@suse.com>
	<20201217110018.3347-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201217110018.3347-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/7] libmultipath: move logq_lock handling to
	log.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 17, 2020 at 12:00:12PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> logq_lock protects internal data structures of log.c, and should
> be handled there. This patch doesn't change functionality, except
> improving cancel-safety somewhat.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/log.c         | 34 ++++++++++++++++++++++++++++++++--
>  libmultipath/log_pthread.c |  9 ---------
>  2 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/libmultipath/log.c b/libmultipath/log.c
> index debd36d..7f33787 100644
> --- a/libmultipath/log.c
> +++ b/libmultipath/log.c
> @@ -9,13 +9,16 @@
>  #include <string.h>
>  #include <syslog.h>
>  #include <time.h>
> +#include <pthread.h>
>  
>  #include "memory.h"
>  #include "log.h"
> +#include "util.h"
>  
>  #define ALIGN(len, s) (((len)+(s)-1)/(s)*(s))
>  
>  struct logarea* la;
> +static pthread_mutex_t logq_lock = PTHREAD_MUTEX_INITIALIZER;
>  
>  #if LOGDBG
>  static void dump_logarea (void)
> @@ -101,12 +104,17 @@ void log_close (void)
>  
>  void log_reset (char *program_name)
>  {
> +	pthread_mutex_lock(&logq_lock);
> +	pthread_cleanup_push(cleanup_mutex, &logq_lock);
> +
>  	closelog();
>  	tzset();
>  	openlog(program_name, 0, LOG_DAEMON);
> +
> +	pthread_cleanup_pop(1);
>  }
>  
> -int log_enqueue (int prio, const char * fmt, va_list ap)
> +static int _log_enqueue(int prio, const char * fmt, va_list ap)
>  {
>  	int len, fwd;
>  	char buff[MAX_MSG_SIZE];
> @@ -165,7 +173,18 @@ int log_enqueue (int prio, const char * fmt, va_list ap)
>  	return 0;
>  }
>  
> -int log_dequeue (void * buff)
> +int log_enqueue(int prio, const char *fmt, va_list ap)
> +{
> +	int ret;
> +
> +	pthread_mutex_lock(&logq_lock);
> +	pthread_cleanup_push(cleanup_mutex, &logq_lock);
> +	ret = _log_enqueue(prio, fmt, ap);
> +	pthread_cleanup_pop(1);
> +	return ret;
> +}
> +
> +static int _log_dequeue(void *buff)
>  {
>  	struct logmsg * src = (struct logmsg *)la->head;
>  	struct logmsg * dst = (struct logmsg *)buff;
> @@ -194,6 +213,17 @@ int log_dequeue (void * buff)
>  	return 0;
>  }
>  
> +int log_dequeue(void *buff)
> +{
> +	int ret;
> +
> +	pthread_mutex_lock(&logq_lock);
> +	pthread_cleanup_push(cleanup_mutex, &logq_lock);
> +	ret = _log_dequeue(buff);
> +	pthread_cleanup_pop(1);
> +	return ret;
> +}
> +
>  /*
>   * this one can block under memory pressure
>   */
> diff --git a/libmultipath/log_pthread.c b/libmultipath/log_pthread.c
> index 0d48c52..6599210 100644
> --- a/libmultipath/log_pthread.c
> +++ b/libmultipath/log_pthread.c
> @@ -18,7 +18,6 @@
>  static pthread_t log_thr;
>  
>  /* logev_lock must not be taken with logq_lock held */
> -static pthread_mutex_t logq_lock = PTHREAD_MUTEX_INITIALIZER;
>  static pthread_mutex_t logev_lock = PTHREAD_MUTEX_INITIALIZER;
>  static pthread_cond_t logev_cond = PTHREAD_COND_INITIALIZER;
>  
> @@ -41,10 +40,7 @@ void log_safe (int prio, const char * fmt, va_list ap)
>  	running = logq_running;
>  
>  	if (running) {
> -		pthread_mutex_lock(&logq_lock);
> -		pthread_cleanup_push(cleanup_mutex, &logq_lock);
>  		log_enqueue(prio, fmt, ap);
> -		pthread_cleanup_pop(1);
>  
>  		log_messages_pending = 1;
>  		pthread_cond_signal(&logev_cond);
> @@ -60,9 +56,7 @@ static void flush_logqueue (void)
>  	int empty;
>  
>  	do {
> -		pthread_mutex_lock(&logq_lock);
>  		empty = log_dequeue(la->buff);
> -		pthread_mutex_unlock(&logq_lock);
>  		if (!empty)
>  			log_syslog(la->buff);
>  	} while (empty == 0);
> @@ -138,10 +132,7 @@ void log_thread_start (pthread_attr_t *attr)
>  void log_thread_reset (void)
>  {
>  	logdbg(stderr,"resetting log\n");
> -
> -	pthread_mutex_lock(&logq_lock);
>  	log_reset("multipathd");
> -	pthread_mutex_unlock(&logq_lock);
>  }
>  
>  void log_thread_stop (void)
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

