Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEEE212798
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 17:18:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593703127;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fbYwXXPxU/X1W4HYQq0Oy2VUL+WzZAS7IQZ3Gn1H838=;
	b=ilf4mQzPxoZiMgL4vRU/nZt2uiipu7UEbcRnmJeIJHa+z8zC1rDExb49KK6mMcWrt7UPrq
	93TMFwzdqXL8ktBSZIu0m0vcmYMyaNzEZNfzYl4lZyAXlMFjS6+O11LFjZ/MNShEWgbE6A
	ToYFS++8T97JCKqj9mSKTXuG0cu+yp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-gL5Kr95DNhWCJuIzlQFKLw-1; Thu, 02 Jul 2020 11:18:45 -0400
X-MC-Unique: gL5Kr95DNhWCJuIzlQFKLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A50D88CA881;
	Thu,  2 Jul 2020 15:18:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 849B75C1D6;
	Thu,  2 Jul 2020 15:18:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1ABFD6C9C6;
	Thu,  2 Jul 2020 15:18:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062FIaDi016753 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 11:18:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D300D100164D; Thu,  2 Jul 2020 15:18:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DC051001268;
	Thu,  2 Jul 2020 15:18:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 062FIU3s011474; 
	Thu, 2 Jul 2020 10:18:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 062FITxs011473;
	Thu, 2 Jul 2020 10:18:29 -0500
Date: Thu, 2 Jul 2020 10:18:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200702151829.GA11089@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
	<20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
	<20200618230625.GJ5894@octiron.msp.redhat.com>
	<5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
	<20200702031449.GB29962@octiron.msp.redhat.com>
	<8158d509bca2cae483d553defdd1eb378c16d813.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <8158d509bca2cae483d553defdd1eb378c16d813.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/7] Fix muitpath/multipathd flush issue
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Jul 02, 2020 at 12:24:32PM +0000, Martin Wilck wrote:
> On Wed, 2020-07-01 at 22:14 -0500, Benjamin Marzinski wrote:
> > On Wed, Jul 01, 2020 at 10:54:34PM +0200, Martin Wilck wrote:
> > > On Thu, 2020-06-18 at 18:06 -0500, Benjamin Marzinski wrote:
> > > > I uploaded the test program, aio_test:
> > > >=20
> > > > https://github.com/bmarzins/test_programs.git
> > > >=20
> > > > You just need to run in on a queueing multipath device with no
> > > > active
> > > > paths and an open count of 0. It will hang with the device open.
> > > > Restore
> > > > a path, and it will exit, and the open count will go to 0.
> > >=20
> > > Tried it now, it behaves as you say. I admit I can't imagine how
> > > the
> > > suspend/resume would improve anything here. Indeed, as you say, it
> > > opens=20
> > > up a race window. Another process might open the device while
> > > it's suspended. Worse perhaps, once the device is resumed, an
> > > uevent will be=20
> > > generated, and stacked devices might (in principle at least) be
> > > recreated
> > > before we get down to flush the map.
> > >=20
> > > MAYBE the suspend/resume was necessary in the past because some
> > > earlier=20
> > > kernels wouldn't immediately fail all outstanding commands when=20
> > > queue_if_no_path was deactivated? (just speculating, I don't know
> > > if this
> > > is the case).
> >=20
> > If you disable queue_if_no_path and then do a suspend with flushing,
> > you
> > are guaranteed that the supend won't return until all the IO has
> > completed or failed.
>=20
> I just realized that if we suspend, we don't even need disable
> queue_if_no_path, because the kernel does that automatically if a
> "suspend with flush" is issued, and has been doing so basically
> forever.
>=20
> >   This would allow anything that was waiting on
> > queued IO to have the IO failback, which could allow it to close the
> > device in time for multipath to be able to remove it (obviously this
> > is
> > racey).  However, this assumes that you do your open checks after the
> > suspend, which multipath no longer does.
> >  I realize that multipath can't
> > suspend until after it tries to remove the partition devices,
> > otherwise
> > those can get stuck. But there probably is some order that gets this
> > all
> > right-ish.
>=20
> Our code is currently racy. IMO we should
>=20
>  0 unset queue_if_no_path
>  1 remove partition mappings
>  2 open(O_EXCL|O_RDONLY) the device
>  3 If this fails, in multipath, try again after a suspend/resume cycle.
>    In multipathd, I think we should just fail for now; perhaps later
>    we could handle the explicit "remove map" command like multipath.
>  4 If it fails again, bail out (in multipath, retry if asked to do so)
>  5 run a "deferred remove" ioctl
>  6 close the fd, the dm device will now be removed "atomically".
>=20
> This cuts down the race window to the minimum possible - after (2), no
> mounts / kpartx / lvm operations won't be possible any more.

I wasn't actually worried about someone wanting to use the device. In
that case the remove should fail.  I was worried about things that would
close the device, but couldn't because of queued IO.  The race I was
talking about is that after whatever has the device open gets the IO
error, it might not close the device before multipath checks the open
count.

Also, I'm not sure that resume helps us, since that will trigger
uevents, which will open the device again.
=20
> When we remove the partition mappings, we could use the same technique
> to avoid races on that layer. Unfortunately, a pending "deferred
> remove" operation doesn't cause new open() or mount() calls to fail; if
> it did, we could use a simpler approach.
>=20
> > So, for a while now, the suspending has been doing nothing for
> > us.  We
> > could either try to reorder things so that we actually try to flush
> > the
> > queued IOs back first (with or without suspending), or we could just
> > remove suspending and say that things are working fine the way they
> > currently are.
>=20
> What else can we do except suspend/resume to avoid racing with pending
> close(), umount() or similar operations? Well, I guess if we open the
> device anyway as I proposed, we could do an fsync() on it. That might
> actually be better because it avoids the uevent being sent on resume.

yeah. I think that simply disabling queueing and doing an fsync() is
probably better than suspending. If new IO comes in after that, then
something IS using the device, and we don't want to remove it. In
multipath, maybe:

1. disable queueing
2. remove partition mappings
3. open device
4. flush
5. check if we are the only opener.
=09If not, and there are retries left... goto 4? sleep and recheck?
=09we don't want to wait if the answer is that they device really
=09is in use.
6. close device
7. remove device

Possibly the solution to not wanting to wait when a device is in use is
that we could add an option to multipath to distinguish between the way
flushing works now, where we check early if the device is in use, and
just bail if it is, and a more aggressive attempt at remove that might
take longer if used on devices that are in use.

-Ben

> We definitely can't suspend the map before we remove the partitions. We
> could try a suspend/resume on the partition devices themselves (or
> fsync()) if the opencount is > 0.
>=20
> Regards,
> Martin
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE  Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix
> Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

