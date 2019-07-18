Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE826E2F1
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jul 2019 10:54:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8E862BFD1;
	Fri, 19 Jul 2019 08:54:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9A5E19C5B;
	Fri, 19 Jul 2019 08:54:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 557001972F;
	Fri, 19 Jul 2019 08:54:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IH3WmN013400 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 13:03:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E25595D71C; Thu, 18 Jul 2019 17:03:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBD1C5D71A
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 17:03:30 +0000 (UTC)
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 67E7F30C1324
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 17:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=DM/mHuT7AHmS1PbJ2kTv1My0s9DKSB2g50x7tfoUZI61ARx4pYuxtmUnd1JHbbMEOUKX9kWluogGmu1RKC7KHINjeO8UO5rM6/P8ZXC7lx2KUtvSHDSpAHu47z6TW7Lg8yUUdV7nrz1xOF4m63QM8FZIzOBMBUNfWZMmpXSWaoqzLUnLznSMvdoGkX12oow+1AyYlXvHv9fGWOFXWqyoOb6MWL1r9OA/zLAzef+ic9CcIzPkCMFLuOIS2r+VnOHh3VrVr0a9QzWtzjUZPbEnP2Ld8y25WAYrIOFBkfiZRD2KNHzOLC7rUaN2b/yp6CP6N0qkJvjszGNYAoZohEA3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4ss3dH3iRlTADbQYGxNlWcWfPFLajByTDDtS7WLU+JA=;
	b=GNOBkzXyGTet/XL+tXIxmcT/sZ2kPX9u1yStSv7platWeUnVQezjB34k3CAqQi/ZNWJ+YIAeoz5RT8bH8CwqnNDSNx+D04Qc3Q74FY/AXlvhLf+hNTjl4b0pqpr5HpsDusT7tJ/CRIzYO2Kskf8RVnpXR4dTEK9/+b9lZbhLDIOzH8b7bb7yKnGfsUEfGnyn7mDDULjGrNKMm5QPINf1xpUQueuq9uwmH861CSWQQj65MSWjXrcrsGnXz/B32JD2sUg+2u9sEbk87gIxzI3u8QRINjPwRQ0j7A9/egJcz6S/Hh1S8HSqfAScRuEhbL/+1ozHHnq/7qhFhTJ8V6SUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=verimatrix.com;dmarc=pass action=none
	header.from=verimatrix.com;dkim=pass header.d=verimatrix.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verimatrix.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4ss3dH3iRlTADbQYGxNlWcWfPFLajByTDDtS7WLU+JA=;
	b=CKbmkC/7hvRogNgGZvjaIwoJT1Xh4Kp6mfLU1O2AT7cBOIesR+Jdxoi9nqwXUbGhw6x0S3WCrOdSlw49PlIyzqo9lghkNUOjutn+cc94TDdmVnOaTLk0M9cSoU9kz3CMv/PficIAg5HBSv8kaWZv7cR/i9o07wE2I8r9JgSoxk0=
Received: from MN2PR20MB2973.namprd20.prod.outlook.com (52.132.172.146) by
	MN2PR20MB2783.namprd20.prod.outlook.com (20.178.253.97) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.14; Thu, 18 Jul 2019 17:03:27 +0000
Received: from MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69]) by
	MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69%6]) with mapi id 15.20.2073.012;
	Thu, 18 Jul 2019 17:03:27 +0000
From: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Herbert Xu
	<herbert@gondor.apana.org.au>
Thread-Topic: xts fuzz testing and lack of ciphertext stealing support
Thread-Index: AQHVO/5l0aVU4O6KC0WgPIqEsMQCDqbPEhUAgAALMYCAANVxgIAABoCAgAABwICAAAUbgIAAFRTAgABt8gCAAADKkIAABYEAgAAHwACAAAYnsA==
Date: Thu, 18 Jul 2019 17:03:27 +0000
Message-ID: <MN2PR20MB2973A72AB15D73FCF10AD3C4CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
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
In-Reply-To: <CAKv+Gu9qm8mDZASJasq18bW=4_oE-cKPGKvdF9+8=7VNo==_fA@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: eed19f65-17bd-4b82-8927-08d70ba1da3c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
	SRVR:MN2PR20MB2783; 
