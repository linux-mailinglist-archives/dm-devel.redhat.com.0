Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A8FDD1B08B0
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 14:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587384266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7Jlj44wWpdc31xTPC+ECFiIe48JcbZvEAxUN/VEkpqg=;
	b=N+8qBvI8YyAG7ZHelt89pLAgEy+ZpAJevNOLF1odfwIpvUhC7qExJEegqMTeuaoxi09tRj
	VzxWN3Rw+XE/A2alg8wvzMzQ7E76j2PPHQ+uo5ffce+dJYyfsP3s+4U6wBQktkOaY90BTH
	rh+AUYQTH12Cepi0F9zI5woZWRYWQ1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-JNi-aAY6NT-yYAgsj5Pslw-1; Mon, 20 Apr 2020 08:04:22 -0400
X-MC-Unique: JNi-aAY6NT-yYAgsj5Pslw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 888C310509A1;
	Mon, 20 Apr 2020 12:04:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54031A104A;
	Mon, 20 Apr 2020 12:04:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5067B9350C;
	Mon, 20 Apr 2020 12:04:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KADBDb008772 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 06:13:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D805D2026983; Mon, 20 Apr 2020 10:13:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1E6E2024517
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:13:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF2D8101A55D
	for <dm-devel@redhat.com>; Mon, 20 Apr 2020 10:13:09 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1587377589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=o1vseOuwYUfwiBK0T95jf//Dxqbw22/lYFNDyPx8t4w=;
	b=eF3sMAjIrE1nzjgKZt51P5Le6bALH8xEctoXcaFZYn04PrSBCwkVUEH0naJPMJUGpzBWzS
	VdVmG9sdbH8drao7Q74jF4ZEYYlxdz7i7imZefwEQdTqcwfU3zpc20vlOnKpwE7C0NwQVG
	nxhfAcoIqv/fQ//KPBK9xk/080+YQQx0MXbL+72VbQPkHDbascQXu/dUtyw90eixyzRVqm
	DqYmDsp0Skmq9F26YLC8jMeF6vxdNy7mUg1I8K2o2P88xmKWY/+dKTD4FsJeKNMSAdBusY
	xMcYvRBHpLSiV2lrj5NrwOYi/O08l5fFVaGxf9KC9R5vNIVuyKxIkD15oSM/jQ==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1587377589; a=rsa-sha256;
	cv=none;
	b=HiyEu1fkqqbzFKnj+gqf1j9OM6LA9hKQInhQy9U55xjH+UH0mRv5ie3Bwww5sUPa3Q8Oaq
	hc3uvUfP5/nbRlGm3N8Nvn09eUVY4JotrzO2gYSLUYCdI7h3FwhP0lJ8B/n//IeUFtThL4
	jLiiAvpkX62j8mCNhvaUwaQ+DuhYvMt/gmJa/j4NHr0v90xINPbFuF4S0s29NVaxMbj9Cf
	IDEQw628xQmFbe6MmR803kNnJ1RDWD7d9milS2DeALNJYNbpzfRAAq3R8rB+STcwKUdaaU
	Qznp8BnrtSNxNVdiZVi6ia2RsmPGsGn/HzJGVCzU9aWulZEcmVJhJLlf57rLpg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=bonedaddy.net header.s=mail header.b=kQKORLJl;
	dmarc=pass (policy=none) header.from=bonedaddy.net;
	spf=pass (relay.mimecast.com: domain of pabs3@bonedaddy.net designates
	45.33.94.42 as permitted sender)
	smtp.mailfrom=pabs3@bonedaddy.net
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-eibAHwGQOiKiz8jIobbrzQ-1; Mon, 20 Apr 2020 06:13:06 -0400
X-MC-Unique: eibAHwGQOiKiz8jIobbrzQ-1
Received: from chianamo (n58-108-4-64.per1.wa.optusnet.com.au [58.108.4.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	(Authenticated sender: pabs3@bonedaddy.net)
	by smtp.bonedaddy.net (Postfix) with ESMTPSA id DBE60180043;
	Mon, 20 Apr 2020 06:13:03 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
	s=mail; t=1587377585;
	bh=jod12xCYdZoqLDqiEfNqvtxkjlDlQfPOlPJo+0zFZj4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kQKORLJllYva2I4fnjPn8rv4ux1Hg1BqcOaFMVMHHC0xUvXMiUqvo/wD2TghCCN+T
	05QlnHjg6C7Pgbmn5NkC4fr/MZJRHMgsb59rfTIdoK/SIJjccG8OcHq0I8nQEV1KSA
	/zlbyoL6cUujLcPhGke0jOq9rFpt5k2WPEC4JjzYzNByPEnr6Yj8gnDTlaWCJi68Gi
	NZbpKD9flv1Q1J9S41ab0pMKvkpEcIEoLisLoFmtPedtuu/naWm3hRLgxK7uTuCLa4
	et9LcCrOC7TkKGMbFDm8YrERe+TBhcVxCPXS/Njn9fyMvY9Phu3KlrIqKcA26Cbhy0
	lcjoaKwhvGezQ==
Message-ID: <a0034feda1f6f598c8376a418949b48109307e67.camel@bonedaddy.net>
From: Paul Wise <pabs3@bonedaddy.net>
To: Ondrej Kozina <okozina@redhat.com>, dm-devel@redhat.com
In-Reply-To: <6bbf9d94-2fbb-f96f-ea85-a480ba109c55@redhat.com>
References: <20200419073026.197967-1-pabs3@bonedaddy.net>
	<20200419131908.GA22398@redhat.com>
	<9cb6a39a43178be29af2f47a92c2e84754b62b69.camel@bonedaddy.net>
	<6bbf9d94-2fbb-f96f-ea85-a480ba109c55@redhat.com>
Date: Mon, 20 Apr 2020 18:13:01 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.36.1-1
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=bonedaddy.net header.s=mail
	header.b=kQKORLJl;
	dmarc=pass (policy=none) header.from=bonedaddy.net;
	spf=pass (relay.mimecast.com: domain of pabs3@bonedaddy.net designates
	45.33.94.42 as permitted sender)
	smtp.mailfrom=pabs3@bonedaddy.net
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 08:03:49 -0400
Cc: Alasdair Kergon <agk@redhat.com>, linux-kernel@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1992457911211184858=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

--===============1992457911211184858==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7gYIJ8Sm/tiyMSzyv4MA"

--=-7gYIJ8Sm/tiyMSzyv4MA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-04-20 at 09:35 +0200, Ondrej Kozina wrote:

> Did you have discard allowed on both dm-crypt devices? dm-crypt
> (kernel) does not allow discards by default.

I did not, I guess that explains why I got no errors.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-7gYIJ8Sm/tiyMSzyv4MA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAl6ddakACgkQMRa6Xp/6
aaMDqg/8Cj1meyJPg+ICUeg+WsYjGw/jaRrqC/UZzGwBCq/fguJ8BOwu+HtorOmM
Kqr370rlTrjwdn4THs3So6PDSr3es270GKN0Cg1sO7z97lXUYQJA1RklOHRDw/5M
EIw3uHHRNtutjWgyLScDBoy4kS+jzlNElwkj2M/amxTS2nlL99W5CI9sCdWwMjvm
+ftXtELcNC8znWUBQlPJ/JnTu4/6kfKPytrzBWGvPxODgFosI8fA1K7kMoXNSvq7
OSMCVZkq4AlhlHq+MIkXlPPE8pQoTbMTLflqD+wrusgEFGJMRYEGnndbg1vBrk5Y
ieZ/z96mxOQ4VrFEeIC9IeY560Z/lb1MJJBYJRF7HF9ez02YAqevzmM85jzo6CMv
7Bp8m+VcT/RcceAChWR14LOE+q3vJfhX1nu5wHatR3vTRYz5tFha+xqAypQMg504
sVo+YzxIp/z45EDbinz7niePh8v4V04K1ne75G2R1iX++RcIurieGBS7+4OueAEl
7anc/Evu+FPD/LDMlhGxVtiH1PqPk4ZJpD/Z6uVfKOQiOPhvF0RfPGJRE/8mW+uY
VdECV0zqsWlTYaOmSH0FiCgq3zxW5Zw8rxYs+ioHUR/431c7zo3JLBJPEF8+3H4t
x3hiW6iJ21Nw0ibptbIVJCg7jzqfMfe0cWHHqrynzZtfMIOzTAY=
=GclY
-----END PGP SIGNATURE-----

--=-7gYIJ8Sm/tiyMSzyv4MA--


--===============1992457911211184858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============1992457911211184858==--

