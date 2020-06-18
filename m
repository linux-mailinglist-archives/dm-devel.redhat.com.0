Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D4DA71FFE76
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 01:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592521628;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0li3j/YxziwMyUuhnAu9LGu+c7Vd7mqDo/RIqmouxio=;
	b=gC8fRUEPrHJ0Ewu7kJRMUsoY9XhgZuYwUQZyKnzieaQPEBm/gnm8Y13XgZVdTO3BZswSFd
	g3a/NJL5kh8QhXX2uhgey522IVntdRAy854z3Lj0sxu/OP6g6nS/4SaSHhLGoX+JNa0ber
	ZFRptJVUiTENZLWz9++IAAl8cBmySRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-skyiaa24PPexvGBt9PgIAw-1; Thu, 18 Jun 2020 19:07:06 -0400
X-MC-Unique: skyiaa24PPexvGBt9PgIAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4912D801503;
	Thu, 18 Jun 2020 23:06:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 304FD5C1BB;
	Thu, 18 Jun 2020 23:06:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B0171809547;
	Thu, 18 Jun 2020 23:06:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IN6UbT016972 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 19:06:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A99C05D9E8; Thu, 18 Jun 2020 23:06:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B96665D9E5;
	Thu, 18 Jun 2020 23:06:27 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05IN6QqA026204; 
	Thu, 18 Jun 2020 18:06:26 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05IN6PpP026203;
	Thu, 18 Jun 2020 18:06:25 -0500
Date: Thu, 18 Jun 2020 18:06:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200618230625.GJ5894@octiron.msp.redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<f60b8ea30ee0ce68a46ce8f5c9ebaee6314d57e4.camel@suse.com>
	<20200618180458.GI5894@octiron.msp.redhat.com>
	<c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <c5e95e7bc75b11e811854ff0b0988ff19ef45e13.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Jun 18, 2020 at 08:06:53PM +0000, Martin Wilck wrote:
> On Thu, 2020-06-18 at 13:04 -0500, Benjamin Marzinski wrote:
> > On Thu, Jun 18, 2020 at 09:00:49AM +0000, Martin Wilck wrote:
> > >=20
> > > With queue_if_no_paths, there could be outstanding IO even if the
> > > opencount was 0.
> >=20
> > This is what I don't accept at face value. I wrote a little test
> > program that fired off an async read, closed the fd without waiting
> > for
> > a response, and then tried to exit.  running this on a queueing
> > multipath device causes the exit to hang like this
> >=20
> >  cat /proc/22655/task/22655/stack
> > [<0>] exit_aio+0xdc/0xf0
> > [<0>] mmput+0x33/0x130
> > [<0>] do_exit+0x27f/0xb30
> > [<0>] do_group_exit+0x3a/0xa0
> > [<0>] __x64_sys_exit_group+0x14/0x20
> > [<0>] do_syscall_64+0x5b/0x160
> > [<0>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > [<0>] 0xffffffffffffffff
> >=20
> > and the multipath device to remain in use
> >=20
> > # dmsetup info mpathb
> > Name:              mpathb
> > State:             ACTIVE
> > Read Ahead:        256
> > Tables present:    LIVE
> > Open count:        0
> > Event number:      7
> > Major, minor:      253, 5
> > Number of targets: 1
> > UUID: mpath-3600d0230000000000e13954ed5f89301
> >=20
>=20
> The open count is 0.

Whoops. I copied the output from after I restored the path, and the
program exitted.  While it is hung, you see this:

# dmsetup info mpathb
Name:              mpathb
State:             ACTIVE
Read Ahead:        256
Tables present:    LIVE
Open count:        1
Event number:      8
Major, minor:      253, 5
Number of targets: 1
UUID: mpath-3600d0230000000000e13954ed5f89301

I uploaded the test program, aio_test:

https://github.com/bmarzins/test_programs.git

You just need to run in on a queueing multipath device with no active
paths and an open count of 0. It will hang with the device open. Restore
a path, and it will exit, and the open count will go to 0.

-Ben

> Wouldn't this be exactly the situation that
> Hannes' patch was targeting - opencount 0, but still unable to
> flush/close because of outstanding IO? If multipath was trying to flush
> the map in this situation, it would disable queueing. Your process
> would get an IO error sooner or later, and exit. But depending on the
> amount of outstanding IO and the weather, this might not happen before
> multipath had attempted to flush the map, and the flush attempt would
> fail. By inserting the synchronous flush operation after disabling
> queueing, multipath avoids that failure. Am I misunderstanding
> something?
>=20
>=20
> > I've asked around, and device-mapper is certainly supposed to flush
> > all
> > IO before the last close. Of course, there may be a corner case where
> > it
> > doesn't. If you know of one, that would be worth sharing.
> >=20
> > What I think that flush previously accomplished is that, just like
> > the
> > flush_on_last_del code, if you stop queueing and error out the IO,
> > then
> > whatever is waiting on it will get those errors, and likely close the
> > device soon after, hopefully in time for multipath to remove the
> > device.
> >=20
> > However, since multipath now checks if the device is in use before
> > disabling queue_if_no_path, it don't think this code is actually
> > helpful
> > right now.
> >=20
> > > This IO must be flushed somehow before the map can be
> > > removed. Apparently just setting queue_if_no_path =3D 0 was not
> > > enough,
> > > that's why Hannes added the suspend/resume. Maybe today we have
> > > some
> > > better way to force the flush? libdm has the _error_device()
> > > function=20
> > > (aka dmsetup wipe_table) that replaces the map's table by the error
> > > target. But this does a map reload, which implies a suspend, too.
> > > Perhaps simply an fsync() on the dm device, or just wait a while
> > > until
> > > all outstanding IO has errored out? But these alternatives don't
> > > actually look better to me than Hannes' suspend/resume, they will
> > > take
> > > at least as much time. Do you have a better idea?
> >=20
> > To go back to the old behavior, we would need to move the check if
> > the
> > device is in use until after we suspended the device. Or we can keep
> > the
> > current behavior, and simply remove the flushing and suspending.
> >=20
>=20
> AFAICS the "in use" check looks at the opencount, and according to your
> output above, it can be 0 while IO is outstanding. I haven't checked
> this myself yet. But I can confirm that there was an actual bug (map
> removal failing) that was allegedly fixed by the suspend/resume. It was
> long ago, I can't tell with confidence if it could still happen.
>=20
> Don't get me wrong, I'm not generally opposed to the removal of the
> flush/suspend. I just wanted to clarify why it was there. It has been
> used in multipath only, anyway. If we delegate to multipathd, it makes
> sense to handle the situation in multipathd's manner. If we want to
> make sure the user experience for "multipath -f" users is unchanged, we
> could handle failure accordingly (suspend, resume, and retry flushing
> the map).
>=20
> Best,
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

