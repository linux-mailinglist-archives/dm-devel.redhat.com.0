Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A967621037C
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 07:55:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-7CkuLrCZMcavqauVzXxizw-1; Wed, 01 Jul 2020 01:55:46 -0400
X-MC-Unique: 7CkuLrCZMcavqauVzXxizw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E6EB8015F6;
	Wed,  1 Jul 2020 05:55:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0FC7F4F9;
	Wed,  1 Jul 2020 05:55:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F14131809543;
	Wed,  1 Jul 2020 05:55:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0615ruW4014958 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 01:53:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9C62105CDAC; Wed,  1 Jul 2020 05:53:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5967105CDAB
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 05:53:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF53A858EE2
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 05:53:54 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-2-H1cP3OxHMUmAe9b2tM35sA-1; Wed, 01 Jul 2020 01:53:50 -0400
X-MC-Unique: H1cP3OxHMUmAe9b2tM35sA-1
Received: by mail-ed1-f66.google.com with SMTP id by13so8591058edb.11;
	Tue, 30 Jun 2020 22:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=k+6o2/28qwx847jf3CSNV9jK8i0a3/ha45Nsa3unt/A=;
	b=T1ffrJXrJEbXQBcZZELTgH+GO0OaRlqtkjVkOHLeDMac+YdA5Hb0uJccFEE0xW/QEj
	MaOFuxTrp1vYK7EHgKdIoQibqwZNk+XmQva+alvZ3tlsPgFcUSvAvM8Dd2kFAzKJwHd+
	TU/9pAFp23CdKW9L0kRWunk/MmPJLiJ7ftFd9ZgsSPKoQJY7OusXRt5nzsd3Ua9rxzHe
	iwx0+mPkYPzEN6m6poy0hFiiRCiwSJjCMTbo1xdvgXjQOMIF7vJE01s928UuM06eXDSW
	uV/dzD731Rn+VOBOzWYJlqoMeP6PTlffKygg7BX+rvji6xI09UeisqhTYccQM4vdiQIx
	NA6g==
X-Gm-Message-State: AOAM533ed3mRvX+IRN3G0shuBhk9cog+DcLR+xUwuCmmIJGHpNylDkmx
	8miCvYBBLP+RvLofGZsC5uhzkr0o
X-Google-Smtp-Source: ABdhPJy8toavvw3l4F6Z9AsDPY7F9Y2lPONomNsScJDmPInnBs8xV8Kn5NNLsUJisuKfIF4IkhQJgg==
X-Received: by 2002:aa7:da89:: with SMTP id q9mr27465825eds.273.1593582828832; 
	Tue, 30 Jun 2020 22:53:48 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
	by smtp.gmail.com with ESMTPSA id g8sm5467625edk.13.2020.06.30.22.53.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Jun 2020 22:53:47 -0700 (PDT)
Date: Wed, 1 Jul 2020 07:53:46 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200701055346.GH2369@dhcp22.suse.cz>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200629050851.GC1492837@kernel.org>
	<20200629121816.GC25523@casper.infradead.org>
	<20200629125231.GJ32461@dhcp22.suse.cz>
	<6421BC93-CF2F-4697-B5CB-5ECDAA9FCB37@kernel.org>
	<20200629212830.GJ25523@casper.infradead.org>
	<20200630063436.GA2369@dhcp22.suse.cz>
	<20200701041203.GQ25523@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200701041203.GQ25523@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed 01-07-20 05:12:03, Matthew Wilcox wrote:
> On Tue, Jun 30, 2020 at 08:34:36AM +0200, Michal Hocko wrote:
> > On Mon 29-06-20 22:28:30, Matthew Wilcox wrote:
> > [...]
> > > The documentation is hard to add a new case to, so I rewrote it.  What
> > > do you think?  (Obviously I'll split this out differently for submission;
> > > this is just what I have in my tree right now).
> > 
> > I am fine with your changes. Few notes below.
> 
> Thanks!
> 
> > > -It turned out though that above approach has led to
> > > -abuses when the restricted gfp mask is used "just in case" without a
> > > -deeper consideration which leads to problems because an excessive use
> > > -of GFP_NOFS/GFP_NOIO can lead to memory over-reclaim or other memory
> > > -reclaim issues.
> > 
> > I believe this is an important part because it shows that new people
> > coming to the existing code shouldn't take it as correct and rather
> > question it. Also having a clear indication that overuse is causing real
> > problems that might be not immediately visible to subsystems outside of
> > MM.
> 
> It seemed to say a lot of the same things as this paragraph:
> 
> +You may notice that quite a few allocations in the existing code specify
> +``GFP_NOIO`` or ``GFP_NOFS``. Historically, they were used to prevent
> +recursion deadlocks caused by direct memory reclaim calling back into
> +the FS or IO paths and blocking on already held resources. Since 4.12
> +the preferred way to address this issue is to use the new scope APIs
> +described below.
> 
> Since this is in core-api/ rather than vm/, I felt that discussion of
> the problems that it causes to the mm was a bit too much detail for the
> people who would be reading this document.  Maybe I could move that
> information into a new Documentation/vm/reclaim.rst file?

Hmm, my experience is that at least some users of NOFS/NOIO use this
flag just to be sure they do not do something wrong without realizing
that this might have a very negative effect on the whole system
operation. That was the main motivation to have an explicit note there.
I am not sure having that in MM internal documentation will make it
stand out for a general reader.

But I will not insist of course.

