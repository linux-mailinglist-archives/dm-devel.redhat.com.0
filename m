Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 53D1B2778DE
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 21:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600974040;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fy0WQvAhkbA7x8VPKzhjCo3ZaBs0V6+mObtSXvwCO30=;
	b=JREGoApgZhiPxIu5TjcpNMT12daMD6nod0w/R3dzRFS5IFHtuSpyPOnZE2FieJLyeMjIWA
	IlcAT+Oea3sFTtdzRMHckcYAxTZiHQzEwwvnqhs5RuuGtrSnCu1YlD/qaqHDeVPq+MvDoZ
	GJBJjKyifwT+qFE6gQ6GM/VDnxz2+Pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-dHuVR0CqMdua_mgmOnoNvQ-1; Thu, 24 Sep 2020 15:00:36 -0400
X-MC-Unique: dHuVR0CqMdua_mgmOnoNvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51CE2188C126;
	Thu, 24 Sep 2020 19:00:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF7D41002D50;
	Thu, 24 Sep 2020 19:00:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13BB81826D2E;
	Thu, 24 Sep 2020 19:00:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OIumph001291 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 14:56:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 454A8109EF7B; Thu, 24 Sep 2020 18:56:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41471109EF72
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 18:56:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 832CD101AA42
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 18:56:44 +0000 (UTC)
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
	[209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-470-ESyue2bzOYK-Cn8HoB_44Q-1; Thu, 24 Sep 2020 14:56:42 -0400
X-MC-Unique: ESyue2bzOYK-Cn8HoB_44Q-1
Received: by mail-vk1-f199.google.com with SMTP id p196so91554vkp.22
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 11:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W0+gNm7gB8AxuxCr3EMCYcrAac7xYj4wsREmiAMGPu4=;
	b=liZ45gnNSz8h420gQXQebVusL7jLOYLsK3XJbKWfDDYXsPDul/+bWRKzkeT9YBi4Jb
	H4WMBfArwnRITs4oT9mTzuyNOgGG9uq3GVQsXLuuQkYkEwAZyn5LF1RZW2JSpdeBdnhJ
	NU5x570oy9svKLqNLR3AjmGO5vNdnpDCsnMMNp4GC2tiYojUb6YmGpNRJks5HXwXYt/d
	jSpZY1FrK7M6rKztGnHvxMI8dQWMmKUM1/l78Ru7fIXpb8TCDoRtLVBs4HogT77XqXYj
	czX+pIZx7ZlVc9/dOLmivE2r+v9SLs9rqO/Oa0YHtJHwapd3d/bZZZaaGUZHa1HatrhH
	ciQA==
X-Gm-Message-State: AOAM5324pXmTNcF+LY3X6Iez2IeLFEuFjJKNzskRvY2+ygo6elkwUahc
	7Ccu81GAJsqOcU5YK2wqI1fHaFyFv0kYBw0Il2/Bl8srD7hQWoraOxgi83yJMurmZ2SU+qZ/kLm
	xx0NChXpFsGOlNn7fjHuSC6N/jBqwi1E=
X-Received: by 2002:a67:c595:: with SMTP id h21mr636372vsk.12.1600973801994;
	Thu, 24 Sep 2020 11:56:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyTG/OU1bJDGtZ2nKzh3GrEpxlWFBB6t5X6dy2SZjH9Nerk+88q8oHCo5TGZ+eYvbzQbSYyDHG1t6LvZWrKc4=
X-Received: by 2002:a67:c595:: with SMTP id h21mr636358vsk.12.1600973801663;
	Thu, 24 Sep 2020 11:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh87GLea=7_4qGuPhMj0WKnB-596HzkKQDafLirHiBpSzQ@mail.gmail.com>
	<20200924170047.GB14650@redhat.com>
	<CAMeeMh-KfeEFAZE9v_UiDx_TELg3twKg6Ayvbbaf=NwYJ-8Csg@mail.gmail.com>
In-Reply-To: <CAMeeMh-KfeEFAZE9v_UiDx_TELg3twKg6Ayvbbaf=NwYJ-8Csg@mail.gmail.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 24 Sep 2020 14:56:30 -0400
Message-ID: <CAMeeMh-6kdN_73qc3uH_UVqbWyo07nWR8yhypVcboyXry-2N9A@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2020 at 1:24 PM John Dorminy <jdorminy@redhat.com> wrote:
>
> I am impressed at how much I read wrong...
>
> On Thu, Sep 24, 2020 at 1:00 PM Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > On Thu, Sep 24 2020 at 12:45pm -0400,
> > John Dorminy <jdorminy@redhat.com> wrote:
> >
> > > I don't understand how this works...
> > >
> > > Can chunk_size_bytes be 0? If not, how is discard_granularity being set to 0?
> >
> > Yeah, I had same question.. see the reply I just sent in this thread:
> > https://www.redhat.com/archives/dm-devel/2020-September/msg00568.html
> >
> > > I think also limits is local to the ti in question here, initialized
> > > by blk_set_stacking_limits() via dm-table.c, and therefore has only
> > > default values and not anything to do with the underlying queue. So
> > > setting discard_granularity=max(discard_granularity, chunk_size_bytes)
> > > doesn't seem like it should be working, unless I'm not understanding
> > > what it's there for...
> >
> > You're reading the dm-table.c limits stacking wrong.  Of course DM stack
> > up the underlying device(s) limits ;)
>
> Yep, I failed to read iterate_devices...
>
> >
> > >
> > > And shouldn't melding in the target's desired io_hints into the
> > > existing queue limits be happening in blk_stack_limits() instead?
> > > (Also, it does lcm_not_zero() for stacking granularity, instead of
> > > max()...)
> > >
> >
> > DM core does do that, the .io_hints hook in the DM target is reserved
> > for when the target has additional constraints that blk_stack_limits()
> > didn't/couldn't factor in.
> Yes, I had erroneously thought the limit-stacking was after getting
> the targets' individual limits, not before.
>
> >
> > And blk_stack_limts() does use max() for discard_granularity.
> ... I'm just terrible at reading this morning.
>
> Thanks for pointing out all the things I misread!

