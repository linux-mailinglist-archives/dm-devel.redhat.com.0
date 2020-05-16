Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 032101D63B7
	for <lists+dm-devel@lfdr.de>; Sat, 16 May 2020 21:08:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589656089;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=P3SncOK9pE6OMtEbtlgbCkmDfzHv54A/2CpbCRzWS/I=;
	b=LuS2Yl0Aj30HGJ3noQyJ/53gZGNAdD6Y/MezMQvDGbLxGPStThtnlQjwcejU2CLZFHD8dv
	pjkBMb1VA3hmqIN9PtH/wvRl5CwMAC/1jU5JEDQZaZgrtBJ2poEtct3Eh64mtMh5bsGFkQ
	Xk9sSQCzCytLQR0vQgwk/hXX6WCZdhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-_YFc0JMWOT2GkjYlq4LKoA-1; Sat, 16 May 2020 15:08:07 -0400
X-MC-Unique: _YFc0JMWOT2GkjYlq4LKoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AF43460;
	Sat, 16 May 2020 19:07:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99C7C1001B07;
	Sat, 16 May 2020 19:07:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F4F64EA0F;
	Sat, 16 May 2020 19:07:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04GJ7RZu031486 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 16 May 2020 15:07:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9947510F26FD; Sat, 16 May 2020 19:07:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94C2F10F26FB
	for <dm-devel@redhat.com>; Sat, 16 May 2020 19:07:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26DDF80CDAE
	for <dm-devel@redhat.com>; Sat, 16 May 2020 19:07:25 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1589656044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=u0fpT+MduABmuxzS+nhwmoO+3J2DaROt+ZvYCMb6TZc=;
	b=dsSeaXcO8KlizFt76o2TjCt3wRdjvK4kRqXYju118U+X0evxQlSfbEBySMraGmxErpHiGb
	snP5R/1wIuiqk+K8hQGlJyDBrcW7GMsRVNB4pTafna+gwWzsUuvgQiJ4mrGKjrsWLkjnkc
	C5MupCxsimw/+aiBFHkRa2YGC7tQ7s6dyoUfIFXi0vgwA76Rww69vl8zaSMoNf5bfRr+e7
	mMLDTiCyOhlRnLPlRZHPtK9DqBRCrzvr/UGAEdGJpkiAwHIPcCK3CaAGjBWS8L6sIkffEs
	7DtmtTAtWhNq3zrfS9fYaVKwbSeiVEze4qQYctE/qAyxHzJdT9CaI0FQVbsLTw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1589656044; a=rsa-sha256;
	cv=none;
	b=QN94Qu3Lx0Iv7hsyikyCOKhEgkSdZr3CZv9T7HsLwDT65iCkuRgNFfXFEbfC4n5ZGxzOuY
	FoSWv4iGd3p0w332hngza81aY75D7neAJm1Ugt/3nrtFUts9LVZXamexOSaRxIPhmIX+Uo
	Uh2YZ+0NTp6PY/r78f+uxDCxG4fg/wV74lpkKt1y5KQmBiKE97+iFBSVTzjgzBRl9iVRx7
	YpS19ZLFROoOJ8+/Rom6LiFdnEYyuk0a8Zzda4A2/Wh7FlCWFjOpgHObw+RtAMPpk3+90R
	usp2cIhwxpPrf2FX8M3R5p/0TEnn3vsyE6CvYZXcSgNg/Wteb/dj9l0afqsgUQ==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=hansenpartnership.com header.s=20151216
	header.b=QZGtrnC0; 
	dkim=pass header.d=hansenpartnership.com header.s=20151216
	header.b=QZGtrnC0; 
	dmarc=pass (policy=none) header.from=HansenPartnership.com;
	spf=pass (relay.mimecast.com: domain of
	james.bottomley@hansenpartnership.com designates 66.63.167.143
	as permitted sender)
	smtp.mailfrom=james.bottomley@hansenpartnership.com
