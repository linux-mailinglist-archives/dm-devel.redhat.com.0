Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 89D44155C7D
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 18:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581095025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0hziBD2IN0+5fF0OoRk7HKICYBJqhplKg1EdHYSJpyU=;
	b=eS2F+VBxx0DbABG6aXwBfK5ykk2nL3Ntmvll0Ap2xKWTQRZ2xyqnzEvYii3YZ1cym21cpy
	ALgjfvJ3Z3fLd1wSwc4VwcSquI/G16HxSB79Jfh360eCmoxisZmjVtQFhHpg2kuBQNkxl0
	kx6oHTm8elFt5z+Q4npqKPWuR6WoAKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-wsiZrtcMM0SXCfreNJSYHg-1; Fri, 07 Feb 2020 12:03:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CDAB801A02;
	Fri,  7 Feb 2020 17:03:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2C9F60BF7;
	Fri,  7 Feb 2020 17:03:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09518866B3;
	Fri,  7 Feb 2020 17:03:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017H1rKQ010975 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 12:01:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 89820863A5; Fri,  7 Feb 2020 17:01:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B56C7859A5;
	Fri,  7 Feb 2020 17:01:50 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 46A67220A24; Fri,  7 Feb 2020 12:01:50 -0500 (EST)
Date: Fri, 7 Feb 2020 12:01:50 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20200207170150.GC11998@redhat.com>
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-2-vgoyal@redhat.com>
	<20200205183050.GA26711@infradead.org>
	<20200205200259.GE14544@redhat.com>
	<CAPcyv4iY=gw86UDLqpiCtathGXRUuxOMuU=unwxzA-cm=0x+Sg@mail.gmail.com>
	<20200206074142.GB28365@infradead.org>
	<CAPcyv4iTBTOuKjQX3eoojLM=Eai_pfARXmzpMAtgi5OWBHXvzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iTBTOuKjQX3eoojLM=Eai_pfARXmzpMAtgi5OWBHXvzQ@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wsiZrtcMM0SXCfreNJSYHg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Feb 07, 2020 at 08:57:39AM -0800, Dan Williams wrote:
> On Wed, Feb 5, 2020 at 11:41 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Wed, Feb 05, 2020 at 04:40:44PM -0800, Dan Williams wrote:
> > > > I don't have any reason not to pass phys_addr_t. If that sounds better,
> > > > will make changes.
> > >
> > > The problem is device-mapper. That wants to use offset to route
> > > through the map to the leaf device. If it weren't for the firmware
> > > communication requirement you could do:
> > >
> > > dax_direct_access(...)
> > > generic_dax_zero_page_range(...)
> > >
> > > ...but as long as the firmware error clearing path is required I think
> > > we need to do pass the pgoff through the interface and do the pgoff to
> > > virt / phys translation inside the ops handler.
> >
> > Maybe phys_addr_t was the wrong type - but why do we split the offset
> > into the block device argument into a pgoff and offset into page instead
> > of a single 64-bit value?
> 
> Oh, got it yes, that looks odd for sub-page zeroing. Yes, let's just
> have one device relative byte-offset.

So what's the best type to represent this offset. "u64" or "phys_addr_t"
or "loff_t" or something else.  I like phys_addr_t followed by u64.

Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

