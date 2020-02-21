Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD8016895D
	for <lists+dm-devel@lfdr.de>; Fri, 21 Feb 2020 22:31:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582320695;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Qmt9Qyi8VS2LcWftIYqGwlrUT2ExXXqnY64Sxe02h94=;
	b=Wi6lzhkFT3vQFmlBVkkI+N12AvWT9hgFt0xxQh+gaDKJWOxXpFybk8VwdyhXEzk7KHY6E8
	/gvMnoJsnfWxw4CxA+f1D83g7KFXzRKKbHBdDlXlB4xJbxScByPWqJWizr/YuW1KUKJgN/
	8lYyk/BX6YZl14Yk8USbDLZejrpCMh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-GKiBDJzcNXSOwbIG05i3xw-1; Fri, 21 Feb 2020 16:31:32 -0500
X-MC-Unique: GKiBDJzcNXSOwbIG05i3xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAB76800D5E;
	Fri, 21 Feb 2020 21:31:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 561E75DA76;
	Fri, 21 Feb 2020 21:31:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1383B860C7;
	Fri, 21 Feb 2020 21:31:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01LLVDoT027185 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 16:31:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 253F7103253E; Fri, 21 Feb 2020 21:31:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 205E9103253D
	for <dm-devel@redhat.com>; Fri, 21 Feb 2020 21:31:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F4091185A78F
	for <dm-devel@redhat.com>; Fri, 21 Feb 2020 21:31:10 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-266-FO63kuELMM2dwfjOO_-GPw-1; Fri, 21 Feb 2020 16:31:08 -0500
X-MC-Unique: FO63kuELMM2dwfjOO_-GPw-1
Received: by mail-oi1-f196.google.com with SMTP id 18so85305oij.6
	for <dm-devel@redhat.com>; Fri, 21 Feb 2020 13:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CGRGyvmgrURrZb8JP76tjcYyGmXD/dSyGlZGFapcV9E=;
	b=heM8bIyCcqmXwEZvUtOp6WvPDLWmoTqKv5OFbtHvparZIHL/agCU07MvsLS5EC9XaY
	2FdDdzQMz89WA8WbX0AScQhYhPNIrqDrwVJiF2WZcv2DrO9CUNg8pGlorzhOkOnBNboi
	/BLJsks9gynIAjppp6SpxxNdfeLkbeLg7X2XTklLPIqPYs9QvEW1QZL+92xPsj+gnXFU
	NAStnGQUoCNm7eHf0TVxTygjOYECpI3aS2zyZjJyU42GbK7GS7HsYwlooV9xFSFXnnpW
	AxUO/tSFHrMpdrfNjRc5BY0ojEDD/nXnkcClfeoX0hfzfTZUDJ0eLdrFyh7DZGTuFJKp
	PsDg==
X-Gm-Message-State: APjAAAWYZze9Cjqxn7YVmw7tO6Nay0lmhhuHn75fk3VnR+XJ461klPA2
	5Xm3hNONgHm2bRdm3Kk941F54SPNpcIGGG9waIi6gA==
X-Google-Smtp-Source: APXvYqzwgROo2U/pxVS1cKTSLnTsAFtRvHb1ZffYyzADG/jhKo8J5sdfjvLjWmiXOTRlHzvw+Yt2nVnFYHzxgBiVEkI=
X-Received: by 2002:a54:4791:: with SMTP id o17mr3613643oic.70.1582320667197; 
	Fri, 21 Feb 2020 13:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<CAPcyv4j3BPGvrhuVaQZgvZ0i+M+i-Ab0BH+mAjR_aZzu4_kidQ@mail.gmail.com>
	<20200221212449.GG25974@redhat.com>
In-Reply-To: <20200221212449.GG25974@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 21 Feb 2020 13:30:56 -0800
Message-ID: <CAPcyv4gBHuTDW1M-3W=0nuH1v3whChb8TAK1aA0gosBSKpkqcg@mail.gmail.com>
To: Vivek Goyal <vgoyal@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01LLVDoT027185
X-loop: dm-devel@redhat.com
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, Jeff Moyer <jmoyer@redhat.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>
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

