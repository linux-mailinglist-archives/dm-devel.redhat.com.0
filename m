Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E48C52CE581
	for <lists+dm-devel@lfdr.de>; Fri,  4 Dec 2020 03:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607047576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=puLVZQw6Jxw4zyYfOqstDGon44KZY0uyOIkq3oKg49U=;
	b=BIkh3RSyGlzVJ/uRW7sFrXWTbo70SMOr00HErq0CSq2Gprw1LN4/2aBnUFuM1DM8DcO1eU
	2gCpVPB3bzdeylZjCkDTeAIMW41cxjQjGFgHae5DXGAmTOGav4JreEKHFXOiBlDgI5l9ox
	KZIL0KqROJXUDQBt5/Yxu7IKzHvMTSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-FKiw2ojIPsebZg7jb2kAVQ-1; Thu, 03 Dec 2020 21:06:13 -0500
X-MC-Unique: FKiw2ojIPsebZg7jb2kAVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22570420E9;
	Fri,  4 Dec 2020 02:06:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D0216085A;
	Fri,  4 Dec 2020 02:06:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 431E44EEEE;
	Fri,  4 Dec 2020 02:05:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B423rmD000477 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 21:03:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7FC3E1349A; Fri,  4 Dec 2020 02:03:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 305FE620D7;
	Fri,  4 Dec 2020 02:03:44 +0000 (UTC)
Date: Thu, 3 Dec 2020 21:03:43 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20201204020343.GA32150@redhat.com>
References: <20201130171805.77712-1-snitzer@redhat.com>
	<20201201160709.31748-1-snitzer@redhat.com>
	<20201203032608.GD540033@T590> <20201203143359.GA29261@redhat.com>
	<20201204011243.GB661914@T590>
MIME-Version: 1.0
In-Reply-To: <20201204011243.GB661914@T590>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jdorminy@redhat.com,
	bjohnsto@redhat.com, linux-block@vger.kernel.org, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2] block: use gcd() to fix chunk_sectors
	limit stacking
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 03 2020 at  8:12pm -0500,
Ming Lei <ming.lei@redhat.com> wrote:

> On Thu, Dec 03, 2020 at 09:33:59AM -0500, Mike Snitzer wrote:
> > On Wed, Dec 02 2020 at 10:26pm -0500,
> > Ming Lei <ming.lei@redhat.com> wrote:
> > 
> > > On Tue, Dec 01, 2020 at 11:07:09AM -0500, Mike Snitzer wrote:
> > > > commit 22ada802ede8 ("block: use lcm_not_zero() when stacking
> > > > chunk_sectors") broke chunk_sectors limit stacking. chunk_sectors must
> > > > reflect the most limited of all devices in the IO stack.
> > > > 
> > > > Otherwise malformed IO may result. E.g.: prior to this fix,
> > > > ->chunk_sectors = lcm_not_zero(8, 128) would result in
> > > > blk_max_size_offset() splitting IO at 128 sectors rather than the
> > > > required more restrictive 8 sectors.
> > > 
> > > What is the user-visible result of splitting IO at 128 sectors?
> > 
> > The VDO dm target fails because it requires IO it receives to be split
> > as it advertised (8 sectors).
> 
> OK, looks VDO's chunk_sector limit is one hard constraint, even though it
> is one DM device, so I guess you are talking about DM over VDO?
> 
> Another reason should be that VDO doesn't use blk_queue_split(), otherwise it
> won't be a trouble, right?
> 
> Frankly speaking, if the stacking driver/device has its own hard queue limit
> like normal hardware drive, the driver should be responsible for the splitting.

DM core does the splitting for VDO (just like any other DM target).
In 5.9 I updated DM to use chunk_sectors, use blk_stack_limits()
stacking of it, and also use blk_max_size_offset().

But all that block core code has shown itself to be too rigid for DM.  I
tried to force the issue by stacking DM targets' ti->max_io_len with
chunk_sectors.  But really I'd need to be able to pass in the per-target
max_io_len to blk_max_size_offset() to salvage using it.

Stacking chunk_sectors seems ill-conceived.  One size-fits-all splitting
is too rigid.

> > > I understand it isn't related with correctness, because the underlying
> > > queue can split by its own chunk_sectors limit further. So is the issue
> > > too many further-splitting on queue with chunk_sectors 8? then CPU
> > > utilization is increased? Or other issue?
> > 
> > No, this is all about correctness.
> > 
> > Seems you're confining the definition of the possible stacking so that
> > the top-level device isn't allowed to have its own hard requirements on
> 
> I just don't know this story, thanks for your clarification.
> 
> As I mentioned above, if the stacking driver has its own hard queue
> limit, it should be the driver's responsibility to respect it via
> blk_queue_split() or whatever.

Again, DM does its own splitting... that aspect of it isn't an issue.
The problem is the basis for splitting cannot be the stacked up
chunk_sectors.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

