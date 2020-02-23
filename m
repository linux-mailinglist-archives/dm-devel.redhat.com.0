Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E1293169A97
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 00:04:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582499094;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J6ChOrWqDTyqIwrGq/amrBpwqUua92/kZkzzHHa5Fw4=;
	b=H24PTIFqnmOY3L0LlvtYpVjpn046qXPSHgPg8goEYfL7v1fFMeeElClKzKxQ1b0E+CeE+6
	O8kENfbSz4qoFyIFX7eAbSCsSRQ6X4aZkBcbe1cPkoXz9W3r0g/NP2iQKLUFeFCqFe1rdA
	5miukW/m3l24TkjLatzeqQpUdfmwQj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-DfNwTZ-xPYiL7eadP1oY9w-1; Sun, 23 Feb 2020 18:04:52 -0500
X-MC-Unique: DfNwTZ-xPYiL7eadP1oY9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51B8C800D55;
	Sun, 23 Feb 2020 23:04:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFCB860BEC;
	Sun, 23 Feb 2020 23:04:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A82AB860C5;
	Sun, 23 Feb 2020 23:04:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01NN3fBY030058 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 23 Feb 2020 18:03:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9A78C2063FE5; Sun, 23 Feb 2020 23:03:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 957BC2026D68
	for <dm-devel@redhat.com>; Sun, 23 Feb 2020 23:03:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 782FA185A78E
	for <dm-devel@redhat.com>; Sun, 23 Feb 2020 23:03:39 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-320-LuJ6jaM7MliU9gkZQTP0PQ-1; Sun, 23 Feb 2020 18:03:35 -0500
X-MC-Unique: LuJ6jaM7MliU9gkZQTP0PQ-1
Received: from dread.disaster.area (pa49-195-185-106.pa.nsw.optusnet.com.au
	[49.195.185.106])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id C92953A2160;
	Mon, 24 Feb 2020 10:03:31 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j60Ha-0004Lm-SA; Mon, 24 Feb 2020 10:03:30 +1100
Date: Mon, 24 Feb 2020 10:03:30 +1100
From: Dave Chinner <david@fromorbit.com>
To: Vivek Goyal <vgoyal@redhat.com>
Message-ID: <20200223230330.GE10737@dread.disaster.area>
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200221201759.GF25974@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LYdCFQXi c=1 sm=1 tr=0
	a=bkRQb8bsQZKWSSj4M57YXw==:117 a=bkRQb8bsQZKWSSj4M57YXw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=20KFwNOVAAAA:8 a=7-415B0cAAAA:8 a=Tiexoni3D8iDDdk-dk8A:9
	a=e9bV8kUA3kBD_Rgu:21 a=cgdUXTeVlpyUC10k:21 a=CjuIK1q_8ugA:10
	a=biEYGPWJfzWAr4FL6Ov7:22
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01NN3fBY030058
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

On Fri, Feb 21, 2020 at 03:17:59PM -0500, Vivek Goyal wrote:
> On Fri, Feb 21, 2020 at 01:32:48PM -0500, Jeff Moyer wrote:
> > Vivek Goyal <vgoyal@redhat.com> writes:
> > 
> > > On Thu, Feb 20, 2020 at 04:35:17PM -0500, Jeff Moyer wrote:
> > >> Vivek Goyal <vgoyal@redhat.com> writes:
> > >> 
> > >> > Currently pmem_clear_poison() expects offset and len to be sector aligned.
> > >> > Atleast that seems to be the assumption with which code has been written.
> > >> > It is called only from pmem_do_bvec() which is called only from pmem_rw_page()
> > >> > and pmem_make_request() which will only passe sector aligned offset and len.
> > >> >
> > >> > Soon we want use this function from dax_zero_page_range() code path which
> > >> > can try to zero arbitrary range of memory with-in a page. So update this
> > >> > function to assume that offset and length can be arbitrary and do the
> > >> > necessary alignments as needed.
> > >> 
> > >> What caller will try to zero a range that is smaller than a sector?
> > >
> > > Hi Jeff,
> > >
> > > New dax zeroing interface (dax_zero_page_range()) can technically pass
> > > a range which is less than a sector. Or which is bigger than a sector
> > > but start and end are not aligned on sector boundaries.
> > 
> > Sure, but who will call it with misaligned ranges?
> 
> create a file foo.txt of size 4K and then truncate it.
> 
> "truncate -s 23 foo.txt". Filesystems try to zero the bytes from 24 to
> 4095.

This should fail with EIO. Only full page writes should clear the
bad page state, and partial writes should therefore fail because
they do not guarantee the data in the filesystem block is all good.

If this zeroing was a buffered write to an address with a bad
sector, then the writeback will fail and the user will (eventually)
get an EIO on the file.

DAX should do the same thing, except because the zeroing is
synchronous (i.e. done directly by the truncate syscall) we can -
and should - return EIO immediately.

Indeed, with your code, if we then extend the file by truncating up
back to 4k, then the range between 23 and 512 is still bad, even
though we've successfully zeroed it and the user knows it. An
attempt to read anywhere in this range (e.g. 10 bytes at offset 100)
will fail with EIO, but reading 10 bytes at offset 2000 will
succeed.

That's *awful* behaviour to expose to userspace, especially when
they look at the fs config and see that it's using both 4kB block
and sector sizes...

The only thing that makes sense from a filesystem perspective is
clearing bad page state when entire filesystem blocks are
overwritten. The data in a filesystem block is either good or bad,
and it doesn't matter how many internal (kernel or device) sectors
it has.

> > And what happens to the rest?  The caller is left to trip over the
> > errors?  That sounds pretty terrible.  I really think there needs to be
> > an explicit contract here.
> 
> Ok, I think is is the contentious bit. Current interface
> (__dax_zero_page_range()) either clears the poison (if I/O is aligned to
> sector) or expects page to be free of poison.
> 
> So in above example, of "truncate -s 23 foo.txt", currently I get an error
> because range being zeroed is not sector aligned. So
> __dax_zero_page_range() falls back to calling direct_access(). Which
> fails because there are poisoned sectors in the page.
> 
> With my patches, dax_zero_page_range(), clears the poison from sector 1 to
> 7 but leaves sector 0 untouched and just writes zeroes from byte 0 to 511
> and returns success.

Ok, kernel sectors are not the unit of granularity bad page state
should be managed at. They don't match page state granularity, and
they don't match filesystem block granularity, and the whacky
"partial writes silently succeed, reads fail unpredictably"
assymetry it leads to will just cause problems for users.

> So question is, is this better behavior or worse behavior. If sector 0
> was poisoned, it will continue to remain poisoned and caller will come
> to know about it on next read and then it should try to truncate file
> to length 0 or unlink file or restore that file to get rid of poison.

Worse, because the filesystem can't track what sub-parts of the
block are bad and that leads to inconsistent data integrity status
being exposed to userspace.


> IOW, if a partial block is being zeroed and if it is poisoned, caller
> will not be return an error and poison will not be cleared and memory
> will be zeroed. What do we expect in such cases.
> 
> Do we expect an interface where if there are any bad blocks in the range
> being zeroed, then they all should be cleared (and hence all I/O should
> be aligned) otherwise error is returned. If yes, I could make that
> change.
> 
> Downside of current interface is that it will clear as many blocks as
> possible in the given range and leave starting and end blocks poisoned
> (if it is unaligned) and not return error. That means a reader will
> get error on these blocks again and they will have to try to clear it
> again.

Which is solved by having partial page writes always EIO on poisoned
memory.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