Received: from bedivere.hansenpartnership.com
	(bedivere.hansenpartnership.com [66.63.167.143]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-191-GrrCa5M4PvaZ27ZGv2A2CA-1;
	Sat, 16 May 2020 15:07:17 -0400
X-MC-Unique: GrrCa5M4PvaZ27ZGv2A2CA-1
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 918E88EE19F; 
	Sat, 16 May 2020 12:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1589656032;
	bh=D8G+NdjnQDRxlqYxDKGcemEgX/kXVlKUwQ2n9K0wbU0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QZGtrnC0nkisDPiq5z/4wpE2unys4l8Z+NJySN4pHZbyl48d1+wy8Gv24YTUsG1X3
	XpxXQ1s++yw509gQTJCIqhcpg9MrEnuD50xxjK5k3JZ7JTPBMTpLTbBkAgbEr0OOdM
	7JI48ehZPPMJdFYLcB13SDXTkzRW2l6aJykiCNcI=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id A1rl-KAx3JQT; Sat, 16 May 2020 12:07:12 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.76.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D801D8EE173;
	Sat, 16 May 2020 12:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
	s=20151216; t=1589656032;
	bh=D8G+NdjnQDRxlqYxDKGcemEgX/kXVlKUwQ2n9K0wbU0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QZGtrnC0nkisDPiq5z/4wpE2unys4l8Z+NJySN4pHZbyl48d1+wy8Gv24YTUsG1X3
	XpxXQ1s++yw509gQTJCIqhcpg9MrEnuD50xxjK5k3JZ7JTPBMTpLTbBkAgbEr0OOdM
	7JI48ehZPPMJdFYLcB13SDXTkzRW2l6aJykiCNcI=
Message-ID: <1589656023.8524.1.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@hansenpartnership.com>
To: Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Hannes
	Reinecke <hare@suse.de>, Alasdair Kergon <agk@redhat.com>, Mike Snitzer
	<snitzer@redhat.com>
Date: Sat, 16 May 2020 12:07:03 -0700
In-Reply-To: <367320.1589627953@turing-police>
References: <367320.1589627953@turing-police>
Mime-Version: 1.0
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=hansenpartnership.com
	header.s=20151216 header.b=QZGtrnC0;
	dkim=pass header.d=hansenpartnership.com header.s=20151216
	header.b=QZGtrnC0;
	dmarc=pass (policy=none) header.from=HansenPartnership.com;
	spf=pass (relay.mimecast.com: domain of
	james.bottomley@hansenpartnership.com designates 66.63.167.143
	as permitted sender)
	smtp.mailfrom=james.bottomley@hansenpartnership.com
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] next-20200514 - build issue in
 drivers/md/dm-zoned-target.c
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
Content-Type: multipart/mixed; boundary="===============0314160435874863611=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

--===============0314160435874863611==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Mp2dUCEd7FWpRS+D3bdZ"

--=-Mp2dUCEd7FWpRS+D3bdZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-05-16 at 07:19 -0400, Valdis Kl=C4=93tnieks wrote:
> Am seeing a build error in next-0514.  -0420 built OK.
> building a 'make allmodconfig' on a RPi4 in 32-bit mode.
>=20
>   MODPOST 7575 modules
> ERROR: modpost: "__aeabi_uldivmod" [drivers/md/dm-zoned.ko]
> undefined!
>=20
> objdump and 'make drivers/md/dm-zoned-target.s' tells
> me that the problem is in function dmz_fixup_devices(), near here:
>=20
> @ drivers/md/dm-zoned-target.c:806:             reg_dev->nr_zones =3D
> DIV_ROUND_UP(reg_dev->capacity,
>         ldr     r0, [r6, #56]   @ reg_dev_166->capacity, reg_dev_166-
> >capacity
>         adds    r1, r3, r1      @ tmp316, _227, reg_dev_166->capacity
>         adc     r0, r2, r0      @ tmp315, _227, reg_dev_166->capacity
>         subs    r1, r1, #1      @, tmp316,
> @ drivers/md/dm-zoned-target.c:805:             reg_dev-
> >zone_nr_sectors =3D zoned_dev->zone_nr_sectors;
>         strd    r2, [r6, #80]   @, reg_dev,
> @ drivers/md/dm-zoned-target.c:806:             reg_dev->nr_zones =3D
> DIV_ROUND_UP(reg_dev->capacity,
>         sbc     r0, r0, #0      @, tmp315,
>         bl      __aeabi_uldivmod                @
> @ drivers/md/dm-zoned-target.c:806:             reg_dev->nr_zones =3D
> DIV_ROUND_UP(reg_dev->capacity,
>         str     r1, [r6, #64]   @ tmp306, reg_dev_166->nr_zones
>=20
> git blame points at this commit:
>=20
> commit 70978208ec91d798066f4c291bc98ff914bea222
> Author: Hannes Reinecke <hare@suse.de>
> Date:   Mon May 11 10:24:30 2020 +0200
>=20
>     dm zoned: metadata version 2
>=20
> Reverting that commit lets the build complete.

That's because the DIV_ROUND_UP in the patch should actually be
DIV_ROUND_UP_SECTOR_T I think.

James

--=-Mp2dUCEd7FWpRS+D3bdZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABMIAB0WIQTnYEDbdso9F2cI+arnQslM7pishQUCXsA51wAKCRDnQslM7pis
hZePAP9k+4pgr+O3cOw3dKCULg5dyXP0H/ovz0PjY3NwyCgqYAEA1ghh0wkxUfz4
GB4Svstsox0oy29X7rGUd/p1slLLNZM=
=2NcN
-----END PGP SIGNATURE-----

--=-Mp2dUCEd7FWpRS+D3bdZ--


--===============0314160435874863611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0314160435874863611==--

