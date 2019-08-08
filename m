Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EC286862
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 20:02:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8477630605F0;
	Thu,  8 Aug 2019 18:02:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E75960BEC;
	Thu,  8 Aug 2019 18:02:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82D02EEFD;
	Thu,  8 Aug 2019 18:02:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x78I20oG024461 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 14:02:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60C3019C7F; Thu,  8 Aug 2019 18:02:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5850D19C69
	for <dm-devel@redhat.com>; Thu,  8 Aug 2019 18:01:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60051.outbound.protection.outlook.com [40.107.6.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43F3030EA1B6
	for <dm-devel@redhat.com>; Thu,  8 Aug 2019 18:01:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=BY3KRnEvVvpd5UgD/eHj/34roG4rY8QtrzAloP08I2Lcimw0z6iwE2CIzEZnzsIqFbFNqxLNF0k0qHmXvhg69c/mtIvbuk6nlOm6gpraPDhs9s+avWjjjuFQJCFuwVuxlM0IAkIR7MH6Z6vAyGnpFneyMERn7G96xd1mdfv0NYOHkNGkLVJYVlxuXcBNT1GP40q3ENv95olRYVQmWyYrnyfUgwqyR8Qk5CKpT9lXGCk6vvXAzoNXgjsvjcwaIK6+pYnuxdbqwfiy4SZi9j7xM8W4adp+wD6xoPMrXYda5RwtA2QdQMpeVG5cZNDjsovbtkEyElAnB8oiRDWr3bL2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=r5C9tncCs5myN4axKclR6KvBg3pfrGtLUML69yH3zwo=;
	b=L0ELHl/Di3q7mh4gdGm8vbbjX+SFgu1n87vrNPBPp2h9NxPR+4cB1RvWSqV8iL0LxWRtYhtXs7xQwCYE+I5LOOmiuiG7snwL0M1+uWZ3H7ZK5CtE5j14NNfUPnFzgYqCbQphIjMUEmPtIDawENSmgmuZ+ZiA3ChjxUnBRuWxmSXze0xd557ujT8DfEAHPTARaNeLfBEZJjrLBMumlolCUxq0TQWuvl1Hj6R7zkZXLUObTyaaoRBXWHc0t5iV010fXtf+8WBnPQNp1f2RC41ikkJk5J2szI0CExQ84jJkZUGVZ6tWQWxzR9GHr2Vv0m9jVdomDx8JG5c/odTnD9kjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=r5C9tncCs5myN4axKclR6KvBg3pfrGtLUML69yH3zwo=;
	b=hZMX+R2LANPiM0twKM/+EfkMfmUc9Hd+tXDeGfMVzvHOJ0cP0P6YWJ12hEIKrxWEAXiWvws98IS4ZFpKlZUDKQYgsqJQW5vrAcF6xP0LwQWLRt2s+XTIlA7K+lxJ8cO7xkb2qdW4kDxxQcj0trY4f7mjJPXps+foRuwJNDdfTqM=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
	VI1PR0402MB3392.eurprd04.prod.outlook.com (52.134.1.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Thu, 8 Aug 2019 18:01:49 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::a070:859:ccf8:3617]) by
	VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::a070:859:ccf8:3617%7]) with mapi id 15.20.2157.015;
	Thu, 8 Aug 2019 18:01:49 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>, Ard Biesheuvel
	<ard.biesheuvel@linaro.org>
