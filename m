Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFE61C6A61
	for <lists+dm-devel@lfdr.de>; Wed,  6 May 2020 09:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588751339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=7oDb/96QCjPVF7ObgEAU6uhsGySXXF7NiBudGzgDhYI=;
	b=OKuxR7Y+XN9yXYtYXkVuKA+T1wH1KuQfsiaGBI4TfJKliLP3e8R6JNOBSXQOQgCYmRHq3O
	jlke43YbLNmuH+l5ZxQYjQ9JhFWIG5HBhkNaIZ7/2ugvfWaohgn/zg4rcqForvYloEuNzz
	RcZytmM6o/qYt2KuNs6TdMvwPhQv8wI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-6z_aNehPM9W9YmL68ix44Q-1; Wed, 06 May 2020 03:48:56 -0400
X-MC-Unique: 6z_aNehPM9W9YmL68ix44Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90E03100CCC9;
	Wed,  6 May 2020 07:48:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A24639CB9;
	Wed,  6 May 2020 07:48:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB2241809542;
	Wed,  6 May 2020 07:48:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0467mcHn007627 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 May 2020 03:48:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 00FC82166BA2; Wed,  6 May 2020 07:48:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D7E2166B27
	for <dm-devel@redhat.com>; Wed,  6 May 2020 07:48:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3D01872734
	for <dm-devel@redhat.com>; Wed,  6 May 2020 07:48:35 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1588751315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=PrvadqVvZ078aLvaD9vndLZQd2C0U1+0FCYI5QVWtSM=;
	b=mBZUbmdwy3Jq3G2Wl6/+L4v42kCdDNSdExZ+9i1AAjXLxgnq3Avhpv8ndo6GpuDtIqbbi3
	4XyQyADANCREWUsb0nCV0+t5oEscTPv3k52f2ZIjeZz0wBV4nbVz1+n2HmAi1Q2V521F6p
	zy1hAxOmeXSPjeiRPQZEh3ITfLmUhZukyO/GKGnD58NYC/i8wsjOca82b1e9OydQUK05FI
	zujAl2N4vJlzHeqQA9Jmx5pltmF8HGTrIYPu99XeWxQnGD2Iup+CsFtve9Fs6/yetLjmV0
	w58LJbLM1l5SV3EPtAIF+jxb8M+06+SB53wBegwRQFpxJX932hkDwuiV4bvTZw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1588751315; a=rsa-sha256;
	cv=none;
	b=OLbLt2/+AfP0k33alw4H5qKT+TXhkbehzOz3DAm5a0HXC+z260Pf0RGTec/z9wGupj6PmV
	KMsGRZHN67ZTsVCpN8zyc9jqhKJGfWCVO1K6ojwc/whm6IUW9wOpVMZMGpTxo8ZtxDkJow
	Bw4QlVBl555DKzpsFXP6ZmByNwHAxz0L5aFJToq7hOnRurHaG/0vJykJ2wmnHJfSMw+ggl
	I6/8as3SDzZME6/tbc8HNye6k0B6NZlboo0DiS4torYM2mkMshfZlKTc356/Oq2CTP3P2A
	uXjlt29TT4O6ru/4W2+HNShIEH5/cJt0UBk5DsF0FZJMubxJG1HqOTOW8Ode1w==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=eworm.de header.s=mail header.b=LiVvSUsw;
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of list@eworm.de designates
	195.201.174.144 as permitted sender)
	smtp.mailfrom=list@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-166-TZu-LoAXMwKBJLC4Q7vOJw-1; Wed, 06 May 2020 03:48:33 -0400
