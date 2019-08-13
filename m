Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B27D8BEB4
	for <lists+dm-devel@lfdr.de>; Tue, 13 Aug 2019 18:36:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 779A530BF441;
	Tue, 13 Aug 2019 16:36:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18F8D805FE;
	Tue, 13 Aug 2019 16:36:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9847618005B9;
	Tue, 13 Aug 2019 16:36:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7DGZrrx013383 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 12:35:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D44010002B9; Tue, 13 Aug 2019 16:35:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D843C1000337;
	Tue, 13 Aug 2019 16:35:50 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x7DGZog1008729; Tue, 13 Aug 2019 12:35:50 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x7DGZoLu008726; Tue, 13 Aug 2019 12:35:50 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 13 Aug 2019 12:35:49 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Dave Chinner <david@fromorbit.com>
In-Reply-To: <20190809215733.GZ7777@dread.disaster.area>
Message-ID: <alpine.LRH.2.02.1908131231010.6852@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1908080540240.15519@file01.intranet.prod.int.rdu2.redhat.com>
	<20190809013403.GY7777@dread.disaster.area>
	<alpine.LRH.2.02.1908090725290.31061@file01.intranet.prod.int.rdu2.redhat.com>
	<20190809215733.GZ7777@dread.disaster.area>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: honglei.wang@oracle.com, Mike Snitzer <msnitzer@redhat.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	linux-kernel@vger.kernel.org, junxiao.bi@oracle.com,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] direct-io: use GFP_NOIO to avoid deadlock
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 13 Aug 2019 16:36:16 +0000 (UTC)



On Sat, 10 Aug 2019, Dave Chinner wrote:

> No, you misunderstand. I'm talking about blocking kswapd being
> wrong.  i.e. Blocking kswapd in shrinkers causes problems
> because th ememory reclaim code does not expect kswapd to be
> arbitrarily delayed by waiting on IO. We've had this problem with
> the XFS inode cache shrinker for years, and there are many reports
> of extremely long reclaim latencies for both direct and kswapd
> reclaim that result from kswapd not making progress while waiting
> in shrinkers for IO to complete.
> 
> The work I'm currently doing to fix this XFS problem can be found
> here:
> 
> https://lore.kernel.org/linux-fsdevel/20190801021752.4986-1-david@fromorbit.com/
> 
> 
> i.e. the point I'm making is that waiting for IO in kswapd reclaim
> context is considered harmful - kswapd context shrinker reclaim
> should be as non-blocking as possible, and any back-off to wait for
> IO to complete should be done by the high level reclaim core once
> it's completed an entire reclaim scan cycle of everything....
> 
> What follows from that, and is pertinent for in this situation, is
> that if you don't block kswapd, then other reclaim contexts are not
> going to get stuck waiting for it regardless of the reclaim context
> they use.
> 
> Cheers,
> 
> Dave.

So, what do you think the dm-bufio shrinker should do?

Currently it tries to free buffers on the clean list and if there are not 
enough buffers on the clean list, it goes into the dirty list - it writes 
the buffers back and then frees them.

What should it do? Should it just start writeback of the dirty list 
without waiting for it? What should it do if all the buffers are under 
writeback?

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
