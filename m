Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 77574A9BCE
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 09:30:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6601B2D6A23;
	Thu,  5 Sep 2019 07:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B1AA5C3FA;
	Thu,  5 Sep 2019 07:30:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0E9A24F32;
	Thu,  5 Sep 2019 07:30:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x855xWhb019827 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 01:59:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8AAD860619; Thu,  5 Sep 2019 05:59:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 711AB60610;
	Thu,  5 Sep 2019 05:59:27 +0000 (UTC)
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
	[67.219.246.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AA077FDEE;
	Thu,  5 Sep 2019 05:59:26 +0000 (UTC)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.us-east-1.aws.symcld.net id 0B/71-07443-834A07D5;
	Thu, 05 Sep 2019 05:59:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUxTZxTGee/tx4Vx56XgODQwQjM1OlvamWn
	jNlezBZmL2YZbwgzM3Uqljf1Kb9FiZOkCGQwEYUuaWegEUjeFyOciOKkRNoqQaFk3GEu0iINI
	a+lAJmxz4tpeZNt/v+c8533ec5JD4AIvT0ioLGaVSU9rRbw4jnp2ihTvcBrzpYPLGfL2ETcud
	4XqufIfv23gyesqxjB56I9qvvyTzgdI3jdYgSv42b9dGeNlL3Y9m+2ZXOG/jR/gavRKg+VDrt
	rV34MZ71KW0c+/w63IS1aiOEJAWTEITlXgrAggeOioQ2vO+NAKlxUfY3Cx93csIhB1Foc2/xy
	XFW4O9Nh8OCs6EFT9tRgN4FCXcXhkK8PYgBoM/KOe1X98CCqrXGERS/CozTAcHI9yUpi9DcFo
	ME61YvDo/hQvYiRSWXC1ZRaxTXugxv316gMJzM4vcSPMoZ6DmfaZaA9J5UHH9z9H64hKA9udS
	SzCOJUMDps9WgeKAmefB2d5Pfh/jexKhPtzIPTNB2w5HU61VnNYTgPvmSrE8j5Y7PsiuiZQvy
	CYmOjjs8YWaHl8HYvkQHielYFitnwEHK1neSxvgrKFL1dHSIWymyFeLcq0/2c6lrdC4+X7PJa
	fh6+a7uH26GYJMHx6mtOIOC3oRaVJU6g262iNViyTSsUy2QtimVgul9DHxUpJESNW0YxZLJPQ
	xxgJU6w7pC2Q6FXmLhQ+rAIjyu1F1+xByQBKITDRejKjVJ8veFppKChW04z6oKlIq2IGUCpBi
	IAsajLmCxJMqkKV5bBGGz7PJzYQ8aIkMtgctknGSOsYTSFrjaBtRK3f0YwTwy3OZlzA0Rv0Km
	EyeS3SSkVa1UX6taAnp+5FacJEEsXExAjijSqTTmP+vx9AyQQSJZL1kZR4jd689l/4csNbJJG
	aal1kFDP9ryW0Yif3pryhalwoCcQpZkx76sauJp48UB7fk37Coz+leDXHwB/fG8jbd2jnQm6J
	rmG79FyKK7Pt010fVQ55Aq7po+L+z+YfLGUlbJ3eLX24BLUXjqTdBuf5x5VkxvLB6YmuEzlzO
	7w3mjb9faezx31xZyltf22jIuOpzS+L6BQl81P67i73TQ3neHnrAP/dBafCD6Mbnhlsr9MIUy
	cFofMXLk1s3//m7e5zrtc9HUeHphfrf4i5NWYztDnfW/btSjj8vvfurTO+jd1Lb71kEJX63rG
	e7g/ldcYeu9Hdrbj+SsG63P6sEcs9edWl/euwdn1sbyY4NtTQy7YS2GadL2+8kun9c07EYdS0
	bAtuYuh/AF1+mOhlBAAA
X-Env-Sender: yehs1@lenovo.com
X-Msg-Ref: server-31.tower-386.messagelabs.com!1567663159!262067!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32628 invoked from network); 5 Sep 2019 05:59:19 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
	by server-31.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 5 Sep 2019 05:59:19 -0000
Received: from HKGWPEMAIL02.lenovo.com (unknown [10.128.3.70])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by Forcepoint Email with ESMTPS id CCA78245A2D57F704356;
	Thu,  5 Sep 2019 01:59:17 -0400 (EDT)
Received: from HKGWPEMAIL01.lenovo.com (10.128.3.69) by
	HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1591.10; Thu, 5 Sep 2019 13:59:14 +0800
