Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4B0155C46
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 17:59:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581094759;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nsCpsbFBddBqUyzRR/QtOEdOWjaaZk3+KtZR+RYLzR0=;
	b=f4Ds6ENzLLk2/yHjWCWVEBWw90Fwot9WWfADa9npSoAtgXFNgXsdF2o3Lcop3eqDubFya6
	/jtfXRdbTYw+Qv0fmDLm91arCT9gigCZy3GD8wi0VQfV73Q8ffcg4wsjv1XlT9jarssNba
	qoYbRfaoBv9PkIT1hh6pb6AIJrzsxkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-BW9GFZ8SMOaDhFZ7T0FIbw-1; Fri, 07 Feb 2020 11:59:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B5E01857343;
	Fri,  7 Feb 2020 16:59:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3706F859A5;
	Fri,  7 Feb 2020 16:59:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23A5E18089CD;
	Fri,  7 Feb 2020 16:59:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017Gx3XR010772 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 11:59:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 11FDF2049CB5; Fri,  7 Feb 2020 16:59:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C9982093CE4
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 16:59:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84DAF802E43
	for <dm-devel@redhat.com>; Fri,  7 Feb 2020 16:59:00 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-375-fQ-CZDt_PZmvIufzxtdM3A-1; Fri, 07 Feb 2020 11:58:58 -0500
Received: by mail-ot1-f67.google.com with SMTP id z9so2794933oth.5
	for <dm-devel@redhat.com>; Fri, 07 Feb 2020 08:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8bcluL/nyB0VjYEVoSs9KiwWiRD7Dbfw+/1BJdMrk04=;
	b=cCKDpgBmdH3++9iDCxuvrWgqDWzEOzszDVp6Mtuqim2mCo30z7oaN88zOwUqdy7wWf
	uKYBTWv7j6wv9PtkAU47uNrtLKCnlIgC9gz3IsGsHOhTx3WgIOCitEP+ZTIKPhUuVLrG
	2Eum4WkOuamxFjAAIR+42oiungMNqcOOultNgu00aQD3ojE3UjCcDEuLpZJXZhDNf1ms
	BzdFsv3240TWFEd5FJYMkBBONq4GDb884XrNXFra8ppKF9/KmTplFe2sFQhlFGnc+Q42
	8eKqixma7C7FeBr7esKjhlRHyS9DlOshZLcBkmFfH3XsOJSj/vKHC1pP5H7z4MMaYXPG
	AWWA==
X-Gm-Message-State: APjAAAWbOieSEtu33IFw2dSRYqWTaUoABSOZnCB7i1xgCpI/JQ1u4GNZ
	CXV2EkxeU4pPKjn5vG+tEFV6p7GcQkfWBtLz+vPmORzl
X-Google-Smtp-Source: APXvYqw/6C4HAwNxaZVrwpTLMDnDTG++NB0iw0IEYHejzh7To9hof2jrUWdeK9OYAkgfD9kJ++NgZCvHPVbY0ouBQlw=
X-Received: by 2002:a9d:6f11:: with SMTP id n17mr251422otq.126.1581094737435; 
	Fri, 07 Feb 2020 08:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20200203200029.4592-1-vgoyal@redhat.com>
	<20200203200029.4592-2-vgoyal@redhat.com>
	<20200205183050.GA26711@infradead.org>
	<20200205200259.GE14544@redhat.com>
	<CAPcyv4iY=gw86UDLqpiCtathGXRUuxOMuU=unwxzA-cm=0x+Sg@mail.gmail.com>
	<20200206143443.GB12036@redhat.com>
In-Reply-To: <20200206143443.GB12036@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 7 Feb 2020 08:58:45 -0800
Message-ID: <CAPcyv4j_SN3cyeVfkVQBEniGBZ+XgmCx3ezBJ_KwiUpawaq40g@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-MC-Unique: fQ-CZDt_PZmvIufzxtdM3A-1
X-MC-Unique: BW9GFZ8SMOaDhFZ7T0FIbw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 017Gx3XR010772
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 6, 2020 at 6:35 AM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Wed, Feb 05, 2020 at 04:40:44PM -0800, Dan Williams wrote:
> > On Wed, Feb 5, 2020 at 12:03 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> > >
> > > On Wed, Feb 05, 2020 at 10:30:50AM -0800, Christoph Hellwig wrote:
> > > > > +   /*
> > > > > +    * There are no users as of now. Once users are there, fix dm code
> > > > > +    * to be able to split a long range across targets.
> > > > > +    */
> > > >
> > > > This comment confused me.  I think this wants to say something like:
> > > >
> > > >       /*
> > > >        * There are now callers that want to zero across a page boundary as of
> > > >        * now.  Once there are users this check can be removed after the
> > > >        * device mapper code has been updated to split ranges across targets.
> > > >        */
> > >
> > > Yes, that's what I wanted to say but I missed one line. Thanks. Will fix
> > > it.
> > >
> > > >
> > > > > +static int pmem_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
> > > > > +                               unsigned int offset, size_t len)
> > > > > +{
> > > > > +   int rc = 0;
> > > > > +   phys_addr_t phys_pos = pgoff * PAGE_SIZE + offset;
> > > >
> > > > Any reason not to pass a phys_addr_t in the calling convention for the
> > > > method and maybe also for dax_zero_page_range itself?
> > >
> > > I don't have any reason not to pass phys_addr_t. If that sounds better,
> > > will make changes.
> >
> > The problem is device-mapper. That wants to use offset to route
> > through the map to the leaf device. If it weren't for the firmware
> > communication requirement you could do:
> >
> > dax_direct_access(...)
> > generic_dax_zero_page_range(...)
> >
> > ...but as long as the firmware error clearing path is required I think
> > we need to do pass the pgoff through the interface and do the pgoff to
> > virt / phys translation inside the ops handler.
>
> Hi Dan,
>
> Drivers can easily convert offset into dax device (say phys_addr_t) to
> pgoff and offset into page, isn't it?

It's not a phys_addr_t it's a 64-bit device relative offset.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

