Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DB05616B121
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 21:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582577359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OBvHAA8ZEzpfY0+kpnRd9LiCDBbMDGKTd9fwnyI0weA=;
	b=btAcQ+R9sDBgU/vKwhgbrYlv8vaeYegE51Y93We4irSgp7+b94I7z7l0+AbLV07IPG1aVp
	zaBADOWXlQ+uH55F22e2YRsLCke6/xVEK7gc7I19XGLl+rspX84pObtgtV4g0ImMSNBINj
	b836ostyaly+ys7NB+V8VCGCT2s/xY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-0CWgs7zLMZGq1ja5tAybpg-1; Mon, 24 Feb 2020 15:49:17 -0500
X-MC-Unique: 0CWgs7zLMZGq1ja5tAybpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBC85107ACC4;
	Mon, 24 Feb 2020 20:49:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 585275C241;
	Mon, 24 Feb 2020 20:49:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 163C5860EE;
	Mon, 24 Feb 2020 20:49:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OKmq4c016474 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 15:48:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 30F5511701C3; Mon, 24 Feb 2020 20:48:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CE441005E33
	for <dm-devel@redhat.com>; Mon, 24 Feb 2020 20:48:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5329C185A78F
	for <dm-devel@redhat.com>; Mon, 24 Feb 2020 20:48:50 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-162-X1Dusal_PSCoyG5Z6FamMg-1; Mon, 24 Feb 2020 15:48:47 -0500
X-MC-Unique: X1Dusal_PSCoyG5Z6FamMg-1
Received: by mail-oi1-f193.google.com with SMTP id q84so10324575oic.4
	for <dm-devel@redhat.com>; Mon, 24 Feb 2020 12:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SgZHYl1BMtpAqpoWbYdfREDy18hvizQvMzzZmZXu1S8=;
	b=BewajWR9Y+q0eKRROLVJKcn35Lh8Qln+s+1V8dMsJ1HglYQUg7MiyDhv+qGnsEKQVJ
	Pw7e0q2r1XJiaMjL/rOtPg1QoCK2rbSIh4dCb3EOrK0P3w1aylKErGwI1ueCEQvwQpp+
	olws36asSnf9NeMt2k6w0GDoS2F1NvwsPf81V7UmoK5hTYb+6ZJwtVznIyPfx9SuSRRu
	N/bl/+T//lUa7LfdttxAN7hYZts4t0Qfzf9FgwFzVm2umIZP9Y4/7p8ZNMxdyetzXH6M
	f1SRXW9jMItOkjH6ueU0fJM0QfczmvRWQJ1FfwKMnm9g1khWnxJ323SDT7Nz49FpeUuE
	0V8Q==
X-Gm-Message-State: APjAAAVbnXfA4B1uH/BJ4KRnMqOn8ENxurnC+Kp5ncOUwf24at9kKKkr
	DUjnZ+dAGD/N3hTCOYbiV7t/+3/kTcxh09EjnbcXpiGG
X-Google-Smtp-Source: APXvYqxrYIrrrwPEBB6Lwnzh035Wdyj3hLwBuVTxDgyCd2qJfvdgrLSkIdtqIDtiMk2epXPnZjZMsEdgwQiXqGN6fIg=
X-Received: by 2002:a05:6808:a83:: with SMTP id q3mr814153oij.0.1582577326496; 
	Mon, 24 Feb 2020 12:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
	<CAPcyv4ghusuMsAq8gSLJKh1fiKjwa8R_-ojVgjsttoPRqBd_Sg@mail.gmail.com>
	<x49blpop00m.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x49blpop00m.fsf@segfault.boston.devel.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 24 Feb 2020 12:48:35 -0800
