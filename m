Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8113A92AE
	for <lists+dm-devel@lfdr.de>; Wed, 16 Jun 2021 08:32:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-rcVTKqqjNc22J_TB4iHeLw-1; Wed, 16 Jun 2021 02:31:38 -0400
X-MC-Unique: rcVTKqqjNc22J_TB4iHeLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B477100C662;
	Wed, 16 Jun 2021 06:31:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16B855D9E2;
	Wed, 16 Jun 2021 06:31:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EBB01809CAD;
	Wed, 16 Jun 2021 06:31:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15G6V9Mc027169 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Jun 2021 02:31:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D72C103799; Wed, 16 Jun 2021 06:31:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 551901037A2
	for <dm-devel@redhat.com>; Wed, 16 Jun 2021 06:31:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49A08101D230
	for <dm-devel@redhat.com>; Wed, 16 Jun 2021 06:31:05 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-147-Zo_6H_TCOEOxFxmTNx40oA-1; Wed, 16 Jun 2021 02:31:03 -0400
X-MC-Unique: Zo_6H_TCOEOxFxmTNx40oA-1
Received: by mail-pg1-f172.google.com with SMTP id m2so1136456pgk.7
	for <dm-devel@redhat.com>; Tue, 15 Jun 2021 23:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wnVJHvXzTfMwZnd+sO8L8PW13B3KOws+XHBcdC/4riM=;
	b=WjhgeHJ4oeHqeEZBm0ajUqj1xkDFMV5vWOX0jcLtSOjwIdXG/vaLRvb2NzKjT6yjkG
	6Pfcxu14LM3H5FT58i35RRvQ9aIavog+XtSAKrbDF+4OWEnj0KTxf/KgTLdm8S2IeEo4
	tkqmtn4CtEtaJ1O3K2qtTcc/L4OF1zaqZSeJNK3OdBe3W5E+ek1B3FO7Za5n5ehBhi4e
	hyd4KMz2LHbhdtDB/0jfJKoq5Wd7rXLPA6xHPGsWcPL9zBTsJKeTQ/Qnww2Xo0HcS0A1
	K0LfXwiO6hPp+4Y4YrXNsPDo4sXV6bybe5JjsbUvmEuRFsNBf/+N7vOrMZjINVe0ldlr
	GSsA==
X-Gm-Message-State: AOAM533y3PbGjC+vAnqaRB4aP+nksuH9qZsMKwtLFgZYsfnosxGxcRv+
	sTEWnnHT7MsBTHzC9nSGk9HP95lIr47xrn9fngZ3gg==
X-Google-Smtp-Source: ABdhPJxEr9gf18Cdhk1f8EhTHILp6osP6kHcu589GdH0NbQQbUNIN5WvGkClnb9HbcroXzcqyZCUY4XCXkw4wpHlRvc=
X-Received: by 2002:a63:5c4a:: with SMTP id n10mr3477810pgm.279.1623825061741; 
	Tue, 15 Jun 2021 23:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210604011844.1756145-1-ruansy.fnst@fujitsu.com>
	<20210604011844.1756145-5-ruansy.fnst@fujitsu.com>
In-Reply-To: <20210604011844.1756145-5-ruansy.fnst@fujitsu.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 15 Jun 2021 23:30:51 -0700
Message-ID: <CAPcyv4iEuPWs-f+rV=xncbXYKSHkbhuLJ-1hnP9N9ABNzr1VSA@mail.gmail.com>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Mike Snitzer <snitzer@redhat.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Goldwyn Rodrigues <rgoldwyn@suse.de>, david <david@fromorbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v4 04/10] mm,
 fsdax: Refactor memory-failure handler for dax mapping
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

[ drop old nvdimm list, add the new one ]

On Thu, Jun 3, 2021 at 6:19 PM Shiyang Ruan <ruansy.fnst@fujitsu.com> wrote:
>
> The current memory_failure_dev_pagemap() can only handle single-mapped
> dax page for fsdax mode.  The dax page could be mapped by multiple files
> and offsets if we let reflink feature & fsdax mode work together.  So,
> we refactor current implementation to support handle memory failure on
> each file and offset.

