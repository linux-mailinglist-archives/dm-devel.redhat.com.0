Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF5E1C2135
	for <lists+dm-devel@lfdr.de>; Sat,  2 May 2020 01:22:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588375323;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1U8OlM9l10sxYhDObTzvuyaV32BKURD8BRuquO2gMjc=;
	b=XKYfSMgzMZh6/0y/Sc/mAylDc00aSVBIVU2zeBJ58q2oDyhv6+wIrDgQGxt39Qa21/sspU
	RIrp37T8S8GdrFz2+ok+1nIcvYl5qblJYS9I00CKBnF7oEbLoxwnCUYawZm0Iw7whMqr4l
	Y9BcIsafArQC7rsBCNRnvrNDIjK8EUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-DyvJLrXvMMmwVGRyTMnjwQ-1; Fri, 01 May 2020 19:22:01 -0400
X-MC-Unique: DyvJLrXvMMmwVGRyTMnjwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6AF6107ACCA;
	Fri,  1 May 2020 23:21:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E89CB60BE1;
	Fri,  1 May 2020 23:21:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BB5A1809542;
	Fri,  1 May 2020 23:21:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 041NLUnc017180 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 1 May 2020 19:21:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D88C360BE1; Fri,  1 May 2020 23:21:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC9261980;
	Fri,  1 May 2020 23:21:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 041NLPwj021532; 
	Fri, 1 May 2020 18:21:25 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 041NLOp9021531;
	Fri, 1 May 2020 18:21:24 -0500
Date: Fri, 1 May 2020 18:21:24 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200501232124.GN5907@octiron.msp.redhat.com>
References: <1585896641-22896-1-git-send-email-bmarzins@redhat.com>
	<d5ed73175bd95df6dd4086fc42d0a8536eae92bc.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <d5ed73175bd95df6dd4086fc42d0a8536eae92bc.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 0/3] multipath: new path validation
 library
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Apr 28, 2020 at 09:48:03PM +0000, Martin Wilck wrote:
> On Fri, 2020-04-03 at 01:50 -0500, Benjamin Marzinski wrote:
> > This patchset is for a new library that programs can use to determine
> > if a device belongs to multipath.  The primary user that this is
> > intended for is SID, the Storage Instantiation Daemon
> >=20
> > https://github.com/sid-project
> >=20
> > Right now, this doesn't change our existing code to determine path
> > ownership, and it doesn't do the exact same steps, although it is
> > very
> > close.  In the future, it would be possible to pull most of this code
> > entirely into libmultipath, except for some wrappers, and use it for
> > both methods.
>=20
> I'd like to see how that's done. To reach that goal, we'd have to
> eliminate the differences in the function's logic this way or that way.
> Readability-wise, your new code is way better.

I'm going to start working on this.
=20
> >   Obviously, this still needs man pages, and there are some
> > helper functions for things like controlling multipath's logging that
> > are missing, but I want to see if anyone has strong feelings about
> > what
> > this looks like.
>=20
> As you're asking for it, I don't like the static linking linking of
> libmultipath, which IMO unnecessarily complicates the multipath-tools
> build. If this is what you need, why don't you simply pull multipath-
> tools as-is into the SID source tree, e.g. with "git submodule", and
> rebuild it there to you suit your needs? It's rather unlikely that
> there will be other users of libmpathvalid besides SID any time time
> soon.=20
>=20
> To put it more provocatively: I can see the benefit of this patch set
> for SID, but what's the benefit for multipath-tools?
>=20
> OTOH, multipath-tools *would* benefit if we used this as an incentive
> to cleanup our libraries, first by cleaning up the "multipath -u"
> logic, and later perhaps even so that SID (and other applications)
> could simply link with -lmultipath without polluting its namespace in
> inacceptible ways.

Actually, after reading through the SID code, I've realized that the
multipath code will still be compartmentalized in a DSO. So I'm fine
with using the shared library as is.

> > I also have two more changes that I want to make to the multipath
> > code,
> > to make path validation do less unnecessary work, which aren't in
> > this
> > patchset.
> >=20
> > 1. I want to remove the lock file from the failed wwids code. I don't
> > see how it actually stops any races, and it means that simply reading
> > a file, can trigger delays and writes (albeit to a memory base fs).
>=20
> The main idea of the "locking" was that I wanted to create the actual
> failed_wwids file atomically, using link(2). open_file() is
> unfortunately not atomical at all. If we look into these issues, we
> should put open_file() on the table, IMO.
>=20
> Rather than creating that "lock" file and linking to it, we might=20
> create "/dev/shm/multipath/failed_wwids/$PID" (just as a 0-byte file,
> not with open_file()) and rename it to $WWID atomically.
>=20
> Moreover, it's possible (though not common) that multipath and
> multipathd simultaneously try to set up a certain map. In that case,
> one process would likely get an error. But you are right, the actual
> race isn't prevented; for that we'd need to handle EEXIST in
> dm_addmap_create().=20