Message-ID: <CAPcyv4gCA_oR8_8+zhAhMnqOga9GcpMX97S+x8_UD6zLEQ0Cew@mail.gmail.com>
To: Jeff Moyer <jmoyer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OKmq4c016474
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	Dave Chinner <david@fromorbit.com>, Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2020 at 5:50 AM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Sun, Feb 23, 2020 at 3:03 PM Dave Chinner <david@fromorbit.com> wrote:
> >>
> >> On Fri, Feb 21, 2020 at 03:17:59PM -0500, Vivek Goyal wrote:
> >> > On Fri, Feb 21, 2020 at 01:32:48PM -0500, Jeff Moyer wrote:
> >> > > Vivek Goyal <vgoyal@redhat.com> writes:
> >> > >
> >> > > > On Thu, Feb 20, 2020 at 04:35:17PM -0500, Jeff Moyer wrote:
> >> > > >> Vivek Goyal <vgoyal@redhat.com> writes:
> >> > > >>
> >> > > >> > Currently pmem_clear_poison() expects offset and len to be sector aligned.
> >> > > >> > Atleast that seems to be the assumption with which code has been written.
> >> > > >> > It is called only from pmem_do_bvec() which is called only from pmem_rw_page()
> >> > > >> > and pmem_make_request() which will only passe sector aligned offset and len.
> >> > > >> >
> >> > > >> > Soon we want use this function from dax_zero_page_range() code path which
> >> > > >> > can try to zero arbitrary range of memory with-in a page. So update this
> >> > > >> > function to assume that offset and length can be arbitrary and do the
> >> > > >> > necessary alignments as needed.
> >> > > >>
> >> > > >> What caller will try to zero a range that is smaller than a sector?
> >> > > >
> >> > > > Hi Jeff,
> >> > > >
> >> > > > New dax zeroing interface (dax_zero_page_range()) can technically pass
> >> > > > a range which is less than a sector. Or which is bigger than a sector
> >> > > > but start and end are not aligned on sector boundaries.
> >> > >
> >> > > Sure, but who will call it with misaligned ranges?
> >> >
> >> > create a file foo.txt of size 4K and then truncate it.
> >> >
> >> > "truncate -s 23 foo.txt". Filesystems try to zero the bytes from 24 to
> >> > 4095.
> >>
> >> This should fail with EIO. Only full page writes should clear the
> >> bad page state, and partial writes should therefore fail because
> >> they do not guarantee the data in the filesystem block is all good.
> >>
> >> If this zeroing was a buffered write to an address with a bad
> >> sector, then the writeback will fail and the user will (eventually)
> >> get an EIO on the file.
> >>
> >> DAX should do the same thing, except because the zeroing is
> >> synchronous (i.e. done directly by the truncate syscall) we can -
> >> and should - return EIO immediately.
> >>
> >> Indeed, with your code, if we then extend the file by truncating up
> >> back to 4k, then the range between 23 and 512 is still bad, even
> >> though we've successfully zeroed it and the user knows it. An
> >> attempt to read anywhere in this range (e.g. 10 bytes at offset 100)
> >> will fail with EIO, but reading 10 bytes at offset 2000 will
> >> succeed.
> >>
> >> That's *awful* behaviour to expose to userspace, especially when
> >> they look at the fs config and see that it's using both 4kB block
> >> and sector sizes...
> >>
> >> The only thing that makes sense from a filesystem perspective is
> >> clearing bad page state when entire filesystem blocks are
> >> overwritten. The data in a filesystem block is either good or bad,
> >> and it doesn't matter how many internal (kernel or device) sectors
> >> it has.
> >>
> >> > > And what happens to the rest?  The caller is left to trip over the
> >> > > errors?  That sounds pretty terrible.  I really think there needs to be
> >> > > an explicit contract here.
> >> >
> >> > Ok, I think is is the contentious bit. Current interface
> >> > (__dax_zero_page_range()) either clears the poison (if I/O is aligned to
> >> > sector) or expects page to be free of poison.
> >> >
> >> > So in above example, of "truncate -s 23 foo.txt", currently I get an error
> >> > because range being zeroed is not sector aligned. So
> >> > __dax_zero_page_range() falls back to calling direct_access(). Which
> >> > fails because there are poisoned sectors in the page.
> >> >
> >> > With my patches, dax_zero_page_range(), clears the poison from sector 1 to
> >> > 7 but leaves sector 0 untouched and just writes zeroes from byte 0 to 511
> >> > and returns success.
> >>
> >> Ok, kernel sectors are not the unit of granularity bad page state
> >> should be managed at. They don't match page state granularity, and
> >> they don't match filesystem block granularity, and the whacky
> >> "partial writes silently succeed, reads fail unpredictably"
> >> assymetry it leads to will just cause problems for users.
> >>
> >> > So question is, is this better behavior or worse behavior. If sector 0
> >> > was poisoned, it will continue to remain poisoned and caller will come
> >> > to know about it on next read and then it should try to truncate file
> >> > to length 0 or unlink file or restore that file to get rid of poison.
> >>
> >> Worse, because the filesystem can't track what sub-parts of the
> >> block are bad and that leads to inconsistent data integrity status
> >> being exposed to userspace.
> >
> > The driver can't track it either. Latent poison isn't know until it is
> > consumed, and writes to latent poison are not guaranteed to clear it.
>
> I believe we're discussing the case where we know there is a bad block.
> Obviously we can't know about latent errors.
>
> >> > IOW, if a partial block is being zeroed and if it is poisoned, caller
> >> > will not be return an error and poison will not be cleared and memory
> >> > will be zeroed. What do we expect in such cases.
> >> >
> >> > Do we expect an interface where if there are any bad blocks in the range
> >> > being zeroed, then they all should be cleared (and hence all I/O should
> >> > be aligned) otherwise error is returned. If yes, I could make that
> >> > change.
> >> >
> >> > Downside of current interface is that it will clear as many blocks as
> >> > possible in the given range and leave starting and end blocks poisoned
> >> > (if it is unaligned) and not return error. That means a reader will
> >> > get error on these blocks again and they will have to try to clear it
> >> > again.
> >>
> >> Which is solved by having partial page writes always EIO on poisoned
> >> memory.
> >
> > The problem with the above is that partial page writes can not be
> > guaranteed to return EIO. Poison is only detected on consumed reads,
> > or a periodic scrub, not writes. IFF poison detection was always
> > synchronous with poison creation then the above makes sense. However,
> > with asynchronous signaling, it's fundamentally a false security
> > blanket to assume even full block writes will clear poison unless a
> > callback to firmware is made for every block.
>
> Let's just focus on reporting errors when we know we have them.

That's the problem in my eyes. If software needs to contend with
latent error reporting then it should always contend otherwise
software has multiple error models to wrangle.

Setting that aside we can start with just treating zeroing the same as
the copy_from_iter() case and fail the I/O at the dax_direct_access()
step.

I'd rather have a separate op that filesystems can use to clear errors
at block allocation time that can be enforced to have the correct
alignment.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

