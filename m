Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C62851C9E4E
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 00:18:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588889914;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8pn09MIilyW2Lh7KLv0FgwNDbuMs+jYm5YdvzK0t+70=;
	b=aLbk7UtqCtb+ueTt/6s3s8oHscE7fPgmRPfT4SpAgOftYVQmBgL3h9T/EMP4KSoRNMEYJb
	XsXADQNr/t9LdGkbd+qTFgoYC+2TBzZzgHm/mGSOMYPT2rBJ1vjtJmr+Kdgqi7cFKmOWuw
	hloiwWjo9caQtcrLIRBu73X6EkFNsKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-MOO5Tr65PUeSNPIprvmMBw-1; Thu, 07 May 2020 18:18:31 -0400
X-MC-Unique: MOO5Tr65PUeSNPIprvmMBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B7D9BFC0;
	Thu,  7 May 2020 22:18:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C53021002380;
	Thu,  7 May 2020 22:18:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D84444CAA7;
	Thu,  7 May 2020 22:18:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047MIIE4028620 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 18:18:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D1C7202683D; Thu,  7 May 2020 22:18:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98BD82026972
	for <dm-devel@redhat.com>; Thu,  7 May 2020 22:18:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A84E882978
	for <dm-devel@redhat.com>; Thu,  7 May 2020 22:18:15 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1588889895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=38jZF10/hg2nk0KO68y/7ClYFkFTttuI580Ki5uXV9s=;
	b=jDH0n5RTI5fyjx7eL+ErFlJsg7lzIxpL+JXtfp+faCRR9OJT8OCsNWJxjaREd4MVVxerxh
	rc6AA2sWseVA/WdOHjojsEFQ8iCOUuanGvCe8naAPQHY6jJXQYZ4/1+Bj9rFrnR1zzq8g5
	eM34sSXlBknuivXFV120rI7PcKm6N7+/rtGceQZF898f4S9GlNLQ/DbcMc603Ly6hRoI38
	eGDz2fpMlUWpMx3Xr0mTxI5lB0AxVVSy5L+fooHtfxA2wKSHAl9V9490lv2LgmFBPhqkz8
	U7TCGPrW9ldAS6R590YGcdvHHhLF8BLQOvkCN6QfVz1neLbb8VFBCH2qiKR5FA==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1588889895; a=rsa-sha256;
	cv=none;
	b=nwfxCW2xTL2gF5NIr6Ilx4MJsRtFCB2WmOeBwYlZbi1DQeo+kfaZ6aPFZkeVbHMvBFHQ0J
	DmB7RNmFefunbKw9zAO/ZaRNA/eRXuPnO7HlwHkFZIe0EDkfEPN4/DGLdPUQJJqrptS5YZ
	x26HFvlZ6m5OxktqJAj5p42ZIqH44M/4lI+3lSvNk2IlWq3MuSBXsq5NdKcJ7bRIYvRlCF
	dNkPB5McpqzAUYz1IDMa2DW9TefXCbocnG/keVTOl9Bbxk33tk4C9XU9eiYAlZn5vd5fQL
	xD8FmUuU90d4HILVgwQd2YqiZrLn9dUO37PboO+K94QW5UXqCkL3SqKnvIukEw==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=eworm.de header.s=mail header.b=AtO12qCz;
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of list@eworm.de designates
	195.201.174.144 as permitted sender)
	smtp.mailfrom=list@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-308--1U8aJ81OTKmqXcCoDDf6Q-1; Thu, 07 May 2020 18:18:11 -0400
X-MC-Unique: -1U8aJ81OTKmqXcCoDDf6Q-1
Received: from leda (p200300CF2F182000625718FFFE7F1598.dip0.t-ipconnect.de
	[IPv6:2003:cf:2f18:2000:6257:18ff:fe7f:1598])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id CA97710AF4F;
	Fri,  8 May 2020 00:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eworm.de; s=mail;
	t=1588889889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=9A781iLXOO0v7cuTlqdk017uMiv3y/BJubnPeOCgCqc=;
	b=AtO12qCz7HcjkjhayQr99anCst/eXw3hn/8WVrX/kR+QNaXGkbgQ5gPYGIebjnv/sgSO0P
	QRGFvdb2Gy57QWkoR3IIOYQB9XWcGOZO7cMtjaos5AIYE0FBgiilEXIIVFmr96cMuh3wLV
	/M4VRPmvf1AWCtl40fwZLtpYio+PWQg=
