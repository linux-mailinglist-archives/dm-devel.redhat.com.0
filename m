Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 650626E2F2
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jul 2019 10:54:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC8137FDFD;
	Fri, 19 Jul 2019 08:54:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 726B66134E;
	Fri, 19 Jul 2019 08:54:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D99511800206;
	Fri, 19 Jul 2019 08:54:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6J7TYjg022161 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 03:29:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D90E86012C; Fri, 19 Jul 2019 07:29:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3038601A9
	for <dm-devel@redhat.com>; Fri, 19 Jul 2019 07:29:32 +0000 (UTC)
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820052.outbound.protection.outlook.com [40.107.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8479F804F2
	for <dm-devel@redhat.com>; Fri, 19 Jul 2019 07:29:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gnSEOZENTZAgT2n0pLlNu5jzDRHP1Higq8+Hm1BBGXF70EQnhxcNep6QTrbNxH2bpMwGSLpzUNZjfdRFvt2vHAGRvvmpK3q1cxkla5UhvWsapwxKo3PNW1+FG2W5j2O90PVgnDm0CiwHOmn3PeBfWOevyTHKAcYAPGWfSnIA9Vwq+xWePUOWsYAI40Rvw79L2XuID1kl5fGRhE8bz+TyQFS39nBQefwwBCqd9omHF5YAJzBaSu8YMqWnAD0MciGmu1MSRIfgE5hIsvIK1k19lLwF/v55Ekxasj9IbLgyOM6r40fSVB5KzgBZU6eE9vqnTidJIJDqgDNT5E/b3cJBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uqUhYKbF0s5ZNGuDfWAAjVrLg6zn62RubSWTFNFp38c=;
	b=GcCQwGyyqP/Cus4hlyj3RP1PdvDwsvujKUlDu7BpLWiLjROol4aljaPg4phsFHVbQa0P2Az2AfTV603nDUUb4facgFTqt6cfQFEN6x9fJhxl9DXWqWtEP4+LqUftnRowzIB7FGWncO3DLeBWGBnA9VEbezUI3YWwUHAby/OLPMn9aRt8I4hh547Dk/2mV1EMkDzWMxmj7BKdD+CZ3MR7rm0UCWsSkolgknH60yrRVMIEjBEBEpLiGNXEShcduEK4OaggZx65LhZumux1j+S3a+0ArrIsvQcrsqjkgu2uIWg8B4cVftHwUtzfHSLP9PVlxzvHh5TbDZqyECQagjCSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=verimatrix.com;dmarc=pass action=none
	header.from=verimatrix.com;dkim=pass header.d=verimatrix.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verimatrix.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uqUhYKbF0s5ZNGuDfWAAjVrLg6zn62RubSWTFNFp38c=;
	b=BqQySRRw7fHjFnLv+iJMAtuip6lDP+BBT26ECfnCogBQZgL7BE4IM4u2lSWeAZ6D2Qo8+/2oavFPUEW+eJstWv1T8LioH1qt2l7xHa1hPuKZAqvJFq8R9XY9E7oCIh5dOr9GFuzBfje/XxeceMzepB+vHnEe25NooR0O56h042I=
Received: from MN2PR20MB2973.namprd20.prod.outlook.com (52.132.172.146) by
	MN2PR20MB3149.namprd20.prod.outlook.com (52.132.174.214) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.14; Fri, 19 Jul 2019 07:29:27 +0000
Received: from MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69]) by
	MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69%6]) with mapi id 15.20.2073.012;
	Fri, 19 Jul 2019 07:29:27 +0000
From: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Thread-Topic: xts fuzz testing and lack of ciphertext stealing support
Thread-Index: AQHVO/5l0aVU4O6KC0WgPIqEsMQCDqbPEhUAgAALMYCAANVxgIAABoCAgAABwICAAAUbgIAAFRTAgABt8gCAAADKkIAABYEAgAAHwACAAAYnsIAA2AKAgAAZT1A=
Date: Fri, 19 Jul 2019 07:29:26 +0000
Message-ID: <MN2PR20MB29734E80776A79B6BDDB38CACACB0@MN2PR20MB2973.namprd20.prod.outlook.com>
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
	<CAKv+Gu9qm8mDZASJasq18bW=4_oE-cKPGKvdF9+8=7VNo==_fA@mail.gmail.com>
	<MN2PR20MB2973DE308D0050DBF3F26870CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu8dE6EO1NOwni91cvEWJvPzieC3wKph73j2jWxzx_xKAw@mail.gmail.com>
