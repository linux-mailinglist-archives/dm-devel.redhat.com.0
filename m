Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DB8C9278CDD
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 17:35:56 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601048155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KOCjrn05xf4z5U5p6nAXFbqaIAtKdkW9EXYVO4X1K9A=;
	b=azat/Ttm1Jj6wNn5S/YcBLfcIW3p4tDY5k3FYqbX4F97mJFgPifJDLaQkmSuDuOi/2x17p
	hj0YW5Yku4mdF7u9Sc5eWfqdyJ/A1UgFMIQQmiLiKuHDr9uEZSSZ9eQwbJCl0YmVrvZfUO
	quryzo9yZbl2ZwYLnmWSD3uUCC3vVQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-9i2H5whAOGeE7ykfpq7WNA-1; Fri, 25 Sep 2020 11:35:53 -0400
X-MC-Unique: 9i2H5whAOGeE7ykfpq7WNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E81E2884DD8;
	Fri, 25 Sep 2020 15:35:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD1E7368F;
	Fri, 25 Sep 2020 15:35:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E42511826D2B;
	Fri, 25 Sep 2020 15:35:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PFYpSB023665 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 11:34:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 777BB5576F; Fri, 25 Sep 2020 15:34:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6126155760;
	Fri, 25 Sep 2020 15:34:51 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08PFYn42029022; 
	Fri, 25 Sep 2020 10:34:50 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08PFYnUe029021;
	Fri, 25 Sep 2020 10:34:49 -0500
Date: Fri, 25 Sep 2020 10:34:49 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20200925153449.GP11108@octiron.msp.redhat.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
	<01ce499f8c7a7248f560066054ba4dd922bbc338.camel@suse.com>
	<20200924163007.GG11108@octiron.msp.redhat.com>
	<53ad2ea2f8457030eac247420fcc564bd5608ab8.camel@suse.com>
	<20200925010846.GL11108@octiron.msp.redhat.com>
	<2151af2280728eeeea5404bcda3cd6411a7173f5.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <2151af2280728eeeea5404bcda3cd6411a7173f5.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2020 at 10:01:01AM +0000, Martin Wilck wrote:
> On Thu, 2020-09-24 at 20:08 -0500, Benjamin Marzinski wrote:
> > On Thu, Sep 24, 2020 at 07:22:21PM +0000, Martin Wilck wrote:
> > >=20
> > > So, SID will call into libmultipath via libmpathvalid, udev will
> > > obtain
> > > the properties from SID, and multipathd will fetch them from udev
> > > in
> > > turn? Or will multipathd talk directly to SID? I seem to be missing
> > > the
> > > overall picture.
> >=20
> > Yeah. SID will populate the udev database with the necessary udev
> > properties, and multipathd will get those udev properties just like
> > it
> > always does.=20
>=20
> But then I'm not getting how you'll get along with a SID-specific
> configuration for libmultipath's behavior. You want get_uid() to use
> direct sysfs access for SID, and use udev for multipath(d). How else
> would you achieve that?

In the future, libmapathvalid will have access to the udev properties
that SID will be passing back to udev, so it can use the same data.
Those values just aren't there yet. I admit, how exactly this will work
is not completely nailed down.
=20
> More generally, I'm not quite convinced of the the design yet. The
> information flow kernel -> (sysfs or ioctl) -> libmultipath(sid mode)=20
> -> libmpathvalid -> SID -> udev -> udev db -> libudev -> libmultipath
> (udev mode) -> multipathd is more complex than it needs to be. It might
> actually increase the lags experienced by multipathd, which will still
> have to wait for uevent workers to finish until it can be certain about
> device properties. Not to mention that SID must be rock stable and
> always available during boot, initrd processing, etc.

Yes, clearly SID will need to be just as robust as udev.

> Why don't we rather write a common library for determining WWIDs and
> the "should be multipathed" predicate, to be used by udev (with a
> plugin), multipath-tools, SID, and possibly other tools like systemd
> and LVM, with common, simple configuration, guaranteed to always
> provide the same results? I mean, libmultipath already has all the
> "intelligence" built-in to do this. We'd "just" need to cut down
> configuration options drastically to get more reprocucible results, and
> refactor things to obtain a minimalistic API. Unlike the current
> libmpathvalid design, this wouldn't be built on top of current
> libmultipath, rather vice-versa. multipath-tools would also benefit a
> lot from such work.

Right now a lot of this infomation is being gathered by libraries. For
udev's builtin commands, those libraries are already being called
directly. SID will just be calling all those libraries directly, instead
of having to exec a program that bascially just calles the library.
Obviously not everything is in a library, however. But the idea of WWID
library sounds great. libmultipath probably doesn't have all the
intelligence built-in, because I assume people would want this library
would handle more device types than multipath does. Although you are
correct that just with what libmultipath does now, it would still have
a use.

-Ben

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

