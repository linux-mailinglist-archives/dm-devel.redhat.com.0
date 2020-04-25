Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 779181B9876
	for <lists+dm-devel@lfdr.de>; Mon, 27 Apr 2020 09:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587972259;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UmLvE0jDKnAuVm4s+B1eUD7vhLHQqTZo8fE8/dGRA5E=;
	b=P369o197XOO7hsxYxp4QjYe0zlSe6VrAvVlD28NNKwhdUZsPUUQNBs/l6kB0GkVS1DKidO
	Akw6fZFL5a20gv/QkEWrv0T3aSWzuUBFB96cePTpoYySWU6ShdD/pAk8D/cFSshDtmlNzH
	+Sn0B1iWr3HNjPLILQuL/m3wysVVG+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-UhuZfdg3NyObvVBDMdVSag-1; Mon, 27 Apr 2020 03:24:15 -0400
X-MC-Unique: UhuZfdg3NyObvVBDMdVSag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9EB6872FEB;
	Mon, 27 Apr 2020 07:24:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7AFE10013D9;
	Mon, 27 Apr 2020 07:24:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 371194CA95;
	Mon, 27 Apr 2020 07:24:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03P2l2a2026353 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 22:47:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A987A1182E4; Sat, 25 Apr 2020 02:47:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A29751182E2
	for <dm-devel@redhat.com>; Sat, 25 Apr 2020 02:46:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 967D0811E77
	for <dm-devel@redhat.com>; Sat, 25 Apr 2020 02:46:52 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1587782812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=G4i8S3XZfIGFlvHJUCZBv+HMS67G6c13f5NAGOjySHA=;
	b=AQvKRlUZUXdkk73LW8yuSsGqjBjvKuUwnzX32cFH+W7fu5tW2TuhwawmICiVpC9jrLnXLF
	oZAJ1cZjSaNT27tQR99JMH0vvxngBCPMgW0v5naATDas07Hlxw3loVn2aheOgFo3af2viZ
	yHnuSrm39Z5KYswpfeaKcuyD8pLSP+vwQcA4aaAj1++YD3KMj3sDlgcUVsG5raTf5y+sIR
	ge5g/MMrl/lPkDJ1ZTFpaKSCRsLHD2IngTXfj6iw39c1gjmKtkoEngh7yONSDHz4LxWd+8
	ifHcKZ/u4vH2ocqPnNkbEjHTmTyxQShzWkTyCjAGE5Cq0RBG+vtAUqDU3565UA==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1587782812; a=rsa-sha256;
	cv=none;
	b=lHFomt6Ox//MXJE4owFVfUYmFH1+aEYAUSv9K1Md6kbEAUwGISBLz5yZWw5nHLD35ExqMX
	End6plkNRJNQk5PzFjVSkgOhE7aYvTj4u+0vJVgsxunbUJC5/OQ6n0CJebSaY2DXHxEEdD
	Ty9gsUgTKj/BYgcxAdsXEPZClhTaz3n523rm/3phSACzNbIpXbpBNxxJK+/GZnyUmb/5Aa
	BIGMXGXp1tgJl5LEWaXOeywQAZJ9EL7Fzh4tqR/p+wZOBEgmEm2umeQAWLxQ8jTYkyH6Oz
	71BstJYYqukHJGMBDIsHz9wYKfiDhjP1ARPEfKffndzK7yFIBPGIhfh6pjouYA==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=bonedaddy.net header.s=mail header.b=SvleyPmi;
	dmarc=pass (policy=none) header.from=bonedaddy.net;
	spf=pass (relay.mimecast.com: domain of pabs3@bonedaddy.net designates
	45.33.94.42 as permitted sender)
	smtp.mailfrom=pabs3@bonedaddy.net
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-71-JKfYR7llNA-t9LzBIQYVLg-1; Fri, 24 Apr 2020 22:46:47 -0400
X-MC-Unique: JKfYR7llNA-t9LzBIQYVLg-1
Received: from chianamo (n58-108-4-64.per1.wa.optusnet.com.au [58.108.4.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	(Authenticated sender: pabs3@bonedaddy.net)
	by smtp.bonedaddy.net (Postfix) with ESMTPSA id 4605B18003F;
	Fri, 24 Apr 2020 22:46:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
	s=mail; t=1587782808;
	bh=9/eYPdM9A/BRpPvuz618cds4AcWdwHEn8lAc2Evji0g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SvleyPmiCv9TuTuDHW3fIMBPSXiknzz/HLuFwJZu04FkDjB9RMbTDj7XGgti6Rckr
	ZcgJgKKCbHpqRrwl1T2TaCpRq5EVSz5ObUMdsIBFf+kj3Qa46z9seKhW3cARW7HMP4
	bt7KCvRvcJgTGyau+ES8Ca/Sac6hsTAqUiGJi6q59IHqJ5J7lK9JvswWChrDR7Hzrw
	RoU1gVo6xiK68T/BGWcwH2zVu1/HGIUVZCidvGceCV51GigPgjEchsoSRl89/QTMlM
	jTq6lQ/E3z7wNRBXg2qJrNp9MemOcOo30cepYKUNXe1ekcwBuAlGyiJSBG7jxdBOam
	QBYCNn4+P+Wyg==
Message-ID: <92911928f258ce7d1649b138e71abff90cdf660d.camel@bonedaddy.net>
From: Paul Wise <pabs3@bonedaddy.net>
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200419131908.GA22398@redhat.com>
References: <20200419073026.197967-1-pabs3@bonedaddy.net>
	<20200419131908.GA22398@redhat.com>
Date: Sat, 25 Apr 2020 10:46:40 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.36.1-2
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=bonedaddy.net header.s=mail
	header.b=SvleyPmi;
	dmarc=pass (policy=none) header.from=bonedaddy.net;
	spf=pass (relay.mimecast.com: domain of pabs3@bonedaddy.net designates
	45.33.94.42 as permitted sender)
	smtp.mailfrom=pabs3@bonedaddy.net
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 Apr 2020 03:23:40 -0400
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
Content-Type: multipart/mixed; boundary="===============5591739620537709383=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

--===============5591739620537709383==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-yBq2dcpBngBNf7Rpu8FT"

--=-yBq2dcpBngBNf7Rpu8FT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-04-19 at 09:19 -0400, Mike Snitzer wrote:

> You went overboard with implementation before checking to see if your
> work would be well received.
...
> I haven't looked closely at MD raid in this area but if you trully think
> underlying MD raid can cope with issuing discards to devices that don't
> support them (or that it avoids issuing them?) then please update
> dm-raid.c to conditionally set ti->discard_supported (if not all devices
> support discard).  That is how to inform DM core that the target knows
> better and it will manage discards issued to it.  It keeps the change
> local to dm-raid.c without the flag-day you're proposing.

So, now that I know that my approach to this was completely bogus,
what *is* the correct way to safely enable mixed-discard support?

It seems to me that the right way would be one of these options:

 * a sysfs toggle for the block layer
 * an=C2=A0lvchange based option for the dm layer

I'm leaning towards the latter for my personal use-case but the former
would make Linux much more flexible but would touch more code and have
the potential for more damage.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-yBq2dcpBngBNf7Rpu8FT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAl6jpIwACgkQMRa6Xp/6
aaOrrg/+JpSOuup2HurdD9NIAtht/hAlQukVyB8jLF79Y7TiRBj/bGBL3bNFyeu9
9onyY8oKkJNxz2lDP8TX/RthuQQPe4mKIK1naHwZn2v1HGSCCCT0+QuzNOks4FEi
Az+GqNWR3ICss7z59I+4Llq4iLpZx+Zpwe0RtRb9wHoml+RmIN15fh4LzyHlL/+N
go55fQ7wgTcd2V8q0yeleOa6GGpJSr4wAX3GfS7CKHMRunT7TSBrlJnI8Qqt3G9i
+92GpoPbpHBDszeLbTNllCBrx5XsJjdBC5CxTuin4MS1LFZpgEHJpKKePyF5mPge
XlzvbPQlqh6CXNfsGx1c89CEkITvPkmd9ROdSliFE2Gmu8kDN9lWhf3Vhu9GCAzH
7qaJPzK5zYOmQXxRmyaqZ2fqMckWnJhm14toMtb8bIHapwCVXBGfpsBrk6hsXlwB
Ur8nCiDZJAhnrwfPp0VmGpi917vSOF0sp+t9MkdSoj40b58hhwoyyH9rnrtmpEAH
9GE9Cg7iad5fs4+JEyOIXu3HIyoRpCMIAAvvohJltXSSkrN/ww0qr5WOef9amVKs
q/lhcKixRahAn3kfuLd8ecAaPOVlhx/CqB0X/D5xTS+1KFVOdnE2FDbsGKpXRVwA
VSq68JP+twI1qoGxaC+wuH3iPFHAVXgRsRDzMQ0kjEfzS1gN7D4=
=XHKy
-----END PGP SIGNATURE-----

--=-yBq2dcpBngBNf7Rpu8FT--


--===============5591739620537709383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============5591739620537709383==--

