Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BB8D0EE
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 12:44:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 799693082E8E;
	Wed, 14 Aug 2019 10:44:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C57D7AB68;
	Wed, 14 Aug 2019 10:44:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA55618089C8;
	Wed, 14 Aug 2019 10:44:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EAiPei013193 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 06:44:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0BD718243; Wed, 14 Aug 2019 10:44:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F75A808DB;
	Wed, 14 Aug 2019 10:44:23 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246])
	by mx1.redhat.com (Postfix) with ESMTP id BFE952F3669;
	Wed, 14 Aug 2019 10:44:21 +0000 (UTC)
Received: from dread.disaster.area (pa49-195-190-67.pa.nsw.optusnet.com.au
	[49.195.190.67])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 9F7EB43D394;
	Wed, 14 Aug 2019 20:44:18 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92)
	(envelope-from <david@fromorbit.com>)
	id 1hxqkI-0001pY-Aq; Wed, 14 Aug 2019 20:43:10 +1000
Date: Wed, 14 Aug 2019 20:43:10 +1000
From: Dave Chinner <david@fromorbit.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20190814104310.GN6129@dread.disaster.area>
References: <alpine.LRH.2.02.1908080540240.15519@file01.intranet.prod.int.rdu2.redhat.com>
	<20190809013403.GY7777@dread.disaster.area>
	<alpine.LRH.2.02.1908090725290.31061@file01.intranet.prod.int.rdu2.redhat.com>
	<20190809215733.GZ7777@dread.disaster.area>
	<alpine.LRH.2.02.1908131231010.6852@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1908131231010.6852@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=D+Q3ErZj c=1 sm=1 tr=0
	a=TR82T6zjGmBjdfWdGgpkDw==:117 a=TR82T6zjGmBjdfWdGgpkDw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=FmdZ9Uzk2mMA:10
	a=VwQbUJbxAAAA:8 a=7-415B0cAAAA:8 a=B-2tCdbVYXm3Rcn1sc0A:9
	a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 14 Aug 2019 10:44:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Wed, 14 Aug 2019 10:44:22 +0000 (UTC) for IP:'211.29.132.246'
	DOMAIN:'mail104.syd.optusnet.com.au'
	HELO:'mail104.syd.optusnet.com.au' FROM:'david@fromorbit.com'
	RCPT:''
X-RedHat-Spam-Score: -0.698  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_NONE) 211.29.132.246 mail104.syd.optusnet.com.au
	211.29.132.246 mail104.syd.optusnet.com.au
	<david@fromorbit.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 14 Aug 2019 10:44:40 +0000 (UTC)

On Tue, Aug 13, 2019 at 12:35:49PM -0400, Mikulas Patocka wrote:
> 
> 
> On Sat, 10 Aug 2019, Dave Chinner wrote:
> 
> > No, you misunderstand. I'm talking about blocking kswapd being
> > wrong.  i.e. Blocking kswapd in shrinkers causes problems
> > because th ememory reclaim code does not expect kswapd to be
> > arbitrarily delayed by waiting on IO. We've had this problem with
> > the XFS inode cache shrinker for years, and there are many reports
> > of extremely long reclaim latencies for both direct and kswapd
> > reclaim that result from kswapd not making progress while waiting
> > in shrinkers for IO to complete.
> > 
> > The work I'm currently doing to fix this XFS problem can be found
> > here:
> > 
> > https://lore.kernel.org/linux-fsdevel/20190801021752.4986-1-david@fromorbit.com/
> > 
> > 
> > i.e. the point I'm making is that waiting for IO in kswapd reclaim
> > context is considered harmful - kswapd context shrinker reclaim
> > should be as non-blocking as possible, and any back-off to wait for
> > IO to complete should be done by the high level reclaim core once
> > it's completed an entire reclaim scan cycle of everything....
> > 
> > What follows from that, and is pertinent for in this situation, is
> > that if you don't block kswapd, then other reclaim contexts are not
> > going to get stuck waiting for it regardless of the reclaim context
> > they use.
> > 
> > Cheers,
> > 
> > Dave.
> 
> So, what do you think the dm-bufio shrinker should do?

I'm not familiar with the constraints the code operates under, so
I can't guarantee that I have an answer for you... :/

> Currently it tries to free buffers on the clean list and if there are not 
> enough buffers on the clean list, it goes into the dirty list - it writes 
> the buffers back and then frees them.
> 
> What should it do? Should it just start writeback of the dirty list 
> without waiting for it? What should it do if all the buffers are under 
> writeback?

For kswapd, it should do what it can without blocking. e.g. kicking
an async writer thread rather than submitting the IO itself. That's
what I changes XFS to do.

And if you look at the patchset in the above link, it also
introduced a mechanism for shrinkers to communicate back to the high
level reclaim code that kswapd needs to back off
(reclaim_state->need_backoff).

With these mechanism, the shrinker can start IO without blocking
kswapd on congested request queues and tell memory reclaim to wait
before calling this shrinker again. This allows kswapd to aggregate
all the waits that shrinkers and page reclaim require to all
progress to be made into a single backoff event. That means kswapd
does other scanning work while background writeback goes on, and
once everythign is scanned it does a single wait for everything that
needs time to make progress...

I think that should also work for the dm-bufio shrinker, and the the
direct reclaim backoff parts of the patchset should work for
non-blocking direct reclaim scanning as well, like it now does for
XFS.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
