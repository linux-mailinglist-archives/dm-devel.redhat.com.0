Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 832C287356
	for <lists+dm-devel@lfdr.de>; Fri,  9 Aug 2019 09:44:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC9E4D47B1;
	Fri,  9 Aug 2019 07:44:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A0C35C21A;
	Fri,  9 Aug 2019 07:44:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 043FA2551D;
	Fri,  9 Aug 2019 07:44:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x797iSNp005859 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 03:44:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 06DF052FCE; Fri,  9 Aug 2019 07:44:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECF2E5EE1D
	for <dm-devel@redhat.com>; Fri,  9 Aug 2019 07:44:24 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 568B63069609
	for <dm-devel@redhat.com>; Fri,  9 Aug 2019 07:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VNhxpVRu6Tygv+cjYZnfUAuaM/HumANV9fTqWPPXbrQjIDmzCJhdKwD+dqcGLiFOj+cXAD7xDOStLxyodqPoCqTb4YIg1OEK8si0tZVtLJGv8dCHVqvRXxOopxidvig5+UdE6BnGnYDEuudVZC4Y6b2idpGKYMrJUE822gWNszt+ih735Cu2rPRLhPZWS7jD9QXCQisn1t0h4mh+nsw26hX3/30aVp25l3UPGh46G3Al4BdAzV6/KpMPGDkXtzU9gqWK5GS7SE+Zv/54MyhIv3d81Hke6RokNSNZyAlios1iD+I0lUEE1BAeY3Bpue1zH0XRPIc4GG945dn2A/x39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TejtegoLuEy0HNXcTHoVu1dk03K686SpcV5ScJuhLAM=;
	b=NaM0ox0P6SsHkxTQlhhYgGiA/p8cAXqqR6cedfksdlD4ZysP08QVBHI2eyrJNFmv4KxaznJa8sNBXUR3Oy4ZGT9nfOdsvHQvWP7G29K/Mq7tK4ePJjfCLOpXshSNFxPhjJ0kUfkl6bA/O/5Z4uSdQV28UHM814koJASzvQyFCf+mAW90GzlcPCo8elGywE8TDyfAiANdZGMpyNi8SZdtDKULpJUAl0OopDT2yQqsCQ2DxBzqxtYyq+ZPZSWnW8D+6LaWEHWwezIwE/hJElA8EImpXd0sJ2rdcA0VeUZ+Q3AEZdurMEEZ586i5CSTedI4fJeTP7wYA3qijJE7y47TSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TejtegoLuEy0HNXcTHoVu1dk03K686SpcV5ScJuhLAM=;
	b=VTIBBCDXCkTWdOVvgKpaUtXJKIyzw3LRo/qqrQsgYk2Wu7e943FQ+m1JtfGJ/cXm25/wiP2oS0QIYMBhrt9Rq03JFbTJe2SyPzQuJoX14Lgzjf30xK/a+DYMmxVFCAzOgT8b0fjUJgkyIYLc7tGEoUl6mSkKuxuGUCBoJsIlKCk=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
	VI1PR0402MB2718.eurprd04.prod.outlook.com (10.175.21.143) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.15; Fri, 9 Aug 2019 07:44:19 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::a070:859:ccf8:3617]) by
	VI1PR0402MB3485.eurprd04.prod.outlook.com
	([fe80::a070:859:ccf8:3617%7]) with mapi id 15.20.2157.015;
	Fri, 9 Aug 2019 07:44:19 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Herbert Xu
	<herbert@gondor.apana.org.au>
Thread-Topic: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
Thread-Index: AQHVO/5l0aVU4O6KC0WgPIqEsMQCDg==
Date: Fri, 9 Aug 2019 07:44:19 +0000
Message-ID: <VI1PR0402MB3485F94AECC495F133F6B3D798D60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <CAKv+Gu9C2AEbb++W=QTVWbeA_88Fo57NcOwgU5R8HBvzFwXkJw@mail.gmail.com>
	<MN2PR20MB2973C378AE5674F9E3E29445CAC60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-8n_DoauycDQS_9zzRew1rTuPaLxHyg6xhXMmqEvMaCA@mail.gmail.com>
	<MN2PR20MB2973CAE4E9CFFE1F417B2509CAC10@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-j-8-bQS2A46-Kf1KHtkoPJ5Htk8WratqzyngnVu-wpw@mail.gmail.com>
	<MN2PR20MB29739591E1A3E54E7A8A8E18CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20f4832e-e3af-e3c2-d946-13bf8c367a60@nxp.com>
	<VI1PR0402MB34856F03FCE57AB62FC2257998D40@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<MN2PR20MB2973127E4C159A8F5CFDD0C9CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
	<VI1PR0402MB3485689B4B65C879BC1D137398D70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190809024821.GA7186@gondor.apana.org.au>
	<CAKv+Gu9hk=PGpsAWWOU61VrA3mVQd10LudA1qg0LbiX7DG9RjA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cf79cac-4fda-4dfe-ff35-08d71c9d634a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VI1PR0402MB2718; 
