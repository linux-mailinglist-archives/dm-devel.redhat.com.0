Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 519F66E2ED
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jul 2019 10:54:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75F51A3B60;
	Fri, 19 Jul 2019 08:54:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB7262660;
	Fri, 19 Jul 2019 08:54:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90A861972F;
	Fri, 19 Jul 2019 08:54:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IAf3NW002719 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 06:41:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F2985DAA4; Thu, 18 Jul 2019 10:41:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 582945DE64
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 10:41:00 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44E1F3DDBE
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 10:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=j2k/fmdaj1d94MmXtlrRAVuby+RNI+vnKC86hL0t+6LF1AH0/MX9RrEiH1Gbu8Uc6FY/ySNrLZfhlnj8o9bJt2MMQzubP8wA2SiQT1MiYUV4yhvIAg9EoivMikXX7V3I2NKXoNuT+YiLuteOKs+j06/3a3KtALVnRy2vWMW1lh429fsSuaZm7uXjMsPvLMB8/1mlgR4kDPjKOGClLhyH198pKF2qlSp/kDQsTHnm+VlufO4Kws5+3TfPgzQgdfD9Ign1hgcuQNr8j0z7LydF60o8RGfS6/toBNDD4vH7+ErwtqMQ5bOJ05Z05qisR+xjJjdl+mBWT8pqeiUrI9zb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5rQ/dpj45d2+3PHn8f8nwj2Vy7BaSk2SaFksDHfOioI=;
	b=BtCctRsQb+HpHJEyLAKxUtVwq4IH9mRmpXtC4U3pMoZ5lmDyjcmrNHDRjAKRYEQOgsUgGwFxW8JiJJEiYYOi3XbOEeCqnorp46+pV6vIANNh+VzhU966DAZeXq0cqFFHJk/7534YW9atmxxNMJjVrMfE0w1ai6XUsMGVWRtumsrmMu9MGASF8AWWRmuT915Zc/ZiVlu6rRdkv+t2GqpZBcDLJERJyT/rioqep8xzOEWfIC4kHThV25Q9+3dRbJfqKxfn5PdaD58PGlQXHSelHKtTK3HuL/zOvN5pUrgDBxfAMaYxaDjcu75DiV4fz3Vg/tLBRFSC0+Y+QZ7q/648Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=verimatrix.com;dmarc=pass action=none
	header.from=verimatrix.com;dkim=pass header.d=verimatrix.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verimatrix.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5rQ/dpj45d2+3PHn8f8nwj2Vy7BaSk2SaFksDHfOioI=;
	b=xIg6vLsdvJD1/3ZBO0wm69XYH5lNJv9cXYTqlDIznizsOixSG8j5aJL3gHIzM8QITDgzpf9gzbeiXAOLv39QCRwavw90VaWcqCkQ0gYCshEZClqzRNRWkKvIysMroZztrMOR7Mo3HHrc0sEhkEt4irFqt1I2X+rvXkm8Zpra7VU=
Received: from MN2PR20MB2973.namprd20.prod.outlook.com (52.132.172.146) by
	MN2PR20MB3229.namprd20.prod.outlook.com (52.132.175.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.10; Thu, 18 Jul 2019 10:40:57 +0000
Received: from MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69]) by
	MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69%6]) with mapi id 15.20.2073.012;
	Thu, 18 Jul 2019 10:40:57 +0000
From: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
To: Milan Broz <gmazyland@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Thread-Topic: xts fuzz testing and lack of ciphertext stealing support
Thread-Index: AQHVO/5l0aVU4O6KC0WgPIqEsMQCDqbPEhUAgAALMYCAANVxgIAABoCAgAABwICAAAUbgIAAFRTA
Date: Thu, 18 Jul 2019 10:40:56 +0000
Message-ID: <MN2PR20MB2973D8B6E898E3212D6A4A12CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
In-Reply-To: <36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-pgp-mapi-encoding-version: 2.5.0
x-pgp-encoding-version: 2.0.2
x-pgp-encoding-format: MIME
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=pvanleeuwen@verimatrix.com; 
x-originating-ip: [188.204.2.113]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df60fd8f-dcab-4764-c55d-08d70b6c6b03
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);
	SRVR:MN2PR20MB3229; 
