Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1B616EB60
	for <lists+dm-devel@lfdr.de>; Tue, 25 Feb 2020 17:26:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582647986;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ugv+N+b8DW+TZfQrM1vSXm6V9tg5AaLvj1HKj4iR2t8=;
	b=QPd3s2M3chfHmckBzp7Ti75DdRRQzKPXHl0N834EnR7rxLdPoxB1XKHOW3fXFmoFVMSnjP
	WU+6CgtftR15Q5bl5sab3q3xWOfx7cVhH0xztrAieIQBmnIdN9DJzMxG4UTjXEY6kSLumR
	0gRKOsWNOLV42Arb7mJdlE5wuoZuzVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-mGwOfrFANxiv4Ff1yFIAVg-1; Tue, 25 Feb 2020 11:26:23 -0500
X-MC-Unique: mGwOfrFANxiv4Ff1yFIAVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF69B18A6EC2;
	Tue, 25 Feb 2020 16:26:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C43668C073;
	Tue, 25 Feb 2020 16:26:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9618435B15;
	Tue, 25 Feb 2020 16:26:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PGPmFf021563 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 11:25:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7527F2038BB3; Tue, 25 Feb 2020 16:25:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E7CC2038B96
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 16:25:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8A218007C9
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 16:25:43 +0000 (UTC)
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-Uy9SUjBIPdW5Ad4C9ueo3A-1; Tue, 25 Feb 2020 11:25:39 -0500
X-MC-Unique: Uy9SUjBIPdW5Ad4C9ueo3A-1
Received: by mail-oi1-f194.google.com with SMTP id i1so13106492oie.8
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 08:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/nrgd+DmYss2FNuLAttFYL2SOqESywg1hoJMWAiVICM=;
	b=h4yj17hWKbHN2TIGyA7u1fJdru27VTBKNUU2aPm6YSbq3gVe3syaKDQsO5V/+iEfTd
	Y2eAi1WUclY2wzuDBdFR10HJIcwcZa8yYnC7XOI0A5wXHtrAaCneVAMzPyY8Z/K9i448
	nI+4HU4y5K2HlPziPq3bzB23nMZCh5Bsr+EVPfdMUpmmB50zq7DK2TMdBpUoggxSciTm
	mp05oSrkWdSgVAZjpeEg9qdEetBYFS/6sPa/TtyImP/1Bx9zTR9ulxykFa6XCoT5Gy1e
	an2XteCdgwvmqRFBJjRtG3EZvMMp2aolRH0P9eoi2e8VyKU0M2yOaBn/f0PpvUwWaqaI
	87ZA==
X-Gm-Message-State: APjAAAUwQdBxcNrRamIH3lhzHhAhLuFaD9ZY/v2+jidEJpC5f0dKgnIH
	qd2Bv8rYkeDb7Q+66lEvHxbSzKdqMfW93N535xBsig==
X-Google-Smtp-Source: APXvYqwLLT7Um51UThPxPcgUpcMj1PQj6U1ajqUVQfBpeWnm2/39kvXIqmKi0usr7PgoBGmvxBU4ew4AvOYH0bhHHFE=
X-Received: by 2002:aca:3f54:: with SMTP id m81mr4090014oia.73.1582647938250; 
	Tue, 25 Feb 2020 08:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
	<20200224201346.GC14651@redhat.com>
	<CAPcyv4gGrimesjZ=OKRaYTDd5dUVz+U9aPeBMh_H3_YCz4FOEQ@mail.gmail.com>
	<20200224211553.GD14651@redhat.com>
	<CAPcyv4gX8p0YuMg3=r9DtPAO3Lz-96nuNyXbK1X5-cyVzNrDTA@mail.gmail.com>
	<20200225133653.GA7488@redhat.com>
In-Reply-To: <20200225133653.GA7488@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 25 Feb 2020 08:25:27 -0800
Message-ID: <CAPcyv4h2fdo=-jqLPTqnuxYVMbBgODWPqafH35yBMBaPa5Rxcw@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PGPmFf021563
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	Dave Chinner <david@fromorbit.com>,
	device-mapper development <dm-devel@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, Jeff Moyer <jmoyer@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
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