x-ms-traffictypediagnostic: VI1PR0402MB2718:
x-microsoft-antispam-prvs: <VI1PR0402MB271849AF7ED002DA258713A798D60@VI1PR0402MB2718.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(199004)(189003)(8676002)(66556008)(76116006)(66446008)(66946007)(8936002)(14454004)(74316002)(5660300002)(66476007)(91956017)(64756008)(3846002)(66066001)(6116002)(186003)(7736002)(478600001)(86362001)(6506007)(53546011)(44832011)(110136005)(316002)(446003)(25786009)(476003)(52536014)(486006)(26005)(53936002)(229853002)(256004)(6436002)(9686003)(81156014)(2906002)(81166006)(4326008)(305945005)(6246003)(99286004)(55016002)(54906003)(71190400001)(71200400001)(102836004)(7696005)(33656002)(14444005)(76176011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB2718;
	H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7UomAyfP9Oah7jwr2CiHM5332KEUShYw3O2lGrxI4Fpd6FxzdDSziBFuuyNMo4z2Yv/g/n6MB/zoARDsXx75Ekitnt4SBKcTthMdPULlfi5EzErOR/mpFAQqCLHRL/dFphqKO7Lcew6W2RYLIMI97kBsH7P8eJrvEpL/EdU7DfMob2/BGj/nkPZM55skD46pGLiH8sb3c7bfjTilUvOuip88G14TXIuSCwApY3TaDFNeNo6XQoPyJxz4IQArKMpEZJte25inusS5rUOfGy6OTsQJ1SaFoGiU2Mr7yDDXbgmXe5TYGP2SQYd8GNh7uU7Oxgll0qtxLFTX5T76bFKorp5IflJaBUaqkUquImuwO6zIAt71zWKXW+Dei2NSIYKyMibDFQ1KVKO3DWu1Y1FfYrF4E5VgLVTzHsP1hFkTjXw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf79cac-4fda-4dfe-ff35-08d71c9d634a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 07:44:19.6487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HdNPswYI6IVXW2eGafiQOW5dajuFLm+1ENdT9r3kPSuj6Q/7dvKsToqCmzV6QlaVSab6JYWbIsL30HBQFQvZgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2718
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Fri, 09 Aug 2019 07:44:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 09 Aug 2019 07:44:23 +0000 (UTC) for IP:'40.107.7.47'
	DOMAIN:'mail-eopbgr70047.outbound.protection.outlook.com'
	HELO:'EUR04-HE1-obe.outbound.protection.outlook.com'
	FROM:'horia.geanta@nxp.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 40.107.7.47 mail-eopbgr70047.outbound.protection.outlook.com
	40.107.7.47 mail-eopbgr70047.outbound.protection.outlook.com
	<horia.geanta@nxp.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x797iSNp005859
X-loop: dm-devel@redhat.com
Cc: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	Milan Broz <gmazyland@gmail.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 09 Aug 2019 07:44:50 +0000 (UTC)

On 8/9/2019 9:45 AM, Ard Biesheuvel wrote:
> On Fri, 9 Aug 2019 at 05:48, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>>
>> On Thu, Aug 08, 2019 at 06:01:49PM +0000, Horia Geanta wrote:
>>>
>>> -- >8 --
>>>
>>> Subject: [PATCH] crypto: testmgr - Add additional AES-XTS vectors for covering
>>>  CTS (part II)
>>
>> Patchwork doesn't like it when you do this and it'll discard
>> your patch.  To make it into patchwork you need to put the new
>> Subject in the email headers.
>>
> 
> IMO, pretending that your XTS implementation is compliant by only
I've never said that.
Some parts are compliant, some are not.

> providing test vectors with the last 8 bytes of IV cleared is not the
> right fix for this issue. If you want to be compliant, you will need
It's not a fix.
It's adding test vectors which are not provided in the P1619 standard,
where "data unit sequence number" is at most 5B.

> to provide a s/w fallback for these cases.
> 
Yes, the plan is to:

-add 16B IV support for caam versions supporting it - caam Era 9+,
currently deployed in lx2160a and ls108a

-remove current 8B IV support and add s/w fallback for affected caam versions
I'd assume this could be done dynamically, i.e. depending on IV provided
in the crypto request to use either the caam engine or s/w fallback.

Horia

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
