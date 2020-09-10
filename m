Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDD32685BA
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:24:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-55Q9oULHO0OfzJvHjqvM1Q-1; Mon, 14 Sep 2020 03:24:19 -0400
X-MC-Unique: 55Q9oULHO0OfzJvHjqvM1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B05CB1006700;
	Mon, 14 Sep 2020 07:24:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 862A327BBB;
	Mon, 14 Sep 2020 07:24:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77D478C7C8;
	Mon, 14 Sep 2020 07:23:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08A8tZ8H011095 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 04:55:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B5E820110C9; Thu, 10 Sep 2020 08:55:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E0920244F7
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 08:55:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BEEC811E78
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 08:55:33 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1599728133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=MjYK1HAdgiPRW/mu+cwkJlyyHH9hW0rhmG6p5fONyC8=;
	b=Yosl+2Ha16F6IdcUwrakEFlcnjo4a5SToznU47telzKWH1s0coFAqrMBDyVBuxftFRxgdi
	aHCrHPOdSGkjOHPNFVt5sg8L93AzZDs7D4AGyrvzT8p8XWK2wGJbp55VZ9yGxsM/R4VZd0
	OKZkNRLmfdUq7ct5MO2lRPoHKYs5iideYJixQ8E+oBF487TdwVLvvS9N18jPrjyri317oH
	rcSY9j7GcWAEh2ACterNNnl9AMOoAeAKDMhy9G/10YI2sndE9PsABfbB0OyUoFrAg3tVh4
	kMjCgM8h5nNvCcYRjdhHhVB1h1ZAgbjXkBGyopgV1ZRPXOf/Wo6tMcTGAmAKjg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1599728133; a=rsa-sha256;
	cv=none;
	b=iOChODSqjCrD95+Xqn/mLuRCD0j9SSun974CxdlatDy8cyjgh6G7BAeZTcJ1nJf1DCjjQB
	Xhj+s6A+NMRFAs086jwUU885Kw0rOg42i5/UaFiVt+AyNg0a0vntXrDYdizJDZt3IyLe1N
	8G3tOgxmnbKi4d4ipfRz5djc1jrX3W3Ew9oQfAY3Y7Cl6hRUaWYWMPUlF2292/MwQCAKSC
	RVx0zkGQdUCgf+1XinfzXpPib7KXgjXG9yVQ2Q/Y0p/o2tLCIETMun4YNoAhfUL4y0NaWt
	DWXwnszPgfTkFgx6MHVQiPTFvLFci3EYXau22b60zkRGCaU24XnCPd9hArxSWg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=kernel.org header.s=default header.b=caMPoUSK;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (relay.mimecast.com: domain of balbi@kernel.org designates
	198.145.29.99 as permitted sender)
	smtp.mailfrom=balbi@kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-378-sgXs1I26Pa-mBQW2wFU5SQ-1;
	Thu, 10 Sep 2020 04:55:31 -0400
X-MC-Unique: sgXs1I26Pa-mBQW2wFU5SQ-1
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0C4F920770;
	Thu, 10 Sep 2020 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599727668;
	bh=RPokpgxyglYjppmxdwE4ETpgoWb+FLMn8txdhEbALdk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=caMPoUSKexLI6/Cqhtg8fT99cl3GRCJBgwM+b8CDUH4fpndiULhN2ZxxlePCqMtm8
	o+PPIhKL0Yab4dKBUBJb9PAX9HTFJdHyhq4ZrB98n0hws/gO34J2oo99WhyXQG8LAo
	ih4L+nIDe5nvGNhsdtsxYZAUrexQb+0pD4TKBRdk=
From: Felipe Balbi <balbi@kernel.org>
To: Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>, Jiri
	Kosina <trivial@kernel.org>
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
Date: Thu, 10 Sep 2020 11:47:27 +0300
Message-ID: <878sdikogw.fsf@kernel.org>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=kernel.org header.s=default header.b=caMPoUSK;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (relay.mimecast.com: domain of balbi@kernel.org designates
	198.145.29.99 as permitted sender)
	smtp.mailfrom=balbi@kernel.org
X-Mimecast-Spam-Score: -3.925999
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
	alsa-devel <alsa-devel@alsa-project.org>,
	dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	linux-i2c@vger.kernel.org, sparclinux@vger.kernel.org,
	kvmarm@lists.cs.columbia.edu, linux-rtc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-afs@lists.infradead.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
	Kees Cook <kees.cook@canonical.com>, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-sctp@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-nvme@lists.infradead.org, storagedev@microchip.com,
	ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [trivial PATCH] treewide: Convert switch/case
 fallthrough; to break; 
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
Content-Type: multipart/mixed; boundary="===============8987087322647731847=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

--===============8987087322647731847==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

Joe Perches <joe@perches.com> writes:
>  drivers/usb/dwc3/core.c                                   |  2 +-
>  drivers/usb/gadget/legacy/inode.c                         |  2 +-
>  drivers/usb/gadget/udc/pxa25x_udc.c                       |  4 ++--
>  drivers/usb/phy/phy-fsl-usb.c                             |  2 +-

for the drivers above:

Acked-by: Felipe Balbi <balbi@kernel.org>

--=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9Z6B8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZSCRAAuTv1hrqhd9iVfnwXFrfx8dYquoCMc3VI
y1IiULV6avnZvLQTqKviHDvZw05WY6dna714mpLFW1laW3WuhLSD4elIu6cqHaiz
ZgtvtA4bZ/s7ipV+jlZ86S9oIz4MMBbZYhqSN1ZVk50NsUA/1thpcjS0aLI5SAgX
j2dV6BEEHBSgMDwcWLPNwr6f5R/ycEBx3i6HYSSdNtBr1SK+UhbSkwNxdCA9IzH8
1WCugmJdohP26DIYNzFZcssjcSFb5wu2iuHXQXuvOmmAfQmro+gRcnq1SOElae7v
cas67L69RQ5fxskM/XpIYH2AURFnRUNondcJWViUQXHwXF1U0r+FdwXUr8OeFi19
sVEI4FNu7ZqgvhfUlKMpldyUZRIrWb+WZZ5toBQAKFee/3tqTs4Tqh9cwfLL9IU4
ho4tG7J/bd6hASfr0x2dH5Pm7oXKskxmtUpmmSVlNaTpXytiD30+pUvOl9Qg7A+X
tc9h6N3Z6kdVxkJlm1KpUUccPeUtHox549ukAtzKQL4x6PDCdNqBkNDVSIx04FA4
dgyt4O7w4HaWT1GPHH322pG5nNT1dsGT0CC9QA/2AJkoXTY03YGR3dgDw89GNUrP
WPj73gtBbWTwRFuwHQQs8F/E8x2UjBC005aawoKcK2bxBR1fzqz1y8daUaiCftnV
ocu1QwRIgL8=
=BFTp
-----END PGP SIGNATURE-----
--=-=-=--


--===============8987087322647731847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============8987087322647731847==--

