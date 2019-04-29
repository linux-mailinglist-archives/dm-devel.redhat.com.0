Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CD50FDDA5
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 10:23:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE4C230821E2;
	Mon, 29 Apr 2019 08:23:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 212B91001E78;
	Mon, 29 Apr 2019 08:23:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4C58141F3D;
	Mon, 29 Apr 2019 08:22:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3T26YNG002174 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Apr 2019 22:06:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4778F17519; Mon, 29 Apr 2019 02:06:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA4C74A3;
	Mon, 29 Apr 2019 02:06:29 +0000 (UTC)
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
	[67.219.250.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABEC53092655;
	Mon, 29 Apr 2019 02:06:28 +0000 (UTC)
Received: from [67.219.251.54] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-c.us-west-2.aws.symcld.net id B0/43-08672-32C56CC5;
	Mon, 29 Apr 2019 02:06:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSfUgTcRj2d3fbLvHiPC3fhlotozI2nP7hERQ
	RRBIUUVBm6+OW1zadc91NtOiPFX1q9p3kbFZW2Idirog0q2kpOFLDMikimQl+4AeWUhRZu90q
	++95n+d5f8/7/nhJnOlQqkm+wMELNs6qUYYT5gE/pl1gaDEkVXSr2BpfC84+GS1TsK/rLyvZs
	8e7MHb0W7GKPVo7idiG5uP4SlXa2NMuZdoXT3xaR8+UagOeobDYjLkFuxTmC91fMHu7rsDzfq
	MTOXWFKJxk6H4ER/sHlXLxAoHfXRssCPoWDo1PrmGycgoD78PDoaIHwde2OlUhmkEq6SXQOvw
	Wl3B0AHdeHlZIJpyuwaD7vguThCh6C/i9k0g2pcPjyiOYjHXgHjoS5Al6Ifhe9wV5ijaA7+C7
	YACi46CktyfI43QMuEtcCgkDTcONhg5cxrNg8NNUgCcD/o0w+mCHTGtg7EYpJuM46LxShGS8D
	oqOlSFpTqBfIShu8yhlIRHut1eFGrKh+eOJEF4Eh8fLQ7mx4D35XCU3v1fAhK8qGMzQRqj+YZ
	E98XCn2E/Ing4cPhTfQ/ICiVDu/BFaZj5cKPKrzqDFrmm7uabZXNNsruC/REJraR9xFRF3UKp
	RsJjMjhzOYtXqk5K0en2yVp/CatkUHbdfu1uXJ2rzedGhTdZx+aJO3Jez25qps/EODwqcVaa9
	cNMjVFZkakJzSEwzi7r5sNnAzDTmZu4zc6J5p5Bn5cUmFEuSGqDmbWsxMJECb+IL9lisgdv8I
	wMZoYmmKEmmRDuXI1pMsuRDKaS3wu/GyZHGfjfOELZcG6+OodZKVlqymvNsfx/6c+edKE4dRa
	GwsDAmws4LORbH//oQiiGRJopKlV6JsNgcf/OGAqNggVEybzdJozi4f5LaiUprpybeMPUHTq0
	p2Rpb33ZxpLUnqqE8ayD++kSXcvYBszFak306LZ356f9odZ+vbM895H+VNNe2IivhWSV9l14W
	8/3mlLAr4+vc6tbml3vPbZ8pOI8lqH89UGQs9dnHrw9ujrROKlaYPhPeVR82j1TUUXUZNULT8
	qFL51f3ZnvWp2oI0czpE3FB5H4DQ2C9teIDAAA=
X-Env-Sender: yehs1@lenovo.com
X-Msg-Ref: server-14.tower-366.messagelabs.com!1556503584!2692696!1
X-Originating-IP: [104.232.225.2]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18854 invoked from network); 29 Apr 2019 02:06:26 -0000
Received: from unknown (HELO maesmtp01.lenovo.com) (104.232.225.2)
	by server-14.tower-366.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 29 Apr 2019 02:06:26 -0000
Received: from USEXEDGE02.lenovo.com (unknown [10.62.65.5]) by
	maesmtp01.lenovo.com with smtp
	(TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-SHA384)
	id 4921_17ec_39a1e29f_94dc_4e43_8554_480da70d35b7;
	Mon, 29 Apr 2019 02:06:20 +0000
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.51)
	by USEXEDGE02.lenovo.com (10.62.65.5) with Microsoft SMTP Server (TLS)
	id 14.3.408.0; Sun, 28 Apr 2019 22:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=LenovoBeijing.onmicrosoft.com; s=selector1-lenovo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cj46vvHH4yTgBXx7K5aHjOUwavC9Lmgbt+7NafH3BmM=;
	b=q2V232j1brnTuMs3P644urgp5fiIzH2zyRrXt1q/gYt/0U91L6O+zsqvLyLcR/iy0cyiidVJP2FFnE/4yfbCPRNs+h/VX7MJljbqlTS13wFgEUDiAZrFYubtWEInfckWoq8OYTE2PFx+CvcKUsZyKfGYfI6ofL2lXeGpG4UOgnY=
