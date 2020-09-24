Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D37F3277755
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 19:01:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600966866;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NXuqCSnJxB9ieFp3Bt0katQg+VnjsSKoRnVmjwIWMeY=;
	b=gBhfNkzqyBVch/SX5cMLV6ZUgyNOOJYbLRT/4uLUUQTehAEXxUHJyAiFbxQ95BAgrKsEq2
	1iN3Wr6qO67GDBI2at3S6jVa9KXGlJ9qzfvs+x219c2ElgBW2dbSOQnjsqK7gjxLuQjMvE
	2ClbVB/nnHVWV+Gd/ihZzQIzQ6yOr/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-E3WPHsU6Mla2VuPi2Cbw4g-1; Thu, 24 Sep 2020 13:01:04 -0400
X-MC-Unique: E3WPHsU6Mla2VuPi2Cbw4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E297C80B71A;
	Thu, 24 Sep 2020 17:00:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA0CA19C66;
	Thu, 24 Sep 2020 17:00:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCE3B1826D2C;
	Thu, 24 Sep 2020 17:00:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OH0sWW020845 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 13:00:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 404135D9F3; Thu, 24 Sep 2020 17:00:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26CE75D9DD;
	Thu, 24 Sep 2020 17:00:47 +0000 (UTC)
Date: Thu, 24 Sep 2020 13:00:47 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: John Dorminy <jdorminy@redhat.com>
Message-ID: <20200924170047.GB14650@redhat.com>
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh87GLea=7_4qGuPhMj0WKnB-596HzkKQDafLirHiBpSzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMeeMh87GLea=7_4qGuPhMj0WKnB-596HzkKQDafLirHiBpSzQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] dm-raid: stack limits instead of overwriting them.
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24 2020 at 12:45pm -0400,
John Dorminy <jdorminy@redhat.com> wrote:

> I don't understand how this works...
> 
> Can chunk_size_bytes be 0? If not, how is discard_granularity being set to 0?

Yeah, I had same question.. see the reply I just sent in this thread:
https://www.redhat.com/archives/dm-devel/2020-September/msg00568.html

> I think also limits is local to the ti in question here, initialized
> by blk_set_stacking_limits() via dm-table.c, and therefore has only
> default values and not anything to do with the underlying queue. So
> setting discard_granularity=max(discard_granularity, chunk_size_bytes)
> doesn't seem like it should be working, unless I'm not understanding
> what it's there for...

You're reading the dm-table.c limits stacking wrong.  Of course DM stack
up the underlying device(s) limits ;)

> 
> And shouldn't melding in the target's desired io_hints into the
> existing queue limits be happening in blk_stack_limits() instead?
> (Also, it does lcm_not_zero() for stacking granularity, instead of
> max()...)
> 

DM core does do that, the .io_hints hook in the DM target is reserved
for when the target has additional constraints that blk_stack_limits()
didn't/couldn't factor in.

And blk_stack_limts() does use max() for discard_granularity.

Mike

> 
> On Thu, Sep 24, 2020 at 12:29 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> >
> > This patch fixes a warning WARN_ON_ONCE(!q->limits.discard_granularity).
> > The reason is that the function raid_io_hints overwrote
> > limits->discard_granularity with zero. We need to properly stack the
> > limits instead of overwriting them.
> >
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Cc: stable@vger.kernel.org
> >
> > ---
> >  drivers/md/dm-raid.c |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > Index: linux-2.6/drivers/md/dm-raid.c
> > ===================================================================
> > --- linux-2.6.orig/drivers/md/dm-raid.c 2020-09-24 18:16:45.000000000 +0200
> > +++ linux-2.6/drivers/md/dm-raid.c      2020-09-24 18:16:45.000000000 +0200
> > @@ -3734,8 +3734,8 @@ static void raid_io_hints(struct dm_targ
> >          * RAID0/4/5/6 don't and process large discard bios properly.
> >          */
> >         if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> > -               limits->discard_granularity = chunk_size_bytes;
> > -               limits->max_discard_sectors = rs->md.chunk_sectors;
> > +               limits->discard_granularity = max(limits->discard_granularity, chunk_size_bytes);
> > +               limits->max_discard_sectors = min_not_zero(limits->max_discard_sectors, (unsigned)rs->md.chunk_sectors);
> >         }
> >  }
> >
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

