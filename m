Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1276E2EE
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jul 2019 10:54:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A901281DEC;
	Fri, 19 Jul 2019 08:54:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BAEE610AA;
	Fri, 19 Jul 2019 08:54:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F9761972D;
	Fri, 19 Jul 2019 08:54:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IFhbQm026817 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 11:43:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D41A05ED2B; Thu, 18 Jul 2019 15:43:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6065607D8
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 15:43:33 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680043.outbound.protection.outlook.com [40.107.68.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA5FB33655
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 15:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=J2mQkFQVCAwq4AuOWTMg4tdljI1yTCOq5tEba3JIe0bwzao+UNbRePCOAkHP8o1A8cIJpbFuVXmqedrkwvfpDwUug5B3w9TlrAU52dx0gPSupA70DJNniD+M/1OXnXfPa95zysl5G+E2eSA7GO9FYkT/tTJFIzdaex1ctMTxwWSgYCUyUDJMB2N4EpZdJ4u/jlFMShRdCgKt5V73SZx56GWIDaj5mJggYX+tzlmJcDNrXlVpwfnaboelOoWvNJETU7KXMdwFt0GucAcuiwDPheGTwyOrlBcmw4y9h3Wd+dBS3VmCLSoM/PfuLumbDRuy0x47gK38czufA+qeYQeKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tIyMCr+U6bXkCfkiKm9ucwOVBEF5VIOwHhx675T3K4E=;
	b=dp8Iv/31CU3TDtieBD5OWCVRorpN8EVzvQztrUnn/nWzcMNlVD/Cxr0PwnK2zkccVWHB/hM7YalPdpO0p+HiUkyPWbAdf4NcMN5bbfejUZOc27f2fBJfAnuJYQOK2Mw8iUlU3fj1TlYAoSWuXLXZPIHkAysj0IinTQjL/xeFpFyf+lxnDffp0vZqeZlecvydYQkgcrQ/9COpIX0eNpyo7KjcbmNWK0erWjac8jHZIoi8HjqRjuUzUh6U7EBzJEJoPtjYNKCpZOAohCq7VriC5X20Ivww05bJmaPyWU+9A4h57XJZ/08p7DnaWX6sprs2M2tpZ1fkeubQi4xVxJOAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=verimatrix.com;dmarc=pass action=none
	header.from=verimatrix.com;dkim=pass header.d=verimatrix.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verimatrix.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tIyMCr+U6bXkCfkiKm9ucwOVBEF5VIOwHhx675T3K4E=;
	b=UMZjtkkh74pPWB2dazh02FDiAEdhvbF8yQ0FRUbkZxAq/fvArykrxvtjnjM249I7q7YeV7Z6BwoPqtw+YcfHRk4zBkWBpZa9/LOGYo3d4bzKIdWpw0jFLB3C2S9kF0rDog6RdXb8gpe+Ant6Fk5PZtUGGqgdH6iW16Wl50sDzkY=
Received: from MN2PR20MB2973.namprd20.prod.outlook.com (52.132.172.146) by
	MN2PR20MB2477.namprd20.prod.outlook.com (20.179.147.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2094.12; Thu, 18 Jul 2019 15:43:29 +0000
Received: from MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69]) by
	MN2PR20MB2973.namprd20.prod.outlook.com
	([fe80::68d7:2bbb:af61:2e69%6]) with mapi id 15.20.2073.012;
	Thu, 18 Jul 2019 15:43:29 +0000
From: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Thread-Topic: xts fuzz testing and lack of ciphertext stealing support
Thread-Index: AQHVO/5l0aVU4O6KC0WgPIqEsMQCDqbPEhUAgAALMYCAANVxgIAABoCAgAABwICAAAUbgIAAFRTAgABt8gCAAADKkA==
Date: Thu, 18 Jul 2019 15:43:29 +0000
Message-ID: <MN2PR20MB2973CC2EFE19B6CBDBBDEA0DCAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
	<MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20190718152908.xiuze3kb3fdc7ov6@gondor.apana.org.au>
In-Reply-To: <20190718152908.xiuze3kb3fdc7ov6@gondor.apana.org.au>
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
x-ms-office365-filtering-correlation-id: a26cf49e-413f-4ab9-052d-08d70b96ae3c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
	SRVR:MN2PR20MB2477; 
