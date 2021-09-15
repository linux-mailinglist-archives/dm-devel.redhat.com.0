Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5073E40CF3E
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 00:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631744059;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AREsE3KDZI4+rishR8cGqlZTbgtYhS4xRiWNueg8RaQ=;
	b=QDvXOUcWqf5usLvSmqqkLWRi7Hgp5xbh/mTmlPAErPEE40IeXJloxE+M+IdR+lVuQrcoGn
	OX8xuGF8SHL8zmIxIO8NT8tvYbKCag948NtIoICNya4DnTNddw7cCsD715I2pnQTfutEpS
	LUJs2YCY58oMBnwWKTXdIYPgtmq5xBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-Q6O8LBBINbG9ISkbvTfaOQ-1; Wed, 15 Sep 2021 18:14:17 -0400
X-MC-Unique: Q6O8LBBINbG9ISkbvTfaOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E397C91278;
	Wed, 15 Sep 2021 22:14:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 488A6604CC;
	Wed, 15 Sep 2021 22:14:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9A444EA2A;
	Wed, 15 Sep 2021 22:14:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FMDvpP008559 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 18:13:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A5C6669ED; Wed, 15 Sep 2021 22:13:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 923DC6A912;
	Wed, 15 Sep 2021 22:13:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18FMDpo5006354; 
	Wed, 15 Sep 2021 17:13:51 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18FMDpUU006353;
	Wed, 15 Sep 2021 17:13:51 -0500
Date: Wed, 15 Sep 2021 17:13:50 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210915221350.GO3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-4-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-4-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 03/35] libmultipath: add optional wakeup
 functionality to lock.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:40:48PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Have struct mutex_lock take an optional wakeup function.
> unlock() is renamed to __unlock() in order to prevent it from
> being called by mistake.
> 

It might be worth it to make the waiter_lock into a regular
pthread_mutex_t, since it doesn't need any special handling, but
this change doesn't cause any problems with it, so

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/libmultipath.version |  5 +++++
>  libmultipath/lock.c               | 12 +++++++++++-
>  libmultipath/lock.h               |  6 +++++-
>  3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
> index c98cf7f..2107c51 100644
> --- a/libmultipath/libmultipath.version
> +++ b/libmultipath/libmultipath.version
> @@ -292,3 +292,8 @@ LIBMULTIPATH_9.1.0 {
>  global:
>  	timespeccmp;
>  } LIBMULTIPATH_9.0.0;
> +
> +LIBMULTIPATH_9.2.0 {
> +global:
> +	set_wakeup_fn;
> +} LIBMULTIPATH_9.1.0;
> diff --git a/libmultipath/lock.c b/libmultipath/lock.c
> index 72c70e3..93b48db 100644
> --- a/libmultipath/lock.c
> +++ b/libmultipath/lock.c
> @@ -3,6 +3,16 @@
>  void cleanup_lock (void * data)
>  {
>  	struct mutex_lock *lock = data;
> +	wakeup_fn *fn = lock->wakeup;
>  
> -	unlock(lock);
> +	__unlock(lock);
> +	if (fn)
> +		fn();
> +}
> +
> +void set_wakeup_fn(struct mutex_lock *lck, wakeup_fn *fn)
> +{
> +	lock(lck);
> +	lck->wakeup = fn;
> +	__unlock(lck);
>  }
> diff --git a/libmultipath/lock.h b/libmultipath/lock.h
> index d99eedb..d7b779e 100644
> --- a/libmultipath/lock.h
> +++ b/libmultipath/lock.h
> @@ -3,8 +3,11 @@
>  
>  #include <pthread.h>
>  
> +typedef void (wakeup_fn)(void);
> +
>  struct mutex_lock {
>  	pthread_mutex_t mutex;
> +	wakeup_fn *wakeup;
>  };
>  
>  static inline void lock(struct mutex_lock *a)
> @@ -22,7 +25,7 @@ static inline int timedlock(struct mutex_lock *a, struct timespec *tmo)
>  	return pthread_mutex_timedlock(&a->mutex, tmo);
>  }
>  
> -static inline void unlock(struct mutex_lock *a)
> +static inline void __unlock(struct mutex_lock *a)
>  {
>  	pthread_mutex_unlock(&a->mutex);
>  }
> @@ -30,5 +33,6 @@ static inline void unlock(struct mutex_lock *a)
>  #define lock_cleanup_pop(a) pthread_cleanup_pop(1)
>  
>  void cleanup_lock (void * data);
> +void set_wakeup_fn(struct mutex_lock *lock, wakeup_fn *fn);
>  
>  #endif /* _LOCK_H */
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

