Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8456039B1
	for <lists+dm-devel@lfdr.de>; Wed, 19 Oct 2022 08:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666160334;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hmhiti28H2I74dEAgPcmsqLFlD9g2d6KZhdh+cMOBCE=;
	b=OSUqDTtx32Q+Cnz/uRSHNr1/CzzbQXnMpU7JQdmwoE4/gDFBXltBLOxSajjg1GXPS+RfbZ
	4h/aHbtPd1mlCeGGofuHJs6gPVji+CvhKQTH4B1Dm7Z+al0K6gyCx123uKDbym3MaqQo34
	ayGnjfHE8q4AcNAp6KIYysHg+fHVZGg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-spZUDHiWP6iA7rZAT8zGoQ-1; Wed, 19 Oct 2022 02:18:50 -0400
X-MC-Unique: spZUDHiWP6iA7rZAT8zGoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C8FA1C14354;
	Wed, 19 Oct 2022 06:18:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 008CD4099B47;
	Wed, 19 Oct 2022 06:18:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 333B519465A8;
	Wed, 19 Oct 2022 06:18:40 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EACBB194658F
 for <dm-devel@listman.corp.redhat.com>; Tue, 18 Oct 2022 17:51:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B860D200B408; Tue, 18 Oct 2022 17:51:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1376200A384
 for <dm-devel@redhat.com>; Tue, 18 Oct 2022 17:51:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74AFB811E67
 for <dm-devel@redhat.com>; Tue, 18 Oct 2022 17:51:51 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-8gFJlWfLNgqV69wq7Uk7MA-1; Tue, 18 Oct 2022 13:51:49 -0400
X-MC-Unique: 8gFJlWfLNgqV69wq7Uk7MA-1
Received: by mail-pg1-f179.google.com with SMTP id 128so13970080pga.1;
 Tue, 18 Oct 2022 10:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TMLVsDeOxaJfLSB7Nf4Fo7/C7oXeEsIQmvCMFgmnqE0=;
 b=KpZ+BunaHTjpCEdH/xhv7np3c79v/KTjwKdeGWz7mfm823twxFJDO479K82IJDUFjL
 YAJv+uoyRqyljq+1GLbbLsRKSuklHTjs4x3wPbedCQYb/KN8YTPfLJWh00KeQj6LGGE5
 MvL9fvylL4C5o4yL+VNHOtbc1ygD0ogq/AfCNhrekoS+7xUs81fCM4pCUrQc1TLAz8WV
 Aj/x58OFvS9WBXcfTcV58aj5h0LNX2BQdWG5rHfqNNzI7Oj68vBOY6YYJ0PFGOy9Ksco
 u5CHhPr6ljuf/GZ3B3PpbLk3usei2bXdFjv+FSxAMv4DMuPF5bHSp0RChEo3BJg49aa8
 vkWw==
X-Gm-Message-State: ACrzQf0GqHjITeoXPoOTPLIL269hgUPhnYoBSPhEyn88J/sGE678WRzW
 EHCVFQ265acb/xwQgSL8uhkiYZPlYlvQMu9J0Am/VJ4l
X-Google-Smtp-Source: AMsMyM4flMKuRrdtA9zB35sp9o8LErRNHsL0X4chitFUdIByl4v05gzOWyNaZHWfOr8VW14oX7WFvHNqg6LQTY6JEzM=
X-Received: by 2002:a05:6a00:24c2:b0:52e:7181:a8a0 with SMTP id
 d2-20020a056a0024c200b0052e7181a8a0mr4417808pfv.57.1666115506399; Tue, 18 Oct
 2022 10:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221005180341.1738796-1-shy828301@gmail.com>
 <20221005180341.1738796-3-shy828301@gmail.com>
 <Yz7qeI0s6TjSEIFe@bfoster>
 <CAHbLzkprAJFApT8hK5z8MB8Xc4Kq6ZDTXJRByujQNEgcvo5TgQ@mail.gmail.com>
 <Y0lQJUSSjqyXTt5G@bfoster>
