Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AA282161552
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 16:00:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581951609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lvGvDPu+E3f3vvNd3G8ohAVABvaMpTBeK+6trJDlAQA=;
	b=bZ8/ZtKV+z1dFoShmfHJ+5F1AZw1jdrWgP5jBhexc0PPcGYIzEcvZaAKT3GPKrS8Yb+nNN
	IVbigEVYCXnEXMIKKZSGx/FXI58YvXklVOS5h5kN215xhKvVqc8FqvWO1YwibjMQAzapHf
	/l1dgKB/S2mJ7xDu1zYTKlSIJZhFGOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-G8s0eS8aNpqXd0OphnHGvQ-1; Mon, 17 Feb 2020 10:00:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5501413E5;
	Mon, 17 Feb 2020 14:59:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 736538AC5E;
	Mon, 17 Feb 2020 14:59:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A537B1832DEA;
	Mon, 17 Feb 2020 14:59:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HExbYt009385 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 09:59:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18A711000325; Mon, 17 Feb 2020 14:59:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04B8B10016DA;
	Mon, 17 Feb 2020 14:59:34 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 62C472257D2; Mon, 17 Feb 2020 09:59:33 -0500 (EST)
Date: Mon, 17 Feb 2020 09:59:33 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200217145933.GA24816@redhat.com>
References: <20200207202652.1439-1-vgoyal@redhat.com>
	<20200207202652.1439-3-vgoyal@redhat.com>
	<20200217132309.GC14490@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217132309.GC14490@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: Re: [dm-devel] [PATCH v3 2/7] pmem: Enable pmem_do_write() to deal
 with arbitrary ranges
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: G8s0eS8aNpqXd0OphnHGvQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 17, 2020 at 05:23:09AM -0800, Christoph Hellwig wrote:
> On Fri, Feb 07, 2020 at 03:26:47PM -0500, Vivek Goyal wrote:
> > Currently pmem_do_write() is written with assumption that all I/O is
> > sector aligned. Soon I want to use this function in zero_page_range()
> > where range passed in does not have to be sector aligned.
> > 
> > Modify this function to be able to deal with an arbitrary range. Which
> > is specified by pmem_off and len.
> > 
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  drivers/nvdimm/pmem.c | 30 ++++++++++++++++++++++--------
> >  1 file changed, 22 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> > index 9ad07cb8c9fc..281fe04d25fd 100644
> > --- a/drivers/nvdimm/pmem.c
> > +++ b/drivers/nvdimm/pmem.c
> > @@ -154,15 +154,23 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
> >  
> >  static blk_status_t pmem_do_write(struct pmem_device *pmem,
> >  			struct page *page, unsigned int page_off,
> > -			sector_t sector, unsigned int len)
> > +			u64 pmem_off, unsigned int len)
> >  {
> >  	blk_status_t rc = BLK_STS_OK;
> >  	bool bad_pmem = false;
> > -	phys_addr_t pmem_off = sector * 512 + pmem->data_offset;
> > -	void *pmem_addr = pmem->virt_addr + pmem_off;
> > -
> > -	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
> > -		bad_pmem = true;
> > +	phys_addr_t pmem_real_off = pmem_off + pmem->data_offset;
> > +	void *pmem_addr = pmem->virt_addr + pmem_real_off;
> > +	sector_t sector_start, sector_end;
> > +	unsigned nr_sectors;
> > +
> > +	sector_start = DIV_ROUND_UP(pmem_off, SECTOR_SIZE);
> > +	sector_end = (pmem_off + len) >> SECTOR_SHIFT;
> > +	if (sector_end > sector_start) {
> > +		nr_sectors = sector_end - sector_start;
> > +		if (unlikely(is_bad_pmem(&pmem->bb, sector_start,
> > +					 nr_sectors << SECTOR_SHIFT)))
> > +			bad_pmem = true;
> 
> I don't think an unlikely annotation makes much sense for assigning
> a boolean value to a flag variable.

Ok, will get rid if this unlikely() instance.

> 
> > +		/*
> > +		 * Pass sector aligned offset and length. That seems
> > +		 * to work as of now. Other finer grained alignment
> > +		 * cases can be addressed later if need be.
> > +		 */
> 
> This comment seems pretty scary.  What other cases can you think of?

Currently firmware seems to have restrictions on alignment of size and
offset of poisoned memory being cleared.

drivers/nvdimm/bus.c

nvdimm_clear_poison()
{
...
	clear_err_unit = ars_cap.clear_err_unit;
	        mask = clear_err_unit - 1;
        if ((phys | len) & mask)
                return -ENXIO;
...
}

On the system I was testing clear_err_unit is 256. If I pass in offset
and len values which are not aligned to 256, I get errors.

So if a caller passes in a random offset and range, I clear poison
only on the part of the range which is aligned to 1 << SECTOR_SHIFT. Any
portion of the range left in the beginning or at the end, does not clear
poison.

Current code also clears poison on secotr boundaries only. One can go
the extra mile and query "clear_err_unit" and if it is less than
SECTOR_SIZE, then possibly clear the poison on range of memory which
is not sector aligned but clear_err_unit aligned.

But this retains existing functionality and is not a regression w.r.t
we are already doing. Querying "clear_err_unit" acting accordingly is
an improvement if one needs it.

Hence, I don't think this is something to be concerned about.

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

