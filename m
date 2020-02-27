Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 77B67170ED0
	for <lists+dm-devel@lfdr.de>; Thu, 27 Feb 2020 04:03:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582772621;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XmFNSheeBN7bkQwMw3Qg5qwnKoGY48Xixd6zw7IevYo=;
	b=TnhcRRNxJcoIczMlnGH8vbSL2ORll1wxWPxakrf6dB7chFSQGOaks/QVFaoNfkQk5pNiBh
	tPThoW0bDEMQPDR4Y26CWD6kkuPT6SAoBVo4zQoNbaTLnMkVW8MPztzBniMcSbz2YTBNBA
	2UOLlFKkJL2Yuyq0t/z+svcLKS+ou/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-NH4oluKWMea-6eFT4czLBA-1; Wed, 26 Feb 2020 22:03:38 -0500
X-MC-Unique: NH4oluKWMea-6eFT4czLBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 606DC800D50;
	Thu, 27 Feb 2020 03:03:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 183BA60BE1;
	Thu, 27 Feb 2020 03:03:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08FD284460;
	Thu, 27 Feb 2020 03:03:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01R3301P025631 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 22:03:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BB1282026FFE; Thu, 27 Feb 2020 03:03:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B614F2026D69
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 03:02:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FD49867455
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 03:02:58 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-422-oC9mCEZmMwKHgIr2mFfowA-1; Wed, 26 Feb 2020 22:02:54 -0500
X-MC-Unique: oC9mCEZmMwKHgIr2mFfowA-1
Received: from dread.disaster.area (pa49-195-202-68.pa.nsw.optusnet.com.au
	[49.195.202.68])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 6CEFB7E8BF1;
	Thu, 27 Feb 2020 14:02:50 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j79Rp-00068S-3M; Thu, 27 Feb 2020 14:02:49 +1100
Date: Thu, 27 Feb 2020 14:02:49 +1100
From: Dave Chinner <david@fromorbit.com>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200227030248.GG10737@dread.disaster.area>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
	<20200224153844.GB14651@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200224153844.GB14651@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=mqTaRPt+QsUAtUurwE173Q==:117 a=mqTaRPt+QsUAtUurwE173Q==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=7-415B0cAAAA:8 a=3Uponxbm9rQKfJszS7gA:9 a=Ka0kt8yWCJBL3DhL:21
	a=hsboJL87aekKxaTp:21 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01R3301P025631
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org, dm-devel@redhat.com, hch@infradead.org,
	Jeff Moyer <jmoyer@redhat.com>, linux-fsdevel@vger.kernel.org,
	dan.j.williams@intel.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 24, 2020 at 10:38:44AM -0500, Vivek Goyal wrote:
> On Mon, Feb 24, 2020 at 10:03:30AM +1100, Dave Chinner wrote:
> 
> [..]
> > > > > Hi Jeff,
> > > > >
> > > > > New dax zeroing interface (dax_zero_page_range()) can technically pass
> > > > > a range which is less than a sector. Or which is bigger than a sector
> > > > > but start and end are not aligned on sector boundaries.
> > > > 
> > > > Sure, but who will call it with misaligned ranges?
> > > 
> > > create a file foo.txt of size 4K and then truncate it.
> > > 
> > > "truncate -s 23 foo.txt". Filesystems try to zero the bytes from 24 to
> > > 4095.
> > 
> > This should fail with EIO. Only full page writes should clear the
> > bad page state, and partial writes should therefore fail because
> > they do not guarantee the data in the filesystem block is all good.
> > 
> > If this zeroing was a buffered write to an address with a bad
> > sector, then the writeback will fail and the user will (eventually)
> > get an EIO on the file.
> > 
> > DAX should do the same thing, except because the zeroing is
> > synchronous (i.e. done directly by the truncate syscall) we can -
> > and should - return EIO immediately.
> > 
> > Indeed, with your code, if we then extend the file by truncating up
> > back to 4k, then the range between 23 and 512 is still bad, even
> > though we've successfully zeroed it and the user knows it. An
> > attempt to read anywhere in this range (e.g. 10 bytes at offset 100)
> > will fail with EIO, but reading 10 bytes at offset 2000 will
> > succeed.
> 
> Hi Dave,
> 
> What is expected if I do "truncate -s 512 foo.txt". Say first sector (0 to
> 511) is poisoned and rest don't have poison. Should this fail with -EIO.

Yes - the filesystem block still contains bad data.

> In current implementation it does not.

I'm not surprised - the whole hardware error handling architecture
for FS-DAX is fundamentally broken. It was designed for device-dax,
and it just doesn't work for FS-DAX.

For example, to get the hardware error handling to be able to kill
userspace applications, a 1:1 physical-to-logical association
constraint was added to fs/dax.c:

/*
 * TODO: for reflink+dax we need a way to associate a single page with
 * multiple address_space instances at different linear_page_index()
 * offsets.
 */
