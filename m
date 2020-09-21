Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C798027338F
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 22:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600719937;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zi+JYFIRfFNDNExz5Yglr6a19lhj83YOCZmuNk4kQo0=;
	b=ciaFEZAONQar029rS7MNW+sM5yyq4n3SWJnpxp3tjgYrgEY/bi8SbOZSvyis3tTtdr6/NC
	6UbMG+Ofj0HxAWWHTSg+b2+LSh8UocT8gCXNs3enb6iOz9R1osC56Bn9hxn2suvCnPK7d0
	wPt9RFfhJAEPFmVYCKqwNZDzuhpmskI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-dFT-PtiPOA-FbyA_yzHnhw-1; Mon, 21 Sep 2020 16:25:35 -0400
X-MC-Unique: dFT-PtiPOA-FbyA_yzHnhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3969680EDA1;
	Mon, 21 Sep 2020 20:25:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FBA11A913;
	Mon, 21 Sep 2020 20:25:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2906A8C7AC;
	Mon, 21 Sep 2020 20:25:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LKPOu3010097 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 16:25:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5FB8A1002C03; Mon, 21 Sep 2020 20:25:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AD9A10074E5;
	Mon, 21 Sep 2020 20:25:20 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08LKPIrj000501; 
	Mon, 21 Sep 2020 15:25:19 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08LKPI3e000500;
	Mon, 21 Sep 2020 15:25:18 -0500
Date: Mon, 21 Sep 2020 15:25:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200921202517.GB11108@octiron.msp.redhat.com>
References: <20200916162658.3818-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200916162658.3818-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: fix memory leak in
	_check_bindings_file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 16, 2020 at 06:26:58PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We must pass "&line" to the cleanup function, not "line".


Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
 
> Fixes: "libmultipath: add consistency check for alias settings"
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/alias.c | 2 +-
>  libmultipath/util.c  | 8 ++++++++
>  libmultipath/util.h  | 1 +
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/libmultipath/alias.c b/libmultipath/alias.c
> index de28f25..a7ba485 100644
> --- a/libmultipath/alias.c
> +++ b/libmultipath/alias.c
> @@ -580,7 +580,7 @@ static int _check_bindings_file(const struct config *conf, FILE *file,
>  	size_t line_len = 0;
>  	ssize_t n;
>  
> -	pthread_cleanup_push(free, line);
> +	pthread_cleanup_push(cleanup_free_ptr, &line);
>  	while ((n = getline(&line, &line_len, file)) >= 0) {
>  		char *c, *alias, *wwid, *saveptr;
>  		const char *mpe_wwid;
> diff --git a/libmultipath/util.c b/libmultipath/util.c
> index 8412d30..395c710 100644
> --- a/libmultipath/util.c
> +++ b/libmultipath/util.c
> @@ -406,6 +406,14 @@ void cleanup_mutex(void *arg)
>  	pthread_mutex_unlock(arg);
>  }
>  
> +void cleanup_free_ptr(void *arg)
> +{
> +	void **p = arg;
> +
> +	if (p && *p)
> +		free(*p);
> +}
> +
>  struct bitfield *alloc_bitfield(unsigned int maxbit)
>  {
>  	unsigned int n;
> diff --git a/libmultipath/util.h b/libmultipath/util.h
> index 94ed872..21a4088 100644
> --- a/libmultipath/util.h
> +++ b/libmultipath/util.h
> @@ -49,6 +49,7 @@ int should_exit(void);
>  
>  void close_fd(void *arg);
>  void cleanup_mutex(void *arg);
> +void cleanup_free_ptr(void *arg);
>  
>  struct scandir_result {
>  	struct dirent **di;
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

