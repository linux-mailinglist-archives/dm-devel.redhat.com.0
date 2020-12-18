Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2055D2DDC3D
	for <lists+dm-devel@lfdr.de>; Fri, 18 Dec 2020 01:03:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608249821;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G1cNqixqdJLFIMC1cdDNZ2Q+SU0gT971/ZgyLDf+DCc=;
	b=GAcQbeowSu14HZFN32cJ0Q0eYE4UVIq3vzZQ8yciK5oo+dzgb0jEZANAl83+OxQZBeR10+
	mnq1ycSxvl0aHkCn5ZDt1naYd0DhCyxaawn6zRjclmc65EAhKh6StBW1Suddbx214XNlgH
	L2i/AAlurzCR/o9h67VqkR0vB9IsGus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-6aLrnzueM8WQYzUWZESBDA-1; Thu, 17 Dec 2020 19:03:38 -0500
X-MC-Unique: 6aLrnzueM8WQYzUWZESBDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EED7C80364D;
	Fri, 18 Dec 2020 00:03:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D0E51B18A;
	Fri, 18 Dec 2020 00:03:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5280E4BB7B;
	Fri, 18 Dec 2020 00:03:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BI03Dh1015822 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 19:03:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D1BE63633; Fri, 18 Dec 2020 00:03:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24CC45D737;
	Fri, 18 Dec 2020 00:03:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BI03Bgp002514; 
	Thu, 17 Dec 2020 18:03:11 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BI03BWM002512;
	Thu, 17 Dec 2020 18:03:11 -0600
Date: Thu, 17 Dec 2020 18:03:11 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20201218000311.GD3103@octiron.msp.redhat.com>
References: <20201217110018.3347-1-mwilck@suse.com>
	<20201217110018.3347-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20201217110018.3347-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/7] libmultipath: protect logarea with
	logq_lock
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

On Thu, Dec 17, 2020 at 12:00:13PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Make sure the global logarea (la) is only allocated and freed
> hile holding logq_lock. This avoids invalid memory access.
> 
> This patch makes free_logarea() static. libmultipath.version
> is unchanged, as free_logarea() wasn't exported anyway.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/log.c | 32 +++++++++++++++++++++++---------
>  libmultipath/log.h |  1 -
>  2 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/libmultipath/log.c b/libmultipath/log.c
> index 7f33787..95c8f01 100644
> --- a/libmultipath/log.c
> +++ b/libmultipath/log.c
> @@ -77,16 +77,23 @@ static int logarea_init (int size)
>  
>  int log_init(char *program_name, int size)
>  {
> +	int ret = 1;
> +
>  	logdbg(stderr,"enter log_init\n");
> +
> +	pthread_mutex_lock(&logq_lock);
> +	pthread_cleanup_push(cleanup_mutex, &logq_lock);
> +
>  	openlog(program_name, 0, LOG_DAEMON);
> +	if (!la)
> +		ret = logarea_init(size);
>  
> -	if (logarea_init(size))
> -		return 1;
> +	pthread_cleanup_pop(1);
>  
> -	return 0;
> +	return ret;
>  }
>  
> -void free_logarea (void)
> +static void free_logarea (void)
>  {
>  	FREE(la->start);
>  	FREE(la->buff);

I realize that the log area can only be freed by log_close(), which is
called when mulitpathd exits, but it would be nice to have la set to
NULL it's freed, just to make it obvious that that there can't be
double-frees there. However, the code is clearly correct, so

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> @@ -96,9 +103,14 @@ void free_logarea (void)
>  
>  void log_close (void)
>  {
> -	free_logarea();
> +	pthread_mutex_lock(&logq_lock);
> +	pthread_cleanup_push(cleanup_mutex, &logq_lock);
> +
> +	if (la)
> +		free_logarea();
>  	closelog();
>  
> +	pthread_cleanup_pop(1);
>  	return;
>  }
>  
> @@ -175,11 +187,12 @@ static int _log_enqueue(int prio, const char * fmt, va_list ap)
>  
>  int log_enqueue(int prio, const char *fmt, va_list ap)
>  {
> -	int ret;
> +	int ret = 1;
>  
>  	pthread_mutex_lock(&logq_lock);
>  	pthread_cleanup_push(cleanup_mutex, &logq_lock);
> -	ret = _log_enqueue(prio, fmt, ap);
> +	if (la)
> +		ret = _log_enqueue(prio, fmt, ap);
>  	pthread_cleanup_pop(1);
>  	return ret;
>  }
> @@ -215,11 +228,12 @@ static int _log_dequeue(void *buff)
>  
>  int log_dequeue(void *buff)
>  {
> -	int ret;
> +	int ret = 1;
>  
>  	pthread_mutex_lock(&logq_lock);
>  	pthread_cleanup_push(cleanup_mutex, &logq_lock);
> -	ret = _log_dequeue(buff);
> +	if (la)
> +		ret = _log_dequeue(buff);
>  	pthread_cleanup_pop(1);
>  	return ret;
>  }
> diff --git a/libmultipath/log.h b/libmultipath/log.h
> index d2448f6..fa224e4 100644
> --- a/libmultipath/log.h
> +++ b/libmultipath/log.h
> @@ -39,6 +39,5 @@ int log_enqueue (int prio, const char * fmt, va_list ap)
>  int log_dequeue (void *);
>  void log_syslog (void *);
>  void dump_logmsg (void *);
> -void free_logarea (void);
>  
>  #endif /* LOG_H */
> -- 
> 2.29.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

