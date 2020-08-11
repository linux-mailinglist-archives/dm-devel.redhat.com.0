Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4B72E242050
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 21:31:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-bLsiUR0SPL61Qfgq05Alsg-1; Tue, 11 Aug 2020 15:31:06 -0400
X-MC-Unique: bLsiUR0SPL61Qfgq05Alsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC2C1923764;
	Tue, 11 Aug 2020 19:31:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28A685D9D7;
	Tue, 11 Aug 2020 19:30:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90483A553F;
	Tue, 11 Aug 2020 19:30:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BJUTwN021595 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 15:30:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AAB21130512; Tue, 11 Aug 2020 19:30:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 631361110842
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 19:30:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C9EC1033644
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 19:30:26 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1597174226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=Mcy00K09hYJxptOnPY6LSLF9jEHM83yLbhWVGH/rNVA=;
	b=MmDPjx/xg8DS17DmBdTGiXpqzUrG+2bkhtZ1hG46yLNUy0IvqcDCJIBRh0VwTTdKBcCrl6
	q7jBkkgcmMpUP6ZnzZcdGPvp75QQXBVVEI0+UHfluVqD0g9/j101+nwbSEB9HgAxMi/YUd
	jeahYHx7EZHTz5wrP655gI1OoLf/uFQhCOyMSG8EVQ4LHFaPw9zh67yRoiL2K4gRaFzM1p
	2RW0jMVqLKqIpCEdhf2ySZyAK5Pk4H6Lav+oMJfbzvLPEwma0hAUb2n1a7gSjSdILNhHi6
	sLKfDmxg5SWaqtSJVvbF9K6few2h2UJdX3Hv2VyOLxB7GDW0KcUB2Suz7Wo5VQ==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1597174226; a=rsa-sha256;
	cv=none;
	b=hvoumDNZZF2v90K5Q5TpyMSh/l8guSlEW010SDGNdNY/LVtBwzRkKjyhJQkwR/QbpXGwy0
	UlbPYpxalqzlYmk5p8hDMxqOwmjaE0bBdpZ8MnuhGQkDdD/tEU4FzQfz9QhMctoyUmwNmP
	/mJ23oS7LzeX4vgtxJ+APWbIZxO3ShQg+bK/uchkGIl7++w+ma6JbImEEbaleCif2Wzkps
	kyuU0OvDchHf8mF56DSaYkiFGnRqAQS6Umjup3HrPQaK+l4x8chdVpeGrGzpKQBEF1zLic
	0KRm0rhQOvI1dLWjxvavKgtW6pKS+HNZV9Rb2D8E9K9uufURM7luMOfDUZnjDw==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none; dmarc=none;
	spf=none (relay.mimecast.com: domain of pavel@ucw.cz has no SPF policy
	when checking 46.255.230.98) smtp.mailfrom=pavel@ucw.cz
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-152-dT46IF76NRSW4HeQiUrX0Q-1; Tue, 11 Aug 2020 15:30:20 -0400
X-MC-Unique: dT46IF76NRSW4HeQiUrX0Q-1
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id B4DE61C0BDD; Tue, 11 Aug 2020 21:30:16 +0200 (CEST)
Date: Tue, 11 Aug 2020 21:30:16 +0200
From: Pavel Machek <pavel@ucw.cz>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Message-ID: <20200811193016.bdwh5kq7ci3yeme4@duo.ucw.cz>
References: <1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
	<da6f54d0438ee3d3903b2c75fcfbeb0afdf92dc2.camel@linux.ibm.com>
	<1597073737.3966.12.camel@HansenPartnership.com>
	<6E907A22-02CC-42DD-B3CD-11D304F3A1A8@gmail.com>
	<1597124623.30793.14.camel@HansenPartnership.com>
	<16C3BF97-A7D3-488A-9D26-7C9B18AD2084@gmail.com>
	<1597159969.4325.21.camel@HansenPartnership.com>
MIME-Version: 1.0
In-Reply-To: <1597159969.4325.21.camel@HansenPartnership.com>
User-Agent: NeoMutt/20180716
Authentication-Results: relay.mimecast.com; dkim=none; dmarc=none;
	spf=none (relay.mimecast.com: domain of pavel@ucw.cz has no SPF policy
	when checking 46.255.230.98) smtp.mailfrom=pavel@ucw.cz
X-Mimecast-Spam-Score: 0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, Deven Bowers <deven.desai@linux.microsoft.com>,
	Mimi Zohar <zohar@linux.ibm.com>, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>, Paul Moore <paul@paul-moore.com>,
	Jonathan Corbet <corbet@lwn.net>, Jann Horn <jannh@google.com>,
	James Morris <jmorris@namei.org>, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com,
	Chuck Lever <chucklever@gmail.com>, linux-block@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	mdsakib@microsoft.com, open list <linux-kernel@vger.kernel.org>,
	eparis@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
 LSM (IPE)
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
Content-Type: multipart/mixed; boundary="===============1442167424020526612=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

--===============1442167424020526612==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x335q3ph5liujtc7"
Content-Disposition: inline

--x335q3ph5liujtc7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > (eg, a specification) will be critical for remote filesystems.
> > > >=20
> > > > If any of this is to be supported by a remote filesystem, then we
> > > > need an unencumbered description of the new metadata format
> > > > rather than code. GPL-encumbered formats cannot be contributed to
> > > > the NFS standard, and are probably difficult for other
> > > > filesystems that are not Linux-native, like SMB, as well.
> > >=20
> > > I don't understand what you mean by GPL encumbered formats.  The
> > > GPL is a code licence not a data or document licence.
> >=20
> > IETF contributions occur under a BSD-style license incompatible
> > with the GPL.
> >=20
> > https://trustee.ietf.org/trust-legal-provisions.html
> >=20
> > Non-Linux implementers (of OEM storage devices) rely on such
> > standards processes to indemnify them against licensing claims.
>=20
> Well, that simply means we won't be contributing the Linux
> implementation, right? However, IETF doesn't require BSD for all
> implementations, so that's OK.
>=20
> > Today, there is no specification for existing IMA metadata formats,
> > there is only code. My lawyer tells me that because the code that
> > implements these formats is under GPL, the formats themselves cannot
> > be contributed to, say, the IETF without express permission from the
> > authors of that code. There are a lot of authors of the Linux IMA
> > code, so this is proving to be an impediment to contribution. That
> > blocks the ability to provide a fully-specified NFS protocol
> > extension to support IMA metadata formats.
>=20
> Well, let me put the counterpoint: I can write a book about how
> linux

You should probably talk to your lawyer.

> device drivers work (which includes describing the data formats), for
> instance, without having to get permission from all the authors ... or
> is your lawyer taking the view we should be suing Jonathan Corbet,
> Alessandro Rubini, and Greg Kroah-Hartman for licence infringement?  In
> fact do they think we now have a huge class action possibility against
> O'Reilly  and a host of other publishers ...

Because yes, you can reverse engineer for compatibility reasons --
doing clean room re-implementation (BIOS binary -> BIOS documentation
-> BIOS sources under different license), but that was only tested in
the US, is expensive, and I understand people might be uncomfortable
doing that.

Best regards,
=09=09=09=09=09=09=09=09=09Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--x335q3ph5liujtc7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXzLxyAAKCRAw5/Bqldv6
8vgbAKCHpxkUI3bT9Vn41Tp5GJNZ+nv/SQCfRg4xUwALTQzmhch9Ig1sF0gdvc0=
=c2f+
-----END PGP SIGNATURE-----

--x335q3ph5liujtc7--


--===============1442167424020526612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============1442167424020526612==--

