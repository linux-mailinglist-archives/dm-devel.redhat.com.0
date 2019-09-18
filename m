Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B1062B6161
	for <lists+dm-devel@lfdr.de>; Wed, 18 Sep 2019 12:24:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E845486FC91;
	Wed, 18 Sep 2019 10:24:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9638660872;
	Wed, 18 Sep 2019 10:24:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8AADB1803517;
	Wed, 18 Sep 2019 10:24:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8IANuFL015218 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 06:23:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F59060A9F; Wed, 18 Sep 2019 10:23:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54AC460872;
	Wed, 18 Sep 2019 10:23:51 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x8IANohg030335; Wed, 18 Sep 2019 06:23:50 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x8IANoxE030331; Wed, 18 Sep 2019 06:23:50 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 18 Sep 2019 06:23:50 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Huaisheng HS1 Ye <yehs1@lenovo.com>
In-Reply-To: <HK2PR03MB4418CB96B9E7B640B8B9CFB192BB0@HK2PR03MB4418.apcprd03.prod.outlook.com>
Message-ID: <alpine.LRH.2.02.1909180621001.29703@file01.intranet.prod.int.rdu2.redhat.com>
References: <HK2PR03MB4418CB96B9E7B640B8B9CFB192BB0@HK2PR03MB4418.apcprd03.prod.outlook.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "prarit@redhat.com" <prarit@redhat.com>, Huaisheng Ye <yehs2007@zoho.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Tzu ting Yu1 <tyu1@lenovo.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm writecache: skip writecache_wait for pmem
	mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Wed, 18 Sep 2019 10:24:39 +0000 (UTC)



On Thu, 5 Sep 2019, Huaisheng HS1 Ye wrote:

> > -----Original Message-----
> > From: Mikulas Patocka <mpatocka@redhat.com>
> > Sent: Wednesday, September 4, 2019 11:36 PM
> > On Wed, 4 Sep 2019, Huaisheng HS1 Ye wrote:
> > 
> > >
> > > Hi Mikulas,
> > >
> > > Thanks for your reply, I see what you mean, but I can't agree with you.
> > >
> > > For pmem mode, this code path (writecache_flush) is much more hot than
> > > SSD mode. Because in the code, the AUTOCOMMIT_BLOCKS_PMEM has been
> > > defined to 64, which means if more than 64 blocks have been inserted
> > > to cache device, also called uncommitted, writecache_flush would be called.
> > > Otherwise, there is a timer callback function will be called every
> > > 1000 milliseconds.
> > >
> > > #define AUTOCOMMIT_BLOCKS_SSD		65536
> > > #define AUTOCOMMIT_BLOCKS_PMEM		64
> > > #define AUTOCOMMIT_MSEC			1000
> > >
> > > So when dm-writecache running in working mode, there are continuous
> > > WRITE operations has been mapped to writecache_map, writecache_flush
> > > will be used much more often than SSD mode.
> > >
> > > Cheers,
> > > Huaisheng Ye
> > 
> > So, you save one instruction cache line for every 64*4096 bytes written to
> > persistent memory.
> > 
> > If you insist on it, I can acknowledge it, but I think it is really an
> > over-optimization.
> > 
> > Acked-By: Mikulas Patocka <mpatocka@redhat.com>
> > 
> > Mikulas
> 
> Thanks for your Acked-by, I have learned so much from your code.
> 
> And I have another question about the LRU.
> 
> Current code only put the last written blocks into the front of list 
> wc->lru, READ hit doesn't affect the position of block in wc->lru. That 
> is to say, if a block has been written to cache device, even there would 
> be a lot of READ operation for that block next but without WRITE hit, 
> which still would flow to the end of wc->lru, and eventually it would be 
> written back.
> 
> I am not sure whether this behavior disobeys LRU principle or not. But 
> if this situation above appears, that would lead to some HOT blocks 
> (without WRITE hit) had been written back, even READ hit many times. Is 
> it worth submitting patch to adjust the position of blocks when READ 
> hit? Just a discussion, I want to know your design idea.
> 
> Cheers,
> Huaisheng Ye

The dm-writecache target is supposed to optimize writes, not reads. 
Normally, there won't be any reads following a write, because the data 
would be stored in the cache in RAM.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
