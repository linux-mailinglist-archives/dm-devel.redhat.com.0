Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 13368277D67
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 03:09:28 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600996168;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4NqxyC57g6yygXcd32cz5XKBYe8Wrt23pARqmd6t7d8=;
	b=YEMFy+9TB3FFwcfLwvT6TX72HvFXHBgLt89lOx7I9XiJJnDBmb1B+iKH5s5ExcLfsEgWeJ
	oUXeZyK61ZkBILij4g+rlkkeSdYo4OabvcxeRAyXK7AQQqP/CD823h9v8tketextgdWgEq
	igzpTsZysOGffshrCsFNj7nvRnA9jZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-4GgVvRZ2OZO2yxvTage1WA-1; Thu, 24 Sep 2020 21:09:25 -0400
X-MC-Unique: 4GgVvRZ2OZO2yxvTage1WA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FAC1801AAB;
	Fri, 25 Sep 2020 01:09:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D71710021AA;
	Fri, 25 Sep 2020 01:09:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E75BB1826D2A;
	Fri, 25 Sep 2020 01:09:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08P18pBS010637 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 21:08:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2AFAA5D9F1; Fri, 25 Sep 2020 01:08:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53AB35D9DD;
	Fri, 25 Sep 2020 01:08:48 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08P18lhU024484; 
	Thu, 24 Sep 2020 20:08:47 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08P18kON024483;
	Thu, 24 Sep 2020 20:08:46 -0500
Date: Thu, 24 Sep 2020 20:08:46 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20200925010846.GL11108@octiron.msp.redhat.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
	<01ce499f8c7a7248f560066054ba4dd922bbc338.camel@suse.com>
	<20200924163007.GG11108@octiron.msp.redhat.com>
	<53ad2ea2f8457030eac247420fcc564bd5608ab8.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <53ad2ea2f8457030eac247420fcc564bd5608ab8.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2 0/3] add library to check if device is
 a valid path
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 07:22:21PM +0000, Martin Wilck wrote:
> On Thu, 2020-09-24 at 11:30 -0500, Benjamin Marzinski wrote:
> > On Thu, Sep 24, 2020 at 08:18:02AM +0000, Martin Wilck wrote:
> > > On Wed, 2020-09-23 at 23:59 -0500, Benjamin Marzinski wrote:
> > > >=20
> > > > The second patch adds get_uid fallback code for dasd devices. The
> > > > third
> > > > patch just changes the get_uid log level for devices configured
> > > > with
> > > > uid_attribute "". This is because it is currently necessary to
> > > > configure
> > > > multipath with
> > > >=20
> > > > overrides {
> > > >         uid_attribute ""
> > > > }
> > > >=20
> > > > to claim multipath devices with SID (instead of using
> > > > multipath.rules),
> > > > since SID doesn't currently get the UID information itself, and
> > > > it is
> > > > called by udev before this information is added to the udev
> > > > database.
> > > >=20
> > >=20
> > > This makes me wonder how SID and multipathd are supposed to
> > > coexist.
> > > We wouldn't want this overrides directive for multipathd itself,
> > > would
> > > we?
> >=20
> > Don't we need it to be used by everything?  We certainly don't want
> > multipathd to get a different value for the wwid than SID has. It
> > seems
> > like all programs that access the multipath devices should use the
> > same
> > method to get the WWIDs.
>=20
> Well, as soon as SID is authoritative for the question whether or not a
> device should be multipathed, this is certainly true.
>=20
> That would mean, then, that multipath-tools would abandon the current
> philosophy of relying on udev, and attempt to derive device properties
> directly from sysfs instead. That makes a certain amount of sense to
> me, even though it's contrary to what we've been doing the last years.
> Relying on udev is not without issues, as we both know. uevents being
> delayed or never delivered is one problem, the other is the fact that
> udev rules can be customized without limits, leading to a
> profliferation of variables and configuration options. All this has
> historical reasons, today we could very well obtain almost all device
> attributes we need directly from sysfs.
>=20
> ... but I gather that this is a temporary scenario ...=20
>=20
> > The long term solution is that SID will call out to the devices, and
> > grab these uid attributes, just like udev currently does. It already
> > does this for the blkid values. When SID is running, these udev rules
> > will be disabled, and SID will provide udev with this data. So
> > eventually, multipath won't need any configuration changes to work
> > with
> > SID. setting this overrides line is just a stop-gap, so that people
> > can
> > test SID and multipath now.
>=20
> So, SID will call into libmultipath via libmpathvalid, udev will obtain
> the properties from SID, and multipathd will fetch them from udev in
> turn? Or will multipathd talk directly to SID? I seem to be missing the
> overall picture.

Yeah. SID will populate the udev database with the necessary udev
properties, and multipathd will get those udev properties just like it
always does. There is no change necessary to multipathd. Right now, the
only thing that SID's multipath module replaces is multipath.rules, and
it doesn't currently handle smart mode, since the part of SID that's
necssary to trigger and respond to a timeout doesn't exist yet.

SID sets the udev properties just like anything else called by udev.
There's a SID udev rule like this:

# cat /lib/udev/rules.d/00-sid.rules=20
SUBSYSTEM=3D=3D"block", ACTION=3D=3D"add|change|remove", IMPORT{program}=3D=
"usid scan"

> Anyway, if you can live with simply adding an "overrides" statement to
> multipath.conf for SID at the current stage, fine with me.
>=20
> Forgot to say: ACK for this series from me, with the exception of the
> minor nit I had on #3.
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

