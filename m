Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 469C62BA67D
	for <lists+dm-devel@lfdr.de>; Fri, 20 Nov 2020 10:47:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605865665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JfhSzFCnJmCqJ6C7jBjjrwVStbMXh2ToivED519eKCo=;
	b=jJReg6MCYmJ+4WirKzK6Fo2HBTEZafcOVdhQb027AM5W1yurox75ht42cmIDKgdym/pC9x
	8CiHEXxFL2yJGXmuYCS94TPM07tB8TIEuvYbNheuFwAG8a9WTrQCsmMH8og7UyyoJLnCXA
	OUcJuTBovJxW/tNQ+YM4Hg2Wnpkymfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-2C6dygC6MhWTyY-iuiIW1g-1; Fri, 20 Nov 2020 04:47:41 -0500
X-MC-Unique: 2C6dygC6MhWTyY-iuiIW1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC86B1005E46;
	Fri, 20 Nov 2020 09:47:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97C4319725;
	Fri, 20 Nov 2020 09:47:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4C31180954D;
	Fri, 20 Nov 2020 09:47:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AK9lGZr026084 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 04:47:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 879E75C230; Fri, 20 Nov 2020 09:47:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA7A5C1D5;
	Fri, 20 Nov 2020 09:47:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0AK9l8cu000874; Fri, 20 Nov 2020 04:47:08 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0AK9l85p000870; Fri, 20 Nov 2020 04:47:08 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 20 Nov 2020 04:47:08 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: John Dorminy <jdorminy@redhat.com>
In-Reply-To: <CAMeeMh8uaZkOHGUsvfaM7Fyqov5wKNfCp_FfBy7S39EG3Ktc7w@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2011200443100.28876@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201118203127.GA30066@redhat.com>
	<20201118203408.GB30066@redhat.com>
	<fc7c4efd-0bb3-f023-19c6-54359d279ca8@redhat.com>
	<alpine.LRH.2.02.2011190810001.32672@file01.intranet.prod.int.rdu2.redhat.com>
	<20201119172807.GC1879@redhat.com>
	<alpine.LRH.2.02.2011191337180.588@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2011191517360.10231@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh8uaZkOHGUsvfaM7Fyqov5wKNfCp_FfBy7S39EG3Ktc7w@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <msnitzer@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	Marian Csontos <mcsontos@redhat.com>,
	linux-block <linux-block@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	David Teigland <teigland@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH] blk-settings: make sure that max_sectors is
 aligned on "logical_block_size" boundary.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 19 Nov 2020, John Dorminy wrote:

> Greetings;
> 
> Might I suggest using SECTOR_SIZE instead of 512? Or, perhaps, >>
> SECTOR_SHIFT instead of / 512.

Yes, that's a good point.

> I don't understand the three conditionals. I believe max_sectors is
> supposed to be <= min(max_dev_sectors, max_hw_sectors), but I don't
> understand why max_sectors being small should adjust max_hw_sectors
> and max_dev_sectors. Are the conditions perhaps supposed to be
> different, adjusting each max_*sectors up to at least PAGE_SIZE /
> SECTOR_SIZE?

I copied this pattern from blk_queue_max_hw_sectors. Perhaps, we could 
use:
	t->max_sectors = round_down(t->max_sectors, t->logical_block_size / 512);
	if (!t->max_sectors)
		t->max_sectors = t->logical_block_size / 512;
instead.

Jens, what do you think is better?

Mikulas

> Perhaps, like e.g. blk_queue_max_hw_sectors(), the
> conditionals should log if they are adjusting max_*sectors up to the
> minimum.
> 
> Thanks!
> 
> John Dorminy
> 
> On Thu, Nov 19, 2020 at 3:37 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> >
> > We get these I/O errors when we run md-raid1 on the top of dm-integrity on
> > the top of ramdisk:
> > device-mapper: integrity: Bio not aligned on 8 sectors: 0xff00, 0xff
> > device-mapper: integrity: Bio not aligned on 8 sectors: 0xff00, 0xff
> > device-mapper: integrity: Bio not aligned on 8 sectors: 0xffff, 0x1
> > device-mapper: integrity: Bio not aligned on 8 sectors: 0xffff, 0x1
> > device-mapper: integrity: Bio not aligned on 8 sectors: 0x8048, 0xff
> > device-mapper: integrity: Bio not aligned on 8 sectors: 0x8147, 0xff
> > device-mapper: integrity: Bio not aligned on 8 sectors: 0x8246, 0xff
> > device-mapper: integrity: Bio not aligned on 8 sectors: 0x8345, 0xbb
> >
> > The ramdisk device has logical_block_size 512 and max_sectors 255. The
> > dm-integrity device uses logical_block_size 4096 and it doesn't affect the
> > "max_sectors" value - thus, it inherits 255 from the ramdisk. So, we have
> > a device with max_sectors not aligned on logical_block_size.
> >
> > The md-raid device sees that the underlying leg has max_sectors 255 and it
> > will split the bios on 255-sector boundary, making the bios unaligned on
> > logical_block_size.
> >
> > In order to fix the bug, we round down max_sectors to logical_block_size.
> >
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Cc: stable@vger.kernel.org
> >
> > ---
> >  block/blk-settings.c |   10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > Index: linux-2.6/block/blk-settings.c
> > ===================================================================
> > --- linux-2.6.orig/block/blk-settings.c 2020-10-29 12:20:46.000000000 +0100
> > +++ linux-2.6/block/blk-settings.c      2020-11-19 21:20:18.000000000 +0100
> > @@ -591,6 +591,16 @@ int blk_stack_limits(struct queue_limits
> >                 ret = -1;
> >         }
> >
> > +       t->max_sectors = round_down(t->max_sectors, t->logical_block_size / 512);
> > +       if (t->max_sectors < PAGE_SIZE / 512)
> > +               t->max_sectors = PAGE_SIZE / 512;
> > +       t->max_hw_sectors = round_down(t->max_hw_sectors, t->logical_block_size / 512);
> > +       if (t->max_sectors < PAGE_SIZE / 512)
> > +               t->max_hw_sectors = PAGE_SIZE / 512;
> > +       t->max_dev_sectors = round_down(t->max_dev_sectors, t->logical_block_size / 512);
> > +       if (t->max_sectors < PAGE_SIZE / 512)
> > +               t->max_dev_sectors = PAGE_SIZE / 512;
> > +
> >         /* Discard alignment and granularity */
> >         if (b->discard_granularity) {
> >                 alignment = queue_limit_discard_alignment(b, start);
> >
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://www.redhat.com/mailman/listinfo/dm-devel
> >
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

