Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 883E03A931F
	for <lists+dm-devel@lfdr.de>; Wed, 16 Jun 2021 08:50:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-Sr2FmgDSPnKdiBvG1mAfNg-1; Wed, 16 Jun 2021 02:50:35 -0400
X-MC-Unique: Sr2FmgDSPnKdiBvG1mAfNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DB6710C1ADC;
	Wed, 16 Jun 2021 06:50:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E06E810016FE;
	Wed, 16 Jun 2021 06:50:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C0ED1809CAD;
	Wed, 16 Jun 2021 06:50:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15G6oFsh028074 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Jun 2021 02:50:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BF3D1054574; Wed, 16 Jun 2021 06:50:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 574C310545AE
	for <dm-devel@redhat.com>; Wed, 16 Jun 2021 06:50:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12201196F582
	for <dm-devel@redhat.com>; Wed, 16 Jun 2021 06:50:13 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-433-NNOnOvBqPmKyAxujoAz6iw-1; Wed, 16 Jun 2021 02:50:09 -0400
X-MC-Unique: NNOnOvBqPmKyAxujoAz6iw-1
Received: by mail-pl1-f176.google.com with SMTP id 69so625112plc.5
	for <dm-devel@redhat.com>; Tue, 15 Jun 2021 23:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+Kn3PBZvfdrm3M++IQCcW4SjJvH/DG1JZP1myaOpJRg=;
	b=h2T1/Kz2g/KJ5n0BMvsXYzCEgLJ49YNfZ3ZQxtRnWuohuv8W0TnD4KCHSbuVCHVftk
	aPBr7AIDjt/+fqHgWEEXAXRyb0D1hvFbHPPmM2jZG7IEMO1N0dT84wzN/1eq7HgVY2ZV
	cyjNwRJ/FyPq8N5azUtTn7X1mG1klOvJVqg5Ybidh0+TKG5W7opBGmD8Rk6BUQE162Ob
	jZ/J97bfzUyDVoSCHSiziTvF8fRxlMJptwoP3qfdfGa6IrGH7Da7prxfTFZUSQlBsqA/
	C1qNlAau+8oGI0mKeHMzavOicqJVhtfruY3Iaec08Od2/L/b3xLG5d+yeBPX589zn8Ee
	Vd8A==
X-Gm-Message-State: AOAM530zskUnKVOIDClkE//rLHelzWwkz/SjPbVy0b+OljNoUhKA8f8Y
	uI7+osagIL1b9mR4ghQkbWzBomNtANJs4Q8xyzzI0A==
X-Google-Smtp-Source: ABdhPJyQRs1D11qRe1LliJmjI3lSiLNlJfJSax7U3r7FSVTrVSQxBNBqbhHBO+w23FsmYdODe6G8Ue0jGeGbsigANto=
X-Received: by 2002:a17:902:b497:b029:115:e287:7b55 with SMTP id
	y23-20020a170902b497b0290115e2877b55mr7677048plr.79.1623826208688;
	Tue, 15 Jun 2021 23:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210604011844.1756145-1-ruansy.fnst@fujitsu.com>
	<20210604011844.1756145-6-ruansy.fnst@fujitsu.com>
In-Reply-To: <20210604011844.1756145-6-ruansy.fnst@fujitsu.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 15 Jun 2021 23:49:57 -0700
Message-ID: <CAPcyv4heVL+9T3R8dTRw7yaFsL65MXN2qbuqFnO4G2fHMFgYiA@mail.gmail.com>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Mike Snitzer <snitzer@redhat.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Goldwyn Rodrigues <rgoldwyn@suse.de>, david <david@fromorbit.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v4 05/10] mm,
	pmem: Implement ->memory_failure() in pmem driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 3, 2021 at 6:19 PM Shiyang Ruan <ruansy.fnst@fujitsu.com> wrote:
>
> Call the ->memory_failure() which is implemented by pmem driver, in
> order to finally notify filesystem to handle the corrupted data.  The
> handler which collects and kills processes are moved into
> mf_dax_kill_procs(), which will be called by filesystem.
>
> Keep the old handler in order to roll back if driver or filesystem
> does not support ->memory_failure()/->corrupted_range().
>
> Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
> ---
>  block/genhd.c         | 30 ++++++++++++++++++
>  drivers/nvdimm/pmem.c | 14 +++++++++
>  include/linux/genhd.h |  1 +
>  mm/memory-failure.c   | 71 +++++++++++++++++++++++++++----------------