I don't understand this organization, perhaps because this patch
introduces mf_dax_kill_procs() without a user. However, my expectation
is that memory_failure() is mostly untouched save for an early check
via pgmap->notify_memory_failure(). If pgmap->notify_memory_failure()
indicates that the memory failure was handled by the pgmap->owner /
dax_dev holder stack, then the typical memory failure path is
short-circuited. Otherwise, for non-reflink filesystems where
page->mapping() is valid the legacy / existing memory_failure()
operates as it does currently. If reflink capable filesystems want to
share a common implementation to map pfns to files they can, but I
don't think that common code belongs in mm/memory-failure.c.

>
> Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
> ---
>  fs/dax.c            |  21 ++++++++
>  include/linux/dax.h |   1 +
>  include/linux/mm.h  |   9 ++++
>  mm/memory-failure.c | 114 ++++++++++++++++++++++++++++----------------
>  4 files changed, 105 insertions(+), 40 deletions(-)
>
> diff --git a/fs/dax.c b/fs/dax.c
> index 62352cbcf0f4..58faca85455a 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -389,6 +389,27 @@ static struct page *dax_busy_page(void *entry)
>         return NULL;
>  }
>
> +/*
> + * dax_load_pfn - Load pfn of the DAX entry corresponding to a page
> + * @mapping: The file whose entry we want to load
> + * @index:   The offset where the DAX entry located in
> + *
> + * Return:   pfn of the DAX entry
> + */
> +unsigned long dax_load_pfn(struct address_space *mapping, unsigned long index)
> +{
> +       XA_STATE(xas, &mapping->i_pages, index);
> +       void *entry;
> +       unsigned long pfn;
> +
> +       xas_lock_irq(&xas);
> +       entry = xas_load(&xas);
> +       pfn = dax_to_pfn(entry);
> +       xas_unlock_irq(&xas);

This looks racy, what happened to the locking afforded by dax_lock_page()?

> +
> +       return pfn;
> +}
> +
>  /*
>   * dax_lock_mapping_entry - Lock the DAX entry corresponding to a page
>   * @page: The page whose entry we want to lock
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index 1ce343a960ab..6e758daa5004 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -158,6 +158,7 @@ int dax_writeback_mapping_range(struct address_space *mapping,
>
>  struct page *dax_layout_busy_page(struct address_space *mapping);
>  struct page *dax_layout_busy_page_range(struct address_space *mapping, loff_t start, loff_t end);
> +unsigned long dax_load_pfn(struct address_space *mapping, unsigned long index);
>  dax_entry_t dax_lock_page(struct page *page);
>  void dax_unlock_page(struct page *page, dax_entry_t cookie);
>  #else
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c274f75efcf9..2b7527e93c77 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1187,6 +1187,14 @@ static inline bool is_device_private_page(const struct page *page)
>                 page->pgmap->type == MEMORY_DEVICE_PRIVATE;
>  }
>
> +static inline bool is_device_fsdax_page(const struct page *page)
> +{
> +       return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> +               IS_ENABLED(CONFIG_FS_DAX) &&
> +               is_zone_device_page(page) &&
> +               page->pgmap->type == MEMORY_DEVICE_FS_DAX;

Why is this necessary? The dax_dev holder is the one that knows the
nature of the pfn. The common memory_failure() code should not care
about fsdax vs devdax.

> +}
> +
>  static inline bool is_pci_p2pdma_page(const struct page *page)
>  {
>         return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> @@ -3078,6 +3086,7 @@ enum mf_flags {
>         MF_MUST_KILL = 1 << 2,
>         MF_SOFT_OFFLINE = 1 << 3,
>  };
> +int mf_dax_kill_procs(struct address_space *mapping, pgoff_t index, int flags);
>  extern int memory_failure(unsigned long pfn, int flags);
>  extern void memory_failure_queue(unsigned long pfn, int flags);
>  extern void memory_failure_queue_kick(int cpu);
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 85ad98c00fd9..4377e727d478 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -56,6 +56,7 @@
>  #include <linux/kfifo.h>
>  #include <linux/ratelimit.h>
>  #include <linux/page-isolation.h>
> +#include <linux/dax.h>
>  #include "internal.h"
>  #include "ras/ras_event.h"
>
> @@ -120,6 +121,13 @@ static int hwpoison_filter_dev(struct page *p)
>         if (PageSlab(p))
>                 return -EINVAL;
>
> +       if (pfn_valid(page_to_pfn(p))) {
> +               if (is_device_fsdax_page(p))

This is racy unless the page is pinned. Also, not clear why this is needed?

> +                       return 0;
> +               else
> +                       return -EINVAL;
> +       }
> +
>         mapping = page_mapping(p);
>         if (mapping == NULL || mapping->host == NULL)
>                 return -EINVAL;
> @@ -290,10 +298,9 @@ void shake_page(struct page *p, int access)
>  }
>  EXPORT_SYMBOL_GPL(shake_page);
>
> -static unsigned long dev_pagemap_mapping_shift(struct page *page,
> -               struct vm_area_struct *vma)
> +static unsigned long dev_pagemap_mapping_shift(struct vm_area_struct *vma,
> +                                              unsigned long address)
>  {
> -       unsigned long address = vma_address(page, vma);
>         pgd_t *pgd;
>         p4d_t *p4d;
>         pud_t *pud;
> @@ -333,9 +340,8 @@ static unsigned long dev_pagemap_mapping_shift(struct page *page,
>   * Schedule a process for later kill.
>   * Uses GFP_ATOMIC allocations to avoid potential recursions in the VM.
>   */
> -static void add_to_kill(struct task_struct *tsk, struct page *p,
> -                      struct vm_area_struct *vma,
> -                      struct list_head *to_kill)
> +static void add_to_kill(struct task_struct *tsk, struct page *p, pgoff_t pgoff,
> +                       struct vm_area_struct *vma, struct list_head *to_kill)
>  {
>         struct to_kill *tk;
>
> @@ -346,9 +352,12 @@ static void add_to_kill(struct task_struct *tsk, struct page *p,
>         }
>
>         tk->addr = page_address_in_vma(p, vma);
> -       if (is_zone_device_page(p))
> -               tk->size_shift = dev_pagemap_mapping_shift(p, vma);
> -       else
> +       if (is_zone_device_page(p)) {
> +               if (is_device_fsdax_page(p))
> +                       tk->addr = vma->vm_start +
> +                                       ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
> +               tk->size_shift = dev_pagemap_mapping_shift(vma, tk->addr);

What was wrong with the original code?

> +       } else
>                 tk->size_shift = page_shift(compound_head(p));
>
>         /*
> @@ -496,7 +505,7 @@ static void collect_procs_anon(struct page *page, struct list_head *to_kill,
>                         if (!page_mapped_in_vma(page, vma))
>                                 continue;
>                         if (vma->vm_mm == t->mm)
> -                               add_to_kill(t, page, vma, to_kill);
> +                               add_to_kill(t, page, 0, vma, to_kill);
>                 }
>         }
>         read_unlock(&tasklist_lock);
> @@ -506,24 +515,19 @@ static void collect_procs_anon(struct page *page, struct list_head *to_kill,
>  /*
>   * Collect processes when the error hit a file mapped page.
>   */
> -static void collect_procs_file(struct page *page, struct list_head *to_kill,
> -                               int force_early)
> +static void collect_procs_file(struct page *page, struct address_space *mapping,
> +               pgoff_t pgoff, struct list_head *to_kill, int force_early)
>  {

collect_procs() and kill_procs() are the only core memory_failure()
helpers I expect would be exported for a fileystem dax_dev holder to
call when it is trying to cleanup a memory_failure() on a reflink'd
mapping.

>         struct vm_area_struct *vma;
>         struct task_struct *tsk;
> -       struct address_space *mapping = page->mapping;
> -       pgoff_t pgoff;
>
>         i_mmap_lock_read(mapping);
>         read_lock(&tasklist_lock);
> -       pgoff = page_to_pgoff(page);
>         for_each_process(tsk) {
>                 struct task_struct *t = task_early_kill(tsk, force_early);
> -
>                 if (!t)
>                         continue;
> -               vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff,
> -                                     pgoff) {
> +               vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
>                         /*
>                          * Send early kill signal to tasks where a vma covers
>                          * the page but the corrupted page is not necessarily
> @@ -532,7 +536,7 @@ static void collect_procs_file(struct page *page, struct list_head *to_kill,
>                          * to be informed of all such data corruptions.
>                          */
>                         if (vma->vm_mm == t->mm)
> -                               add_to_kill(t, page, vma, to_kill);
> +                               add_to_kill(t, page, pgoff, vma, to_kill);
>                 }
>         }
>         read_unlock(&tasklist_lock);
> @@ -551,7 +555,8 @@ static void collect_procs(struct page *page, struct list_head *tokill,
>         if (PageAnon(page))
>                 collect_procs_anon(page, tokill, force_early);
>         else
> -               collect_procs_file(page, tokill, force_early);
> +               collect_procs_file(page, page_mapping(page), page_to_pgoff(page),
> +                                  tokill, force_early);
>  }
>
>  static const char *action_name[] = {
> @@ -1218,6 +1223,51 @@ static int try_to_split_thp_page(struct page *page, const char *msg)
>         return 0;
>  }
>
> +static void unmap_and_kill(struct list_head *to_kill, unsigned long pfn,
> +               struct address_space *mapping, pgoff_t index, int flags)
> +{
> +       struct to_kill *tk;
> +       unsigned long size = 0;
> +       loff_t start;
> +
> +       list_for_each_entry(tk, to_kill, nd)
> +               if (tk->size_shift)
> +                       size = max(size, 1UL << tk->size_shift);
> +       if (size) {
> +               /*
> +                * Unmap the largest mapping to avoid breaking up
> +                * device-dax mappings which are constant size. The
> +                * actual size of the mapping being torn down is
> +                * communicated in siginfo, see kill_proc()
> +                */
> +               start = (index << PAGE_SHIFT) & ~(size - 1);
> +               unmap_mapping_range(mapping, start, size, 0);
> +       }
> +
> +       kill_procs(to_kill, flags & MF_MUST_KILL, false, pfn, flags);
> +}
> +
> +int mf_dax_kill_procs(struct address_space *mapping, pgoff_t index, int flags)
> +{
> +       LIST_HEAD(to_kill);
> +       /* load the pfn of the dax mapping file */
> +       unsigned long pfn = dax_load_pfn(mapping, index);
> +
> +       /*
> +        * Unlike System-RAM there is no possibility to swap in a
> +        * different physical page at a given virtual address, so all
> +        * userspace consumption of ZONE_DEVICE memory necessitates
> +        * SIGBUS (i.e. MF_MUST_KILL)
> +        */
> +       flags |= MF_ACTION_REQUIRED | MF_MUST_KILL;
> +       collect_procs_file(pfn_to_page(pfn), mapping, index, &to_kill,
> +                          flags & MF_ACTION_REQUIRED);
> +
> +       unmap_and_kill(&to_kill, pfn, mapping, index, flags);
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(mf_dax_kill_procs);
> +
>  static int memory_failure_hugetlb(unsigned long pfn, int flags)
>  {
>         struct page *p = pfn_to_page(pfn);
> @@ -1298,12 +1348,8 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
>                 struct dev_pagemap *pgmap)
>  {
>         struct page *page = pfn_to_page(pfn);
> -       const bool unmap_success = true;
> -       unsigned long size = 0;
> -       struct to_kill *tk;
> -       LIST_HEAD(tokill);
> +       LIST_HEAD(to_kill);
>         int rc = -EBUSY;
> -       loff_t start;
>         dax_entry_t cookie;
>
>         if (flags & MF_COUNT_INCREASED)
> @@ -1355,22 +1401,10 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
>          * SIGBUS (i.e. MF_MUST_KILL)
>          */
>         flags |= MF_ACTION_REQUIRED | MF_MUST_KILL;
> -       collect_procs(page, &tokill, flags & MF_ACTION_REQUIRED);
> +       collect_procs_file(page, page->mapping, page->index, &to_kill,
> +                          flags & MF_ACTION_REQUIRED);
>
> -       list_for_each_entry(tk, &tokill, nd)
> -               if (tk->size_shift)
> -                       size = max(size, 1UL << tk->size_shift);
> -       if (size) {
> -               /*
> -                * Unmap the largest mapping to avoid breaking up
> -                * device-dax mappings which are constant size. The
> -                * actual size of the mapping being torn down is
> -                * communicated in siginfo, see kill_proc()
> -                */
> -               start = (page->index << PAGE_SHIFT) & ~(size - 1);
> -               unmap_mapping_range(page->mapping, start, size, 0);
> -       }
> -       kill_procs(&tokill, flags & MF_MUST_KILL, !unmap_success, pfn, flags);
> +       unmap_and_kill(&to_kill, pfn, page->mapping, page->index, flags);

There's just too much change in this patch and not enough
justification of what is being refactored and why.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

