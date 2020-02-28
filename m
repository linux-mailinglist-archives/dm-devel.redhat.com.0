Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 311F7172F52
	for <lists+dm-devel@lfdr.de>; Fri, 28 Feb 2020 04:29:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582860575;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7DXCfHvzfJ2O5vlJOG8suKehpPd9V5Aa9qgxt8PgHyE=;
	b=aNc+S5z9Rw5WHjduZFQ/o3KP0PojTaqQtxI666aKiDp2qAeIeqFtoZDEXesKolhNBqDaYr
	cFRcQx0uBIgFGgbrt2qkDh4NaLBLpwddC+tE9f2k6ILcz0iYnkZpMAGK3TWOauXPUFqCkC
	ClmA4UeQBTqFc069RM6TqsnkKY2A7KY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-XugjCZ0FP0283Is3FtOHLg-1; Thu, 27 Feb 2020 22:29:32 -0500
X-MC-Unique: XugjCZ0FP0283Is3FtOHLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10960DB66;
	Fri, 28 Feb 2020 03:29:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 297B61CB;
	Fri, 28 Feb 2020 03:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 645AA8447B;
	Fri, 28 Feb 2020 03:29:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01S3Swkg021807 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 22:28:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B7802166B2B; Fri, 28 Feb 2020 03:28:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 374FB2166B2A
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 03:28:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CB92800296
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 03:28:56 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-490-7WXReOsENU2u1Xs5bypuHg-1; Thu, 27 Feb 2020 22:28:53 -0500
X-MC-Unique: 7WXReOsENU2u1Xs5bypuHg-1
Received: by mail-oi1-f196.google.com with SMTP id d62so1500789oia.11
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 19:28:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GEX6rvdBlO7hz9k8V7o5YOXnBqCUwNjK2oTZUppbe28=;
	b=WsZLPm3d8EIJVxvLzFA9/6qtmgzp/7FOZhXwQueVCDbUlcpPINUEtoCnlhuEOO8NC6
	wkWi6ne9Caw+pTqvuy7ffHVCKd4iTZwgKIEQvSPj8IzpLVVEN6m3wYQ9LYddTi0rW69x
	kCfWB4QRkTUvFCinGf5Xe3C4lKtiDqyzWNL4SdFb95mYRnP0hzXVMspMPByHm1tMzlxr
	KF4Ltf0Y/JgiXTUHm9mezf6PUCtYc7iLqe08QEZLM9K1AgEs0MF4Eg8yriHa2WK2/EZy
	SlR7gYsoZrLvtOJz3/vpxABFOjOZip6dEpPN3jLdyJCiNJ1+UHulD+xaphsANgEBNJNE
	TWmA==
X-Gm-Message-State: APjAAAWB3qCcYgR00OfH9WXelwmz3cgb5ckBVjm+BV4gvn46ngIFvnRt
	AoULSDDrAjzh7ynj8AHSsKG1MhpOYHARjQ54M7oTiw==
X-Google-Smtp-Source: APXvYqwQar6+RTCUGLwq/zZ52sZmJNQGhbFyt0+u8eKfi4z6SLcYdrIfqOMEAyhGR5Y0vg5HRZsmmP1OzNllORh8E8c=
X-Received: by 2002:aca:3f54:: with SMTP id m81mr1636050oia.73.1582860532725; 
	Thu, 27 Feb 2020 19:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
	<20200224153844.GB14651@redhat.com>
	<20200227030248.GG10737@dread.disaster.area>
	<CAPcyv4gTSb-xZ2k938HxQeAXATvGg1aSkEGPfrzeQAz9idkgzQ@mail.gmail.com>
	<20200228013054.GO10737@dread.disaster.area>
