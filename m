Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9536A15464D
	for <lists+dm-devel@lfdr.de>; Thu,  6 Feb 2020 15:35:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580999729;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OqHs15U5d3Jx3bv4xFD3wKgKWvmWRHhTi24lFrhR40A=;
	b=HLzBF76pC7PDMsWPVHMzAI0nqWCiRGJVUhIGwzEJcD7OuNFGEjLLIcsWfMCX4uTVBb68uQ
	sooACX7YE/zintEFc5PXxlXWsxUnxLMsuF35xy447XWdApWRHUSaysJlse4WUWKYDpl6hd
	Rkp0hXDdkcLIJZitud1HDRjfAjCz3ow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-WJdWpj-pM0KPKyTEGKiRpQ-1; Thu, 06 Feb 2020 09:35:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68830185734E;
	Thu,  6 Feb 2020 14:35:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A007C1001B05;
	Thu,  6 Feb 2020 14:35:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E70518034E9;
	Thu,  6 Feb 2020 14:35:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016EYkCb026832 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 09:34:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D0DAA857B4; Thu,  6 Feb 2020 14:34:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B50089F00;
	Thu,  6 Feb 2020 14:34:44 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id D3A482202E9; Thu,  6 Feb 2020 09:34:43 -0500 (EST)
Date: Thu, 6 Feb 2020 09:34:43 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20200206143443.GB12036@redhat.com>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-2-vgoyal@redhat.com>
	<20200205183050.GA26711@infradead.org>
	<20200205200259.GE14544@redhat.com>
	<CAPcyv4iY=gw86UDLqpiCtathGXRUuxOMuU=unwxzA-cm=0x+Sg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iY=gw86UDLqpiCtathGXRUuxOMuU=unwxzA-cm=0x+Sg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: WJdWpj-pM0KPKyTEGKiRpQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Feb 05, 2020 at 04:40:44PM -0800, Dan Williams wrote:
> On Wed, Feb 5, 2020 at 12:03 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Wed, Feb 05, 2020 at 10:30:50AM -0800, Christoph Hellwig wrote:
> > > > +   /*
> > > > +    * There are no users as of now. Once users are there, fix dm code
> > > > +    * to be able to split a long range across targets.
> > > > +    */
> > >
> > > This comment confused me.  I think this wants to say something like:
> > >
> > >       /*
> > >        * There are now callers that want to zero across a page boundary as of
> > >        * now.  Once there are users this check can be removed after the
> > >        * device mapper code has been updated to split ranges across targets.
> > >        */
> >
> > Yes, that's what I wanted to say but I missed one line. Thanks. Will fix
> > it.
> >
> > >
> > > > +static int pmem_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> > > > +                               unsigned int offset, size_t len)
> > > > +{
> > > > +   int rc = 0;
> > > > +   phys_addr_t phys_pos = pgoff * PAGE_SIZE + offset;
> > >
> > > Any reason not to pass a phys_addr_t in the calling convention for the
> > > method and maybe also for dax_zero_page_range itself?
> >
> > I don't have any reason not to pass phys_addr_t. If that sounds better,
> > will make changes.
> 
> The problem is device-mapper. That wants to use offset to route
> through the map to the leaf device. If it weren't for the firmware
> communication requirement you could do:
> 
> dax_direct_access(...)
> generic_dax_zero_page_range(...)
> 
> ...but as long as the firmware error clearing path is required I think
> we need to do pass the pgoff through the interface and do the pgoff to
> virt / phys translation inside the ops handler.

Hi Dan,

Drivers can easily convert offset into dax device (say phys_addr_t) to
pgoff and offset into page, isn't it?

pgoff_t = phys_addr_t/PAGE_SIZE;
offset = phys_addr_t & (PAGE_SIZE - 1);

And pgoff can easily be converted into sectors which dm/md can use for
mapping and come up with pgoff in target device.

Anyway, I am fine with anything.

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

