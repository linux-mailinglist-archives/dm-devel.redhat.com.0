Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AE7440586
	for <lists+dm-devel@lfdr.de>; Sat, 30 Oct 2021 00:33:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-wbcBHxdNMneSoOBz5bExTw-1; Fri, 29 Oct 2021 18:33:22 -0400
X-MC-Unique: wbcBHxdNMneSoOBz5bExTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05D811006AA3;
	Fri, 29 Oct 2021 22:33:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B24A5652AC;
	Fri, 29 Oct 2021 22:33:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC73D1806D03;
	Fri, 29 Oct 2021 22:33:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19TMWlqL023295 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 Oct 2021 18:32:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 579471121314; Fri, 29 Oct 2021 22:32:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 524691121315
	for <dm-devel@redhat.com>; Fri, 29 Oct 2021 22:32:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35FF1800883
	for <dm-devel@redhat.com>; Fri, 29 Oct 2021 22:32:43 +0000 (UTC)
Received: from mail109.syd.optusnet.com.au (mail109.syd.optusnet.com.au
	[211.29.132.80]) by relay.mimecast.com with ESMTP id
	us-mta-183-atdVRJDqOua3a8x-GqPPRQ-1; Fri, 29 Oct 2021 18:32:38 -0400
X-MC-Unique: atdVRJDqOua3a8x-GqPPRQ-1
Received: from dread.disaster.area (pa49-180-20-157.pa.nsw.optusnet.com.au
	[49.180.20.157])
	by mail109.syd.optusnet.com.au (Postfix) with ESMTPS id C472FFCC60F;
	Sat, 30 Oct 2021 09:32:34 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1mgaQL-002a5C-Gj; Sat, 30 Oct 2021 09:32:33 +1100
Date: Sat, 30 Oct 2021 09:32:33 +1100
From: Dave Chinner <david@fromorbit.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <20211029223233.GB449541@dread.disaster.area>
References: <20211021001059.438843-1-jane.chu@oracle.com>
	<YXFPfEGjoUaajjL4@infradead.org>
	<e89a2b17-3f03-a43e-e0b9-5d2693c3b089@oracle.com>
	<YXJN4s1HC/Y+KKg1@infradead.org>
	<2102a2e6-c543-2557-28a2-8b0bdc470855@oracle.com>
	<YXj2lwrxRxHdr4hb@infradead.org>
	<20211028002451.GB2237511@magnolia>
	<20211028225955.GA449541@dread.disaster.area>
	<22255117-52de-4b2d-822e-b4bc50bbc52b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <22255117-52de-4b2d-822e-b4bc50bbc52b@gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=e9dl9Yl/ c=1 sm=1 tr=0 ts=617c7683
	a=t5ERiztT/VoIE8AqcczM6g==:117 a=t5ERiztT/VoIE8AqcczM6g==:17
	a=kj9zAlcOel0A:10 a=8gfv0ekSlNoA:10 a=7-415B0cAAAA:8
	a=dKw9hyCRfQi49U3FdP0A:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jane Chu <jane.chu@oracle.com>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"dave.jiang@intel.com" <dave.jiang@intel.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"vgoyal@redhat.com" <vgoyal@redhat.com>,
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"dan.j.williams@intel.com" <dan.j.williams@intel.com>,
	"ira.weiny@intel.com" <ira.weiny@intel.com>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/6] dax poison recovery with
 RWF_RECOVERY_DATA flag
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 29, 2021 at 12:46:14PM +0100, Pavel Begunkov wrote:
> On 10/28/21 23:59, Dave Chinner wrote:
> [...]
> > > > Well, my point is doing recovery from bit errors is by definition not
> > > > the fast path.  Which is why I'd rather keep it away from the pmem
> > > > read/write fast path, which also happens to be the (much more important)
> > > > non-pmem read/write path.
> > > 
> > > The trouble is, we really /do/ want to be able to (re)write the failed
> > > area, and we probably want to try to read whatever we can.  Those are
> > > reads and writes, not {pre,f}allocation activities.  This is where Dave
> > > and I arrived at a month ago.
> > > 
> > > Unless you'd be ok with a second IO path for recovery where we're
> > > allowed to be slow?  That would probably have the same user interface
> > > flag, just a different path into the pmem driver.
> > 
> > I just don't see how 4 single line branches to propage RWF_RECOVERY
> > down to the hardware is in any way an imposition on the fast path.
> > It's no different for passing RWF_HIPRI down to the hardware *in the
> > fast path* so that the IO runs the hardware in polling mode because
> > it's faster for some hardware.
> 
> Not particularly about this flag, but it is expensive. Surely looks
> cheap when it's just one feature, but there are dozens of them with
> limited applicability, default config kernels are already sluggish
> when it comes to really fast devices and it's not getting better.
> Also, pretty often every of them will add a bunch of extra checks
> to fix something of whatever it would be.
> 
> So let's add a bit of pragmatism to the picture, if there is just one
> user of a feature but it adds overhead for millions of machines that
> won't ever use it, it's expensive.