Received: from HKEXEDGE01.lenovo.com (10.128.62.71) by HKGWPEMAIL01.lenovo.com
	(10.128.3.69) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1591.10 via
	Frontend Transport; Thu, 5 Sep 2019 13:58:58 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.59)
	by HKEXEDGE01.lenovo.com (10.128.62.71) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1591.10; Thu, 5 Sep 2019 13:59:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ADY+PsyYmOgtp5CC9htpORpVblim/Lammk2DBP3eVjdRRbk3Xa/wlwOOkYPzcHipo9rjKMOeWynxe2Uiq3avtGzDedY6j82pPTu1ZTvo3eKf+qmnEwrDzwWxDoktdE/LJ1PZulTHapOCpeoO23jtOZenl8VrQztmutV67em9ruehc3oawmCWOVXWuSzmV+aU6tsaguRCzw7xraJaN9SNfuhvlg44AG1nLW1A3+/FEmHlSv3otGHqJE9SD6bxAjsmdTXqXygsrcSXnXoKOaskguPEYsu/wmHV9eX9ukwd9OkuCxw54A1x1ysZSWzrjcqQb0zuM599rVbJ2cDW5Oi5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fXLN330sfxPrPyfs5XOP2RdSS1yc8fyXhM5vhVW+iok=;
	b=iW4UxHrRBoEwkU4GwJoVJAbMzMxdpxs9y3zTqjTybDNdoOyW/u1OG4Ck2dOevmyFcpUQtVjkSW7x45OGXXs2uubsREaawy71DLvtw7vF76VNT5CsNJmgmpsuG9+TETE42lV3KDzvv+UMPh8CU4R8uf6XutoRryA+bO9k0yuMxU7EdiY70paHnN8mwRNjDfAt1tPVhxYo65ORSG/V8LTvsfpucKLs0NxXjO3dAD8NI2A9jatWrZvfowdzWkk1VyvAMdJQAtizfHMt4RmzIDd2JkeAKwRiOhlKmRCHlSaa6srEBNYpxCPgHkQB+grY7j7EwsXy5lbtUP0jxuqwbr7pbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
	dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=LenovoBeijing.onmicrosoft.com;
	s=selector2-LenovoBeijing-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fXLN330sfxPrPyfs5XOP2RdSS1yc8fyXhM5vhVW+iok=;
	b=VWkjQ54TT4G6uMvrQudwpfu4eCPQEKXFNQ+uw0GSk4e6/Kw+OdkOYn0UM44jGrsdaUb4NpeM4cSS51bbUFSSM6jxad0NyVO4oAt2i3qMPVBZb7fLks8pP6OF5nLl6IzzGw6Hpg/lOyo1+qsVTbLHhsYBOmiCb82hNfLZpUenEyw=
Received: from HK2PR03MB4418.apcprd03.prod.outlook.com (10.170.158.23) by
	HK2PR03MB4500.apcprd03.prod.outlook.com (10.170.158.18) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.9; Thu, 5 Sep 2019 05:59:13 +0000
Received: from HK2PR03MB4418.apcprd03.prod.outlook.com
	([fe80::4468:743d:3683:2e4e]) by
	HK2PR03MB4418.apcprd03.prod.outlook.com
	([fe80::4468:743d:3683:2e4e%6]) with mapi id 15.20.2263.005;
	Thu, 5 Sep 2019 05:59:13 +0000
