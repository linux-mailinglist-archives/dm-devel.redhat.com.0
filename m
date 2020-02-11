Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 861F415929A
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 16:12:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581433923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0QKVRT3GTFkv/mzcMrQXjjFNvFaR/T20BpvfynjeY0U=;
	b=bWH18TxStMDH49bdHh37STqD7/cDIaK46yr08CvgCdkzaTNWuqUf0BYFU6XpecLAlohqWT
	vOz5Dirmz43Kf7pCaNp9bGV7prZVXQgt1Cz31cHlCyj9vI+vCs9Yv0y7FiumGdACOPJvlL
	4PNndvsP3IB1JWprmrasrHVTIhnjcqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-awlyhEV2PSmsCtUoYdY3OQ-1; Tue, 11 Feb 2020 10:12:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D00B107ACC4;
	Tue, 11 Feb 2020 15:11:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 364BD9006C;
	Tue, 11 Feb 2020 15:11:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B6A98B2A1;
	Tue, 11 Feb 2020 15:11:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01BFBKuj004921 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 10:11:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E2E5165D3; Tue, 11 Feb 2020 15:11:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (ovpn-123-66.rdu2.redhat.com [10.10.123.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97B6C26FDB;
	Tue, 11 Feb 2020 15:11:14 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 48F50220A24; Tue, 11 Feb 2020 10:11:14 -0500 (EST)
Date: Tue, 11 Feb 2020 10:11:14 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Message-ID: <20200211151114.GA8590@redhat.com>
References: <20200207202652.1439-1-vgoyal@redhat.com>
	<20200207202652.1439-5-vgoyal@redhat.com>
	<20200210215315.27b7e310@thinkpad>
MIME-Version: 1.0
In-Reply-To: <20200210215315.27b7e310@thinkpad>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, linux-nvdimm@lists.01.org,
	vishal.l.verma@intel.com, hch@infradead.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com
Subject: Re: [dm-devel] [PATCH v3 4/7] s390, dcssblk,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: awlyhEV2PSmsCtUoYdY3OQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 10, 2020 at 09:53:15PM +0100, Gerald Schaefer wrote:
> On Fri,  7 Feb 2020 15:26:49 -0500
> Vivek Goyal <vgoyal@redhat.com> wrote:
> 
> > Add dax operation zero_page_range for dcssblk driver.
> > 
> > CC: linux-s390@vger.kernel.org
> > Suggested-by: Christoph Hellwig <hch@infradead.org>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  drivers/s390/block/dcssblk.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
> > index 63502ca537eb..331abab5d066 100644
> > --- a/drivers/s390/block/dcssblk.c
> > +++ b/drivers/s390/block/dcssblk.c
> > @@ -57,11 +57,28 @@ static size_t dcssblk_dax_copy_to_iter(struct dax_device *dax_dev,
> >  	return copy_to_iter(addr, bytes, i);
> >  }
> >  
> > +static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev, u64 offset,
> > +				       size_t len)
> > +{
> > +	long rc;
> > +	void *kaddr;
> > +	pgoff_t pgoff = offset >> PAGE_SHIFT;
> > +	unsigned page_offset = offset_in_page(offset);
> > +
> > +	rc = dax_direct_access(dax_dev, pgoff, 1, &kaddr, NULL);
> 
> Why do you pass only 1 page as nr_pages argument for dax_direct_access()?
> In some other patch in this series there is a comment that this will
> currently only be used for one page, but support for more pages might be
> added later. Wouldn't it make sense to rather use something like
> PAGE_ALIGN(page_offset + len) >> PAGE_SHIFT instead of 1 here, so that
> this won't have to be changed when callers will be ready to use it
> with more than one page?
> 
> Of course, I guess then we'd also need some check on the return value
> from dax_direct_access(), i.e. if the returned available range is
> large enough for the requested range.

I left it at 1 page because that's the current limitation of this
interface and there are no callers which are zeroing across page
boundaries.

I prefer to keep it this way and modify it when we are extending this
interface to allow zeroing across page boundaries. Because even if I add
that logic, I can't test it.

But if you still prefer to change it, I am open to make that change.

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

