Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BE1E920E890
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 00:35:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-aZakRbqtPpGziit734xluw-1; Mon, 29 Jun 2020 18:34:59 -0400
X-MC-Unique: aZakRbqtPpGziit734xluw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53B80107ACCA;
	Mon, 29 Jun 2020 22:34:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 828EE19931;
	Mon, 29 Jun 2020 22:34:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEBA41809547;
	Mon, 29 Jun 2020 22:34:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TMYa6k011808 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 18:34:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 861659D78; Mon, 29 Jun 2020 22:34:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8263D10FAAC
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 22:34:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F5BF8EF3A1
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 22:34:34 +0000 (UTC)
Received: from mail107.syd.optusnet.com.au (mail107.syd.optusnet.com.au
	[211.29.132.53]) by relay.mimecast.com with ESMTP id
	us-mta-181-J7wR33a9MBmGOMEmAPANuQ-1; Mon, 29 Jun 2020 18:34:31 -0400
X-MC-Unique: J7wR33a9MBmGOMEmAPANuQ-1
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
	[49.180.53.24])
	by mail107.syd.optusnet.com.au (Postfix) with ESMTPS id AA1D8D5AC37;
	Tue, 30 Jun 2020 08:34:27 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1jq2Lq-0000hT-NA; Tue, 30 Jun 2020 08:34:10 +1000
Date: Tue, 30 Jun 2020 08:34:10 +1000
From: Dave Chinner <david@fromorbit.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200629223410.GK2005@dread.disaster.area>
References: <20200625113122.7540-1-willy@infradead.org>
	<alpine.LRH.2.02.2006261058250.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626230847.GI2005@dread.disaster.area>
	<alpine.LRH.2.02.2006270848540.14350@file01.intranet.prod.int.rdu2.redhat.com>
	<20200629003550.GJ2005@dread.disaster.area>
	<alpine.LRH.2.02.2006290918030.11293@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006290918030.11293@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
	a=kj9zAlcOel0A:10 a=nTHF0DUjJn0A:10 a=VwQbUJbxAAAA:8 a=7-415B0cAAAA:8
	a=kwWbjxPo83IwENs2kycA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
	a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/6] Overhaul memalloc_no*
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 29, 2020 at 09:43:23AM -0400, Mikulas Patocka wrote:
> On Mon, 29 Jun 2020, Dave Chinner wrote:
> > On Sat, Jun 27, 2020 at 09:09:09AM -0400, Mikulas Patocka wrote:
> > > On Sat, 27 Jun 2020, Dave Chinner wrote:
> > > > On Fri, Jun 26, 2020 at 11:02:19AM -0400, Mikulas Patocka wrote:
> > > > > Hi
> > > > > 
> > > > > I suggest to join memalloc_noio and memalloc_nofs into just one flag that 
> > > > > prevents both filesystem recursion and i/o recursion.
> > > > > 
> > > > > Note that any I/O can recurse into a filesystem via the loop device, thus 
> > > > > it doesn't make much sense to have a context where PF_MEMALLOC_NOFS is set 
> > > > > and PF_MEMALLOC_NOIO is not set.
> > > > 
> > > > Correct me if I'm wrong, but I think that will prevent swapping from
> > > > GFP_NOFS memory reclaim contexts.
> > > 
> > > Yes.
> > > 
> > > > IOWs, this will substantially
> > > > change the behaviour of the memory reclaim system under sustained
> > > > GFP_NOFS memory pressure. Sustained GFP_NOFS memory pressure is
> > > > quite common, so I really don't think we want to telling memory
> > > > reclaim "you can't do IO at all" when all we are trying to do is
> > > > prevent recursion back into the same filesystem.
> > > 
> > > So, we can define __GFP_ONLY_SWAP_IO and __GFP_IO.
> > 
> > Uh, why?
> > 
> > Exactly what problem are you trying to solve here?
> 
> This:
> 
> 1. The filesystem does a GFP_NOFS allocation.
> 2. The allocation calls directly a dm-bufio shrinker.
> 3. The dm-bufio shrinker sees that there is __GFP_IO set, so it assumes 
>    that it can do I/O. It selects some dirty buffers, writes them back and 
>    waits for the I/O to finish.

And so you are doing IO in a GFP_NOFS context because someone thought
the block layer can't recurse back into filesystems? That's a broken
assumption and has been since the loop device was introduced over a
couple of decades ago. I mean, the dm-bufio IO submission path uses
GFP_NOIO for obvious reasons, but once it's in the next device down
it loses all control of the submission context.

This is what I mean about "looking at reclaim contexts above the
current layer is a Big Red Flag"? The fundamental assumption of
dm-bufio that it can issue IO in GFP_NOFS context and not have a
lower layer recurse back into a filesystem has always been
incorrect. Just because the loop device now does GFP_NOIO
allocation, that doesn't mean what dm-bufio is doing in this
shrinker is correct or valid.

Because, as you point out:

> 4. The dirty buffers belong to a loop device.
> 5. The loop device thread calls the filesystem that did the GFP_NOFS 
>    allocation in step 1 (and that is still waiting for the allocation to 
>    succeed).
> Note that setting PF_MEMALLOC_NOIO on the loop thread won't help with this 
> deadlock.

Right, re-entering the filesystem might block on a lock, IO, memory
allocation, journal space reservation, etc. Indeed, it might not
even be able to issue transactions because the allocating context is
using GFP_NOFS because it is already running a transaction.

> Do you argue that this is a bug in dm-bufio? Or a bug in the kernel? Or 
> that it can't happen?

That's a bug in dm-bufio - dm is a layered block device and so has
_always_ been able to have filesystems both above and below
it in the storage stack. i.e. the assumption that there is no
filesystem context under the DM layers has always been wrong.

i.e. the memory reclaim context specfically directed dm-bufio that
whatever the shrinker does, it must not recurse into the filesystem
layer. It is the responsibility of the shrinker to obey the
constraints it was given by memory reclaim, and the dm-bufio
shrinker's assumption that there cannot be a filesystem below the DM
device violates this directive because, quite clearly, there can be
filesystems underneath DM devices.

IOWs, assuming that you can issue and block on IO from a -layered
block device- in GFP_NOFS shrinker context is flawed.  i.e. Anything
that presents as a block device that is layered on top of another
block device can recurse into a filesystem as they can sit on top of
a loop device. This has always been the case, and that means the
assumptions the dm-bufio shrinker is making about what it can do in
GFP_NOFS shrinker context has always been incorrect.

Remember that I explained "you should not block kswapd" in this
shrinker a year ago?

| What follows from that, and is pertinent for in this situation, is
| that if you don't block kswapd, then other reclaim contexts are not
| going to get stuck waiting for it regardless of the reclaim context
| they use.

https://lore.kernel.org/linux-fsdevel/20190809215733.GZ7777@dread.disaster.area/

If you did that when I suggested it, this problem would be solved.
i.e. The only way to fix this problem once adn for all is to stop
using the shrinker as a mechanism to issue and wait on IO. If you
need background writeback of dirty buffers, do it from a
WQ_MEM_RECLAIM workqueue that isn't directly in the memory reclaim
path and so can issue writeback and block safely from a GFP_KERNEL
context. Kick the workqueue from the shrinker context, but get rid
of the IO submission and waiting from the shrinker and all the
GFP_NOFS memory reclaim recursion problems go away.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

