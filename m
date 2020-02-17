Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9AA161377
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 14:31:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581946271;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5YjbbiqBxRqzkHCRcu0+y5VnKZ4EeZOiCY7ymAlhKzQ=;
	b=eBiEV8qO3mF+w6XPaStoVqgYphZylxEZ7v9RywatfcQBVGtluh7N9hYPM6bnnhmUOEBI/Z
	CWdShikio+jllKGirf6dJ7Q4UZPY+QveuKCP+F7tU7SYdkhRPwfyhqbgk/iF1FX0dqQ8ij
	iLq2rYrwuGNXJ2yNIUIhNUsF5heL4BI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-YTkAYgapNVmBh93gAaYTuA-1; Mon, 17 Feb 2020 08:31:09 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4A1477;
	Mon, 17 Feb 2020 13:31:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 114AD19481;
	Mon, 17 Feb 2020 13:31:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9CB11832DEA;
	Mon, 17 Feb 2020 13:30:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HDUol4004589 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 08:30:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70FC872906; Mon, 17 Feb 2020 13:30:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CC2D874D1
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:30:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D11FA802070
	for <dm-devel@redhat.com>; Mon, 17 Feb 2020 13:30:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-25-vQE7_YtbMJ65-aJY6PCnqA-1; Mon, 17 Feb 2020 08:30:45 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j3gTz-0007JC-7K; Mon, 17 Feb 2020 13:30:43 +0000
Date: Mon, 17 Feb 2020 05:30:43 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200217133043.GA20444@infradead.org>
References: <20200212170733.8092-1-vgoyal@redhat.com>
	<20200212170733.8092-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200212170733.8092-2-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: vQE7_YtbMJ65-aJY6PCnqA-1
X-MC-Unique: YTkAYgapNVmBh93gAaYTuA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01HDUol4004589
X-loop: dm-devel@redhat.com
Cc: jack@suse.cz, linux-nvdimm@lists.01.org, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH 1/6] dax: Define a helper dax_pgoff() which
 takes in dax_offset as argument
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 12, 2020 at 12:07:28PM -0500, Vivek Goyal wrote:
> Create a new helper dax_pgoff() which will replace bdev_dax_pgoff(). Difference
> between two is that dax_pgoff() takes in "sector_t dax_offset" as an argument
> instead of "struct block_device".
> 
> dax_offset specifies any offset into dax device which should be added to
> sector while calculating pgoff.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  drivers/dax/super.c | 12 ++++++++++++
>  include/linux/dax.h |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 0aa4b6bc5101..e9daa30e4250 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -56,6 +56,18 @@ int bdev_dax_pgoff(struct block_device *bdev, sector_t sector, size_t size,
>  }
>  EXPORT_SYMBOL(bdev_dax_pgoff);
>  
> +int dax_pgoff(sector_t dax_offset, sector_t sector, size_t size, pgoff_t *pgoff)

Please add a kerneldoc document.  I can't really make sense of what
dax_offset and sector mean here and why they are passed separately.

> +{
> +	phys_addr_t phys_off = (dax_offset + sector) * 512;

							<< SECTOR_SHIFT;

> +
> +	if (pgoff)
> +		*pgoff = PHYS_PFN(phys_off);

What is the use case of not passing a pgoff argument?

> +	if (phys_off % PAGE_SIZE || size % PAGE_SIZE)
> +		return -EINVAL;
> +	return 0;
> +}
> +EXPORT_SYMBOL(dax_pgoff);

EXPORT_SYMBOL_GPL, please.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

