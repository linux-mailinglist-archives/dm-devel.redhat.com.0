Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C93DC293307
	for <lists+dm-devel@lfdr.de>; Tue, 20 Oct 2020 04:20:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603160441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=18nxkIdkCYdooQEUH2zVMHzu82YM3Ok+6+xoVNZH+C0=;
	b=AgLJjNCyY23vkjjsKnw4m144LNBIwok5RtpE7juZp0YaMn/QjwAD75vlthJv4asj4R+rgf
	Kb+4Jj08J/G/9zXa6jl5d4VT5Gu4r+ms3ACP1NVrzm6NAUnZCPkpJ/C7H/OWnjkTVID1B1
	03uKwA4pYLPFynsYRZXZW5vQ5NAsjW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-xy1Jj5WZOP6SDyWJeSL3GA-1; Mon, 19 Oct 2020 22:20:39 -0400
X-MC-Unique: xy1Jj5WZOP6SDyWJeSL3GA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22366107B473;
	Tue, 20 Oct 2020 02:20:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B900E55798;
	Tue, 20 Oct 2020 02:20:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B06644A74;
	Tue, 20 Oct 2020 02:20:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09K2KE4W004342 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 22:20:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1AF856EF44; Tue, 20 Oct 2020 02:20:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E53076EF5B;
	Tue, 20 Oct 2020 02:20:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09K2K9Kb015683; 
	Mon, 19 Oct 2020 21:20:09 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09K2K8ck015682;
	Mon, 19 Oct 2020 21:20:08 -0500
Date: Mon, 19 Oct 2020 21:20:08 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201020022008.GK3384@octiron.msp.redhat.com>
References: <20201016104501.8700-1-mwilck@suse.com>
	<20201016104501.8700-30-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201016104501.8700-30-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 29/29] libmultipath: fix race between
 log_safe and log_thread_stop()
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

On Fri, Oct 16, 2020 at 12:45:01PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> log_safe() could race with log_thread_stop(); simply
> checking the value of log_thr has never been safe. By converting the
> mutexes to static initializers, we avoid having to destroy them, and thus
> possibly accessing a destroyed mutex in log_safe(). Furthermore, taking
> both the logev_lock and the logq_lock makes sure the logarea isn't freed
> while we are writing to it.
> 

I don't see any problems with this, but I also don't think it's necssary
to hold the log thread lock (logev_lock), just to add a message to the
queue. It seems like protecting the log queue is the job of logq_lock.
As long as log_safe() enqueues the message before flush_logqueue() is
called in log_thread_stop(), it should be fine. This could be solved by
simply having a static variable in log_pthread.c named something like
log_area_enabled, that always accessed while holding the logq_lock, and
is set to true when the log_area is created, and set to false just
before calling the flush_logqueue() in log_thread_stop(). Then log_safe
just needs to check this before calling log_enqueue(). If it's true,
then logged messages will get flushed, so it can safely enqueue the
message. If it's false, then log_safe should call vsyslog() directly. 

In fairness, if the argument is that we should try to only lock what's
absolutely necessary, then multipath has far worse offenders than
logev_lock. So I don't feel super strongly about this, if there's a
reason why you like your way better.

-Ben

> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/log_pthread.c | 39 ++++++++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/libmultipath/log_pthread.c b/libmultipath/log_pthread.c
> index 3c73941..91c9c19 100644
> --- a/libmultipath/log_pthread.c
> +++ b/libmultipath/log_pthread.c
> @@ -17,31 +17,42 @@
>  
>  static pthread_t log_thr;
>  
> -static pthread_mutex_t logq_lock;
> -static pthread_mutex_t logev_lock;
> -static pthread_cond_t logev_cond;
> +/* logev_lock must not be taken with logq_lock held */
> +static pthread_mutex_t logq_lock = PTHREAD_MUTEX_INITIALIZER;
> +static pthread_mutex_t logev_lock = PTHREAD_MUTEX_INITIALIZER;
> +static pthread_cond_t logev_cond = PTHREAD_COND_INITIALIZER;
>  
>  static int logq_running;
>  static int log_messages_pending;
>  
>  void log_safe (int prio, const char * fmt, va_list ap)
>  {
> +	bool running;
> +
>  	if (prio > LOG_DEBUG)
>  		prio = LOG_DEBUG;
>  
> -	if (log_thr == (pthread_t)0) {
> -		vsyslog(prio, fmt, ap);
> -		return;
> -	}
> +	/*
> +	 * logev_lock protects logq_running. By holding it, we avoid a race
> +	 * with log_thread_stop() -> log_close(), which would free the logarea.
> +	 */
> +	pthread_mutex_lock(&logev_lock);
> +	pthread_cleanup_push(cleanup_mutex, &logev_lock);
> +	running = logq_running;
>  
> -	pthread_mutex_lock(&logq_lock);
> -	log_enqueue(prio, fmt, ap);
> -	pthread_mutex_unlock(&logq_lock);
> +	if (running) {
> +		pthread_mutex_lock(&logq_lock);
> +		pthread_cleanup_push(cleanup_mutex, &logq_lock);
> +		log_enqueue(prio, fmt, ap);
> +		pthread_cleanup_pop(1);
>  
> -	pthread_mutex_lock(&logev_lock);
> -	log_messages_pending = 1;
> -	pthread_cond_signal(&logev_cond);
> -	pthread_mutex_unlock(&logev_lock);
> +		log_messages_pending = 1;
> +		pthread_cond_signal(&logev_cond);
> +	}
> +	pthread_cleanup_pop(1);
> +
> +	if (!running)
> +		vsyslog(prio, fmt, ap);
>  }
>  
>  static void flush_logqueue (void)
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

