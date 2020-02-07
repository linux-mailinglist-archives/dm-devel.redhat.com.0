Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id ECA63155C99
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 18:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581095228;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jUD7P5DE6535aNFDJR/+L9OMQC9bI47dRFulU+td3b8=;
	b=P0S161KTgiYdqEgU3X/dCrJrORsORCDMF6I0POWvruB0xo4k8EPjurZP5AdrlJotynguAR
	FYFvH1shm/PYyQSawrpD2ftJO290JqPXrnTuHeQqLFvigOR1I5chRsJSnRDeMO0BfGF9nS
	5F5cmNa5RpBnTuEAmUrvIzB6yzOyRc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-Th_zITJ_MLykgVip7js4Sg-1; Fri, 07 Feb 2020 12:07:04 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C48A51835A2A;
	Fri,  7 Feb 2020 17:06:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3419D790D7;
	Fri,  7 Feb 2020 17:06:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 874F618089CD;
	Fri,  7 Feb 2020 17:06:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017H6pts011178 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 12:06:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D876117C0C; Fri,  7 Feb 2020 17:06:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18E83D1D12
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 17:06:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C86D800211
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 17:06:49 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-26ezqkQ5NJKYpxGtaWNMCw-1; Fri, 07 Feb 2020 12:06:44 -0500
Received: by mail-oi1-f196.google.com with SMTP id l9so2654194oii.5
	for <dm-devel@redhat.com>; Fri, 07 Feb 2020 09:06:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zeTa1kMSEl3fLJZjvubhBF7lLU+TSysbdNVa6LXQMGs=;
	b=PkzVZUGIqJRxxjRamEu3441N1rIrVsOWtJrxsR2US6x/ktpHmZnxgOCjNYcAJkckhj
	3PwCXwxfVFLSRj7E+LaXoP6vqtZHRKBJuwjQCCh2cOznEe9ZV9DfaiqIT6+F9SNC+oPP
	cm8cdJJdY6sARrCCa2aMGZRpp/y/M5t7x2hlZkgsTIju2T8fG2VVopyBrF0gHMXdODA+
	AS+ng4ePTrXZ6bmKtPFqKu8wRwNSeIhJ9SynB4t5JkCt1Q++gewdvey1d9cO1gvQjfTM
	94szYYn/cD5GRo151zZgy9zqaI+3Nb2w/MCxBb1OkQ5Z0I91PFdcXzDlwhScCaIWC/Qj
	i15g==
X-Gm-Message-State: APjAAAUteyN9qryO0JcaaJqXjqJ1A014N0hsw/Uyk7qAWbaLPasgHDNJ
	f9ipzTLlyzpcjQCQ+T3vxSxMYl4LonhDJyNMAHyERoJl
X-Google-Smtp-Source: APXvYqyM78u7JQAugFgv5zZBfNuG8N7zn04ejIqfum6zEtPcj48HqoBLg00kLaeSxn3H7xzZslVIa+EkM26FbgU/wvs=
X-Received: by 2002:a05:6808:a83:: with SMTP id q3mr2851359oij.0.1581095203775;
	Fri, 07 Feb 2020 09:06:43 -0800 (PST)
MIME-Version: 1.0
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-2-vgoyal@redhat.com>
	<20200205183050.GA26711@infradead.org>
	<20200205200259.GE14544@redhat.com>
	<CAPcyv4iY=gw86UDLqpiCtathGXRUuxOMuU=unwxzA-cm=0x+Sg@mail.gmail.com>
	<20200206074142.GB28365@infradead.org>
	<CAPcyv4iTBTOuKjQX3eoojLM=Eai_pfARXmzpMAtgi5OWBHXvzQ@mail.gmail.com>
	<20200207170150.GC11998@redhat.com>
In-Reply-To: <20200207170150.GC11998@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 7 Feb 2020 09:06:32 -0800
Message-ID: <CAPcyv4g8jUhaKXhoh-1cvE4oi2v0JQcLrnFUW9zsRiC4F-7-zQ@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-MC-Unique: 26ezqkQ5NJKYpxGtaWNMCw-1
X-MC-Unique: Th_zITJ_MLykgVip7js4Sg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017H6pts011178
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 7, 2020 at 9:02 AM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Fri, Feb 07, 2020 at 08:57:39AM -0800, Dan Williams wrote:
> > On Wed, Feb 5, 2020 at 11:41 PM Christoph Hellwig <hch@infradead.org> wrote:
> > >
> > > On Wed, Feb 05, 2020 at 04:40:44PM -0800, Dan Williams wrote:
> > > > > I don't have any reason not to pass phys_addr_t. If that sounds better,
> > > > > will make changes.
> > > >
> > > > The problem is device-mapper. That wants to use offset to route
> > > > through the map to the leaf device. If it weren't for the firmware
> > > > communication requirement you could do:
> > > >
> > > > dax_direct_access(...)
> > > > generic_dax_zero_page_range(...)
> > > >
> > > > ...but as long as the firmware error clearing path is required I think
> > > > we need to do pass the pgoff through the interface and do the pgoff to
> > > > virt / phys translation inside the ops handler.
> > >
> > > Maybe phys_addr_t was the wrong type - but why do we split the offset
> > > into the block device argument into a pgoff and offset into page instead
> > > of a single 64-bit value?
> >
> > Oh, got it yes, that looks odd for sub-page zeroing. Yes, let's just
> > have one device relative byte-offset.
>
> So what's the best type to represent this offset. "u64" or "phys_addr_t"
> or "loff_t" or something else.  I like phys_addr_t followed by u64.

Let's make it u64.

phys_addr_t has already led to confusion in this thread because the
first question I ask when I read it is "why call ->direct_access() to
do the translation when you already have the physical address?".


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