On Tue, Feb 25, 2020 at 5:37 AM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Mon, Feb 24, 2020 at 01:32:58PM -0800, Dan Williams wrote:
>
> [..]
> > > > > Ok, how about if I add one more patch to the series which will check
> > > > > if unwritten portion of the page has known poison. If it has, then
> > > > > -EIO is returned.
> > > > >
> > > > >
> > > > > Subject: pmem: zero page range return error if poisoned memory in unwritten area
> > > > >
> > > > > Filesystems call into pmem_dax_zero_page_range() to zero partial page upon
> > > > > truncate. If partial page is being zeroed, then at the end of operation
> > > > > file systems expect that there is no poison in the whole page (atleast
> > > > > known poison).
> > > > >
> > > > > So make sure part of the partial page which is not being written, does not
> > > > > have poison. If it does, return error. If there is poison in area of page
> > > > > being written, it will be cleared.
> > > >
> > > > No, I don't like that the zero operation is special cased compared to
> > > > the write case. I'd say let's make them identical for now. I.e. fail
> > > > the I/O at dax_direct_access() time.
> > >
> > > So basically __dax_zero_page_range() will only write zeros (and not
> > > try to clear any poison). Right?
> >
> > Yes, the zero operation would have already failed at the
> > dax_direct_access() step if there was present poison.
> >
> > > > I think the error clearing
> > > > interface should be an explicit / separate op rather than a
> > > > side-effect. What about an explicit interface for initializing newly
> > > > allocated blocks, and the only reliable way to destroy poison through
> > > > the filesystem is to free the block?
> > >
> > > Effectively pmem_make_request() is already that interface filesystems
> > > use to initialize blocks and clear poison. So we don't really have to
> > > introduce a new interface?
> >
> > pmem_make_request() is shared with the I/O path and is too low in the
> > stack to understand intent. DAX intercepts the I/O path closer to the
> > filesystem and can understand zeroing vs writing today. I'm proposing
> > we go a step further and make DAX understand free-to-allocated-block
> > initialization instead of just zeroing. Inject the error clearing into
> > that initialization interface.
> >
> > > Or you are suggesting separate dax_zero_page_range() interface which will
> > > always call into firmware to clear poison. And that will make sure latent
> > > poison is cleared as well and filesystem should use that for block
> > > initialization instead?
> >
> > Yes, except latent poison would not be cleared until the zeroing is
> > implemented with movdir64b instead of callouts to firmware. It's
> > otherwise too slow to call out to firmware unconditionally.
> >
> > > I do like the idea of not having to differentiate
> > > between known poison and latent poison. Once a block has been initialized
> > > all poison should be cleared (known/latent). I am worried though that
> > > on large devices this might slowdown filesystem initialization a lot
> > > if they are zeroing large range of blocks.
> > >
> > > If yes, this sounds like two different patch series. First patch series
> > > takes care of removing blkdev_issue_zeroout() from
> > > __dax_zero_page_range() and couple of iomap related cleans christoph
> > > wanted.
> > >
> > > And second patch series for adding new dax operation to zero a range
> > > and always call info firmware to clear poison and modify filesystems
> > > accordingly.
> >
> > Yes, but they may need to be merged together. I don't want to regress
> > the ability of a block-aligned hole-punch to clear errors.
>
> Hi Dan,
>
> IIUC, block aligned hole punch don't go through __dax_zero_page_range()
> path. Instead they call blkdev_issue_zeroout() at later point of time.
>
> Only partial block zeroing path is taking __dax_zero_page_range(). So
> even if we remove poison clearing code from __dax_zero_page_range(),
> there should not be a regression w.r.t full block zeroing. Only possible
> regression will be if somebody was doing partial block zeroing on sector
> boundary, then poison will not be cleared.
>
> We now seem to be discussing too many issues w.r.t poison clearing
> and dax. Atleast 3 issues are mentioned in this thread.
>
> A. Get rid of dependency on block device in dax zeroing path.
>    (__dax_zero_page_range)
>
> B. Provide a way to clear latent poison. And possibly use movdir64b to
>    do that and make filesystems use that interface for initialization
>    of blocks.
>
> C. Dax zero operation is clearing known poison while copy_from_iter() is
>    not. I guess this ship has already sailed. If we change it now,
>    somebody will complain of some regression.
>
> For issue A, there are two possible ways to deal with it.
>
> 1. Implement a dax method to zero page. And this method will also clear
>    known poison. This is what my patch series is doing.
>
> 2. Just get rid of blkdev_issue_zeroout() from __dax_zero_page_range()
>    so that no poison will be cleared in __dax_zero_page_range() path. This
>    path is currently used in partial page zeroing path and full filesystem
>    block zeroing happens with blkdev_issue_zeroout(). There is a small
>    chance of regression here in case of sector aligned partial block
>    zeroing.
>
> My patch series takes care of issue A without any regressions. In fact it
> improves current interface. For example, currently "truncate -s 512
> foo.txt" will succeed even if first sector in the block is poisoned. My
> patch series fixes it. Current implementation will return error on if any
> non sector aligned truncate is done and any of the sector is poisoned. My
> implementation will not return error if poisoned can be cleared as part
> of zeroing. It will return only if poison is present in non-zeoring part.

That asymmetry makes the implementation too much of a special case. If
the dax mapping path forces error boundaries on PAGE_SIZE blocks then
so should zeroing.

>
> Why don't we solve one issue A now and deal with issue B and C later in
> a sepaprate patch series. This patch series gets rid of dependency on
> block device in dax path and also makes current zeroing interface better.

I'm ok with replacing blkdev_issue_zeroout() with a dax operation
callback that deals with page aligned entries. That change at least
makes the error boundary symmetric across copy_from_iter() and the
zeroing path.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

