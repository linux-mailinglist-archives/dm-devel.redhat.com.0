Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE06E2F0
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jul 2019 10:54:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DE33335FE;
	Fri, 19 Jul 2019 08:54:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4503419C68;
	Fri, 19 Jul 2019 08:54:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D38831972D;
	Fri, 19 Jul 2019 08:54:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IGZWbh005876 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 12:35:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3ACCA608A6; Thu, 18 Jul 2019 16:35:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 320E260A35
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 16:35:29 +0000 (UTC)
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr810041.outbound.protection.outlook.com [40.107.81.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF75FC065134
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 16:35:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EvblFhu8OovOKS8e5B60Z3m5Pv2wOpX3d7HVVs9ZKDd/kyCslwb81/CJA9ey+KYd+FttrxHYTYCJxs2o75P1Yh7RvS27Xx+w+gynSrkViJbkRJUB4IhomiE0tJPmseZ6impjVjTuGwi3h6D39x25vnKXyK1wovor8gdX2h17BpskAFfkhhBF9os2c6LKhHzTZk3kf8g4Q7J9DCbd20oCbj5S0ojUGTQCiu9Xcj40vH66Dg9UGbKXkqAUW6UfHPPSqFtVic74fWV6EMGtzDsYf41lsfVwri7W7vhRVYZbQDSY42t7cVW84QhNGnMy9t+EX1hpSyoq92OQJho+uU/O0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SRW8Aun+R6qgkHbJzWvObFpZvOUdBc9/rA9JkhyYW48=;
	b=lX6Ic/zGqZiZv/3CbmOYAfn9CMB63P3X2uLPmCLE1KFWWkoxA6lzwrWOYV+Uh7gIyxTUjdn/uLZMruNh5RvI5OvXhhn8KtFdIT5iFMLDgbahJMn65TbQMpZMPdOmJd+5b8YjpOumYP0j5NvhrPC5vQnt79WyiSGbeD4rcEOeIgD8E2E+jfq74JxhoC4tl8Ap12sEffB7K4/nt3AGMmZIwbUIak/5GspUhM1cVSY1HwadCLEkX0H0ONoghN9LiPoMaHoW/MYDvlTxxh6wD0smwVBou7dTuedEeuE3/JHP/K5WOUZc3C6ED+CHw2TaO2zm0OyEUHyr4hT1oH1jQLN5sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=verimatrix.com;dmarc=pass action=none
	header.from=verimatrix.com;dkim=pass header.d=verimatrix.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verimatrix.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SRW8Aun+R6qgkHbJzWvObFpZvOUdBc9/rA9JkhyYW48=;
	b=jbpDXwkw0dPYFYOY+qwTh0LUs2ArV0Y1h/o7gzB5DA8VUNZCFgCIrnqcuVmrFGgp6q5Y0SKNRItuuiwirBSEUNKZ63v7+93QsfPsRlMPuY+acmO4JTevpC0XRSNykvpPjA19TWeSExq4f+QK+rys1gAhzHKG6OPRWkJVKc+48Dg=
Received: from MN2PR20MB2973.namprd20.prod.outlook.com (52.132.172.146) by
	MN2PR20MB2335.namprd20.prod.outlook.com (20.179.148.86) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.14; Thu, 18 Jul 2019 16:35:27 +0000
Received: from MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69]) by
	MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69%6]) with mapi id 15.20.2073.012;
	Thu, 18 Jul 2019 16:35:27 +0000
From: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Thread-Topic: xts fuzz testing and lack of ciphertext stealing support
Thread-Index: AQHVO/5l0aVU4O6KC0WgPIqEsMQCDqbPEhUAgAALMYCAANVxgIAABoCAgAABwICAAAUbgIAAFRTAgABt8gCAAADKkIAABYEAgAAAS+A=
Date: Thu, 18 Jul 2019 16:35:27 +0000
Message-ID: <MN2PR20MB29733744D766C971A5DCEA6BCAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
References: <VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
	<MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20190718152908.xiuze3kb3fdc7ov6@gondor.apana.org.au>
	<MN2PR20MB2973E1A367986303566E80FCCAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20190718155140.b6ig3zq22askmfpy@gondor.apana.org.au>
In-Reply-To: <20190718155140.b6ig3zq22askmfpy@gondor.apana.org.au>
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
x-ms-office365-filtering-correlation-id: 31eb1174-44a4-4ae7-9de0-08d70b9df0ee
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
	SRVR:MN2PR20MB2335; 
