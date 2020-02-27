Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EF5F1172246
	for <lists+dm-devel@lfdr.de>; Thu, 27 Feb 2020 16:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582817407;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TxEdiajg5L9fygniHgzRE7ybk7sgA4x3iNdklmy6DNI=;
	b=R3QW/I3GnFUSFHK6boOPiJhN8S4wfrslUG4ufGIskVxZk8C/5KX9Jv5zHDgVDq078Dw0/z
	Q1lqCGE23wOfrrw6cN2xavCEv9x3Ax2MIkAOhY2sh2d8B/R4YiXU1Ic78yT78fEVHx7023
	gSfomgzW+h4/sA+EWqYe2GoiugY5Eas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-l-jxa8NtOWeXAh9kKQnzcQ-1; Thu, 27 Feb 2020 10:30:04 -0500
X-MC-Unique: l-jxa8NtOWeXAh9kKQnzcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C4CA1084434;
	Thu, 27 Feb 2020 15:29:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 697118D540;
	Thu, 27 Feb 2020 15:29:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80F3518089C8;
	Thu, 27 Feb 2020 15:29:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01RFPL9t006626 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 10:25:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1C98B909FE; Thu, 27 Feb 2020 15:25:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1249F87B08;
	Thu, 27 Feb 2020 15:25:18 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 7E1272257D2; Thu, 27 Feb 2020 10:25:17 -0500 (EST)
Date: Thu, 27 Feb 2020 10:25:17 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200227152517.GA22844@redhat.com>
References: <20200224201346.GC14651@redhat.com>
	<CAPcyv4gGrimesjZ=OKRaYTDd5dUVz+U9aPeBMh_H3_YCz4FOEQ@mail.gmail.com>
	<20200224211553.GD14651@redhat.com>
	<CAPcyv4gX8p0YuMg3=r9DtPAO3Lz-96nuNyXbK1X5-cyVzNrDTA@mail.gmail.com>
	<20200225133653.GA7488@redhat.com>
	<CAPcyv4h2fdo=-jqLPTqnuxYVMbBgODWPqafH35yBMBaPa5Rxcw@mail.gmail.com>
	<20200225200824.GB7488@redhat.com>
	<CAPcyv4jN7ntOO2hK4ByDcX4-Kob=aJNOr3fGR_k_8rxZ=3Sz7w@mail.gmail.com>
	<20200226165756.GB30329@redhat.com>
	<20200227031143.GH10737@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200227031143.GH10737@dread.disaster.area>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Feb 27, 2020 at 02:11:43PM +1100, Dave Chinner wrote:
> On Wed, Feb 26, 2020 at 11:57:56AM -0500, Vivek Goyal wrote:
> > On Tue, Feb 25, 2020 at 02:49:30PM -0800, Dan Williams wrote:
> > [..]
> > > > > I'm ok with replacing blkdev_issue_zeroout() with a dax operation
> > > > > callback that deals with page aligned entries. That change at least
> > > > > makes the error boundary symmetric across copy_from_iter() and the
> > > > > zeroing path.
> > > >
> > > > IIUC, you are suggesting that modify dax_zero_page_range() to take page
> > > > aligned start and size and call this interface from
> > > > __dax_zero_page_range() and get rid of blkdev_issue_zeroout() in that
> > > > path?
> > > >
> > > > Something like.
> > > >
> > > > __dax_zero_page_range() {
> > > >   if(page_aligned_io)
> > > >         call_dax_page_zero_range()
> > > >   else
> > > >         use_direct_access_and_memcpy;
> > > > }
> > > >
> > > > And other callers of blkdev_issue_zeroout() in filesystems can migrate
> > > > to calling dax_zero_page_range() instead.
> > > >
> > > > If yes, I am not seeing what advantage do we get by this change.
> > > >
> > > > - __dax_zero_page_range() seems to be called by only partial block
> > > >   zeroing code. So dax_zero_page_range() call will remain unused.
> > > >
> > > >
> > > > - dax_zero_page_range() will be exact replacement of
> > > >   blkdev_issue_zeroout() so filesystems will not gain anything. Just that
> > > >   it will create a dax specific hook.
> > > >
> > > > In that case it might be simpler to just get rid of blkdev_issue_zeroout()
> > > > call from __dax_zero_page_range() and make sure there are no callers of
> > > > full block zeroing from this path.
> > > 
> > > I think you're right. The path I'm concerned about not regressing is
> > > the error clearing on new block allocation and we get that already via
> > > xfs_zero_extent() and sb_issue_zeroout().
> > 
> > Well I was wrong. I found atleast one user which uses __dax_zero_page_range()
> > to zero full PAGE_SIZE blocks.
> > 
> > xfs_io -c "allocsp 32K 0" foo.txt
> 
> That ioctl interface is deprecated and likely unused by any new
> application written since 1999. It predates unwritten extents (1998)
> and I don't think any native linux applications have ever used it. A
> newly written DAX aware application would almost certainly not use
> this interface.
> 
> IOWs, I wouldn't use it as justification for some special case
> behaviour; I'm more likely to say "rip that ancient ioctl out" than
> to jump through hoops because it's implementation behaviour.

Hi Dave,

Do you see any other path in xfs using iomap_zero_range() and zeroing
full block. iomap_zero_range() already skips IOMAP_HOLE and
IOMAP_UNWRITTEN. So it has to be a full block zeroing which is of not type
IOMAP_HOLE and IOMAP_UNWRITTEN.

My understanding is that ext4 and xfs both are initializing full blocks
using blkdev_issue_zeroout(). Only partial blocks are being zeroed using
this dax zeroing path.

If there are no callers of full block zeroing through
__dax_zero_page_range(), then I can simply get rid of
blkdev_issue_zerout() call from __dax_zero_page_range().

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

