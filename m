Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A55A14FC916
	for <lists+dm-devel@lfdr.de>; Tue, 12 Apr 2022 02:08:47 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-HhLWCdpqPuS1Tt2Xn4_uNg-1; Mon, 11 Apr 2022 20:08:43 -0400
X-MC-Unique: HhLWCdpqPuS1Tt2Xn4_uNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8250E811E7A;
	Tue, 12 Apr 2022 00:08:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62771400E554;
	Tue, 12 Apr 2022 00:08:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2E1241940373;
	Tue, 12 Apr 2022 00:08:39 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8309B1947BBF
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Apr 2022 00:08:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7099340F4943; Tue, 12 Apr 2022 00:08:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C55540F4941
 for <dm-devel@redhat.com>; Tue, 12 Apr 2022 00:08:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49BFD2A59546
 for <dm-devel@redhat.com>; Tue, 12 Apr 2022 00:08:37 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-KsfLbQ3xNqKjgidVzZhmuA-1; Mon, 11 Apr 2022 20:08:33 -0400
X-MC-Unique: KsfLbQ3xNqKjgidVzZhmuA-1
Received: by mail-pj1-f45.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so896064pjb.4
 for <dm-devel@redhat.com>; Mon, 11 Apr 2022 17:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2wEkt+Fl5QHii5v8XtDT8LMRWz6S8eR3qRxTt2Sw5V4=;
 b=fJrYXeNNiQ28BpMpCIXP5TwJmGjedF9QNbtKHpRewlSy5ltLa0hViOcOVcl1++k8j3
 JhBEsJ6N+BQuAQnHMLb3rgmCzY1RIArtgwysfex/D0mbFnYeq51dYn93TIpcv1+mdjVh
 aVsmZMoBlaiF/Yb8f6rGdCkZ9aeY66BbbojSr7kttcUlj5JADwkqqOu2RuHe3QnDf3lB
 APceXo7hHSOBlrz1W5wIqooxu4SoBxXIq0OqF3dWZCNHk1JsWiUAL4n5yE6H7vF0JxQU
 shu6bepAnouQ3iosGKzR5KCLyZkn59UjiHfi4p7Sm8bwNIKs8wCPTi589uFSCVKcjWoR
 0aaw==
X-Gm-Message-State: AOAM532i3hEi81qVs3+fMu5OAfNm6GPJmE04r0BLJkCnUdhWvGBk6n14
 +v/YZwZrXj1Z6jOoJLkeRKfp2XJPZNue7zW/u8nSPg==
X-Google-Smtp-Source: ABdhPJwiqEMeg1D9j4J0Y+o8ZfMSN8ekDMHy7Zw5j+2VdEX4b8YSMIxWQgkLUtHS84yYy4GAXTgkQnH5MT/1f7wCXo8=
X-Received: by 2002:a17:903:32c5:b0:156:b466:c8ed with SMTP id
 i5-20020a17090332c500b00156b466c8edmr34561265plr.34.1649722112368; Mon, 11
 Apr 2022 17:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220405194747.2386619-1-jane.chu@oracle.com>
 <20220405194747.2386619-5-jane.chu@oracle.com>
In-Reply-To: <20220405194747.2386619-5-jane.chu@oracle.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 11 Apr 2022 17:08:21 -0700
Message-ID: <CAPcyv4ij8VxaeosTsRFgUTnSpRRaxWnxWK6xvUJrhmT-7ae+-Q@mail.gmail.com>
To: Jane Chu <jane.chu@oracle.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH v7 4/6] dax: add DAX_RECOVERY flag and
 .recovery_write dev_pgmap_ops
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Dave Jiang <dave.jiang@intel.com>,
 Mike Snitzer <snitzer@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 X86 ML <x86@kernel.org>, david <david@fromorbit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 device-mapper development <dm-devel@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Vishal L Verma <vishal.l.verma@intel.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, "Weiny,
 Ira" <ira.weiny@intel.com>, linux-xfs <linux-xfs@vger.kernel.org>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 5, 2022 at 12:48 PM Jane Chu <jane.chu@oracle.com> wrote:
>
> Introduce DAX_RECOVERY flag to dax_direct_access(). The flag is
> not set by default in dax_direct_access() such that the helper
> does not translate a pmem range to kernel virtual address if the
> range contains uncorrectable errors.  When the flag is set,
> the helper ignores the UEs and return kernel virtual adderss so
> that the caller may get on with data recovery via write.
>
> Also introduce a new dev_pagemap_ops .recovery_write function.
> The function is applicable to FSDAX device only. The device
> page backend driver provides .recovery_write function if the
> device has underlying mechanism to clear the uncorrectable
> errors on the fly.
>
> Signed-off-by: Jane Chu <jane.chu@oracle.com>
> ---
>  drivers/dax/super.c             | 17 ++++++++--
>  drivers/md/dm-linear.c          |  4 +--
>  drivers/md/dm-log-writes.c      |  5 +--
>  drivers/md/dm-stripe.c          |  4 +--
>  drivers/md/dm-target.c          |  2 +-
>  drivers/md/dm-writecache.c      |  5 +--
>  drivers/md/dm.c                 |  5 +--
>  drivers/nvdimm/pmem.c           | 57 +++++++++++++++++++++++++++------
>  drivers/nvdimm/pmem.h           |  2 +-
>  drivers/s390/block/dcssblk.c    |  4 +--
>  fs/dax.c                        | 24 ++++++++++----
>  fs/fuse/dax.c                   |  4 +--
>  include/linux/dax.h             | 11 +++++--
>  include/linux/device-mapper.h   |  2 +-
>  include/linux/memremap.h        |  7 ++++
>  tools/testing/nvdimm/pmem-dax.c |  2 +-
>  16 files changed, 116 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 0211e6f7b47a..8252858cd25a 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -13,6 +13,7 @@
>  #include <linux/uio.h>
>  #include <linux/dax.h>
>  #include <linux/fs.h>
> +#include <linux/memremap.h>
>  #include "dax-private.h"
>
>  /**
> @@ -117,6 +118,7 @@ enum dax_device_flags {
>   * @dax_dev: a dax_device instance representing the logical memory range
>   * @pgoff: offset in pages from the start of the device to translate
>   * @nr_pages: number of consecutive pages caller can handle relative to @pfn
> + * @flags: by default 0, set to DAX_RECOVERY to kick start dax recovery
>   * @kaddr: output parameter that returns a virtual address mapping of pfn
>   * @pfn: output parameter that returns an absolute pfn translation of @pgoff
>   *
> @@ -124,7 +126,7 @@ enum dax_device_flags {
>   * pages accessible at the device relative @pgoff.
>   */
>  long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
> -               void **kaddr, pfn_t *pfn)
> +               int flags, void **kaddr, pfn_t *pfn)
>  {
>         long avail;
>
> @@ -137,7 +139,7 @@ long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
>         if (nr_pages < 0)
>                 return -EINVAL;
>
> -       avail = dax_dev->ops->direct_access(dax_dev, pgoff, nr_pages,
> +       avail = dax_dev->ops->direct_access(dax_dev, pgoff, nr_pages, flags,
>                         kaddr, pfn);
>         if (!avail)
>                 return -ERANGE;
> @@ -194,6 +196,17 @@ int dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
>  }
>  EXPORT_SYMBOL_GPL(dax_zero_page_range);
>
> +size_t dax_recovery_write(struct dax_device *dax_dev, pgoff_t pgoff,
> +               pfn_t pfn, void *addr, size_t bytes, struct iov_iter *iter)
> +{
> +       struct dev_pagemap *pgmap = get_dev_pagemap(pfn_t_to_pfn(pfn), NULL);
> +
> +       if (!pgmap || !pgmap->ops || !pgmap->ops->recovery_write)
> +               return 0;
> +       return pgmap->ops->recovery_write(pgmap, pgoff, addr, bytes, iter);
> +}
> +EXPORT_SYMBOL_GPL(dax_recovery_write);
> +
>  #ifdef CONFIG_ARCH_HAS_PMEM_API
>  void arch_wb_cache_pmem(void *addr, size_t size);
>  void dax_flush(struct dax_device *dax_dev, void *addr, size_t size)
> diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
> index 76b486e4d2be..9e6d8bdf3b2a 100644
> --- a/drivers/md/dm-linear.c
> +++ b/drivers/md/dm-linear.c
> @@ -172,11 +172,11 @@ static struct dax_device *linear_dax_pgoff(struct dm_target *ti, pgoff_t *pgoff)
>  }
>
>  static long linear_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
> -               long nr_pages, void **kaddr, pfn_t *pfn)
> +               long nr_pages, int flags, void **kaddr, pfn_t *pfn)
>  {
>         struct dax_device *dax_dev = linear_dax_pgoff(ti, &pgoff);
>
> -       return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
> +       return dax_direct_access(dax_dev, pgoff, nr_pages, flags, kaddr, pfn);
>  }
>
>  static int linear_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
> diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
> index c9d036d6bb2e..e23f062ade5f 100644
> --- a/drivers/md/dm-log-writes.c
> +++ b/drivers/md/dm-log-writes.c
> @@ -889,11 +889,12 @@ static struct dax_device *log_writes_dax_pgoff(struct dm_target *ti,
>  }
>
>  static long log_writes_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
> -                                        long nr_pages, void **kaddr, pfn_t *pfn)
> +                                        long nr_pages, int flags,
> +                                        void **kaddr, pfn_t *pfn)
>  {
>         struct dax_device *dax_dev = log_writes_dax_pgoff(ti, &pgoff);
>
> -       return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
> +       return dax_direct_access(dax_dev, pgoff, nr_pages, flags, kaddr, pfn);
>  }
>
>  static int log_writes_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
> diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
> index c81d331d1afe..b89339c78702 100644
> --- a/drivers/md/dm-stripe.c
> +++ b/drivers/md/dm-stripe.c
> @@ -315,11 +315,11 @@ static struct dax_device *stripe_dax_pgoff(struct dm_target *ti, pgoff_t *pgoff)
>  }
>
>  static long stripe_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
> -               long nr_pages, void **kaddr, pfn_t *pfn)
> +               long nr_pages, int flags, void **kaddr, pfn_t *pfn)
>  {
>         struct dax_device *dax_dev = stripe_dax_pgoff(ti, &pgoff);
>
> -       return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
> +       return dax_direct_access(dax_dev, pgoff, nr_pages, flags, kaddr, pfn);
>  }
>
>  static int stripe_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
> diff --git a/drivers/md/dm-target.c b/drivers/md/dm-target.c
> index 64dd0b34fcf4..24b1e5628f3a 100644
> --- a/drivers/md/dm-target.c
> +++ b/drivers/md/dm-target.c
> @@ -142,7 +142,7 @@ static void io_err_release_clone_rq(struct request *clone,
>  }
>
>  static long io_err_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
> -               long nr_pages, void **kaddr, pfn_t *pfn)
> +               long nr_pages, int flags, void **kaddr, pfn_t *pfn)
>  {
>         return -EIO;
>  }
> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
> index 5630b470ba42..180ca8fa383e 100644
> --- a/drivers/md/dm-writecache.c
> +++ b/drivers/md/dm-writecache.c
> @@ -286,7 +286,8 @@ static int persistent_memory_claim(struct dm_writecache *wc)
>
>         id = dax_read_lock();
>
> -       da = dax_direct_access(wc->ssd_dev->dax_dev, offset, p, &wc->memory_map, &pfn);
> +       da = dax_direct_access(wc->ssd_dev->dax_dev, offset, p, 0,
> +                       &wc->memory_map, &pfn);
>         if (da < 0) {
>                 wc->memory_map = NULL;
>                 r = da;
> @@ -309,7 +310,7 @@ static int persistent_memory_claim(struct dm_writecache *wc)
>                 do {
>                         long daa;
>                         daa = dax_direct_access(wc->ssd_dev->dax_dev, offset + i, p - i,
> -                                               NULL, &pfn);
> +                                               0, NULL, &pfn);
>                         if (daa <= 0) {
>                                 r = daa ? daa : -EINVAL;
>                                 goto err3;
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index ad2e0bbeb559..a8c697bb6603 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1087,7 +1087,8 @@ static struct dm_target *dm_dax_get_live_target(struct mapped_device *md,
>  }
>
>  static long dm_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
> -                                long nr_pages, void **kaddr, pfn_t *pfn)
> +                                long nr_pages, int flags, void **kaddr,
> +                                pfn_t *pfn)
>  {
>         struct mapped_device *md = dax_get_private(dax_dev);
>         sector_t sector = pgoff * PAGE_SECTORS;
> @@ -1105,7 +1106,7 @@ static long dm_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
>         if (len < 1)
>                 goto out;
>         nr_pages = min(len, nr_pages);
> -       ret = ti->type->direct_access(ti, pgoff, nr_pages, kaddr, pfn);
> +       ret = ti->type->direct_access(ti, pgoff, nr_pages, flags, kaddr, pfn);
>
>   out:
>         dm_put_live_table(md, srcu_idx);
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 30c71a68175b..0400c5a7ba39 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -238,12 +238,23 @@ static int pmem_rw_page(struct block_device *bdev, sector_t sector,
>
>  /* see "strong" declaration in tools/testing/nvdimm/pmem-dax.c */
>  __weak long __pmem_direct_access(struct pmem_device *pmem, pgoff_t pgoff,
> -               long nr_pages, void **kaddr, pfn_t *pfn)
> +               long nr_pages, int flags, void **kaddr, pfn_t *pfn)
>  {
>         resource_size_t offset = PFN_PHYS(pgoff) + pmem->data_offset;
> +       sector_t sector = PFN_PHYS(pgoff) >> SECTOR_SHIFT;
> +       unsigned int num = PFN_PHYS(nr_pages) >> SECTOR_SHIFT;
> +       struct badblocks *bb = &pmem->bb;
> +       sector_t first_bad;
> +       int num_bad;
> +       bool bad_in_range;
> +       long actual_nr;
> +
> +       if (!bb->count)
> +               bad_in_range = false;
> +       else
> +               bad_in_range = !!badblocks_check(bb, sector, num, &first_bad, &num_bad);

Why all this change...

>
> -       if (unlikely(is_bad_pmem(&pmem->bb, PFN_PHYS(pgoff) / 512,
> -                                       PFN_PHYS(nr_pages))))

...instead of adding "&& !(flags & DAX_RECOVERY)" to this statement?

> +       if (bad_in_range && !(flags & DAX_RECOVERY))
>                 return -EIO;
>
>         if (kaddr)
> @@ -251,13 +262,26 @@ __weak long __pmem_direct_access(struct pmem_device *pmem, pgoff_t pgoff,
>         if (pfn)
>                 *pfn = phys_to_pfn_t(pmem->phys_addr + offset, pmem->pfn_flags);
>
> +       if (!bad_in_range) {
> +               /*
> +                * If badblock is present but not in the range, limit known good range
> +                * to the requested range.
> +                */
> +               if (bb->count)
> +                       return nr_pages;
> +               return PHYS_PFN(pmem->size - pmem->pfn_pad - offset);
> +       }
> +
>         /*
> -        * If badblocks are present, limit known good range to the
> -        * requested range.
> +        * In case poison is found in the given range and DAX_RECOVERY flag is set,
> +        * recovery stride is set to kernel page size because the underlying driver and
> +        * firmware clear poison functions don't appear to handle large chunk (such as
> +        * 2MiB) reliably.
>          */
> -       if (unlikely(pmem->bb.count))
> -               return nr_pages;
> -       return PHYS_PFN(pmem->size - pmem->pfn_pad - offset);
> +       actual_nr = PHYS_PFN(PAGE_ALIGN((first_bad - sector) << SECTOR_SHIFT));
> +       dev_dbg(pmem->bb.dev, "start sector(%llu), nr_pages(%ld), first_bad(%llu), actual_nr(%ld)\n",
> +                       sector, nr_pages, first_bad, actual_nr);
> +       return (actual_nr == 0) ? 1 : actual_nr;

Similar feedback as above that this is more change than I would expect.

I think just adding...

if (flags & DAX_RECOVERY)
   return 1;

...before the typical return path is enough.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