> Let's see if Our Grumpy Editor has time to give us his advice on this.
> 
> > > -FS/IO code then simply calls the appropriate save function before
> > > -any critical section with respect to the reclaim is started - e.g.
> > > -lock shared with the reclaim context or when a transaction context
> > > -nesting would be possible via reclaim.  
> > 
> > [...]
> > 
> > > +These functions should be called at the point where any memory allocation
> > > +would start to cause problems.  That is, do not simply wrap individual
> > > +memory allocation calls which currently use ``GFP_NOFS`` with a pair
> > > +of calls to memalloc_nofs_save() and memalloc_nofs_restore().  Instead,
> > > +find the lock which is taken that would cause problems if memory reclaim
> > > +reentered the filesystem, place a call to memalloc_nofs_save() before it
> > > +is acquired and a call to memalloc_nofs_restore() after it is released.
> > > +Ideally also add a comment explaining why this lock will be problematic.
> > 
> > The above text has mentioned the transaction context nesting as well and
> > that was a hint by Dave IIRC. It is imho good to have an example of
> > other reentrant points than just locks. I believe another useful example
> > would be something like loop device which is mixing IO and FS layers but
> > I am not familiar with all the details to give you an useful text.
> 
> I'll let Mikulas & Dave finish fighting about that before I write any
> text mentioning the loop driver.  How about this for mentioning the
> filesystem transaction possibility?
> 
> @@ -103,12 +103,16 @@ flags specified by any particular call to allocate memory.
>  
>  These functions should be called at the point where any memory allocation
>  would start to cause problems.  That is, do not simply wrap individual
> -memory allocation calls which currently use ``GFP_NOFS`` with a pair
> -of calls to memalloc_nofs_save() and memalloc_nofs_restore().  Instead,
> -find the lock which is taken that would cause problems if memory reclaim
> +memory allocation calls which currently use ``GFP_NOFS`` with a pair of
> +calls to memalloc_nofs_save() and memalloc_nofs_restore().  Instead, find
> +the resource which is acquired that would cause problems if memory reclaim
>  reentered the filesystem, place a call to memalloc_nofs_save() before it
>  is acquired and a call to memalloc_nofs_restore() after it is released.
>  Ideally also add a comment explaining why this lock will be problematic.
> +A resource might be a lock which would need to be acquired by an attempt
> +to reclaim memory, or it might be starting a transaction that should not
> +nest over a memory reclaim transaction.  Deep knowledge of the filesystem
> +or driver is often needed to place memory scoping calls correctly.

Ack

>  Please note that the proper pairing of save/restore functions
>  allows nesting so it is safe to call memalloc_noio_save() and
> 
> > > @@ -104,16 +134,19 @@ ARCH_KMALLOC_MINALIGN bytes.  For sizes which are a power of two, the
> > >  alignment is also guaranteed to be at least the respective size.
> > >  
> > >  For large allocations you can use vmalloc() and vzalloc(), or directly
> > > -request pages from the page allocator. The memory allocated by `vmalloc`
> > > -and related functions is not physically contiguous.
> > > +request pages from the page allocator.  The memory allocated by `vmalloc`
> > > +and related functions is not physically contiguous.  The `vmalloc`
> > > +family of functions don't support the old ``GFP_NOFS`` or ``GFP_NOIO``
> > > +flags because there are hardcoded ``GFP_KERNEL`` allocations deep inside
> > > +the allocator which are hard to remove.  However, the scope APIs described
> > > +above can be used to limit the `vmalloc` functions.
> > 
> > I would reiterate "Do not just wrap vmalloc by the scope api but rather
> > rely on the real scope for the NOFS/NOIO context". Maybe we want to
> > stress out that once a scope is defined it is sticky to _all_
> > allocations and all allocators within that scope. The text is already
> > saying that but maybe we want to make it explicit and make it stand out.
> 
> yes.  I went with:
> 
> @@ -139,7 +143,10 @@ and related functions is not physically contiguous.  The `vmalloc`
>  family of functions don't support the old ``GFP_NOFS`` or ``GFP_NOIO``
>  flags because there are hardcoded ``GFP_KERNEL`` allocations deep inside
>  the allocator which are hard to remove.  However, the scope APIs described
> -above can be used to limit the `vmalloc` functions.
> +above can be used to limit the `vmalloc` functions.  As described above,
> +do not simply wrap individual calls in the scope APIs, but look for the
> +underlying reason why the memory allocation may not call into filesystems
> +or block devices.

ack

>  
>  If you are not sure whether the allocation size is too large for
>  `kmalloc`, it is possible to use kvmalloc() and its derivatives. It will
> 
> 
> > [...]
> > > diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> > > index 6484569f50df..9fc091274d1d 100644
> > > --- a/include/linux/sched/mm.h
> > > +++ b/include/linux/sched/mm.h
> > > @@ -186,9 +186,10 @@ static inline gfp_t current_gfp_context(gfp_t flags)
> > >  		 * them.  noio implies neither IO nor FS and it is a weaker
> > >  		 * context so always make sure it takes precedence.
> > >  		 */
> > > -		if (current->memalloc_nowait)
> > > +		if (current->memalloc_nowait) {
> > >  			flags &= ~__GFP_DIRECT_RECLAIM;
> > > -		else if (current->memalloc_noio)
> > > +			flags |= __GFP_NOWARN;
> > 
> > I dunno. I wouldn't make nowait implicitly NOWARN as well. At least not
> > with the initial implementation. Maybe we will learn later that there is
> > just too much unhelpful noise in the kernel log and will reconsider but
> > I wouldn't just start with that. Also we might learn that there will be
> > other modifiers for atomic (or should I say non-sleeping) scopes to be
> > defined. E.g. access to memory reserves but let's just wait for real
> > usecases.
> 
> Fair enough.  I'll drop that part.  Thanks!

thanks!
-- 
Michal Hocko
SUSE Labs

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

