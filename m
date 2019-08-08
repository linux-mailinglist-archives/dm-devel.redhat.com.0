Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 66916864D3
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 16:51:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A20430FB8C5;
	Thu,  8 Aug 2019 14:51:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D679F6EF;
	Thu,  8 Aug 2019 14:51:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7643B18005A4;
	Thu,  8 Aug 2019 14:50:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78EoXiR021898 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 10:50:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7EBBD194BE; Thu,  8 Aug 2019 14:50:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D14C26160
	for <dm-devel@redhat.com>; Thu,  8 Aug 2019 14:50:24 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150052.outbound.protection.outlook.com [40.107.15.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F7EC3090FC8
	for <dm-devel@redhat.com>; Thu,  8 Aug 2019 14:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=bCJ+bwIJTF9aVvSH+PesrPX/VK+JlMzHij/EiDHMYVAGgNZRri2TwAvhU+6UhUFNMPAZ5oMLAtlAPV54QSZGJLWRNqhC9Bj0a4FaiTwlMuV5cqjYXYGSQsoGk7128IgvIar63Ps5NBXl79NkYJfTz1rqorGEQjvJt9JIYjqJuDfJtjAPlMhsRbnXYl+1tfipMX55ux/GG042OkPzKgzZMmBhwo0Ye6fJJqglW1ijIWjOl/ZmCPHJDRXFG0s+NaH5dYCPWb+WJRljHLKCyZN+WW2WxCdimpR3FmckVVuLNUzKZRbZYPlCz0NHjSPJV94TaekbKWDH+hzahMQNDQfXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hvNGNRud8Hdr8KXbq8H82j5TqhMCpM8tR2jaROCvTdo=;
	b=RR2GqU8C5hQC1d5YuhIrSKKSKaD+d9t5M6f3htF7eYYcEpDanBGnPsvAWJ85lVVqMVnsfyYrIT2x5B6c7EJ96Nn7YxLMD+8YC29Oq8Si2Ylp32u0wQjugxNS7mbFkzly73hzZb2ozH3O5bl/Oz7K8WYhPvYQJ2lbshaDAwa3LP3KAap5rurG5xAgTEF2SmkEF/LAKJRH7wyQd9CjAEDhatKYYVnLsPvZpAAcpWyZO4L9uEzf/AjN8CzFvbugOu5gciHi00nJor3g4G3m6YCdLw+nXetUarTtONJ4B7sl3FqGkkNYvtyGxmTglYNDY2lkbURP1O4Jh15JhBojkP9hLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hvNGNRud8Hdr8KXbq8H82j5TqhMCpM8tR2jaROCvTdo=;
	b=FQtk1sebTa+kwnd7y6RwaFmfXHOyb7g3ilaO0pqJ6nDQyZNgWr0+PFPQxbqHKqSvGIkEDevo9qBatGKgnPYbwXx8Iur8z1EexDIi4o6HChO1ET7GS4qa8+nYPT2/iUQhlzTG/o95Mo2WDE9QCspY5Upk7AmYEr466v+vr1tMS6g=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
	VI1PR0402MB2703.eurprd04.prod.outlook.com (10.172.255.137) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.17; Thu, 8 Aug 2019 14:50:19 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::a070:859:ccf8:3617]) by
	VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::a070:859:ccf8:3617%7]) with mapi id 15.20.2157.015;
	Thu, 8 Aug 2019 14:50:19 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>, Ard Biesheuvel
	<ard.biesheuvel@linaro.org>
