Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A561883F
	for <lists+dm-devel@lfdr.de>; Thu,  9 May 2019 12:20:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D25F81F11;
	Thu,  9 May 2019 10:20:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B43135D710;
	Thu,  9 May 2019 10:19:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CC4418089CB;
	Thu,  9 May 2019 10:19:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x49AJdE2026214 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 May 2019 06:19:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE1AA60CAD; Thu,  9 May 2019 10:19:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9457F60CAC;
	Thu,  9 May 2019 10:19:35 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x49AJYF3013638; Thu, 9 May 2019 06:19:34 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x49AJY96013635; Thu, 9 May 2019 06:19:34 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 9 May 2019 06:19:34 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20190508175350.GA29513@redhat.com>
Message-ID: <alpine.LRH.2.02.1905090552580.10009@file01.intranet.prod.int.rdu2.redhat.com>
References: <20190429125746.036036640@debian-a64.vm>
	<20190508175350.GA29513@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Ondrej Kozina <okozina@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>,
	dm-devel@redhat.com, Alasdair G Kergon <agk@redhat.com>,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 08/10] dm-integrity: add a bitmap mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 09 May 2019 10:20:02 +0000 (UTC)



On Wed, 8 May 2019, Mike Snitzer wrote:

> > +static struct bitmap_block_status *sector_to_bitmap_block(struct dm_integrity_c *ic, sector_t sector)
> > +{
> > +	unsigned bit = sector >> (ic->sb->log2_sectors_per_block + ic->log2_blocks_per_bitmap_bit);
> > +	unsigned bitmap_block = bit / (BITMAP_BLOCK_SIZE * 8);
> > +
> > +	BUG_ON(bitmap_block >= ic->n_bitmap_blocks);
> > +	return &ic->bbs[bitmap_block];
> > +}
> > +
> 
> Too many BUG()s and BUG_ON.  The BUG_ON could be left if you think it
> sufficiently unlikely.

The BUGs could only happen if there's a bug in the code. They can't happen 
on disk I/O errors or checksum errors.

> But in general I'd prefer factoring out an &error return but needing to
> check for such a return would slow things down.. so that's probably not
> an option.

Yes. I think it is not a good practice to write recovery code for 
situations that can't happen. Those spurious return codes will just make 
the code harder to understand.

> Maybe we just set a new 'invalid' flag and disallow all operations and
> fail IO?  Point is it is really bad to crash the system because
> dm-integrity lost its way.  Instead we should just mark the device
> invalid (like dm-snapshot does).
>
> Mike

It already has a flag "struct dm_integrity_c->failed" - but this is for 
unrecoverable I/O errors (such as journal errors), not for programming 
errors.

I suggest - if no one complains, you can let it be, if someone complains, 
you can just hide the BUGs behind "#ifdef CONFIG_BUG_ON_DATA_CORRUPTION".

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
