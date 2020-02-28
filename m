Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A9BB4172E6F
	for <lists+dm-devel@lfdr.de>; Fri, 28 Feb 2020 02:51:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582854669;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bKsXpF4hvhd+u4Tv64ax9vqRfpdj2RgesJ3iRiHFI0Y=;
	b=anRbbv294CFJ8rk/SoV9ohvjL2pElBH9SP/T/tCamiF45i4Xm9AhDTM96dKcugzUCRIlds
	lUmlCqn6DLMkJHCkvyjD8UO4IOAVOH+YQyXETfwmK4jePt1Q6hAjf4oBUfalXkvJWsceLy
	PMpJ37dYBkB0Z3eugeHwHEihGiteggE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-OskWgmp4NXq9TW1s4k7U6A-1; Thu, 27 Feb 2020 20:51:06 -0500
X-MC-Unique: OskWgmp4NXq9TW1s4k7U6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 976ED800D50;
	Fri, 28 Feb 2020 01:50:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A536B1001B34;
	Fri, 28 Feb 2020 01:50:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EBF384468;
	Fri, 28 Feb 2020 01:50:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01S1od9o015656 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 20:50:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D4C9A2166B2D; Fri, 28 Feb 2020 01:50:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D084C2166B2B
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 01:50:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CB77101A55A
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 01:50:32 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-64-6-8oG2pZMEKoiVNBbla61w-1; Thu, 27 Feb 2020 20:50:27 -0500
X-MC-Unique: 6-8oG2pZMEKoiVNBbla61w-1
Received: from dread.disaster.area (pa49-195-202-68.pa.nsw.optusnet.com.au
	[49.195.202.68])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 769D67EAD73;
	Fri, 28 Feb 2020 12:50:23 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j7UnG-0005hW-Ph; Fri, 28 Feb 2020 12:50:22 +1100