From: Huaisheng HS1 Ye <yehs1@lenovo.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Thread-Topic: [PATCH] dm writecache: skip writecache_wait for pmem mode
Thread-Index: AdVjqlO1DAKqpZZdRYW5HlV5RxhNmA==
Date: Thu, 5 Sep 2019 05:59:13 +0000
Message-ID: <HK2PR03MB4418CB96B9E7B640B8B9CFB192BB0@HK2PR03MB4418.apcprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [57.197.58.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88dfcd06-7da6-4176-5316-08d731c62dac
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:HK2PR03MB4500; 
x-ms-traffictypediagnostic: HK2PR03MB4500:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR03MB45003310BAA374FED8809EDA92BB0@HK2PR03MB4500.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39850400004)(366004)(136003)(346002)(376002)(396003)(13464003)(199004)(189003)(3846002)(256004)(7696005)(6116002)(186003)(7736002)(6246003)(8676002)(305945005)(26005)(81156014)(6506007)(102836004)(52536014)(2906002)(5660300002)(99286004)(33656002)(6916009)(25786009)(86362001)(54906003)(4326008)(53936002)(14454004)(9686003)(66446008)(64756008)(229853002)(55016002)(66066001)(76116006)(66476007)(6436002)(66556008)(316002)(66946007)(71200400001)(74316002)(71190400001)(486006)(8936002)(476003)(81166006)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HK2PR03MB4500;
	H:HK2PR03MB4418.apcprd03.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: lenovo.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XF20NJpGEyxetl2HmBkTTu/Atqh0wWObRp0DyHIc5Z/5Nuzil2S8D5MdcmNHfe3TO9b5Hq1o4MYeu5RO5IoOkfCArs91CESN+GzbDGEMLTYMi0dNNkt2iWv1MgxsvC9pUctCfYHmmEp0UkC2FLeWiEnL3WkZeLiUKPQIZebCg9GxVcwaKF8bT4FpTcMpMAGDfR0P1Iw/xBFB6cBZ4aCnGbFpzqLm0qI29ti8MpSK1OFsAKJJy/AMmLLasuguWDob4z/AuQKzCjwKqS0+MwuWJVFpeZVrPHv9dDuKt4bYcTrzhLGV/MN/jCs3kJItn8fGOX45WAaC19IgRm+rvZWg0brmO2WtTp+aPxk1fmy0/otUDweLH6C2ScDz2VSUu1DbXCQbBCpaZNcbHzpLbfn7LHvb01B6oPlUnVhXu3J+IM0=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dfcd06-7da6-4176-5316-08d731c62dac
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 05:59:13.3909 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2G0PXuLQPCYzB+iejuhumbU37c1tlt6Q/O8HTmss2zbE1790ZmMJYcg64lXMCJP/3mzplGU96j7bA5wf/SsJoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4500
X-OriginatorOrg: lenovo.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Thu, 05 Sep 2019 05:59:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Thu, 05 Sep 2019 05:59:26 +0000 (UTC) for IP:'67.219.246.5'
	DOMAIN:'mail1.bemta23.messagelabs.com'
	HELO:'mail1.bemta23.messagelabs.com' FROM:'yehs1@lenovo.com'
	RCPT:''
X-RedHat-Spam-Score: -0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,
	SPF_PASS) 67.219.246.5 mail1.bemta23.messagelabs.com 67.219.246.5
	mail1.bemta23.messagelabs.com <yehs1@lenovo.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x855xWhb019827
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 05 Sep 2019 03:30:15 -0400
Cc: "prarit@redhat.com" <prarit@redhat.com>, Huaisheng Ye <yehs2007@zoho.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Tzu ting Yu1 <tyu1@lenovo.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm writecache: skip writecache_wait for pmem
	mode
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 05 Sep 2019 07:30:43 +0000 (UTC)

> -----Original Message-----
> From: Mikulas Patocka <mpatocka@redhat.com>
> Sent: Wednesday, September 4, 2019 11:36 PM
> On Wed, 4 Sep 2019, Huaisheng HS1 Ye wrote:
> 
> >
> > Hi Mikulas,
> >
> > Thanks for your reply, I see what you mean, but I can't agree with you.
> >
> > For pmem mode, this code path (writecache_flush) is much more hot than
> > SSD mode. Because in the code, the AUTOCOMMIT_BLOCKS_PMEM has been
> > defined to 64, which means if more than 64 blocks have been inserted
> > to cache device, also called uncommitted, writecache_flush would be called.
> > Otherwise, there is a timer callback function will be called every
> > 1000 milliseconds.
> >
> > #define AUTOCOMMIT_BLOCKS_SSD		65536
> > #define AUTOCOMMIT_BLOCKS_PMEM		64
> > #define AUTOCOMMIT_MSEC			1000
> >
> > So when dm-writecache running in working mode, there are continuous
> > WRITE operations has been mapped to writecache_map, writecache_flush
> > will be used much more often than SSD mode.
> >
> > Cheers,
> > Huaisheng Ye
> 
> So, you save one instruction cache line for every 64*4096 bytes written to
> persistent memory.
> 
> If you insist on it, I can acknowledge it, but I think it is really an
> over-optimization.
> 
> Acked-By: Mikulas Patocka <mpatocka@redhat.com>
> 
> Mikulas

Thanks for your Acked-by, I have learned so much from your code.

And I have another question about the LRU.
Current code only put the last written blocks into the front of list wc->lru, READ hit doesn't affect the position of block in wc->lru.
That is to say, if a block has been written to cache device, even there would be a lot of READ operation for that block next but without WRITE hit, which still would flow to the end of wc->lru, and eventually it would be written back.

I am not sure whether this behavior disobeys LRU principle or not. But if this situation above appears, that would lead to some HOT blocks (without WRITE hit) had been written back, even READ hit many times.
Is it worth submitting patch to adjust the position of blocks when READ hit?
Just a discussion, I want to know your design idea.

Cheers,
Huaisheng Ye



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
