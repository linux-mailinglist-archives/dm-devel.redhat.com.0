Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B7B653B
	for <lists+dm-devel@lfdr.de>; Wed, 18 Sep 2019 15:58:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A135806A2;
	Wed, 18 Sep 2019 13:58:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1099A5D6B2;
	Wed, 18 Sep 2019 13:58:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8745A4EA65;
	Wed, 18 Sep 2019 13:58:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8ICmZio024060 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Sep 2019 08:48:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7FA805C290; Wed, 18 Sep 2019 12:48:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3364F5C219;
	Wed, 18 Sep 2019 12:48:25 +0000 (UTC)
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
	[67.219.246.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDFFE3084032;
	Wed, 18 Sep 2019 12:48:24 +0000 (UTC)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.us-east-1.aws.symcld.net id 35/79-31668-897228D5;
	Wed, 18 Sep 2019 12:48:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSf0wTZxjmu7teT9abR8H0sxHiOsCItGt1bt2
	POHULq4bFzZCIINOr3OiNtpBeEXDOQBdZI5uyWOsKFImZc0GHFBiQocMwa+IPxKFSkLiKssVS
	VlEUnETcHadu++fL87zP873P88dLoPKLuJJgSuyMzUqbVXg0Zro9TKoPLHLkaH+YTNYfP3cG1
	Z+M1Ej0l3+uxfXfOK8i+sjDr6X6Ct8DoD/hd6IrpYY7v1zFDRPNCYbe4Iz0QzRLwlqNBSVbJK
	Ya/wReeAorabrxRFIGOrDdIJqQU7sQGHaGeTKHJz4Av/fkiYITgaHxC0AggDqMQmdPMyKSMxh
	0OVtxkTQBWPloAgj/MaoThaGjb4n/qxDY9+ctIJIggBU3e3DBhVOL4dmxflTAcTzuqx2TCCaU
	OorAx/eGZ02x1AbY8NgtEU2ZMDDQhYn4TehytPFFCD4uCTq61giQpDbB8XC2mHUMwPbGbxHBP
	ofKhg9+DEoFDKh46L4ZnJ2jlAJ63dWz6yFFwe9O9KIingdDt2Ykwk5ArYeR1o/FsQoORqYwEc
	fDvoOVQLBA6gPocy8WYiE1COAfl71PPSnw+JUjuOhJhDPdpeI4H4YDvqepybC9vxepAtrq/xQ
	ScQqsK5tGRPwSdFUOSwVMUjHwrGcEqwdYA3jNaGPzTHYLzZrVOq1WrdMtVfPvcq2G3q42aoo4
	NUNzdrVOQxdzGq7UstWcq7Ey9mbAH1VuYZS7A+z1hzXdYD6BqOaRG4PlOfIXjQW5pSaaM222F
	ZkZrhssIAgVJC+pHDnyGBuTx5R8wpr503wmQ0KmiiO/epmXSa6QtnBsniidA8uIqpD3EEqc9h
	4+hMoxa4GVUSrItCTeSglWU5H1+aJnZ94H4pWxJIiKipLLChmbhbX/Xx8FCgKoYkmFsEXGWu3
	P80b5KghfZUVmuVDFTv8rKcuQbYFTf/loWeLeodc3HZlJvX6t84v+yeVF0fqhrHdagj37Lm4e
	qH/v2KOV7D7myY3Q+SWON9AV2ZFUl2VJ8Qs1mtVhRWB/cO6yC6kDt2uqf3r14ZriiI5y5pe7g
	ymZfyc3JtR3MYa2rA3hja4tI34rtjrjfPp4Yoc6fbrtzlbZ3YrJtP58/8jbd+Oif1OMtNa+yw
	7uXHjp3mllc5Jyx+6GsV/D75vY3zMCschH2xfUpat2JtWu61rk9ayd0nkS0qQtuf42pftKg7+
	xrqT35Ppro5658U1Te1Zlf0455tcf6ETaq7+UYZkL5eH7McZd09e3KboNq7BP8fuGHfvZlqGl
	GWtf+UyFcSZal4LaOPofb2uHU2EEAAA=
X-Env-Sender: yehs1@lenovo.com
X-Msg-Ref: server-7.tower-386.messagelabs.com!1568810903!116787!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24455 invoked from network); 18 Sep 2019 12:48:23 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
	by server-7.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 18 Sep 2019 12:48:23 -0000