In-Reply-To: <CAKv+Gu8dE6EO1NOwni91cvEWJvPzieC3wKph73j2jWxzx_xKAw@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: acb7cf89-931b-46da-1ff5-08d70c1ad4b8
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
	SRVR:MN2PR20MB3149; 
x-ms-traffictypediagnostic: MN2PR20MB3149:
x-microsoft-antispam-prvs: <MN2PR20MB3149B36847DB66693C6E40E7CACB0@MN2PR20MB3149.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(376002)(39850400004)(136003)(366004)(13464003)(199004)(189003)(81166006)(6862004)(8936002)(81156014)(25786009)(52536014)(15974865002)(8676002)(76176011)(4326008)(478600001)(6436002)(6246003)(5660300002)(102836004)(305945005)(71190400001)(71200400001)(55016002)(316002)(256004)(446003)(99286004)(66946007)(9686003)(53546011)(54906003)(86362001)(229853002)(186003)(3846002)(26005)(53936002)(14454004)(7736002)(476003)(33656002)(11346002)(486006)(6506007)(68736007)(66556008)(76116006)(64756008)(66446008)(66066001)(66476007)(66616009)(6116002)(74316002)(99936001)(7696005)(2906002)(18886075002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR20MB3149;
	H:MN2PR20MB2973.namprd20.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: verimatrix.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RJ8FvKrQg5NTF+ob2DgbNWuBeMOyk/kpBsaj5q8ANr5QwGPbRsgoEwi33vNFMg8VIB7sgeqz+1LkwSbQcH+KYcFyOBiotodeDdwQNSG1m3GKKe8OBKj2S6V/YjdYRb+A0hBniI79TBrPl8GFah94K6xtDymY4rFPQGkqKl5CWgB/OKBMXqFtBeBwit5Tdfe8blowdQFSFaZwKFj3zIl5wfJs/YHloQbpTwlS8lTZZV5YHSxXn/31Is3ULYcKTz4ce5lCAm+sfPWZmrdxFSY40gH+Rr1PgYxZofog1sPe2m9Nl0gVQ33WrnGGPWfl/y+hZ62chK7g8mPWTYHdWzx9S2JqxI1Io2rtFWxpD+3iPB0vX/0zRleHNLb6Tq+hJbrZY9S5SfsTlEcfGMZRDcCgOL18fZJ0e1hQ1chZwLaE++Q=
MIME-Version: 1.0
X-OriginatorOrg: verimatrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb7cf89-931b-46da-1ff5-08d70c1ad4b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 07:29:26.8437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcb260f9-022d-4495-8602-eae51035a0d0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvanleeuwen@verimatrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB3149
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Fri, 19 Jul 2019 07:29:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 19 Jul 2019 07:29:29 +0000 (UTC) for IP:'40.107.82.52'
	DOMAIN:'mail-eopbgr820052.outbound.protection.outlook.com'
	HELO:'NAM01-SN1-obe.outbound.protection.outlook.com'
	FROM:'pvanleeuwen@verimatrix.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.82.52
	mail-eopbgr820052.outbound.protection.outlook.com 40.107.82.52
	mail-eopbgr820052.outbound.protection.outlook.com
	<pvanleeuwen@verimatrix.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jul 2019 04:53:52 -0400
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Horia Geanta <horia.geanta@nxp.com>, Milan Broz <gmazyland@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4465943907565423121=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 19 Jul 2019 08:54:18 +0000 (UTC)

--===============4465943907565423121==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="PGP_Universal_9F2CBC73_A406C752_781FDF97_4DB767FE";
	protocol="application/pgp-signature"; micalg="pgp-sha256"

--PGP_Universal_9F2CBC73_A406C752_781FDF97_4DB767FE
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: QUOTED-PRINTABLE

> -----Original Message-----
> From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Sent: Friday, July 19, 2019 7:35 AM
> To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>; Milan Broz <gmazyland@gmail=
.com>; Horia Geanta <horia.geanta@nxp.com>; linux-
> crypto@vger.kernel.org; dm-devel@redhat.com
> Subject: Re: xts fuzz testing and lack of ciphertext stealing support
 >=20
> I would argue that these cases are diametrically opposite: you
> proposed to remove support for zero length input vectors from the
> entire crypto API to prevent your driver from having to deal with
> inputs that the hardware cannot handle.
>=20
I did not propose any such thing - I just proposed to make zero length hash=
 support *optional*
(i.e. don't fail and disable the driver on it) as it's totally irrelevant f=
or 99.99999% of use cases.
(including *all* use cases I consider relevant for HW acceleration)

> I am proposing not to add support for cases that we have no need for.
>
While you are proposing to stick with an implementation that can only deal =
with 6.25% (1/16th) of=20
*legal* input data for XTS and fails on the remaining 93.75%. That's hardly=
 a corner case anymore.
=20
> XTS without CTS is indistinguishable from XTS with CTS if the inputs
> are always a multiple of the block size, and in 12 years, nobody has
> ever raised the issue that our support is limited to that. So what
> problem are we fixing by changing this? dm-crypt does not care,
> fscrypt does not care, userland does not care (given that it does not
> work today and we are only finding out now due to some fuzz test
> failing on CAAM)
>=20
If it's not supported, then it cannot be used. Most people would not start =
complaining about that,=20
they would just roll their own locally or they'd give up and/or use somethi=
ng else.=20
So the fact that it's currently not being used does not mean a whole lot. A=
lso, it does not mean=20
that there will not be a relevant use case tomorrow. (and I can assure you =
there *are* definitely
real-life use cases, so I have to assume these are currently handled outsid=
e of the base kernel)

In any case, if you try to use XTS you would *expect* it to work for any in=
put >=3D 16 bytes as that's
how the algorithm is *specified*. Without the CTS part it's simply not XTS.

> > I pretty much made the same argument about all these driver workarounds
> > slowing down my driver fast path but that was considered a non-issue.
> >
> > In this particular case, it should not need to be more than:
> >
> > if (unlikely(size & 15)) {
> >   xts_with_partial_last_block();
> > } else {
> >   xts_with_only_full_blocks();
> > }
> >
>=20
> Of course. But why add this at all if it is known to be dead code?
>
But that's just an assumption and assumptions are the root of all evil ;-)


Regards,
Pascal van Leeuwen
Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
www.insidesecure.com

--PGP_Universal_9F2CBC73_A406C752_781FDF97_4DB767FE
Content-Type: application/pgp-signature;
	name="PGP.sig"
Content-Transfer-Encoding: 7BIT
Content-Disposition: attachment;
	filename="PGP.sig"

-----BEGIN PGP SIGNATURE-----
Version: 10.4.2 (Build 502)

iQEVAwUBXTFxVPLgekqIHlBwAQgQrAgAlYt/Sl+TabwjZKrHBAc9zJhrcgLknXDp
mU0ClfSXmepsV1TdBw+/pGB+pgIElN6CzYHwhTvIf6jAyV2Pl32ari7rvC+axm3D
oIvUTlt4tJKE9wFAFz5DHb00ngr0rAdjeOm7vWOQ6ca11JIQu8J6fGoVBzJO4giy
oJUi/nSfT2x2+ape5nGs3ky8mzErFGjCb1iV3q+8hn1zp5C6FXQk4/aL6oHpdYc/
7MrzMtxSaIrE05XnyNdrhw5BOoMxFQ8aFN6SOMDTmhGB/en0p2esRbTn0ljBdfsK
Ngl2gGjomXQRs0qeYru6vUbjiVoNAfpX/n0aotSFmpjpCJtI9MSUsQ==
=dmG9
-----END PGP SIGNATURE-----

--PGP_Universal_9F2CBC73_A406C752_781FDF97_4DB767FE--


--===============4465943907565423121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============4465943907565423121==--

