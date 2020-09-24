Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7772777B3
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 19:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600968314;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JOdY5plIEd07qBrND3Q574S7Etj2Md7BpWyfPnheyjI=;
	b=UdMYQzQs//hOgQGZPU/2brH0MXsHf+r9rF7oeh7i4ZkT7giGhIaFyoQKZHZFM4rhzslczo
	TwHQBY2qRasYd5RUTnHEdLaxbGny/OgUrS+KhYVJLN1kawqWPW+wBEfEIbGRWiUi5tJKP2
	JbZit6c3DcgqJjOpwYs8HYm86lODOs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-PTmf2Ni_MAWQeO_WfgozUA-1; Thu, 24 Sep 2020 13:25:08 -0400
X-MC-Unique: PTmf2Ni_MAWQeO_WfgozUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AB19801001;
	Thu, 24 Sep 2020 17:25:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 043959CBA;
	Thu, 24 Sep 2020 17:25:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BDED1826D2B;
	Thu, 24 Sep 2020 17:24:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OHOp7B024481 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 13:24:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B3F42028DCC; Thu, 24 Sep 2020 17:24:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45621201EA97
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 17:24:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC7B080351F
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 17:24:48 +0000 (UTC)
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
	[209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-gV_-1LuqMfeAs1dkAgq5Tw-1; Thu, 24 Sep 2020 13:24:44 -0400
X-MC-Unique: gV_-1LuqMfeAs1dkAgq5Tw-1
Received: by mail-vk1-f199.google.com with SMTP id x17so37534vke.5
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 10:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=35kleeokna3RY1O3utdYLVIzJkeOwvWQcQhCZmaN0Kk=;
	b=ZDh3vOpYrq5bFJ0pXo0/et4Oq7eAiap1Mw9S1nXdsT/IN1cPZul/3QZsrsvnpR2Ycc
	5b+v/9m2qq1SaQU0ut3T5JOMR3P9Xvr3hFDJgdMQL4Jhx51rpFj+YVY6ixS8/jFZEd1Y
	ZjXokg4f2BK2aDiNsD0ivtqy+JN/D6hdRCwnRdWp2bysCRZrpVStQBvremoYWS+5I3yg
	s2xdVv7xC9i7LD5wn/uRV+JNgMiRR3EZ7tIn7YyrPDTkAdEQ6tJD+2H9guQ56WEfqVy2
	QrU4QOBeBEcP1nOzRoVvEmYuwISCbLnGnsGNn5t3HewKqWedVf9ByVcNgCzWVFRNNpyr
	yt5Q==
X-Gm-Message-State: AOAM533kSFASGvltVMf+Z+9NG52jJ0F/qaqaSZjztFrHrEouznPU5xn5
	uPPh1gJroaZuSyesJcUT++v+j7o1AWCf4h6SSGQcw0UIYNsBarjqo6smVNpgYn0TjaPj5vp+qbq
	jjX+m4TIBelVUs73xTtaNlgacrUVuyPA=
X-Received: by 2002:a67:c887:: with SMTP id v7mr158198vsk.49.1600968284172;
	Thu, 24 Sep 2020 10:24:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeVeuozWXyWT1IzZZXGyvrGYCtq2xDsMT2UM+hVpRbbDYfbYADeSM3GAToRSA5RLrFB12Crddm7d1GdIhfW3I=
X-Received: by 2002:a67:c887:: with SMTP id v7mr158171vsk.49.1600968283870;
	Thu, 24 Sep 2020 10:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh87GLea=7_4qGuPhMj0WKnB-596HzkKQDafLirHiBpSzQ@mail.gmail.com>
	<20200924170047.GB14650@redhat.com>
In-Reply-To: <20200924170047.GB14650@redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 24 Sep 2020 13:24:32 -0400
Message-ID: <CAMeeMh-KfeEFAZE9v_UiDx_TELg3twKg6Ayvbbaf=NwYJ-8Csg@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I am impressed at how much I read wrong...

On Thu, Sep 24, 2020 at 1:00 PM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Thu, Sep 24 2020 at 12:45pm -0400,
> John Dorminy <jdorminy@redhat.com> wrote:
>
> > I don't understand how this works...
> >
> > Can chunk_size_bytes be 0? If not, how is discard_granularity being set to 0?
>
> Yeah, I had same question.. see the reply I just sent in this thread:
> https://www.redhat.com/archives/dm-devel/2020-September/msg00568.html
>
> > I think also limits is local to the ti in question here, initialized
> > by blk_set_stacking_limits() via dm-table.c, and therefore has only
> > default values and not anything to do with the underlying queue. So
> > setting discard_granularity=max(discard_granularity, chunk_size_bytes)
> > doesn't seem like it should be working, unless I'm not understanding
> > what it's there for...
>
> You're reading the dm-table.c limits stacking wrong.  Of course DM stack
> up the underlying device(s) limits ;)

Yep, I failed to read iterate_devices...

>
> >
> > And shouldn't melding in the target's desired io_hints into the
> > existing queue limits be happening in blk_stack_limits() instead?
> > (Also, it does lcm_not_zero() for stacking granularity, instead of
> > max()...)
> >
>
> DM core does do that, the .io_hints hook in the DM target is reserved
> for when the target has additional constraints that blk_stack_limits()
> didn't/couldn't factor in.
Yes, I had erroneously thought the limit-stacking was after getting
the targets' individual limits, not before.

>
> And blk_stack_limts() does use max() for discard_granularity.
... I'm just terrible at reading this morning.

Thanks for pointing out all the things I misread!

>
> Mike
>
> >
> > On Thu, Sep 24, 2020 at 12:29 PM Mikulas Patocka <mpatocka@redhat.com> wrote:
> > >
> > > This patch fixes a warning WARN_ON_ONCE(!q->limits.discard_granularity).
> > > The reason is that the function raid_io_hints overwrote
> > > limits->discard_granularity with zero. We need to properly stack the
> > > limits instead of overwriting them.
> > >
> > > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > > Cc: stable@vger.kernel.org
> > >
> > > ---
> > >  drivers/md/dm-raid.c |    4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > Index: linux-2.6/drivers/md/dm-raid.c
> > > ===================================================================
> > > --- linux-2.6.orig/drivers/md/dm-raid.c 2020-09-24 18:16:45.000000000 +0200
> > > +++ linux-2.6/drivers/md/dm-raid.c      2020-09-24 18:16:45.000000000 +0200
> > > @@ -3734,8 +3734,8 @@ static void raid_io_hints(struct dm_targ
> > >          * RAID0/4/5/6 don't and process large discard bios properly.
> > >          */
> > >         if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> > > -               limits->discard_granularity = chunk_size_bytes;
> > > -               limits->max_discard_sectors = rs->md.chunk_sectors;
> > > +               limits->discard_granularity = max(limits->discard_granularity, chunk_size_bytes);
> > > +               limits->max_discard_sectors = min_not_zero(limits->max_discard_sectors, (unsigned)rs->md.chunk_sectors);
> > >         }
> > >  }
> > >
> > >
> > > --
> > > dm-devel mailing list
> > > dm-devel@redhat.com
> > > https://www.redhat.com/mailman/listinfo/dm-devel
> > >
> >
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