Yup, you just described RWF_HIPRI! Seriously, Pavel, did you read
past this?  I'll quote what I said again, because I've already
addressed this argument to point out how silly it is:

> > IOWs, saying that we shouldn't implement RWF_RECOVERY because it
> > adds a handful of branches to the fast path is like saying that we
> > shouldn't implement RWF_HIPRI because it slows down the fast path
> > for non-polled IO....

 RWF_HIPRI functionality represents a *tiny* niche in the wider
Linux ecosystem, so by your reasoning it is too expensive to
implement because millions (billions!) of machines don't need or use
it. Do you now see how silly your argument is?

Seriously, this "optimise the IO fast path at the cost of everything
else" craziness has gotten out of hand. Nobody in the filesystem or
application world cares if you can do 10M IOPS per core when all the
CPU is doing is sitting in a tight loop inside the kernel repeatedly
overwriting data in the same memory buffers, essentially tossing the
old away the data without ever accessing it or doing anything with
it.  Such speed racer games are *completely meaningless* as an
optimisation goal - it's what we've called "benchmarketing" for a
couple of decades now.

If all we focus on is bragging rights because "bigger number is
always better", then we'll end up with iand IO path that looks like
the awful mess that the fs/direct-io.c turned into. That ended up
being hyper-optimised for CPU performance right down to single
instructions and cacheline load orders that the code became
extremely fragile and completely unmaintainable.

We ended up *reimplementing the direct IO code from scratch* so that
XFS could build and submit direct IO smarter and faster because it
simply couldn't be done to the old code.  That's how iomap came
about, and without *any optimisation at all* iomap was 20-30% faster
than the old, hyper-optimised fs/direct-io.c code.  IOWs, we always
knew we could do direct IO faster than fs/direct-io.c, but we
couldn't make the fs/direct-io.c faster because of the
hyper-optimisation of the code paths made it impossible to modify
and maintain.

The current approach of hyper-optimising the IO path for maximum
per-core IOPS at the expensive of everything else has been proven in
the past to be exactly the wrong approach to be taking for IO path
development. Yes, we need to be concerned about performance and work
to improve it, but we should not be doing that at the cost of
everything else that the IO stack needs to be able to do.

Fundamentally, optimisation is something we do *after* we provide
the functionality that is required; using "fast path optimisation"
as a blunt force implement to prevent new features from being
implemented is just ...  obnoxious.

> This one doesn't spill yet into paths I care about, but in general
> it'd be great if we start thinking more about such stuff instead of
> throwing yet another if into the path, e.g. by shifting the overhead
> from linear to a constant for cases that don't use it, for instance
> with callbacks or bit masks.

This is orthogonal to providing data recovery functionality.
If the claims that flag propagation is too expensive are true, then
fixing this problem this will also improve RWF_HIPRI performance
regardless of whether RWF_DATA_RECOVERY exists or not...

IOWs, *if* there is a fast path performance degradation as a result
of flag propagation, then *go measure it* and show us how much
impact it has on _real world applications_.  *Show us the numbers*
and document how much each additional flag propagation actually
costs so we can talk about whether it is acceptible, mitigation
strategies and/or alternative implementations.  Flag propagation
overhead is just not a valid reason for preventing us adding new
flags to the IO path. Fix the flag propagation overhead if it's a
problem for you, don't use it as an excuse for preventing people
from adding new functionality that uses flag propagation...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

