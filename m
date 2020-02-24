Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFE416B0D3
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 21:14:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582575274;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LFWmotPUjOwhX/LuvmiSY0LEbfZ15JZ6+lk8kCOG8Ik=;
	b=FUfR/y2gJsr9ViJwPT4NRR2ocklbr+TIS1wqFvg7jJ70Su7lBIW7Edd5Nq+yfbN8B0BokJ
	HolONwAYHod54iP9Sy/0ZxYbsXdcU+/VTfImRrGGWum6NmTnIeO8/2UcjfnMdziaJzHzKf
	JIHTr9In1dWEHaklzkCfhfcjUj/5ysk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-VSOABRp5M_inRvtoLRvIZQ-1; Mon, 24 Feb 2020 15:14:32 -0500
X-MC-Unique: VSOABRp5M_inRvtoLRvIZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAE4410CE788;
	Mon, 24 Feb 2020 20:14:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04032909E8;
	Mon, 24 Feb 2020 20:14:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DFED860DF;
	Mon, 24 Feb 2020 20:14:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OKDnr9014075 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 15:13:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F027F8B774; Mon, 24 Feb 2020 20:13:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3548885748;
	Mon, 24 Feb 2020 20:13:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id B5843220A24; Mon, 24 Feb 2020 15:13:46 -0500 (EST)
Date: Mon, 24 Feb 2020 15:13:46 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20200224201346.GC14651@redhat.com>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20200223230330.GE10737@dread.disaster.area>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Feb 24, 2020 at 10:03:30AM +1100, Dave Chinner wrote:
> On Fri, Feb 21, 2020 at 03:17:59PM -0500, Vivek Goyal wrote:
> > On Fri, Feb 21, 2020 at 01:32:48PM -0500, Jeff Moyer wrote:
> > > Vivek Goyal <vgoyal@redhat.com> writes:
> > > 
> > > > On Thu, Feb 20, 2020 at 04:35:17PM -0500, Jeff Moyer wrote:
> > > >> Vivek Goyal <vgoyal@redhat.com> writes:
> > > >> 
> > > >> > Currently pmem_clear_poison() expects offset and len to be sector aligned.
> > > >> > Atleast that seems to be the assumption with which code has been written.
> > > >> > It is called only from pmem_do_bvec() which is called only from pmem_rw_page()
> > > >> > and pmem_make_request() which will only passe sector aligned offset and len.
> > > >> >
> > > >> > Soon we want use this function from dax_zero_page_range() code path which
> > > >> > can try to zero arbitrary range of memory with-in a page. So update this
> > > >> > function to assume that offset and length can be arbitrary and do the
> > > >> > necessary alignments as needed.
> > > >> 
> > > >> What caller will try to zero a range that is smaller than a sector?
> > > >
> > > > Hi Jeff,
> > > >
> > > > New dax zeroing interface (dax_zero_page_range()) can technically pass
> > > > a range which is less than a sector. Or which is bigger than a sector
> > > > but start and end are not aligned on sector boundaries.
> > > 
> > > Sure, but who will call it with misaligned ranges?
> > 
> > create a file foo.txt of size 4K and then truncate it.
> > 
> > "truncate -s 23 foo.txt". Filesystems try to zero the bytes from 24 to
> > 4095.
> 
> This should fail with EIO. Only full page writes should clear the
> bad page state, and partial writes should therefore fail because
> they do not guarantee the data in the filesystem block is all good.
> 
> If this zeroing was a buffered write to an address with a bad
> sector, then the writeback will fail and the user will (eventually)
> get an EIO on the file.
> 
> DAX should do the same thing, except because the zeroing is
> synchronous (i.e. done directly by the truncate syscall) we can -
> and should - return EIO immediately.
> 
> Indeed, with your code, if we then extend the file by truncating up
> back to 4k, then the range between 23 and 512 is still bad, even
> though we've successfully zeroed it and the user knows it. An
> attempt to read anywhere in this range (e.g. 10 bytes at offset 100)
> will fail with EIO, but reading 10 bytes at offset 2000 will
> succeed.
> 
> That's *awful* behaviour to expose to userspace, especially when
> they look at the fs config and see that it's using both 4kB block
> and sector sizes...
> 
> The only thing that makes sense from a filesystem perspective is
> clearing bad page state when entire filesystem blocks are
> overwritten. The data in a filesystem block is either good or bad,
> and it doesn't matter how many internal (kernel or device) sectors
> it has.
> 
> > > And what happens to the rest?  The caller is left to trip over the
> > > errors?  That sounds pretty terrible.  I really think there needs to be
> > > an explicit contract here.
> > 
> > Ok, I think is is the contentious bit. Current interface
> > (__dax_zero_page_range()) either clears the poison (if I/O is aligned to
> > sector) or expects page to be free of poison.
> > 
> > So in above example, of "truncate -s 23 foo.txt", currently I get an error
> > because range being zeroed is not sector aligned. So
> > __dax_zero_page_range() falls back to calling direct_access(). Which
> > fails because there are poisoned sectors in the page.
> > 
> > With my patches, dax_zero_page_range(), clears the poison from sector 1 to
> > 7 but leaves sector 0 untouched and just writes zeroes from byte 0 to 511
> > and returns success.
> 
> Ok, kernel sectors are not the unit of granularity bad page state
> should be managed at. They don't match page state granularity, and
> they don't match filesystem block granularity, and the whacky
> "partial writes silently succeed, reads fail unpredictably"
> assymetry it leads to will just cause problems for users.
> 
> > So question is, is this better behavior or worse behavior. If sector 0
> > was poisoned, it will continue to remain poisoned and caller will come
> > to know about it on next read and then it should try to truncate file
> > to length 0 or unlink file or restore that file to get rid of poison.
> 
> Worse, because the filesystem can't track what sub-parts of the
> block are bad and that leads to inconsistent data integrity status
> being exposed to userspace.
> 
> 
> > IOW, if a partial block is being zeroed and if it is poisoned, caller
> > will not be return an error and poison will not be cleared and memory
> > will be zeroed. What do we expect in such cases.
> > 
> > Do we expect an interface where if there are any bad blocks in the range
> > being zeroed, then they all should be cleared (and hence all I/O should
> > be aligned) otherwise error is returned. If yes, I could make that
> > change.
> > 
> > Downside of current interface is that it will clear as many blocks as
> > possible in the given range and leave starting and end blocks poisoned
> > (if it is unaligned) and not return error. That means a reader will
> > get error on these blocks again and they will have to try to clear it
> > again.
> 
> Which is solved by having partial page writes always EIO on poisoned
> memory.

