Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8721827785A
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 20:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600971441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FX/HnCsJ/KF/yADyGRFgrY+Y0xtEjcqtBMkLo3Hx3Z4=;
	b=JU3lAG1aO7NJHnRdlJNs6cAYhmlnKXdQbgf02KgItjHCvTquucb3qYozi72FFekmpZFGYz
	2nBBKuvZiN5HqRLhRG/WsXsVIpA3jG9PEfMUzn2GCie5S1+P5OuYJMFPg1lIVvYN3lSI0W
	Sxi21+lw+nfj2k3AjIfKw1sjyol1zgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-jBptUbItNh2WLAGIIOtjNw-1; Thu, 24 Sep 2020 14:17:19 -0400
X-MC-Unique: jBptUbItNh2WLAGIIOtjNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D45ED186DD28;
	Thu, 24 Sep 2020 18:17:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E83E5D9D2;
	Thu, 24 Sep 2020 18:17:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82DA944A79;
	Thu, 24 Sep 2020 18:17:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OICmcf029019 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 14:12:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B16C85D9F1; Thu, 24 Sep 2020 18:12:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC4365D9D3;
	Thu, 24 Sep 2020 18:12:42 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OICgmF008783; Thu, 24 Sep 2020 14:12:42 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OICgbS008779; Thu, 24 Sep 2020 14:12:42 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 14:12:42 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <alpine.LRH.2.02.2009241306170.28814@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2009241410490.8544@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
	<20200924165616.GA14650@redhat.com>
	<alpine.LRH.2.02.2009241306170.28814@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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



On Thu, 24 Sep 2020, Mikulas Patocka wrote:

> 
> 
> On Thu, 24 Sep 2020, Mike Snitzer wrote:
> 
> > WAIT... Could it be that raid_io_hints _really_ meant to special case
> > raid0 and raid10 -- due to their striping/splitting requirements!?
> > So, not raid1 but raid0?
> > 
> > E.g.:
> > 
> > diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> > index 56b723d012ac..6dca932d6f1d 100644
> > --- a/drivers/md/dm-raid.c
> > +++ b/drivers/md/dm-raid.c
> > @@ -3730,10 +3730,10 @@ static void raid_io_hints(struct dm_target *ti,
> > struct queue_limits *limits)
> >         blk_limits_io_opt(limits, chunk_size_bytes *
> > 	mddev_data_stripes(rs));
> > 
> >         /*
> > -        * RAID1 and RAID10 personalities require bio splitting,
> > -        * RAID0/4/5/6 don't and process large discard bios properly.
> > +        * RAID0 and RAID10 personalities require bio splitting,
> > +        * RAID1/4/5/6 don't and process large discard bios properly.
> >          */
> > -       if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> > +       if (rs_is_raid0(rs) || rs_is_raid10(rs)) {
> >                 limits->discard_granularity = chunk_size_bytes;
> >                 limits->max_discard_sectors = rs->md.chunk_sectors;
> >         }
> > 
> > Mike
> 
> Yes - that's an interesing point.
> 
> Mikulas

But raid0_handle_discard handles discards with arbitrary start/end 
sectors.

So, we don't need to set discard_granularity for that.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

