Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3061C9E4B
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 00:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588889741;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2v32/vgKR9Epm8obB5hYoNJ0QYoBl1e50fxTpzE6cII=;
	b=ayyRNzL2KqlJ3mEvnfsP1YbYhNPQUiSrqOksW+PqQ6mRy3RJT3DJl0/2uNFkJbHK0T34hs
	m9blCoYMoZVdFmq5wNWrenmwpZxXfEwef4nyz7CjheuMp1b9YMrrAD1adBsn7T+KPZ7UOT
	iWzenPq+OV/Qie8NedGkNfVr8TaKJg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-IId_Jz6vPvqiSi0M54bquw-1; Thu, 07 May 2020 18:15:38 -0400
X-MC-Unique: IId_Jz6vPvqiSi0M54bquw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E64D71895A28;
	Thu,  7 May 2020 22:15:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D22635C1B0;
	Thu,  7 May 2020 22:15:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9238F1809542;
	Thu,  7 May 2020 22:15:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047MF681028442 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 18:15:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC0C62026DFD; Thu,  7 May 2020 22:15:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E77312026971
	for <dm-devel@redhat.com>; Thu,  7 May 2020 22:15:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2FB580CDAF
	for <dm-devel@redhat.com>; Thu,  7 May 2020 22:15:02 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1588889702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=hS0eAQ7KsFzq2fOIrcU0iAaDtNm8L4WGIeBqaG8xAfM=;
	b=sE3o5kH76nQSYr6p4rSoxIrgf6DqFXVwL77HetBd2ioYjVZr3zGt3ZYxoEHw256YwjTJjm
	tfg5DEPbYTvK5qaOOpFnkwDcL+2gR3aUatM4yV6WCd3MgTOF3Q+8LmO0x7Z0KFui1TOISa
	53cxUCOA2139uqiFTEFxKCK71svtscHii1RP6PM6UALGg81Z+H5cA+et7Dd/MUBztbo8JO
	cXT0ooaSyV2q1lnYyNxtEfxUzYZE0kzLucSGQABeK0jZk+iXhYe9LDAl+5D4j9mPZ4il7b
	wPXFu355X8M3yFKThxx97SOg34hCJgdiVzf4erVpfN8hqqM42YwNBRzZV3Hp7g==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1588889702; a=rsa-sha256;
	cv=none;
	b=rcULt9pqRIVtwaDr68pdS73BTjVtnm5rQfC80T7durIu/5T8Ta/e0+/XISJK4S2CjKAWwF
	GARQVR1fDEwMcv+bDZeYwVfYcvFnywXsUuMX7vqBRNsBqYXiO6kivkn8dGbc6VV0Vu6MO8
	ow/+EkRkPryI6KjaDWpQFMyiFBP3U/t8BwXT+i0ZlrL6VBIz7W+9NGYvotFmnMsEyKT/17
	tG4hTMrcu54FTrq28rc7zPlo4Kl3RUrQn+TFuDm8CgucZjsTfl/c7MGBqFY4RqaIWQU2Yc
	vekuvWesJdkd9PJYQfDZ0DoBVBImG1kzFVVZOtNMYBWZhWAODeGyaRHS+BTA0A==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=eworm.de header.s=mail header.b=hczXwp3X;
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of list@eworm.de designates
	195.201.174.144 as permitted sender)
	smtp.mailfrom=list@eworm.de
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-166-jJQREBF7N_eB_a0PMQCMfg-1; Thu, 07 May 2020 18:15:00 -0400
X-MC-Unique: jJQREBF7N_eB_a0PMQCMfg-1
Received: from leda (p200300CF2F182000625718FFFE7F1598.dip0.t-ipconnect.de
	[IPv6:2003:cf:2f18:2000:6257:18ff:fe7f:1598])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 0D5F910AFBA;
	Fri,  8 May 2020 00:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eworm.de; s=mail;
	t=1588889697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=VBPffNKGWbbmiuxEObD5ux8Nb0rzUTn/7ffjykKBX2o=;
	b=hczXwp3XOAwabMKx3PHmJPFfwVG3fV+cHwfja43IxFiwsTUq0MCIcNID3woZaKWuP7Rq6f
	9IGCJqhwC2D694oeVRVh4aSwVhpjA3rva6w7iK71kphGp67US7EnWSBolwoAtqcOaQdntJ
	8pdxSgqQXshKOG1szrGy2/jLlboGX9Q=
Date: Fri, 8 May 2020 00:14:47 +0200
From: Christian Hesse <list@eworm.de>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200508001447.45e0fb95@leda>
In-Reply-To: <8c24a3e1f995605b3ed3df2c768b0053766cd5a0.camel@suse.com>
References: <20200506073548.41756-1-list@eworm.de>
	<8c24a3e1f995605b3ed3df2c768b0053766cd5a0.camel@suse.com>
