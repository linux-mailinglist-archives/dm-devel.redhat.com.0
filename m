Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3AE475C54
	for <lists+dm-devel@lfdr.de>; Wed, 15 Dec 2021 16:54:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639583685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=POfzxRcYdJFPOsQmG4nqdbZw1r2VOiZ1wyidrt0ELuQ=;
	b=VJBycKIBdB/R0wEMrDZFvI3yUqlBhqgT4It8qjxHRvNuiwsw5bPdfxcSW5ojfI5XV4lb+M
	ZJwcrSZSx+CWDgjlzGy1VnkaRVFc9weqQ6B9DAViy8i4MSq/EUvMZH55/Eg5dCgdmQI1di
	dECbx+txnCMLkEwCKVQ8ISod5gdllrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-ldNdc_NrO_qg7iEMq-H_iw-1; Wed, 15 Dec 2021 10:54:44 -0500
X-MC-Unique: ldNdc_NrO_qg7iEMq-H_iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E363801B0C;
	Wed, 15 Dec 2021 15:54:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1162160CC9;
	Wed, 15 Dec 2021 15:54:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43CD11806D03;
	Wed, 15 Dec 2021 15:54:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BFFrJCT009434 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Dec 2021 10:53:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AC42788F6; Wed, 15 Dec 2021 15:53:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.22.16.227])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C522E196FF;
	Wed, 15 Dec 2021 15:52:45 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 2A4902206B8; Wed, 15 Dec 2021 10:52:45 -0500 (EST)