Received: from HK2PR03MB4418.apcprd03.prod.outlook.com (10.170.158.23) by
	HK2PR03MB1746.apcprd03.prod.outlook.com (10.165.179.8) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1856.9; Mon, 29 Apr 2019 02:06:16 +0000
Received: from HK2PR03MB4418.apcprd03.prod.outlook.com
	([fe80::c5e2:754c:4a83:59c2]) by
	HK2PR03MB4418.apcprd03.prod.outlook.com
	([fe80::c5e2:754c:4a83:59c2%5]) with mapi id 15.20.1856.007;
	Mon, 29 Apr 2019 02:06:16 +0000
From: Huaisheng HS1 Ye <yehs1@lenovo.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Thread-Topic: [PATCH] dm-writecache: avoid unnecessary lookups in
	writecache_find_entry
Thread-Index: AdT+Lz3qx9IFZ0iARsWJtQbJywgOzA==
Date: Mon, 29 Apr 2019 02:06:16 +0000
Message-ID: <HK2PR03MB4418630B5A3A114F21B5986692390@HK2PR03MB4418.apcprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.120.95.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b60004bd-427d-42f7-713c-08d6cc474353
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:HK2PR03MB1746; 
x-ms-traffictypediagnostic: HK2PR03MB1746:
x-microsoft-antispam-prvs: <HK2PR03MB1746C636968521CAE6A6448F92390@HK2PR03MB1746.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(39840400004)(136003)(346002)(396003)(366004)(199004)(189003)(6116002)(54906003)(102836004)(3846002)(6916009)(6436002)(53936002)(99286004)(6246003)(7696005)(229853002)(256004)(25786009)(6506007)(97736004)(4326008)(305945005)(7736002)(33656002)(74316002)(2906002)(86362001)(26005)(186003)(66556008)(66476007)(8936002)(14454004)(81166006)(52536014)(81156014)(8676002)(66066001)(73956011)(66946007)(68736007)(478600001)(76116006)(486006)(71200400001)(55016002)(316002)(9686003)(5660300002)(71190400001)(476003)(66446008)(64756008)(9126004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HK2PR03MB1746;
	H:HK2PR03MB4418.apcprd03.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: lenovo.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2xhOqlHJIvS9oPQk1ucLfAy86+LdUkMh0LagwQJyel9dJUyW8wLE5yFZhSZSRV0LZPTUNtOBhQYfI1FCgtvizM72eCT2PbV4nEiOs89lyVKoRTMdwmr4n/UhIEkfMUzfDUHa/w8Q9mmi00gsRyZdZbhinDuseju6H20SEYGrGacF4iyQ5sakJbeHBgHCdyF/xPLBpZ/pXVoBZ9qc0vJ8MBkhkMiYz4CKsh0nX69txg/lE2tYNe9YS6GIk3dDJSQKiwHXmXWUAy4xs9wVpVvvT0N10c1mdX++bO6JoSbhixOrHnSq01DkUDfmPegeS8CyB9QbuxE2qCuLTjnlXZCZHmcY1Z+iOH6L2uXyL1T9L5CJKp7Mis1JXMBXlPXhkDGSj4MK6nYSiZod4lDwYrjo1iWJSoyHTIgnM6LX+Bxlb1g=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b60004bd-427d-42f7-713c-08d6cc474353
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 02:06:16.1931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB1746
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Mon, 29 Apr 2019 02:06:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Mon, 29 Apr 2019 02:06:29 +0000 (UTC) for IP:'67.219.250.211'
	DOMAIN:'mail1.bemta24.messagelabs.com'
	HELO:'mail1.bemta24.messagelabs.com' FROM:'yehs1@lenovo.com'
	RCPT:''
X-RedHat-Spam-Score: -0.012  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,
	SPF_PASS) 67.219.250.211 mail1.bemta24.messagelabs.com 67.219.250.211
	mail1.bemta24.messagelabs.com <yehs1@lenovo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x3T26YNG002174
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Apr 2019 04:22:33 -0400
Cc: "prarit@redhat.com" <prarit@redhat.com>, Huaisheng Ye <yehs2007@zoho.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	NingTing Cheng <chengnt@lenovo.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-writecache: avoid unnecessary lookups in
 writecache_find_entry
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 29 Apr 2019 08:23:11 +0000 (UTC)

