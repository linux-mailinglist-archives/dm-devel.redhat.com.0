Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CE8F216B1F1
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 22:16:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582578989;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BPfVHfu++yCfkNC9sOzG6nkx1vEgV74RLePlEMGxt3o=;
	b=B4e0y3n1+KXLG+tTSd1JhKi84ViV+Cs+WUOvy7cuWRYuQ+pw74H/qE1FvCMq9gMYuQ+5oV
	AvPeQ7wXy7ROAGsyPVrlq4TF3DQv+QLKbNzr1UrLhAZJpnQCHsL/3AOS45bnUyqNjkZB3V
	TTS0X7EFrAN9yA/uXv76Do2iEQVszvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-CpRVtJDJO862Xszdx7kcvw-1; Mon, 24 Feb 2020 16:16:26 -0500
X-MC-Unique: CpRVtJDJO862Xszdx7kcvw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D87E1083E80;
	Mon, 24 Feb 2020 21:16:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17CC85D9E5;
	Mon, 24 Feb 2020 21:16:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88859860ED;
	Mon, 24 Feb 2020 21:16:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLFvI8018041 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:15:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 32A888ED01; Mon, 24 Feb 2020 21:15:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D79290085;
	Mon, 24 Feb 2020 21:15:54 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 0CC61220A24; Mon, 24 Feb 2020 16:15:54 -0500 (EST)
Date: Mon, 24 Feb 2020 16:15:53 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20200224211553.GD14651@redhat.com>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
	<20200224201346.GC14651@redhat.com>
	<CAPcyv4gGrimesjZ=OKRaYTDd5dUVz+U9aPeBMh_H3_YCz4FOEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gGrimesjZ=OKRaYTDd5dUVz+U9aPeBMh_H3_YCz4FOEQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 24, 2020 at 12:52:13PM -0800, Dan Williams wrote:
