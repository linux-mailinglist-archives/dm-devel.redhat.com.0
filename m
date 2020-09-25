Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EF0D927895D
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 15:21:37 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601040097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q1YRiXUFLWlQSAvVTXAvAQTmehP2jFEEbo/U2TBHEWY=;
	b=M4cpXh3TTuSNrB2lmeLnYktyJbGZhv7fSHicia0ozAHYbqNb8VIq0i+tAOSlToE2/u0kso
	R5bhPt8jdFpLk37nKB7f/TRDDdqm+kkld8KdMX6QaVBCewxf31tX43yzOTWl9x7qoDTkOX
	iT85X5iV4JQnKQTPjjuvnszm5A8zA7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-GfkKYE0uNiq4MYm7T5b3Ag-1; Fri, 25 Sep 2020 09:21:31 -0400
X-MC-Unique: GfkKYE0uNiq4MYm7T5b3Ag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 911A58015FA;
	Fri, 25 Sep 2020 13:21:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A77765D9F1;
	Fri, 25 Sep 2020 13:21:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D70778C7A3;
	Fri, 25 Sep 2020 13:21:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PDL1pq006009 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 09:21:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D5105C1D7; Fri, 25 Sep 2020 13:21:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ED245C1C2;
	Fri, 25 Sep 2020 13:20:58 +0000 (UTC)
Date: Fri, 25 Sep 2020 09:20:57 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200925132057.GA4245@redhat.com>
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<20200924165616.GA14650@redhat.com>
	<alpine.LRH.2.02.2009241306170.28814@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2009241410490.8544@file01.intranet.prod.int.rdu2.redhat.com>
	<20200924190755.GA15317@redhat.com>
	<alpine.LRH.2.02.2009250801070.3475@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2009250801070.3475@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 25 2020 at  8:04am -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> 
> 
> On Thu, 24 Sep 2020, Mike Snitzer wrote:
> 
> > On Thu, Sep 24 2020 at  2:12pm -0400,
> > Mikulas Patocka <mpatocka@redhat.com> wrote:
> > 
> > > 
> > > 
> > > On Thu, 24 Sep 2020, Mikulas Patocka wrote:
> > > 
> > > > 
> > > > 
> > > > On Thu, 24 Sep 2020, Mike Snitzer wrote:
> > > > 
> > > > > WAIT... Could it be that raid_io_hints _really_ meant to special case
> > > > > raid0 and raid10 -- due to their striping/splitting requirements!?
> > > > > So, not raid1 but raid0?
> > > > > 
> > > > > E.g.:
> > > > > 
> > > > > diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> > > > > index 56b723d012ac..6dca932d6f1d 100644
> > > > > --- a/drivers/md/dm-raid.c
> > > > > +++ b/drivers/md/dm-raid.c
> > > > > @@ -3730,10 +3730,10 @@ static void raid_io_hints(struct dm_target *ti,
> > > > > struct queue_limits *limits)
> > > > >         blk_limits_io_opt(limits, chunk_size_bytes *
> > > > > 	mddev_data_stripes(rs));
> > > > > 
> > > > >         /*
> > > > > -        * RAID1 and RAID10 personalities require bio splitting,
> > > > > -        * RAID0/4/5/6 don't and process large discard bios properly.
> > > > > +        * RAID0 and RAID10 personalities require bio splitting,
> > > > > +        * RAID1/4/5/6 don't and process large discard bios properly.
> > > > >          */
> > > > > -       if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> > > > > +       if (rs_is_raid0(rs) || rs_is_raid10(rs)) {
> > > > >                 limits->discard_granularity = chunk_size_bytes;
> > > > >                 limits->max_discard_sectors = rs->md.chunk_sectors;
> > > > >         }
> > > > > 
> > > > > Mike
> > > > 
> > > > Yes - that's an interesing point.
> > > > 
> > > > Mikulas
> > > 
> > > But raid0_handle_discard handles discards with arbitrary start/end 
> > > sectors.
> > > 
> > > So, we don't need to set discard_granularity for that.
> > 
> > OK, great, I've staged this:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.10&id=c1fda10e1123a37cf9d22740486cd66f43c47846
> > 
> > Thanks,
> > Mike
> 
> What if there are multiple targets for a device with different 
> discard_granularity - we would overwrite the settings made by another 
> target.
> 
> Should there be:
> 
> limits->discard_granularity = max(limits->discard_granularity, chunk_size_bytes);
> 
> or perhaps:
> 
> limits->discard_granularity = lcm_not_zero(limits->discard_granularity, chunk_size_bytes);

I'd go with max().  So I can fix up the stable@ patch to actually stack
the limits for raid10.

But it should be noted that there is this patch queued for Jens to pull
in (he actually _did_ pull the MD pull request but then rebased without
it):
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.10&id=828d14fd7a6cf

I haappened to have seized on it and will need to adjust given the
changes have been dropped at this point:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.10&id=dd29d4b556979dae3cb6460d019c36073af7a3fc

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

