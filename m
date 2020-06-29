Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 50A6420F782
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 16:49:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-qRxz5woLOuKDd6uLOx5bzw-1; Tue, 30 Jun 2020 10:49:04 -0400
X-MC-Unique: qRxz5woLOuKDd6uLOx5bzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5FAC107ACF6;
	Tue, 30 Jun 2020 14:48:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3052610F2;
	Tue, 30 Jun 2020 14:48:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 019E46C9C3;
	Tue, 30 Jun 2020 14:48:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TLSjWl004934 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 17:28:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 255002156A4E; Mon, 29 Jun 2020 21:28:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20FC32157F25
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 21:28:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAD968007A4
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 21:28:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-27-e2IE9ftSM4m2cviO78lPKQ-1; Mon, 29 Jun 2020 17:28:40 -0400
X-MC-Unique: e2IE9ftSM4m2cviO78lPKQ-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jq1KI-0006Yy-Ou; Mon, 29 Jun 2020 21:28:30 +0000
Date: Mon, 29 Jun 2020 22:28:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200629212830.GJ25523@casper.infradead.org>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
	<20200629050851.GC1492837@kernel.org>
	<20200629121816.GC25523@casper.infradead.org>
	<20200629125231.GJ32461@dhcp22.suse.cz>
	<6421BC93-CF2F-4697-B5CB-5ECDAA9FCB37@kernel.org>