On Fri, Feb 21, 2020 at 1:25 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>
> On Fri, Feb 21, 2020 at 01:00:29PM -0800, Dan Williams wrote:
> > On Fri, Feb 21, 2020 at 12:18 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> > >
> > > On Fri, Feb 21, 2020 at 01:32:48PM -0500, Jeff Moyer wrote:
> > > > Vivek Goyal <vgoyal@redhat.com> writes:
> > > >
> > > > > On Thu, Feb 20, 2020 at 04:35:17PM -0500, Jeff Moyer wrote:
> > > > >> Vivek Goyal <vgoyal@redhat.com> writes:
> > > > >>
> > > > >> > Currently pmem_clear_poison() expects offset and len to be sector aligned.
> > > > >> > Atleast that seems to be the assumption with which code has been written.
> > > > >> > It is called only from pmem_do_bvec() which is called only from pmem_rw_page()
> > > > >> > and pmem_make_request() which will only passe sector aligned offset and len.
> > > > >> >
> > > > >> > Soon we want use this function from dax_zero_page_range() code path which
> > > > >> > can try to zero arbitrary range of memory with-in a page. So update this
> > > > >> > function to assume that offset and length can be arbitrary and do the
> > > > >> > necessary alignments as needed.
> > > > >>
> > > > >> What caller will try to zero a range that is smaller than a sector?
> > > > >
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
> > >
> > > I have also written a test for this.
> > >
> > > https://github.com/rhvgoyal/misc/blob/master/pmem-tests/iomap-range-test.sh#L102
> > >
> > > >
> > > > > At this point of time, all I care about is that case of an arbitrary
> > > > > range is handeled well. So if a caller passes a range in, we figure
> > > > > out subrange which is sector aligned in terms of start and end, and
> > > > > clear poison on those sectors and ignore rest of the range. And
> > > > > this itself will be an improvement over current behavior where
> > > > > nothing is cleared if I/O is not sector aligned.
> > > >
> > > > I don't think this makes sense.  The caller needs to know about the
> > > > blast radius of errors.  This is why I asked for a concrete example.
> > > > It might make more sense, for example, to return an error if not all of
> > > > the errors could be cleared.
> > > >
> > > > >> > nvdimm_clear_poison() seems to assume offset and len to be aligned to
> > > > >> > clear_err_unit boundary. But this is currently internal detail and is
> > > > >> > not exported for others to use. So for now, continue to align offset and
> > > > >> > length to SECTOR_SIZE boundary. Improving it further and to align it
> > > > >> > to clear_err_unit boundary is a TODO item for future.
> > > > >>
> > > > >> When there is a poisoned range of persistent memory, it is recorded by
> > > > >> the badblocks infrastructure, which currently operates on sectors.  So,
> > > > >> no matter what the error unit is for the hardware, we currently can't
> > > > >> record/report to userspace anything smaller than a sector, and so that
> > > > >> is what we expect when clearing errors.
> > > > >>
> > > > >> Continuing on for completeness, we will currently not map a page with
> > > > >> badblocks into a process' address space.  So, let's say you have 256
> > > > >> bytes of bad pmem, we will tell you we've lost 512 bytes, and even if
> > > > >> you access a valid mmap()d address in the same page as the poisoned
> > > > >> memory, you will get a segfault.
> > > > >>
> > > > >> Userspace can fix up the error by calling write(2) and friends to
> > > > >> provide new data, or by punching a hole and writing new data to the hole
> > > > >> (which may result in getting a new block, or reallocating the old block
> > > > >> and zeroing it, which will clear the error).
> > > > >
> > > > > Fair enough. I do not need poison clearing at finer granularity. It might
> > > > > be needed once dev_dax path wants to clear poison. Not sure how exactly
> > > > > that works.
> > > >
> > > > It doesn't.  :)
> > > >
> > > > >> > +        /*
> > > > >> > +         * Callers can pass arbitrary offset and len. But nvdimm_clear_poison()
> > > > >> > +         * expects memory offset and length to meet certain alignment
> > > > >> > +         * restrction (clear_err_unit). Currently nvdimm does not export
> > > > >>                                                   ^^^^^^^^^^^^^^^^^^^^^^
> > > > >> > +         * required alignment. So align offset and length to sector boundary
> > > > >>
> > > > >> What is "nvdimm" in that sentence?  Because the nvdimm most certainly
> > > > >> does export the required alignment.  Perhaps you meant libnvdimm?
> > > > >
> > > > > I meant nvdimm_clear_poison() function in drivers/nvdimm/bus.c. Whatever
> > > > > it is called. It first queries alignement required (clear_err_unit) and
> > > > > then makes sure range passed in meets that alignment requirement.
> > > >
> > > > My point was your comment is misleading.
> > > >
> > > > >> We could potentially support clearing less than a sector, but I'd have
> > > > >> to understand the use cases better before offerring implementation
> > > > >> suggestions.
> > > > >
> > > > > I don't need clearing less than a secotr. Once somebody needs it they
> > > > > can implement it. All I am doing is making sure current logic is not
> > > > > broken when dax_zero_page_range() starts using this logic and passes
> > > > > an arbitrary range. We need to make sure we internally align I/O
> > > >
> > > > An arbitrary range is the same thing as less than a sector.  :)  Do you
> > > > know of an instance where the range will not be sector-aligned and sized?
> > > >
> > > > > and carve out an aligned sub-range and pass that subrange to
> > > > > nvdimm_clear_poison().
> > > >
> > > > And what happens to the rest?  The caller is left to trip over the
> > > > errors?  That sounds pretty terrible.  I really think there needs to be
> > > > an explicit contract here.
> > >
> > > Ok, I think is is the contentious bit. Current interface
> > > (__dax_zero_page_range()) either clears the poison (if I/O is aligned to
> > > sector) or expects page to be free of poison.
> > >
> > > So in above example, of "truncate -s 23 foo.txt", currently I get an error
> > > because range being zeroed is not sector aligned. So
> > > __dax_zero_page_range() falls back to calling direct_access(). Which
> > > fails because there are poisoned sectors in the page.
> > >
> > > With my patches, dax_zero_page_range(), clears the poison from sector 1 to
> > > 7 but leaves sector 0 untouched and just writes zeroes from byte 0 to 511
> > > and returns success.
> > >
> > > So question is, is this better behavior or worse behavior. If sector 0
> > > was poisoned, it will continue to remain poisoned and caller will come
> > > to know about it on next read and then it should try to truncate file
> > > to length 0 or unlink file or restore that file to get rid of poison.
> > >
> > > IOW, if a partial block is being zeroed and if it is poisoned, caller
> > > will not be return an error and poison will not be cleared and memory
> > > will be zeroed. What do we expect in such cases.
> > >
> > > Do we expect an interface where if there are any bad blocks in the range
> > > being zeroed, then they all should be cleared (and hence all I/O should
> > > be aligned) otherwise error is returned. If yes, I could make that
> > > change.
> >
> > This does not strike me as a good idea because it's a false security
> > compared to the latent poison case. If the writes to an unknown
> > poisoned location would otherwise succeed via a different I/O path
> > (dax), it's an unsymmetric surprise to start returning errors just
> > because you wrote zeroes as a side effect of truncate.
> >
> > > Downside of current interface is that it will clear as many blocks as
> > > possible in the given range and leave starting and end blocks poisoned
> > > (if it is unaligned) and not return error. That means a reader will
> > > get error on these blocks again and they will have to try to clear it
> > > again.
> >
> > I think what you have described in your truncate example is an
> > improvement on what we have currently because x86 does not communicate
> > write errors. Specifically, writing zeros via dax from userspace over
> > unknown poison behaves the same as writing unaligned zeros over known
> > poison. In both cases it's a best effort that always succeeds (no cpu
> > exception), and may inadvertently clear poison as a side-effect.
> > Otherwise, an error-block-aligned hole punch is the only way to
> > trigger the kernel to try to clear known poison when the full block is
> > reallocated.
>
> Hi Dan,
>
> Agreed. This new interface works uniformly for both known poison and latent
> poison cases. Existing interface is asymmetric and that means if poison is
> latent, unaligned zero range will succeed but if poison is known, unaligned
> zero range will fail.
>
> >
> > On movdir64b capable cpus the error clearing unit becomes 64-bytes
> > rather than 256-bytes because that allows a cacheline to be written
> > without triggering a line fill read. So the error clearing granularity
> > gets better over time, but unfortunately not synchronous detection in
> > the I/O path.
> >
> > I think a better way to improve poison handling is the long standing
> > idea to integrate the badblock tracking into the filesystem directly.
> > That way driver notifications of poison can be ingested into the
> > filesystem and notifications sent on filenames rather than the current
> > TOCTOU mess of trying to do a reverse lookup of badblock numbers to
> > files. If the application can efficiently list and be notified of
> > poison it can mitigate it immediately rather than trying to rely on
> > write side effects.
>
> Moving badblocks infrastructure in filesystem sounds like a major
> rework which should be taken up in a seprate patch series in future.
>
> For now, can we please take these patches which are an improvement
> over existing interface.

Oh you misunderstood my comment, the "move badblocks to filesystem"
proposal is long term / down the road thing to consider. In the near
term this unaligned block zeroing facility is an improvement.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

