Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 186D58504D
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 17:52:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EC917BDA7;
	Wed,  7 Aug 2019 15:52:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A08E5D9E1;
	Wed,  7 Aug 2019 15:52:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC54E24F30;
	Wed,  7 Aug 2019 15:52:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x77Fpux6009534 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 11:51:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CA761001925; Wed,  7 Aug 2019 15:51:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 251B810018F9
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 15:51:53 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150052.outbound.protection.outlook.com [40.107.15.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A96330B9BCB
	for <dm-devel@redhat.com>; Wed,  7 Aug 2019 15:51:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Ae85kr7arTIXH8Q19ThIAWWFPGlAzx1kp6Wvzxo444Z/gIE7wFiqLWMwiALv2Hxq6e/azb3RXClMMXDHDvtAsU/P76gWUTJPxjlzfcxX9DpoS7cdk+htWMs85vPV7xZ1Vx7zWQ9ZL62gLSzd90SGJVXPGVB2/VNbnPyGmxeYtTZcll2pmtkd16djRtqm4uT+valj5Ej3HojmC1yIgfv0gkPWf5wY2hcNRwng6GQrlaoz+FnGmZRkFMceuEu0+fvv4gii5ULQGpRkAO/yt/iAc5CDg0EzAK9kBmFuVH10cbsTiO9QSgBiTWKBfSSzToZVUS2QgUikbKImCDFDNaiwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YYuR0bQ0Qo/YQ7R1f3YUcE9+wjkgfTF65h9Zbol6suI=;
	b=LhKs76Hb6AbJPzT3N0DRAf2XfsCo6R8y1pfvuHGX5ya4mE9enOPBd4Bdn47kYHI52nxvCK3mwsonjqQYMHZh1i4NSdadKFyJsYn/SCmthVoJyTnn20cEsIW+3VxdzLJehqC0HnpKZXQz5/hoyT3U0al0vm5E3kLwi1oFw3Y3wR/xI306LMJD5x18EVIl1u7KQYCavdhJmOo2TwBWrD5rRjIpM2ucjRUZdnKOJzYrF6aInC6pABJ/DVaLu5u05STrTqEqrJ5G2lnbDawSH3DYTkGKwQj8Tz/7iFMEfz4skmsQskrM2U5eJE3kf76wHJi9Q+PNen9ZADjgg51NLB01HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YYuR0bQ0Qo/YQ7R1f3YUcE9+wjkgfTF65h9Zbol6suI=;
	b=T+1tEHYjRgnroI9XxZlRUiB7Li0bjXq54jXf8PulGSY1IzId+zA0he+ShGXhzvR+HQXT0j8pdErlZtchtqpEs9od6wVkDRQQKHXKyxX8+qnuk2FwjyQqlRRKIJit8wAZMCzXEmsmwSPCTAF1k+RAbedjhZrPxDRc5yQguAPLnH0=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
	VI1PR0402MB3680.eurprd04.prod.outlook.com (52.134.15.22) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2115.15; Wed, 7 Aug 2019 15:51:49 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::a070:859:ccf8:3617]) by
	VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::a070:859:ccf8:3617%7]) with mapi id 15.20.2157.015;
	Wed, 7 Aug 2019 15:51:49 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>, Ard Biesheuvel
	<ard.biesheuvel@linaro.org>
