Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4487727C
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jul 2019 22:01:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25560C055673;
	Fri, 26 Jul 2019 20:01:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19ADF5F9DD;
	Fri, 26 Jul 2019 20:01:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B7C018089C8;
	Fri, 26 Jul 2019 20:00:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6QJxE0m022993 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jul 2019 15:59:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0D4598BF; Fri, 26 Jul 2019 19:59:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA5865D719
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 19:59:11 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150051.outbound.protection.outlook.com [40.107.15.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1FA283F44
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 19:59:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=oOEv3cSw8IiQUdqFEAiPMiV+uqO8TL7RXlrEWYC88XiZ/uzDlyqApGy4bf1B85cmzpkeKRJ9MN5O0ACQuj0/2jUEZSy8NnN/SeSrvTd4uawhEcrumGPO5R9h1Bn9tngCJuC/jeQN6lvqn4KWkKEQqh8ZQfn0bfog2W5JA8Np0tS9vYM6kP58kXXyASvXDU9LnVEhOvCsrkUCjlCn1In2J0A3z3/b88yVQmOJIO+fQCr8Bkl7MjBzrPLEbtKRBS4ueO1wW4mWj17205rxB02s4vb2zKn2YeLD7+8y7g6bkUwVclLf8LuJHlAIuGOuNM3NdXMIoS2sKzpLYQAr7j8ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JiIgvep7GeaubFlMQppJ8tbW90L7gG+SOfeH7vxpf1Y=;
	b=Ha2dUcSKZmi75MnMPq5PG7rIEl3SOQUqXxsl/H8NCHRcqFGhIIyWtGzZ9WubK6mRT/NRBPbxkmh//jnjVB3w52uGWvMZruKpfMaM10OctUw/xZIcuX0snUIzqH7HP2SYOK7DzS4h+zYjL2WIIt9P3eK22hQUOK6ffP4/HJ47Q7G39mswAjqRONFzm/2diGWRCGrOgYk9uTUwnnG5UBzL0HfB6y5nRTtQbWGMewEFyIQOT8qB5Q1Lb3an4QGKUmUQXB0VeDRTSFMc2jSPqTbpxjfDOTOcu0NZqmvL/gsTtdfCuQ7astg3Rb12CxjyCaPu0KDM5Xf4rS4VmesxHf9I0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JiIgvep7GeaubFlMQppJ8tbW90L7gG+SOfeH7vxpf1Y=;
	b=VrFlPaid3rYcKJLbEUZWuPFpUMMCfpC3a6C+DeEzXyNBkGK6lZ/eWcDrUhdv4dfIfwT1FtKdw8UpQ4oRfCHiDvd85tzImVZG6b+fKlqFjwtpkh6gyn1GwrULeyUmer48IQmo9q1aLo4jm77ZbYQG85X54dNqJNK1Ab9bMaxHsLI=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
	VI1PR0402MB3344.eurprd04.prod.outlook.com (52.134.8.144) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2094.16; Fri, 26 Jul 2019 19:59:07 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::7c64:5296:4607:e10]) by
	VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::7c64:5296:4607:e10%5]) with mapi id 15.20.2094.017;
	Fri, 26 Jul 2019 19:59:07 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>, Ard Biesheuvel
	<ard.biesheuvel@linaro.org>