X-MC-Unique: TZu-LoAXMwKBJLC4Q7vOJw-1
Received: from leda (p54B7927E.dip0.t-ipconnect.de [84.183.146.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 9BC51100A63;
	Wed,  6 May 2020 09:48:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eworm.de; s=mail;
	t=1588751311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=D+yWmLKFSh4yfRUbpZ4+kvYjV0rJfnf8B36Igp/5a28=;
	b=LiVvSUsw6AqSdCK5Hl/i5Jel3OHWE4QwlYh/l1eV7SXONAzhFhgZJQxeydIlk4/RWEnCh3
	e7NsFkvKT4vIZEx25nT5mNQmkvqrtZPcb2sWDJCVr0BXGdVuk7UCoeBTzPovQ472cbjvH6
	CcETwZfnNq2QVezoOiTJJL/UhI8XnAo=
Date: Wed, 6 May 2020 09:48:28 +0200
From: Christian Hesse <list@eworm.de>
To: dm-devel@redhat.com
Message-ID: <20200506094828.727f1d3a@leda>
In-Reply-To: <20200506073548.41756-2-list@eworm.de>
References: <20200506073548.41756-1-list@eworm.de>
	<20200506073548.41756-2-list@eworm.de>
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
	|\QFlOg>\Bt!b#{;
	dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
	ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
X-Rspamd-Server: mx
X-Spam-Status: No, score=-3.52
X-Stat-Signature: ajmzez9nay1b97w8ty4bh95xyrfp5hc1
X-Rspamd-Queue-Id: 9BC51100A63
X-Spamd-Result: default: False [-3.52 / 15.00]; ARC_NA(0.00)[];
	GENERIC_REPUTATION(0.00)[-0.39562943497673];
	FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-3.13)[-1.044];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	DKIM_SIGNED(0.00)[]; NEURAL_HAM_SHORT(-0.69)[-0.690];
	RCPT_COUNT_TWO(0.00)[2]; RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:~];
	MID_RHS_NOT_FQDN(0.50)[];
	ASN(0.00)[asn:3320, ipnet:84.128.0.0/10, country:DE]
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=eworm.de header.s=mail
	header.b=LiVvSUsw; dmarc=none;
	spf=pass (relay.mimecast.com: domain of list@eworm.de designates
	195.201.174.144 as permitted sender)
	smtp.mailfrom=list@eworm.de
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>
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
Content-Type: multipart/mixed; boundary="===============0267465331608610918=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11

--===============0267465331608610918==
Content-Type: multipart/signed; boundary="Sig_//x5vMvyuv7RPR7A7604/axm";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//x5vMvyuv7RPR7A7604/axm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Christian Hesse <list@eworm.de> on Wed, 2020/05/06 09:35:
> From: Christian Hesse <mail@eworm.de>
>=20
> Without this installation fails with:
>=20
> install: target '$DESTDIR/usr/lib/multipath' is not a directory
> Signed-off-by: Christian Hesse <mail@eworm.de>
> ---
>  libmultipath/prioritizers/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/libmultipath/prioritizers/Makefile
> b/libmultipath/prioritizers/Makefile index 9d0fe03c..11da5be2 100644
> --- a/libmultipath/prioritizers/Makefile
> +++ b/libmultipath/prioritizers/Makefile
> @@ -35,6 +35,7 @@ libprio%.so: %.o
>  =09$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
> =20
>  install: $(LIBS)
> +=09$(INSTALL_PROGRAM) -d $(DESTDIR)$(libdir)
>  =09$(INSTALL_PROGRAM) -m 755 libprio*.so $(DESTDIR)$(libdir)
> =20
>  uninstall:

Ignore this one... It does not fix the issue. The build system has to be
fixed for simultaneous jobs when installing.

For now installing with just one job (`make -j1`).
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH=
"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);=
}

--Sig_//x5vMvyuv7RPR7A7604/axm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAl6ya8wACgkQiUUh18yA
9HZeWQgAqwLNSSgPImSXy/RuW8w50X+Wlr1+7dor3DTKIuZB3R0s0oiXZfk+sNeU
Mmuy2pO6GrXVtiP2VK0kg8JnCK37VTkdpWmrfdV5PtmYdnsaCtqELVIk01alGW/N
Pyx0N9e+Tj13NG+sWqo1yiOJF9y9/ruQCcTd0yfo8fe46bOTqBL+fWJa05gjBnDj
V7Gcn+N5pJdlQBXK36G/seetFhuWWJVhZTLz/Q5qxTHUe33SMQNfm9yaqNwhoHeP
Vn38D+Nude87D/vPxtpWeMReAagB6B27FgGj3IsGH33o/YTVeY859Ev2bw5nVeXr
nvJzUJ8S0NjxF2yako11aSOilyE4WA==
=PBUr
-----END PGP SIGNATURE-----

--Sig_//x5vMvyuv7RPR7A7604/axm--


--===============0267465331608610918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0267465331608610918==--

