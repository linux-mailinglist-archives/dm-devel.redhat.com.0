Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 637F28E018
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:44:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B7EF302C061;
	Wed, 14 Aug 2019 21:44:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11059900BA;
	Wed, 14 Aug 2019 21:44:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C64F18089C8;
	Wed, 14 Aug 2019 21:44:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELi2lI006858 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:44:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC50810001B8; Wed, 14 Aug 2019 21:44:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A2F10016EB;
	Wed, 14 Aug 2019 21:44:00 +0000 (UTC)
Received: from m4a0041g.houston.softwaregrp.com
	(m4a0041g.houston.softwaregrp.com [15.124.2.87])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C0A0309BF1B;
	Wed, 14 Aug 2019 21:43:57 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
	m4a0041g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:43:43 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:41:18 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:41:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jpVSLbB8M7aKyHopW4tuEdQ2liiMz/tLcy+QBcNd5yGba2UOP59nadrzteNC9xjzVAUrMeQ56efN+pURbc3xKdlI6ekJRkUQbuBHJ7cqT6DuAv0131LgCTTiZjuIQ1c5bu5Kd5XtJh8mznlI3MA02C1TEoBGKZ4f2bP/ThzL3HKTP3vLAv0CFhudNjHAcmcapKvDAyr8xniD0cMw3Nm4k/14xBBOtTOMvW1KRkZOfpkJsynt8Bg2FL4DFWtcJYav+chkaB0ejewQVIJRu0sgOJaoV9gPogFy5B7wXsvRO7A7Ur01DwPoiRkVHbVNcckXaOb3mTWPS+A+F/WVs77/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dxTcl+LBIL929XPQdQVSeSWajNQJVV8NjH9FVQxIBUM=;
	b=cmd8zrLGZpybR3lGs7PkuE9xPq8SpwfY/pOYc1R57jHWAwtBl/3D0ed0RpibdOwqheIem2ILDBt4Boanol6u2q0KQvq5gPLAWgPaYu9TdbPCUuzYdZJd6DV3pt5lzDMWUjgTdmcKu7lk4E8xcJ2OBUfVvfsUbsNLJjbUcLMpVC/PmQom6Bg8+mNFAPLvTOUp4Cl+YHwML2fmK199dLUxgyy2YdFx6+afulfuOUT1VdQyYBBU1kE+c4KjlyZgLlmz66opGXlNFJmDOGTsyPyuFM/QuiXUhZM+cIfpXouBAdubh8zAKuSl9opj0iWe6Zla628hskcmdb6Jor9bBlgNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3222.namprd18.prod.outlook.com (52.132.245.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:41:17 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:41:17 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 09/16] tests: update pgpolicy tests to work with
	group_paths()
Thread-Index: AQHVUukOUZ5RXbBP3066/8IzcyLwLw==
Date: Wed, 14 Aug 2019 21:41:17 +0000
Message-ID: <91e64a10f187277f57ca57a2e9c63413ea2f1c77.camel@suse.com>
References: <1564763622-31752-1-git-send-email-bmarzins@redhat.com>
	<1564763622-31752-10-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1564763622-31752-10-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Martin.Wilck@suse.com; 
x-originating-ip: [94.218.227.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab3799a1-c213-48e7-3e82-08d7210023ba
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3222; 
x-ms-traffictypediagnostic: CH2PR18MB3222:
x-microsoft-antispam-prvs: <CH2PR18MB3222AAFD51192EA2C26C76E2FCAD0@CH2PR18MB3222.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(199004)(189003)(26005)(6506007)(8936002)(478600001)(8676002)(6512007)(102836004)(6486002)(316002)(14454004)(4326008)(99286004)(54906003)(110136005)(2501003)(86362001)(81156014)(5660300002)(76176011)(81166006)(486006)(11346002)(118296001)(7736002)(305945005)(2616005)(91956017)(66066001)(25786009)(256004)(4744005)(6116002)(71200400001)(186003)(53936002)(2906002)(476003)(36756003)(64756008)(66446008)(66476007)(66556008)(6436002)(6246003)(66946007)(229853002)(3846002)(446003)(76116006)(71190400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3222;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nOxodEiKLDJlLwOjy9njwPBfWyY+7a1kkxSxsACid/T5e3brCpCSbSB0pNX1Lfp/mrl6OphR18l16UCggESuVBR2JPzlFC8RyYC5vUfUIa2qoEgX/93vtK1q5filL0ZcTz53xOlFwLMTN1Ct0g+kbM3OyvTca5TNcuNE/L6I6AXI493vuBfrPglScV4wCRX+fkbNQ1N+OKRF3vFW8/2F6JrkPHGFbHweKCvvtX9VV9nqKK3CiFJEjef93Paz69lxa+g/WechHbI53a0v24J3hkJN8krK3BHtMKOmZGc3/rSegHjozwYMxI2LXMb3Oil9ewPSDXXbmkku6fNJ4nkktWXy1Df5EaW2l6qYmmtv189P33c+KvDxSHllS0CUebI5QLpNbbK0/H3oNoBXsWTB98UVD0ocQLGNgDJPM7wNZiQ=
x-ms-exchange-transport-forked: True
Content-ID: <3A1EBCD32C27EB4EBB2D9479780CAB3F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3799a1-c213-48e7-3e82-08d7210023ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:41:17.7390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TkWYqjjuABE2wfFSOxUcN3F2gjy23GpxQX3RQ4AHEcPq9I00XLkDaw/CYMCH5YDgvywJnjq8hOfGecEmkne9rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3222
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Wed, 14 Aug 2019 21:43:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Wed, 14 Aug 2019 21:43:59 +0000 (UTC) for IP:'15.124.2.87'
	DOMAIN:'m4a0041g.houston.softwaregrp.com'
	HELO:'m4a0041g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.2.87
	m4a0041g.houston.softwaregrp.com 15.124.2.87
	m4a0041g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELi2lI006858
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mkumar@redhat.com" <mkumar@redhat.com>
Subject: Re: [dm-devel] [PATCH 09/16] tests: update pgpolicy tests to work
 with group_paths()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 14 Aug 2019 21:44:28 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> The pgpolicy unit tests now work again, using group_paths().
> test_one_group0(), which was skipped with the old path grouping code
> because it failed, is now working correctly.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>

Reviewed-by: Martin Wilck <mwilck@suse.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