CkZyb206IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVkaGF0LmNvbT4KU2VudDogRnJpZGF5
LCBBcHJpbCAyNiwgMjAxOSA5OjU5IFBNCj4gCj4gCj4gT24gV2VkLCAyNCBBcHIgMjAxOSwgSHVh
aXNoZW5nIEhTMSBZZSB3cm90ZToKPiAKPiA+IEZyb206IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9j
a2FAcmVkaGF0LmNvbT4KPiA+IFNlbnQ6IFR1ZXNkYXksIEFwcmlsIDIzLCAyMDE5IDExOjQ0IFBN
Cj4gPiA+Cj4gPiA+IE9uIFN1biwgMjEgQXByIDIwMTksIEh1YWlzaGVuZyBZZSB3cm90ZToKPiA+
ID4KPiA+ID4gPiBGcm9tOiBIdWFpc2hlbmcgWWUgPHllaHMxQGxlbm92by5jb20+Cj4gPiA+ID4K
PiA+ID4gPiBPbmx5IHdoZW4gZW50cnkgaGFzIGJlZW4gZm91bmQsIHRoYXQgd291bGQgb25seSBi
ZSBuZWNlc3NhcnkgdG8gY2hlY2sgdGhlCj4gPiA+ID4gbG93ZXN0IG9yIGhpZ2hlc3Qgc2VxLWNv
dW50Lgo+ID4gPiA+Cj4gPiA+ID4gQWRkIGxvY2FsIHZhcmlhYmxlICJmb3VuZCIgaW4gd3JpdGVj
YWNoZV9maW5kX2VudHJ5LCBpZiBubyBlbnRyeSBoYXMgYmVlbgo+ID4gPiA+IGZvdW5kLCBpdCBp
cyBtZWFuaW5nbGVzcyB0aGF0IGhhdmluZyBhIHVzZWxlc3MgcmJfcHJldiBvciByYl9uZXh0Lgo+
ID4gPgo+ID4gPgo+ID4gPiBIaQo+ID4gPgo+ID4gPiBJIGRvbid0IHF1aXRlIHNlZSB3aGF0IGlz
IHRoaXMgcGF0Y2ggdHJ5aW5nIHRvIGZpeC4KPiA+ID4gRG9uJ3QgZml4IHNvbWV0aGluZyB0aGF0
IGlzbid0IGJyb2tlbgo+ID4KPiA+IEhpIE1pa3VsYXMsCj4gPgo+ID4gVGhhbmtzIGZvciB5b3Vy
IHJlcGx5Lgo+ID4gVGhpcyBwYXRjaCBpcyBub3QgZGVzaWduZWQgZm9yIGZpeGluZyBsb2dpY2Fs
IGVycm9yLiBUaGF0IGlzIHVzZWQgZm9yIG9wdGltaXppbmcgdGhlIGJlaGF2aW9yCj4gb2Ygd3Jp
dGVjYWNoZV9maW5kX2VudHJ5Lgo+ID4KPiA+IExldCBtZSBnaXZlIGFuIGV4YW1wbGUgdG8gaWxs
dXN0cmF0ZSB0aGUgcG9pbnQgYmVsb3cuCj4gPiBTdXBwb3NlIHRoYXQgaXMgdGhlIGNhc2UsIGhl
cmUgaXMgYSBub3JtYWwgUkVBRCBiaW8gY29tZXMgdG8gd3JpdGVjYWNoZV9tYXAuIEFuZCBiZWNh
dXNlIG9mCj4gYmlvJ3MgZGlyZWN0aW9uIGlzIFJFQUQsIHdyaXRlY2FjaGVfZmluZF9lbnRyeSB3
b3VsZCBiZSBjYWxsZWQgd2l0aCBmbGFncyBXRkVfUkVUVVJOX0ZPTExPV0lORy4KPiA+Cj4gPiBO
b3cgdGhlcmUgYXJlIHR3byBzY2VuYXJpb3MsCj4gPiAxLiB3cml0ZWNhY2hlX2ZpbmRfZW50cnkg
c3VjY2Vzc2Z1bGx5IGdldCBhbiBleGlzdGluZyBlbnRyeSBieSBzZWFyY2hpbmcgcmJfdHJlZSwg
d2UgY291bGQKPiBjYWxsIGl0IEhJVC4gVGhlbiB0aGUgZmlyc3QgJ3doaWxlJyB3aWxsIGJlIGZp
bmlzaGVkIGJ5ICdicmVhaycuIE5leHQgaXQgd2lsbCBtb3ZlIHRvIHNlY29uZAo+ICd3aGlsZScg
bG9vcCwgYmVjYXVzZSBvZiB0aGUgZmxhZ3MgaGFzbid0IGJlZW4gbWFya2VkIGFzIFdGRV9MT1dF
U1RfU0VRLiB3cml0ZWNhY2hlX2ZpbmRfZW50cnkKPiB3aWxsIHRyeSB0byByZXR1cm4gYW4gZW50
cnkgd2l0aCBISUdIRVNUX1NFUSwgaWYgdGhlcmUgYXJlIG90aGVyIGVudHJpZXMgd2hpY2ggaGFz
IHNhbWUKPiBvcmlnaW5hbF9zZWN0b3IgaW4gcmJfdHJlZS4KPiA+IEZvciB0aGlzIHNpdHVhdGlv
biwgdGhlIGN1cnJlbnQgY29kZSBpcyBva2F5IHRvIGRlYWwgd2l0aCBpdC4KPiA+Cj4gPiAyLiB3
cml0ZWNhY2hlX2ZpbmRfZW50cnkgY291bGRuJ3QgZ2V0IGFuIGV4aXN0aW5nIGVudHJ5IGZyb20g
cmJfdHJlZSwgd2UgY291bGQgY2FsbCBpdCBNSVNTLgo+IEJlY2F1c2Ugb2Ygc2FtZSBmbGFncyBX
RkVfUkVUVVJOX0ZPTExPV0lORywgd3JpdGVjYWNoZV9maW5kX2VudHJ5IHdpbGwgZ2V0IG90aGVy
IGVudHJ5LCB3aGljaCdzCj4gb3JpZ2luYWxfc2VjdG9yIHdpbGwgc2xpZ2h0bHkgbGFyZ2VyIHRo
YW4gaW5wdXQgcGFyYW1ldGVyIGJsb2NrLCB3aXRoIGJpZyBwcm9iYWJpbGl0eS4KPiA+IEZvciB0
aGlzIHNjZW5hcmlvLCBmdW5jdGlvbiB3cml0ZWNhY2hlX2ZpbmRfZW50cnkgZG9lc24ndCBuZWVk
IHRvIGVudGVyIHNlY29uZCAnd2hpbGUnIGxvb3AuCj4gQnV0IGN1cnJlbnQgY29kZSB3b3VsZCBz
dGlsbCB0cnkgdG8gY2hlY2sgdGhlcmUgd2VyZSBvdGhlciBlbnRyeSB3aXRoIHNhbWUgb3JpZ2lu
YWxfc2VjdG9yLgo+ID4gU28gdGhlIGFkZGl0aW9uYWwgcmJfbmV4dCBvciByYl9wcmV2IGlzIHVu
bmVjZXNzYXJ5IGJ5IHRoaXMgY2FzZSwgYWxzbyB0aGUgY29kZSBkb2Vzbid0IG5lZWQKPiB0byBj
b21wYXJlIHRoZSBvcmlnaW5hbF9zZWN0b3Igb2YgJ2UyJyB3aXRoIHBhcmFtZXRlciAnYmxvY2sn
Lgo+ID4KPiA+IE15IHBhdGNoIGlzIGRlc2lnbmVkIHRvIG9wdGltaXplIHRoZSBzZWNvbmQgY2Fz
ZS4gc28gd2UgY291bGQgc2tpcCB0aGUgc2Vjb25kICd3aGlsZScgbG9vcAo+IHdoZW4gdGhlIGJs
b2NrIGlzIG1pc3NlZCBmcm9tIHJiX3RyZWUuCj4gPgo+ID4gQ2hlZXJzLAo+ID4gSHVhaXNoZW5n
IFllCj4gCj4gU28sIGl0IHNlZW1zIHRoYXQgd2UgZG9uJ3QgbmVlZCB0aGUgImZvdW5kIiB2YXJp
YWJsZSBhdCBhbGwsIHdlIGNvdWxkIGp1c3QKPiByZXR1cm4gdGhlIHZhcmlhYmxlICJlIiBkaXJl
Y3RseSB3aGVuIHdlIGFyZSBpbiBhIHBvc2l0aW9uIHdoZXJlICJmb3VuZCIKPiBpcyBmYWxzZS4K
PiAKPiBXaGF0IGFib3V0IHRoaXMgcGF0Y2g/IENvdWxkIHlvdSB0ZXN0IGl0Pwo+IAo+IE1pa3Vs
YXMKCgpIaSBNaWt1bGFzLAoKU3VyZSwgSSBsaWtlIHlvdXIgcGF0Y2guIEl0IGlzIHF1aXRlIHN0
cmFpZ2h0IGZvcndhcmQuCkFuZCB0aGVyZSBpcyBubyBsb2dpY2FsIGRpZmZlcmVuY2UgYmV0d2Vl
biB0aGVtLCBJIGhhdmUgdGVzdGVkIGl0IGFuZCBnZXQgYSBwb3NpdGl2ZSByZXN1bHQuCgpDaGVl
cnMsCkh1YWlzaGVuZyBZZSB8INK2u7PKpApMaW51eCBrZXJuZWwgfCBMZW5vdm8gRENHCgo+IAo+
IAo+IEZyb206IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVkaGF0LmNvbT4KPiBTdWJqZWN0
OiBbUEFUQ0hdIGRtLXdyaXRlY2FjaGU6IGEgc21hbGwgb3B0aW1pemF0aW9uIGluIHdyaXRlY2Fj
aGVfZmluZF9lbnRyeQo+IAo+IElmIHdlIGdvIHBhc3QgdGhlIGNvbmRpdGlvbiAiaWYgKHVubGlr
ZWx5KCFub2RlKSkiLCB3ZSBjYW4gYmUgY2VydGFpbiB0aGF0Cj4gdGhlcmUgaXMgbm8gZW50cnkg
aW4gdGhlIHRyZWUgdGhhdCBoYXMgdGhlIGJsb2NrIGVxdWFsIHRvIHRoZSAiYmxvY2siCj4gdmFy
aWFibGUuCj4gCj4gQ29uc2VxdWVudGx5LCB3ZSBjYW4gcmV0dXJuIHRoZSBuZXh0IGVudHJ5IGRp
cmVjdGx5LCB3ZSBkb24ndCBuZWVkIHRvIGdvCj4gdG8gdGhlIHNlY29uZCBwYXJ0IG9mIHRoZSBm
dW5jdGlvbiB0aGF0IGZpbmRzIHRoZSBlbnRyeSB3aXRoIGxvd2VzdCBvcgo+IGhpZ2hlc3Qgc2Vx
IG51bWJlciB0aGF0IG1hdGNoZXMgdGhlICJibG9jayIgdmFyaWFibGUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWlrdWxhcyBQYXRvY2thIDxtcGF0b2NrYUByZWRoYXQuY29tPgo+IAo+IC0tLQo+ICBk
cml2ZXJzL21kL2RtLXdyaXRlY2FjaGUuYyB8ICAgIDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IEluZGV4OiBsaW51eC0yLjYvZHJp
dmVycy9tZC9kbS13cml0ZWNhY2hlLmMKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gLS0tIGxpbnV4LTIuNi5vcmln
L2RyaXZlcnMvbWQvZG0td3JpdGVjYWNoZS5jCTIwMTktMDMtMTggMTA6Mjg6NTAuMDAwMDAwMDAw
ICswMTAwCj4gKysrIGxpbnV4LTIuNi9kcml2ZXJzL21kL2RtLXdyaXRlY2FjaGUuYwkyMDE5LTA0
LTI2IDE1OjQ5OjE4LjAwMDAwMDAwMCArMDIwMAo+IEBAIC01NTMsMTQgKzU1MywxNCBAQCBzdGF0
aWMgc3RydWN0IHdjX2VudHJ5ICp3cml0ZWNhY2hlX2ZpbmRfCj4gIAkJCQlyZXR1cm4gTlVMTDsK
PiAgCQkJfQo+ICAJCQlpZiAocmVhZF9vcmlnaW5hbF9zZWN0b3Iod2MsIGUpID49IGJsb2NrKSB7
Cj4gLQkJCQlicmVhazsKPiArCQkJCXJldHVybiBlOwo+ICAJCQl9IGVsc2Ugewo+ICAJCQkJbm9k
ZSA9IHJiX25leHQoJmUtPnJiX25vZGUpOwo+ICAJCQkJaWYgKHVubGlrZWx5KCFub2RlKSkgewo+
ICAJCQkJCXJldHVybiBOVUxMOwo+ICAJCQkJfQo+ICAJCQkJZSA9IGNvbnRhaW5lcl9vZihub2Rl
LCBzdHJ1Y3Qgd2NfZW50cnksIHJiX25vZGUpOwo+IC0JCQkJYnJlYWs7Cj4gKwkJCQlyZXR1cm4g
ZTsKPiAgCQkJfQo+ICAJCX0KPiAgCX0KCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZl
bEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1k
ZXZlbA==