I would not expect a patch that converts the pmem driver to touch
mm/memory-failure.c. mf_generic_kill_procs() has nothing to do with
the pmem driver.

>  4 files changed, 90 insertions(+), 26 deletions(-)
>
> diff --git a/block/genhd.c b/block/genhd.c
> index 9f8cb7beaad1..75834bd057df 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -718,6 +718,36 @@ struct block_device *bdget_disk(struct gendisk *disk, int partno)
>         return bdev;
>  }
>
> +/**
> + * bdget_disk_sector - get block device by given sector number
> + * @disk: gendisk of interest
> + * @sector: sector number
> + *
> + * RETURNS: the found block device where sector locates in
> + */
> +struct block_device *bdget_disk_sector(struct gendisk *disk, sector_t sector)
> +{
> +       struct block_device *part = NULL, *p;
> +       unsigned long idx;
> +
> +       rcu_read_lock();
> +       xa_for_each(&disk->part_tbl, idx, p) {
> +               if (p->bd_partno == 0)
> +                       continue;
> +               if (p->bd_start_sect <= sector &&
> +                       sector < p->bd_start_sect + bdev_nr_sectors(p)) {
> +                       part = p;
> +                       break;
> +               }
> +       }
> +       rcu_read_unlock();
> +       if (!part)
> +               part = disk->part0;
> +
> +       return bdget_disk(disk, part->bd_partno);
> +}
> +EXPORT_SYMBOL(bdget_disk_sector);

I can't see any justification for this function. The pmem driver does
not need it and the upper layer holders should have their own
mechanism to go from dax_dev offset to bdev if they need to, but
hopefully they don't. A dax_device failure should be independent of a
block_device failure.

> +
>  /*
>   * print a full list of all partitions - intended for places where the root
>   * filesystem can't be mounted and thus to give the victim some idea of what
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index ed10a8b66068..98349e7d0a28 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -364,9 +364,23 @@ static void pmem_release_disk(void *__pmem)
>         put_disk(pmem->disk);
>  }
>
> +static int pmem_pagemap_memory_failure(struct dev_pagemap *pgmap,
> +               unsigned long pfn, int flags)
> +{
> +       struct pmem_device *pdev =
> +                       container_of(pgmap, struct pmem_device, pgmap);

This local variable is called @pmem not @pdev in other parts of the driver.

> +       loff_t offset = PFN_PHYS(pfn) - pdev->phys_addr - pdev->data_offset;
> +       struct block_device *bdev =
> +                       bdget_disk_sector(pdev->disk, offset >> SECTOR_SHIFT);
> +
> +       return dax_corrupted_range(pdev->dax_dev, bdev, offset,
> +                                  page_size(pfn_to_page(pfn)), &flags);

Per previous comments this interface should be range based. Why is the
last argument &flags? That was passed in by value so any changes to it
will not be reflected back to memory_failure()?

> +}
> +
>  static const struct dev_pagemap_ops fsdax_pagemap_ops = {
>         .kill                   = pmem_pagemap_kill,
>         .cleanup                = pmem_pagemap_cleanup,
> +       .memory_failure         = pmem_pagemap_memory_failure,
>  };
>
>  static int pmem_attach_disk(struct device *dev,
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 6fc26f7bdf71..2ad70c02c343 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -219,6 +219,7 @@ static inline void add_disk_no_queue_reg(struct gendisk *disk)
>
>  extern void del_gendisk(struct gendisk *gp);
>  extern struct block_device *bdget_disk(struct gendisk *disk, int partno);
> +extern struct block_device *bdget_disk_sector(struct gendisk *disk, sector_t sector);
>
>  void set_disk_ro(struct gendisk *disk, bool read_only);
>
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 4377e727d478..43017d7f3918 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -1247,6 +1247,36 @@ static void unmap_and_kill(struct list_head *to_kill, unsigned long pfn,
>         kill_procs(to_kill, flags & MF_MUST_KILL, false, pfn, flags);
>  }
>
> +static int mf_generic_kill_procs(unsigned long long pfn, int flags)
> +{
> +       struct page *page = pfn_to_page(pfn);
> +       LIST_HEAD(to_kill);
> +       dax_entry_t cookie;
> +
> +       /*
> +        * Prevent the inode from being freed while we are interrogating
> +        * the address_space, typically this would be handled by
> +        * lock_page(), but dax pages do not use the page lock. This
> +        * also prevents changes to the mapping of this pfn until
> +        * poison signaling is complete.
> +        */
> +       cookie = dax_lock_page(page);
> +       if (!cookie)
> +               return -EBUSY;
> +       /*
> +        * Unlike System-RAM there is no possibility to swap in a
> +        * different physical page at a given virtual address, so all
> +        * userspace consumption of ZONE_DEVICE memory necessitates
> +        * SIGBUS (i.e. MF_MUST_KILL)
> +        */
> +       flags |= MF_ACTION_REQUIRED | MF_MUST_KILL;
> +       collect_procs(page, &to_kill, flags & MF_ACTION_REQUIRED);
> +
> +       unmap_and_kill(&to_kill, pfn, page->mapping, page->index, flags);
> +       dax_unlock_page(page, cookie);
> +       return 0;
> +}
> +

