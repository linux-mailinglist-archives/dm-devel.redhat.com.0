Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9CC2102A9
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:12:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-jrao3VpEN8i5OX29hTVfiA-1; Wed, 01 Jul 2020 00:12:53 -0400
X-MC-Unique: jrao3VpEN8i5OX29hTVfiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A3D8800C64;
	Wed,  1 Jul 2020 04:12:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8662217C0F;
	Wed,  1 Jul 2020 04:12:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D71893F61;
	Wed,  1 Jul 2020 04:12:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614CCUi003657 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:12:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 152F22166BA2; Wed,  1 Jul 2020 04:12:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11336217B439
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:12:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2935B185A78B
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:12:10 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-482-K7vPyNqCP1mnE7WcvBpF6g-1; Wed, 01 Jul 2020 00:12:08 -0400
X-MC-Unique: K7vPyNqCP1mnE7WcvBpF6g-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jqU6N-0001r3-5N; Wed, 01 Jul 2020 04:12:03 +0000
Date: Wed, 1 Jul 2020 05:12:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Michal Hocko <mhocko@kernel.org>
Message-ID: <20200701041203.GQ25523@casper.infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200629050851.GC1492837@kernel.org>
	<20200629121816.GC25523@casper.infradead.org>
	<20200629125231.GJ32461@dhcp22.suse.cz>
	<6421BC93-CF2F-4697-B5CB-5ECDAA9FCB37@kernel.org>
	<20200629212830.GJ25523@casper.infradead.org>
	<20200630063436.GA2369@dhcp22.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200630063436.GA2369@dhcp22.suse.cz>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 30, 2020 at 08:34:36AM +0200, Michal Hocko wrote:
> On Mon 29-06-20 22:28:30, Matthew Wilcox wrote:
> [...]
> > The documentation is hard to add a new case to, so I rewrote it.  What
> > do you think?  (Obviously I'll split this out differently for submission;
> > this is just what I have in my tree right now).
> 
> I am fine with your changes. Few notes below.

Thanks!

> > -It turned out though that above approach has led to
> > -abuses when the restricted gfp mask is used "just in case" without a
> > -deeper consideration which leads to problems because an excessive use
> > -of GFP_NOFS/GFP_NOIO can lead to memory over-reclaim or other memory
> > -reclaim issues.
> 
> I believe this is an important part because it shows that new people
> coming to the existing code shouldn't take it as correct and rather
> question it. Also having a clear indication that overuse is causing real
> problems that might be not immediately visible to subsystems outside of
> MM.

It seemed to say a lot of the same things as this paragraph:

+You may notice that quite a few allocations in the existing code specify
+``GFP_NOIO`` or ``GFP_NOFS``. Historically, they were used to prevent
+recursion deadlocks caused by direct memory reclaim calling back into
+the FS or IO paths and blocking on already held resources. Since 4.12
+the preferred way to address this issue is to use the new scope APIs
+described below.

Since this is in core-api/ rather than vm/, I felt that discussion of
the problems that it causes to the mm was a bit too much detail for the
people who would be reading this document.  Maybe I could move that
information into a new Documentation/vm/reclaim.rst file?

Let's see if Our Grumpy Editor has time to give us his advice on this.

> > -FS/IO code then simply calls the appropriate save function before
> > -any critical section with respect to the reclaim is started - e.g.
> > -lock shared with the reclaim context or when a transaction context
> > -nesting would be possible via reclaim.  
> 
> [...]
> 
> > +These functions should be called at the point where any memory allocation
> > +would start to cause problems.  That is, do not simply wrap individual
> > +memory allocation calls which currently use ``GFP_NOFS`` with a pair
> > +of calls to memalloc_nofs_save() and memalloc_nofs_restore().  Instead,
> > +find the lock which is taken that would cause problems if memory reclaim
> > +reentered the filesystem, place a call to memalloc_nofs_save() before it
> > +is acquired and a call to memalloc_nofs_restore() after it is released.
> > +Ideally also add a comment explaining why this lock will be problematic.
> 
> The above text has mentioned the transaction context nesting as well and
> that was a hint by Dave IIRC. It is imho good to have an example of
> other reentrant points than just locks. I believe another useful example
> would be something like loop device which is mixing IO and FS layers but
> I am not familiar with all the details to give you an useful text.