Thread-Topic: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
Thread-Index: AQHVQ+yU61whXu7FtkGXphn6NDac/g==
Date: Fri, 26 Jul 2019 19:59:07 +0000
Message-ID: <VI1PR0402MB34850A016F3228124C0D360698C00@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
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
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [79.118.237.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7039efe3-a6e8-44a4-4b47-08d71203b7fd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VI1PR0402MB3344; 
x-ms-traffictypediagnostic: VI1PR0402MB3344:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR0402MB33447B7A2B95B055D662A12B98C00@VI1PR0402MB3344.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(199004)(189003)(68736007)(486006)(186003)(76176011)(476003)(74316002)(99286004)(2906002)(81166006)(81156014)(33656002)(478600001)(446003)(6506007)(6246003)(8936002)(229853002)(66556008)(71200400001)(102836004)(53546011)(66066001)(26005)(71190400001)(44832011)(86362001)(5660300002)(4326008)(55016002)(3846002)(66446008)(316002)(9686003)(8676002)(54906003)(76116006)(256004)(966005)(110136005)(64756008)(7696005)(91956017)(53936002)(7736002)(25786009)(66946007)(305945005)(6116002)(52536014)(6436002)(66476007)(6306002)(14454004)(45080400002)(52400400003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3344;
	H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ued4tksl19cRwwCu6ykgSR/VvowrEZ3W5LJDysQEvaq95J7b9PgcTagTShXdHGncCurEg3Cr6RARx1ZHD7o0itI7hvjB+wZtXVWZfK46k0qo/SYfgmYpHr6laTDWz6SMEUWbBrerC5icPY277TB/z4/sFRA5Gt3d8MsVyAJVItNx7tvB38SupUQ/4xmNtbPPc8UR+w+Ij/We+q8/gcgcZavBjuZdh8/MOjadzLSF2zrIQaMmYs3Z/jtE+yAx/AEcga3wTGT7AR95edM7Ms9Xq2tFZUTWrru/bN0JmknxfKEXAhbWa3O+9k+4i8b0TCt+rpZiFuC+AEqj48/YBw3EVNjOp8X7sVhYOoabnbrdRNOLYb3vN1tMxVdVfrMtvONj3tujXFrB/xhSJobxRZ3RBppzgECPDVPGj7APLVZpsFQ=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7039efe3-a6e8-44a4-4b47-08d71203b7fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 19:59:07.5407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: horia.geanta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3344
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Fri, 26 Jul 2019 19:59:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 26 Jul 2019 19:59:10 +0000 (UTC) for IP:'40.107.15.51'
	DOMAIN:'mail-eopbgr150051.outbound.protection.outlook.com'
	HELO:'EUR01-DB5-obe.outbound.protection.outlook.com'
	FROM:'horia.geanta@nxp.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS, SPF_PASS) 40.107.15.51
	mail-eopbgr150051.outbound.protection.outlook.com 40.107.15.51
	mail-eopbgr150051.outbound.protection.outlook.com
	<horia.geanta@nxp.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6QJxE0m022993
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 26 Jul 2019 20:01:15 +0000 (UTC)

On 7/26/2019 1:31 PM, Pascal Van Leeuwen wrote:
> Ok, find below a patch file that adds your vectors from the specification
> plus my set of additional vectors covering all CTS alignments combined
> with the block sizes you desired. Please note though that these vectors
> are from our in-house home-grown model so no warranties.
I've checked the test vectors against caam (HW + driver).

Test vectors from IEEE 1619-2007 (i.e. up to and including "XTS-AES 18")
are fine.

caam complains when /* Additional vectors to increase CTS coverage */
section starts:
alg: skcipher: xts-aes-caam encryption test failed (wrong result) on test vector 9, cfg="in-place"

(Unfortunately it seems that testmgr lost the capability of dumping
the incorrect output.)

IMO we can't rely on test vectors if they are not taken
straight out of a spec, or cross-checked with other implementations.

Horia

> They do run fine on the inside-secure driver + HW though, and I hereby
> donate them to the public domain i.e. feel free to use them as you see fit.
> (in case Outlook 365 messed up the patch below, it's also available from
> my public Git: https://github.com/pvanleeuwen/linux-cryptodev.git,
> branch is_driver_patch2)
> 
> --
> 
> This patch adds testvectors for AES-XTS that cover data inputs that are
> not a multiple of 16 bytes and therefore require cipher text stealing
> (CTS) to be applied. Vectors were added to cover all possible alignments
> combined with various interesting (i.e. for vector implementations working
> on 3,4,5 or 8 AES blocks in parallel) lengths.
> 
> Signed-off-by: Pascal van Leeuwen <pvanleeuwen@verimatrix.com>
> ---
>  crypto/testmgr.h | 368 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 368 insertions(+)
> 
> diff --git a/crypto/testmgr.h b/crypto/testmgr.h
> index 105f2ce..1046e47 100644
> --- a/crypto/testmgr.h
> +++ b/crypto/testmgr.h
> @@ -15594,6 +15594,374 @@ struct len_range_sel {
>  			  "\xc4\xf3\x6f\xfd\xa9\xfc\xea\x70"
>  			  "\xb9\xc6\xe6\x93\xe1\x48\xc1\x51",
>  		.len	= 512,
> +	}, { /* XTS-AES 15 */
> +		.key    = "\xff\xfe\xfd\xfc\xfb\xfa\xf9\xf8"
> +			  "\xf7\xf6\xf5\xf4\xf3\xf2\xf1\xf0"
> +			  "\xbf\xbe\xbd\xbc\xbb\xba\xb9\xb8"
> +			  "\xb7\xb6\xb5\xb4\xb3\xb2\xb1\xb0",
> +		.klen   = 32,
> +		.iv     = "\x9a\x78\x56\x34\x12\x00\x00\x00"
> +			  "\x00\x00\x00\x00\x00\x00\x00\x00",
> +		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
> +			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
> +			  "\x10",
> +		.ctext	= "\x6c\x16\x25\xdb\x46\x71\x52\x2d"
> +			  "\x3d\x75\x99\x60\x1d\xe7\xca\x09"
> +			  "\xed",
> +		.len	= 17,
[...]
> +	}, { /* XTS-AES 18 */
> +		.key    = "\xff\xfe\xfd\xfc\xfb\xfa\xf9\xf8"
> +			  "\xf7\xf6\xf5\xf4\xf3\xf2\xf1\xf0"
> +			  "\xbf\xbe\xbd\xbc\xbb\xba\xb9\xb8"
> +			  "\xb7\xb6\xb5\xb4\xb3\xb2\xb1\xb0",
> +		.klen   = 32,
> +		.iv     = "\x9a\x78\x56\x34\x12\x00\x00\x00"
> +			  "\x00\x00\x00\x00\x00\x00\x00\x00",
> +		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
> +			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
> +			  "\x10\x11\x12\x13",
> +		.ctext	= "\x9d\x84\xc8\x13\xf7\x19\xaa\x2c"
> +			  "\x7b\xe3\xf6\x61\x71\xc7\xc5\xc2"
> +			  "\xed\xbf\x9d\xac",
> +		.len	= 20,
> +	/* Additional vectors to increase CTS coverage */
> +	}, { /* 1 block + 21 bytes */
> +		.key    = "\xa1\x34\x0e\x49\x38\xfd\x8b\xf6"
> +			  "\x45\x60\x67\x07\x0f\x50\xa8\x2b"
> +			  "\xa8\xf1\xfe\x7e\xf4\xf0\x47\xcd"
> +			  "\xfd\x91\x78\xf9\x14\x8b\x7d\x27"
> +			  "\x0e\xdc\xca\xe6\xf4\xfc\xd7\x4f"
> +			  "\x19\x8c\xd0\xe6\x9e\x2f\xf8\x75"
> +			  "\xb5\xe2\x48\x00\x4f\x07\xd9\xa1"
> +			  "\x42\xbc\x9d\xfc\x17\x98\x00\x48",
> +		.klen   = 64,
> +		.iv     = "\xcb\x35\x47\x5a\x7a\x06\x28\xb9"
> +			  "\x80\xf5\xa7\xe6\x8a\x23\x42\xf8",
> +		.ptext	= "\x04\x52\xc8\x7f\xb0\x5a\x12\xc5"
> +			  "\x96\x47\x6b\xf4\xbc\x2e\xdb\x74"
> +			  "\xd2\x20\x24\x32\xe5\x84\xb6\x25"
> +			  "\x4c\x2f\x96\xc7\x55\x9c\x90\x6f"
> +			  "\x0e\x96\x94\x68\xf4",
> +		.ctext	= "\x6a\x2d\x57\xb8\x72\x49\x10\x6b"
> +			  "\x5b\x5a\xc9\x92\xab\x59\x79\x36"
> +			  "\x7a\x01\x95\xf7\xdd\xcb\x3f\xbf"
> +			  "\xb2\xe3\x7e\x35\xe3\x11\x04\x68"
> +			  "\x28\xc3\x70\x6a\xe1",
> +		.len	= 37,
> +	}, { /* 3 blocks + 22 bytes */
[...]

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