Date: Fri, 8 May 2020 00:18:02 +0200
From: Christian Hesse <list@eworm.de>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200508001802.3d559e01@leda>
In-Reply-To: <858eb4ffcd9405ba7c10ed11f1d4c720a8ed496f.camel@suse.com>
References: <20200506073548.41756-1-list@eworm.de>
	<20200506073548.41756-2-list@eworm.de>
	<20200506094828.727f1d3a@leda>
	<858eb4ffcd9405ba7c10ed11f1d4c720a8ed496f.camel@suse.com>
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
	|\QFlOg>\Bt!b#{;
	dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
	ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
X-Rspamd-Server: mx
X-Spam-Status: No, score=-3.30
X-Stat-Signature: wbrryrdwu8375sg5cdekdwgy8k7hefji
X-Rspamd-Queue-Id: CA97710AF4F
X-Spamd-Result: default: False [-3.30 / 15.00]; ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	NEURAL_HAM_LONG(-3.13)[-1.042]; DKIM_SIGNED(0.00)[];
	NEURAL_HAM_SHORT(-0.48)[-0.477]; RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:~];
	MID_RHS_NOT_FQDN(0.50)[];
	ASN(0.00)[asn:3320, ipnet:2003::/19, country:DE]
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=eworm.de header.s=mail
	header.b=AtO12qCz; dmarc=none;
	spf=pass (relay.mimecast.com: domain of list@eworm.de designates
	195.201.174.144 as permitted sender)
	smtp.mailfrom=list@eworm.de
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/2] libmultipath: create libdir on install
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
Content-Type: multipart/mixed; boundary="===============3143056755045547408=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

--===============3143056755045547408==
Content-Type: multipart/signed; boundary="Sig_/.OfQdh/XDtFdCNiQgNTL3c1";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.OfQdh/XDtFdCNiQgNTL3c1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Martin Wilck <mwilck@suse.com> on Thu, 2020/05/07 23:13:
> On Wed, 2020-05-06 at 09:48 +0200, Christian Hesse wrote:
> > Christian Hesse <list@eworm.de> on Wed, 2020/05/06 09:35: =20
> > > From: Christian Hesse <mail@eworm.de>
> > >=20
> > > Without this installation fails with:
> > >=20
> > > install: target '$DESTDIR/usr/lib/multipath' is not a directory
> > > Signed-off-by: Christian Hesse <mail@eworm.de>
> > > ---
> > >  libmultipath/prioritizers/Makefile | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/libmultipath/prioritizers/Makefile
> > > b/libmultipath/prioritizers/Makefile index 9d0fe03c..11da5be2
> > > 100644
> > > --- a/libmultipath/prioritizers/Makefile
> > > +++ b/libmultipath/prioritizers/Makefile
> > > @@ -35,6 +35,7 @@ libprio%.so: %.o
> > >  =09$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
> > > =20
> > >  install: $(LIBS)
> > > +=09$(INSTALL_PROGRAM) -d $(DESTDIR)$(libdir)
> > >  =09$(INSTALL_PROGRAM) -m 755 libprio*.so $(DESTDIR)$(libdir)
> > > =20
> > >  uninstall: =20
> >=20
> > Ignore this one... It does not fix the issue. The build system has to
> > be
> > fixed for simultaneous jobs when installing.
> >=20
> > For now installing with just one job (`make -j1`). =20
>=20
> Right. Feel free to send patches for this. I've never felt the urge to
> run "make install" parallelized; it takes less then 1s on my laptop.

Well, doing things in parallel is the default on our build servers... Via
environment variable MAKEFLAGS=3D"-j#". Running just one job is extra work.=
 :-p

If I have some spare time I will have a look again.
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH=
"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);=
}

--Sig_/.OfQdh/XDtFdCNiQgNTL3c1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAl60iRoACgkQiUUh18yA
9HanNQf9Haq1anngwCZs+Ej3pw0qooLGTu7RuYzKHIHkSZglQ11x1m/g8DLGpYz6
R6wc5eXspCxFUrrZAkA4f/4yXPiKRqBpvNqd+qUtiK4AbSj2xNntIQBPv/NzUyMS
zXUVQ8/TmfRaNxmU4dsVTefgQc+ivhc7YMfIRbEysT1Xk3YiX6AQ7ypexolwBt6J
oT+547jSMHS0DCj17Ptv/X/kS1A4ttqAu9+IpNNeO74qPJxmQy7WwrfkRtUqpxp/
By3j7HZRmFxPWfGHRCC+WleQJKerxF7p4MernZh/wWnhYxHvf5snTAjoyJDT2yVK
hQTAlFNGVgOfw1N7Y6r7kB9UgNS+Cw==
=ojJp
-----END PGP SIGNATURE-----

--Sig_/.OfQdh/XDtFdCNiQgNTL3c1--


--===============3143056755045547408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3143056755045547408==--

