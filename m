Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 72DF6263F50
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 10:07:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-Mr8Bwx5JMRuOyGUYaL57DQ-1; Thu, 10 Sep 2020 04:07:21 -0400
X-MC-Unique: Mr8Bwx5JMRuOyGUYaL57DQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 373211DE0E;
	Thu, 10 Sep 2020 08:07:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 172BD702E7;
	Thu, 10 Sep 2020 08:07:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE4F81800FF5;
	Thu, 10 Sep 2020 08:07:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08A70anQ029584 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 03:00:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E49B202450A; Thu, 10 Sep 2020 07:00:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A2C20244F7
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 07:00:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5DED800161
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 07:00:33 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1599721233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=FJUwwv0GFvaKE+kGqVQ4QGKdcgVLNSFEZSjckCTXPBI=;
	b=WFk0T3Ci1dEtMw12Y/sZFTEtUpcyye8HN9HUwdaOOY0iUG4q1chnvCFy/o+tVp3SY8Rx/G
	iy3uv89ZtzaQsgtV0nvRd3RkVqVVe4rlLI6AodTh7OkOKMgt1xrL2H0YJ/i7p55I4+jrKA
	oOCO4Afl3ovc8P2ZcCD1Fuaf1n43VvogvuUttEM3yKevd1eCPL20nvUY088pACnuyx2Wzt
	AtdtqgYftVY9rKSYDz03clXEyi8EHZgVeRezZw60+YeiO98ThmSSu8K+gmGHZYqIvYpGcy
	vnUi2PMugTXZviT4EjvT1Xy1gAbx5sD7lXN65xCZZ89XNFX04LGt/9Ez2wPmtg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1599721233; a=rsa-sha256;
	cv=none;
	b=jdVEeZ8VByUQvJUyxvPVaFnrH6dt0SAHpnA4x6SZuB8pBYt6iR/kQK9b5JRZzVSlkHYZNZ
	AMxGffVx6feLn047UVCkGZFZBHTUgQNJFjtgkpW5MwQSPn2kRJ0LYk0RZsG8vmUSUQ8Vdn
	d4TsQIv42WRd1BxeCU3ROjlZs7TjlWnfJcxj98+Vfu1W4iiXJHmpvZzpc8MqLNeNoDezVN
	lZ6yPKgnK11rYqSVg4yBeLGA7/huvpmCNIihWgfCDfWvyqlNLi/o+U8EI5pF+zhlyZf50y
	gjfNXvD7o/REFK0ZdZm8Igir5mnSDrIijgVVgubS3QHC5Lb8Y20JfnmkNneWBg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=kernel.org header.s=default header.b=e3Jk9M7Z;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (relay.mimecast.com: domain of wsa@kernel.org designates
	198.145.29.99 as permitted sender) smtp.mailfrom=wsa@kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-330-5LCE-TGcOVak_3glWUJqkA-1;
	Thu, 10 Sep 2020 03:00:31 -0400
X-MC-Unique: 5LCE-TGcOVak_3glWUJqkA-1
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 93A222078E;
	Thu, 10 Sep 2020 06:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599720795;
	bh=/LOePKGDUR83plqAhx1ySvpBeTmOBTt4AYD41Ar10p8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e3Jk9M7ZKtsnsBd892ykDqq6ldjJyX23IqJ7DyDWgKOR2vkDHWpTUx3L4W3ZSGRl8
	gbJ25CK/q4T0DRgLEQdFDMLfOBf9AoSauHV2UkWklXje0SfXK1Ub2yM0Bl5ncgFE73
	tRqSbJwVN+gRudxLpTtOTt3VxbQSMkA19oVYS08w=
Date: Thu, 10 Sep 2020 08:53:12 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20200910065312.GH1031@ninjato>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=kernel.org header.s=default header.b=e3Jk9M7Z;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (relay.mimecast.com: domain of wsa@kernel.org designates
	198.145.29.99 as permitted sender) smtp.mailfrom=wsa@kernel.org
X-Mimecast-Spam-Score: -4.427
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
X-Mailman-Approved-At: Thu, 10 Sep 2020 04:06:55 -0400
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
	alsa-devel <alsa-devel@alsa-project.org>,
	dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
	sparclinux@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
	linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, dccp@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	linux-afs@lists.infradead.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
	Kees Cook <kees.cook@canonical.com>, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-sctp@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-nvme@lists.infradead.org, storagedev@microchip.com,
	ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-nfs@vger.kernel.org, Jiri Kosina <trivial@kernel.org>,
	linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
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
Content-Type: multipart/mixed; boundary="===============9085901334616835245=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11

--===============9085901334616835245==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Content-Disposition: inline

--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index e32ef3f01fe8..b13b1cbcac29 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1785,7 +1785,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		fallthrough;
>  	case PCI_DEVICE_ID_INTEL_82801CA_3:
>  		priv->features |= FEATURE_HOST_NOTIFY;
> -		fallthrough;
> +		break;
>  	case PCI_DEVICE_ID_INTEL_82801BA_2:
>  	case PCI_DEVICE_ID_INTEL_82801AB_3:
>  	case PCI_DEVICE_ID_INTEL_82801AA_3:

I am not the maintainer (Jean is) but I suggest to drop this hunk. The
code is more complex with multiple 'fallthrough', so this change alone
actually makes the code inconsistent. A rework would need a seperate
patch.


--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZzVQACgkQFA3kzBSg
KbYNuA//cymFe0KsFqywRHv3eBWJhoqwvWN2Xhwrx5/b6N3kkKGTo61aOo1ZI2gU
55rQoGusy8OzGXaxlyhNS8Ea9ztPZc/tHEohOHKPYr52ErUMXlbMo3I3q7sZAZEI
O/bRlnPKUCKqKOpZBin0ri6NE3FNYybTW30HgIk/LFUeCuaup10cUcxCmPfXHlNc
M/2M2tBVyyBOqlVVsPxIfEZ4jGDaikxt7mBZDj4QMJnivnuMFuuz8U7gYzkXIHfO
4ahGx+dBLCCInwFNFjEIPr+biq6Bgt/Vl9bbgN/BYbzdgbbJcikEhWHd9FxEoxQ5
Y4M6/HxLDuCwTLIoFHjVifsFHK4Emk5ECc0xBWjHu3CJDunZSmy6yS5gbD1BrstW
Djf0Ue1kyqnVPBDKE0EwFmwz1z1V14bhhXVC1fkiJjTpYRA6g3zMwH1oan6XIbGj
v4OuWFDkQLEfzCCBIASGS849HtQ4rNafKxX3KQ3qxngh7XBrK7X92SLf3qRJurdt
h5Ozd/zYDzyKQ1nOf/XWAOP5SKZH2ANjTrFKgIZE8MRkTmbzrlZkCnDnFD0pKPlB
Z9h9uPZ7kifAejwaRPfsTu6/B9XJafMKfLa3hKTg2kgO+p67ItBEQ0W8wrXLE1/1
c5FW5PqdkjKnx/9yUqosjEsHV2goh1guE4cziLkF1pZXcrElbtk=
=ZP3J
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--


--===============9085901334616835245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============9085901334616835245==--

