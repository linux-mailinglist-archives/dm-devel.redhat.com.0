Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F4162199F3A
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 21:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585683480;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6Wa7rnEF43+xCwMGQ1mUOJvsz7B43q8hNAtogp5Hhic=;
	b=U3SUGP3AyS1ur34PwEm7KcuzpZLGRXPRH38t58JfQ2M2MxUbDQpFVRLCWSJ5vn9Q5wn0X6
	EpmR2W7b1vadB/vr7d+/Q0zuNJpTcpmWLR97NJT6ewCXEq2tXTVCSzHs27JdLHLxTUmPeD
	kw/SA9BxHPbojchq1DcwkStffDAuabA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-MT_rRIPIOjaas2krTcdxYA-1; Tue, 31 Mar 2020 15:37:58 -0400
X-MC-Unique: MT_rRIPIOjaas2krTcdxYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8880E18C35B4;
	Tue, 31 Mar 2020 19:37:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2E7B7737D;
	Tue, 31 Mar 2020 19:37:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37C9E86C03;
	Tue, 31 Mar 2020 19:37:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02VJYvwK002039 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 15:34:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8AF0F2028CD3; Tue, 31 Mar 2020 19:34:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86E7A2028CD4
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 19:34:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD8398F8403
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 19:34:54 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-313-XdrzaBMlPoK8KPtVKvgsOg-1; Tue, 31 Mar 2020 15:34:50 -0400
X-MC-Unique: XdrzaBMlPoK8KPtVKvgsOg-1
Received: by mail-ed1-f65.google.com with SMTP id de14so26623865edb.4
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 12:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UlSJUrrtp+elCcnlxjegQ1+2cP9J0LpeSgRiaNQtR0s=;
	b=eG0/sk/RnFZungugBnoFBSVRf6QKXh2SsftEUJYqxTdxfTKQreL0M1JePArW9nLPjA
	eb9+vo48VF3ZuwlxOtqpRoUjbJX0DlJF8tX3ho5X+S6smh8+nHSAzayrB5gxz28v8gq3
	m+1/09pNYSS/NNPDTChaVLRAtdgWKNYFUsbY/t2kP0mVCXSjPvZ4saXbPlyqCtml5AEz
	UeosbfIVsk/9pB4hSYv4kLcB21wkTMOvWxRPu7yRtsHKNCUF7r29McbzwBorQXoin14P
	mGLbvpteQ5nsfUj4y/96pfq+rEnDn1nFd6YkMHW9OwqX2KTkV3oDKSe9Xc/aCFwFwzBN
	JZgA==
X-Gm-Message-State: ANhLgQ0fNPFrH2co6HNlyopi9m8G+Dk8YHl2rpJrp09FBkTY24dEYsiV
	5Lsk8kqGgcXSQaOrHiSF96i+sAwcsyyDYhblda1Omg==
X-Google-Smtp-Source: ADFU+vsrR9MztC+EwEAW0InOpTF7vKxHzltbCfwaPTJVFLJjv2U252HQlig7Y4YqehaKRemZ8x8lDhVxwSEZWjFKJ8E=
X-Received: by 2002:a17:906:4bc4:: with SMTP id
	x4mr11811524ejv.201.1585683288829; 
	Tue, 31 Mar 2020 12:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200228163456.1587-1-vgoyal@redhat.com>
	<20200228163456.1587-5-vgoyal@redhat.com>
In-Reply-To: <20200228163456.1587-5-vgoyal@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 31 Mar 2020 12:34:36 -0700
Message-ID: <CAPcyv4iWfL+KQjjUXqrTKOL8F4M05Vu=imm5tqsD6MO=XLzoMA@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02VJYvwK002039
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>, david <david@fromorbit.com>,
	device-mapper development <dm-devel@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, jmoyer <jmoyer@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v6 4/6] dm,
	dax: Add dax zero_page_range operation
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

[ Add Mike ]

On Fri, Feb 28, 2020 at 8:35 AM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> This patch adds support for dax zero_page_range operation to dm targets.

Mike,

Sorry, I should have pinged you earlier, but could you take a look at
this patch and ack it if it looks ok to go through the nvdimm tree
with the rest of the series?

