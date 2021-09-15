Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D7F3940CF3A
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 00:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631743676;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F1v5ne2FehdAu/fO5IGz0yGYm86GK/1PyKVVmbDvSZc=;
	b=KzuubXxQKiVnx5dXAozuvwLVLAjxZOp5usZ7XiMErecNKcpI9LaXY9R4t0RXV9BQy+x4ld
	rH61uJUXniX5AMA39lYaSnxtG++bOCbcy9F27LHieWFSUl+Km14Kzs100AcIWt35z5fcpB
	o4X+lH5GKZkF8uOB4WORa0ffNkQXmGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-PmxrBfV1M9uFwTN7J5q0XQ-1; Wed, 15 Sep 2021 18:07:54 -0400
X-MC-Unique: PmxrBfV1M9uFwTN7J5q0XQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2E3D1084687;
	Wed, 15 Sep 2021 22:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4C6F7A5CF;
	Wed, 15 Sep 2021 22:07:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04BBD4EA2A;
	Wed, 15 Sep 2021 22:07:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FM7TRt008113 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 18:07:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F3FB3AC0; Wed, 15 Sep 2021 22:07:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB8D16A912;
	Wed, 15 Sep 2021 22:07:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18FM7OgB006338; 
	Wed, 15 Sep 2021 17:07:24 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18FM7Nek006337;
	Wed, 15 Sep 2021 17:07:23 -0500
Date: Wed, 15 Sep 2021 17:07:23 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210915220723.GN3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-3-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-3-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 02/35] libmultipath: add trylock() helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:40:47PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Add a small helper.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/lock.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/libmultipath/lock.h b/libmultipath/lock.h
> index a170efe..d99eedb 100644
> --- a/libmultipath/lock.h
> +++ b/libmultipath/lock.h
> @@ -12,6 +12,11 @@ static inline void lock(struct mutex_lock *a)
>  	pthread_mutex_lock(&a->mutex);
>  }
>  
> +static inline int trylock(struct mutex_lock *a)
> +{
> +	return pthread_mutex_trylock(&a->mutex);
> +}
> +
>  static inline int timedlock(struct mutex_lock *a, struct timespec *tmo)
>  {
>  	return pthread_mutex_timedlock(&a->mutex, tmo);
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

