Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3023B212D45
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 21:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593719058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HV0olersoqTo5yW43DHmFL9YEIMzK4uqEn/lu1ECZFk=;
	b=gzx+zFlMbohM4X0rEgKLPn/NI85/3uuVOze7Q9FsK/iFy1Qn9Uv2jb7kXuXQ5pfQ8Ie9b3
	eAXbpkuMQLswS3iAHBGRur7o48tyS6FWyp8kA1vW3eOooepcDggB6cGtHACZXBz8YcyRo4
	k/dSFmPs1fB+gEq9Yk6mvlIJAjHwHb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-6Rg6OVH4MF-2CS2BljXU1A-1; Thu, 02 Jul 2020 15:44:15 -0400
X-MC-Unique: 6Rg6OVH4MF-2CS2BljXU1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22456804008;
	Thu,  2 Jul 2020 19:44:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4930B61985;
	Thu,  2 Jul 2020 19:44:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81CC36C9C6;
	Thu,  2 Jul 2020 19:43:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062JfaOM002766 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 15:41:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22CCD778A4; Thu,  2 Jul 2020 19:41:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 761B27789E;
	Thu,  2 Jul 2020 19:41:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 062JfTb3012623; 
	Thu, 2 Jul 2020 14:41:29 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 062JfSP6012622;
	Thu, 2 Jul 2020 14:41:28 -0500
Date: Thu, 2 Jul 2020 14:41:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200702194128.GG11089@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
	<20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
	<20200618230625.GJ5894@octiron.msp.redhat.com>
	<5357998bd17e1147fd3a6615e03251d1aa4900d8.camel@suse.com>
	<20200702031449.GB29962@octiron.msp.redhat.com>
	<8158d509bca2cae483d553defdd1eb378c16d813.camel@suse.com>
	<20200702151829.GA11089@octiron.msp.redhat.com>
	<cd568c7aabaa102db8ef6ba8ceb87b96d62f632c.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <cd568c7aabaa102db8ef6ba8ceb87b96d62f632c.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 02, 2020 at 04:45:21PM +0000, Martin Wilck wrote:
> On Thu, 2020-07-02 at 10:18 -0500, Benjamin Marzinski wrote:
> > On Thu, Jul 02, 2020 at 12:24:32PM +0000, Martin Wilck wrote:
> > > On Wed, 2020-07-01 at 22:14 -0500, Benjamin Marzinski wrote:
> > > > On Wed, Jul 01, 2020 at 10:54:34PM +0200, Martin Wilck wrote:
> > > > > On Thu, 2020-06-18 at 18:06 -0500, Benjamin Marzinski wrote:
> > > > > > I uploaded the test program, aio_test:
> > > > > > 
> > > > > > https://github.com/bmarzins/test_programs.git
> > > > > > 
> > > > > > You just need to run in on a queueing multipath device with
> > > > > > no
> > > > > > active
> > > > > > paths and an open count of 0. It will hang with the device
> > > > > > open.
> > > > > > Restore
> > > > > > a path, and it will exit, and the open count will go to 0.
> > > > > 
> > > > > Tried it now, it behaves as you say. I admit I can't imagine
> > > > > how
> > > > > the
> > > > > suspend/resume would improve anything here. Indeed, as you say,
> > > > > it
> > > > > opens 
> > > > > up a race window. Another process might open the device while
> > > > > it's suspended. Worse perhaps, once the device is resumed, an
> > > > > uevent will be 
> > > > > generated, and stacked devices might (in principle at least) be
> > > > > recreated
> > > > > before we get down to flush the map.
> > > > > 
> > > > > MAYBE the suspend/resume was necessary in the past because some
> > > > > earlier 
> > > > > kernels wouldn't immediately fail all outstanding commands
> > > > > when 
> > > > > queue_if_no_path was deactivated? (just speculating, I don't
> > > > > know
> > > > > if this
> > > > > is the case).
> > > > 
> > > > If you disable queue_if_no_path and then do a suspend with
> > > > flushing,
> > > > you
> > > > are guaranteed that the supend won't return until all the IO has
> > > > completed or failed.
> > > 
> > > I just realized that if we suspend, we don't even need disable
> > > queue_if_no_path, because the kernel does that automatically if a
> > > "suspend with flush" is issued, and has been doing so basically
> > > forever.
> > > 
> > > >   This would allow anything that was waiting on
> > > > queued IO to have the IO failback, which could allow it to close
> > > > the
> > > > device in time for multipath to be able to remove it (obviously
> > > > this
> > > > is
> > > > racey).  However, this assumes that you do your open checks after
> > > > the
> > > > suspend, which multipath no longer does.
> > > >  I realize that multipath can't
> > > > suspend until after it tries to remove the partition devices,
> > > > otherwise
> > > > those can get stuck. But there probably is some order that gets
> > > > this
> > > > all
> > > > right-ish.
> > > 
> > > Our code is currently racy. IMO we should
> > > 
> > >  0 unset queue_if_no_path
> > >  1 remove partition mappings
> > >  2 open(O_EXCL|O_RDONLY) the device
> > >  3 If this fails, in multipath, try again after a suspend/resume
> > > cycle.
> > >    In multipathd, I think we should just fail for now; perhaps
> > > later
> > >    we could handle the explicit "remove map" command like
> > > multipath.
> > >  4 If it fails again, bail out (in multipath, retry if asked to do
> > > so)
> > >  5 run a "deferred remove" ioctl
> > >  6 close the fd, the dm device will now be removed "atomically".
> > > 
> > > This cuts down the race window to the minimum possible - after (2),
> > > no
> > > mounts / kpartx / lvm operations won't be possible any more.
> > 
> > I wasn't actually worried about someone wanting to use the device. In
> > that case the remove should fail.  I was worried about things that
> > would
> > close the device, but couldn't because of queued IO.  
> > The race I was
> > talking about is that after whatever has the device open gets the IO
> > error, it might not close the device before multipath checks the open
> > count.
> 
> Understood.
> 
> > Also, I'm not sure that resume helps us, since that will trigger
> > uevents, which will open the device again.
> 
> Not sure if I understand correctly: It's possible to just suspend/flush
> and then remove the device, without resuming. But that's dangerous,
> because if some process opens the device while it's resumed, even if
> it's just for reading a single block (think blkid), the open will
> succeed, the IO will hang, the opencount will be increased, and the
> REMOVE ioctl will fail. Therefore I think *if* we suspend we should
> also resume. But I concur wrt the uevent, of course.

