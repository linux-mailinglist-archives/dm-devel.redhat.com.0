Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF888573
	for <lists+dm-devel@lfdr.de>; Sat, 10 Aug 2019 00:02:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8937D308FB9D;
	Fri,  9 Aug 2019 22:02:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BCA052FD;
	Fri,  9 Aug 2019 22:02:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53B442551C;
	Fri,  9 Aug 2019 22:02:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79LwlWd025073 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 17:58:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76E3D60F9F; Fri,  9 Aug 2019 21:58:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 412B360BF3;
	Fri,  9 Aug 2019 21:58:45 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246])
	by mx1.redhat.com (Postfix) with ESMTP id 09A0A65F66;
	Fri,  9 Aug 2019 21:58:44 +0000 (UTC)
Received: from dread.disaster.area (pa49-181-167-148.pa.nsw.optusnet.com.au
	[49.181.167.148])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 00E157E96C0;
	Sat, 10 Aug 2019 07:58:41 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92)
	(envelope-from <david@fromorbit.com>)
	id 1hwCtB-0000wW-Tv; Sat, 10 Aug 2019 07:57:33 +1000
Date: Sat, 10 Aug 2019 07:57:33 +1000
From: Dave Chinner <david@fromorbit.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20190809215733.GZ7777@dread.disaster.area>
References: <alpine.LRH.2.02.1908080540240.15519@file01.intranet.prod.int.rdu2.redhat.com>
	<20190809013403.GY7777@dread.disaster.area>
	<alpine.LRH.2.02.1908090725290.31061@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1908090725290.31061@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=FNpr/6gs c=1 sm=1 tr=0
	a=gu9DDhuZhshYSb5Zs/lkOA==:117 a=gu9DDhuZhshYSb5Zs/lkOA==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=FmdZ9Uzk2mMA:10
	a=VwQbUJbxAAAA:8 a=7-415B0cAAAA:8 a=pai4EEcvdAjdbTSEN-UA:9
	a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 09 Aug 2019 21:58:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 09 Aug 2019 21:58:44 +0000 (UTC) for IP:'211.29.132.246'
	DOMAIN:'mail104.syd.optusnet.com.au'
	HELO:'mail104.syd.optusnet.com.au' FROM:'david@fromorbit.com'
	RCPT:''
X-RedHat-Spam-Score: -0.698  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_NONE) 211.29.132.246 mail104.syd.optusnet.com.au
	211.29.132.246 mail104.syd.optusnet.com.au
	<david@fromorbit.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 09 Aug 2019 22:02:29 +0000 (UTC)

On Fri, Aug 09, 2019 at 07:30:00AM -0400, Mikulas Patocka wrote:
> 
> 
> On Fri, 9 Aug 2019, Dave Chinner wrote:
> 
> > And, FWIW, there's an argument to be made here that the underlying
> > bug is dm_bufio_shrink_scan() blocking kswapd by waiting on IO
> > completions while holding a mutex that other IO-level reclaim
> > contexts require to make progress.
> > 
> > Cheers,
> > 
> > Dave.
> 
> The IO-level reclaim contexts should use GFP_NOIO. If the dm-bufio 
> shrinker is called with GFP_NOIO, it cannot be blocked by kswapd, because:

No, you misunderstand. I'm talking about blocking kswapd being
wrong.  i.e. Blocking kswapd in shrinkers causes problems
because th ememory reclaim code does not expect kswapd to be
arbitrarily delayed by waiting on IO. We've had this problem with
the XFS inode cache shrinker for years, and there are many reports
of extremely long reclaim latencies for both direct and kswapd
reclaim that result from kswapd not making progress while waiting
in shrinkers for IO to complete.

The work I'm currently doing to fix this XFS problem can be found
here:

https://lore.kernel.org/linux-fsdevel/20190801021752.4986-1-david@fromorbit.com/


i.e. the point I'm making is that waiting for IO in kswapd reclaim
context is considered harmful - kswapd context shrinker reclaim
should be as non-blocking as possible, and any back-off to wait for
IO to complete should be done by the high level reclaim core once
it's completed an entire reclaim scan cycle of everything....

What follows from that, and is pertinent for in this situation, is
that if you don't block kswapd, then other reclaim contexts are not
going to get stuck waiting for it regardless of the reclaim context
they use.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