Oops. I forgot to post my patch for that. It's posted now. We can
discuss my idea there.
=20
> > 2. I want to deprecate getuid_callout.  Once this is gone, you will
> > be
> > able to call pathinfo and get a path's WWID, without ever needing to
> > open the path.
>=20
> It's already been deprecated since 2013. Unfortunately I used it for
> the hwtable test because it takes a free-form string argument; so if we
> rip it out, we need to rewrite that test.

Unfortunately, I might need to have a change of heart about this.  The
issue with SID, now that I've looked at it more, is that it gets called
from udev before all of the storage udev rules that set up the udev
properties that multipath uses to pick the wwid.  There are two ways of
dealing with that. I should note that both of these will require
multipath to detect that it's running with SID and do something
different that normally. udev_device_get_property_value() won't work,
since the property simply won't be in the udev database when SID is
calling the multipath library.

1. pull all the scsi_id and related rules into SID as well, and have
multipath read from the SID database (which is later synced with the
udev database) However, I don't believe that SID would need this
otherwise, and that kind of labeling of devices is something that udev
is good at. Also, not every distrbution uses the exact same udev rules,
so either there would need to be multiple SID modules, or everyone who
used SID would have to do things the same way here. It might also be
harder for people to override these things. I'm still a little fuzzy on
when SID populates the udev database with it's results, but I think it
happens late enough that its values would override those of any
properties that were also set in udev rules.

2. Multipath would have to not rely on udev for the wwid. The
alternative would be sysfs (or ioctls) like multipath currently uses as
a backup.  This would mean that SID wouldn't have to pull in all
scsi_id related code.  However, it would mean that multipathd would also
need to recognize when it was being run with SID, so it could use
sysfs as well, to match libmpathvalid's results. This frees multipath
from needing udev for this, but it makes the wwid criteria much more
rigid.  Currently people can simply add a udev rule to set a property
and configure the multipath device to look at that, if the existing
rules aren't working right for a specific setup.  The getuid_callout
currently also provides that freedom, and it might be necessary if
users can't simply make udev rules for devices that can't work with
getting the info from sysfs.
=20
At any rate, I'm still going to push forward with making this library,
with the existing get_uid() code, work with multipath -u.

-Ben

> Best Regards,
> Martin
>=20
>=20
> >=20
> > changes in v2:
> > 0002: make sysfs_is_multipathed only read the sysfs file once, as
> > suggested by Martin.
> >=20
> > 0003: dm_is_mpath_uuid() is now dm_map_present_by_uuid(). The library
> > includes a new function mpath_get_mode(), to get the find_multipaths
> > mode, and the modes now include MPATH_FIND. mpath_is_path() now
> > accepts
> > an array of mpath_infos, which the caller can use to pass the
> > previous
> > path wwids. This allows mpath_is_path() to return MPATH_IS_VALID for
> > paths if there already is another path with that wwid.
> >=20
> > However, mpath_is_path() still treats MPATH_SMART and MPATH_FIND the
> > same.  I tried to make them work differently, but I realized that I
> > need
> > a way to signal that the MPATH_FIND path didn't fail because it was
> > blacklisted, but instead because it needed another paths. Otherwise
> > the
> > caller won't know that it needs to save the wwid to check when later
> > paths appear. This is exactly what MPATH_IS_MAYBE_VALID means. In the
> > multipath -u code, the only difference between the find_multipaths
> > "on"
> > and "smart" case is what to do when a path that needs another path
> > appears for the first time.  Dealing with this difference is the
> > responsiblity of the caller of the mpathvalid library.
> > mpath_get_mode(),
> > will let it know what the configured find_multipaths mode is.
> >=20
> > Benjamin Marzinski (3):
> >   libmultipath: make libmp_dm_init optional
> >   libmultipath: make sysfs_is_multipathed able to return wwid
> >   multipath: add libmpathvalid library
> >=20
> >  Makefile                            |   1 +
> >  Makefile.inc                        |   1 +
> >  libmpathvalid/Makefile              |  38 ++++++
> >  libmpathvalid/libmpathvalid.version |   7 +
> >  libmpathvalid/mpath_valid.c         | 198
> > ++++++++++++++++++++++++++++
> >  libmpathvalid/mpath_valid.h         |  56 ++++++++
> >  libmultipath/Makefile               |   1 +
> >  libmultipath/devmapper.c            |  66 +++++++++-
> >  libmultipath/devmapper.h            |   4 +-
> >  libmultipath/sysfs.c                |  24 +++-
> >  libmultipath/sysfs.h                |   2 +-
> >  multipath/main.c                    |   7 +-
> >  12 files changed, 391 insertions(+), 14 deletions(-)
> >  create mode 100644 libmpathvalid/Makefile
> >  create mode 100644 libmpathvalid/libmpathvalid.version
> >  create mode 100644 libmpathvalid/mpath_valid.c
> >  create mode 100644 libmpathvalid/mpath_valid.h
> >=20
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

