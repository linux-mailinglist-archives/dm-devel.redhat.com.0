Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B912316F244
	for <lists+dm-devel@lfdr.de>; Tue, 25 Feb 2020 22:53:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582667620;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mGHc8cj3kLqdmQaB8oRLW6U5OyJMSaD/gL8haSPQxck=;
	b=F26bNF+ax0TjWD6PhjfkMzY8VJE2qmxNe7AV+46NKUWWPgbrf9k65snZx1GnhcswYRP9HW
	18uXxmk2uSeazny/vxT356ddgrsH/WV6gIYL3HHhZeZZuRu5wdFfDc+zGPSitnT8XW5gUt
	BxL0aBYqRSDeAMN07cT7v4nx7aJ8RII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-GNdYCHjYMyezKmutB5Kk6Q-1; Tue, 25 Feb 2020 16:53:37 -0500
X-MC-Unique: GNdYCHjYMyezKmutB5Kk6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26376107ACC4;
	Tue, 25 Feb 2020 21:53:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40CCA5C541;
	Tue, 25 Feb 2020 21:53:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 925E2860F2;
	Tue, 25 Feb 2020 21:53:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PLqvv0010975 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 16:52:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 058262166B28; Tue, 25 Feb 2020 21:52:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0130E2166B27
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 21:52:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1518C101A55D
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 21:52:55 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-415-4GW0ZFhRM9iwT8dYG4wCzg-1; Tue, 25 Feb 2020 16:52:52 -0500
X-MC-Unique: 4GW0ZFhRM9iwT8dYG4wCzg-1
Received: by mail-ot1-f66.google.com with SMTP id z9so1008166oth.5
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 13:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OrYRx2APBEP0IGi5O6JrXpwD+yjxgHpL5q0jeReN4Ck=;
	b=QqNGtzhhR1gSwUm7cih5gWpy/KYoUBXqvFD/vmGWeFGceTlJoa175AmZ0/3PbC917F
	w43WzZHG289sWrWaQnaKO6/CKWsAXZVjmjeRm26RZdCZQGxRhZ8FP0l5aFYD+KuYRpPi
	uHB8ETHY58bTXDPrkMrtSyc+nnuKn5la4au7gVAorYW8EfgkonYlvt2t7Adkp92bJrgi
	I39pRhsuVjDtX3sr0nZn3xvj+uqlPcjRRLg3KiUxqm1aoETFhi2VlR84lDJO2019Vfj2
	YhqHAviB/JQuIgnfmZWTz3PqshEN74ou7rGIikN/O6Vxmi5xaSH4KPW5R4JmnQkh6yKw
	YFFw==
X-Gm-Message-State: APjAAAVoT+QCRxyWNxIWk8XZ7iIrVNoMbFNt1Jv1RvgjHOLJf3NxOgTx
	bAn5LyBfKrhY2Gtwl0WjmQ5FdUhMyKLqgN7F4leveA==
X-Google-Smtp-Source: APXvYqxPHmhutIT5wF6qrnWszwwGje8ZnLYdoLq4nEjg+MwpQQTy2XZ+kM0QWON34Tw3aqvIR1X1p2Nr8/jouHMY630=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr485677otl.71.1582667570010;
	Tue, 25 Feb 2020 13:52:50 -0800 (PST)
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
	<CAPcyv4gCA_oR8_8+zhAhMnqOga9GcpMX97S+x8_UD6zLEQ0Cew@mail.gmail.com>
	<x49sgizodni.fsf@segfault.boston.devel.redhat.com>
	<CAPcyv4gUM47QgGKvK4ZVUek6f=ABT7hRFX47-DQiD6AcrxtRHA@mail.gmail.com>
	<x494kveh0gm.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x494kveh0gm.fsf@segfault.boston.devel.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 25 Feb 2020 13:52:38 -0800
Message-ID: <CAPcyv4jBCCYXQRjOLHa79rW3qB9kisGRN6yTvcXYs6JJU1-p7g@mail.gmail.com>
To: Jeff Moyer <jmoyer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PLqvv0010975
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

