Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BC2362C950A
	for <lists+dm-devel@lfdr.de>; Tue,  1 Dec 2020 03:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606788766;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GPhfzCt4/zrABsAGcAT02FmdrCwAiNjn6ScMwjRDLH8=;
	b=bHXmZbZgWUtNMCiW5k5d5gXjBahD9pwROnoiiQZpW88/EoeKgVX/pIemXtY0ANUBbLcHtm
	CWHu3t5kmYm38cvsQRrqgD7jZSlSXPdX18jsHPjXPgkHRLp2r130f4+naxSx9yJGx0/7A7
	5VTl66LJ0joAHHGk65CkYxOTfSTW0rA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-8MWsqD99NHqTSQGTpR6qHQ-1; Mon, 30 Nov 2020 21:12:44 -0500
X-MC-Unique: 8MWsqD99NHqTSQGTpR6qHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6C6C1005D61;
	Tue,  1 Dec 2020 02:12:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47AFC5D9C2;
	Tue,  1 Dec 2020 02:12:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F876180954D;
	Tue,  1 Dec 2020 02:12:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B12CEYV030718 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 21:12:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B0EB19D7C; Tue,  1 Dec 2020 02:12:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1F0919C48;
	Tue,  1 Dec 2020 02:12:07 +0000 (UTC)
Date: Mon, 30 Nov 2020 21:12:06 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: John Dorminy <jdorminy@redhat.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20201201021206.GB13735@redhat.com>
References: <20201130171805.77712-1-snitzer@redhat.com>
	<CAMeeMh8fb2JEBmuSuTP8ys6Xr+GpFqcUr5Py73W4wCQb1MCuAw@mail.gmail.com>
	<20201130232417.GA12865@redhat.com>
	<CAMeeMh9Ykqhc75VCSgLoj+hMpqBaV2uY7XvXUP1-FQdQLF49Ew@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMeeMh9Ykqhc75VCSgLoj+hMpqBaV2uY7XvXUP1-FQdQLF49Ew@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 30 2020 at  7:21pm -0500,
John Dorminy <jdorminy@redhat.com> wrote:

> > If you're going to cherry pick a portion of a commit header please
> > reference the commit id and use quotes or indentation to make it clear
> > what is being referenced, etc.
> Apologies.
> 
> > Quite the tangent just to setup an a toy example of say: thinp with 256K
> > blocksize/chunk_sectors ontop of a RAID6 with a chunk_sectors of 128K
> > and stripesize of 1280K.
> 
> I screwed up my math ... many apologies :/
> 
> Consider a thinp of chunk_sectors 512K atop a RAID6 with chunk_sectors 1280K.
> (Previously, this RAID6 would be disallowed because chunk_sectors
> could only be a power of 2, but 07d098e6bba removed this constraint.)

Think you have your example messed up still.  RAID 10+2 with 128K
chunk_sectors, 1280K full stripe (io_opt). Then thinp stacked ontop of
it with chunk_sectors of 1280K was usecase that wasn't supported before.

So stacked chunk_sectors = min_not_zero(128K, 1280K) = 128K

> -With lcm_not_zero(), a full-device IO would be split into 2560K IOs,
> which obviously spans both 512K and 1280K chunk boundaries.

Sure, think we both agree lcm_not_zero() shouldn't be used.

> -With min_not_zero(), a full-device IO would be split into 512K IOs,
> some of which would span 1280k chunk boundaries. For instance, one IO
> would span from offset 1024K to 1536K.

RAID6 with chunk_sectors of 1280K is pretty insane...
And yet you're saying full device IO is 1280K...
So something still isn't adding up.

Anyway, if we run with your example of chunk_sectors (512K, 1280K), yes
there is serious potential for IO to span the RAID6 layer's chunk_sector
boundary.

> -With the hypothetical gcd_not_zero(), a full-device IO would be split
> into 256K IOs, which span neither 512K nor 1280K chunk boundaries.

Yeap, I see.

> > To be clear, you are _not_ saying using lcm_not_zero() is correct.
> > You're saying that simply reverting block core back to using
> > min_not_zero() may not be as good as using gcd().
> 
> Assuming my understanding of chunk_sectors is correct -- which as per
> blk-settings.c seems to be "a driver will not receive a bio that spans
> a chunk_sector boundary, except in single-page cases" -- I believe
> using lcm_not_zero() and min_not_zero() can both violate this
> requirement. The current lcm_not_zero() is not correct, but also
> reverting block core back to using min_not_zero() leaves edge cases as
> above.

But your chunk_sectors (512K, 1280K) example is a misconfigured IO
stack.  Really not sure it worth being concerned about it.

> I believe gcd provides the requirement, but min_not_zero() +
> disallowing non-power-of-2 chunk_sectors also provides the
> requirement.

Kind of on the fence on this... think I'd like to get Martin's take.

Using gcd() instead of min_not_zero() to stack chunk_sectors isn't a big
deal; given the nature of chunk_sectors coupled with it being able to be
a non-power-of-2 _does_ add a new wrinkle.

So you had a valid point all along, just that you made me work pretty
hard to understand you.

> > > But it's possible I'm misunderstanding the purpose of chunk_sectors,
> > > or there should be a check that the one of the two devices' chunk
> > > sizes divides the other.
> >
> > Seriously not amused by your response, I now have to do damage control
> > because you have a concern that you really weren't able to communicate
> > very effectively.
> 
> Apologies.

Eh, I need to build my pain threshold back up.. been away from it all
for more than a week.. ;)

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

