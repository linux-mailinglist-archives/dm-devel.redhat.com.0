Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 17D2414B3B5
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jan 2020 12:45:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580211956;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nnb8vwV1Ly7CGbyh33Zk5h0ifzC0WCWEfqPvcWNEj6o=;
	b=PuBnCAqTVQgooQ6e40qtuDRObeuAgMGW9JSUb3iCwMO0ofw5iFfqe//5biY0cFNezbv5aj
	tt1rgNB3+smEgdl9kECEwu5jMYwLjOt975hvN8tLlGutAasVG974PxfnF2qu94WAuRKSOO
	cghxg1I0g7sYVp37ohQt2rA3L2qQ1Uo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-AUE866jnMuS3wkSD5YVD9Q-1; Tue, 28 Jan 2020 06:45:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E46F5800D4C;
	Tue, 28 Jan 2020 11:45:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B221F8E9E4;
	Tue, 28 Jan 2020 11:45:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 904E085974;
	Tue, 28 Jan 2020 11:45:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00SBj0Vn015748 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jan 2020 06:45:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8D5B72028DCC; Tue, 28 Jan 2020 11:45:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B8EA2026D67
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 11:44:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 245E7802069
	for <dm-devel@redhat.com>; Tue, 28 Jan 2020 11:44:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-290-WR3BnY0iMWywR1ETYLkRIA-1;
	Tue, 28 Jan 2020 06:44:54 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0283224684;
	Tue, 28 Jan 2020 11:44:52 +0000 (UTC)
Date: Tue, 28 Jan 2020 12:44:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200128114450.GA2672297@kroah.com>
References: <20180630201750.2588-1-andriy.shevchenko@linux.intel.com>
	<20180630201750.2588-4-andriy.shevchenko@linux.intel.com>
	<CA+G9fYs3GPid5fcHEWp2i9NKR1hQGc5h0zKaUK5xr1RGJ83xLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+G9fYs3GPid5fcHEWp2i9NKR1hQGc5h0zKaUK5xr1RGJ83xLg@mail.gmail.com>
X-MC-Unique: WR3BnY0iMWywR1ETYLkRIA-1
X-MC-Unique: AUE866jnMuS3wkSD5YVD9Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00SBj0Vn015748
X-loop: dm-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	mika.westerberg@linux.intel.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>,
	linux-raid@vger.kernel.org, dm-devel@redhat.com,
	Yury Norov <ynorov@caviumnetworks.com>,
	lkft-triage@lists.linaro.org, linux-input@vger.kernel.org,
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Shaohua Li <shli@kernel.org>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v4 3/5] bitmap: Add bitmap_alloc(),
 bitmap_zalloc() and bitmap_free()
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
Content-Disposition: inline

On Tue, Jan 28, 2020 at 05:08:27PM +0530, Naresh Kamboju wrote:
> On Sun, 1 Jul 2018 at 01:49, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > A lot of code become ugly because of open coding allocations for bitmaps.
> >
> > Introduce three helpers to allow users be more clear of intention
> > and keep their code neat.
> >
> > Note, due to multiple circular dependencies we may not provide
> > the helpers as inliners. For now we keep them exported and, perhaps,
> > at some point in the future we will sort out header inclusion and
> > inheritance.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  include/linux/bitmap.h |  8 ++++++++
> >  lib/bitmap.c           | 19 +++++++++++++++++++
> >  2 files changed, 27 insertions(+)
> >
> > diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> > index 1ee46f492267..acf5e8df3504 100644
> > --- a/include/linux/bitmap.h
> > +++ b/include/linux/bitmap.h
> > @@ -104,6 +104,14 @@
> >   * contain all bit positions from 0 to 'bits' - 1.
> >   */
> >
> > +/*
> > + * Allocation and deallocation of bitmap.
> > + * Provided in lib/bitmap.c to avoid circular dependency.
> > + */
> > +extern unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
> > +extern unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
> > +extern void bitmap_free(const unsigned long *bitmap);
> > +
> >  /*
> >   * lib/bitmap.c provides these functions:
> >   */
> > diff --git a/lib/bitmap.c b/lib/bitmap.c
> > index 33e95cd359a2..09acf2fd6a35 100644
> > --- a/lib/bitmap.c
> > +++ b/lib/bitmap.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/bitops.h>
> >  #include <linux/bug.h>
> >  #include <linux/kernel.h>
> > +#include <linux/slab.h>
> >  #include <linux/string.h>
> >  #include <linux/uaccess.h>
> >
> > @@ -1125,6 +1126,24 @@ void bitmap_copy_le(unsigned long *dst, const unsigned long *src, unsigned int n
> >  EXPORT_SYMBOL(bitmap_copy_le);
> >  #endif
> >
> > +unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags)
> > +{
> > +       return kmalloc_array(BITS_TO_LONGS(nbits), sizeof(unsigned long), flags);
> > +}
> > +EXPORT_SYMBOL(bitmap_alloc);
> > +
> > +unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags)
> > +{
> > +       return bitmap_alloc(nbits, flags | __GFP_ZERO);
> > +}
> > +EXPORT_SYMBOL(bitmap_zalloc);
> > +
> > +void bitmap_free(const unsigned long *bitmap)
> > +{
> > +       kfree(bitmap);
> > +}
> > +EXPORT_SYMBOL(bitmap_free);
> > +
> >  #if BITS_PER_LONG == 64
> >  /**
> >   * bitmap_from_arr32 - copy the contents of u32 array of bits to bitmap
> 
> stable-rc 4.14 build failed due to these build error,

Yeah, sorry, I noticed this right before I had to leave for a few hours.
I'll go fix this up now...

greg k-h


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

