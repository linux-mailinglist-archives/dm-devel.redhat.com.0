Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C6AE6153963
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 21:03:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580933011;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kNn+Hh69omyExQZX3yEJkMsyhn2riuoQjTBHFsChRC4=;
	b=AKV1UpG+KxX/3WC+lzdQRSJBq7jftwL3ZWuteuimt5NmZ/nfb/oo10tCe5xVcisuee8/Oh
	rKlz5KZe8lQPQ5bdUv7uabdVbX+LOLxtr4Y3R7Hvho+yIELbS4PiOUr34GORDmI1akyHxn
	meUCTUJn/rM/GFlXpPzrrsEbhGCK544=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1--bQbVOv6N7q_35EYjHLViw-1; Wed, 05 Feb 2020 15:03:29 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A2B48010CB;
	Wed,  5 Feb 2020 20:03:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5307387EFF;
	Wed,  5 Feb 2020 20:03:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEE4618089CD;
	Wed,  5 Feb 2020 20:03:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015K326P022672 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 15:03:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7D812100164D; Wed,  5 Feb 2020 20:03:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E022810013A1;
	Wed,  5 Feb 2020 20:02:59 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 73FD42202E9; Wed,  5 Feb 2020 15:02:59 -0500 (EST)
Date: Wed, 5 Feb 2020 15:02:59 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200205200259.GE14544@redhat.com>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-2-vgoyal@redhat.com>
	<20200205183050.GA26711@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200205183050.GA26711@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: -bQbVOv6N7q_35EYjHLViw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 05, 2020 at 10:30:50AM -0800, Christoph Hellwig wrote:
> > +	/*
> > +	 * There are no users as of now. Once users are there, fix dm code
> > +	 * to be able to split a long range across targets.
> > +	 */
> 
> This comment confused me.  I think this wants to say something like:
> 
> 	/*
> 	 * There are now callers that want to zero across a page boundary as of
> 	 * now.  Once there are users this check can be removed after the
> 	 * device mapper code has been updated to split ranges across targets.
> 	 */

Yes, that's what I wanted to say but I missed one line. Thanks. Will fix
it.

> 
> > +static int pmem_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> > +				    unsigned int offset, size_t len)
> > +{
> > +	int rc = 0;
> > +	phys_addr_t phys_pos = pgoff * PAGE_SIZE + offset;
> 
> Any reason not to pass a phys_addr_t in the calling convention for the
> method and maybe also for dax_zero_page_range itself?

I don't have any reason not to pass phys_addr_t. If that sounds better,
will make changes.

> 
> > +	sector_start = ALIGN(phys_pos, 512)/512;
> > +	sector_end = ALIGN_DOWN(phys_pos + bytes, 512)/512;
> 
> Missing whitespaces.  Also this could use DIV_ROUND_UP and
> DIV_ROUND_DOWN.

Will do.


> 
> > +	if (sector_end > sector_start)
> > +		nr_sectors = sector_end - sector_start;
> > +
> > +	if (nr_sectors &&
> > +	    unlikely(is_bad_pmem(&pmem->bb, sector_start,
> > +				 nr_sectors * 512)))
> > +		bad_pmem = true;
> 
> How could nr_sectors be zero?

If somebody specified a range across two sectors but none of the sector is
completely written. Then nr_sectors will be zero. In fact this check
shoudl probably be nr_sectors > 0 as writes with-in a sector will lead
to nr_sector being -1.

Am I missing something.

> 
> > +	write_pmem(pmem_addr, page, 0, bytes);
> > +	if (unlikely(bad_pmem)) {
> > +		/*
> > +		 * Pass block aligned offset and length. That seems
> > +		 * to work as of now. Other finer grained alignment
> > +		 * cases can be addressed later if need be.
> > +		 */
> > +		rc = pmem_clear_poison(pmem, ALIGN(pmem_off, 512),
> > +				       nr_sectors * 512);
> > +		write_pmem(pmem_addr, page, 0, bytes);
> > +	}
> 
> This code largerly duplicates the write side of pmem_do_bvec.  I
> think it might make sense to split pmem_do_bvec into a read and a write
> side as a prep patch, and then reuse the write side here.

Ok, I will look into it. How about just add a helper function for write
side and use that function both here and in pmem_do_bvec().

> 
> > +int generic_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> > +				 unsigned int offset, size_t len);
> 
> This should probably go into a separare are of the header and have
> comment about being a section for generic helpers for drivers.

ok, will do.

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