Date: Fri, 28 Feb 2020 12:50:22 +1100
From: Dave Chinner <david@fromorbit.com>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200228015022.GP10737@dread.disaster.area>
References: <CAPcyv4gGrimesjZ=OKRaYTDd5dUVz+U9aPeBMh_H3_YCz4FOEQ@mail.gmail.com>
	<20200224211553.GD14651@redhat.com>
	<CAPcyv4gX8p0YuMg3=r9DtPAO3Lz-96nuNyXbK1X5-cyVzNrDTA@mail.gmail.com>
	<20200225133653.GA7488@redhat.com>
	<CAPcyv4h2fdo=-jqLPTqnuxYVMbBgODWPqafH35yBMBaPa5Rxcw@mail.gmail.com>
	<20200225200824.GB7488@redhat.com>
	<CAPcyv4jN7ntOO2hK4ByDcX4-Kob=aJNOr3fGR_k_8rxZ=3Sz7w@mail.gmail.com>
	<20200226165756.GB30329@redhat.com>
	<20200227031143.GH10737@dread.disaster.area>
	<20200227152517.GA22844@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200227152517.GA22844@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=mqTaRPt+QsUAtUurwE173Q==:117 a=mqTaRPt+QsUAtUurwE173Q==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=7-415B0cAAAA:8 a=lA3oqZJ5Ye0HhCd3yN8A:9 a=O0Xyyn5K-h7nI4-n:21
	a=Q5LBZUXVF_w9l6fN:21 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01S1od9o015656
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	device-mapper development <dm-devel@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, Jeff Moyer <jmoyer@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 27, 2020 at 10:25:17AM -0500, Vivek Goyal wrote:
> On Thu, Feb 27, 2020 at 02:11:43PM +1100, Dave Chinner wrote:
> > On Wed, Feb 26, 2020 at 11:57:56AM -0500, Vivek Goyal wrote:
> > > On Tue, Feb 25, 2020 at 02:49:30PM -0800, Dan Williams wrote:
> > > [..]
> > > > > > I'm ok with replacing blkdev_issue_zeroout() with a dax operation
> > > > > > callback that deals with page aligned entries. That change at least
> > > > > > makes the error boundary symmetric across copy_from_iter() and the
> > > > > > zeroing path.
> > > > >
> > > > > IIUC, you are suggesting that modify dax_zero_page_range() to take page
> > > > > aligned start and size and call this interface from
> > > > > __dax_zero_page_range() and get rid of blkdev_issue_zeroout() in that
> > > > > path?
> > > > >
> > > > > Something like.
> > > > >
> > > > > __dax_zero_page_range() {
> > > > >   if(page_aligned_io)
> > > > >         call_dax_page_zero_range()
> > > > >   else
> > > > >         use_direct_access_and_memcpy;
> > > > > }
> > > > >
> > > > > And other callers of blkdev_issue_zeroout() in filesystems can migrate
> > > > > to calling dax_zero_page_range() instead.
> > > > >
> > > > > If yes, I am not seeing what advantage do we get by this change.
> > > > >
> > > > > - __dax_zero_page_range() seems to be called by only partial block
> > > > >   zeroing code. So dax_zero_page_range() call will remain unused.
> > > > >
> > > > >
> > > > > - dax_zero_page_range() will be exact replacement of
> > > > >   blkdev_issue_zeroout() so filesystems will not gain anything. Just that
> > > > >   it will create a dax specific hook.
> > > > >
> > > > > In that case it might be simpler to just get rid of blkdev_issue_zeroout()
> > > > > call from __dax_zero_page_range() and make sure there are no callers of
> > > > > full block zeroing from this path.
> > > > 
> > > > I think you're right. The path I'm concerned about not regressing is
> > > > the error clearing on new block allocation and we get that already via
> > > > xfs_zero_extent() and sb_issue_zeroout().
> > > 
> > > Well I was wrong. I found atleast one user which uses __dax_zero_page_range()
> > > to zero full PAGE_SIZE blocks.
> > > 
> > > xfs_io -c "allocsp 32K 0" foo.txt
> > 
> > That ioctl interface is deprecated and likely unused by any new
> > application written since 1999. It predates unwritten extents (1998)
> > and I don't think any native linux applications have ever used it. A
> > newly written DAX aware application would almost certainly not use
> > this interface.
> > 
> > IOWs, I wouldn't use it as justification for some special case
> > behaviour; I'm more likely to say "rip that ancient ioctl out" than
> > to jump through hoops because it's implementation behaviour.
> 
> Hi Dave,
> 
> Do you see any other path in xfs using iomap_zero_range() and zeroing
> full block.

Yes:

- xfs_file_aio_write_checks() for zeroing blocks between the
  existing EOF and the start of the incoming write beyond EOF
- xfs_setattr_size() on truncate up for zeroing blocks between the
  existing EOF and the new EOF.
- xfs_reflink_zero_posteof() for zeroing blocks between the old EOF
  and where the new reflinked extents are going to land beyond EOF

And don't think that blocks beyond EOF can't exist when DAX is
enabled. We can turn DAX on and off, we can crash between allocation
and file size extension, etc. Hence this code must be able to handle
zeroing large ranges of blocks beyond EOF...

> iomap_zero_range() already skips IOMAP_HOLE and
> IOMAP_UNWRITTEN. So it has to be a full block zeroing which is of not type
> IOMAP_HOLE and IOMAP_UNWRITTEN.
> 
> My understanding is that ext4 and xfs both are initializing full blocks
> using blkdev_issue_zeroout(). Only partial blocks are being zeroed using
> this dax zeroing path.

Look at the API, not the callers: iomap_zero_range takes a 64 bit
length parameter. It can be asked to zero blocks across petabytes of
a file. If there's a single block somewhere in that range, it will
only zero that block. If the entire range is allocated, it will zero
that entire range (yes, it will take forever!) as that it what it
is intended to do.

It should be pretty clear that needs to be able to zero entire
pages, regardless of how it is currently used/called by filesystems.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

