Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1C407162B9D
	for <lists+dm-devel@lfdr.de>; Tue, 18 Feb 2020 18:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582045817;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pIot2G/LYo0X7sFivUlaJ/IwozEatx3YE1k6T1mnpyw=;
	b=YNnz772u4rR23EiWR0B6xVtukI4ktrr7otBLJnAr+nEnRVPDxYbYo7PbKatnYViMqHwooF
	6yl4AdiOx+MU1CYtzfSmEF1rVaHGPHAArZLqvW52ToGRpQccg7hMBbad/Cdhc0HQ+t9s9C
	Sni9PSzSj3m7FBg0QSYrwfYkup3az48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-coDk5tioPpql2ajpPucXnQ-1; Tue, 18 Feb 2020 12:10:15 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40B4818C35C5;
	Tue, 18 Feb 2020 17:10:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97E4390761;
	Tue, 18 Feb 2020 17:10:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E93318089C8;
	Tue, 18 Feb 2020 17:09:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01IH9aHS003703 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 12:09:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E3B4D2063206; Tue, 18 Feb 2020 17:09:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DECF02026D67
	for <dm-devel@redhat.com>; Tue, 18 Feb 2020 17:09:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76068803283
	for <dm-devel@redhat.com>; Tue, 18 Feb 2020 17:09:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24-8Zl3EQmuMxa4bIjAcLZq-A-1; Tue, 18 Feb 2020 12:09:30 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j46NE-0000Ag-MC; Tue, 18 Feb 2020 17:09:28 +0000
Date: Tue, 18 Feb 2020 09:09:28 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200218170928.GB30766@infradead.org>
References: <20200217181653.4706-1-vgoyal@redhat.com>
	<20200217181653.4706-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200217181653.4706-3-vgoyal@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: 8Zl3EQmuMxa4bIjAcLZq-A-1
X-MC-Unique: coDk5tioPpql2ajpPucXnQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01IH9aHS003703
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, vishal.l.verma@intel.com, hch@infradead.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v4 2/7] pmem: Enable pmem_do_write() to deal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 17, 2020 at 01:16:48PM -0500, Vivek Goyal wrote:
> Currently pmem_do_write() is written with assumption that all I/O is
> sector aligned. Soon I want to use this function in zero_page_range()
> where range passed in does not have to be sector aligned.
> 
> Modify this function to be able to deal with an arbitrary range. Which
> is specified by pmem_off and len.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  drivers/nvdimm/pmem.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 075b11682192..fae8f67da9de 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -154,15 +154,23 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
>  
>  static blk_status_t pmem_do_write(struct pmem_device *pmem,
>  			struct page *page, unsigned int page_off,
> -			sector_t sector, unsigned int len)
> +			u64 pmem_off, unsigned int len)
>  {
>  	blk_status_t rc = BLK_STS_OK;
>  	bool bad_pmem = false;
> -	phys_addr_t pmem_off = sector * 512 + pmem->data_offset;
> -	void *pmem_addr = pmem->virt_addr + pmem_off;
> -
> -	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
> -		bad_pmem = true;
> +	phys_addr_t pmem_real_off = pmem_off + pmem->data_offset;
> +	void *pmem_addr = pmem->virt_addr + pmem_real_off;
> +	sector_t sector_start, sector_end;
> +	unsigned nr_sectors;
> +
> +	sector_start = DIV_ROUND_UP(pmem_off, SECTOR_SIZE);
> +	sector_end = (pmem_off + len) >> SECTOR_SHIFT;
> +	if (sector_end > sector_start) {
> +		nr_sectors = sector_end - sector_start;
> +		if (is_bad_pmem(&pmem->bb, sector_start,
> +				nr_sectors << SECTOR_SHIFT))
> +			bad_pmem = true;
> +	}
>  
>  	/*
>  	 * Note that we write the data both before and after
> @@ -181,7 +189,13 @@ static blk_status_t pmem_do_write(struct pmem_device *pmem,
>  	flush_dcache_page(page);
>  	write_pmem(pmem_addr, page, page_off, len);
>  	if (unlikely(bad_pmem)) {
> -		rc = pmem_clear_poison(pmem, pmem_off, len);
> +		/*
> +		 * Pass sector aligned offset and length. That seems
> +		 * to work as of now. Other finer grained alignment
> +		 * cases can be addressed later if need be.
> +		 */
> +		rc = pmem_clear_poison(pmem, ALIGN(pmem_real_off, SECTOR_SIZE),
> +				       nr_sectors << SECTOR_SHIFT);
>  		write_pmem(pmem_addr, page, page_off, len);

I'm still scared about the as of now commnet.  If the interface to
clearing poison is page aligned I think we should document that in the
actual pmem_clear_poison function, and make that take the unaligned
offset.  I also think we want some feedback from Dan or other what the
official interface is instead of "seems to work".


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