On Tue, Feb 25, 2020 at 12:33 PM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Mon, Feb 24, 2020 at 1:53 PM Jeff Moyer <jmoyer@redhat.com> wrote:
> >>
> >> Dan Williams <dan.j.williams@intel.com> writes:
> >>
> >> >> Let's just focus on reporting errors when we know we have them.
> >> >
> >> > That's the problem in my eyes. If software needs to contend with
> >> > latent error reporting then it should always contend otherwise
> >> > software has multiple error models to wrangle.
> >>
> >> The only way for an application to know that the data has been written
> >> successfully would be to issue a read after every write.  That's not a
> >> performance hit most applications are willing to take.  And, of course,
> >> the media can still go bad at a later time, so it only guarantees the
> >> data is accessible immediately after having been written.
> >>
> >> What I'm suggesting is that we should not complete a write successfully
> >> if we know that the data will not be retrievable.  I wouldn't call this
> >> adding an extra error model to contend with.  Applications should
> >> already be checking for errors on write.
> >>
> >> Does that make sense? Are we talking past each other?
> >
> > The badblock list is late to update in both directions, late to add
> > entries that the scrub needs to find and late to delete entries that
> > were inadvertently cleared by cache-line writes that did not first
> > ingest the poison for a read-modify-write.
>
> We aren't looking for perfection.  If the badblocks list is populated,
> then report the error instead of letting the user write data that we
> know they won't be able to access later.
>
> You have confused me, though, since I thought that stores to bad media
> would not clear errors.  Perhaps you are talking about some future
> hardware implementation that doesn't yet exist?

No, today cacheline aligned DMA, and cpu cachelines that are fully
dirtied without a demand fill can end up clearing poison. The
movdir64b instruction provides a way to force this behavior from the
cpu where it was previously luck.

> > So I see the above as being wishful in using the error list as the
> > hard source of truth and unfortunate to up-level all sub-sector error
> > entries into full PAGE_SIZE data offline events.
>
> The page size granularity is only an issue for mmap().  If you are using
> read/write, then 512 byte granularity can be achieved.  Even with mmap,
> if you encounter an error on a 4k page, you can query the status of each
> sector in that page to isolate the error.  So I'm not quite sure I
> understand what you're getting at.

I'm getting at the fact that we don't allow mmap on PAGE_SIZE
granularity in the presence of errors, and don't allow dax I/O to the
page when an error is present. Only non-dax direct-I/O can read /
write at sub-page granularity in the presence of errors.

The interface to query the status is not coordinated with the
filesystem, but that's a whole other discussion. Yes, we're getting a
bit off in the weeds.

> > I'm hoping we can find a way to make the error handling more fine
> > grained over time, but for the current patch, managing the blast
> > radius as PAGE_SIZE granularity at least matches the zero path with
> > the write path.
>
> I think the write path can do 512 byte granularity, not page size.
> Anyway, I think we've gone far enough off into the weeds that more
> patches will have to be posted for debate.  :)
>

It can't, see dax_iomap_actor(). That call to dax_direct_access() will
fail if it hits a known badblock.

> >> > Setting that aside we can start with just treating zeroing the same as
> >> > the copy_from_iter() case and fail the I/O at the dax_direct_access()
> >> > step.
> >>
> >> OK.
> >>
> >> > I'd rather have a separate op that filesystems can use to clear errors
> >> > at block allocation time that can be enforced to have the correct
> >> > alignment.
> >>
> >> So would file systems always call that routine instead of zeroing, or
> >> would they first check to see if there are badblocks?
> >
> > The proposal is that filesystems distinguish zeroing from free-block
> > allocation/initialization such that the fsdax implementation directs
> > initialization to a driver callback. This "initialization op" would
> > take care to check for poison and clear it. All other dax paths would
> > not consult the badblocks list.
>
> What do you mean by "all other dax paths?"  Would that include
> mmap/direct_access?  Because that definitely should still consult the
> badblocks list.

dax_direct_access() consults the badblock list,
dax_copy_{to,from}_iter() do not, and badblocks discovered after a
page is mapped do not invalidate the page unless the poison is
consumed.

> I'm not against having a separate operation for clearing errors, but I
> guess I'm not convinced it's cleaner, either.

The idea with a separate op is to have an explicit ABI to clear errors
like page-aligned-hole-punch (FALLOC_FL_PUNCH_ERROR?) vs some implicit
side effect of direct-I/O writes.

I also feel like we're heading in a direction that tries to avoid
relying on the cpu machine-check recovery path at all costs. That's
the kernel's prerogative, of course, but it seems like at a minimum
we're not quite on the same page about what role machine-check
recovery plays in the error handling model.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

