Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C45F52A350C
	for <lists+dm-devel@lfdr.de>; Mon,  2 Nov 2020 21:23:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604348598;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rr25WcuQywwIVvcqsy9bLei/R1buFzjUWrrAWOWJcC0=;
	b=U4SKbsaaAiSplSSQ13QDp7bQibub8tEQkVdmSOFlOZ5adjoNPkDq6oRUudVKBCDAIbjegj
	dpdaiJp9XvQziikYp6KJdrIBy9FyuPHmdz9Z4WVhdpwJgwbNk06cfpbJbEAdq3RJ0WIkxl
	0Vx/tHTF8iVw67mOHix0PS/88/W8fgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-J3nfZkGsO3aa9n2T2ri80w-1; Mon, 02 Nov 2020 15:23:16 -0500
X-MC-Unique: J3nfZkGsO3aa9n2T2ri80w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2264195CC43;
	Mon,  2 Nov 2020 20:23:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BA607366E;
	Mon,  2 Nov 2020 20:23:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8463C181A06B;
	Mon,  2 Nov 2020 20:22:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2KMhMB004997 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 15:22:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA5515C5BB; Mon,  2 Nov 2020 20:22:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8E55C3E0;
	Mon,  2 Nov 2020 20:22:40 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A2KMZxb011696; 
	Mon, 2 Nov 2020 14:22:35 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A2KMZVO011695;
	Mon, 2 Nov 2020 14:22:35 -0600
Date: Mon, 2 Nov 2020 14:22:33 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20201102202233.GT3384@octiron.msp.redhat.com>
References: <1603316366-28735-1-git-send-email-bmarzins@redhat.com>
	<62b3ff51b69044b7d25460370210f59cd4ec492c.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <62b3ff51b69044b7d25460370210f59cd4ec492c.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 0/4] add library to check if device is a
	valid path
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2020 at 09:33:09PM +0000, Martin Wilck wrote:
> On Wed, 2020-10-21 at 16:39 -0500, Benjamin Marzinski wrote:
> > The main part of the this patchset is the first patch, which adds a
> > new library interface to check whether devices are valid paths. This
> > was designed for use in the Storage Instantiation Daemon (SID).
> >=20
> > https://github.com/sid-project
> >=20
> > The seconds patch adds unit tests for this library. The third patch
> > adds
> > get_uid fallback code for dasd devices. The fourth patch just changes
> > the get_uid log level for devices configured with uid_attribute "".
> > This
> > is because it is currently necessary to configure multipath with
> >=20
> > overrides {
> >         uid_attribute ""
> > }
> >=20
> > to claim multipath devices with SID (instead of using
> > multipath.rules),
> > since SID doesn't currently get the UID information itself, and it is
> > called by udev before this information is added to the udev database.
> >=20
> > changes from v1 to v2
> > ---------------------
> > 0001: This patch is now rebased on top of, and makes use of Martin's
> > patches that provide a default *_multipath_config, udev, and logsink.
> > Because of this, mpathvalid_init() now has a parameter used to set
> > logsink. There is also a new API function,
> > mpathvalid_reload_config().
> >=20
> > 0003: This is completely new, since Martin pointed out that adding a
> > new
> > config option to always use the fallback getuid code was unnecessary.
> > It
> > just makes a uid_attribute of "" log at normal levels.
> >=20
> > changes from v2 to v3
> > ---------------------
> > 0001:   rebased on top of Martin's latest patches, fixed some small
> > bugs
> >         and added documentation to mpath_valid.h
> > 0002:   New
> > 0004:   was 0003. Untangled the logic, at Martin's suggestion.
> >=20
> > Benjamin Marzinski (4):
> >   multipath: add libmpathvalid library
> >   multipath-tools tests: and unit tests for libmpathvalid
> >   libmultipath: add uid failback for dasd devices
> >   libmultipath: change log level for null uid_attribute
> >=20
> >  Makefile                            |   3 +-
> >  Makefile.inc                        |   1 +
> >  libmpathvalid/Makefile              |  39 +++
> >  libmpathvalid/libmpathvalid.version |  10 +
> >  libmpathvalid/mpath_valid.c         | 202 ++++++++++++
> >  libmpathvalid/mpath_valid.h         | 155 +++++++++
> >  libmultipath/defaults.h             |   1 +
> >  libmultipath/discovery.c            |  45 ++-
> >  libmultipath/libmultipath.version   |   6 +
> >  tests/Makefile                      |   5 +-
> >  tests/mpathvalid.c                  | 467
> > ++++++++++++++++++++++++++++
> >  11 files changed, 929 insertions(+), 5 deletions(-)
> >  create mode 100644 libmpathvalid/Makefile
> >  create mode 100644 libmpathvalid/libmpathvalid.version
> >  create mode 100644 libmpathvalid/mpath_valid.c
> >  create mode 100644 libmpathvalid/mpath_valid.h
> >  create mode 100644 tests/mpathvalid.c
>=20
> As you probably saw, all acked. However there's a small problem with
> the rebase on my recent patches. They aren't all acked yet, and Xose's
> report about uclibc made me realize that there are more issues with
> uclibc in my series. I don't think this will require major changes,
> but e.g. on_exit() is unavailable in uclibc. I'd like to rework those.
>=20
> Also, I'd wish that Christophe tags a new libmultipath version before
> applying the "library version" series and everything thereafter.

I'll rebase it, and I'm fine with this going in after the the version bump.

-Ben

>=20
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