Ok, how about if I add one more patch to the series which will check
if unwritten portion of the page has known poison. If it has, then
-EIO is returned. 


Subject: pmem: zero page range return error if poisoned memory in unwritten area

Filesystems call into pmem_dax_zero_page_range() to zero partial page upon
truncate. If partial page is being zeroed, then at the end of operation
file systems expect that there is no poison in the whole page (atleast
known poison).

So make sure part of the partial page which is not being written, does not
have poison. If it does, return error. If there is poison in area of page
being written, it will be cleared.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 drivers/nvdimm/pmem.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

Index: redhat-linux/drivers/nvdimm/pmem.c
===================================================================
--- redhat-linux.orig/drivers/nvdimm/pmem.c	2020-02-24 10:57:48.520451478 -0500
+++ redhat-linux/drivers/nvdimm/pmem.c	2020-02-24 15:01:58.119854835 -0500
@@ -309,6 +309,19 @@ static int pmem_dax_zero_page_range(stru
 {
 	struct pmem_device *pmem = dax_get_private(dax_dev);
 
+	if (offset_in_page(offset)) {
+		sector_t unwritten_start = (offset & PAGE_MASK) >> SECTOR_SHIFT;
+		unsigned int unwritten_len = ALIGN(offset_in_page(offset), SECTOR_SIZE);
+		/* If partial page is being zeroed, make sure there is no
+		 * known poison in the area of page which is not being zeroed.
+		 * Filesystems expect full page to be free of *known* poison
+		 * at the end of partial page zeroing.
+		 */
+		if (unlikely(is_bad_pmem(&pmem->bb, unwritten_start,
+					 unwritten_len)))
+			return -EIO;
+	}
+
 	return blk_status_to_errno(pmem_do_write(pmem, ZERO_PAGE(0), 0, offset,
 				   len));
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

