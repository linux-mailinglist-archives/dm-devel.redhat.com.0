Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3AA40CF39
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 00:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631743669;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2w6K22Kk55IeQyvjalnHDk5sf51u9H1emtkU2E5OLCk=;
	b=U7KvFn09txrboZEK0CT8M8F4KKZNFYGxfi1C9UHMo0T9IU9RTk0PMsv9MywIlZ29LtSCVK
	RVG2Rx3osYq2S/3aLiTBirQGaKMRhAv289RHSZLta0usjuyXHRxm6Wt4uoR52jWkSRJXhZ
	0ykg8PR2uuQ6HsP55owMDusKdXuOkjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-lvc0MpzCMY-Bh4lJQY5Eyw-1; Wed, 15 Sep 2021 18:07:47 -0400
X-MC-Unique: lvc0MpzCMY-Bh4lJQY5Eyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AF161922023;
	Wed, 15 Sep 2021 22:07:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37BA3100238C;
	Wed, 15 Sep 2021 22:07:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFCC34E58F;
	Wed, 15 Sep 2021 22:07:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FM7AcP008088 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 18:07:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF4CF5C1C5; Wed, 15 Sep 2021 22:07:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D32065C1A1;
	Wed, 15 Sep 2021 22:07:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18FM75Vp006332; 
	Wed, 15 Sep 2021 17:07:06 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18FM74j1006331;
	Wed, 15 Sep 2021 17:07:04 -0500
Date: Wed, 15 Sep 2021 17:07:04 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210915220704.GM3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 01/35] libmultipath: add timespeccmp()
	utility function
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:40:46PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Add a small utility that will be used in later patches.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/libmultipath.version |  5 +++++
>  libmultipath/time-util.c          | 12 ++++++++++++
>  libmultipath/time-util.h          |  1 +
>  3 files changed, 18 insertions(+)
> 
> diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
> index eb5b5b5..c98cf7f 100644
> --- a/libmultipath/libmultipath.version
> +++ b/libmultipath/libmultipath.version
> @@ -287,3 +287,8 @@ global:
>  local:
>  	*;
>  };
> +
> +LIBMULTIPATH_9.1.0 {
> +global:
> +	timespeccmp;
> +} LIBMULTIPATH_9.0.0;
> diff --git a/libmultipath/time-util.c b/libmultipath/time-util.c
> index 55f366c..2919300 100644
> --- a/libmultipath/time-util.c
> +++ b/libmultipath/time-util.c
> @@ -49,3 +49,15 @@ void timespecsub(const struct timespec *a, const struct timespec *b,
>  	res->tv_nsec = a->tv_nsec - b->tv_nsec;
>  	normalize_timespec(res);
>  }
> +
> +int timespeccmp(const struct timespec *a, const struct timespec *b)
> +{
> +	struct timespec tmp;
> +
> +	timespecsub(a, b, &tmp);
> +	if (tmp.tv_sec > 0)
> +		return 1;
> +	if (tmp.tv_sec < 0)
> +		return -1;
> +	return tmp.tv_nsec > 0 ? 1 : (tmp.tv_nsec < 0 ? -1 : 0);
> +}
> diff --git a/libmultipath/time-util.h b/libmultipath/time-util.h
> index b23d328..4a80ebd 100644
> --- a/libmultipath/time-util.h
> +++ b/libmultipath/time-util.h
> @@ -10,5 +10,6 @@ void pthread_cond_init_mono(pthread_cond_t *cond);
>  void normalize_timespec(struct timespec *ts);
>  void timespecsub(const struct timespec *a, const struct timespec *b,
>  		 struct timespec *res);
> +int timespeccmp(const struct timespec *a, const struct timespec *b);
>  
>  #endif /* _TIME_UTIL_H_ */
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