x-ms-traffictypediagnostic: MN2PR20MB3229:
x-microsoft-antispam-prvs: <MN2PR20MB32298EB49B04ED016404AEAFCAC80@MN2PR20MB3229.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39850400004)(346002)(136003)(396003)(366004)(376002)(199004)(189003)(13464003)(86362001)(7696005)(186003)(6246003)(53936002)(64756008)(66556008)(9686003)(71190400001)(5660300002)(14444005)(256004)(71200400001)(15974865002)(316002)(54906003)(110136005)(76176011)(486006)(52536014)(476003)(99286004)(6506007)(6436002)(66946007)(66446008)(66616009)(74316002)(99936001)(478600001)(229853002)(66476007)(68736007)(26005)(305945005)(14454004)(6116002)(76116006)(7736002)(11346002)(8936002)(446003)(55016002)(53546011)(3846002)(2906002)(81166006)(25786009)(33656002)(66066001)(8676002)(81156014)(102836004)(4326008)(18886075002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR20MB3229;
	H:MN2PR20MB2973.namprd20.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: verimatrix.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YTcLahXsbrZwZDder7yaA8+RZGqC3qxRCjM+/zvjOzWCWeS3bjHsbcEED+MKj+aztoSxQgiLYOorW5ffq6svohtcT1fsUjrGRjJJhtbR4AENA3J92OWwTYo0joydXTplOQnBwo6810pcSl5t4TLWclAveknvr6WuJ+no0eeSp0ucNym5DYu7gT/1hIRw1T6nQrMPtvTPj3ZFrMo3lBvEPDSE6nJA1uGkmZ9Gb527oCU9UR3dIkmpPdmerp/52G762fM7tsj9/htnWFWwq2xUMQOgD/0UaYJB1ow6OLlPaU5MBRhdTH7HUyHUjcwNgrFtxd+0fL3iuG8Sh7zY0I8r9RxSAQOHNFdjaSUsPrZfsergrs+QaL/Jd1aTOzuAfrLGoEs7Tyxn484VbSHhx8/hYfn/6IcXHePgsfMPP8FAdFI=
MIME-Version: 1.0
X-OriginatorOrg: verimatrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df60fd8f-dcab-4764-c55d-08d70b6c6b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 10:40:56.6812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcb260f9-022d-4495-8602-eae51035a0d0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvanleeuwen@verimatrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB3229
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Thu, 18 Jul 2019 10:40:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Thu, 18 Jul 2019 10:40:59 +0000 (UTC) for IP:'40.107.68.75'
	DOMAIN:'mail-eopbgr680075.outbound.protection.outlook.com'
	HELO:'NAM04-BN3-obe.outbound.protection.outlook.com'
	FROM:'pvanleeuwen@verimatrix.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.68.75
	mail-eopbgr680075.outbound.protection.outlook.com 40.107.68.75
	mail-eopbgr680075.outbound.protection.outlook.com
	<pvanleeuwen@verimatrix.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jul 2019 04:53:52 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
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
Content-Type: multipart/mixed; boundary="===============5368009546455856632=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 19 Jul 2019 08:54:11 +0000 (UTC)

--===============5368009546455856632==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="PGP_Universal_DE47C979_136D8CF4_95D90198_F11F13E0";
	protocol="application/pgp-signature"; micalg="pgp-sha256"

--PGP_Universal_DE47C979_136D8CF4_95D90198_F11F13E0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: QUOTED-PRINTABLE

> -----Original Message-----
> From: linux-crypto-owner@vger.kernel.org <linux-crypto-owner@vger.kernel.=
org> On Behalf Of Milan Broz
> Sent: Thursday, July 18, 2019 9:40 AM
> To: Herbert Xu <herbert@gondor.apana.org.au>; Ard Biesheuvel <ard.biesheu=
vel@linaro.org>
> Cc: Horia Geanta <horia.geanta@nxp.com>; linux-crypto@vger.kernel.org; dm=
-devel@redhat.com
> Subject: Re: xts fuzz testing and lack of ciphertext stealing support
>=20
> On 18/07/2019 09:21, Herbert Xu wrote:
> > On Thu, Jul 18, 2019 at 09:15:39AM +0200, Ard Biesheuvel wrote:
> >>
> >> Not just the generic implementation: there are numerous synchronous
> >> and asynchronous implementations of xts(aes) in the kernel that would
> >> have to be fixed, while there are no in-kernel users that actually
> >> rely on CTS. Also, in the cbc case, we support CTS by wrapping it into
> >> another template, i.e., cts(cbc(aes)).
> >>
> >> So retroactively redefining what xts(...) means seems like a bad idea
> >> to me. If we want to support XTS ciphertext stealing for the benefit
> >> of userland, let's do so via the existing cts template, and add
> >> support for wrapping XTS to it.
> >
> > XTS without stealing should be renamed as XEX.  Sure you can then
> > wrap it inside cts to form xts but the end result needs to be called
> > xts.
>=20
> While I fully agree here from the technical point of view,
> academically XEX, XEX* is a different mode.
> It would create even more confusion.
>=20
> Couldn't resist, but this is a nice example of what happens when academic,
> standardization, and reality meets in one place :)
>=20
> XTS is already implemented in gcrypt and OpenSSL.
> IMO all the implementation should be exactly the same.
>=20
> I agree with Herbert that the proper way is to implement ciphertext steal=
ing.
> Otherwise, it is just incomplete implementation, not a redefining XTS mod=
e!
>=20
> See the reference in generic code - the 3rd line - link to the IEEE stand=
ard.
> We do not implement it properly - for more than 12 years!
>=20

