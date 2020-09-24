Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3D43F2776C2
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 18:30:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600965025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d+awZmyYorHU+FmNv1qM5sV7R2lHL/FK8gOgYFemWns=;
	b=dAA84XZ9u8EwninpdhvTLtqww+NM/g4rslD4uqyZEgjey2t8HiFndCBZrmQVohgx/9crr0
	y8SXi9GYPL69ZIMYrJm8teIFaI63cT/t3bQU5i5mH9eDK4VsJi1hYlTvaJccE0KP+KY0Ot
	IAeER0eF5Jqxi1H4NVyCInWTjE4rcOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-ssNcykjuOv6qP-DbsUfIzA-1; Thu, 24 Sep 2020 12:30:22 -0400
X-MC-Unique: ssNcykjuOv6qP-DbsUfIzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E43A3186DD4A;
	Thu, 24 Sep 2020 16:30:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD8C978832;
	Thu, 24 Sep 2020 16:30:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E757C1826D2B;
	Thu, 24 Sep 2020 16:30:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OGUDLO017163 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 12:30:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B58919C66; Thu, 24 Sep 2020 16:30:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2552C1A885;
	Thu, 24 Sep 2020 16:30:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08OGU80S021727; 
	Thu, 24 Sep 2020 11:30:08 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08OGU8Oj021726;
	Thu, 24 Sep 2020 11:30:08 -0500
Date: Thu, 24 Sep 2020 11:30:07 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20200924163007.GG11108@octiron.msp.redhat.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
	<01ce499f8c7a7248f560066054ba4dd922bbc338.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <01ce499f8c7a7248f560066054ba4dd922bbc338.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 08:18:02AM +0000, Martin Wilck wrote:
> On Wed, 2020-09-23 at 23:59 -0500, Benjamin Marzinski wrote:
> > The main part of the this patchset is the first patch, which adds a
> > new library interface to check whether devices are valid paths. This
> > was designed for use in the Storage Instantiation Daemon (SID).
> >=20
> > https://github.com/sid-project
> >=20
> > Hopefully, I've removed all the controvertial bits from the last time
> > I
> > proposed this library.
> >=20
> > The second patch adds get_uid fallback code for dasd devices. The
> > third
> > patch just changes the get_uid log level for devices configured with
> > uid_attribute "". This is because it is currently necessary to
> > configure
> > multipath with
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
>=20
> This makes me wonder how SID and multipathd are supposed to coexist.
> We wouldn't want this overrides directive for multipathd itself, would
> we?

Don't we need it to be used by everything?  We certainly don't want
multipathd to get a different value for the wwid than SID has. It seems
like all programs that access the multipath devices should use the same
method to get the WWIDs.

The long term solution is that SID will call out to the devices, and
grab these uid attributes, just like udev currently does. It already
does this for the blkid values. When SID is running, these udev rules
will be disabled, and SID will provide udev with this data. So
eventually, multipath won't need any configuration changes to work with
SID. setting this overrides line is just a stop-gap, so that people can
test SID and multipath now.=20

-Ben
=20
> Actually that "overrides" begs for allowing a custom configuration file
> for libmultipath to be used with SID. OTOH, that would allow the
> configurations to diverge, which might cause issues, too (in particular
> if blacklisting options were different).
>=20
> I think what we should do is allow applications to set overrides like
> this at runtime, modifying the configuration. Perhaps we could support
> an application-specific, additional config_dir, from which items like
> the above could be read in addition to the regular configuration files.
> This additional configuration would not be used by multipathd and
> multipath. Does that make sense?
>=20
> Regards
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