x-ms-traffictypediagnostic: MN2PR20MB2783:
x-microsoft-antispam-prvs: <MN2PR20MB2783F43B96C32B7A53A1050ACAC80@MN2PR20MB2783.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(396003)(346002)(39850400004)(136003)(366004)(189003)(199004)(53936002)(66066001)(71190400001)(86362001)(486006)(68736007)(71200400001)(6436002)(66616009)(6506007)(15974865002)(7696005)(102836004)(52536014)(478600001)(76116006)(66556008)(66946007)(64756008)(66476007)(9686003)(7736002)(4326008)(229853002)(5660300002)(55016002)(6116002)(25786009)(66446008)(316002)(54906003)(6246003)(305945005)(476003)(446003)(8936002)(81156014)(81166006)(11346002)(8676002)(256004)(99286004)(14454004)(2906002)(76176011)(99936001)(186003)(3846002)(33656002)(26005)(110136005)(74316002)(18886075002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR20MB2783;
	H:MN2PR20MB2973.namprd20.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: verimatrix.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NfKAAaH/AECBwFST8sBg5mz5hFrMYiDq+jEzW5HGdNDT73QmsD4TYOs9RsVGZZQyJhjQKYPknrXyICTpU3b5tIBJ0hMdwhqeksXaYUutXHaFDoFcnIFFLzYrgMzpsam11c+N4DOzW8PIKJiiO1V0yac7erI08BKWskuou31BNTPtWzM2JXD1bKLUcv2eluYkABERpSc0KEBBHq4QGT/XHRn3L/a9uGzVnp5ElK7Qqr6u1W8IvAkrWT18BxYyNShDHUoSuobTi1xhh7KQQHLOtFNcHYduK+KHhPqNSYvBkIlSNZd77Axd1vOIDaCaRw/0dU3usROIxTUEW9pLHbkOY67Wph5j9tReglUzz3DiFgUIF+O/UXPZo+YQBmC4nYCSNtdw1Kw2BtJ7gs+K+JVYfR3LAf58oReYc8ty4HlQEHI=
MIME-Version: 1.0
X-OriginatorOrg: verimatrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed19f65-17bd-4b82-8927-08d70ba1da3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 17:03:27.2456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcb260f9-022d-4495-8602-eae51035a0d0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvanleeuwen@verimatrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB2783
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Thu, 18 Jul 2019 17:03:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Thu, 18 Jul 2019 17:03:29 +0000 (UTC) for IP:'40.107.74.51'
	DOMAIN:'mail-eopbgr740051.outbound.protection.outlook.com'
	HELO:'NAM01-BN3-obe.outbound.protection.outlook.com'
	FROM:'pvanleeuwen@verimatrix.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.74.51
	mail-eopbgr740051.outbound.protection.outlook.com 40.107.74.51
	mail-eopbgr740051.outbound.protection.outlook.com
	<pvanleeuwen@verimatrix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jul 2019 04:53:52 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Horia Geanta <horia.geanta@nxp.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1628117909731038173=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 19 Jul 2019 08:54:15 +0000 (UTC)

--===============1628117909731038173==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="PGP_Universal_8364B94B_54EE25AE_8988CEE2_DCCEC36B";
	protocol="application/pgp-signature"; micalg="pgp-sha256"

--PGP_Universal_8364B94B_54EE25AE_8988CEE2_DCCEC36B
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: QUOTED-PRINTABLE

> > > For XTS, you have this additional curve ball being thrown in called t=
he "tweak".
> > > For encryption, the underlying "xts" would need to be able to chain t=
he tweak,
> > > from what I've seen of the source the implementation cannot do that.
> >
> > You simply use the underlying xts for the first n - 2 blocks and
> > do the last two by hand.
> >
>=20
> OK, so it appears the XTS ciphertext stealing algorithm does not
> include the peculiar reordering of the 2 final blocks, which means
> that the kernel's implementation of XTS already conforms to the spec
> for inputs that are a multiple of the block size.
>=20
Yes, for XTS you effectively don't do CTS if it's a 16 byte multiple ...

> The reason I am not a fan of making any changes here is that there are
> no in-kernel users that require ciphertext stealing for XTS, nor is
> anyone aware of any reason why we should be adding it to the userland
> interface. So we are basically adding dead code so that we are
> theoretically compliant in a way that we will never exercise in
> practice.
>=20
You know, having worked on all kinds of workarounds for silly irrelevant
(IMHO) corner cases in  the inside-secure hardware driver over the past
months just to keep testmgr happy, this is kind of ironic ...

Cipher text stealing happens to be a *major* part of the XTS specification
(it's not actually XTS without the CTS part!), yet you are suggesting not=20
to implement it because *you* don't have or know a use case for it.
That seems like a pretty bad argument to me. It's not some minor corner=20
case that's not supported.The implementation is just *incomplete*
without it.

> Note that for software algorithms such as the bit sliced NEON
> implementation of AES, which can only operate on 8 AES blocks at a
> time, doing the final 2 blocks sequentially is going to seriously
> impact performance. This means whatever wrapper we invent around xex()
> (or whatever we call it) should go out of its way to ensure that the
> common, non-CTS case does not regress in performance, and the special
> handling is only invoked when necessary (which will be never).
>
I pretty much made the same argument about all these driver workarounds
slowing down my driver fast path but that was considered a non-issue.

In this particular case, it should not need to be more than:

if (unlikely(size & 15)) {
  xts_with_partial_last_block();
} else {
  xts_with_only_full_blocks();
}

Regards,
Pascal van Leeuwen
Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
www.insidesecure.com


--PGP_Universal_8364B94B_54EE25AE_8988CEE2_DCCEC36B
Content-Type: application/pgp-signature;
	name="PGP.sig"
Content-Transfer-Encoding: 7BIT
Content-Disposition: attachment;
	filename="PGP.sig"

-----BEGIN PGP SIGNATURE-----
Version: 10.4.2 (Build 502)

iQEVAwUBXTCmXPLgekqIHlBwAQhFyggAjXmI6K2Wfg800PAeeqOf21Sb2L+dYlpb
gQ2TWhTzoGBP5uY6/deTdGIYZYb8pRe63p3RijlEjKvkaNANL1TlEAwFAApiV2oA
MBcGW5veY/UMx6obWi68uWMrGNdQOjDbFolumQWTWKuaMVHCF4pdQznvhtyRSDvS
I8HUKBC48jaBTmingwWbbHPRdVqqdBoYfmWW0O/huMtwju7/FvoZFE01+ngG8aun
0kx7lHq9qAbHs+YbfrmkxcbBBzVSfotIUCu4swuQD7ncznJMSl/5Or2yNg9MYGAI
WGeAE8HLx1T1FUOmCm2IVWNWON20/IG9h2xlfmFaW7Xgs0RjmQHigQ==
=uTd+
-----END PGP SIGNATURE-----

--PGP_Universal_8364B94B_54EE25AE_8988CEE2_DCCEC36B--


--===============1628117909731038173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============1628117909731038173==--