Thread-Topic: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
Thread-Index: AQHVO/5l0aVU4O6KC0WgPIqEsMQCDg==
Date: Thu, 8 Aug 2019 14:50:19 +0000
Message-ID: <VI1PR0402MB34859FF5C6129DAE01B1CA0098D70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20190716221639.GA44406@gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
	<MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<b042649c-db98-9710-b063-242bdf520252@gmail.com>
	<20190720065807.GA711@sol.localdomain>
	<0d4d6387-777c-bfd3-e54a-e7244fde0096@gmail.com>
	<CAKv+Gu9UF+a1UhVU19g1XcLaEqEaAwwkSm3-2wTHEAdD-q4mLQ@mail.gmail.com>
	<MN2PR20MB2973B9C2DDC508A81AF4A207CAC40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu9C2AEbb++W=QTVWbeA_88Fo57NcOwgU5R8HBvzFwXkJw@mail.gmail.com>
	<MN2PR20MB2973C378AE5674F9E3E29445CAC60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-8n_DoauycDQS_9zzRew1rTuPaLxHyg6xhXMmqEvMaCA@mail.gmail.com>
	<MN2PR20MB2973CAE4E9CFFE1F417B2509CAC10@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-j-8-bQS2A46-Kf1KHtkoPJ5Htk8WratqzyngnVu-wpw@mail.gmail.com>
	<MN2PR20MB29739591E1A3E54E7A8A8E18CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20f4832e-e3af-e3c2-d946-13bf8c367a60@nxp.com>
	<VI1PR0402MB34856F03FCE57AB62FC2257998D40@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<MN2PR20MB2973C16264CA748F147834E9CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [82.137.9.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c380af5-71bc-4dc0-3224-08d71c0fbb76
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VI1PR0402MB2703; 
x-ms-traffictypediagnostic: VI1PR0402MB2703:
x-microsoft-antispam-prvs: <VI1PR0402MB2703903BB99EB259BA62657198D70@VI1PR0402MB2703.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(13464003)(199004)(189003)(76176011)(186003)(110136005)(81156014)(8936002)(81166006)(2906002)(55016002)(8676002)(26005)(33656002)(53936002)(4326008)(54906003)(498600001)(9686003)(5660300002)(3846002)(52536014)(91956017)(6116002)(6246003)(76116006)(64756008)(66946007)(66446008)(66476007)(66556008)(71200400001)(71190400001)(44832011)(486006)(14444005)(86362001)(99286004)(6436002)(25786009)(7736002)(305945005)(229853002)(74316002)(14454004)(53546011)(102836004)(66066001)(256004)(6506007)(446003)(7696005)(476003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2703;
	H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8DcXBqJtg5Fwo4vh260NIJPazdtask/k3U6aQDEnHsTXQMm2S50vr2zGERTg3kWZfV9ccn+k/rLzxCDEAOUe4l0YLChNoZgS0Lngbw+dlLQvQnGej/aDQDpsOdAVqNInBX8SGKtLvkYYUclETkMbaA2XWzmDJkJbWNUbRUPqFaVmJO512SEwEQJ7DueQquoJAz7CVXNsVh1+rDrvJqU5M598uphn82bd9EC1JeHwQVWG60moNqGvICQHSo6Gd6ffR1WvWm/fa0+XId8G6Qlve7tKIkw3/wChWSBtxnYIKp+AIITH4BRxPNEMxajc/6J8FakZnCpcldIQzw9Z40qxKreWxNgS+37gkGJxH/t4DtD2JYPokl9VoRNaZdxcJtzzggh6JhRFw1bA0ZO1xf4Nw30g6J/NdO8OLCs1ppBCy24=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c380af5-71bc-4dc0-3224-08d71c0fbb76
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 14:50:19.0837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1BgL0kaI4lq0qXEESiN2e0iE0223idy5xt1XdPDxbpOlaThwKVHEBQCDbZzpew5VF0GQRfiK/BleENHr1cy/tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Thu, 08 Aug 2019 14:50:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Thu, 08 Aug 2019 14:50:23 +0000 (UTC) for IP:'40.107.15.52'
	DOMAIN:'mail-eopbgr150052.outbound.protection.outlook.com'
	HELO:'EUR01-DB5-obe.outbound.protection.outlook.com'
	FROM:'horia.geanta@nxp.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.15.52
	mail-eopbgr150052.outbound.protection.outlook.com 40.107.15.52
	mail-eopbgr150052.outbound.protection.outlook.com
	<horia.geanta@nxp.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x78EoXiR021898
X-loop: dm-devel@redhat.com
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 08 Aug 2019 14:51:04 +0000 (UTC)

On 8/7/2019 11:58 PM, Pascal Van Leeuwen wrote:
>> -----Original Message-----
>> From: Horia Geanta <horia.geanta@nxp.com>
>> Sent: Wednesday, August 7, 2019 5:52 PM
>> To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>; Ard Biesheuvel
>> <ard.biesheuvel@linaro.org>
>> Cc: Milan Broz <gmazyland@gmail.com>; Herbert Xu <herbert@gondor.apana.o=
rg.au>; dm-
>> devel@redhat.com; linux-crypto@vger.kernel.org
>> Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing=
 support
>>
>> On 7/26/2019 10:59 PM, Horia Geant=E3 wrote:
>>> On 7/26/2019 1:31 PM, Pascal Van Leeuwen wrote:
>>>> Ok, find below a patch file that adds your vectors from the specificat=
ion
>>>> plus my set of additional vectors covering all CTS alignments combined
>>>> with the block sizes you desired. Please note though that these vectors
>>>> are from our in-house home-grown model so no warranties.
>>> I've checked the test vectors against caam (HW + driver).
>>>
>>> Test vectors from IEEE 1619-2007 (i.e. up to and including "XTS-AES 18")
>>> are fine.
>>>
>>> caam complains when /* Additional vectors to increase CTS coverage */
>>> section starts:
>>> alg: skcipher: xts-aes-caam encryption test failed (wrong result) on te=
st vector 9,
>> cfg=3D"in-place"
>>>
>> I've nailed this down to a caam hw limitation.
>> Except for lx2160a and ls1028a SoCs, all the (older) SoCs allow only for
>> 8-byte wide IV (sector index).
>>
> I guess it's easy to say now, but I already suspected a problem with full=
 16 =

> byte random IV's. A problem with CTS itself seemed implausible due to the=
 base
> vectors from the spec running fine and I did happen to notice that all =

> vectors from the spec only use up to the lower 40 bits of the sector numb=
er.
> While my vectors randomize all 16 bytes.
> =

> So I guess that means that 16 byte multiples (i.e. not needing CTS) with
> full 16 byte sector numbers will probably also fail on caam HW ...
> 	=

Yes, the limitation applies for all input sizes.

It's actually mentioned in the commit that added xts support few years back:
c6415a6016bf ("crypto: caam - add support for acipher xts(aes)")

    sector index - HW limitation: CAAM device supports sector index of only
    8 bytes to be used for sector index inside IV, instead of whole 16 bytes
    received on request. This represents 2 ^ 64 =3D 16,777,216 Tera of poss=
ible
    values for sector index.

> As for the tweak size, with very close scrutiny of the IEEE spec I actual=
ly
> noticed some inconsistencies:
> =

> - the text very clearly defines the tweak as 128 bit and starting from an =

> *arbitrary* non-negative integer, this is what I based my implementation =
on
> =

> - all text examples and test vectors max out at 40 bits ... just examples,
> but odd nonetheless (why 40 anyway?)
> =

> - the example code fragment in Annex C actually has the S data unit number
> input as an u64b, further commented as "64 bits" (but then loops 16 times=
 to
> convert it to a byte string ...)
> =

The input I received from our HW design team was something like:

- some P1619 drafts used LRW (instead of XTS), where the tweak "T"
was 16B-wide

- at some point P1619 drafts switched (and eventually standardized) XTS,
where "T" is no longer the tweak - "i" is the (public) tweak, "T" being
an intermediate (hidden) result in the encryption scheme

- since for XTS "i" is supposed to be the sector number,
there is no need to support 16B values - 8B being deemed sufficient

Agree, limiting "i" (XTS tweak) to 8B is out-of-spec - irrespective of the
usefulness of the full 16B.
That's why latest Freescale / NXP SoCs support 16B tweaks.

Thanks,
Horia

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
