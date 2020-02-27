Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB1D170EDC
	for <lists+dm-devel@lfdr.de>; Thu, 27 Feb 2020 04:12:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582773135;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pVp4WFmj/Kz/NOj5oNasAngPW0IAqGKJopKReoevcZQ=;
	b=KSZ1hmuLHGTncTNtAM4DwKWuRBip4hiCPH0kki9i/RZTUPyhC9Dyhh6/c4KiXB7GU21kUZ
	zuWLfwO8mPVaqo6oFSEnDtFH3zZkfW4odU/iIbBSR12zbE84FvpUxZNAUHGy29s9FYDnxJ
	j0VVPT7AIGVg3XZWk0bHtoHFwKcoV1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-BUduWmSMMcOAUAqPXIC1BQ-1; Wed, 26 Feb 2020 22:12:13 -0500
X-MC-Unique: BUduWmSMMcOAUAqPXIC1BQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E9CF107ACCA;
	Thu, 27 Feb 2020 03:12:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1706B60499;
	Thu, 27 Feb 2020 03:12:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 061A08446C;
	Thu, 27 Feb 2020 03:12:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01R3Bs5e026222 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 22:11:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6EF82107CD0A; Thu, 27 Feb 2020 03:11:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A154107CD09
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 03:11:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89D758007A4
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 03:11:52 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-60-luRGnnWtM3ewWHenJ_OKpw-1; Wed, 26 Feb 2020 22:11:48 -0500
X-MC-Unique: luRGnnWtM3ewWHenJ_OKpw-1
Received: from dread.disaster.area (pa49-195-202-68.pa.nsw.optusnet.com.au
	[49.195.202.68])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 4D5587EAACE;
	Thu, 27 Feb 2020 14:11:45 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j79aR-000690-Tq; Thu, 27 Feb 2020 14:11:43 +1100
Date: Thu, 27 Feb 2020 14:11:43 +1100
From: Dave Chinner <david@fromorbit.com>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200227031143.GH10737@dread.disaster.area>
References: <20200223230330.GE10737@dread.disaster.area>
	<20200224201346.GC14651@redhat.com>
	<CAPcyv4gGrimesjZ=OKRaYTDd5dUVz+U9aPeBMh_H3_YCz4FOEQ@mail.gmail.com>
	<20200224211553.GD14651@redhat.com>
	<CAPcyv4gX8p0YuMg3=r9DtPAO3Lz-96nuNyXbK1X5-cyVzNrDTA@mail.gmail.com>
	<20200225133653.GA7488@redhat.com>
	<CAPcyv4h2fdo=-jqLPTqnuxYVMbBgODWPqafH35yBMBaPa5Rxcw@mail.gmail.com>
	<20200225200824.GB7488@redhat.com>
	<CAPcyv4jN7ntOO2hK4ByDcX4-Kob=aJNOr3fGR_k_8rxZ=3Sz7w@mail.gmail.com>
	<20200226165756.GB30329@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200226165756.GB30329@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=mqTaRPt+QsUAtUurwE173Q==:117 a=mqTaRPt+QsUAtUurwE173Q==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=7-415B0cAAAA:8 a=JyclL5V1kyJuvP7DWe4A:9 a=esild3LDZCtdEqoH:21
	a=FE7rXZW1Nghj-ak8:21 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01R3Bs5e026222
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

On Wed, Feb 26, 2020 at 11:57:56AM -0500, Vivek Goyal wrote:
> On Tue, Feb 25, 2020 at 02:49:30PM -0800, Dan Williams wrote:
> [..]
> > > > I'm ok with replacing blkdev_issue_zeroout() with a dax operation
> > > > callback that deals with page aligned entries. That change at least
> > > > makes the error boundary symmetric across copy_from_iter() and the
> > > > zeroing path.
> > >
> > > IIUC, you are suggesting that modify dax_zero_page_range() to take page
> > > aligned start and size and call this interface from
> > > __dax_zero_page_range() and get rid of blkdev_issue_zeroout() in that
> > > path?
> > >
> > > Something like.
> > >
> > > __dax_zero_page_range() {
> > >   if(page_aligned_io)
> > >         call_dax_page_zero_range()
> > >   else
> > >         use_direct_access_and_memcpy;
> > > }
> > >
> > > And other callers of blkdev_issue_zeroout() in filesystems can migrate
> > > to calling dax_zero_page_range() instead.
> > >
> > > If yes, I am not seeing what advantage do we get by this change.
> > >
> > > - __dax_zero_page_range() seems to be called by only partial block
> > >   zeroing code. So dax_zero_page_range() call will remain unused.
> > >
> > >
> > > - dax_zero_page_range() will be exact replacement of
> > >   blkdev_issue_zeroout() so filesystems will not gain anything. Just that
> > >   it will create a dax specific hook.
> > >
> > > In that case it might be simpler to just get rid of blkdev_issue_zeroout()
> > > call from __dax_zero_page_range() and make sure there are no callers of
> > > full block zeroing from this path.
> > 
> > I think you're right. The path I'm concerned about not regressing is
> > the error clearing on new block allocation and we get that already via
> > xfs_zero_extent() and sb_issue_zeroout().
> 
> Well I was wrong. I found atleast one user which uses __dax_zero_page_range()
> to zero full PAGE_SIZE blocks.
> 
> xfs_io -c "allocsp 32K 0" foo.txt

That ioctl interface is deprecated and likely unused by any new
application written since 1999. It predates unwritten extents (1998)
and I don't think any native linux applications have ever used it. A
newly written DAX aware application would almost certainly not use
this interface.

IOWs, I wouldn't use it as justification for some special case
behaviour; I'm more likely to say "rip that ancient ioctl out" than
to jump through hoops because it's implementation behaviour.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

