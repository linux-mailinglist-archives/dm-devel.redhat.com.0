Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E561D2786A4
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 14:05:05 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601035505;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dhsKvCTPE/mIcDdXsoHfi0bleMOklxUCyDEe6YUD/gY=;
	b=bACS5+pnUbKS1rXTtZUSTXsoKVI8QzNP23wsyIQMCEUwWdM3kCoWP6j6sh7nlDVKB07t+A
	1ge97WEkNMkocrZRD/ZxT9P8JMCFSY7BY4Drv1yL78LmZDIRDI0hl/OEqNy6REOif6cDcT
	zA7vRDsKefbmZYLbRhGuh7UN3dHX3jI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-PP0WSzCAP9ijwquTdFqTKg-1; Fri, 25 Sep 2020 08:05:02 -0400
X-MC-Unique: PP0WSzCAP9ijwquTdFqTKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3383802B5C;
	Fri, 25 Sep 2020 12:04:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 708175D9E2;
	Fri, 25 Sep 2020 12:04:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA83C1826D2F;
	Fri, 25 Sep 2020 12:04:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PC4Sue024200 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 08:04:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A2CA761177; Fri, 25 Sep 2020 12:04:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86BE360C07;
	Fri, 25 Sep 2020 12:04:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08PC4Mt0004096; Fri, 25 Sep 2020 08:04:22 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08PC4MA2004092; Fri, 25 Sep 2020 08:04:22 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 25 Sep 2020 08:04:21 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200924190755.GA15317@redhat.com>
Message-ID: <alpine.LRH.2.02.2009250801070.3475@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<20200924165616.GA14650@redhat.com>
	<alpine.LRH.2.02.2009241306170.28814@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2009241410490.8544@file01.intranet.prod.int.rdu2.redhat.com>
	<20200924190755.GA15317@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 24 Sep 2020, Mike Snitzer wrote:

> On Thu, Sep 24 2020 at  2:12pm -0400,
> Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> > 
> > 
> > On Thu, 24 Sep 2020, Mikulas Patocka wrote:
> > 
> > > 
> > > 
> > > On Thu, 24 Sep 2020, Mike Snitzer wrote:
> > > 
> > > > WAIT... Could it be that raid_io_hints _really_ meant to special case
> > > > raid0 and raid10 -- due to their striping/splitting requirements!?
> > > > So, not raid1 but raid0?
> > > > 
> > > > E.g.:
> > > > 
> > > > diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> > > > index 56b723d012ac..6dca932d6f1d 100644
> > > > --- a/drivers/md/dm-raid.c
> > > > +++ b/drivers/md/dm-raid.c
> > > > @@ -3730,10 +3730,10 @@ static void raid_io_hints(struct dm_target *ti,
> > > > struct queue_limits *limits)
> > > >         blk_limits_io_opt(limits, chunk_size_bytes *
> > > > 	mddev_data_stripes(rs));
> > > > 
> > > >         /*
> > > > -        * RAID1 and RAID10 personalities require bio splitting,
> > > > -        * RAID0/4/5/6 don't and process large discard bios properly.
> > > > +        * RAID0 and RAID10 personalities require bio splitting,
> > > > +        * RAID1/4/5/6 don't and process large discard bios properly.
> > > >          */
> > > > -       if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> > > > +       if (rs_is_raid0(rs) || rs_is_raid10(rs)) {
> > > >                 limits->discard_granularity = chunk_size_bytes;
> > > >                 limits->max_discard_sectors = rs->md.chunk_sectors;
> > > >         }
> > > > 
> > > > Mike
> > > 
> > > Yes - that's an interesing point.
> > > 
> > > Mikulas
> > 
> > But raid0_handle_discard handles discards with arbitrary start/end 
> > sectors.
> > 
> > So, we don't need to set discard_granularity for that.
> 
> OK, great, I've staged this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.10&id=c1fda10e1123a37cf9d22740486cd66f43c47846
> 
> Thanks,
> Mike

What if there are multiple targets for a device with different 
discard_granularity - we would overwrite the settings made by another 
target.

Should there be:

limits->discard_granularity = max(limits->discard_granularity, chunk_size_bytes);

or perhaps:

limits->discard_granularity = lcm_not_zero(limits->discard_granularity, chunk_size_bytes);

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