Per above, I am surprised to find this in this patch, it belong in its
own patch if at all.

>  int mf_dax_kill_procs(struct address_space *mapping, pgoff_t index, int flags)
>  {
>         LIST_HEAD(to_kill);
> @@ -1348,9 +1378,7 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
>                 struct dev_pagemap *pgmap)
>  {
>         struct page *page = pfn_to_page(pfn);
> -       LIST_HEAD(to_kill);
>         int rc = -EBUSY;
> -       dax_entry_t cookie;
>
>         if (flags & MF_COUNT_INCREASED)
>                 /*
> @@ -1364,20 +1392,9 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
>                 goto out;
>         }
>
> -       /*
> -        * Prevent the inode from being freed while we are interrogating
> -        * the address_space, typically this would be handled by
> -        * lock_page(), but dax pages do not use the page lock. This
> -        * also prevents changes to the mapping of this pfn until
> -        * poison signaling is complete.
> -        */
> -       cookie = dax_lock_page(page);
> -       if (!cookie)
> -               goto out;
> -
>         if (hwpoison_filter(page)) {
>                 rc = 0;
> -               goto unlock;
> +               goto out;
>         }
>
>         if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
> @@ -1385,7 +1402,7 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
>                  * TODO: Handle HMM pages which may need coordination
>                  * with device-side memory.
>                  */
> -               goto unlock;
> +               goto out;
>         }
>
>         /*
> @@ -1395,19 +1412,21 @@ static int memory_failure_dev_pagemap(unsigned long pfn, int flags,
>         SetPageHWPoison(page);
>
>         /*
> -        * Unlike System-RAM there is no possibility to swap in a
> -        * different physical page at a given virtual address, so all
> -        * userspace consumption of ZONE_DEVICE memory necessitates
> -        * SIGBUS (i.e. MF_MUST_KILL)
> +        * Call driver's implementation to handle the memory failure,
> +        * otherwise roll back to generic handler.
>          */
> -       flags |= MF_ACTION_REQUIRED | MF_MUST_KILL;
> -       collect_procs_file(page, page->mapping, page->index, &to_kill,
> -                          flags & MF_ACTION_REQUIRED);
> +       if (pgmap->ops->memory_failure) {
> +               rc = pgmap->ops->memory_failure(pgmap, pfn, flags);
> +               /*
> +                * Roll back to generic handler too if operation is not
> +                * supported inside the driver/device/filesystem.
> +                */
> +               if (rc != EOPNOTSUPP)
> +                       goto out;
> +       }
> +
> +       rc = mf_generic_kill_procs(pfn, flags);
>
> -       unmap_and_kill(&to_kill, pfn, page->mapping, page->index, flags);
> -       rc = 0;
> -unlock:
> -       dax_unlock_page(page, cookie);
>  out:
>         /* drop pgmap ref acquired in caller */
>         put_dev_pagemap(pgmap);
> --
> 2.31.1
>
>
>

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

