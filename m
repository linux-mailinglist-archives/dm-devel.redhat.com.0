Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C014387894
	for <lists+dm-devel@lfdr.de>; Fri,  9 Aug 2019 13:30:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC92BC00A169;
	Fri,  9 Aug 2019 11:30:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2951960BAB;
	Fri,  9 Aug 2019 11:30:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC6D0180B536;
	Fri,  9 Aug 2019 11:30:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79BU4Sl003257 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 07:30:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66A0A194BB; Fri,  9 Aug 2019 11:30:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A74677E51;
	Fri,  9 Aug 2019 11:30:01 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x79BU1n9032319; Fri, 9 Aug 2019 07:30:01 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x79BU0Ct032315; Fri, 9 Aug 2019 07:30:01 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 9 Aug 2019 07:30:00 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Dave Chinner <david@fromorbit.com>
In-Reply-To: <20190809013403.GY7777@dread.disaster.area>
Message-ID: <alpine.LRH.2.02.1908090725290.31061@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1908080540240.15519@file01.intranet.prod.int.rdu2.redhat.com>
	<20190809013403.GY7777@dread.disaster.area>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 09 Aug 2019 11:30:30 +0000 (UTC)



On Fri, 9 Aug 2019, Dave Chinner wrote:

> And, FWIW, there's an argument to be made here that the underlying
> bug is dm_bufio_shrink_scan() blocking kswapd by waiting on IO
> completions while holding a mutex that other IO-level reclaim
> contexts require to make progress.
> 
> Cheers,
> 
> Dave.

The IO-level reclaim contexts should use GFP_NOIO. If the dm-bufio 
shrinker is called with GFP_NOIO, it cannot be blocked by kswapd, because:
* it uses trylock to acquire the mutex
* it doesn't attempt to free buffers that are dirty or under I/O (see 
  __try_evict_buffer)

I think that this logic is sufficient to prevent the deadlock.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
