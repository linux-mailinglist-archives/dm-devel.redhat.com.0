Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 71D101B023D
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 09:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587366448;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lkns5J3hlnWQF5ivL+sThE+uuo38HzOthczkL5umrNI=;
	b=UhxRjA7S6i9xVFFeBwRUttVRkRQQc5DahUNUBbA/kb1lkd3kjIx4ai6gxX0jDQnJ++AZJr
	suh0SEiUQV+zf17qXXCYW5fE8c1Jni5LtwlJ2jsSIC52xm/shxdSEfP+WD7/qxfxiGSCF0
	k0lskdAoQsS8bR+cIqqnqC3ZSsPGjZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-vlTAh_wrPp-6WNSWZ0j0FQ-1; Mon, 20 Apr 2020 03:07:24 -0400
X-MC-Unique: vlTAh_wrPp-6WNSWZ0j0FQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72E7413FB;
	Mon, 20 Apr 2020 07:07:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 413935DA76;
	Mon, 20 Apr 2020 07:07:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C73C7938F6;
	Mon, 20 Apr 2020 07:07:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03JHnAlw014633 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Apr 2020 13:49:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 198762166B28; Sun, 19 Apr 2020 17:49:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 158C02166B27
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 17:49:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D477D8FF663
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 17:49:06 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [146.101.78.151]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-217-u5l_sa0fMZyLK-AuCkmvpg-1;
	Sun, 19 Apr 2020 13:49:04 -0400
X-MC-Unique: u5l_sa0fMZyLK-AuCkmvpg-1
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-213-laDLq3FfMbmzhrklnYYUyw-1; Sun, 19 Apr 2020 18:49:00 +0100
X-MC-Unique: laDLq3FfMbmzhrklnYYUyw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Sun, 19 Apr 2020 18:48:59 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Sun, 19 Apr 2020 18:48:59 +0100
From: David Laight <David.Laight@aculab.com>
To: "'Mikulas Patocka'" <mpatocka@redhat.com>
Thread-Topic: [PATCH] x86: introduce memcpy_flushcache_clflushopt
Thread-Index: AQHWFLZf1uwJ38llN06XsGw6srhIuah+3wRggAAQ2oCAAcfv8A==
Date: Sun, 19 Apr 2020 17:48:59 +0000
Message-ID: <8452b36a07b1440a8da6d4a1623858c1@AcuMS.aculab.com>
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
	<alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4grNHvyYEc4W6PkymhEJvLb17tXbC3JZdqvtFxmMZ8DCQ@mail.gmail.com>
	<alpine.LRH.2.02.2004090612320.27517@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4gpe8u=zNrRhvd9ioVNGbOJfRUXzFZuV--be6Hbj0xXtQ@mail.gmail.com>
	<alpine.LRH.2.02.2004170831530.16047@file01.intranet.prod.int.rdu2.redhat.com>
	<69c2e011c5814255926f309dd50e6d67@AcuMS.aculab.com>
	<alpine.LRH.2.02.2004181110160.30139@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2004181110160.30139@file01.intranet.prod.int.rdu2.redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03JHnAlw014633
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 03:06:56 -0400
Cc: Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [dm-devel] [PATCH] x86: introduce memcpy_flushcache_clflushopt
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Mikulas Patocka
> Sent: 18 April 2020 16:21
> 
> On Sat, 18 Apr 2020, David Laight wrote:
> 
> > From: Mikulas Patocka
> > > Sent: 17 April 2020 13:47
> > ...
> > > Index: linux-2.6/drivers/md/dm-writecache.c
> > > ===================================================================
> > > --- linux-2.6.orig/drivers/md/dm-writecache.c	2020-04-17 14:06:35.139999000 +0200
> > > +++ linux-2.6/drivers/md/dm-writecache.c	2020-04-17 14:06:35.129999000 +0200
> > > @@ -1166,7 +1166,10 @@ static void bio_copy_block(struct dm_wri
> > >  			}
> > >  		} else {
> > >  			flush_dcache_page(bio_page(bio));
> > > -			memcpy_flushcache(data, buf, size);
> > > +			if (likely(size > 512))
> > > +				memcpy_flushcache_clflushopt(data, buf, size);
> > > +			else
> > > +				memcpy_flushcache(data, buf, size);
> >
> > Hmmm... have you looked at how long clflush actually takes?
> > It isn't too bad if you just do a small number, but using it
> > to flush large buffers can be very slow.
> 
> Yes, I have. It's here:
> http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/pmem.txt
> 
> sequential write 8 + clflush	- 0.3 GB/s on nvdimm
> sequential write 8 + clflushopt - 1.6 GB/s on nvdimm
> sequential write-nt 8 bytes	- 1.3 GB/s on nvdimm

That table doesn't give enough information to be useful.
The cpu speed, memory speed and transfer lengths are all relevant.

> > I've an Ivy bridge system where the X-server process requests the
> > frame buffer be flushed out every 10 seconds (no idea why).
> > With my 2560x1440 monitor this takes over 3ms.
> >
> > This really needs a cond_resched() every few clflush instructions.
> >
> > 	David
> 
> AFAIK Ivy Bridge doesn't have clflushopt, it only has clflush. clflush
> only allows one outstanding cacle line flush, so it's very slow.
> clflushopt and clwb relaxed this restriction and there can be multiple
> cache-invalidation requests in flight until the user serializes it with
> the sfence instruction.

It isn't that simple.
While clflush on Ivybridge is slower than clflushopt on newer processors
both instructions are (relatively) fast for something like 16 or 32
iterations. After that they get much slower.
I can't remember where I found the relevant figures, even the ones I
found didn't show how large the transfers needed to be before the bytes/sec
became constant.

> The patch checks for clflushopt with
> "static_cpu_has(X86_FEATURE_CLFLUSHOPT)" and if it is not present, it
> falls back to non-temporal stores.

Ok, I was expecting you'd be falling back to clflush first.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