In-Reply-To: <20200228013054.GO10737@dread.disaster.area>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 27 Feb 2020 19:28:41 -0800
Message-ID: <CAPcyv4i2vjUGrwaRsjp1-L0wFf0a00e46F-SUbocQBkiQ3M1kg@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01S3Swkg021807
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	device-mapper development <dm-devel@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, Jeff Moyer <jmoyer@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [dm-devel] [PATCH v5 2/8] drivers/pmem: Allow
 pmem_clear_poison() to accept arbitrary offset and len
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 27, 2020 at 5:31 PM Dave Chinner <david@fromorbit.com> wrote:
> On Wed, Feb 26, 2020 at 08:19:37PM -0800, Dan Williams wrote:
[..]
> > So you want the FS to have error handling for just pmem errors or all
> > memory errors?
>
> Just pmem errors in the specific range the filesystem manages - we
> really only care storage errors because those are the only errors
> the filesystem is responsible for handling correctly.
>
> Somebody else can worry about errors that hit page cache pages -
> page cache pages require mapping/index pointers on each page anyway,
> so a generic mechanism for handling those errors can be built into
> the page cache. And if the error is in general kernel memory, then
> it's game over for the entire kernel at that point, not just the
> filesystem.
>
> > And you want this to be done without the mm core using
> > page->index to identify what to unmap when the error happens?
>
> Isn't that exactly what I just said? We get the page address that
> failed, the daxdev can turn that into a sector address and call into
> the filesystem with a {sector, len, errno} tuple. We then do a
> reverse mapping lookup on {sector, len} to find all the owners of
> that range in the filesystem. If it's file data, that owner record
> gives us the inode and the offset into the file, which then gives us
> a {mapping, index} tuple.
>
> Further, the filesytem reverse map is aware that it's blocks can be
> shared by multiple owners, so it will have a record for every inode
> and file offset that maps to that page. Hence we can simply iterate
> the reverse map and do that whacky collect_procs/kill_procs dance
> for every {mapping, index} pair that references the the bad range.
>
> Nothing ever needs to be stored on the struct page...

Ok, so fs/dax.c needs to coordinate with mm/memory-failure.c to say
"don't perform generic memory-error-handling, there's an fs that owns
this daxdev and wants to disposition errors". The fs/dax.c
infrastructure that sets up ->index and ->mapping would still need to
be there for ext4 until its ready to take on the same responsibility.
Last I checked the ext4 reverse mapping implementation was not as
capable as XFS. This goes back to why the initial design avoided
relying on not universally available / stable reverse-mapping
facilities and opted for extending the generic mm/memory-failure.c
implementation.

If XFS optionally supplants mm/memory-failure.c I would expect we'd
want to do better than the "whacky collect_procs/kill_procs"
implementation and let applications register for a notification format
better than BUS_MCEERR_AO signals.

> > Memory
> > error scanning is not universally available on all pmem
> > implementations, so FS will need to subscribe for memory-error
> > handling events.
>
> No. Filesystems interact with the underlying device abstraction, not
> the physical storage that lies behind that device abstraction.  The
> filesystem should not interface with pmem directly in any way (all
> direct accesses are hidden inside fs/dax.c!), nor should it care
> about the quirks of the pmem implementation it is sitting on. That's
> what the daxdev abstraction is supposed to hide from the users of
> the pmem.

I wasn't proposing that XFS have a machine-check handler, I was trying
to get to the next level detail of the async notification interface to
the fs.

>
> IOWs, the daxdev infrastructure subscribes to memory-error event
> subsystem, calls out to the filesystem when an error in a page in
> the daxdev is reported. The filesystem only needs to know the
> {sector, len, errno} tuple related to the error; it is the device's
> responsibility to handle the physical mechanics of listening,
> filtering and translating MCEs to a format the filesystem
> understands....
>
> Another reason it should be provided by the daxdev as a {sector,
> len, errno} tuple is that it also allows non-dax block devices to
> implement the similar error notifications and provide filesystems
> with exactly the same information so the filesystem can start
> auto-recovery processes....

The driver layer does already have 'struct badblocks' that both pmem
and md use, just no current way for the FS to get a reference to it.
However, my hope was to get away from the interface being sector based
because the error granularity is already smaller than a sector in the
daxdev case as compared to a bdev. A daxdev native error record should
be a daxdev relative byte offset, not a sector. If the fs wants to
align the blast radius of the error to sectors or fs-blocks that's its
choice, but I don't think the driver interface should preclude
sub-sector error handling. Essentially I don't want to add more bdev
semantics to fs/dax.c while Vivek is busy removing them.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

