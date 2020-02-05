Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id ACF62153972
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 21:16:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580933781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jWXZObXOyezKCDeryx/GhJZfB1L4Pz/gChmTdbe8T3o=;
	b=CtsuPuqosk+I4QZlA88GOMnzZAKcloQVYZ/2ceC2LiEibKkddwrx1B7QRx1GWC8fMCCheM
	N6tMN4DUk1Ar6cvgRDqUxbO9SGxOCLGf2p9d3GCoIB3VY6TBsU3BXX0/WKc1SRZ4DtDi+Y
	0Y+Bdgvv94Imk4PguSf5/hGyy+Wmc5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-yFwEBveQOI2UuJbtLF8IAQ-1; Wed, 05 Feb 2020 15:16:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E2EF1835A14;
	Wed,  5 Feb 2020 20:16:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C491D84DB8;
	Wed,  5 Feb 2020 20:16:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E10818089CD;
	Wed,  5 Feb 2020 20:16:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015KG0Of023527 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 15:16:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E339D1001B09; Wed,  5 Feb 2020 20:16:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E70F10013A1;
	Wed,  5 Feb 2020 20:15:58 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id CD4472202E9; Wed,  5 Feb 2020 15:15:57 -0500 (EST)
Date: Wed, 5 Feb 2020 15:15:57 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200205201557.GH14544@redhat.com>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-6-vgoyal@redhat.com>
	<20200205183609.GE26711@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200205183609.GE26711@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: yFwEBveQOI2UuJbtLF8IAQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 05, 2020 at 10:36:09AM -0800, Christoph Hellwig wrote:
> > +int dax_iomap_zero(loff_t pos, unsigned offset, unsigned size,
> > +			      struct iomap *iomap)
> >  {
> >  	pgoff_t pgoff;
> >  	long rc, id;
> > +	sector_t sector = iomap_sector(iomap, pos & PAGE_MASK);
> >  
> > -	rc = bdev_dax_pgoff(bdev, sector, PAGE_SIZE, &pgoff);
> > +	rc = bdev_dax_pgoff(iomap->bdev, sector, PAGE_SIZE, &pgoff);
> >  	if (rc)
> >  		return rc;
> >  
> >  	id = dax_read_lock();
> > -	rc = dax_zero_page_range(dax_dev, pgoff, offset, size);
> > +	rc = dax_zero_page_range(iomap->dax_dev, pgoff, offset, size);
> >  	dax_read_unlock(id);
> >  	return rc;
> >  }
> > -EXPORT_SYMBOL_GPL(__dax_zero_page_range);
> > +EXPORT_SYMBOL_GPL(dax_iomap_zero);
> 
> This function is only used by fs/iomap/buffered-io.c, so no need to
> export it.

Will do.

> 
> >  #ifdef CONFIG_FS_DAX
> > -int __dax_zero_page_range(struct block_device *bdev,
> > -		struct dax_device *dax_dev, sector_t sector,
> > -		unsigned int offset, unsigned int length);
> > +int dax_iomap_zero(loff_t pos, unsigned offset, unsigned size,
> > +			      struct iomap *iomap);
> >  #else
> > -static inline int __dax_zero_page_range(struct block_device *bdev,
> > -		struct dax_device *dax_dev, sector_t sector,
> > -		unsigned int offset, unsigned int length)
> > +static inline int dax_iomap_zero(loff_t pos, unsigned offset, unsigned size,
> > +				 struct iomap *iomap)
> >  {
> >  	return -ENXIO;
> >  }
> 
> Given that the only caller is under an IS_DAX() check you could just
> declare the function unconditionally and let the compiler optimize
> away the guaranteed dead call for the !CONFIG_FS_DAX case, like we
> do with various other functions.

Sure, will do.

Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

