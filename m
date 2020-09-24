Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0FD62776AA
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 18:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600964757;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6s2l8nsvwO+MtvBuDkZphPI1c8bLC8RbwsHCRv/ek/o=;
	b=N3hq81CTekY/CJs9nScxwEzgtP/fb7e1we6fuIAFCjvFm7xK1LaigB4hF6mrL9DKMu1gaG
	QtkYaoUXpdZ+miv/rQJj7l/qY8jJomfUcJ3Vg6g4QzxgZYSFtqmIi/WVSxdA6+cGkr2NZk
	6dC3iJ/5LXz27dT5YBccqdBfwQR5qv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-kbunVA0bM9yzBa1pABrIAg-1; Thu, 24 Sep 2020 12:25:49 -0400
X-MC-Unique: kbunVA0bM9yzBa1pABrIAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B16AC85B67C;
	Thu, 24 Sep 2020 16:25:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 233CE60C04;
	Thu, 24 Sep 2020 16:25:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D7D31826D2B;
	Thu, 24 Sep 2020 16:25:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OGPXTq016331 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 12:25:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BA285C230; Thu, 24 Sep 2020 16:25:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B1475C22B;
	Thu, 24 Sep 2020 16:25:27 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OGPQem026030; Thu, 24 Sep 2020 12:25:26 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OGPQ34026024; Thu, 24 Sep 2020 12:25:26 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 12:25:26 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200924150034.GD13849@redhat.com>
Message-ID: <alpine.LRH.2.02.2009241224480.22728@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2009241032510.3485@file01.intranet.prod.int.rdu2.redhat.com>
	<20200924150034.GD13849@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] dm-table: set non-zero q->limits.discard_granularity
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 24 Sep 2020, Mike Snitzer wrote:

> On Thu, Sep 24 2020 at 10:34am -0400,
> Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> > Hi Mike
> > 
> > Could you send this to Linus before v5.9 is released?
> > 
> > Mikulas
> > 
> > 
> > 
> > From: Mikulas Patocka <mpatocka@redhat.com>
> > 
> > If q->limits.discard_granularity is zero, the block core will warn in
> > __blkdev_issue_discard. This patch sets it to a minimum - 512 bytes.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Fixes: b35fd7422c2f ("block: check queue's limits.discard_granularity in __blkdev_issue_discard()")
> > Fixes: 9b15d109a6b2 ("block: improve discard bio alignment in __blkdev_issue_discard()")
> > Fixes: c52abf563049 ("loop: Better discard support for block devices")
> > 
> > ---
> >  drivers/md/dm-table.c |    5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > Index: linux-2.6/drivers/md/dm-table.c
> > ===================================================================
> > --- linux-2.6.orig/drivers/md/dm-table.c	2020-08-31 12:08:27.000000000 +0200
> > +++ linux-2.6/drivers/md/dm-table.c	2020-09-24 16:23:55.000000000 +0200
> > @@ -1858,8 +1858,11 @@ void dm_table_set_restrictions(struct dm
> >  		q->limits.discard_granularity = 0;
> >  		q->limits.discard_alignment = 0;
> >  		q->limits.discard_misaligned = 0;
> > -	} else
> > +	} else {
> >  		blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
> > +		if (q->limits.discard_granularity < 512)
> > +			q->limits.discard_granularity = 512;
> > +	}
> >  
> >  	if (dm_table_supports_secure_erase(t))
> >  		blk_queue_flag_set(QUEUE_FLAG_SECERASE, q);
> 
> This patch is wrong, papers over something else.  Please identify what
> that something else is.
> 
> block core has _always_ cheecked if discard_granularity is non-zero to
> allow discards.
> 
> Why is q->limits.discard_granularity < 512 if discard is supported by
> the DM table and targets?
> 
> That shouldn't ever be.
> 
> Mike

OK

I'm sending another patch that changes the function raid_io_hints. This is 
where the zero came from.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