> On Mon, Feb 24, 2020 at 12:13 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Mon, Feb 24, 2020 at 10:03:30AM +1100, Dave Chinner wrote:
> > > On Fri, Feb 21, 2020 at 03:17:59PM -0500, Vivek Goyal wrote:
> > > > On Fri, Feb 21, 2020 at 01:32:48PM -0500, Jeff Moyer wrote:
> > > > > Vivek Goyal <vgoyal@redhat.com> writes:
> > > > >
> > > > > > On Thu, Feb 20, 2020 at 04:35:17PM -0500, Jeff Moyer wrote:
> > > > > >> Vivek Goyal <vgoyal@redhat.com> writes:
> > > > > >>
> > > > > >> > Currently pmem_clear_poison() expects offset and len to be sector aligned.
> > > > > >> > Atleast that seems to be the assumption with which code has been written.
> > > > > >> > It is called only from pmem_do_bvec() which is called only from pmem_rw_page()
> > > > > >> > and pmem_make_request() which will only passe sector aligned offset and len.
> > > > > >> >
> > > > > >> > Soon we want use this function from dax_zero_page_range() code path which
> > > > > >> > can try to zero arbitrary range of memory with-in a page. So update this
> > > > > >> > function to assume that offset and length can be arbitrary and do the
> > > > > >> > necessary alignments as needed.
> > > > > >>
> > > > > >> What caller will try to zero a range that is smaller than a sector?
> > > > > >
> > > > > > Hi Jeff,
> > > > > >
> > > > > > New dax zeroing interface (dax_zero_page_range()) can technically pass
> > > > > > a range which is less than a sector. Or which is bigger than a sector
> > > > > > but start and end are not aligned on sector boundaries.
> > > > >
> > > > > Sure, but who will call it with misaligned ranges?
> > > >
> > > > create a file foo.txt of size 4K and then truncate it.
> > > >
> > > > "truncate -s 23 foo.txt". Filesystems try to zero the bytes from 24 to
> > > > 4095.
> > >
> > > This should fail with EIO. Only full page writes should clear the
> > > bad page state, and partial writes should therefore fail because
> > > they do not guarantee the data in the filesystem block is all good.
> > >
> > > If this zeroing was a buffered write to an address with a bad
> > > sector, then the writeback will fail and the user will (eventually)
> > > get an EIO on the file.
> > >
> > > DAX should do the same thing, except because the zeroing is
> > > synchronous (i.e. done directly by the truncate syscall) we can -
> > > and should - return EIO immediately.
> > >
> > > Indeed, with your code, if we then extend the file by truncating up
> > > back to 4k, then the range between 23 and 512 is still bad, even
> > > though we've successfully zeroed it and the user knows it. An
> > > attempt to read anywhere in this range (e.g. 10 bytes at offset 100)
> > > will fail with EIO, but reading 10 bytes at offset 2000 will
> > > succeed.
> > >
> > > That's *awful* behaviour to expose to userspace, especially when
> > > they look at the fs config and see that it's using both 4kB block
> > > and sector sizes...
> > >
> > > The only thing that makes sense from a filesystem perspective is
> > > clearing bad page state when entire filesystem blocks are
> > > overwritten. The data in a filesystem block is either good or bad,
> > > and it doesn't matter how many internal (kernel or device) sectors
> > > it has.
> > >
> > > > > And what happens to the rest?  The caller is left to trip over the
> > > > > errors?  That sounds pretty terrible.  I really think there needs to be
> > > > > an explicit contract here.
> > > >
> > > > Ok, I think is is the contentious bit. Current interface
> > > > (__dax_zero_page_range()) either clears the poison (if I/O is aligned to
> > > > sector) or expects page to be free of poison.
> > > >
> > > > So in above example, of "truncate -s 23 foo.txt", currently I get an error
> > > > because range being zeroed is not sector aligned. So
> > > > __dax_zero_page_range() falls back to calling direct_access(). Which
> > > > fails because there are poisoned sectors in the page.
> > > >
> > > > With my patches, dax_zero_page_range(), clears the poison from sector 1 to
> > > > 7 but leaves sector 0 untouched and just writes zeroes from byte 0 to 511
> > > > and returns success.
> > >
> > > Ok, kernel sectors are not the unit of granularity bad page state
> > > should be managed at. They don't match page state granularity, and
> > > they don't match filesystem block granularity, and the whacky
> > > "partial writes silently succeed, reads fail unpredictably"
> > > assymetry it leads to will just cause problems for users.
> > >
> > > > So question is, is this better behavior or worse behavior. If sector 0
> > > > was poisoned, it will continue to remain poisoned and caller will come
> > > > to know about it on next read and then it should try to truncate file
> > > > to length 0 or unlink file or restore that file to get rid of poison.
> > >
> > > Worse, because the filesystem can't track what sub-parts of the
> > > block are bad and that leads to inconsistent data integrity status
> > > being exposed to userspace.
> > >
> > >
> > > > IOW, if a partial block is being zeroed and if it is poisoned, caller
> > > > will not be return an error and poison will not be cleared and memory
> > > > will be zeroed. What do we expect in such cases.
> > > >
> > > > Do we expect an interface where if there are any bad blocks in the range
> > > > being zeroed, then they all should be cleared (and hence all I/O should
> > > > be aligned) otherwise error is returned. If yes, I could make that
> > > > change.
> > > >
> > > > Downside of current interface is that it will clear as many blocks as
> > > > possible in the given range and leave starting and end blocks poisoned
> > > > (if it is unaligned) and not return error. That means a reader will
> > > > get error on these blocks again and they will have to try to clear it
> > > > again.
> > >
> > > Which is solved by having partial page writes always EIO on poisoned
> > > memory.
> >
> > Ok, how about if I add one more patch to the series which will check
> > if unwritten portion of the page has known poison. If it has, then
> > -EIO is returned.
> >
> >
> > Subject: pmem: zero page range return error if poisoned memory in unwritten area
> >
> > Filesystems call into pmem_dax_zero_page_range() to zero partial page upon
> > truncate. If partial page is being zeroed, then at the end of operation
> > file systems expect that there is no poison in the whole page (atleast
> > known poison).
> >
> > So make sure part of the partial page which is not being written, does not
> > have poison. If it does, return error. If there is poison in area of page
> > being written, it will be cleared.
> 
> No, I don't like that the zero operation is special cased compared to
> the write case. I'd say let's make them identical for now. I.e. fail
> the I/O at dax_direct_access() time.

So basically __dax_zero_page_range() will only write zeros (and not
try to clear any poison). Right?

> I think the error clearing
> interface should be an explicit / separate op rather than a
> side-effect. What about an explicit interface for initializing newly
> allocated blocks, and the only reliable way to destroy poison through
> the filesystem is to free the block?

Effectively pmem_make_request() is already that interface filesystems
use to initialize blocks and clear poison. So we don't really have to
introduce a new interface?

Or you are suggesting separate dax_zero_page_range() interface which will
always call into firmware to clear poison. And that will make sure latent
poison is cleared as well and filesystem should use that for block
initialization instead? I do like the idea of not having to differentiate
between known poison and latent poison. Once a block has been initialized
all poison should be cleared (known/latent). I am worried though that
on large devices this might slowdown filesystem initialization a lot
if they are zeroing large range of blocks.

If yes, this sounds like two different patch series. First patch series
takes care of removing blkdev_issue_zeroout() from
__dax_zero_page_range() and couple of iomap related cleans christoph
wanted.

And second patch series for adding new dax operation to zero a range
and always call info firmware to clear poison and modify filesystems
accordingly.

Thanks
Vivek

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

