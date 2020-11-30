Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 32E432C927A
	for <lists+dm-devel@lfdr.de>; Tue,  1 Dec 2020 00:25:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606778714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MIgUxvPVDbhq+X7JqwILTEvJpJ5FpnCY+LbEZ8UJtmA=;
	b=CYa4+7aK11MYDU6g4wj7vmhpHmqcm7BpnT7KhJKtDQ5b1MEAbOwGKtazD+q55acd+6sD//
	S8dEUP093MrL5DwcZRVIpqj2qTDAGrJJGZ/3dlgVjdu5cauS4oDh//o9PChVdqn7EwbPK2
	qlZ+HSxHA+WgijyS+sHd4LlBsxsadfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-z4vupj3aMGihCCDGujOuCQ-1; Mon, 30 Nov 2020 18:25:11 -0500
X-MC-Unique: z4vupj3aMGihCCDGujOuCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E6F08030B9;
	Mon, 30 Nov 2020 23:25:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8804B60C6A;
	Mon, 30 Nov 2020 23:25:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78CB3180954D;
	Mon, 30 Nov 2020 23:24:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AUNOQHm012782 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 18:24:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E644919D7D; Mon, 30 Nov 2020 23:24:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 884DB19C71;
	Mon, 30 Nov 2020 23:24:18 +0000 (UTC)
Date: Mon, 30 Nov 2020 18:24:17 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: John Dorminy <jdorminy@redhat.com>
Message-ID: <20201130232417.GA12865@redhat.com>
References: <20201130171805.77712-1-snitzer@redhat.com>
	<CAMeeMh8fb2JEBmuSuTP8ys6Xr+GpFqcUr5Py73W4wCQb1MCuAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMeeMh8fb2JEBmuSuTP8ys6Xr+GpFqcUr5Py73W4wCQb1MCuAw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linux-block <linux-block@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Bruce Johnston <bjohnsto@redhat.com>
Subject: Re: [dm-devel] block: revert to using min_not_zero() when stacking
	chunk_sectors
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 30 2020 at  3:51pm -0500,
John Dorminy <jdorminy@redhat.com> wrote:

> I don't think this suffices, as it allows IOs that span max(a,b) chunk
> boundaries.
> 
> Chunk sectors is defined as "if set, it will prevent merging across
> chunk boundaries". Pulling the example from the last change:

If you're going to cherry pick a portion of a commit header please
reference the commit id and use quotes or indentation to make it clear
what is being referenced, etc.

> It is possible, albeit more unlikely, for a block device to have a non
> power-of-2 for chunk_sectors (e.g. 10+2 RAID6 with 128K chunk_sectors,
> which results in a full-stripe size of 1280K. This causes the RAID6's
> io_opt to be advertised as 1280K, and a stacked device _could_ then be
> made to use a blocksize, aka chunk_sectors, that matches non power-of-2
> io_opt of underlying RAID6 -- resulting in stacked device's
> chunk_sectors being a non power-of-2).

This was from the header for commit 07d098e6bba ("block: allow
'chunk_sectors' to be non-power-of-2")

> Suppose the stacked device had a block size/chunk_sectors of 256k.

Quite the tangent just to setup an a toy example of say: thinp with 256K
blocksize/chunk_sectors ontop of a RAID6 with a chunk_sectors of 128K
and stripesize of 1280K.

> Then, with this change, some IOs issued by the stacked device to the
> RAID beneath could span 1280k sector boundaries, and require further
> splitting still.
> I think combining as the GCD is better, since any IO
> of size gcd(a,b) definitely spans neither a a-chunk nor a b-chunk
> boundary.

To be clear, you are _not_ saying using lcm_not_zero() is correct.
You're saying that simply reverting block core back to using
min_not_zero() may not be as good as using gcd().

While that may be true (not sure yet) you've now muddied a conservative
fix (that reverts block core back to its longstanding use of
min_not_zero for chunk_sectors) in pursuit of addressing some different
concern than the case that you _really_ care about getting fixed
(I'm inferring based on your regression report):
4K chunk_sectors stacked on larger chunk_sectors, e.g. 256K

My patch fixes the case and doesn't try to innovate, it tries to get
block core back to sane chunk_sectors stacking (which I broke).

> But it's possible I'm misunderstanding the purpose of chunk_sectors,
> or there should be a check that the one of the two devices' chunk
> sizes divides the other.

Seriously not amused by your response, I now have to do damage control
because you have a concern that you really weren't able to communicate
very effectively.

But I got this far, so for your above toy example (stacking 128K and
256K chunk_sectors):
min_not_zero = 128K
gcd = 128K

SO please explain to me why gcd() is better at setting a chunk_sectors
that ensures IO doesn't span 1280K stripesize (nevermind that
chunk_sectors has no meaningful relation to io_opt to begin with!).

Mike


> 
> On Mon, Nov 30, 2020 at 12:18 PM Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > chunk_sectors must reflect the most limited of all devices in the IO
> > stack.
> >
> > Otherwise malformed IO may result. E.g.: prior to this fix,
> > ->chunk_sectors = lcm_not_zero(8, 128) would result in
> > blk_max_size_offset() splitting IO at 128 sectors rather than the
> > required more restrictive 8 sectors.
> >
> > Fixes: 22ada802ede8 ("block: use lcm_not_zero() when stacking chunk_sectors")
> > Cc: stable@vger.kernel.org
> > Reported-by: John Dorminy <jdorminy@redhat.com>
> > Reported-by: Bruce Johnston <bjohnsto@redhat.com>
> > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > ---
> >  block/blk-settings.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/block/blk-settings.c b/block/blk-settings.c
> > index 9741d1d83e98..1d9decd4646e 100644
> > --- a/block/blk-settings.c
> > +++ b/block/blk-settings.c
> > @@ -547,7 +547,10 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
> >
> >         t->io_min = max(t->io_min, b->io_min);
> >         t->io_opt = lcm_not_zero(t->io_opt, b->io_opt);
> > -       t->chunk_sectors = lcm_not_zero(t->chunk_sectors, b->chunk_sectors);
> > +
> > +       if (b->chunk_sectors)
> > +               t->chunk_sectors = min_not_zero(t->chunk_sectors,
> > +                                               b->chunk_sectors);
> >
> >         /* Physical block size a multiple of the logical block size? */
> >         if (t->physical_block_size & (t->logical_block_size - 1)) {
> > --
> > 2.15.0
> >
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