Date: Wed, 15 Dec 2021 10:52:45 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <YboPTSExR05zeDil@redhat.com>
References: <20211209063828.18944-1-hch@lst.de>
	<20211209063828.18944-5-hch@lst.de> <YbNhPXBg7G/ridkV@redhat.com>
	<CAPcyv4g4_yFqDeS+pnAZOxcB=Ua+iArK5mqn0iMG4PX6oL=F_A@mail.gmail.com>
	<20211213082318.GB21462@lst.de> <YbiosqZoG8e6rDkj@redhat.com>
	<CAPcyv4hFjKsPrPTB4NtLHiY8gyaELz9+45N1OFj3hz+uJ=9JnA@mail.gmail.com>
	<Ybj/azxrUyU4PZEr@redhat.com>
	<CAPcyv4h_iFe8U8UrXCbhAYaruFm-xg0n_U3H8wnK-uGoEubTvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4h_iFe8U8UrXCbhAYaruFm-xg0n_U3H8wnK-uGoEubTvw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
	linux-s390 <linux-s390@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Mike Snitzer <snitzer@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>,
	virtualization@lists.linux-foundation.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	device-mapper development <dm-devel@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/5] dax: remove the copy_from_iter and
 copy_to_iter methods
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 14, 2021 at 03:43:38PM -0800, Dan Williams wrote:
> On Tue, Dec 14, 2021 at 12:33 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Tue, Dec 14, 2021 at 08:41:30AM -0800, Dan Williams wrote:
> > > On Tue, Dec 14, 2021 at 6:23 AM Vivek Goyal <vgoyal@redhat.com> wrote:
> > > >
> > > > On Mon, Dec 13, 2021 at 09:23:18AM +0100, Christoph Hellwig wrote:
> > > > > On Sun, Dec 12, 2021 at 06:44:26AM -0800, Dan Williams wrote:
> > > > > > On Fri, Dec 10, 2021 at 6:17 AM Vivek Goyal <vgoyal@redhat.com> wrote:
> > > > > > > Going forward, I am wondering should virtiofs use flushcache version as
> > > > > > > well. What if host filesystem is using DAX and mapping persistent memory
> > > > > > > pfn directly into qemu address space. I have never tested that.
> > > > > > >
> > > > > > > Right now we are relying on applications to do fsync/msync on virtiofs
> > > > > > > for data persistence.
> > > > > >
> > > > > > This sounds like it would need coordination with a paravirtualized
> > > > > > driver that can indicate whether the host side is pmem or not, like
> > > > > > the virtio_pmem driver. However, if the guest sends any fsync/msync
> > > > > > you would still need to go explicitly cache flush any dirty page
> > > > > > because you can't necessarily trust that the guest did that already.
> > > > >
> > > > > Do we?  The application can't really know what backend it is on, so
> > > > > it sounds like the current virtiofs implementation doesn't really, does it?
> > > >
> > > > Agreed that application does not know what backend it is on. So virtiofs
> > > > just offers regular posix API where applications have to do fsync/msync
> > > > for data persistence. No support for mmap(MAP_SYNC). We don't offer persistent
> > > > memory programming model on virtiofs. That's not the expectation. DAX
> > > > is used only to bypass guest page cache.
> > > >
> > > > With this assumption, I think we might not have to use flushcache version
> > > > at all even if shared filesystem is on persistent memory on host.
> > > >
> > > > - We mmap() host files into qemu address space. So any dax store in virtiofs
> > > >   should make corresponding pages dirty in page cache on host and when
> > > >   and fsync()/msync() comes later, it should flush all the data to PMEM.
> > > >
> > > > - In case of file extending writes, virtiofs falls back to regular
> > > >   FUSE_WRITE path (and not use DAX), and in that case host pmem driver
> > > >   should make sure writes are flushed to pmem immediately.
> > > >
> > > > Are there any other path I am missing. If not, looks like we might not
> > > > have to use flushcache version in virtiofs at all as long as we are not
> > > > offering guest applications user space flushes and MAP_SYNC support.
> > > >
> > > > We still might have to use machine check safe variant though as loads
> > > > might generate synchronous machine check. What's not clear to me is
> > > > that if this MC safe variant should be used only in case of PMEM or
> > > > should it be used in case of non-PMEM as well.
> > >
> > > It should be used on any memory address that can throw exception on
> > > load, which is any physical address, in paths that can tolerate
> > > memcpy() returning an error code, most I/O paths, and can tolerate
> > > slower copy performance on older platforms that do not support MC
> > > recovery with fast string operations, to date that's only PMEM users.
> >
> > Ok, So basically latest cpus can do fast string operations with MC
> > recovery so that using MC safe variant is not a problem.
> >
> > Then there is range of cpus which can do MC recovery but do slower
> > versions of memcpy and that's where the issue is.
> >
> > So if we knew that virtiofs dax window is backed by a pmem device
> > then we should always use MC safe variant. Even if it means paying
> > the price of slow version for the sake of correctness.
> >
> > But if we are not using pmem on host, then there is no point in
> > using MC safe variant.
> >
> > IOW.
> >
> >         if (virtiofs_backed_by_pmem) {
> 
> No, PMEM should not be considered at all relative to whether to use MC
> or not, it is 100% a decision of whether you expect virtiofs users
> will balk more at unhandled machine checks or performance regressions
> on the platforms that set "enable_copy_mc_fragile()".

If we don't handle machine check, kernel will panic(), right? So that's
the trade off. Whether get higher performance (on select platforms) and
crash if MC happens OR get slower memcpy() performance (on select
platoforms) and recover from MC. Hmm...


> See
> quirk_intel_brickland_xeon_ras_cap() and
> quirk_intel_purley_xeon_ras_cap() in arch/x86/kernel/quirks.c.
> 
> >                 use_mc_safe_version
> >         else
> >                 use_non_mc_safe_version
> >         }
> >
> > Now question is, how do we know if virtiofs dax window is backed by
> > a pmem or not. I checked virtio_pmem driver and that does not seem
> > to communicate anything like that. It just communicates start of the
> > range and size of range, nothing else.
> >
> > I don't have full handle on stack of modules of virtio_pmem, but my guess
> > is it probably is using MC safe version always (because it does not
> > know anthing about the backing storage).
> >
> > /me will definitely like to pay penalty of slower memcpy if virtiofs
> > device is not backed by a pmem.
> 
> I assume you meant "not like",

Yes. It was a typo.

> but again PMEM has no bearing on
> whether using that device will throw machine checks. I'm sure there
> are people that would make the opposite tradeoff.

Why pmem driver does not have to make such trade off and it always
uses machine check variant.

As you mentioned machine checks can happen with DRAM too. So why loading
from page cache not use machine check variant (or given an option to user
allow making a choice).

BTW, stefan mentioned that we could think of adding a device feature
bit to signal whether to do MC safe memcpy() or not if it becomes
really necessary. For now probably let us stick to performance 
variant and if users demand machine check handling, then either
introduce it unconditionally or make it an opt-in based on device
feature bit.

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

