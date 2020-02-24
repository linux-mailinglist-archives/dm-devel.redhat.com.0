Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 11B90169B43
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 01:41:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582504894;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YKBkdD4TNvkB4ZzwnNcnw9UxlMMY8l0BIay/iEfR97I=;
	b=WlMg3FhkvigrBwDf8WwNueBoum0oXAUS3bEgiib3DWM2z8CbD/t3CzNdYH81WBkk4NyBQb
	Fu+loEvb495LXSC5/ck9Yi1MFINa8HxAKRvLtLrdjlEFVNhqhujGdr2ySBQpQF1XgRwVjb
	K70Zcl7VbpzVEELcrkLgMT6gVWmsglw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-r4jRRubjO62S_I_5j9fjlg-1; Sun, 23 Feb 2020 19:41:32 -0500
X-MC-Unique: r4jRRubjO62S_I_5j9fjlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F08FA8017CC;
	Mon, 24 Feb 2020 00:41:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F6B760BEC;
	Mon, 24 Feb 2020 00:41:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 465C31809567;
	Mon, 24 Feb 2020 00:41:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O0eveW002706 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 23 Feb 2020 19:40:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9CE3B2063FEA; Mon, 24 Feb 2020 00:40:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97E852063FE6
	for <dm-devel@redhat.com>; Mon, 24 Feb 2020 00:40:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61F0485A308
	for <dm-devel@redhat.com>; Mon, 24 Feb 2020 00:40:55 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-348-ceEheXhPMoqrBf32FscxVw-1; Sun, 23 Feb 2020 19:40:52 -0500
X-MC-Unique: ceEheXhPMoqrBf32FscxVw-1
Received: by mail-oi1-f193.google.com with SMTP id a22so7382524oid.13
	for <dm-devel@redhat.com>; Sun, 23 Feb 2020 16:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/fWYYQZ1tUAo30vrwKRme2xC0z7VIUZp9g41h1//e/o=;
	b=QICH6yTLfRyz3/+fGF6380bAclJ+1COHGX1IKtVLsBlOc5MDPDf2zFaOv2tW+9wO3k
	LZer/AOSeuz1Q7FWXyNR0iwDSdaxohhVhFATbnuh0UsdOkek5pmKi5yviiQ3Toj8Bal3
	cGwbJeHcKFAkyWOULaA7SBpWsa1OaPyNhgkUYTPRsmDHIm6i3uJkMsYwtJV4ZjthT3/2
	6WqKWhbo4RAVJgebqh7SQnYxQOjb/CLUWHYdvhQxeR1DSB6qH5icqkhepBTvPkEIQZIS
	XhGZzQNOOb5f/v1Y3lEVLEygTtcgPw6p2swDQSP5APzmZ2vLH9GgANwG8UDA5LXZ8xxr
	bJCQ==
X-Gm-Message-State: APjAAAU9+v/6OB8ZkLTRwgAMuIiW4rTYtRYI1wwgPfF4a/6z0gVCIKnv
	/JgKRhQM9d6QMgh3gWcS9FUQQhKQdKFzikD1ccXnNw==
X-Google-Smtp-Source: APXvYqwrH1BeHXIjpPFXOS9J7oM8tzow/HkEMYsIW3IDVepJp41zLBuZXXglRgycv6nOwaG/2wuAr/itaObiTZGZwRY=
X-Received: by 2002:aca:3f54:: with SMTP id m81mr10454580oia.73.1582504851476; 
	Sun, 23 Feb 2020 16:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20200218214841.10076-1-vgoyal@redhat.com>
	<20200218214841.10076-3-vgoyal@redhat.com>
	<x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
In-Reply-To: <20200223230330.GE10737@dread.disaster.area>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 23 Feb 2020 16:40:40 -0800
Message-ID: <CAPcyv4ghusuMsAq8gSLJKh1fiKjwa8R_-ojVgjsttoPRqBd_Sg@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01O0eveW002706
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	device-mapper development <dm-devel@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, Jeff Moyer <jmoyer@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 23, 2020 at 3:03 PM Dave Chinner <david@fromorbit.com> wrote:
>
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

The driver can't track it either. Latent poison isn't know until it is
consumed, and writes to latent poison are not guaranteed to clear it.

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

The problem with the above is that partial page writes can not be
guaranteed to return EIO. Poison is only detected on consumed reads,
or a periodic scrub, not writes. IFF poison detection was always
synchronous with poison creation then the above makes sense. However,
with asynchronous signaling, it's fundamentally a false security
blanket to assume even full block writes will clear poison unless a
callback to firmware is made for every block.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