I'll let Mikulas & Dave finish fighting about that before I write any
text mentioning the loop driver.  How about this for mentioning the
filesystem transaction possibility?

@@ -103,12 +103,16 @@ flags specified by any particular call to allocate memory.
 
 These functions should be called at the point where any memory allocation
 would start to cause problems.  That is, do not simply wrap individual
-memory allocation calls which currently use ``GFP_NOFS`` with a pair
-of calls to memalloc_nofs_save() and memalloc_nofs_restore().  Instead,
-find the lock which is taken that would cause problems if memory reclaim
+memory allocation calls which currently use ``GFP_NOFS`` with a pair of
+calls to memalloc_nofs_save() and memalloc_nofs_restore().  Instead, find
+the resource which is acquired that would cause problems if memory reclaim
 reentered the filesystem, place a call to memalloc_nofs_save() before it
 is acquired and a call to memalloc_nofs_restore() after it is released.
 Ideally also add a comment explaining why this lock will be problematic.
+A resource might be a lock which would need to be acquired by an attempt
+to reclaim memory, or it might be starting a transaction that should not
+nest over a memory reclaim transaction.  Deep knowledge of the filesystem
+or driver is often needed to place memory scoping calls correctly.
 
 Please note that the proper pairing of save/restore functions
 allows nesting so it is safe to call memalloc_noio_save() and

> > @@ -104,16 +134,19 @@ ARCH_KMALLOC_MINALIGN bytes.  For sizes which are a power of two, the
> >  alignment is also guaranteed to be at least the respective size.
> >  
> >  For large allocations you can use vmalloc() and vzalloc(), or directly
> > -request pages from the page allocator. The memory allocated by `vmalloc`
> > -and related functions is not physically contiguous.
> > +request pages from the page allocator.  The memory allocated by `vmalloc`
> > +and related functions is not physically contiguous.  The `vmalloc`
> > +family of functions don't support the old ``GFP_NOFS`` or ``GFP_NOIO``
> > +flags because there are hardcoded ``GFP_KERNEL`` allocations deep inside
> > +the allocator which are hard to remove.  However, the scope APIs described
> > +above can be used to limit the `vmalloc` functions.
> 
> I would reiterate "Do not just wrap vmalloc by the scope api but rather
> rely on the real scope for the NOFS/NOIO context". Maybe we want to
> stress out that once a scope is defined it is sticky to _all_
> allocations and all allocators within that scope. The text is already
> saying that but maybe we want to make it explicit and make it stand out.

yes.  I went with:

@@ -139,7 +143,10 @@ and related functions is not physically contiguous.  The `vmalloc`
 family of functions don't support the old ``GFP_NOFS`` or ``GFP_NOIO``
 flags because there are hardcoded ``GFP_KERNEL`` allocations deep inside
 the allocator which are hard to remove.  However, the scope APIs described
-above can be used to limit the `vmalloc` functions.
+above can be used to limit the `vmalloc` functions.  As described above,
+do not simply wrap individual calls in the scope APIs, but look for the
+underlying reason why the memory allocation may not call into filesystems
+or block devices.
 
 If you are not sure whether the allocation size is too large for
 `kmalloc`, it is possible to use kvmalloc() and its derivatives. It will


> [...]
> > diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> > index 6484569f50df..9fc091274d1d 100644
> > --- a/include/linux/sched/mm.h
> > +++ b/include/linux/sched/mm.h
> > @@ -186,9 +186,10 @@ static inline gfp_t current_gfp_context(gfp_t flags)
> >  		 * them.  noio implies neither IO nor FS and it is a weaker
> >  		 * context so always make sure it takes precedence.
> >  		 */
> > -		if (current->memalloc_nowait)
> > +		if (current->memalloc_nowait) {
> >  			flags &= ~__GFP_DIRECT_RECLAIM;
> > -		else if (current->memalloc_noio)
> > +			flags |= __GFP_NOWARN;
> 
> I dunno. I wouldn't make nowait implicitly NOWARN as well. At least not
> with the initial implementation. Maybe we will learn later that there is
> just too much unhelpful noise in the kernel log and will reconsider but
> I wouldn't just start with that. Also we might learn that there will be
> other modifiers for atomic (or should I say non-sleeping) scopes to be
> defined. E.g. access to memory reserves but let's just wait for real
> usecases.

Fair enough.  I'll drop that part.  Thanks!

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

