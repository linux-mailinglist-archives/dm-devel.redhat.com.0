Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DF21D20EE98
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 08:35:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-2eieDnTfONGaa3D7xoMO_w-1; Tue, 30 Jun 2020 02:35:23 -0400
X-MC-Unique: 2eieDnTfONGaa3D7xoMO_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1DE4107ACCA;
	Tue, 30 Jun 2020 06:35:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D9BC60BEC;
	Tue, 30 Jun 2020 06:35:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D633B8789F;
	Tue, 30 Jun 2020 06:35:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U6YniG003455 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 02:34:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48DC020234B2; Tue, 30 Jun 2020 06:34:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43B8D2029F82
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 06:34:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56DB2800260
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 06:34:45 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-135-gmxQZE1TMv2hA2mp4KKVtg-1; Tue, 30 Jun 2020 02:34:40 -0400
X-MC-Unique: gmxQZE1TMv2hA2mp4KKVtg-1
Received: by mail-ed1-f65.google.com with SMTP id dg28so15061484edb.3;
	Mon, 29 Jun 2020 23:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=08Q8MYk57nf50eKT+zhrwFWx+pjsPYwbCvTbWZUGRNw=;
	b=TtIWsBd+O18/sakGaRgj6jo34F6nDYKjizOa8wPP+jGUZY76j47xiCun17g19jMXcZ
	ggmyv/ETPt7jPKeBMJJPnYKJkiWjZxUjrqyIvxWkegORrzK5DS48qhGm5NEL28pXN1Cf
	S+aJbbag3PMVAiZOv4FiRmRTSnIqFT5ryOqkLbeMMKo6gmX30SsW97kEJ/eESZ7UNGOJ
	9kZUyqhwKjYYF+8Z+fg/s5sY9lHsnFrhPGUB/RM660A9Z6TFUzEId+C66bQ+vGe7KoYr
	QlsZ5Vq5RCA4F6bPBga/Yz4pU7fPTMiJO7h1Y9yQr3PMIyFm/mojfJSmLMvl1o70yrlo
	qaGA==
X-Gm-Message-State: AOAM531cOR7ekVWUIRkoB/QZ8Wq9eXxfshaj4OLjLUpY4H3UKKTJeARH
	v61aHbAxKdkHCx5dJM8vHKI=
X-Google-Smtp-Source: ABdhPJxunSgADBb9QQJsLofbqJtzUkXANO3RuWCzGJaJcXjb9jx7A2J8au+Axw9+k1JYJgQTjlCqOw==
X-Received: by 2002:aa7:d2c9:: with SMTP id k9mr13314912edr.98.1593498878441; 
	Mon, 29 Jun 2020 23:34:38 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id
	n16sm1248495ejo.54.2020.06.29.23.34.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 29 Jun 2020 23:34:37 -0700 (PDT)
Date: Tue, 30 Jun 2020 08:34:36 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200630063436.GA2369@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200629050851.GC1492837@kernel.org>
	<20200629121816.GC25523@casper.infradead.org>
	<20200629125231.GJ32461@dhcp22.suse.cz>
	<6421BC93-CF2F-4697-B5CB-5ECDAA9FCB37@kernel.org>
	<20200629212830.GJ25523@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200629212830.GJ25523@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [dm-devel] [PATCH 6/6] mm: Add memalloc_nowait
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon 29-06-20 22:28:30, Matthew Wilcox wrote:
[...]
> The documentation is hard to add a new case to, so I rewrote it.  What
> do you think?  (Obviously I'll split this out differently for submission;
> this is just what I have in my tree right now).

I am fine with your changes. Few notes below.

> -It turned out though that above approach has led to
> -abuses when the restricted gfp mask is used "just in case" without a
> -deeper consideration which leads to problems because an excessive use
> -of GFP_NOFS/GFP_NOIO can lead to memory over-reclaim or other memory
> -reclaim issues.

I believe this is an important part because it shows that new people
coming to the existing code shouldn't take it as correct and rather
question it. Also having a clear indication that overuse is causing real
problems that might be not immediately visible to subsystems outside of
MM.

> -FS/IO code then simply calls the appropriate save function before
> -any critical section with respect to the reclaim is started - e.g.
> -lock shared with the reclaim context or when a transaction context
> -nesting would be possible via reclaim.  

[...]

> +These functions should be called at the point where any memory allocation
> +would start to cause problems.  That is, do not simply wrap individual
> +memory allocation calls which currently use ``GFP_NOFS`` with a pair
> +of calls to memalloc_nofs_save() and memalloc_nofs_restore().  Instead,
> +find the lock which is taken that would cause problems if memory reclaim
> +reentered the filesystem, place a call to memalloc_nofs_save() before it
> +is acquired and a call to memalloc_nofs_restore() after it is released.
> +Ideally also add a comment explaining why this lock will be problematic.

The above text has mentioned the transaction context nesting as well and
that was a hint by Dave IIRC. It is imho good to have an example of
other reentrant points than just locks. I believe another useful example
would be something like loop device which is mixing IO and FS layers but
I am not familiar with all the details to give you an useful text.

[...]
> @@ -104,16 +134,19 @@ ARCH_KMALLOC_MINALIGN bytes.  For sizes which are a power of two, the
>  alignment is also guaranteed to be at least the respective size.
>  
>  For large allocations you can use vmalloc() and vzalloc(), or directly
> -request pages from the page allocator. The memory allocated by `vmalloc`
> -and related functions is not physically contiguous.
> +request pages from the page allocator.  The memory allocated by `vmalloc`
> +and related functions is not physically contiguous.  The `vmalloc`
> +family of functions don't support the old ``GFP_NOFS`` or ``GFP_NOIO``
> +flags because there are hardcoded ``GFP_KERNEL`` allocations deep inside
> +the allocator which are hard to remove.  However, the scope APIs described
> +above can be used to limit the `vmalloc` functions.

I would reiterate "Do not just wrap vmalloc by the scope api but rather
rely on the real scope for the NOFS/NOIO context". Maybe we want to
stress out that once a scope is defined it is sticky to _all_
allocations and all allocators within that scope. The text is already
saying that but maybe we want to make it explicit and make it stand out.

[...]
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 6484569f50df..9fc091274d1d 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -186,9 +186,10 @@ static inline gfp_t current_gfp_context(gfp_t flags)
>  		 * them.  noio implies neither IO nor FS and it is a weaker
>  		 * context so always make sure it takes precedence.
>  		 */
> -		if (current->memalloc_nowait)
> +		if (current->memalloc_nowait) {
>  			flags &= ~__GFP_DIRECT_RECLAIM;
> -		else if (current->memalloc_noio)
> +			flags |= __GFP_NOWARN;

I dunno. I wouldn't make nowait implicitly NOWARN as well. At least not
with the initial implementation. Maybe we will learn later that there is
just too much unhelpful noise in the kernel log and will reconsider but
I wouldn't just start with that. Also we might learn that there will be
other modifiers for atomic (or should I say non-sleeping) scopes to be
defined. E.g. access to memory reserves but let's just wait for real
usecases.


Thanks a lot Matthew!
-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