Received: from USMAILCH03.lenovo.com (unknown [10.62.32.7])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by Forcepoint Email with ESMTPS id 4F6293BEF36486DF5E76;
	Wed, 18 Sep 2019 08:48:23 -0400 (EDT)
Received: from va32wusexedge02.lenovo.com (10.62.123.117) by
	USMAILCH03.lenovo.com (10.62.32.7) with Microsoft SMTP Server (TLS) id
	14.3.408.0; Wed, 18 Sep 2019 05:48:23 -0700
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.52)
	by va32wusexedge02.lenovo.com (10.62.123.117) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1591.10; Wed, 18 Sep 2019 20:48:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=iAoboDiKuBJtIDp9E2Z/VUkVtsQnI8Ryu6dCmgcaVr89VAZS1esuKPc2UG1D2/c+Xc4io/5OjHjD6hMqgZSOQ0Fh1MN4ZcVVWVKcLXdczTKpCkOE3Mm59RVBTz7rLgcOna6w9ZBNrUM1I1TOQvXEskUGcr295uoNxz1vqsqy0MozlWqYMsdTiKxNsxFu5DkMesxSNjix2/Suht+owlpTnGQyK7pTBr+VQ3p2Q+taH4BW9pSs9NmLimp2e51/XEnoP+vtvHjCagsZZX14mZAc1Nk5whb5NpIBDfdGkethbIcfeNL/hEeUdDptf+K3/9wvsS6X8Gdht5IIlAEuat9/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LXuDFi4rhuFhXw9SVhKWRG+6V/3LDp1HQXzPjkQL5W8=;
	b=MpN5ajntCb1acJSvLfzrPgPSdld7gYuTkQjBo91eN6GC5Vk7QQGqyhd2rvyYIMFDdzllBCjW5A7EJ4/8C244HeE7oDrdSUKaLxeN/2QhgpqteSgyFEhqzG4MN5b15zcLEdBBHgN8JJI/kdWsUd7UsH5sNazFS6wurpkhSkQ8Es353YUFQYsIgJl5DAjF1JgCC6T8LYwYXymbv7rvJ4nl2ho34d+NaddYcaqS/3aEee6JvUvjule/Kmo0gPLlIb5fy/tFrU/+DBySBt4fSQPxcRiRJYRbKzC0gm28vvDFedwhwPEF5o0jdDpfaaD5kUnYCCyPBEn1u4dkwhmifbFoOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
	dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=LenovoBeijing.onmicrosoft.com;
	s=selector2-LenovoBeijing-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LXuDFi4rhuFhXw9SVhKWRG+6V/3LDp1HQXzPjkQL5W8=;
	b=W32/Fg6oJe1wHpVnQkUKLG8sGv4O+IIwXXUlCJNa0TmEDDKyiH+4pDL7HwG/108KHrrG8oX+tlM7GSjFsZJCXOrdxzvO44QlCmOI/ljF5Acyadx2IBbjaAbWydmHAP3eS1tu1bQSKy4jf5Z3lcIAjYFUuYKcMmFMs0T6R+6OTFs=