Thread-Topic: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
Thread-Index: AQHVTTgF/C9C4mL670qCBeVnP8mOuw==
Date: Wed, 7 Aug 2019 15:51:49 +0000
Message-ID: <VI1PR0402MB34856F03FCE57AB62FC2257998D40@VI1PR0402MB3485.eurprd04.prod.outlook.com>
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
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b14e5adb-df73-4dc8-8936-08d71b4f288d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VI1PR0402MB3680; 
x-ms-traffictypediagnostic: VI1PR0402MB3680:
x-microsoft-antispam-prvs: <VI1PR0402MB368064BBE7E05B8C05978F6A98D40@VI1PR0402MB3680.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(199004)(189003)(2906002)(99286004)(14454004)(33656002)(86362001)(55016002)(5660300002)(71190400001)(478600001)(9686003)(6436002)(229853002)(53936002)(476003)(4326008)(66066001)(110136005)(7696005)(6246003)(256004)(71200400001)(102836004)(305945005)(25786009)(3846002)(8676002)(44832011)(6506007)(8936002)(52536014)(486006)(76116006)(81166006)(81156014)(54906003)(66446008)(76176011)(186003)(91956017)(68736007)(446003)(53546011)(74316002)(7736002)(66946007)(6116002)(26005)(66556008)(64756008)(66476007)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3680;
	H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VZBD+87qqjzC+w2JOAampP9hCMn3lXSrNG7l1Ekd1Fm1FpLw83ZJKuU9/WVwS0drbeoVfk1BvAproLpKP1WLWKYx5I3KonLeH+2QtMJCbXoOUQatkoEza/YvSP02IKQlW5z1lF2xJtnGqCuHFVU2CG9++9/gL0FvNJzPQJ+Ba7TFuLRo8Lh3jKf6EApAs8Cp/yGasW+sicktBR9Gwgobku2sJzPBujlDvn0DQzqxmnMtPHWc7x78eXcOD4BSTvKq16f9LcJz1iqooC6tQUowBIQXS0w75mphqRozrj/yoYIX5fLq84DKP4L0d4WmdMpIYLd+om7f9pura6RIaSVq8K7ok5oaXc5ow18T3URQWfBrXsVNMm3iHGf9zmnnRbBOWdKBlWBRwH4T6ZLABxurfXZlZh3M2WUdz9QuRVIcdwE=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14e5adb-df73-4dc8-8936-08d71b4f288d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 15:51:49.2025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JX3kp8gOGXM3MjS2KySgN19fgMbCG3OPrT2E+5dhuV7jWFrKrGVffz8KnOjqKhRm0elu84ka7HqPzFzHHXsIhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3680
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Wed, 07 Aug 2019 15:51:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Wed, 07 Aug 2019 15:51:52 +0000 (UTC) for IP:'40.107.15.52'
	DOMAIN:'mail-eopbgr150052.outbound.protection.outlook.com'
	HELO:'EUR01-DB5-obe.outbound.protection.outlook.com'
	FROM:'horia.geanta@nxp.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.15.52
	mail-eopbgr150052.outbound.protection.outlook.com 40.107.15.52
	mail-eopbgr150052.outbound.protection.outlook.com
	<horia.geanta@nxp.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x77Fpux6009534
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 07 Aug 2019 15:52:25 +0000 (UTC)

On 7/26/2019 10:59 PM, Horia Geant=E3 wrote:
> On 7/26/2019 1:31 PM, Pascal Van Leeuwen wrote:
>> Ok, find below a patch file that adds your vectors from the specification
>> plus my set of additional vectors covering all CTS alignments combined
>> with the block sizes you desired. Please note though that these vectors
>> are from our in-house home-grown model so no warranties.
> I've checked the test vectors against caam (HW + driver).
> =

> Test vectors from IEEE 1619-2007 (i.e. up to and including "XTS-AES 18")
> are fine.
> =

> caam complains when /* Additional vectors to increase CTS coverage */
> section starts:
> alg: skcipher: xts-aes-caam encryption test failed (wrong result) on test=
 vector 9, cfg=3D"in-place"
> =

I've nailed this down to a caam hw limitation.
Except for lx2160a and ls1028a SoCs, all the (older) SoCs allow only for
8-byte wide IV (sector index).
Will follow up with 16-byte IV support for the above-mentioned SoCs.

Pascal,

Could you also generate a few test vectors covering CTS with 8-byte IV?

Thanks,
Horia

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
