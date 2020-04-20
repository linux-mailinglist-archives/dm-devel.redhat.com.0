Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5DB1B00D3
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 06:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587358254;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hCqw7VDhZv4tZIH4zlIQWw+ivtrks42AlhFv/2cKXr4=;
	b=QH55CZKw4Ntyiuytj4QDkCuOOzjGlk0+9ZF+BXxrEMiIjNUap3mg91kXEyo0uxWfoH8BMp
	X55NpzHmkZfNBfobLUJUFS0i5Sr+3OFG7hrCemXD09xbz632fgxpvk7b9t9zqrx0H8eM4F
	8iCoWOQM+m6akWtzMhB1PRBNZCBEo8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-krrYMIuxMw6gJt9c9YG6Qw-1; Mon, 20 Apr 2020 00:50:52 -0400
X-MC-Unique: krrYMIuxMw6gJt9c9YG6Qw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6598107B267;
	Mon, 20 Apr 2020 04:50:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D17292FA2;
	Mon, 20 Apr 2020 04:50:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51093938FF;
	Mon, 20 Apr 2020 04:50:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03K4nSuI021348 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 00:49:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB6142166B28; Mon, 20 Apr 2020 04:49:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C73D92166B27
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 04:49:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1674B101A55A
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 04:49:26 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-381-vxbhczzuPfKhlFZ_GZZDMg-1; Mon, 20 Apr 2020 00:49:17 -0400
X-MC-Unique: vxbhczzuPfKhlFZ_GZZDMg-1
Received: by mail-ej1-f66.google.com with SMTP id rh22so6795440ejb.12
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 21:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bYADXM3fnqTfOLHn4Df6MYywErUdtpTsT63FwdWOqRk=;
	b=U+Oy4i1J2uE4kB3bda50l07rSEN3YUqPRz6dJlC6ye6UJsSn8uDMw/obBUfCbGc4Sw
	4RoY7ykhJN4AXozenh/YTc7LLiF3ZusKI1n4zOc7GYSw/BTaktzds1tZFYONHafUvKFD
	JvrNXNQP5dCQRbcCPFmAFStJJBycF0krtZE3eeLx7B3nRfUnaWgEO/xU0RQfxlVEu3iD
	cGCAlfA5OFbKbQdT8OkTAYANQiN/5pK5Zl09vRGbPyNlCzxAvOzUv64OmOIEwqW3mfW3
	NVrMEgZKxitZWkBsh8sSQPUNZdnKO5z4rjCKOAnGjNpbj5iTJKKW0pT4j8b9o4yDY8il
	2UEg==
X-Gm-Message-State: AGi0PuZfzspgke5Pj2ewuWoy3TzN1dkUxKG0nPu+vTqeFc91oGc5TmvA
	Dpb7ZWPcIXYOHrQcRY5Rbs+HOxX5oBV6EC6BKaHFHOul
X-Google-Smtp-Source: APiQypJjK+fbgyqJBENqgkXJyIItyuRieCz/uLksLTOhvGqapOfk0h8cn5GHx2HeZyprYusoat++oP3HC9G0314tHNg=
X-Received: by 2002:a17:906:90cc:: with SMTP id
	v12mr14356816ejw.211.1587358155985; 
	Sun, 19 Apr 2020 21:49:15 -0700 (PDT)
MIME-Version: 1.0
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
	<8452b36a07b1440a8da6d4a1623858c1@AcuMS.aculab.com>
In-Reply-To: <8452b36a07b1440a8da6d4a1623858c1@AcuMS.aculab.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 19 Apr 2020 21:49:05 -0700
Message-ID: <CAPcyv4gP4gt7EF8q0hxSvENLATrK8ZEt3uQiUNh8zRNoJ_Ut6A@mail.gmail.com>
To: David Laight <David.Laight@aculab.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03K4nSuI021348
X-loop: dm-devel@redhat.com
Cc: Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Mikulas Patocka <mpatocka@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 19, 2020 at 10:49 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Mikulas Patocka
> > Sent: 18 April 2020 16:21
> >
> > On Sat, 18 Apr 2020, David Laight wrote:
> >
> > > From: Mikulas Patocka
> > > > Sent: 17 April 2020 13:47
> > > ...
> > > > Index: linux-2.6/drivers/md/dm-writecache.c
> > > > ===================================================================
> > > > --- linux-2.6.orig/drivers/md/dm-writecache.c     2020-04-17 14:06:35.139999000 +0200
> > > > +++ linux-2.6/drivers/md/dm-writecache.c  2020-04-17 14:06:35.129999000 +0200
> > > > @@ -1166,7 +1166,10 @@ static void bio_copy_block(struct dm_wri
> > > >                   }
> > > >           } else {
> > > >                   flush_dcache_page(bio_page(bio));
> > > > -                 memcpy_flushcache(data, buf, size);
> > > > +                 if (likely(size > 512))
> > > > +                         memcpy_flushcache_clflushopt(data, buf, size);
> > > > +                 else
> > > > +                         memcpy_flushcache(data, buf, size);
> > >
> > > Hmmm... have you looked at how long clflush actually takes?
> > > It isn't too bad if you just do a small number, but using it
> > > to flush large buffers can be very slow.
> >
> > Yes, I have. It's here:
> > http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/pmem.txt
> >
> > sequential write 8 + clflush  - 0.3 GB/s on nvdimm
> > sequential write 8 + clflushopt - 1.6 GB/s on nvdimm
> > sequential write-nt 8 bytes   - 1.3 GB/s on nvdimm
>
> That table doesn't give enough information to be useful.
> The cpu speed, memory speed and transfer lengths are all relevant.
>
> > > I've an Ivy bridge system where the X-server process requests the
> > > frame buffer be flushed out every 10 seconds (no idea why).
> > > With my 2560x1440 monitor this takes over 3ms.
> > >
> > > This really needs a cond_resched() every few clflush instructions.
> > >
> > >     David
> >
> > AFAIK Ivy Bridge doesn't have clflushopt, it only has clflush. clflush
> > only allows one outstanding cacle line flush, so it's very slow.
> > clflushopt and clwb relaxed this restriction and there can be multiple
> > cache-invalidation requests in flight until the user serializes it with
> > the sfence instruction.
>
> It isn't that simple.
> While clflush on Ivybridge is slower than clflushopt on newer processors
> both instructions are (relatively) fast for something like 16 or 32
> iterations. After that they get much slower.
> I can't remember where I found the relevant figures, even the ones I
> found didn't show how large the transfers needed to be before the bytes/sec
> became constant.
>
> > The patch checks for clflushopt with
> > "static_cpu_has(X86_FEATURE_CLFLUSHOPT)" and if it is not present, it
> > falls back to non-temporal stores.
>
> Ok, I was expecting you'd be falling back to clflush first.

clflush is a serializing instruction, clflushopt and non-temporal
stores are not.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

