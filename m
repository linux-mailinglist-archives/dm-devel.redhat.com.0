Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E35B5153967
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 21:04:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580933085;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gZwECiqf8JA6/H5b2LkxN5M2IuiUi8J9h1KPkM5RqW8=;
	b=EUhdWhORpprVrPSa0GwnuZN9JdHlKBUow0ZHIXA1PPdVELl+8/X9KZcxo/fSX/ZlHkKLYB
	1xPNfsvtUwvoKjbPOqFk9qA5a7A0P6ifx4u993fbuDY0gc/T+pA+LZZQFrGQJeNaTYPAE2
	+Lw3QdMOTyuD+1mr0zzUib2/1njLWY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-vJIbA0k0MFGSZRkGRoYZtg-1; Wed, 05 Feb 2020 15:04:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 673B78018A2;
	Wed,  5 Feb 2020 20:04:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 076965DA75;
	Wed,  5 Feb 2020 20:04:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6ACA818089CD;
	Wed,  5 Feb 2020 20:04:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015K4Son022842 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 15:04:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 94F43859B3; Wed,  5 Feb 2020 20:04:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13E1284DB8;
	Wed,  5 Feb 2020 20:04:26 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id A44F22202E9; Wed,  5 Feb 2020 15:04:25 -0500 (EST)
Date: Wed, 5 Feb 2020 15:04:25 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200205200425.GF14544@redhat.com>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-3-vgoyal@redhat.com>
	<20200205183205.GB26711@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200205183205.GB26711@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com,
	dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: Re: [dm-devel] [PATCH 2/5] s390,
 dax: Add dax zero_page_range operation to dcssblk driver
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: vJIbA0k0MFGSZRkGRoYZtg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 05, 2020 at 10:32:05AM -0800, Christoph Hellwig wrote:
> > diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
> > index 63502ca537eb..f6709200bcd0 100644
> > --- a/drivers/s390/block/dcssblk.c
> > +++ b/drivers/s390/block/dcssblk.c
> > @@ -62,6 +62,7 @@ static const struct dax_operations dcssblk_dax_ops = {
> >  	.dax_supported = generic_fsdax_supported,
> >  	.copy_from_iter = dcssblk_dax_copy_from_iter,
> >  	.copy_to_iter = dcssblk_dax_copy_to_iter,
> > +	.zero_page_range = dcssblk_dax_zero_page_range,
> >  };
> >  
> >  struct dcssblk_dev_info {
> > @@ -941,6 +942,12 @@ dcssblk_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
> >  	return __dcssblk_direct_access(dev_info, pgoff, nr_pages, kaddr, pfn);
> >  }
> >  
> > +static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev,pgoff_t pgoff,
> > +				       unsigned offset, size_t len)
> > +{
> > +	return generic_dax_zero_page_range(dax_dev, pgoff, offset, len);
> > +}
> 
> Wouldn't this need a forward declaration?  Then again given that dcssblk
> is the only caller of generic_dax_zero_page_range we might as well merge
> the two.  If you want to keep the generic one it could be wired up to
> dcssblk_dax_ops directly, though.

Given dcssblk is the only user, I am inclined to get rid of genric
version. We can add one later if another user shows up.

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