x-ms-traffictypediagnostic: MN2PR20MB2335:
x-microsoft-antispam-prvs: <MN2PR20MB2335F4D048985091A93DF57ECAC80@MN2PR20MB2335.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39850400004)(376002)(136003)(366004)(346002)(396003)(199004)(189003)(99286004)(476003)(7696005)(316002)(486006)(86362001)(256004)(446003)(4326008)(33656002)(68736007)(99936001)(11346002)(8676002)(6436002)(6862004)(8936002)(14454004)(81156014)(81166006)(3846002)(66066001)(2906002)(6116002)(66946007)(52536014)(6506007)(55016002)(54906003)(9686003)(64756008)(478600001)(66556008)(66616009)(966005)(66446008)(76116006)(66476007)(7736002)(305945005)(74316002)(229853002)(15974865002)(76176011)(6306002)(53936002)(5660300002)(6246003)(71200400001)(71190400001)(186003)(25786009)(102836004)(26005)(18886075002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR20MB2335;
	H:MN2PR20MB2973.namprd20.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: verimatrix.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EJsHL4BW1kzeo82zZhOtZM8OtxeyKtn9Te0H65g/ZPsHf/7Wd8MinvvdraAcYyWrZX+ioovfUiOFGnYPUq8xvfhT9hZEAj0Y9FYCmHjoWFj0Fd9qFNOSQyVD5kEJy4hcRJytU8UGu70oICh6NAcyeXYyKgPQM6opVunbkGmooAMpdmXNuKBgJ9xV++Z7BczeSJcM6goGBEt26FojS6l5y5mzEf8vKMLxThoJvX/Fkun5jdAS3qjucE34Z7H3cCrF/LgCaHdca28OYWaqB0WzBmN/FZRhPm4NYakDMclHqgTnL3yAIUuTaNADvjRyzWwWkDaGWFriezeKK8DE6F8kjfrmIjDBh2kgZh88XWnNRFCnVZnQ6v9Uo+fe6p/17vw/Oa4MXM8lWPV736hDIeB4gP4eKsEMy95mAjDlrYAvTKc=
MIME-Version: 1.0
X-OriginatorOrg: verimatrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31eb1174-44a4-4ae7-9de0-08d70b9df0ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 16:35:27.3346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcb260f9-022d-4495-8602-eae51035a0d0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvanleeuwen@verimatrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB2335
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Thu, 18 Jul 2019 16:35:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 18 Jul 2019 16:35:29 +0000 (UTC) for IP:'40.107.81.41'
	DOMAIN:'mail-eopbgr810041.outbound.protection.outlook.com'
	HELO:'NAM01-BY2-obe.outbound.protection.outlook.com'
	FROM:'pvanleeuwen@verimatrix.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.81.41
	mail-eopbgr810041.outbound.protection.outlook.com 40.107.81.41
	mail-eopbgr810041.outbound.protection.outlook.com
	<pvanleeuwen@verimatrix.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jul 2019 04:53:52 -0400
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Horia Geanta <horia.geanta@nxp.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
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
Content-Type: multipart/mixed; boundary="===============4418973392471968214=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 19 Jul 2019 08:54:13 +0000 (UTC)

--===============4418973392471968214==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="PGP_Universal_982A0EC9_DCDF9C0E_0454DD6E_4E39E009";
	protocol="application/pgp-signature"; micalg="pgp-sha256"

--PGP_Universal_982A0EC9_DCDF9C0E_0454DD6E_4E39E009
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: QUOTED-PRINTABLE

> >
> > Hmmm ... so the generic CTS template would have to figure out whether i=
t is wrapped
> > around ECB, CBC, XTS or whatever and then adjust to that?
>=20
> That's not hard to do.  Right now cts only supports cbc.  IOW
> if you pass it anything else it will refuse to instantiate.
>=20

Ah, I see it now:

if (strncmp(alg->base.cra_name, "cbc(", 4))
		goto err_drop_spawn;

So you cannot even do cts(xts) at the moment.

> > For XTS, you have this additional curve ball being thrown in called the=
 "tweak".
> > For encryption, the underlying "xts" would need to be able to chain the=
 tweak,
> > from what I've seen of the source the implementation cannot do that.
>=20
> You simply use the underlying xts for the first n - 2 blocks and
> do the last two by hand.
>=20

Possible, but then you're basically pulling a generic XTS implementation in=
to cts.c,
since XTS is nothing more than the repeated application of just that.
Same thing would apply to any other mode you eventually need cts for.

But I suppose it would save you the trouble of having to add cts to all ind=
ividual
optimized software implementations of xts-which-is-not-really-xts, so I can=
 see=20
WHY you would want to do it that way ...

Tthen there's still the issue of advancing that last tweak. From what I've =
seen,
the xts implementation does not output the last tweak so you would have to=
=20
recompute it locally in cts.c as block_cipher_enc(iv) * alpha^j. Which is w=
asteful.
Of course this could be solved by redefining xts to output the last tweak
like CBC/CTR output their last IV ... Which would probably give us HW guys
trouble again because our HW cannot do *that* ... (While the HW very likely=
=20
*does* implement the cipher text stealing properly, just to be able to boast
about IEEE P1619 compliance ...)

> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

Regards,
Pascal van Leeuwen
Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
www.insidesecure.com

--PGP_Universal_982A0EC9_DCDF9C0E_0454DD6E_4E39E009
Content-Type: application/pgp-signature;
	name="PGP.sig"
Content-Transfer-Encoding: 7BIT
Content-Disposition: attachment;
	filename="PGP.sig"

-----BEGIN PGP SIGNATURE-----
Version: 10.4.2 (Build 502)

iQEVAwUBXTCfzfLgekqIHlBwAQivyAf/fMuSyLNEr1dR0JRZ6vXs3CWRlRQPc4sc
juzLDGaxWfpwSegf3StWDHyyNW1ue3ibpzAHzb++oNvll2USoo4o7hvsa/8ycPUf
AXlrnjkxy2qcpomgDdPLZDKPgm5fqCHUY/B5b0DxbgC8A0T5ZtjoL5YMp/NO+8WE
GRSFR5boeNn3I88qt0cJ5pjPhA0lSQ6YphnSYfpTow2ulXmr00lH4Wn/mB1oZgyx
r/IAsyiR81vOn7fVz+xGADCjNTjTXUsUHJteljZC06+aoGRGxQm53ZAnmpkC1f2a
+Lb0PaKen4BMkioGxzAeo1qmPeLnQl/CRNKsP1Z+umbU5Nj83DVlBA==
=UzKy
-----END PGP SIGNATURE-----

--PGP_Universal_982A0EC9_DCDF9C0E_0454DD6E_4E39E009--


--===============4418973392471968214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============4418973392471968214==--