Full XTS is XEX-TCB-CTS so the proper terminology for "XTS without CTS" wou=
ld be XEX-TCB.
But the problem there is that TCB and CTS are generic terms that do not imp=
ly a specific=20
implementation for generating the tweak -or- performing the ciphertext stea=
ling.
Only the *full* XTS operation is standardized (as IEEE Std P1619).

In fact, using the current cts template around the current xts template act=
ually does NOT
implement standards compliant XTS at all, as the CTS *implementation* for X=
TS is=20
different from the one for CBC as implemented by the current CTS template.
The actual implementation of the ciphertext stealing has (or may have) a se=
curity impact,
so the *combined* operation must be cryptanalyzed and adding some random CT=
S scheme
to some random block cipher mode would be a case of "roll your own crypto" =
(i.e. bad).

=46rom that perspective - to prevent people from doing cryptographically st=
upid things -
IMHO it would be better to just pull the CTS into the XTS implementation i.=
e. make
xts natively support blocks that are not a multiple of (but >=3D) the ciphe=
r blocksize ...

> Reality check - nobody in block layer needs ciphertext stealing, we are a=
lways
> aligned to block. AF_ALG is a different story, though.

So you don't support odd sector sizes like 520 , 528, 4112, 4160 or 4224 by=
tes?
>=20
> Milan

Regards,
Pascal van Leeuwen
Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
www.insidesecure.com

--PGP_Universal_DE47C979_136D8CF4_95D90198_F11F13E0
Content-Type: application/pgp-signature;
	name="PGP.sig"
Content-Transfer-Encoding: 7BIT
Content-Disposition: attachment;
	filename="PGP.sig"

-----BEGIN PGP SIGNATURE-----
Version: 10.4.2 (Build 502)

iQEVAwUBXTBMs/LgekqIHlBwAQitCwgAnm2qB2g7snxyxiWVMGyU9L6jJPFRGztj
Gmm9pjSPBUMzBwDkSPBy0So7r0wpOglScWXNBKZct90iSfeiuUJDNG5vcxTvTmE4
HSo3e4NsQIxypo7YyKTXmgx+gNAT0iagzJPHGlgxOnPbfWhG2co45+P7OKbpNWHu
Qqia2g11E4xxQt1NQUo/OYcOUY2qLqpfk3lCC25css0cO/W5EvgOKYYejl589fi6
Ibh22Z8XKZYqMxGgHg9B3G6qhg8al73upXOJoHYxvW6LggpTOHdyjbGppUQLAJ3Y
XzXB/pOqmHnkU3jaw1Ho3CViuzcrzubYFLyeAfs3nS7Boqe61FKvpQ==
=/fs+
-----END PGP SIGNATURE-----

--PGP_Universal_DE47C979_136D8CF4_95D90198_F11F13E0--


--===============5368009546455856632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============5368009546455856632==--