Received: from HK2PR03MB4418.apcprd03.prod.outlook.com (10.170.158.23) by
	HK2PR03MB4339.apcprd03.prod.outlook.com (10.170.158.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2284.13; Wed, 18 Sep 2019 12:48:20 +0000
Received: from HK2PR03MB4418.apcprd03.prod.outlook.com
	([fe80::4468:743d:3683:2e4e]) by
	HK2PR03MB4418.apcprd03.prod.outlook.com
	([fe80::4468:743d:3683:2e4e%6]) with mapi id 15.20.2284.009;
	Wed, 18 Sep 2019 12:48:20 +0000
From: Huaisheng HS1 Ye <yehs1@lenovo.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Thread-Topic: [External] Re: [PATCH] dm writecache: skip writecache_wait for
	pmem mode
Thread-Index: AdVjqlO1DAKqpZZdRYW5HlV5RxhNmAKYNX0AAAT/M6A=
Date: Wed, 18 Sep 2019 12:48:19 +0000
Message-ID: <HK2PR03MB44187A842A32DDE799E33088928E0@HK2PR03MB4418.apcprd03.prod.outlook.com>
References: <HK2PR03MB4418CB96B9E7B640B8B9CFB192BB0@HK2PR03MB4418.apcprd03.prod.outlook.com>
	<alpine.LRH.2.02.1909180621001.29703@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.1909180621001.29703@file01.intranet.prod.int.rdu2.redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.243.154.181]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc326992-e43b-47f0-541f-08d73c367be1
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:HK2PR03MB4339; 
x-ms-traffictypediagnostic: HK2PR03MB4339:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR03MB433946666717917956C4C89D928E0@HK2PR03MB4339.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39860400002)(13464003)(199004)(189003)(102836004)(4744005)(66946007)(66446008)(64756008)(66476007)(8676002)(52536014)(14454004)(33656002)(256004)(4326008)(8936002)(486006)(25786009)(478600001)(86362001)(81156014)(81166006)(446003)(9686003)(7696005)(55016002)(66066001)(74316002)(2906002)(71190400001)(99286004)(11346002)(6436002)(476003)(305945005)(71200400001)(7736002)(66556008)(186003)(5660300002)(76176011)(26005)(6116002)(6246003)(229853002)(316002)(3846002)(76116006)(54906003)(6916009)(6506007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HK2PR03MB4339;
	H:HK2PR03MB4418.apcprd03.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: lenovo.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: INniPVAJzVMIDCmw8kBA5IrVbzTr0/hOOG77bI6Swef0/b31I1+ffFjYzJz2F5cclyZ0Y401r/Zol88v15xbJnRMEbj5FLsusSgbqChWgZQEQ2tqepCrE+g/UxTiD2uYTyqXf2dD+VLXViUyTsbBT7VuBHA2vIFc7iRJJxBQwtkKwHoOldXJewQnOparBb2xHiiZH7Q1Jw/mQOKz9Jy3MTKOAQJv5L6HHFueK7GRbvjXhciiAIpyRhBcMAamU8xDjvvaM1n1Yaje+Q881HanVDY6EOzCgbRg/0zJnu5SAciyPGhGLmDk5A7H4TNp5I/4b+bTVjGqqIrQi52M7xoZH3nU9Na08DIsstnKGGUVDQX4tznE9T60W3d6jh/b7W4HvxYTccB2oOcGByaWpV6GScMG3CoL7ru3R2nznMM0iPw=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fc326992-e43b-47f0-541f-08d73c367be1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 12:48:19.9260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WV+30dkcMcP+YUaswpiEJrwN5O8kV5nnaLBKtAvnlkF3ldL/pXEZJp9616TkisD8w1B9fZWDLcoiteBwvXdvnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4339
X-OriginatorOrg: lenovo.com
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Wed, 18 Sep 2019 12:48:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 18 Sep 2019 12:48:25 +0000 (UTC) for IP:'67.219.246.212'
	DOMAIN:'mail1.bemta23.messagelabs.com'
	HELO:'mail1.bemta23.messagelabs.com' FROM:'yehs1@lenovo.com'
	RCPT:''
X-RedHat-Spam-Score: -0.003  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_PASS,
	SPF_PASS) 67.219.246.212 mail1.bemta23.messagelabs.com 67.219.246.212
	mail1.bemta23.messagelabs.com <yehs1@lenovo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8ICmZio024060
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 18 Sep 2019 09:58:09 -0400
Cc: "prarit@redhat.com" <prarit@redhat.com>, Huaisheng Ye <yehs2007@zoho.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Tzu ting Yu1 <tyu1@lenovo.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [External] Re: [PATCH] dm writecache: skip
 writecache_wait for pmem mode
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 18 Sep 2019 13:58:53 +0000 (UTC)

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IE1pa3VsYXMgUGF0b2NrYSA8bXBh
dG9ja2FAcmVkaGF0LmNvbT4KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxOCwgMjAxOSA2
OjI0IFBNCj4gVGhlIGRtLXdyaXRlY2FjaGUgdGFyZ2V0IGlzIHN1cHBvc2VkIHRvIG9wdGltaXpl
IHdyaXRlcywgbm90IHJlYWRzLgo+IE5vcm1hbGx5LCB0aGVyZSB3b24ndCBiZSBhbnkgcmVhZHMg
Zm9sbG93aW5nIGEgd3JpdGUsIGJlY2F1c2UgdGhlIGRhdGEgd291bGQgYmUKPiBzdG9yZWQgaW4g
dGhlIGNhY2hlIGluIFJBTS4KPiAKPiBNaWt1bGFzCgpHb3QgaXQsIFRoYW5rcyBmb3IgcG9pbnRp
bmcgdGhhdCBvdXQuCgpDaGVlcnMsCkh1YWlzaGVuZyBZZSB8INK2u7PKpApMaW51eCBrZXJuZWwg
fCBMZW5vdm8gRENHCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