We obviously need to resume if the remove fails. I just an not sure we
want to resume before deciding the remove has failed, since it will just
add openers that we don't care about.
 
> > > When we remove the partition mappings, we could use the same
> > > technique
> > > to avoid races on that layer. Unfortunately, a pending "deferred
> > > remove" operation doesn't cause new open() or mount() calls to
> > > fail; if
> > > it did, we could use a simpler approach.
> > > 
> > > > So, for a while now, the suspending has been doing nothing for
> > > > us.  We
> > > > could either try to reorder things so that we actually try to
> > > > flush
> > > > the
> > > > queued IOs back first (with or without suspending), or we could
> > > > just
> > > > remove suspending and say that things are working fine the way
> > > > they
> > > > currently are.
> > > 
> > > What else can we do except suspend/resume to avoid racing with
> > > pending
> > > close(), umount() or similar operations? Well, I guess if we open
> > > the
> > > device anyway as I proposed, we could do an fsync() on it. That
> > > might
> > > actually be better because it avoids the uevent being sent on
> > > resume.
> > 
> > yeah. I think that simply disabling queueing and doing an fsync() is
> > probably better than suspending. If new IO comes in after that, then
> > something IS using the device, and we don't want to remove it. In
> > multipath, maybe:
> > 
> > 1. disable queueing
> > 2. remove partition mappings
> > 3. open device
> > 4. flush
> > 5. check if we are the only opener.
> > 	If not, and there are retries left... goto 4? sleep and
> > recheck?
> > 	we don't want to wait if the answer is that they device really
> > 	is in use.
> > 6. close device
> > 7. remove device
> > 
> > Possibly the solution to not wanting to wait when a device is in use
> > is
> > that we could add an option to multipath to distinguish between the
> > way
> > flushing works now, where we check early if the device is in use, and
> > just bail if it is, and a more aggressive attempt at remove that
> > might
> > take longer if used on devices that are in use.
> 
> What's wrong with deferred remove? After all, the user explicitly asked
> for a flush. As long as some other process has the device open, it
> won't be removed. That's why I like the O_EXCL idea, which will allow
> small programs like blkid to access the device, but will cause all
> attempts to mount or add stacked devices to fail until the device is
> actually removed. I see no reason no to do this, as it's a race anyway
> if some other process opens the device when we're supposed to flush it
> and the opencount already dropped to 0. By using O_EXCL, we just
> increase multipathd's chances to win the race and do what the user
> asked for.

I'm not actually a fan of deferred remove in general. It leaves the
device in this weird state were it is there but no longer openable. I
wish I had originally dealt with deferred removes by having multipathd
occasionally try to flush devices with no paths, or possibly listen for
notifications that the device has been closed, and flush then.

My specific objections here are that not all things that open a device
for longer than an instant do so with O_EXCL.  So it's very possible
that you run "multipath -F", it returns having removed a number of
unused devices.  But some of the devices it didn't remove were opened
without O_EXCL, and they will stick around for a while, and then
suddenly disappear.  Even if they don't say around for that long, this
is a can still effect scripts or other programs that are expecting to
check the device state immediately after calling multipath -F, and
having it not change a second or so later. So far multipath -f/-F will
not return until it has removed all the removeable devices (and waited
for them to be removed from udev). I think it should stay this way.

> To make sure we're on the same boat: this is a topic for a separate
> patch set IMO, I'm not expecting you to fix it in a v3.

Yep. It's future work.

> Cheers,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