x-ms-traffictypediagnostic: MN2PR20MB2477:
x-microsoft-antispam-prvs: <MN2PR20MB24777EA05688D1F78EAC6BABCAC80@MN2PR20MB2477.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(199004)(189003)(316002)(55016002)(9686003)(3846002)(4326008)(2906002)(5660300002)(6246003)(6306002)(6116002)(966005)(52536014)(66066001)(305945005)(486006)(446003)(53936002)(11346002)(229853002)(99286004)(6436002)(15974865002)(54906003)(6862004)(66476007)(66616009)(71200400001)(71190400001)(66446008)(64756008)(66946007)(66556008)(76116006)(8676002)(68736007)(76176011)(186003)(86362001)(8936002)(26005)(256004)(7696005)(102836004)(81156014)(7736002)(99936001)(74316002)(476003)(81166006)(14454004)(25786009)(6506007)(478600001)(33656002)(18886075002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR20MB2477;
	H:MN2PR20MB2973.namprd20.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: verimatrix.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0hqdiTlVhcLnwBXenBiYa3IX/KScmDBO7Of0+OIfdffL6jiOiY1gnZ1K5xYyA3PEOFg08kHDCotGElf4wNEbUq+Zv0ei09XkY5+gWaZp4xt23fmmzyzcTG5oY592sQB77qQ3yqoGq8Uzsf/wWSMpEBfml32VNdpzs1n9S8PtdlAOqwW6piu552STJrCufPkhbnQbF4nmLDQ9UP78mZD6QsoXR6K83ANJx8eoP3eRh95O7P+UCgsLe2dQ8SVSTWzmkkPq9YkC8QyY+y9GKD2PImrwpkeL6edKxdCthby6kC0opXdX7mm3mcWPA1rz4rbKoUvGAwI8NBol6Gn9hbO6pANBnLDAF4s6BZUuwD6CbIkdo2dl5/b5P5DcSPajDmZ5BpPawrxC9qcZZw9MntvDBjNrsBFBeCSVAQ208NeK2ko=
MIME-Version: 1.0
X-OriginatorOrg: verimatrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a26cf49e-413f-4ab9-052d-08d70b96ae3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:43:29.1973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcb260f9-022d-4495-8602-eae51035a0d0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pvanleeuwen@verimatrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR20MB2477
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Thu, 18 Jul 2019 15:43:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 18 Jul 2019 15:43:31 +0000 (UTC) for IP:'40.107.68.43'
	DOMAIN:'mail-eopbgr680043.outbound.protection.outlook.com'
	HELO:'NAM04-BN3-obe.outbound.protection.outlook.com'
	FROM:'pvanleeuwen@verimatrix.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.68.43
	mail-eopbgr680043.outbound.protection.outlook.com 40.107.68.43
	mail-eopbgr680043.outbound.protection.outlook.com
	<pvanleeuwen@verimatrix.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Content-Type: multipart/mixed; boundary="===============6517000384276546426=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 19 Jul 2019 08:54:11 +0000 (UTC)

--===============6517000384276546426==
Content-Language: en-US
Content-Type: multipart/signed;
	boundary="PGP_Universal_161D153D_397DC866_75855059_4C7F9127";
	protocol="application/pgp-signature"; micalg="pgp-sha256"

--PGP_Universal_161D153D_397DC866_75855059_4C7F9127
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: QUOTED-PRINTABLE

> > In fact, using the current cts template around the current xts template=
 actually does NOT
> > implement standards compliant XTS at all, as the CTS *implementation* f=
or XTS is
> > different from the one for CBC as implemented by the current CTS templa=
te.
>=20
> The template is just a name.  The implementation can do whatever it
> wants for each instance.  So obviously we would employ a different
> implementation for xts compared to cbc.
>
Hmmm ... so the generic CTS template would have to figure out whether it is=
 wrapped=20
around ECB, CBC, XTS or whatever and then adjust to that?

For ECB and CBC I suppose that's techically possible. But then what do I ge=
t when I
try to wrap CTS around some block cipher mode it doesn't recognise? Tricky =
...

For XTS, you have this additional curve ball being thrown in called the "tw=
eak".
For encryption, the underlying "xts" would need to be able to chain the twe=
ak,
=66rom what I've seen of the source the implementation cannot do that.

For decryption, you actually first need to decrypt the last block with the =
last
tweak before you can decrypt the 2nd last block with the 2nd last tweak.

Not sure how you intend to handle that with some generic wrapper around "xt=
s".

>=20
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

Regards,
Pascal van Leeuwen
Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
www.insidesecure.com

--PGP_Universal_161D153D_397DC866_75855059_4C7F9127
Content-Type: application/pgp-signature;
	name="PGP.sig"
Content-Transfer-Encoding: 7BIT
Content-Disposition: attachment;
	filename="PGP.sig"

-----BEGIN PGP SIGNATURE-----
Version: 10.4.2 (Build 502)

iQEVAwUBXTCTnvLgekqIHlBwAQgtwQf/Thh49Kl16U2uP/J15s2QZDc74g2waZTz
HNbH7qW4kNrKXk9WOH2S8en8rjGQpGZvyzeHUtn2oOvrYVau3y+415sULuQ0lTxr
ON8nCWOebBA54r5eWUTGNNG/MifezbgmatL1iKmqm0cNwmhqO4+/1q2qTJTitCb2
TqMyFLaevrF7lw4VOjqzJB77MWf6+EV6v0uAZaL74p7USbD2VslZX7rZAbwP3XEQ
GxtmxgObNGJ4bZ/eD0+qu04n+Hz3iNZ+hM4csdqQLeSxku0Nyw1Ls72J54naes/Q
g+BUy8frihzuwwfIFxaXhPEuJ9KV0/DgXw+km11q1JE1zWpSKtRC3w==
=rz3v
-----END PGP SIGNATURE-----

--PGP_Universal_161D153D_397DC866_75855059_4C7F9127--


--===============6517000384276546426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============6517000384276546426==--

