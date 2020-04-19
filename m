Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BD2B41B0249
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 09:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587366485;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sgseOTlAfiGtRoHeYZqKlyBsqaSTVCapv/W41xDa6KQ=;
	b=U4L498F1syCDo9mXiG7ttUS40zEaDx3fpNQn+Pa/Fs+5z2GED9zdHDqHYM6UkY1WekoITl
	pFirgAGASA8ibP8EHBqzDp93T0HS9mSl7hIPgzJBJevacHjMdmN2GEWOD0N7c7b2WGNea7
	wJfiAxD96BMUwX4MMwkAUwc79cgYWyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-6onQKDQ7PySE0CV4l32mCA-1; Mon, 20 Apr 2020 03:07:21 -0400
X-MC-Unique: 6onQKDQ7PySE0CV4l32mCA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 108EC8018A5;
	Mon, 20 Apr 2020 07:07:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD70911E7EF;
	Mon, 20 Apr 2020 07:07:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C406118089CD;
	Mon, 20 Apr 2020 07:07:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03JEoaYE003415 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Apr 2020 10:50:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5EAC6092D; Sun, 19 Apr 2020 14:50:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast02.extmail.prod.ext.phx2.redhat.com [10.5.110.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC42858
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 14:50:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD2DD107ACC4
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 14:50:33 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1587307705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=9PhF0RPfU85O+7AaUZaUPqOxK4gwZRFMR3nsFCHKQqU=;
	b=EiRXZrMrBZJ7FPMLEcNT57MrmWUcN3lWOsizS0XFAZYSsww3sP3swSe6E9lLYBZtWw53TT
	2wjXES3Bd9ZtSc4630h/6gIZeWRIs/azfoj/2GBLugvVlzhMzD0Uc1CBYPmQKA3tQ/h78f
	iOUE7ZWHihXSp/+D/4bvkBvXPfpGgLSW4s58iutD9PCqYV1EKDLJCWDtQr96fdx5M3Qmsc
	URP0Fdo8mjdCMRjUa9j3LC2K2SDqWQDL9rrOIvGcx0slLllGrz2M0Hvnyb6C73l81iNKMI
	bl7bRZBuI64hXOIEg4YoU+OdWuSOJWQRdPw5oT+itB/1cemXVgOesTuyw6UWGw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1587307705; a=rsa-sha256;
	cv=none;
	b=Q+ytoGfD/fA7l/wpHrW/WuhpKCi7ni6K60TzjdxcN+y5C5uNNX8ViJzUhWUd9txx4CYyxR
	R98hCzKq/k/5v8bEkM0Qsu59+QZBOCKDvz6jowm+BEhl9ILBhI44I/9b0Drx9M1VUmV/GL
	dXWkZMey00NvmRHaJrC0oySZgMqIHjlXvMNUlVTMaW0L3OLhbBM0puLch/rlu22+aPSOjK
	s2XoCLbrfOnCDxUAf3KTbOXWDXb+XiaD9ImStOUcnIh9ElC0Y6JqDIdQjG/Eqe+jZO9iu0
	dWccLBtdjjzyy1Zj4g2k4/S9KtIp/+m+G0OCUXBp02MgfJxgw9jUn6BSX7aBYg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=bonedaddy.net header.s=mail header.b=iPFIDk3E;
	dmarc=pass (policy=none) header.from=bonedaddy.net;
	spf=pass (relay.mimecast.com: domain of pabs3@bonedaddy.net designates
	45.33.94.42 as permitted sender)
	smtp.mailfrom=pabs3@bonedaddy.net
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1587307833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=9PhF0RPfU85O+7AaUZaUPqOxK4gwZRFMR3nsFCHKQqU=;
	b=rTuMgaRYNzqNYHTd884DOoyL3Bw02Dj1jG5E6VIzsoY9g1Av8ox92NFhMS2FXqhvqlAMwl
	wu8U9zQ0raJpd2Su95HI0zPXC2Y6+aYnwHtd3d8DsqJN+NcSdK9r3ALAokuoHD80hiMLwj
	43JP++kWW+wpUt0yi43dt9Oa8+ddgVxTXBUSwyi66lXYtQuU/eSSW8wUCtJN2JaN5S6jLB
	jD6DfC71Wy+hbDcYj1IdvJEqxPNDVQDGTWdkycf7D17K/Z7kSny8Eb4faWm6Paxu+NikaU
	bGzAFPtxJnm9lth8VWl0qWg4xJpHykm5mISWqVDVqUWJl4rNhgb8rE8m0rc+aQ==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1587307833; a=rsa-sha256;
	cv=none;
	b=QbFo5DidgMLRnbJJOSLFOJNymmhyBj++QRl+Uc7hvKqvoPeEfKOQ2MdkLwk9ERHveKiSP9
	g9wmQyPzzZj8n8CL74xcd6YXjWDHYjHCAlm1WQQp390AIdRymnI3CxrSPJdxj/wxGQf+sI
	NzU9srYo075eS8p7nwhsJzdZsz7KHPFxQH14+oYcvLwf4deU6RB22pRETPW+KN0iK1hzsf
	KwwI8EpAD06B3A+ouQyASPrPBwMrObTCFP01a2h/Tnkq5x/G0W/bt49C+2ncV+h/t4n8lY
	oinat4D8c9hmpYdCf268xdrCJuQWOpyTqltBYh50vDSdvZyXFBCGGh2eKK0IVw==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=bonedaddy.net header.s=mail header.b=iPFIDk3E;
	dmarc=pass (policy=none) header.from=bonedaddy.net;
	spf=pass (relay.mimecast.com: domain of pabs3@bonedaddy.net designates
	45.33.94.42 as permitted sender)
	smtp.mailfrom=pabs3@bonedaddy.net
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-14-lDeiXyOOM5yg0Jrt8b67Hg-1; Sun, 19 Apr 2020 10:48:23 -0400
X-MC-Unique: lDeiXyOOM5yg0Jrt8b67Hg-1
Received: from chianamo (n58-108-4-64.per1.wa.optusnet.com.au [58.108.4.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	(Authenticated sender: pabs3@bonedaddy.net)
	by smtp.bonedaddy.net (Postfix) with ESMTPSA id 53E19180043;
	Sun, 19 Apr 2020 10:48:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
	s=mail; t=1587307702;
	bh=orbOLhLh68VHjj9KoqAE/l3nV665NUdq1aidfrkBWoc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iPFIDk3EJOmtIhN/wwEuJ3N6eojbUPY3vQsC1Ifs6qYznwpDvqeXYxrtmphy2pFne
	ALFR6r0IIAOxwEFgW8OiAmcd65jSDecQ1LVFgwoG7/sU23RqQAhtR9S4txVRxGmlRN
	aRzeeUMvgBWkIoxb2qcx3Hhc4Skoz8m+YxVtbI2QRxPlfqVI8x16RUm4HLBASs/UNn
	Cq6ZmzsT0Y5sHM3guS27QOOAfvgyzUsozGfYYTLrXJEg1PUOzxCdk0U9SgmyXDHKsd
	7Zq1JnSQjGxv5Ihn9Qkv4IeuoayStdAGYAuSf5FL2HCGVxexserZzgPeeV3Gdfy3M1
	w7yfjY+L8cdhg==
Message-ID: <9cb6a39a43178be29af2f47a92c2e84754b62b69.camel@bonedaddy.net>
From: Paul Wise <pabs3@bonedaddy.net>
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200419131908.GA22398@redhat.com>
References: <20200419073026.197967-1-pabs3@bonedaddy.net>
	<20200419131908.GA22398@redhat.com>
Date: Sun, 19 Apr 2020 22:48:16 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.36.1-1
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=bonedaddy.net header.s=mail
	header.b=iPFIDk3E;
	dmarc=pass (policy=none) header.from=bonedaddy.net;
	spf=pass (relay.mimecast.com: domain of pabs3@bonedaddy.net designates
	45.33.94.42 as permitted sender)
	smtp.mailfrom=pabs3@bonedaddy.net
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 03:06:56 -0400
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/3] dm raid/raid1: enable discard support
 when any devices support discard
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
Content-Type: multipart/mixed; boundary="===============0304241916371162492=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15

--===============0304241916371162492==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Dc6DoNjKBj0aUd9iYgmL"

--=-Dc6DoNjKBj0aUd9iYgmL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-04-19 at 09:19 -0400, Mike Snitzer wrote:

> You went overboard with implementation before checking to see if your
> work would be well received.  Your 2/3 patch header shows you're
> capable of analyzing past commits to explain the evolution of code,
> etc.  But yet you make no mention of this commit header which explicitly
> speaks to why what you're proposing is _not_ acceptable:
>=20
> commit 8a74d29d541cd86569139c6f3f44b2d210458071
> Author: Mike Snitzer <snitzer@redhat.com>
> Date:   Tue Nov 14 15:40:52 2017 -0500
>=20
>     dm: discard support requires all targets in a table support discards

I do remember seeing this commit while working on this, I guess I
ignored it in my attempts to get fstrim working on my rootfs, woops.

> I haven't looked closely at MD raid in this area but if you trully think
> underlying MD raid can cope with issuing discards to devices that don't
> support them (or that it avoids issuing them?) then please update
> dm-raid.c to conditionally set ti->discard_supported (if not all devices
> support discard).  That is how to inform DM core that the target knows
> better and it will manage discards issued to it.  It keeps the change
> local to dm-raid.c without the flag-day you're proposing.

On my system I have a HDD and an SSD, with /boot on MD RAID and / on
ext4 on DM RAID on 2 DM crypt volumes. In this setup fstrim works on
/boot but does not work on / and with my patches it works on / again.
In addition I don't see any messages in dmesg or other issues when
doing fstrim / with my patches.

I think I might have been worried that discards_supported has other
side effects but grepping the code now I see that was unfounded.
I'll switch the next version to just setting discards_supported.
I still think that my proposed overboard design is clearer though :)

You'll see from the following command that MD raid 0/1/10 arrays enable
discards when any device supports discards:

   git grep -wW discard_supported

It appears that the block layer ignores discard requests when the queue
for the block device indicates that discard is not supported on it:

   git grep -wW __blkdev_issue_discard

It seems to me that where possible DM/MD letting the block layer decide
to pass on or ignore discard requests is the right design. I'm possibly
incorrectly assuming that all block device drivers will correctly
advertise support for discard without false positive/negatives.

BTW, any idea where I should fix the `fstrim --fstab` issue? It is
expecting the queue/discard_granularity sysfs entry to be non-zero.
>From my initial debugging attempts it seems raid_io_hints is at fault.

Thanks for your initial response and any further insight you can give.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-Dc6DoNjKBj0aUd9iYgmL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAl6cZLAACgkQMRa6Xp/6
aaPZ+w/+NU6azXlrvR0spHz7eK7FaXlJcaVAVePc+ZeKnZzByER1yKehAzkvM+XP
dJ5NsJO/S5IugiM2F7QVPAx2/eOcYOcchAnE0SBKOv/y4IK5RLa0z6d/+WzzSbFc
JCcrvuTZBmTaVfkFpkCXbAjtpqAW1kasRFF8iz4R84TrszNfjVG3zhs50GQld3pU
VIvTctdmLdY7hVbUBLSgOEoRqz5ikPq+h3YRo99uCXF3RrZ6mb9tS/Ngxn9+HNu6
1hzsIyHIesXR9C2s3r7ZVEQ3Vbm4RIjpIBS1DC4R8koaFofRumo8VLZw+K6VEnfD
ni7nktV62Hd9S+bepuYrk6Ca5N8SdbwBC8lJBIqoESRuM3uIxgxgoKxfsPhAYTOc
7D9ksk4Uc7qZ+VdvFfAnbXaHl45PfLTNsg52ANfz4CCnJLGYhRKmjg9nXkqZKCcM
uuvrCey4trHMpdE77KEuLRVWm+4RXEWpEmAQ4RIOgK+3Q4pzRWJM5tHAkcCJjTCc
5LOIuT1oBKyx7y3XeLmPTfhliZFr3USjmDZtCorw5Z+tT4d4GEElfL4+x+3T9y6w
MAaxMZ9qHQDnzvhhIZfqRne4OrmDJqaanqxI5PYwjtYBbDKNW3EnTZJUUB1h8Vph
k8oMt5TBpBexc7TXuty8W9wiVgQzsgEcthDcNBBX8sPz5y/Gf/o=
=enD1
-----END PGP SIGNATURE-----

--=-Dc6DoNjKBj0aUd9iYgmL--


--===============0304241916371162492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0304241916371162492==--

