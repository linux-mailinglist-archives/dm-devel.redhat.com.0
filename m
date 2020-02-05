Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE08153843
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:36:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580927801;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B1XDgP8mUlyz907QCp7YlQEU8qsRDnDTD+v4++6vmEQ=;
	b=bx+MrlTAP7Yz3hDf1+PgyZl32KWuOgqCu07KDZRTRt9l+UkX/YF3w0j6XW19mKAOW/+xx7
	9uiqEo6Wkko2iet6XR0CCZpTJcI1gajCPXWZu/eRL7RcUfE1uAKEmhtJVxrYLOJHwjDMAa
	nDzeezhkabCsMB+uLoZgVC/tSmZ7eIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-DpXUE9fWO36xIbe8qBYuaA-1; Wed, 05 Feb 2020 13:36:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04FD01085937;
	Wed,  5 Feb 2020 18:36:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8BC75C28C;
	Wed,  5 Feb 2020 18:36:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF18B85CF7;
	Wed,  5 Feb 2020 18:36:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IaKEx018715 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:36:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18B6710AF429; Wed,  5 Feb 2020 18:36:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 142DA10AF424
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:36:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2760D10192B3
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:36:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-267-P-zPyGexN8G3tys7JQX27g-1; Wed, 05 Feb 2020 13:36:15 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1izPWz-0003Bc-OE; Wed, 05 Feb 2020 18:36:09 +0000
Date: Wed, 5 Feb 2020 10:36:09 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200205183609.GE26711@infradead.org>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-6-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200203200029.4592-6-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: P-zPyGexN8G3tys7JQX27g-1
X-MC-Unique: DpXUE9fWO36xIbe8qBYuaA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015IaKEx018715
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, hch@infradead.org, dan.j.williams@intel.com,
	dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: Re: [dm-devel] [PATCH 5/5] dax,
 iomap: Add helper dax_iomap_zero() to zero a range
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> +int dax_iomap_zero(loff_t pos, unsigned offset, unsigned size,
> +			      struct iomap *iomap)
>  {
>  	pgoff_t pgoff;
>  	long rc, id;
> +	sector_t sector = iomap_sector(iomap, pos & PAGE_MASK);
>  
> -	rc = bdev_dax_pgoff(bdev, sector, PAGE_SIZE, &pgoff);
> +	rc = bdev_dax_pgoff(iomap->bdev, sector, PAGE_SIZE, &pgoff);
>  	if (rc)
>  		return rc;
>  
>  	id = dax_read_lock();
> -	rc = dax_zero_page_range(dax_dev, pgoff, offset, size);
> +	rc = dax_zero_page_range(iomap->dax_dev, pgoff, offset, size);
>  	dax_read_unlock(id);
>  	return rc;
>  }
> -EXPORT_SYMBOL_GPL(__dax_zero_page_range);
> +EXPORT_SYMBOL_GPL(dax_iomap_zero);

This function is only used by fs/iomap/buffered-io.c, so no need to
export it.

>  #ifdef CONFIG_FS_DAX
> -int __dax_zero_page_range(struct block_device *bdev,
> -		struct dax_device *dax_dev, sector_t sector,
> -		unsigned int offset, unsigned int length);
> +int dax_iomap_zero(loff_t pos, unsigned offset, unsigned size,
> +			      struct iomap *iomap);
>  #else
> -static inline int __dax_zero_page_range(struct block_device *bdev,
> -		struct dax_device *dax_dev, sector_t sector,
> -		unsigned int offset, unsigned int length)
> +static inline int dax_iomap_zero(loff_t pos, unsigned offset, unsigned size,
> +				 struct iomap *iomap)
>  {
>  	return -ENXIO;
>  }

Given that the only caller is under an IS_DAX() check you could just
declare the function unconditionally and let the compiler optimize
away the guaranteed dead call for the !CONFIG_FS_DAX case, like we
do with various other functions.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

