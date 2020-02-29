Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C24FB1757B2
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 10:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583142802;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4n+6d0TmKbHgeBzNBiOr82blFjF9O3nvbvfyOuywEbE=;
	b=ErBXZzNFAJML7UdJSt2rNc44UmAsUPgxKVVQ2HcpeZldV2cU0cKzwFrFl/5lxOq6OiuuiX
	/8FdpKXVh/v0CbJroVNUR4/pzzHlMXX2MIq2O2IXxC154yr9WNICfCzr1OqwKd71q1+joQ
	E10ydMTOTSusomThjT3VYdVq1cMZr3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-oX1Mh56dMpafETGe2H6BiA-1; Mon, 02 Mar 2020 04:53:20 -0500
X-MC-Unique: oX1Mh56dMpafETGe2H6BiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A4B2107ACCA;
	Mon,  2 Mar 2020 09:53:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC6671001DF2;
	Mon,  2 Mar 2020 09:53:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E7878446C;
	Mon,  2 Mar 2020 09:53:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01T9Ltea025325 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 29 Feb 2020 04:21:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B35EB103F272; Sat, 29 Feb 2020 09:21:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE8B1103F270
	for <dm-devel@redhat.com>; Sat, 29 Feb 2020 09:21:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 290E6101A55A
	for <dm-devel@redhat.com>; Sat, 29 Feb 2020 09:21:53 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-119-tV8iZiJnMu6bEQDOvohV6w-1; Sat, 29 Feb 2020 04:21:50 -0500
X-MC-Unique: tV8iZiJnMu6bEQDOvohV6w-1
Received: by mail-wm1-f68.google.com with SMTP id a5so6003649wmb.0;
	Sat, 29 Feb 2020 01:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Ue+Dgx3CeJSePHgMAW1fINAp8LiFMrWYxPNI01tF+o=;
	b=JvTiI7xH2mmOstjHe96kaMpP/7Xvjwj28BEo5Xmpk6Es3M0mCtLc4EqmSvX3AdNLTY
	/NlcCEjlXJgHTIZGzQcWsqfgIsty2+0kvn7d52oovP9YROiw+pURl9GwV9M0l3TzcMbL
	9nroHVUaFLij2XL5t0PP/t6MfYAcVbukZpNSyfDSCrGDFf2kDIF60mTvGVZLRVwN+f4J
	7azTKGLH3N30BPBMKQau6UVfjvFXH9ixLHPkqch+ULN8utA8srAIPmSTaXMa6FbTtDYT
	TQCFVweqmFcvdNMiAZsZTGcVdIOc5PAORQK1v2dOnf0kJhKgBc7YbMcXz8K2N0Urb58b
	imGg==
X-Gm-Message-State: APjAAAVmaokaaI74gdzgmZIFLpnWX/nAOXezSPGXI248YFa8PdUthy57
	Yzj4Yqi64AnOmO+UkdILTIIP6Z+IBHQgARNup7RaS1zZQ/w=
X-Google-Smtp-Source: APXvYqwXr3ckvpjnUV3luGA4fCi4IOXlgKlcLyhHcepYxIFSxB+bII3J0lhiHYkO46BI/jCcSRb6B2gBvrulhaqW66Y=
X-Received: by 2002:a1c:25c5:: with SMTP id l188mr9801660wml.105.1582968108954;
	Sat, 29 Feb 2020 01:21:48 -0800 (PST)
MIME-Version: 1.0
References: <20200228163456.1587-1-vgoyal@redhat.com>
	<20200228163456.1587-3-vgoyal@redhat.com>
