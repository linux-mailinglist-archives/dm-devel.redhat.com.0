Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1749B3AFB2B
	for <lists+dm-devel@lfdr.de>; Tue, 22 Jun 2021 04:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624329981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mHQvub+dQrz0Cwg36Hi1ZKGSfb8+FuBNEV4vtYIG4Xg=;
	b=ViSK2TW8VPZqJYh8JgHk4FOskN6IE7wDhuBNRg61mQ8pyQcNQkqcTKJji+tQOJDD7nkOvW
	qHIKyckvwUsD7X6t+BrFrq+j695FvuKXTgMQmnfPehi+ga74t2YYQvQERzROHpEWQSov6k
	HESa2Y4EzQg/WWqAaCD/8lXKzbHM2Y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-td8EIod5M4uQAZceDS7zoQ-1; Mon, 21 Jun 2021 22:46:18 -0400
X-MC-Unique: td8EIod5M4uQAZceDS7zoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E9BEA40C1;
	Tue, 22 Jun 2021 02:46:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACA305D9CA;
	Tue, 22 Jun 2021 02:46:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8DBB4EA2A;
	Tue, 22 Jun 2021 02:45:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15M2jeEP022581 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 22:45:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BF8C1036D03; Tue, 22 Jun 2021 02:45:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-127.pek2.redhat.com [10.72.13.127])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAE7910016FE;
	Tue, 22 Jun 2021 02:45:27 +0000 (UTC)
Date: Tue, 22 Jun 2021 10:45:23 +0800
From: Ming Lei <ming.lei@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YNFOw9Ko8rZh1eyD@T590>
References: <20210617103549.930311-1-ming.lei@redhat.com>
	<20210617103549.930311-4-ming.lei@redhat.com>
	<5ba43dac-b960-7c85-3a89-fdae2d1e2f51@linux.alibaba.com>
	<YMywCX6nLqLiHXyy@T590>
	<9b42601a-ca54-4748-e592-3720b7994d7b@linux.alibaba.com>
	<YNCchke/OxQVnSZA@T590>
	<ba95e8f3-7466-7167-bcfd-49f89ee0b99c@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <ba95e8f3-7466-7167-bcfd-49f89ee0b99c@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH V2 3/3] dm: support bio polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 22, 2021 at 10:26:15AM +0800, JeffleXu wrote:
> 
> 
> On 6/21/21 10:04 PM, Ming Lei wrote:
> > On Mon, Jun 21, 2021 at 07:33:34PM +0800, JeffleXu wrote:
> >>
> >>
> >> On 6/18/21 10:39 PM, Ming Lei wrote:
> >>> From 47e523b9ee988317369eaadb96826323cd86819e Mon Sep 17 00:00:00 2001
> >>> From: Ming Lei <ming.lei@redhat.com>
> >>> Date: Wed, 16 Jun 2021 16:13:46 +0800
> >>> Subject: [RFC PATCH V3 3/3] dm: support bio polling
> >>>
> >>> Support bio(REQ_POLLED) polling in the following approach:
> >>>
> >>> 1) only support io polling on normal READ/WRITE, and other abnormal IOs
> >>> still fallback on IRQ mode, so the target io is exactly inside the dm
> >>> io.
> >>>
> >>> 2) hold one refcnt on io->io_count after submitting this dm bio with
> >>> REQ_POLLED
> >>>
> >>> 3) support dm native bio splitting, any dm io instance associated with
> >>> current bio will be added into one list which head is bio->bi_end_io
> >>> which will be recovered before ending this bio
> >>>
> >>> 4) implement .poll_bio() callback, call bio_poll() on the single target
> >>> bio inside the dm io which is retrieved via bio->bi_bio_drv_data; call
> >>> dec_pending() after the target io is done in .poll_bio()
> >>>
> >>> 4) enable QUEUE_FLAG_POLL if all underlying queues enable QUEUE_FLAG_POLL,
> >>> which is based on Jeffle's previous patch.
> >>>
> >>> Signed-off-by: Ming Lei <ming.lei@redhat.com>
> >>> ---
> >>> V3:
> >>> 	- covers all comments from Jeffle
> >>> 	- fix corner cases when polling on abnormal ios
> >>>
> >> ...
> >>
> >> One bug and one performance issue, though I haven't investigated deep
> >> for both.
> >>
> >>
> >> kernel base: based on Jens' for-next, applying Christoph and Leiming's
> >> patchset.
> >>
> >>
> >> 1. One bug when there's DM device stack, e.g., dm-linear upon another
> >> dm-linear. Can be reproduced by following steps:
> >>
> >> ```
> >> $ sudo dmsetup create tmpdev --table '0 2097152 linear /dev/nvme0n1 0'
> >>
> >> $ cat tmp.table
> >> 0 2097152 linear /dev/mapper/tmpdev 0
> >> 2097152 2097152 linear /dev/nvme0n1 0
> >>
> >> $ cat tmp.table | dmsetup create testdev
> >>
> >> $ fio -name=test -ioengine=io_uring -iodepth=128 -numjobs=1 -thread
> >> -rw=randread -direct=1 -bs=4k -time_based -runtime=10 -cpus_allowed=6
> >> -filename=/dev/mapper/testdev -hipri=1
> >> ```
> >>
> >>
> >> BUG: unable to handle page fault for address: ffffffffc01a6208
> >> #PF: supervisor write access in kernel mode
> >> #PF: error_code(0x0003) - permissions violation
> >> PGD 39740c067 P4D 39740c067 PUD 39740e067 PMD 1035db067 PTE 1ddf6f061
> >> Oops: 0003 [#1] SMP PTI
> >> CPU: 6 PID: 5899 Comm: fio Tainted: G S
> >> 5.13.0-0.1.git.81bcdc3.al7.x86_64 #1
> >> Hardware name: Inventec     K900G3-10G/B900G3, BIOS A2.20 06/23/2017
> >> RIP: 0010:dm_submit_bio+0x171/0x3e0 [dm_mod]
> > 
> > It has been fixed in my local repo:
> > 
> > @@ -1608,6 +1649,7 @@ static void init_clone_info(struct clone_info *ci, struct mapped_device *md,
> >         ci->map = map;
> >         ci->io = alloc_io(md, bio);
> >         ci->sector = bio->bi_iter.bi_sector;
> > +       ci->submit_as_polled = false;
> > 
> 
> It doesn't work in my test environment. Actually the following fix
> should be applied.
> 
> 
> @@ -1390,6 +1403,8 @@ static int clone_bio(struct dm_target_io *tio,
> struct bio *bio,
>         if (bio_integrity(bio))
>                 bio_integrity_trim(clone);
> 
> +       clone->bi_opf &= ~REQ_SAVED_END_IO;
> +

This change is good, but it shouldn't fix the panic except for nested
device map, I will fold into V3.

>         return 0;
>  }
> 
> 
> The rationale is that, REQ_SAVED_END_IO should be cleared once the bio
> *passes through* the device stack layer. Or the cloned bio for next
> layer will inherit REQ_SAVED_END_IO flag, in which case
> 'cloned_bio->bi_end_io' (actually acts as the hlist head) won't be
> initialized in dm_setup_polled_io(), and thus it gets crashed when
> trying to insert into this hash list in __split_and_process_bio().

'cloned_bio' can't reach dm_submit_bio() if it isn't one DM bio.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