X-Face: %O:rCSk<c"<MpJ:yn<>HSKf7^4uF|FD$9$I0}g$nbnS1{DYPvs#:,~e`).mzj\$P9]V!WCveE/XdbL,L!{)6v%x4<jA|JaB-SKm74~Wa1m;
	|\QFlOg>\Bt!b#{;
	dS&h"7l=ow'^({02!2%XOugod|u*mYBVm-OS:VpZ"ZrRA4[Q&zye,^j;
	ftj!Hxx\1@; LM)Pz)|B%1#sfF; s; ,N?*K*^)
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEUZFRFENy6KVTKEd23CiGHeqofJvrX4+vdHgItOAAAACXBIWXMAAA3XAAAN1wFCKJt4AAACUklEQVQ4y2VUTZeqMAxNxXG2Io5uGd64L35unbF9ax0b3OLxgFs4PcLff0lBHeb1QIq5uelNCEJNq/TIFGyeC+iugH0WJr+B1MvzWASpuP4CYHOB0VfoDdddwA7OIFQIEHjXDiCtV5e9QX0WMu8AG0mB7g7WP4GqeqVdsi4vv/5kFBvaF/zD7zDquL4DxbrDGDyAsgNYOsJOYzth4Q9ZF6iLV+6TLAT1pi2kuvgAtZxSjoG8cL+8vIn251uoe1OOEWwbIPU04gHsmMsoxyyhYsD2FdIigF1yxaVbBuSOCAlCoX324I7wNMhrO1bhOLsRoA6DC6wQ5eQiSG5BiWQfM4gN+uItQTRDMaJUhVbGyKWCuaaUGSVFVKpl4PdoDn3yY8J+YxQxyhlHfoYOyPgyDcO+cSQK6Bvabjcy2nwRo3pxgA8jslnCuYw23ESOzHAPYwo4ITNQMaOO+RGPEGhSlPEZBh2jmBEjQ5cKbxmr0ruAe/WCriUxW76I8T3h7vqY5VR5wXLdERodg2rHEzdxxk5KpXTL4FwnarvndKM5/MWDY5CuBBdQ+3/0ivsUJHicuHd+Xh3jOdBL+FjSGq4SPCwco+orpWlERRTNo7BHCvbNXFVSIQMp+P5QsIL9upmr8kMTUOfxEHoanwzKRcNAe76WbjBwex/RkdHu48xT5YqP70DaMOhBcTHmAVDxLaBdle93oJy1QKFUh2GXT4am+YH/GGel1CeI98GdMXsytjCKIq/9cMrlgxFCROv+3/BU1fijNpcVD6DxE8VfLBaxUGr1D5usgDYdjwiPAAAAAElFTkSuQmCC
MIME-Version: 1.0
X-Rspamd-Server: mx
X-Spam-Status: No, score=-3.29
X-Stat-Signature: ck68ycehhw3yesgwpusxgbehdt3zf3mh
X-Rspamd-Queue-Id: 0D5F910AFBA
X-Spamd-Result: default: False [-3.29 / 15.00]; ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[eworm.de:email,suse.com:email];
	FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	NEURAL_HAM_LONG(-3.12)[-1.040]; DKIM_SIGNED(0.00)[];
	NEURAL_HAM_SHORT(-0.47)[-0.471]; RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:~];
	MID_RHS_NOT_FQDN(0.50)[];
	ASN(0.00)[asn:3320, ipnet:2003::/19, country:DE]
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=eworm.de header.s=mail
	header.b=hczXwp3X; dmarc=none;
	spf=pass (relay.mimecast.com: domain of list@eworm.de designates
	195.201.174.144 as permitted sender)
	smtp.mailfrom=list@eworm.de
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/2] libmpathpersist: depend on libmultipath
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
Content-Type: multipart/mixed; boundary="===============3982710190319060390=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

--===============3982710190319060390==
Content-Type: multipart/signed; boundary="Sig_/f_xUczR/6/JqS_HjyHy0DJl";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f_xUczR/6/JqS_HjyHy0DJl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Martin Wilck <mwilck@suse.com> on Thu, 2020/05/07 23:18:
> On Wed, 2020-05-06 at 09:35 +0200, Christian Hesse wrote:
> > From: Christian Hesse <mail@eworm.de>
> >=20
> > Without this the build fails with:
> >=20
> > /usr/bin/ld: cannot find -lmultipath =20
>=20
> Thank you. Strange, I've built multipath thousands of times and never
> hit this error.=20

Did you build with lots of parallel jobs? I think my build server does
something like `make -j48`. :-p
--=20
main(a){char*c=3D/*    Schoene Gruesse                         */"B?IJj;MEH=
"
"CX:;",b;for(a/*    Best regards             my address:    */=3D0;b=3Dc[a+=
+];)
putchar(b-1/(/*    Chris            cc -ox -xc - && ./x    */b/42*2-3)*42);=
}

--Sig_/f_xUczR/6/JqS_HjyHy0DJl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXHmveYAHrRp+prOviUUh18yA9HYFAl60iFcACgkQiUUh18yA
9Hampwf/QzWKT7kRMKJZjt31A27rLn6K1BrYbtGGJqKL8GP7m+NgCeOWJjZDX4Qo
pr1m5E27yhZaXo7R9e+hJO8dkfGnP38BkENS5bueop/eLMOLIbgiZNcz9/uDfkVl
Ba3vXF5dMYjnmSkbulBZS/HLOMJjeyFQ5cLP8X7ka5TfjKMnujq8rkgzXLqU0iLW
jxUH88vhD8nGc0y/wooxpYZbxPMS6SaukH/WbJBV7eWF93IXfihR9Hd+iQ0Ye/LX
tTYzm5pxZxyPZQAEyU6hc4HEkbOyF6+zYV7+ttfbSgsn4hbgfGi6922vjPprG1tT
tAMZqzfsZ/cwK2tIYo8fKE24UBHWnQ==
=+eX7
-----END PGP SIGNATURE-----

--Sig_/f_xUczR/6/JqS_HjyHy0DJl--


--===============3982710190319060390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============3982710190319060390==--

