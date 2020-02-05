Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 95E65153848
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:38:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580927923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x8WnzIuA7LHczpFeNSUYnDCYIyZU7mCg6u1KhB7uerQ=;
	b=dcSeCs0yemwsECkL0Eqmj9wnlYF0gYFh6bTrluhKwqybEJcQts7ss61Er3rhto6Zjzulym
	d7kAqalRvK/yYmSIXtKARi5D77yciZUv32XNoKuhuW0d+GGHGuxFXBzm92+eLMrPCg8RjH
	zmemeiGDhssQuJemN9Z+/hUg2FziKXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-R1lLFvj0PVSpLo1G4jCcSA-1; Wed, 05 Feb 2020 13:38:39 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5790D1B2C983;
	Wed,  5 Feb 2020 18:38:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7DAA19C7F;
	Wed,  5 Feb 2020 18:38:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFDA985CE7;
	Wed,  5 Feb 2020 18:38:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IcPfs018849 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:38:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E034C2166B2A; Wed,  5 Feb 2020 18:38:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC2B52166B28
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:38:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5803805A6B
	for <dm-devel@redhat.com>; Wed,  5 Feb 2020 18:38:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-132-bAAWCKX-NkWNTj80FwvIag-1; Wed, 05 Feb 2020 13:38:20 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1izPRq-0001GT-Dv; Wed, 05 Feb 2020 18:30:50 +0000
Date: Wed, 5 Feb 2020 10:30:50 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200205183050.GA26711@infradead.org>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200203200029.4592-2-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: bAAWCKX-NkWNTj80FwvIag-1
X-MC-Unique: R1lLFvj0PVSpLo1G4jCcSA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 015IcPfs018849
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, hch@infradead.org, dan.j.williams@intel.com,
	dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: Re: [dm-devel] [PATCH 1/5] dax,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> +	/*
> +	 * There are no users as of now. Once users are there, fix dm code
> +	 * to be able to split a long range across targets.
> +	 */

This comment confused me.  I think this wants to say something like:

	/*
	 * There are now callers that want to zero across a page boundary as of
	 * now.  Once there are users this check can be removed after the
	 * device mapper code has been updated to split ranges across targets.
	 */

> +static int pmem_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> +				    unsigned int offset, size_t len)
> +{
> +	int rc = 0;
> +	phys_addr_t phys_pos = pgoff * PAGE_SIZE + offset;

Any reason not to pass a phys_addr_t in the calling convention for the
method and maybe also for dax_zero_page_range itself?

> +	sector_start = ALIGN(phys_pos, 512)/512;
> +	sector_end = ALIGN_DOWN(phys_pos + bytes, 512)/512;

Missing whitespaces.  Also this could use DIV_ROUND_UP and
DIV_ROUND_DOWN.

> +	if (sector_end > sector_start)
> +		nr_sectors = sector_end - sector_start;
> +
> +	if (nr_sectors &&
> +	    unlikely(is_bad_pmem(&pmem->bb, sector_start,
> +				 nr_sectors * 512)))
> +		bad_pmem = true;

How could nr_sectors be zero?

> +	write_pmem(pmem_addr, page, 0, bytes);
> +	if (unlikely(bad_pmem)) {
> +		/*
> +		 * Pass block aligned offset and length. That seems
> +		 * to work as of now. Other finer grained alignment
> +		 * cases can be addressed later if need be.
> +		 */
> +		rc = pmem_clear_poison(pmem, ALIGN(pmem_off, 512),
> +				       nr_sectors * 512);
> +		write_pmem(pmem_addr, page, 0, bytes);
> +	}

This code largerly duplicates the write side of pmem_do_bvec.  I
think it might make sense to split pmem_do_bvec into a read and a write
side as a prep patch, and then reuse the write side here.

> +int generic_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> +				 unsigned int offset, size_t len);

This should probably go into a separare are of the header and have
comment about being a section for generic helpers for drivers.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