In-Reply-To: <Y0lQJUSSjqyXTt5G@bfoster>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 18 Oct 2022 10:51:33 -0700
Message-ID: <CAHbLzkoB1+eeaFR8TAxo75V3AxRe8oaDyYF-9PnNt4pZU--udg@mail.gmail.com>
To: Brian Foster <bfoster@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 19 Oct 2022 06:18:39 +0000
Subject: Re: [dm-devel] [PATCH 2/4] mm: mempool: introduce page bulk
 allocator
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: snitzer@kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 akpm@linux-foundation.org, mgorman@techsingularity.net, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 14, 2022 at 5:03 AM Brian Foster <bfoster@redhat.com> wrote:
>
> On Thu, Oct 06, 2022 at 11:43:21AM -0700, Yang Shi wrote:
> > On Thu, Oct 6, 2022 at 7:47 AM Brian Foster <bfoster@redhat.com> wrote:
> > >
> > > On Wed, Oct 05, 2022 at 11:03:39AM -0700, Yang Shi wrote:
> > > > Since v5.13 the page bulk allocator was introduced to allocate order-0
> > > > pages in bulk.  There are a few mempool allocator callers which does
> > > > order-0 page allocation in a loop, for example, dm-crypt, f2fs compress,
> > > > etc.  A mempool page bulk allocator seems useful.  So introduce the
> > > > mempool page bulk allocator.
> > > >
> > > > It introduces the below APIs:
> > > >   - mempool_init_pages_bulk()
> > > >   - mempool_create_pages_bulk()
> > > > They initialize the mempool for page bulk allocator.  The pool is filled
> > > > by alloc_page() in a loop.
> > > >
> > > >   - mempool_alloc_pages_bulk_list()
> > > >   - mempool_alloc_pages_bulk_array()
> > > > They do bulk allocation from mempool.
> > > > They do the below conceptually:
> > > >   1. Call bulk page allocator
> > > >   2. If the allocation is fulfilled then return otherwise try to
> > > >      allocate the remaining pages from the mempool
> > > >   3. If it is fulfilled then return otherwise retry from #1 with sleepable
> > > >      gfp
> > > >   4. If it is still failed, sleep for a while to wait for the mempool is
> > > >      refilled, then retry from #1
> > > > The populated pages will stay on the list or array until the callers
> > > > consume them or free them.
> > > > Since mempool allocator is guaranteed to success in the sleepable context,
> > > > so the two APIs return true for success or false for fail.  It is the
> > > > caller's responsibility to handle failure case (partial allocation), just
> > > > like the page bulk allocator.
> > > >
> > > > The mempool typically is an object agnostic allocator, but bulk allocation
> > > > is only supported by pages, so the mempool bulk allocator is for page
> > > > allocation only as well.
> > > >
> > > > Signed-off-by: Yang Shi <shy828301@gmail.com>
> > > > ---
> > >
> > > Hi Yang,
> > >
> > > I'm not terribly familiar with either component so I'm probably missing
> > > context/details, but just a couple high level thoughts when reading your
> > > patches...
> > >
> > > >  include/linux/mempool.h |  19 ++++
> > > >  mm/mempool.c            | 188 +++++++++++++++++++++++++++++++++++++---
> > > >  2 files changed, 197 insertions(+), 10 deletions(-)
> > > >
> > > ...
> > > > diff --git a/mm/mempool.c b/mm/mempool.c
> > > > index ba32151f3843..7711ca2e6d66 100644
> > > > --- a/mm/mempool.c
> > > > +++ b/mm/mempool.c
> > > > @@ -177,6 +177,7 @@ void mempool_destroy(mempool_t *pool)
> > > >  EXPORT_SYMBOL(mempool_destroy);
> > > >
> > > >  static inline int __mempool_init(mempool_t *pool, int min_nr,
> > > > +                              mempool_alloc_pages_bulk_t *alloc_pages_bulk_fn,
> > > >                                mempool_alloc_t *alloc_fn,
> > > >                                mempool_free_t *free_fn, void *pool_data,
> > > >                                gfp_t gfp_mask, int node_id)
> > > > @@ -186,8 +187,11 @@ static inline int __mempool_init(mempool_t *pool, int min_nr,
> > > >       pool->pool_data = pool_data;
> > > >       pool->alloc     = alloc_fn;
> > > >       pool->free      = free_fn;
> > > > +     pool->alloc_pages_bulk = alloc_pages_bulk_fn;
> > > >       init_waitqueue_head(&pool->wait);
> > > >
> > > > +     WARN_ON_ONCE(alloc_pages_bulk_fn && alloc_fn);
> > > > +
> > > >       pool->elements = kmalloc_array_node(min_nr, sizeof(void *),
> > > >                                           gfp_mask, node_id);
> > > >       if (!pool->elements)
> > > > @@ -199,7 +203,10 @@ static inline int __mempool_init(mempool_t *pool, int min_nr,
> > > >       while (pool->curr_nr < pool->min_nr) {
> > > >               void *element;
> > > >
> > > > -             element = pool->alloc(gfp_mask, pool->pool_data);
> > > > +             if (pool->alloc_pages_bulk)
> > > > +                     element = alloc_page(gfp_mask);
> > >
> > > Any reason to not use the callback from the caller for the bulk variant
> > > here? It looks like some users might expect consistency between the
> > > alloc / free callbacks for the pool. I.e., I'm not familiar with
> > > dm-crypt, but the code modified in the subsequent patches looks like it
> > > keeps an allocated page count. Will that still work with this, assuming
> > > these pages are freed through free_fn?
> >
> > No special reason, this implementation just end up with fewer code
> > otherwise we should need to define a list, and manipulate the list,
> > seems like a little bit overkilling for initialization code.
> >
> > Yes, that allocated page count works, just the pages in the pool are
> > not counted in the count anymore, 256 pages should be not a big deal
> > IMHO.
> >
>
> Ok. I defer to dm-crypt folks on whether/how much it might care about
> pages being hidden from the accounting. My concern was partly that, but
> also partly whether it was possible to break consistency between the
> number of alloc and free callbacks to be expected. For example, wouldn't
> these counters underflow if the mempool is torn down or shrunk (via
> mempool_resize()), and thus the caller gets ->free() callbacks for pages
> it never accounted for in the first place?

For graceful tear down, all the pages should be freed before tear down
IMHO. For mempool resize, it may be possible, but dm-crypt doesn't
resize mempool IIRC. Anyway this counter is driver specific, it could
be inc'ed or dec'ed when the mempool is created or resized.

>
> Brian
>
> > >
> > > > +             else
> > > > +                     element = pool->alloc(gfp_mask, pool->pool_data);
> > > >               if (unlikely(!element)) {
> > > >                       mempool_exit(pool);
> > > >                       return -ENOMEM;
> > > ...
> > > > @@ -457,6 +499,132 @@ void *mempool_alloc(mempool_t *pool, gfp_t gfp_mask)
> > > >  }
> > > >  EXPORT_SYMBOL(mempool_alloc);
> > > >
> > > > +/**
> > > > + * mempool_alloc_pages_bulk - allocate a bulk of pagesfrom a specific
> > > > + *                           memory pool
> > > > + * @pool:       pointer to the memory pool which was allocated via
> > > > + *              mempool_create().
> > > > + * @gfp_mask:   the usual allocation bitmask.
> > > > + * @nr:         the number of requested pages.
> > > > + * @page_list:  the list the pages will be added to.
> > > > + * @page_array: the array the pages will be added to.
> > > > + *
> > > > + * this function only sleeps if the alloc_pages_bulk_fn() function sleeps
> > > > + * or the allocation can not be satisfied even though the mempool is depleted.
> > > > + * Note that due to preallocation, this function *never* fails when called
> > > > + * from process contexts. (it might fail if called from an IRQ context.)
> > > > + * Note: using __GFP_ZERO is not supported.  And the caller should not pass
> > > > + * in both valid page_list and page_array.
> > > > + *
> > > > + * Return: true when nr pages are allocated or false if not.  It is the
> > > > + *         caller's responsibility to free the partial allocated pages.
> > > > + */
> > > > +static bool mempool_alloc_pages_bulk(mempool_t *pool, gfp_t gfp_mask,
> > > > +                                  unsigned int nr,
> > > > +                                  struct list_head *page_list,
> > > > +                                  struct page **page_array)
> > > > +{
> > > > +     unsigned long flags;
> > > > +     wait_queue_entry_t wait;
> > > > +     gfp_t gfp_temp;
> > > > +     int i;
> > > > +     unsigned int ret, nr_remaining;
> > > > +     struct page *page;
> > > > +
> > >
> > > This looks like a lot of duplicate boilerplate from mempool_alloc().
> > > Could this instead do something like: rename the former to
> > > __mempool_alloc() and add a count parameter, implement bulk alloc
> > > support in there for count > 1, then let traditional (i.e., non-bulk)
> > > mempool_alloc() callers pass a count of 1?
> >
> > Thanks for the suggestion. Yeah, the duplicate code is not perfect. I
> > thought about this way too, but it may need to have a lot of "if
> > (count > 0)" of "if (is_bulk_alloc) " if a flag is used in the code to
> > handle the bulk allocation, for example, calculate remaining nr, loop
> > to remove element from the pool, manipulate list or array, etc. Seems
> > not that readable IMHO.
> >
> > We may be able to extract some common code into shared helpers, for
> > example, the gfp sanitization and wait logic.
> >
> > >
> > > Along the same lines, I also wonder if there's any value in generic bulk
> > > alloc support for mempool. For example, I suppose technically this could
> > > be implemented via one change to support a pool->alloc_bulk() callback
> > > that any user could implement via a loop if they wanted
> > > mempool_alloc_bulk() support backed by a preallocated pool. The page
> > > based user could then just use that to call alloc_pages_bulk_*() as an
> > > optimization without the mempool layer needing to know or care about
> > > whether the underlying elements are pages or not. Hm?
> >
> > Thanks for the suggestion. Actually I thought about this too. But the
> > memory space overhead, particularly stack space seems like a
> > showstopper to me. We just can put the pointers into an array, but
> > this may consume a significant amount of stack memory. One pointer is
> > 8 bytes, 256 objects imply 2K stack space. Of course the users could
> > move the array into a dynamic allocated data structure, but this may
> > need the users modify their driver. Bulk kmalloc via kmalloc_array()
> > may be fine, this is the only usercase other than pages I could think
> > of.
> >
> > >
> > > Brian
> > >
> > > > +     VM_WARN_ON_ONCE(gfp_mask & __GFP_ZERO);
> > > > +     might_alloc(gfp_mask);
> > > > +
> > > > +     gfp_mask |= __GFP_NOMEMALLOC;   /* don't allocate emergency reserves */
> > > > +     gfp_mask |= __GFP_NORETRY;      /* don't loop in __alloc_pages */
> > > > +     gfp_mask |= __GFP_NOWARN;       /* failures are OK */
> > > > +
> > > > +     gfp_temp = gfp_mask & ~(__GFP_DIRECT_RECLAIM|__GFP_IO);
> > > > +
> > > > +repeat_alloc:
> > > > +     i = 0;
> > > > +     ret = pool->alloc_pages_bulk(gfp_temp, nr, pool->pool_data, page_list,
> > > > +                                  page_array);
> > > > +
> > > > +     if (ret == nr)
> > > > +             return true;
> > > > +
> > > > +     nr_remaining = nr - ret;
> > > > +
> > > > +     spin_lock_irqsave(&pool->lock, flags);
> > > > +     /* Allocate page from the pool and add to the list or array */
> > > > +     while (pool->curr_nr && (nr_remaining > 0)) {
> > > > +             page = remove_element(pool);
> > > > +             spin_unlock_irqrestore(&pool->lock, flags);
> > > > +             smp_wmb();
> > > > +
> > > > +             kmemleak_update_trace((void *)page);
> > > > +
> > > > +             if (page_list)
> > > > +                     list_add(&page->lru, page_list);
> > > > +             else
> > > > +                     page_array[ret + i] = page;
> > > > +
> > > > +             i++;
> > > > +             nr_remaining--;
> > > > +
> > > > +             spin_lock_irqsave(&pool->lock, flags);
> > > > +     }
> > > > +
> > > > +     spin_unlock_irqrestore(&pool->lock, flags);
> > > > +
> > > > +     if (!nr_remaining)
> > > > +             return true;
> > > > +
> > > > +     /*
> > > > +      * The bulk allocator counts in the populated pages for array,
> > > > +      * but don't do it for list.
> > > > +      */
> > > > +     if (page_list)
> > > > +             nr = nr_remaining;
> > > > +
> > > > +     /*
> > > > +      * We use gfp mask w/o direct reclaim or IO for the first round.  If
> > > > +      * alloc failed with that and @pool was empty, retry immediately.
> > > > +      */
> > > > +     if (gfp_temp != gfp_mask) {
> > > > +             gfp_temp = gfp_mask;
> > > > +             goto repeat_alloc;
> > > > +     }
> > > > +
> > > > +     /* We must not sleep if !__GFP_DIRECT_RECLAIM */
> > > > +     if (!(gfp_mask & __GFP_DIRECT_RECLAIM))
> > > > +             return false;
> > > > +
> > > > +     /* Let's wait for someone else to return an element to @pool */
> > > > +     init_wait(&wait);
> > > > +     prepare_to_wait(&pool->wait, &wait, TASK_UNINTERRUPTIBLE);
> > > > +
> > > > +     /*
> > > > +      * FIXME: this should be io_schedule().  The timeout is there as a
> > > > +      * workaround for some DM problems in 2.6.18.
> > > > +      */
> > > > +     io_schedule_timeout(5*HZ);
> > > > +
> > > > +     finish_wait(&pool->wait, &wait);
> > > > +     goto repeat_alloc;
> > > > +}
> > > > +
> > > > +bool mempool_alloc_pages_bulk_list(mempool_t *pool, gfp_t gfp_mask,
> > > > +                                unsigned int nr,
> > > > +                                struct list_head *page_list)
> > > > +{
> > > > +     return mempool_alloc_pages_bulk(pool, gfp_mask, nr, page_list, NULL);
> > > > +}
> > > > +EXPORT_SYMBOL(mempool_alloc_pages_bulk_list);
> > > > +
> > > > +bool mempool_alloc_pages_bulk_array(mempool_t *pool, gfp_t gfp_mask,
> > > > +                                 unsigned int nr,
> > > > +                                 struct page **page_array)
> > > > +{
> > > > +     return mempool_alloc_pages_bulk(pool, gfp_mask, nr, NULL, page_array);
> > > > +}
> > > > +EXPORT_SYMBOL(mempool_alloc_pages_bulk_array);
> > > > +
> > > >  /**
> > > >   * mempool_free - return an element to the pool.
> > > >   * @element:   pool element pointer.
> > > > --
> > > > 2.26.3
> > > >
> > >
> >
>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