Actually, though, I don't understand why it should be max instead of
lcm_not_zero(). If the raid's chunk size is 1024 sectors, say, and
you're constructing it on something that has discard_granularity 812
sectors, say, blkdev_issue_discard will be generating 1024 sector IOs
which will work poorly when passed down to the 812-sector-granularity
underlying device. While, if lcm(812,1024) were used, lcm(812,1024)
sector IOs would be compatible with both the chunk size and underlying
device's granularity, perhaps? Maybe I'm missing something, but I read
the doc and code an extra time around this time ;)

>
> >
> > Mike
> >
> > >
> > > On Thu, Sep 24, 2020 at 12:29 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > > >
> > > > This patch fixes a warning WARN_ON_ONCE(!q->limits.discard_granularity).
> > > > The reason is that the function raid_io_hints overwrote
> > > > limits->discard_granularity with zero. We need to properly stack the
> > > > limits instead of overwriting them.
> > > >
> > > > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > > > Cc: stable@vger.kernel.org
> > > >
> > > > ---
> > > >  drivers/md/dm-raid.c |    4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > Index: linux-2.6/drivers/md/dm-raid.c
> > > > ===================================================================
> > > > --- linux-2.6.orig/drivers/md/dm-raid.c 2020-09-24 18:16:45.000000000 +0200
> > > > +++ linux-2.6/drivers/md/dm-raid.c      2020-09-24 18:16:45.000000000 +0200
> > > > @@ -3734,8 +3734,8 @@ static void raid_io_hints(struct dm_targ
> > > >          * RAID0/4/5/6 don't and process large discard bios properly.
> > > >          */
> > > >         if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> > > > -               limits->discard_granularity = chunk_size_bytes;
> > > > -               limits->max_discard_sectors = rs->md.chunk_sectors;
> > > > +               limits->discard_granularity = max(limits->discard_granularity, chunk_size_bytes);
> > > > +               limits->max_discard_sectors = min_not_zero(limits->max_discard_sectors, (unsigned)rs->md.chunk_sectors);
> > > >         }
> > > >  }
> > > >
> > > >
> > > > --
> > > > dm-devel mailing list
> > > > dm-devel@redhat.com
> > > > https://www.redhat.com/mailman/listinfo/dm-devel
> > > >
> > >
> >

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

