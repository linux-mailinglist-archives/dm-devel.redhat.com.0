Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD6A9CD27
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 12:15:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78888C057F31;
	Mon, 26 Aug 2019 10:15:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A07B61001958;
	Mon, 26 Aug 2019 10:14:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98CA489CF;
	Mon, 26 Aug 2019 10:14:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7QAEdUN029503 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Aug 2019 06:14:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFA3E5D713; Mon, 26 Aug 2019 10:14:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 176AF5D70D;
	Mon, 26 Aug 2019 10:14:34 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x7QAEYO2012187; Mon, 26 Aug 2019 06:14:34 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x7QAEYuC012184; Mon, 26 Aug 2019 06:14:34 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 26 Aug 2019 06:14:34 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Damien Le Moal <Damien.LeMoal@wdc.com>
In-Reply-To: <BYAPR04MB58169660ACD5E6B68DBCB070E7A10@BYAPR04MB5816.namprd04.prod.outlook.com>
Message-ID: <alpine.LRH.2.02.1908260613330.12106@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1908260232180.7419@file01.intranet.prod.int.rdu2.redhat.com>
	<BYAPR04MB58169660ACD5E6B68DBCB070E7A10@BYAPR04MB5816.namprd04.prod.outlook.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] accessing invalid memory in "dm zoned:
 properly handle backing device failure"
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 26 Aug 2019 10:15:08 +0000 (UTC)



On Mon, 26 Aug 2019, Damien Le Moal wrote:

> On 2019/08/26 15:41, Mikulas Patocka wrote:
> > The patch 75d66ffb48efb30f2dd42f041ba8b39c5b2bd115 ("dm zoned: properly 
> > handle backing device failure") triggers a coverity warning:
> > 
> > *** CID 1452808:  Memory - illegal accesses  (USE_AFTER_FREE)
> > /drivers/md/dm-zoned-target.c: 137 in dmz_submit_bio()
> > 131             clone->bi_private = bioctx;
> > 132
> > 133             bio_advance(bio, clone->bi_iter.bi_size);
> > 134
> > 135             refcount_inc(&bioctx->ref);
> > 136             generic_make_request(clone);
> >>>>     CID 1452808:  Memory - illegal accesses  (USE_AFTER_FREE)
> >>>>     Dereferencing freed pointer "clone".
> > 137             if (clone->bi_status == BLK_STS_IOERR)
> > 138                     return -EIO;
> > 139
> > 140             if (bio_op(bio) == REQ_OP_WRITE && dmz_is_seq(zone))
> > 141                     zone->wp_block += nr_blocks;
> > 142
> > 
> > The "clone" bio may be processed and freed before the check 
> > "clone->bi_status == BLK_STS_IOERR" - so this check can access invalid 
> > memory.
> > 
> > Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> > Cc: stable@vger.kernel.org

We should also append this line:

Fixes: 75d66ffb48ef ("dm zoned: properly handle backing device failure")

Mikulas

> > ---
> >  drivers/md/dm-zoned-target.c |    2 --
> >  1 file changed, 2 deletions(-)
> > 
> > Index: linux-2.6/drivers/md/dm-zoned-target.c
> > ===================================================================
> > --- linux-2.6.orig/drivers/md/dm-zoned-target.c	2019-08-26 08:30:30.000000000 +0200
> > +++ linux-2.6/drivers/md/dm-zoned-target.c	2019-08-26 08:36:23.000000000 +0200
> > @@ -134,8 +134,6 @@ static int dmz_submit_bio(struct dmz_tar
> >  
> >  	refcount_inc(&bioctx->ref);
> >  	generic_make_request(clone);
> > -	if (clone->bi_status == BLK_STS_IOERR)
> > -		return -EIO;
> >  
> >  	if (bio_op(bio) == REQ_OP_WRITE && dmz_is_seq(zone))
> >  		zone->wp_block += nr_blocks;
> > 
> 
> Argh... Indeed. Thanks Mikulas.
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
> 
> -- 
> Damien Le Moal
> Western Digital Research
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