static void dax_associate_entry(void *entry, struct address_space *mapping,
                struct vm_area_struct *vma, unsigned long address)

because device-dax only has *linear mappings* and so has a fixed
reverse mapping architecture.

i.e. the whole hardware error handling infrastructure was designed
around the constraints of device-dax. device-dax does not having any
structure to serialise access to the physical storage, so locking
was added to the mapping tree. THe mapping tree locking is accessed
on hardware error via the reverse mappingi association in the struct
page and that's how device-dax serialises direct physical storage
access against hardware error processing.  And while the page index
is locked in the mapping tree, it can walk the process vmas that
have the page mapped to kill them so that they don't try to access
the bad page.

That bad physical storage state is carried in a volatile struct page
flag, hence requiring some mechanism to make it persistent (the
device bad blocks register) and some other mechanism to clear the
poison state (direct IO, IIRC).

It's also a big, nasty, solid roadblock to implementing shared
data extents in FS-DAX. We basically have to completely re-architect
the hardware error handling for FS-DAX so that such errors are
reported to the filesystem first and then the filesystem does what
is needed to handle the error.

None of this works for filesystems because they need to perform
different operations depending on what the page that went bad
contains. FS-DAX should never trip over an unexpected poisoned page;
we do so now because such physical storage errors are completely
hidden form the fielsystem.

What you are trying to do is slap a band-aid over what to do when we
hit an unexpected page containing bad data. Filesystems expect to
find out about bad data in storage when they marshall the data into
or out of memory. They make the assumption that once it is in memory
it remains valid on the physical storage. Hence if an in-memory
error occurs, we can just toss it away and re-read it from storage,
and all is good.

FS-DAX changes that - we are no longer marshalling data into and out
of memory so we don't have a mechanism to get EIO when reading the
page into the page cache or writing it back to disk. We also don't
have an in-memory copy of the data - the physical storage is the
in-memory copy, and so we can't just toss it away when an error
occurs.

What we actually require is instantaneous notification of physical
storage errors so we can handle the error immediately. And that, in
turn, means we should never poison or see poisoned pages during
direct access operations because the filesystem doesn't need to
poison pages to prevent user access - it controls how the storage is
accessed directly.

e.g. if this error is in filesystem metadata, we might be able to
recover from it as that metadata might have a full copy in memory
(metadata is buffered in both XFS and ext4) or we might be able to
reconstruct it from other sources. Worst case, we have shut the
filesystem down completely so the admin can repair the damage the
lost page has caused.

e.g. The physical page may be located in free space, in which case
we don't care and can just zero it so all the bad hardware state is
cleared. The page never goes bad or gets poisoned in that case.

e.g. The physical page may be user data, in which case it may be
buffered in the page cache (non-dax) and so can easily be recovered.
It may not be recoverable, in which case we need to issue log
messages indicating that data has been lost (path, offset, length),
and do the VMA walk and kill processes that map that page. Then we
can zero the page to clear the bad state.

If, at any point we can't clear the bad state (e.g. the zeroing or
the read-back verification fails), then we need to make sure that
filesystem block is marked as allocated in the free space map, then
tell the reverse map that it's owner is now "bad storage" so it
never gets used again. i.e. this is the persistent bad block
storage, but doing it this way results in the rest of the filesystem
code never, ever seeing a poisoned page. And users never see it
either, because it will never be returned to the free space pool.

Of course, this relies of the filesystem having reverse mapping
capability. XFS already has this funcitonality available as a mkfs
option (mkfs.xfs -m rmapbt=1 ...), and we really need this so we can
get rid of the association of a physical page with a mapping and
file offset that device-dax requires for hardware page error
handling.  This means we don't need the physical storage to try to
hold filesystem layer reverse mapping information for us, and this
also removes the roadblock that the hardware error handling has
placed on implementing reflink w/ FS-DAX.

IOWs, the problem you are trying to solve is a direct result of
filesysetms not being informed when a physical pmem page goes bad
and the current error handling being implemented at entirely the
wrong layer for FS-DAX. It may work for device-dax, but it's most
definitely insufficient for correct error handling for filesystems.

> Anyway, partial page truncate can't ensure that data in rest of the page can
> be read back successfully. Memory can get poison after the write and
> hence read after truncate will still fail.

Which is where the notification requirement comes in. Yes, we may
still get errors on read or write, but if memory at rest goes bad,
we want to handle that and correct it ASAP, not wait days or months
for something to trip over the poisoned page before we find out
about it.

> Hence, all we are trying to ensure is that if a poison is known at the
> time of writing partial page, then we should return error to user space.

I think within FS-DAX infrastructure, any access to the data (read
or write) within a poisoned page or a page marked with PageError()
should return EIO to the caller, unless it's the specific command to
clear the error/poison state on the page. What happens with that
error state is then up to the caller.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

