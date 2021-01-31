Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CCFE5309DD6
	for <lists+dm-devel@lfdr.de>; Sun, 31 Jan 2021 17:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612110470;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5NxKH9qYik9sQzUU1bw6ZzLWcjFynAR5pLndkmfd2nI=;
	b=S1pKIRdt/GkBRJ8GmBMn0X9tJMibpuy/crxfnGr7qHl0MILhSf+bSiQBq9YDIa2vtVo10D
	hRGe02+kkOUIKx/i09Ly65WEr0fNTZLpONmOGje0nj8KfROh4+P/huQrXhcqkD1kUQnx8y
	jByXPlMG1Iuy9GR9pkFadsFViAxDz48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-Vc9Ed6hOMRmdR7FOGzJwxg-1; Sun, 31 Jan 2021 11:27:47 -0500
X-MC-Unique: Vc9Ed6hOMRmdR7FOGzJwxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05A0510054FF;
	Sun, 31 Jan 2021 16:27:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BB0C10016F5;
	Sun, 31 Jan 2021 16:27:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53A2E180954D;
	Sun, 31 Jan 2021 16:27:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10VGR3l2025302 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 31 Jan 2021 11:27:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B73CF60D43; Sun, 31 Jan 2021 16:27:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3E1960CEF;
	Sun, 31 Jan 2021 16:26:58 +0000 (UTC)
Date: Sun, 31 Jan 2021 11:26:58 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20210131162657.GA3164@redhat.com>
References: <20210125121340.70459-1-jefflexu@linux.alibaba.com>
	<20210127171941.GA11530@redhat.com>
	<2ed9966f-b390-085a-1a51-5bf65038d533@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <2ed9966f-b390-085a-1a51-5bf65038d533@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, linux-block@vger.kernel.org, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 0/6] dm: support IO polling for bio-based
	dm device
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 27 2021 at 10:06pm -0500,
JeffleXu <jefflexu@linux.alibaba.com> wrote:

> 
> 
> On 1/28/21 1:19 AM, Mike Snitzer wrote:
> > On Mon, Jan 25 2021 at  7:13am -0500,
> > Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
> > 
> >> Since currently we have no simple but efficient way to implement the
> >> bio-based IO polling in the split-bio tracking style, this patch set
> >> turns to the original implementation mechanism that iterates and
> >> polls all underlying hw queues in polling mode. One optimization is
> >> introduced to mitigate the race of one hw queue among multiple polling
> >> instances.
> >>
> >> I'm still open to the split bio tracking mechanism, if there's
> >> reasonable way to implement it.
> >>
> >>
> >> [Performance Test]
> >> The performance is tested by fio (engine=io_uring) 4k randread on
> >> dm-linear device. The dm-linear device is built upon nvme devices,
> >> and every nvme device has one polling hw queue (nvme.poll_queues=1).
> >>
> >> Test Case		    | IOPS in IRQ mode | IOPS in polling mode | Diff
> >> 			    | (hipri=0)	       | (hipri=1)	      |
> >> --------------------------- | ---------------- | -------------------- | ----
> >> 3 target nvme, num_jobs = 1 | 198k 	       | 276k		      | ~40%
> >> 3 target nvme, num_jobs = 3 | 608k 	       | 705k		      | ~16%
> >> 6 target nvme, num_jobs = 6 | 1197k 	       | 1347k		      | ~13%
> >> 3 target nvme, num_jobs = 6 | 1285k 	       | 1293k		      | ~0%
> >>
> >> As the number of polling instances (num_jobs) increases, the
> >> performance improvement decreases, though it's still positive
> >> compared to the IRQ mode.
> > 
> > I think there is serious room for improvement for DM's implementation;
> > but the block changes for this are all we'd need for DM in the longrun
> > anyway (famous last words).
> 
> Agreed.
> 
> 
> > So on a block interface level I'm OK with
> > block patches 1-3.
> > 
> > I don't see why patch 5 is needed (said the same in reply to it; but I
> > just saw your reason below..).
> > 
> > Anyway, I can pick up DM patches 4 and 6 via linux-dm.git if Jens picks
> > up patches 1-3. Jens, what do you think?
> 
> cc Jens.
> 
> Also I will send a new version later, maybe some refactor on patch5 and
> some typo modifications.

Thinking further, there is no benefit to Jens picking up the block core
changes until the DM changes are ready.  While I think the refactoring
to expose the blk_poll (in patch 3) that supports blk-mq and bio-based
is reasonable -- Christoph correctly points out there is extra branching
that blk-mq must tolerate as implemented.  So even that needs followup
work as suggested here:
https://www.redhat.com/archives/dm-devel/2021-January/msg00397.html

Also, your followup about oversights in the the latest bio-based DM io
polling implementation speaks to all of this needing more time:
https://www.redhat.com/archives/dm-devel/2021-January/msg00436.html

You advocating going back to what is effectively the first RFC patchset
you proposed (with its underwhelming bio-based polling performance)
isn't a strong indication these changes are ready, or that we even have
a patch forward for how to make bio-based IO polling be worthwhile.

So: I retract my question to Jens about whether he'd pick up the block
core changes (while I think those are close, the corresponding DM
changes aren't).

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

