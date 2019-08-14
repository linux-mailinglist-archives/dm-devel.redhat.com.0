Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEA8DFBE
	for <lists+dm-devel@lfdr.de>; Wed, 14 Aug 2019 23:27:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D858300CB6B;
	Wed, 14 Aug 2019 21:27:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93131D1F8;
	Wed, 14 Aug 2019 21:27:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD22C2551C;
	Wed, 14 Aug 2019 21:27:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ELQG5f006248 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 17:26:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A52FF7B6EF; Wed, 14 Aug 2019 21:26:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A31D5C29A;
	Wed, 14 Aug 2019 21:26:14 +0000 (UTC)
Received: from m9a0003g.houston.softwaregrp.com
	(m9a0003g.houston.softwaregrp.com [15.124.64.68])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C3663174658;
	Wed, 14 Aug 2019 21:26:08 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0003g.houston.softwaregrp.com WITH ESMTP; 
	Wed, 14 Aug 2019 21:25:40 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 14 Aug 2019 21:20:10 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 14 Aug 2019 21:20:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=jNhGL3VLNvHV/CMK3kW0K1d+ZwtRNmwVvYLRv4nDT3qRgXqyHaslKlAEkQklaEPIcRc/ddwcnp7BE7Er0ALZQwgvRvwYPs0TtCST8Av1GQtQ29vmUtHuNQGu0c1681nMN9PAxLdCrn/ub++qzde9YA68kn412CvWiav6/PsW5OGO+G9/Rr5tFQKoNAI1Ggm9FUz3fJA3cMz/WsXntc23A0TnjguiuttH6JGqFUT6CSw5ClhdCcKDWO57pJAbkvvFD2PPfXYsQMRe8k98TB7rd5OIwQRh+TsrI2Mmkpa7odsITQOqiIrk8h+bxdGxvvIdqqnmoLxx2ajyrfCtfYE4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vfS6VDXr3zjxJ1RrxRyFYFjW45C0RchHOqAq+HA2fKQ=;
	b=IvoX3RbZh94OyIm1YhlXT793P0SqkUbPBbyG1VEbWD2eugpYMrYLIjEBEH9cTcaOBvxZIzAX4qolwBiK9QWOd6CkT2ag8wbXq2T9nJ6W6+HKuuiyvKGb6zOlmO1BPM07mrONra+9cAPjK0u3aeRHjWI1d7mdjl1zGqkUi2AxE6z8fGXQ9WKD726iUumD/pN+2aEkTuyBcgd7HaJBZWQAtSi1Ev01F8zvsbj4+mqMe3k951fvibeq7OuyZZY1NJYBztMAuqhjKntq+7z9Q1QR9H2KETvXXpkV7dMmHm2dJlNhuag3sSvVbkx08AfBGF8jtIur1lWXxtokpIB4l5q4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3349.namprd18.prod.outlook.com (52.132.246.91) by
	CH2PR18MB3240.namprd18.prod.outlook.com (52.132.245.78) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2157.18; Wed, 14 Aug 2019 21:20:04 +0000
Received: from CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a]) by
	CH2PR18MB3349.namprd18.prod.outlook.com
	([fe80::8818:7a86:93d7:561a%6]) with mapi id 15.20.2157.022;
	Wed, 14 Aug 2019 21:20:04 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 09/16] tests: update pgpolicy tests to work with
	group_paths()
Thread-Index: AQHVUuYJUZ5RXbBP3066/8IzcyLwLw==
Date: Wed, 14 Aug 2019 21:20:03 +0000
Message-ID: <e7ba9fa26b9e46e4e60441579d5f0bb47d5d83a5.camel@suse.com>
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
x-ms-office365-filtering-correlation-id: 224c5656-7768-48eb-95f8-08d720fd2cb3
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CH2PR18MB3240; 
x-ms-traffictypediagnostic: CH2PR18MB3240:
x-microsoft-antispam-prvs: <CH2PR18MB324005BD516B1AD0008F552FFCAD0@CH2PR18MB3240.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(66946007)(64756008)(66476007)(81156014)(102836004)(76116006)(91956017)(99286004)(6436002)(478600001)(8676002)(4326008)(186003)(6506007)(81166006)(71200400001)(486006)(76176011)(6486002)(71190400001)(305945005)(6116002)(66446008)(2501003)(446003)(14444005)(14454004)(54906003)(316002)(86362001)(476003)(7736002)(2616005)(25786009)(8936002)(229853002)(11346002)(5660300002)(26005)(2906002)(6246003)(118296001)(256004)(3846002)(66556008)(53936002)(6512007)(66066001)(4744005)(36756003)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3240;
	H:CH2PR18MB3349.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cCqBwOEuTh8u23ND4MiKBLmTONrj1m2ftJUP/raoZWdFVNRDiFEBza5hyfAcPDYyyP+KkhF/YfME6O59LNLA3peeocECNPQoYHpVBkpNYxM+dE7Q/kN0R6ruq9L2CVzHg+HZulT+I/e8vFMtTTH4a/61H4gdVtAxQGu1mwoID2lQCxJC802kANfI4snwbJkP8MemFHg6jwan+F0h9t55FXiUOH+FJJlAFwzPtqkEjBgx3Vji521wogOmMCGHG8Iu34TwiUYUGk9zEJKSIuQZl00PmEz8b0vQzG1drpWrO73EJ6Ohe1kkEbYgLPaPVxTkw0c2Tx9XhmAGUgjRMSUxCkRIF+Rbp76A84D7WnLr1ZXONfWKwO6ntvgyrirFYPZxm9Av8A4OLLXJfjCWYghFXvXF10djqVONt7Yd7vCwQOM=
x-ms-exchange-transport-forked: True
Content-ID: <8C15F3522EFA8143B311156E619EE135@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 224c5656-7768-48eb-95f8-08d720fd2cb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 21:20:04.2947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vttDuhT6Q557pCt4iG+dxwFlUL1mPfmRUf+QzXoac9lPTt0ZNHCosDo1RyIuMVGpZJXLd9VgJw6LhHhI77i4gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3240
X-OriginatorOrg: suse.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Wed, 14 Aug 2019 21:26:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Wed, 14 Aug 2019 21:26:13 +0000 (UTC) for IP:'15.124.64.68'
	DOMAIN:'m9a0003g.houston.softwaregrp.com'
	HELO:'m9a0003g.houston.softwaregrp.com'
	FROM:'Martin.Wilck@suse.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	UNPARSEABLE_RELAY) 15.124.64.68
	m9a0003g.houston.softwaregrp.com 15.124.64.68
	m9a0003g.houston.softwaregrp.com <Martin.Wilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x7ELQG5f006248
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 14 Aug 2019 21:27:54 +0000 (UTC)

On Fri, 2019-08-02 at 11:33 -0500, Benjamin Marzinski wrote:
> The pgpolicy unit tests now work again, using group_paths().
> test_one_group0(), which was skipped with the old path grouping code
> because it failed, is now working correctly.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  tests/pgpolicy.c | 125 +++++++++++++++++++++++++++++++------------
> ----

Minor nit: The current patch order breaks the tests until this one is
applied. I'd have liked to see this patch right after 04/16.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
