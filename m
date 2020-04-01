Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDC219AF8F
	for <lists+dm-devel@lfdr.de>; Wed,  1 Apr 2020 18:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585757955;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i4i/VuAGJMzvvI3KbCY6flIhu2zDqtam07V5ZzHTmQQ=;
	b=fWkX8aaAEn4mFO4RP9LIaUPoi39Sm/QqhICQo8JjjRq0VudGneynANfwEDTRWgNOGaR9ml
	iQHG1sODbX4hVGbL1Ks/mQv/P/Rv0w19gQWzRhVfCuxtnhSTxr7BJktc4yLgJPbklTs1+g
	o/a6/tQA+R0PljZteiD7ec/LXPTdqH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-WVMEuWQUPeSA2eGC-qr00A-1; Wed, 01 Apr 2020 12:19:12 -0400
X-MC-Unique: WVMEuWQUPeSA2eGC-qr00A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C8AF800D53;
	Wed,  1 Apr 2020 16:19:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68E851001B0B;
	Wed,  1 Apr 2020 16:19:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9806180880B;
	Wed,  1 Apr 2020 16:19:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 031GEKfU015237 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Apr 2020 12:14:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50D94165F6; Wed,  1 Apr 2020 16:14:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (ovpn-115-83.rdu2.redhat.com [10.10.115.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B84419C70;
	Wed,  1 Apr 2020 16:14:17 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 9613D220005; Wed,  1 Apr 2020 12:14:16 -0400 (EDT)
Date: Wed, 1 Apr 2020 12:14:16 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20200401161416.GC9398@redhat.com>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-5-vgoyal@redhat.com>
	<CAPcyv4jKHxy5c8BZodePeCu5+Z=cwhtEfw3RnOD1ZDNob382bQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jKHxy5c8BZodePeCu5+Z=cwhtEfw3RnOD1ZDNob382bQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH v5 4/8] dax,
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
Content-Disposition: inline

On Tue, Mar 31, 2020 at 12:38:16PM -0700, Dan Williams wrote:
> On Tue, Feb 18, 2020 at 1:49 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > Add a dax operation zero_page_range, to zero a range of memory. This will
> > also clear any poison in the range being zeroed.
> >
> > As of now, zeroing of up to one page is allowed in a single call. There
> > are no callers which are trying to zero more than a page in a single call.
> > Once we grow the callers which zero more than a page in single call, we
> > can add that support. Primary reason for not doing that yet is that this
> > will add little complexity in dm implementation where a range might be
> > spanning multiple underlying targets and one will have to split the range
> > into multiple sub ranges and call zero_page_range() on individual targets.
> >
> > Suggested-by: Christoph Hellwig <hch@infradead.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  drivers/dax/super.c   | 19 +++++++++++++++++++
> >  drivers/nvdimm/pmem.c | 10 ++++++++++
> >  include/linux/dax.h   |  3 +++
> >  3 files changed, 32 insertions(+)
> >
> > diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> > index 0aa4b6bc5101..c912808bc886 100644
> > --- a/drivers/dax/super.c
> > +++ b/drivers/dax/super.c
> > @@ -344,6 +344,25 @@ size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
> >  }
> >  EXPORT_SYMBOL_GPL(dax_copy_to_iter);
> >
> > +int dax_zero_page_range(struct dax_device *dax_dev, u64 offset, size_t len)
> > +{
> > +       if (!dax_alive(dax_dev))
> > +               return -ENXIO;
> > +
> > +       if (!dax_dev->ops->zero_page_range)
> > +               return -EOPNOTSUPP;
> 
> This seems too late to be doing the validation. It would be odd for
> random filesystem operations to see this error. I would move the check
> to alloc_dax() and fail that if the caller fails to implement the
> operation.
> 
> An incremental patch on top to fix this up would be ok. Something like
> "Now that all dax_operations providers implement zero_page_range()
> mandate it at alloc_dax time".

Hi Dan,

Posted an extra patch in same patch series for this.

https://lore.kernel.org/linux-fsdevel/20200228163456.1587-1-vgoyal@redhat.com/T/#m624680cbb5e714266d4b34ade2d6c390dae69598

Vivek
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