MIME-Version: 1.0
In-Reply-To: <6421BC93-CF2F-4697-B5CB-5ECDAA9FCB37@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jun 2020 10:48:45 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Michal Hocko <mhocko@kernel.org>, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 29, 2020 at 04:45:14PM +0300, Mike Rapoport wrote:
> 
> 
> On June 29, 2020 3:52:31 PM GMT+03:00, Michal Hocko <mhocko@kernel.org> wrote:
> >On Mon 29-06-20 13:18:16, Matthew Wilcox wrote:
> >> On Mon, Jun 29, 2020 at 08:08:51AM +0300, Mike Rapoport wrote:
> >> > > @@ -886,8 +868,12 @@ static struct dm_buffer
> >*__alloc_buffer_wait_no_callback(struct dm_bufio_client
> >> > >  			return NULL;
> >> > >  
> >> > >  		if (dm_bufio_cache_size_latch != 1 && !tried_noio_alloc) {
> >> > > +			unsigned noio_flag;
> >> > > +
> >> > >  			dm_bufio_unlock(c);
> >> > > -			b = alloc_buffer(c, GFP_NOIO | __GFP_NORETRY |
> >__GFP_NOMEMALLOC | __GFP_NOWARN);
> >> > > +			noio_flag = memalloc_noio_save();
> >> > 
> >> > I've read the series twice and I'm still missing the definition of
> >> > memalloc_noio_save().
> >> > 
> >> > And also it would be nice to have a paragraph about it in
> >> > Documentation/core-api/memory-allocation.rst
> >> 
> >>
> >Documentation/core-api/gfp_mask-from-fs-io.rst:``memalloc_nofs_save``,
> >``memalloc_nofs_restore`` respectively ``memalloc_noio_save``,
> >> Documentation/core-api/gfp_mask-from-fs-io.rst:   :functions:
> >memalloc_noio_save memalloc_noio_restore
> >> Documentation/core-api/gfp_mask-from-fs-io.rst:allows nesting so it
> >is safe to call ``memalloc_noio_save`` or
> > 
> >The patch is adding memalloc_nowait* and I suspect Mike had that in
> >mind, which would be a fair request. 
> 
> Right, sorry misprinted that.
> 
> > Btw. we are missing
> >memalloc_nocma*
> >documentation either - I was just reminded of its existence today..

Heh.  Oops, not sure how those got left out.  I hadn't touched the
documentation either, so -1 points to me.

The documentation is hard to add a new case to, so I rewrote it.  What
do you think?  (Obviously I'll split this out differently for submission;
this is just what I have in my tree right now).

diff --git a/Documentation/core-api/gfp_mask-from-fs-io.rst b/Documentation/core-api/gfp_mask-from-fs-io.rst
deleted file mode 100644
index e7c32a8de126..000000000000
--- a/Documentation/core-api/gfp_mask-from-fs-io.rst
+++ /dev/null
@@ -1,68 +0,0 @@
-.. _gfp_mask_from_fs_io:
-
-=================================
-GFP masks used from FS/IO context
-=================================
-
-:Date: May, 2018
-:Author: Michal Hocko <mhocko@kernel.org>
-
-Introduction
-============
-
-Code paths in the filesystem and IO stacks must be careful when
-allocating memory to prevent recursion deadlocks caused by direct
-memory reclaim calling back into the FS or IO paths and blocking on
-already held resources (e.g. locks - most commonly those used for the
-transaction context).
-
-The traditional way to avoid this deadlock problem is to clear __GFP_FS
-respectively __GFP_IO (note the latter implies clearing the first as well) in
-the gfp mask when calling an allocator. GFP_NOFS respectively GFP_NOIO can be
-used as shortcut. It turned out though that above approach has led to
-abuses when the restricted gfp mask is used "just in case" without a
-deeper consideration which leads to problems because an excessive use
-of GFP_NOFS/GFP_NOIO can lead to memory over-reclaim or other memory
-reclaim issues.
-
-New API
-========
-
-Since 4.12 we do have a generic scope API for both NOFS and NOIO context
-``memalloc_nofs_save``, ``memalloc_nofs_restore`` respectively ``memalloc_noio_save``,
-``memalloc_noio_restore`` which allow to mark a scope to be a critical
-section from a filesystem or I/O point of view. Any allocation from that
-scope will inherently drop __GFP_FS respectively __GFP_IO from the given
-mask so no memory allocation can recurse back in the FS/IO.
-
-.. kernel-doc:: include/linux/sched/mm.h
-   :functions: memalloc_nofs_save memalloc_nofs_restore
-.. kernel-doc:: include/linux/sched/mm.h
-   :functions: memalloc_noio_save memalloc_noio_restore
-
-FS/IO code then simply calls the appropriate save function before
-any critical section with respect to the reclaim is started - e.g.
-lock shared with the reclaim context or when a transaction context
-nesting would be possible via reclaim. The restore function should be
-called when the critical section ends. All that ideally along with an
-explanation what is the reclaim context for easier maintenance.
-
-Please note that the proper pairing of save/restore functions
-allows nesting so it is safe to call ``memalloc_noio_save`` or
-``memalloc_noio_restore`` respectively from an existing NOIO or NOFS
-scope.
-
-What about __vmalloc(GFP_NOFS)
-==============================
-
-vmalloc doesn't support GFP_NOFS semantic because there are hardcoded
-GFP_KERNEL allocations deep inside the allocator which are quite non-trivial
-to fix up. That means that calling ``vmalloc`` with GFP_NOFS/GFP_NOIO is
-almost always a bug. The good news is that the NOFS/NOIO semantic can be
-achieved by the scope API.
-
-In the ideal world, upper layers should already mark dangerous contexts
-and so no special care is required and vmalloc should be called without
-any problems. Sometimes if the context is not really clear or there are
-layering violations then the recommended way around that is to wrap ``vmalloc``
-by the scope API with a comment explaining the problem.
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 15ab86112627..55f611e34a1d 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -90,7 +90,6 @@ more memory-management documentation in :doc:`/vm/index`.
    genalloc
    pin_user_pages
    boot-time-mm
-   gfp_mask-from-fs-io
 
 Interfaces for kernel debugging
 ===============================
diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 4aa82ddd01b8..c6287c25ff99 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -69,13 +69,12 @@ here we briefly outline their recommended usage:
     ``GFP_USER`` means that the allocated memory is not movable and it
     must be directly accessible by the kernel.
 
-You may notice that quite a few allocations in the existing code
-specify ``GFP_NOIO`` or ``GFP_NOFS``. Historically, they were used to
-prevent recursion deadlocks caused by direct memory reclaim calling
-back into the FS or IO paths and blocking on already held
-resources. Since 4.12 the preferred way to address this issue is to
-use new scope APIs described in
-:ref:`Documentation/core-api/gfp_mask-from-fs-io.rst <gfp_mask_from_fs_io>`.
+You may notice that quite a few allocations in the existing code specify
+``GFP_NOIO`` or ``GFP_NOFS``. Historically, they were used to prevent
+recursion deadlocks caused by direct memory reclaim calling back into
+the FS or IO paths and blocking on already held resources. Since 4.12
+the preferred way to address this issue is to use the new scope APIs
+described below.
 
 Other legacy GFP flags are ``GFP_DMA`` and ``GFP_DMA32``. They are
 used to ensure that the allocated memory is accessible by hardware
@@ -84,6 +83,37 @@ driver for a device with such restrictions, avoid using these flags.
 And even with hardware with restrictions it is preferable to use
 `dma_alloc*` APIs.
 
+Memory scoping API
+==================
+
+Traditionally, we have passed GFP flags to functions that we call,
+indicating what kind of actions may be taken to free up memory if none
+is currently available.  This has proved impractical in some places and
+so we are currently transitioning to the calls below which override the
+flags specified by any particular call to allocate memory.
+
+.. kernel-doc:: include/linux/sched/mm.h
+   :functions: memalloc_nofs_save memalloc_nofs_restore
+.. kernel-doc:: include/linux/sched/mm.h
+   :functions: memalloc_noio_save memalloc_noio_restore
+.. kernel-doc:: include/linux/sched/mm.h
+   :functions: memalloc_nocma_save memalloc_nocma_restore
+.. kernel-doc:: include/linux/sched/mm.h
+   :functions: memalloc_nowait_save memalloc_nowait_restore
+
+These functions should be called at the point where any memory allocation
+would start to cause problems.  That is, do not simply wrap individual
+memory allocation calls which currently use ``GFP_NOFS`` with a pair
+of calls to memalloc_nofs_save() and memalloc_nofs_restore().  Instead,
+find the lock which is taken that would cause problems if memory reclaim
+reentered the filesystem, place a call to memalloc_nofs_save() before it
+is acquired and a call to memalloc_nofs_restore() after it is released.
+Ideally also add a comment explaining why this lock will be problematic.
+
+Please note that the proper pairing of save/restore functions
+allows nesting so it is safe to call memalloc_noio_save() and
+memalloc_noio_restore() within an existing NOIO or NOFS scope.
+
 Selecting memory allocator
 ==========================
 
@@ -104,16 +134,19 @@ ARCH_KMALLOC_MINALIGN bytes.  For sizes which are a power of two, the
 alignment is also guaranteed to be at least the respective size.
 
 For large allocations you can use vmalloc() and vzalloc(), or directly
-request pages from the page allocator. The memory allocated by `vmalloc`
-and related functions is not physically contiguous.
+request pages from the page allocator.  The memory allocated by `vmalloc`
+and related functions is not physically contiguous.  The `vmalloc`
+family of functions don't support the old ``GFP_NOFS`` or ``GFP_NOIO``
+flags because there are hardcoded ``GFP_KERNEL`` allocations deep inside
+the allocator which are hard to remove.  However, the scope APIs described
+above can be used to limit the `vmalloc` functions.
 
 If you are not sure whether the allocation size is too large for
 `kmalloc`, it is possible to use kvmalloc() and its derivatives. It will
 try to allocate memory with `kmalloc` and if the allocation fails it
-will be retried with `vmalloc`. There are restrictions on which GFP
-flags can be used with `kvmalloc`; please see kvmalloc_node() reference
-documentation. Note that `kvmalloc` may return memory that is not
-physically contiguous.
+will be retried with `vmalloc`. That means the GFP flags supported by
+`kvmalloc` are the same as those supported by `vmalloc` and `kvmalloc`
+may return memory that is not physically contiguous.
 
 If you need to allocate many identical objects you can use the slab
 cache allocator. The cache should be set up with kmem_cache_create() or
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 6484569f50df..9fc091274d1d 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -186,9 +186,10 @@ static inline gfp_t current_gfp_context(gfp_t flags)
 		 * them.  noio implies neither IO nor FS and it is a weaker
 		 * context so always make sure it takes precedence.
 		 */
-		if (current->memalloc_nowait)
+		if (current->memalloc_nowait) {
 			flags &= ~__GFP_DIRECT_RECLAIM;
-		else if (current->memalloc_noio)
+			flags |= __GFP_NOWARN;
+		} else if (current->memalloc_noio)
 			flags &= ~(__GFP_IO | __GFP_FS);
 		else if (current->memalloc_nofs)
 			flags &= ~__GFP_FS;
@@ -275,6 +276,36 @@ static inline void memalloc_nofs_restore(unsigned int flags)
 	current->memalloc_nofs = flags ? 1 : 0;
 }
 
+/**
+ * memalloc_nowait_save - Marks implicit GFP_NOWAIT allocation scope.
+ *
+ * This functions marks the beginning of the GFP_NOWAIT allocation scope.
+ * All further allocations will implicitly disallow all waiting in the
+ * page allocator.  Use memalloc_nowait_restore() to end the scope with
+ * flags returned by this function.
+ *
+ * This function is safe to be used from any context.
+ */
+static inline unsigned int memalloc_nowait_save(void)
+{
+	unsigned int flags = current->memalloc_nowait;
+	current->memalloc_nowait = 1;
+	return flags;
+}
+
+/**
+ * memalloc_nowait_restore - Ends the implicit GFP_NOWAIT scope.
+ * @flags: Flags to restore.
+ *
+ * Ends the implicit GFP_NOWAIT scope started by memalloc_nowait_save().
+ * Always make sure that that the given flags is the return value from the
+ * pairing memalloc_nowait_save call.
+ */
+static inline void memalloc_nowait_restore(unsigned int flags)
+{
+	current->memalloc_nowait = flags ? 1 : 0;
+}
+
 static inline unsigned int memalloc_noreclaim_save(void)
 {
 	unsigned int flags = current->flags & PF_MEMALLOC;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