Thread-Topic: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
Thread-Index: AQHVO/5l0aVU4O6KC0WgPIqEsMQCDg==
Date: Thu, 8 Aug 2019 18:01:49 +0000
Message-ID: <VI1PR0402MB3485689B4B65C879BC1D137398D70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
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
	<MN2PR20MB2973127E4C159A8F5CFDD0C9CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [82.137.9.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f4376e8-9ac0-4d54-2e93-08d71c2a7c4b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VI1PR0402MB3392; 
x-ms-traffictypediagnostic: VI1PR0402MB3392:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <VI1PR0402MB339226FC2D1322351380439698D70@VI1PR0402MB3392.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(199004)(189003)(4326008)(74316002)(52536014)(33656002)(5660300002)(478600001)(110136005)(6116002)(316002)(54906003)(30864003)(14454004)(99286004)(81156014)(66066001)(8676002)(7736002)(71200400001)(229853002)(81166006)(966005)(3846002)(305945005)(71190400001)(2906002)(86362001)(44832011)(186003)(476003)(53936002)(486006)(6306002)(8936002)(6436002)(55016002)(26005)(9686003)(64756008)(25786009)(446003)(6246003)(66946007)(91956017)(6506007)(14444005)(66446008)(53546011)(76116006)(76176011)(66556008)(7696005)(45080400002)(66476007)(102836004)(256004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3392;
	H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OwwW2AObu0bEdBZigQIITGqE1jYcPFpvgMBS+8PxHRfxCCG/lmS+iKBk7hYWA8CrKPDByi5DCDoIkz7eCHbQ0MdQCUtPzEPSOBREYQ1qb/bUEABVsFLYWtLtLGfOyQeBrX/oRldZkhQ272ptjzL7OqCp3nDL4QKWnExMqkng3M4I2vjnLMx9WntNAoup37SyrhWW+6kxmrglwTieDAXclWhktSe2kzLn+guNYOXlKEZ6Tv6fVRtVkTapwX7BW/Oawy01KRA28yy4fBGNjL+FGoX1WFiTpPaDqqpe2Zb5GeSIZHBfLFD7dczw7yNNNVv1apvWHEyn/kuzOcWYJc2Knnr3SgHeSCsxJq+9JrezRQuTkNYq1ZDIO8Zlr+cxCiL/do0CwT1jq0W+xi+rSI9oo43Ml5o1Q1y1VEUyfjOYqBc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4376e8-9ac0-4d54-2e93-08d71c2a7c4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 18:01:49.4041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qRAGpy/c4casTlx5Y7QU2hIQSNxuW93ploOus38xb7Ne1Ax+k1x5nggD8a/uelhY99DpuyNGFVKsRBizOXPrxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3392
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Thu, 08 Aug 2019 18:01:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 08 Aug 2019 18:01:56 +0000 (UTC) for IP:'40.107.6.51'
	DOMAIN:'mail-eopbgr60051.outbound.protection.outlook.com'
	HELO:'EUR04-DB3-obe.outbound.protection.outlook.com'
	FROM:'horia.geanta@nxp.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 40.107.6.51 mail-eopbgr60051.outbound.protection.outlook.com
	40.107.6.51 mail-eopbgr60051.outbound.protection.outlook.com
	<horia.geanta@nxp.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x78I20oG024461
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 08 Aug 2019 18:02:34 +0000 (UTC)

On 8/8/2019 4:43 PM, Pascal Van Leeuwen wrote:
> Hi Horia,
> =

> This is the best I can do on short notice w.r.t vectors with 8 byte IV.
> Format is actually equivalent to that of the XTS specification, with
> the sector number being referred to as "H".
> =

> Actually, the input keys, plaintext and IV should be the same as before,
> with the exception of the IV being truncated to 64 bits, so that should
> give you some reference regarding byte order etc.
> =

Thanks.

I've converted the test vectors and generated patch below,
which is based on a previous patch you've sent:
https://lore.kernel.org/linux-crypto/MN2PR20MB29739591E1A3E54E7A8A8E18CAC00=
@MN2PR20MB2973.namprd20.prod.outlook.com/

-- >8 --

Subject: [PATCH] crypto: testmgr - Add additional AES-XTS vectors for cover=
ing
 CTS (part II)

Add more test vectors (provided by Pascal Van Leeuwen)
for xts ciphertext stealing checking.

They are derived from the test vectors added in
commit "crypto: testmgr - Add additional AES-XTS vectors for covering CTS"
where IV / tweak was truncated to 8 bytes (and obviously
different ciphertext).

Link: https://lore.kernel.org/linux-crypto/MN2PR20MB2973127E4C159A8F5CFDD0C=
9CAD70@MN2PR20MB2973.namprd20.prod.outlook.com
Signed-off-by: Horia Geant=E3 <horia.geanta@nxp.com>
---
 crypto/testmgr.h | 310 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 309 insertions(+), 1 deletion(-)

diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 717b9fcb9bfa..453bb6473f13 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -15351,7 +15351,315 @@ static const struct cipher_testvec aes_xts_tv_tem=
plate[] =3D {
 			  "\x7b\xe3\xf6\x61\x71\xc7\xc5\xc2"
 			  "\xed\xbf\x9d\xac",
 		.len	=3D 20,
-	/* Additional vectors to increase CTS coverage */
+	/* Additional vectors to increase CTS coverage - 8B IV */
+	}, { /* 1 block + 21 bytes */
+		.key    =3D "\xa1\x34\x0e\x49\x38\xfd\x8b\xf6"
+			  "\x45\x60\x67\x07\x0f\x50\xa8\x2b"
+			  "\xa8\xf1\xfe\x7e\xf4\xf0\x47\xcd"
+			  "\xfd\x91\x78\xf9\x14\x8b\x7d\x27"
+			  "\x0e\xdc\xca\xe6\xf4\xfc\xd7\x4f"
+			  "\x19\x8c\xd0\xe6\x9e\x2f\xf8\x75"
+			  "\xb5\xe2\x48\x00\x4f\x07\xd9\xa1"
+			  "\x42\xbc\x9d\xfc\x17\x98\x00\x48",
+		.klen   =3D 64,
+		.iv     =3D "\xcb\x35\x47\x5a\x7a\x06\x28\xb9"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\x04\x52\xc8\x7f\xb0\x5a\x12\xc5"
+			  "\x96\x47\x6b\xf4\xbc\x2e\xdb\x74"
+			  "\xd2\x20\x24\x32\xe5\x84\xb6\x25"
+			  "\x4c\x2f\x96\xc7\x55\x9c\x90\x6f"
+			  "\x0e\x96\x94\x68\xf4",
+		.ctext	=3D "\x73\xfa\x69\x0b\x1c\x21\x3a\x61"
+			  "\x83\x88\x5e\x57\xe3\xf2\x79\x1f"
+			  "\x6a\x64\x79\xff\xa2\xaa\xf2\x70"
+			  "\x67\xf5\x06\xf9\x48\xb2\x96\xa4"
+			  "\xd7\xd5\x48\x26\xc9",
+		.len	=3D 37,
+	}, { /* 3 blocks + 22 bytes */
+		.key    =3D "\xf7\x87\x75\xdf\x36\x20\xe7\xcb"
+			  "\x20\x5d\x49\x96\x81\x3d\x1d\x80"
+			  "\xc7\x18\x7e\xbf\x2a\x0f\x79\xba"
+			  "\x06\xb5\x4b\x63\x03\xfb\xb8\x49"
+			  "\x93\x2d\x85\x5b\x95\x1f\x78\xea"
+			  "\x7c\x1e\xf5\x5d\x02\xc6\xec\xb0"
+			  "\xf0\xaa\x3d\x0a\x04\xe1\x67\x80"
+			  "\x2a\xbe\x4e\x73\xc9\x11\xcc\x6c",
+		.klen   =3D 64,
+		.iv     =3D "\xeb\xba\x55\x24\xfc\x8f\x25\x7c"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\x40\x75\x1b\x72\x2a\xc8\xbf\xef"
+			  "\x0c\x92\x3e\x19\xc5\x09\x07\x38"
+			  "\x4d\x87\x5c\xb8\xd6\x4f\x1a\x39"
+			  "\x8c\xee\xa5\x22\x41\x12\xe1\x22"
+			  "\xb5\x4b\xd7\xeb\x02\xfa\xaa\xf8"
+			  "\x94\x47\x04\x5d\x8a\xb5\x40\x12"
+			  "\x04\x62\x3d\xe4\x19\x8a\xeb\xb3"
+			  "\xf9\xa3\x7d\xb6\xeb\x57\xf9\xb8"
+			  "\x7f\xa8\xfa\x2d\x75\x2d",
+		.ctext	=3D "\xe6\x9e\x4b\x1b\x27\xf7\xc0\x0b"
+			  "\xf9\x39\xa6\xfa\x42\x51\x4b\x4f"
+			  "\x72\xba\xee\xbf\x3a\xe6\x97\x21"
+			  "\x64\x29\xcd\x30\xae\x38\x66\xca"
+			  "\x2b\xff\x1d\xf3\xd5\x3d\xe1\xf5"
+			  "\xa9\x8b\x7a\x3a\xda\x11\x13\x71"
+			  "\x2c\x1e\xd3\x2b\x43\x73\x53\x3b"
+			  "\x6f\xc7\xfd\xfc\x1f\x59\x9e\x99"
+			  "\x39\x90\x42\xcd\x0c\x38",
+		.len	=3D 70,
+	}, { /* 4 blocks + 23 bytes */
+		.key    =3D "\x48\x09\xab\x48\xd6\xca\x7d\xb1"
+			  "\x90\xa0\x00\xd8\x33\x8a\x20\x79"
+			  "\x7c\xbc\x0c\x0c\x5f\x41\xbc\xbc"
+			  "\x82\xaf\x41\x81\x23\x93\xcb\xc7"
+			  "\x61\x7b\x83\x13\x16\xb1\x3e\x7c"
+			  "\xcc\xae\xda\xca\x78\xc7\xab\x18"
+			  "\x69\xb6\x58\x3e\x5c\x19\x5f\xed"
+			  "\x7b\xcf\x70\xb9\x76\x00\xd8\xc9",
+		.klen   =3D 64,
+		.iv     =3D "\x2e\x20\x36\xf4\xa3\x22\x5d\xd8"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\x79\x3c\x73\x99\x65\x21\xe1\xb9"
+			  "\xa0\xfd\x22\xb2\x57\xc0\x7f\xf4"
+			  "\x7f\x97\x36\xaf\xf8\x8d\x73\xe1"
+			  "\x0d\x85\xe9\xd5\x3d\x82\xb3\x49"
+			  "\x89\x25\x30\x1f\x0d\xca\x5c\x95"
+			  "\x64\x31\x02\x17\x11\x08\x8f\x32"
+			  "\xbc\x37\x23\x4f\x03\x98\x91\x4a"
+			  "\x50\xe2\x58\xa8\x9b\x64\x09\xe0"
+			  "\xce\x99\xc9\xb0\xa8\x21\x73\xb7"
+			  "\x2d\x4b\x19\xba\x81\x83\x99\xce"
+			  "\xa0\x7a\xd0\x9f\x27\xf6\x8a",
+		.ctext	=3D "\x1a\x87\x62\x2b\x05\x09\x5e\x06"
+			  "\x94\x16\xd1\xa5\xae\xd8\x34\x86"
+			  "\x1f\x12\x80\xef\xb9\x7c\x00\x7f"
+			  "\xf8\xda\x89\xd1\x85\x0c\x0f\x79"
+			  "\x14\x96\x9a\x54\x5c\x0f\x11\xe1"
+			  "\xd8\x2b\x20\x28\xb8\xe5\x8b\x73"
+			  "\x83\x90\xb3\xc6\x1e\x00\x07\x22"
+			  "\x8b\xc8\x0c\x5a\x1d\x74\xf1\xfc"
+			  "\x31\xfd\x80\xdb\xfd\x63\xc8\xd8"
+			  "\x80\x27\xcc\xb6\x3b\x70\x58\xc2"
+			  "\xef\x52\x59\x4d\xe4\x9e\x4e",
+		.len	=3D 87,
+	}, { /* 5 blocks + 24 bytes */
+		.key    =3D "\x8c\xf4\x4c\xe5\x91\x8f\x72\xe9"
+			  "\x2f\xf8\xc0\x3c\x87\x76\x16\xa4"
+			  "\x20\xab\x66\x39\x34\x10\xd6\x91"
+			  "\xf1\x99\x2c\xf1\xd6\xc3\xda\x38"
+			  "\xed\x2a\x4c\x80\xf4\xa5\x56\x28"
+			  "\x1a\x1c\x79\x72\x6c\x93\x08\x86"
+			  "\x8f\x8a\xaa\xcd\xf1\x8c\xca\xe7"
+			  "\x0a\xe8\xee\x0c\x1c\xc2\xa8\xea",
+		.klen   =3D 64,
+		.iv     =3D "\x9a\x9e\xbc\xe4\xc9\xf3\xef\x9f"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\xc1\xde\x66\x1a\x7e\x60\xd3\x3b"
+			  "\x66\xd6\x29\x86\x99\xc6\xd7\xc8"
+			  "\x29\xbf\x00\x57\xab\x21\x06\x24"
+			  "\xd0\x92\xef\xe6\xb5\x1e\x20\xb9"
+			  "\xb7\x7b\xd7\x18\x88\xf8\xd7\xe3"
+			  "\x90\x61\xcd\x73\x2b\xa1\xb5\xc7"
+			  "\x33\xef\xb5\xf2\x45\xf6\x92\x53"
+			  "\x91\x98\xf8\x5a\x20\x75\x4c\xa8"
+			  "\xf1\xf6\x01\x26\xbc\xba\x4c\xac"
+			  "\xcb\xc2\x6d\xb6\x2c\x3c\x38\x61"
+			  "\xe3\x98\x7f\x3e\x98\xbd\xec\xce"
+			  "\xc0\xb5\x74\x23\x43\x24\x7b\x7e"
+			  "\x3f\xed\xcb\xda\x88\x67\x6f\x9a",
+		.ctext	=3D "\xe5\xb4\x02\xac\x01\x3b\xa8\x73"
+			  "\x9e\x5b\xa4\x72\x9e\x41\x85\x0f"
+			  "\x60\x13\x6b\xc5\x7e\xdd\x32\x9c"
+			  "\x2f\x95\x5e\x95\x3e\xbc\x7a\x65"
+			  "\x1c\xf6\x0d\x61\x58\x87\x1e\xff"
+			  "\x96\xb8\x01\x86\x5f\xe2\x36\x84"
+			  "\x61\xf3\x99\x2c\x06\x8d\x00\xc3"
+			  "\xef\x07\xf5\x24\xf7\x6d\xac\x11"
+			  "\x0d\x40\x1f\xe7\x94\xcd\x02\x3e"
+			  "\xd2\xd8\x67\x71\x08\xad\x8c\x71"
+			  "\xac\x21\xc7\x09\x92\x3c\x59\xd8"
+			  "\x91\xfb\x43\xf2\x2a\x67\xca\x97"
+			  "\x3c\xc3\x78\x44\xa9\x90\xd8\x4b",
+		.len	=3D 104,
+	}, { /* 8 blocks + 25 bytes */
+		.key    =3D "\x70\x18\x09\x93\x10\x3a\x0c\xa9"
+			  "\x02\x0b\x11\x10\xae\x34\x98\xdb"
+			  "\x10\xb5\xee\x8c\x49\xbc\x52\x8e"
+			  "\x4b\xf7\x0a\x36\x16\x8a\xf7\x06"
+			  "\xb5\x94\x52\x54\xb9\xc1\x4d\x20"
+			  "\xa2\xf0\x6e\x19\x7f\x67\x1e\xaa"
+			  "\x94\x6c\xee\x54\x19\xfc\x96\x95"
+			  "\x04\x85\x00\x53\x7c\x39\x5f\xeb",
+		.klen   =3D 64,
+		.iv     =3D "\x36\x87\x8f\x9d\x74\xe9\x52\xfb"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\x95\x08\xee\xfe\x87\xb2\x4f\x93"
+			  "\x01\xee\xf3\x77\x0d\xbb\xfb\x26"
+			  "\x3e\xb3\x34\x20\xee\x51\xd6\x40"
+			  "\xb1\x64\xae\xd9\xfd\x71\x8f\x93"
+			  "\xa5\x85\xff\x74\xcc\xd3\xfd\x5e"
+			  "\xc2\xfc\x49\xda\xa8\x3a\x94\x29"
+			  "\xa2\x59\x90\x34\x26\xbb\xa0\x34"
+			  "\x5d\x47\x33\xf2\xa8\x77\x90\x98"
+			  "\x8d\xfd\x38\x60\x23\x1e\x50\xa1"
+			  "\x67\x4d\x8d\x09\xe0\x7d\x30\xe3"
+			  "\xdd\x39\x91\xd4\x70\x68\xbb\x06"
+			  "\x4e\x11\xb2\x26\x0a\x85\x73\xf6"
+			  "\x37\xb6\x15\xd0\x77\xee\x43\x7b"
+			  "\x77\x13\xe9\xb9\x84\x2b\x34\xab"
+			  "\x49\xc1\x27\x91\x2e\xa3\xca\xe5"
+			  "\xa7\x79\x45\xba\x36\x97\x49\x44"
+			  "\xf7\x57\x9b\xd7\xac\xb3\xfd\x6a"
+			  "\x1c\xd1\xfc\x1c\xdf\x6f\x94\xac"
+			  "\x95\xf4\x50\x7a\xc8\xc3\x8c\x60"
+			  "\x3c",
+		.ctext	=3D "\x91\xe5\x35\xf2\x72\xcc\x15\xbb"
+			  "\x2e\xa3\x6d\x80\x25\xad\xb2\x14"
+			  "\x3e\x0e\xb8\x33\x68\xc6\xc0\x3f"
+			  "\x21\x2b\x02\xbc\x90\x97\xee\xf0"
+			  "\x72\x0b\xa9\x5e\xfc\x95\xaf\x30"
+			  "\x14\x5c\x83\xed\x97\x4f\xda\x61"
+			  "\xf3\x53\xff\x6f\xcd\x0a\xb3\xf5"
+			  "\x5f\xdd\x46\xa9\xf0\x8a\x5a\x8b"
+			  "\xeb\x99\x2a\x07\x9f\x16\x49\xa9"
+			  "\xbe\x4e\x3b\x93\xa3\xbe\x17\xa1"
+			  "\xa3\x51\x87\x49\x25\x94\x27\x8e"
+			  "\x49\x38\x7b\xfb\xe4\xaa\x6a\xb9"
+			  "\x85\xa2\x3a\xa3\x0e\x8c\x0d\x03"
+			  "\xa2\xbf\xe4\x7d\x71\x1b\x4b\x4f"
+			  "\xae\x4e\xbd\xff\x94\xee\x22\xbc"
+			  "\xb9\x47\x0e\x7c\x2c\xd4\xa8\xb5"
+			  "\xe2\xaa\xa9\xbf\xe7\xad\xdc\x69"
+			  "\xfa\x51\x95\x0b\x90\x10\x53\xcb"
+			  "\xc4\x8b\xc9\xcf\xec\x0e\xc6\xc3"
+			  "\x4f",
+		.len	=3D 153,
+	}, { /* 0 blocks + 26 bytes */
+		.key    =3D "\x5a\x38\x3f\x9c\x0c\x53\x17\x6c"
+			  "\x60\x72\x23\x26\xba\xfe\xa1\xb7"
+			  "\x03\xa8\xfe\xa0\x7c\xff\x78\x4c"
+			  "\x7d\x84\x2f\x24\x84\x77\xec\x6f"
+			  "\x88\xc8\x36\xe2\xcb\x52\x3c\xb4"
+			  "\x39\xac\x37\xfa\x41\x8b\xc4\x59"
+			  "\x24\x03\xe1\x51\xc9\x54\x7d\xb7"
+			  "\xa3\xde\x91\x44\x8d\x16\x97\x22",
+		.klen   =3D 64,
+		.iv     =3D "\xfb\x7f\x3d\x60\x26\x0a\x3a\x3d"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\xfb\x56\x97\x65\x7c\xd8\x6c\x3c"
+			  "\x5d\xd3\xea\xa6\xa4\x83\xf7\x9d"
+			  "\x9d\x89\x2c\x85\xb8\xd9\xd4\xf0"
+			  "\x1a\xad",
+		.ctext	=3D "\x76\x4f\x62\x8f\x46\x50\x93\xdc"
+			  "\xee\xb2\x92\x00\x48\x58\x0f\x0b"
+			  "\xb0\x47\xb9\x70\x1a\xa3\x81\x19"
+			  "\x34\xef",
+		.len	=3D 26,
+	}, { /* 0 blocks + 27 bytes */
+		.key    =3D "\xc0\xcf\x57\xa2\x3c\xa2\x4b\xf6"
+			  "\x5d\x36\x7b\xd7\x1d\x16\xc3\x2f"
+			  "\x50\xc6\x0a\xb2\xfd\xe8\x24\xfc"
+			  "\x33\xcf\x73\xfd\xe0\xe9\xa5\xd1"
+			  "\x98\xfc\xd6\x16\xdd\xfd\x6d\xab"
+			  "\x44\xbc\x37\x9d\xab\x5b\x1d\xf2"
+			  "\x6f\x5d\xbe\x6b\x14\x14\xc7\x74"
+			  "\xbb\x91\x24\x4b\x52\xcb\x78\x31",
+		.klen   =3D 64,
+		.iv     =3D "\x5c\xc1\x3d\xb6\xa1\x6a\x2d\x1f"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\x02\x95\x3a\xab\xac\x3b\xcd\xcd"
+			  "\x63\xc7\x4c\x7c\xe5\x75\xee\x03"
+			  "\x94\xc7\xff\xe8\xe0\xe9\x86\x2a"
+			  "\xd3\xc7\xe4",
+		.ctext	=3D "\xd5\x08\x32\x1a\x5d\x93\xbc\x62"
+			  "\xd6\x1e\xc4\x8f\x42\x12\xe3\xc1"
+			  "\x0e\xb5\x99\x0c\x6b\x64\x1c\x40"
+			  "\xe3\x0f\x4f",
+		.len	=3D 27,
+	}, { /* 0 blocks + 28 bytes */
+		.key    =3D "\x0b\x5b\x1d\xc8\xb1\x3f\x8f\xcd"
+			  "\x87\xd2\x58\x28\x36\xc6\x34\xfb"
+			  "\x04\xe8\xf1\xb7\x91\x30\xda\x75"
+			  "\x66\x4a\x72\x90\x09\x39\x02\x19"
+			  "\x62\x2d\xe9\x24\x95\x0e\x87\x43"
+			  "\x4c\xc7\x96\xe4\xc9\x31\x6a\x13"
+			  "\x16\x10\xef\x34\x9b\x98\x19\xf1"
+			  "\x8b\x14\x38\x3f\xf8\x75\xcc\x76",
+		.klen   =3D 64,
+		.iv     =3D "\x0c\x2c\x55\x2c\xda\x40\xe1\xab"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\xbe\x84\xd3\xfe\xe6\xb4\x29\x67"
+			  "\xfd\x29\x78\x41\x3d\xe9\x81\x4e"
+			  "\x3c\xf9\xf4\xf5\x3f\xd8\x0e\xcd"
+			  "\x63\x73\x65\xf3",
+		.ctext	=3D "\x5c\xa1\x21\x53\x96\xdc\xeb\x13"
+			  "\xf9\x91\x31\x8a\x65\xc6\x32\x4f"
+			  "\xea\xa6\x3e\x70\xd2\xfa\x37\xcf"
+			  "\x9b\xcb\xc3\x4a",
+		.len	=3D 28,
+	}, { /* 0 blocks + 29 bytes */
+		.key    =3D "\xdc\x4c\xdc\x20\xb1\x34\x89\xa4"
+			  "\xd0\xb6\x77\x05\xea\x0c\xcc\x68"
+			  "\xb1\xd6\xf7\xfd\xa7\x0a\x5b\x81"
+			  "\x2d\x4d\xa3\x65\xd0\xab\xa1\x02"
+			  "\x85\x4b\x33\xea\x51\x16\x50\x12"
+			  "\x3b\x25\xba\x13\xba\x7c\xbb\x3a"
+			  "\xe4\xfd\xb3\x9c\x88\x8b\xb8\x30"
+			  "\x7a\x97\xcf\x95\x5d\x69\x7b\x1d",
+		.klen   =3D 64,
+		.iv     =3D "\xe7\x69\xed\xd2\x54\x5d\x4a\x29"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\x37\x22\x11\x62\xa0\x74\x92\x62"
+			  "\x40\x4e\x2b\x0a\x8b\xab\xd8\x28"
+			  "\x8a\xd2\xeb\xa5\x8e\xe1\x42\xc8"
+			  "\x49\xef\x9a\xec\x1b",
+		.ctext	=3D "\x51\x64\x9d\x92\x46\x64\xe1\xc6"
+			  "\xb7\x38\x26\x2b\x74\x14\x24\x3d"
+			  "\xba\x17\xc4\x8f\x72\xc2\xa4\x01"
+			  "\x39\x48\x19\x74\x69",
+		.len	=3D 29,
+	}, { /* 0 blocks + 30 bytes */
+		.key    =3D "\x72\x9a\xf5\x53\x55\xdd\x0f\xef"
+			  "\xfc\x75\x6f\x03\x88\xc8\xba\x88"
+			  "\xb7\x65\x89\x5d\x03\x86\x21\x22"
+			  "\xb8\x42\x87\xd9\xa9\x83\x9e\x9c"
+			  "\xca\x28\xa1\xd2\xb6\xd0\xa6\x6c"
+			  "\xf8\x57\x42\x7c\x73\xfc\x7b\x0a"
+			  "\xbc\x3c\x57\x7b\x5a\x39\x61\x55"
+			  "\xb7\x25\xe9\xf1\xc4\xbb\x04\x28",
+		.klen   =3D 64,
+		.iv     =3D "\x8a\x38\x22\xba\xea\x5e\x1d\xa4"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\x06\xfd\xbb\xa9\x2e\x56\x05\x5f"
+			  "\xf2\xa7\x36\x76\x26\xd3\xb3\x49"
+			  "\x7c\xe2\xe3\xbe\x1f\x65\xd2\x17"
+			  "\x65\xe2\xb3\x0e\xb1\x93",
+		.ctext	=3D "\x85\x83\xe0\x8c\x0a\x4e\x68\xb1"
+			  "\xe4\x3f\x64\x03\x0b\xf8\x72\x76"
+			  "\xdd\x9e\xe0\x92\xe6\xed\x7e\xfd"
+			  "\xdd\x86\x48\xb1\x8e\x2d",
+		.len	=3D 30,
+	}, { /* 0 blocks + 31 bytes */
+		.key    =3D "\xce\x06\x45\x53\x25\x81\xd2\xb2"
+			  "\xdd\xc9\x57\xfe\xbb\xf6\x83\x07"
+			  "\x28\xd8\x2a\xff\x53\xf8\x57\xc6"
+			  "\x63\x50\xd4\x3e\x2a\x54\x37\x51"
+			  "\x07\x3b\x23\x63\x3c\x31\x57\x0d"
+			  "\xd3\x59\x20\xf2\xd0\x85\xac\xc5"
+			  "\x3f\xa1\x74\x90\x0a\x3f\xf4\x10"
+			  "\x12\xf0\x1b\x2b\xef\xcb\x86\x74",
+		.klen   =3D 64,
+		.iv     =3D "\x6d\x3e\x62\x94\x75\x43\x74\xea"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	=3D "\x6a\xe6\xa3\x66\x7e\x78\xef\x42"
+			  "\x8b\x28\x08\x24\xda\xd4\xd6\x42"
+			  "\x3d\xb6\x48\x7e\x51\xa6\x92\x65"
+			  "\x98\x86\x26\x98\x37\x42\xa5",
+		.ctext	=3D "\x84\x4b\x14\x1f\x8e\xbc\xed\xe3"
+			  "\x95\x08\x7d\x6e\x5b\x62\xf9\xbe"
+			  "\x82\x08\x5d\xa2\xfe\xac\x39\xf3"
+			  "\x05\xfa\x24\x78\xf3\x96\x6e",
+		.len	=3D 31,
+	/* Additional vectors to increase CTS coverage - 16B IV */
 	}, { /* 1 block + 21 bytes */
 		.key    =3D "\xa1\x34\x0e\x49\x38\xfd\x8b\xf6"
 			  "\x45\x60\x67\x07\x0f\x50\xa8\x2b"
-- =

2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
