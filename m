Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED5116B6AC
	for <lists+dm-devel@lfdr.de>; Tue, 25 Feb 2020 01:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582590431;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V0VlcrccOPoVPev1gFe6XsqupucBOHqtmR6tqOo/sHw=;
	b=hUtpsveSGzF7akBatGuIojyTT1zmCvnYkd2BGRNl785cv60MtHsRrHE50LiSiHkmGJLICf
	1VWu243my5MtBizakyVCGgUZ1e4x+tfbJ9Q5Z7y/J+Xn9EyoM7AH6tpfW7G+03rJPgXUCH
	XPtyz4ZR1wRthc9L76Pvm7WV5KL75Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-i0ENzJleN-ikg7_OZWJfvA-1; Mon, 24 Feb 2020 19:27:08 -0500
X-MC-Unique: i0ENzJleN-ikg7_OZWJfvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C53E013E4;
	Tue, 25 Feb 2020 00:27:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50D388B774;
	Tue, 25 Feb 2020 00:26:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0EC318089C8;
	Tue, 25 Feb 2020 00:26:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01P0QYnk030788 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 19:26:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9296B2031A33; Tue, 25 Feb 2020 00:26:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D6922026D67
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 00:26:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 399E9101A55A
	for <dm-devel@redhat.com>; Tue, 25 Feb 2020 00:26:32 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-458-NY9oVMhANqSuCVbvFNrSFA-1; Mon, 24 Feb 2020 19:26:29 -0500
X-MC-Unique: NY9oVMhANqSuCVbvFNrSFA-1
Received: by mail-ot1-f65.google.com with SMTP id 66so10493156otd.9
	for <dm-devel@redhat.com>; Mon, 24 Feb 2020 16:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0rZ6Shn1iEFflpkftjdeTvb007+jMCYxKoLbQJtlZWQ=;
	b=istxvZBjwR1EVpkXu6/sHuD2aLzf8I/O/ZdTlx+zayQG88EUz0ahZ1QitCv19b6t5i
	2pkalFcFeD/CQzk4nHA02Nk69XSwOY1u3YMxbHnRpSMJ8t3yMRbj4b5C+RffGZ+Rh2Tz
	uFpNfTn4jNpHpS4x06JK4i+PiVBTzzprzSLMJH+8EpD/bpYLgma8aolKSvvC2EjLQPp0
	CyhO6K0ZPmQWw7li/+CCgANt1wIcbob8fxbc0bPhkKjLT86F+/ELdNvy4vEQhdndrZ/y
	ZJtzFEedZzF0EOZ6hBMqnVcVYEAijZIimElu3kSMByOKQAGo+nH8ks59j7QsvYwSxx9v
	1jlw==
X-Gm-Message-State: APjAAAUltg9ydnCB9CIxl0UjFg8aZVmYQBFAAI+aPKFErEEncpPaKF+E
	eb0xw5SmSStIjRxPfcP2hHNBzyQc2I+VRTxZ1YXkww==
X-Google-Smtp-Source: APXvYqxoQtHTd57hLQp9etLHy7uFPZjDlgE79OhxjWcTaJ17f4leO7kHK5MW1rp7sufBCeRKgCdAZWUGb/c8NCZ5utQ=
X-Received: by 2002:a05:6830:134c:: with SMTP id
	r12mr19922104otq.126.1582590388685; 
	Mon, 24 Feb 2020 16:26:28 -0800 (PST)
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
In-Reply-To: <x49sgizodni.fsf@segfault.boston.devel.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 24 Feb 2020 16:26:17 -0800
Message-ID: <CAPcyv4gUM47QgGKvK4ZVUek6f=ABT7hRFX47-DQiD6AcrxtRHA@mail.gmail.com>
To: Jeff Moyer <jmoyer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01P0QYnk030788
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2020 at 1:53 PM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> >> Let's just focus on reporting errors when we know we have them.
> >
> > That's the problem in my eyes. If software needs to contend with
> > latent error reporting then it should always contend otherwise
> > software has multiple error models to wrangle.
>
> The only way for an application to know that the data has been written
> successfully would be to issue a read after every write.  That's not a
> performance hit most applications are willing to take.  And, of course,
> the media can still go bad at a later time, so it only guarantees the
> data is accessible immediately after having been written.
>
> What I'm suggesting is that we should not complete a write successfully
> if we know that the data will not be retrievable.  I wouldn't call this
> adding an extra error model to contend with.  Applications should
> already be checking for errors on write.
>
> Does that make sense? Are we talking past each other?

The badblock list is late to update in both directions, late to add
entries that the scrub needs to find and late to delete entries that
were inadvertently cleared by cache-line writes that did not first
ingest the poison for a read-modify-write. So I see the above as being
wishful in using the error list as the hard source of truth and
unfortunate to up-level all sub-sector error entries into full
PAGE_SIZE data offline events.

I'm hoping we can find a way to make the error handling more fine
grained over time, but for the current patch, managing the blast
radius as PAGE_SIZE granularity at least matches the zero path with
the write path.

> > Setting that aside we can start with just treating zeroing the same as
> > the copy_from_iter() case and fail the I/O at the dax_direct_access()
> > step.
>
> OK.
>
> > I'd rather have a separate op that filesystems can use to clear errors
> > at block allocation time that can be enforced to have the correct
> > alignment.
>
> So would file systems always call that routine instead of zeroing, or
> would they first check to see if there are badblocks?

The proposal is that filesystems distinguish zeroing from free-block
allocation/initialization such that the fsdax implementation directs
initialization to a driver callback. This "initialization op" would
take care to check for poison and clear it. All other dax paths would
not consult the badblocks list.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