>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  drivers/md/dm-linear.c        | 18 ++++++++++++++++++
>  drivers/md/dm-log-writes.c    | 17 +++++++++++++++++
>  drivers/md/dm-stripe.c        | 23 +++++++++++++++++++++++
>  drivers/md/dm.c               | 30 ++++++++++++++++++++++++++++++
>  include/linux/device-mapper.h |  3 +++
>  5 files changed, 91 insertions(+)
>
> diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
> index 8d07fdf63a47..e1db43446327 100644
> --- a/drivers/md/dm-linear.c
> +++ b/drivers/md/dm-linear.c
> @@ -201,10 +201,27 @@ static size_t linear_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
>         return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
>  }
>
> +static int linear_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
> +                                     size_t nr_pages)
> +{
> +       int ret;
> +       struct linear_c *lc = ti->private;
> +       struct block_device *bdev = lc->dev->bdev;
> +       struct dax_device *dax_dev = lc->dev->dax_dev;
> +       sector_t dev_sector, sector = pgoff * PAGE_SECTORS;
> +
> +       dev_sector = linear_map_sector(ti, sector);
> +       ret = bdev_dax_pgoff(bdev, dev_sector, nr_pages << PAGE_SHIFT, &pgoff);
> +       if (ret)
> +               return ret;
> +       return dax_zero_page_range(dax_dev, pgoff, nr_pages);
> +}
> +
>  #else
>  #define linear_dax_direct_access NULL
>  #define linear_dax_copy_from_iter NULL
>  #define linear_dax_copy_to_iter NULL
> +#define linear_dax_zero_page_range NULL
>  #endif
>
>  static struct target_type linear_target = {
> @@ -226,6 +243,7 @@ static struct target_type linear_target = {
>         .direct_access = linear_dax_direct_access,
>         .dax_copy_from_iter = linear_dax_copy_from_iter,
>         .dax_copy_to_iter = linear_dax_copy_to_iter,
> +       .dax_zero_page_range = linear_dax_zero_page_range,
>  };
>
>  int __init dm_linear_init(void)
> diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
> index 99721c76225d..8ea20b56b4d6 100644
> --- a/drivers/md/dm-log-writes.c
> +++ b/drivers/md/dm-log-writes.c
> @@ -994,10 +994,26 @@ static size_t log_writes_dax_copy_to_iter(struct dm_target *ti,
>         return dax_copy_to_iter(lc->dev->dax_dev, pgoff, addr, bytes, i);
>  }
>
> +static int log_writes_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
> +                                         size_t nr_pages)
> +{
> +       int ret;
> +       struct log_writes_c *lc = ti->private;
> +       sector_t sector = pgoff * PAGE_SECTORS;
> +
> +       ret = bdev_dax_pgoff(lc->dev->bdev, sector, nr_pages << PAGE_SHIFT,
> +                            &pgoff);
> +       if (ret)
> +               return ret;
> +       return dax_zero_page_range(lc->dev->dax_dev, pgoff,
> +                                  nr_pages << PAGE_SHIFT);
> +}
> +
>  #else
>  #define log_writes_dax_direct_access NULL
>  #define log_writes_dax_copy_from_iter NULL
>  #define log_writes_dax_copy_to_iter NULL
> +#define log_writes_dax_zero_page_range NULL
>  #endif
>
>  static struct target_type log_writes_target = {
> @@ -1016,6 +1032,7 @@ static struct target_type log_writes_target = {
>         .direct_access = log_writes_dax_direct_access,
>         .dax_copy_from_iter = log_writes_dax_copy_from_iter,
>         .dax_copy_to_iter = log_writes_dax_copy_to_iter,
> +       .dax_zero_page_range = log_writes_dax_zero_page_range,
>  };
>
>  static int __init dm_log_writes_init(void)
> diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
> index 63bbcc20f49a..fa813c0f993d 100644
> --- a/drivers/md/dm-stripe.c
> +++ b/drivers/md/dm-stripe.c
> @@ -360,10 +360,32 @@ static size_t stripe_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
>         return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
>  }
>
> +static int stripe_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
> +                                     size_t nr_pages)
> +{
> +       int ret;
> +       sector_t dev_sector, sector = pgoff * PAGE_SECTORS;
> +       struct stripe_c *sc = ti->private;
> +       struct dax_device *dax_dev;
> +       struct block_device *bdev;
> +       uint32_t stripe;
> +
> +       stripe_map_sector(sc, sector, &stripe, &dev_sector);
> +       dev_sector += sc->stripe[stripe].physical_start;
> +       dax_dev = sc->stripe[stripe].dev->dax_dev;
> +       bdev = sc->stripe[stripe].dev->bdev;
> +
> +       ret = bdev_dax_pgoff(bdev, dev_sector, nr_pages << PAGE_SHIFT, &pgoff);
> +       if (ret)
> +               return ret;
> +       return dax_zero_page_range(dax_dev, pgoff, nr_pages);
> +}
> +
>  #else
>  #define stripe_dax_direct_access NULL
>  #define stripe_dax_copy_from_iter NULL
>  #define stripe_dax_copy_to_iter NULL
> +#define stripe_dax_zero_page_range NULL
>  #endif
>
>  /*
> @@ -486,6 +508,7 @@ static struct target_type stripe_target = {
>         .direct_access = stripe_dax_direct_access,
>         .dax_copy_from_iter = stripe_dax_copy_from_iter,
>         .dax_copy_to_iter = stripe_dax_copy_to_iter,
> +       .dax_zero_page_range = stripe_dax_zero_page_range,
>  };
>
>  int __init dm_stripe_init(void)
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index b89f07ee2eff..aa72d9e757c1 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1198,6 +1198,35 @@ static size_t dm_dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff,
>         return ret;
>  }
>
> +static int dm_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> +                                 size_t nr_pages)
> +{
> +       struct mapped_device *md = dax_get_private(dax_dev);
> +       sector_t sector = pgoff * PAGE_SECTORS;
> +       struct dm_target *ti;
> +       int ret = -EIO;
> +       int srcu_idx;
> +
> +       ti = dm_dax_get_live_target(md, sector, &srcu_idx);
> +
> +       if (!ti)
> +               goto out;
> +       if (WARN_ON(!ti->type->dax_zero_page_range)) {
> +               /*
> +                * ->zero_page_range() is mandatory dax operation. If we are
> +                *  here, something is wrong.
> +                */
> +               dm_put_live_table(md, srcu_idx);
> +               goto out;
> +       }
> +       ret = ti->type->dax_zero_page_range(ti, pgoff, nr_pages);
> +
> + out:
> +       dm_put_live_table(md, srcu_idx);
> +
> +       return ret;
> +}
> +
>  /*
>   * A target may call dm_accept_partial_bio only from the map routine.  It is
>   * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_RESET,
> @@ -3199,6 +3228,7 @@ static const struct dax_operations dm_dax_ops = {
>         .dax_supported = dm_dax_supported,
>         .copy_from_iter = dm_dax_copy_from_iter,
>         .copy_to_iter = dm_dax_copy_to_iter,
> +       .zero_page_range = dm_dax_zero_page_range,
>  };
>
>  /*
> diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
> index 475668c69dbc..af48d9da3916 100644
> --- a/include/linux/device-mapper.h
> +++ b/include/linux/device-mapper.h
> @@ -141,6 +141,8 @@ typedef long (*dm_dax_direct_access_fn) (struct dm_target *ti, pgoff_t pgoff,
>                 long nr_pages, void **kaddr, pfn_t *pfn);
>  typedef size_t (*dm_dax_copy_iter_fn)(struct dm_target *ti, pgoff_t pgoff,
>                 void *addr, size_t bytes, struct iov_iter *i);
> +typedef int (*dm_dax_zero_page_range_fn)(struct dm_target *ti, pgoff_t pgoff,
> +               size_t nr_pages);
>  #define PAGE_SECTORS (PAGE_SIZE / 512)
>
>  void dm_error(const char *message);
> @@ -195,6 +197,7 @@ struct target_type {
>         dm_dax_direct_access_fn direct_access;
>         dm_dax_copy_iter_fn dax_copy_from_iter;
>         dm_dax_copy_iter_fn dax_copy_to_iter;
> +       dm_dax_zero_page_range_fn dax_zero_page_range;
>
>         /* For internal device-mapper use. */
>         struct list_head list;
> --
> 2.20.1
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

