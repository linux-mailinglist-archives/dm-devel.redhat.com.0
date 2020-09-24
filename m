Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE7C2778F2
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 21:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600974498;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5QVtt2e8U4raSWYx+jzAphxDqMpFX1U2r1l24mnCELg=;
	b=NpV6w3ZTh6HyRO3K38uMcLu/GkmSCgUVL90E3an98n66UmUx7JK/N3N9Z7DEMUuupuvtDG
	U6RoLfmbNlfFQAxdhfabRU7FAIZAd5rz3d3Jo/t60rV2gUEj+RTF8R7h5tuuF87Z6Y8Yfu
	J2Qzj/j+w7wWNje4SoYp+gaIgxbEKxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-VPPB6dwGMsuhPs3nTOSKOA-1; Thu, 24 Sep 2020 15:08:15 -0400
X-MC-Unique: VPPB6dwGMsuhPs3nTOSKOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F335100670A;
	Thu, 24 Sep 2020 19:08:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBE1560CCC;
	Thu, 24 Sep 2020 19:08:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C5C244A47;
	Thu, 24 Sep 2020 19:08:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OJ7xSH002571 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 15:07:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 41475100164C; Thu, 24 Sep 2020 19:07:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E12B100238C;
	Thu, 24 Sep 2020 19:07:56 +0000 (UTC)
Date: Thu, 24 Sep 2020 15:07:55 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200924190755.GA15317@redhat.com>
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<20200924165616.GA14650@redhat.com>
	<alpine.LRH.2.02.2009241306170.28814@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2009241410490.8544@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2009241410490.8544@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24 2020 at  2:12pm -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> 
> 
> On Thu, 24 Sep 2020, Mikulas Patocka wrote:
> 
> > 
> > 
> > On Thu, 24 Sep 2020, Mike Snitzer wrote:
> > 
> > > WAIT... Could it be that raid_io_hints _really_ meant to special case
> > > raid0 and raid10 -- due to their striping/splitting requirements!?
> > > So, not raid1 but raid0?
> > > 
> > > E.g.:
> > > 
> > > diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> > > index 56b723d012ac..6dca932d6f1d 100644
> > > --- a/drivers/md/dm-raid.c
> > > +++ b/drivers/md/dm-raid.c
> > > @@ -3730,10 +3730,10 @@ static void raid_io_hints(struct dm_target *ti,
> > > struct queue_limits *limits)
> > >         blk_limits_io_opt(limits, chunk_size_bytes *
> > > 	mddev_data_stripes(rs));
> > > 
> > >         /*
> > > -        * RAID1 and RAID10 personalities require bio splitting,
> > > -        * RAID0/4/5/6 don't and process large discard bios properly.
> > > +        * RAID0 and RAID10 personalities require bio splitting,
> > > +        * RAID1/4/5/6 don't and process large discard bios properly.
> > >          */
> > > -       if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> > > +       if (rs_is_raid0(rs) || rs_is_raid10(rs)) {
> > >                 limits->discard_granularity = chunk_size_bytes;
> > >                 limits->max_discard_sectors = rs->md.chunk_sectors;
> > >         }
> > > 
> > > Mike
> > 
> > Yes - that's an interesing point.
> > 
> > Mikulas
> 
> But raid0_handle_discard handles discards with arbitrary start/end 
> sectors.
> 
> So, we don't need to set discard_granularity for that.

OK, great, I've staged this:

https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.10&id=c1fda10e1123a37cf9d22740486cd66f43c47846

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