In-Reply-To: <20200228163456.1587-3-vgoyal@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Sat, 29 Feb 2020 10:21:37 +0100
Message-ID: <CAM9Jb+gLczXgFmLJg8a=XThoJT1S8XajFkb8AkjDCV1XXyarqg@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01T9Ltea025325
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Mar 2020 04:53:00 -0500
Cc: linux-nvdimm@lists.01.org, david@fromorbit.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v6 2/6] dax,
	pmem: Add a dax operation zero_page_range
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>
> Add a dax operation zero_page_range, to zero a page. This will also clear any
> known poison in the page being zeroed.
>
> As of now, zeroing of one page is allowed in a single call. There
> are no callers which are trying to zero more than a page in a single call.
> Once we grow the callers which zero more than a page in single call, we
> can add that support. Primary reason for not doing that yet is that this
> will add little complexity in dm implementation where a range might be
> spanning multiple underlying targets and one will have to split the range
> into multiple sub ranges and call zero_page_range() on individual targets.
>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  drivers/dax/super.c   | 20 ++++++++++++++++++++
>  drivers/nvdimm/pmem.c | 11 +++++++++++
>  include/linux/dax.h   |  4 ++++
>  3 files changed, 35 insertions(+)
>
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 0aa4b6bc5101..e498daf3c0d7 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -344,6 +344,26 @@ size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
>  }
>  EXPORT_SYMBOL_GPL(dax_copy_to_iter);
>
> +int dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> +                       size_t nr_pages)
> +{
> +       if (!dax_alive(dax_dev))
> +               return -ENXIO;
> +
> +       if (!dax_dev->ops->zero_page_range)
> +               return -EOPNOTSUPP;
> +       /*
> +        * There are no callers that want to zero more than one page as of now.
> +        * Once users are there, this check can be removed after the
> +        * device mapper code has been updated to split ranges across targets.
> +        */
> +       if (nr_pages != 1)
> +               return -EIO;
> +
> +       return dax_dev->ops->zero_page_range(dax_dev, pgoff, nr_pages);
> +}
> +EXPORT_SYMBOL_GPL(dax_zero_page_range);
> +
>  #ifdef CONFIG_ARCH_HAS_PMEM_API
>  void arch_wb_cache_pmem(void *addr, size_t size);
>  void dax_flush(struct dax_device *dax_dev, void *addr, size_t size)
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 075b11682192..5b774ddd0efb 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -282,6 +282,16 @@ static const struct block_device_operations pmem_fops = {
>         .revalidate_disk =      nvdimm_revalidate_disk,
>  };
>
> +static int pmem_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> +                                   size_t nr_pages)
> +{
> +       struct pmem_device *pmem = dax_get_private(dax_dev);
> +
> +       return blk_status_to_errno(pmem_do_write(pmem, ZERO_PAGE(0), 0,
> +                                  PFN_PHYS(pgoff) >> SECTOR_SHIFT,
> +                                  PAGE_SIZE));
> +}
> +
>  static long pmem_dax_direct_access(struct dax_device *dax_dev,
>                 pgoff_t pgoff, long nr_pages, void **kaddr, pfn_t *pfn)
>  {
> @@ -313,6 +323,7 @@ static const struct dax_operations pmem_dax_ops = {
>         .dax_supported = generic_fsdax_supported,
>         .copy_from_iter = pmem_copy_from_iter,
>         .copy_to_iter = pmem_copy_to_iter,
> +       .zero_page_range = pmem_dax_zero_page_range,
>  };
>
>  static const struct attribute_group *pmem_attribute_groups[] = {
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index 328c2dbb4409..71735c430c05 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -34,6 +34,8 @@ struct dax_operations {
>         /* copy_to_iter: required operation for fs-dax direct-i/o */
>         size_t (*copy_to_iter)(struct dax_device *, pgoff_t, void *, size_t,
>                         struct iov_iter *);
> +       /* zero_page_range: required operation. Zero page range   */
> +       int (*zero_page_range)(struct dax_device *, pgoff_t, size_t);
>  };
>
>  extern struct attribute_group dax_attribute_group;
> @@ -199,6 +201,8 @@ size_t dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
>                 size_t bytes, struct iov_iter *i);
>  size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
>                 size_t bytes, struct iov_iter *i);
> +int dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> +                       size_t nr_pages);
>  void dax_flush(struct dax_device *dax_dev, void *addr, size_t size);
>
>  ssize_t dax_iomap_rw(struct kiocb *iocb, struct iov_iter *iter,
> --
> 2.20.1

Zeroing single page seems right approach for now.
Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

