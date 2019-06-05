Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE035CBB
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jun 2019 14:25:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0A0E33025E;
	Wed,  5 Jun 2019 12:24:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8780F600CC;
	Wed,  5 Jun 2019 12:23:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB4E91806B0F;
	Wed,  5 Jun 2019 12:23:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x55CM4YH008869 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Jun 2019 08:22:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3AD6601A5; Wed,  5 Jun 2019 12:22:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4935E600CC;
	Wed,  5 Jun 2019 12:22:00 +0000 (UTC)
Date: Wed, 5 Jun 2019 08:21:59 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Jiri Slaby <jslaby@suse.cz>
Message-ID: <20190605122159.GA32538@redhat.com>
References: <20190524031248.GA6295@zhanggen-UX430UQ>
	<79ec221d-6970-3b30-0660-4a288a4c465e@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79ec221d-6970-3b30-0660-4a288a4c465e@suse.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Gen Zhang <blackgod016574@gmail.com>, agk@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] dm-region-hash: Fix a missing-check bug in
	__rh_alloc()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 05 Jun 2019 12:25:17 +0000 (UTC)

On Wed, Jun 05 2019 at  2:05am -0400,
Jiri Slaby <jslaby@suse.cz> wrote:

> On 24. 05. 19, 5:12, Gen Zhang wrote:
> > In function __rh_alloc(), the pointer nreg is allocated a memory space
> > via kmalloc(). And it is used in the following codes. However, when 
> > there is a memory allocation error, kmalloc() fails. Thus null pointer
> > dereference may happen. And it will cause the kernel to crash. Therefore,
> > we should check the return value and handle the error.
> > Further, in __rh_find(), we should also check the return value and
> > handle the error.
> > 
> > Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
> > 
> > ---
> > diff --git a/drivers/md/dm-region-hash.c b/drivers/md/dm-region-hash.c
> > index 1f76045..2fa1641 100644
> > --- a/drivers/md/dm-region-hash.c
> > +++ b/drivers/md/dm-region-hash.c
> > @@ -290,8 +290,11 @@ static struct dm_region *__rh_alloc(struct dm_region_hash *rh, region_t region)
> >  	struct dm_region *reg, *nreg;
> >  
> >  	nreg = mempool_alloc(&rh->region_pool, GFP_ATOMIC);
> > -	if (unlikely(!nreg))
> > +	if (unlikely(!nreg)) {
> >  		nreg = kmalloc(sizeof(*nreg), GFP_NOIO | __GFP_NOFAIL);
> > +		if (!nreg)
> > +			return NULL;
> 
> What's the purpose of checking NO_FAIL allocations?

There isn't, that was already pointed out in a different thread for this
same patch (think patch was posted twice):
https://www.redhat.com/archives/dm-devel/2019-May/msg00124.html

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
