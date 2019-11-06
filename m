Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 96A29F2244
	for <lists+dm-devel@lfdr.de>; Thu,  7 Nov 2019 00:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573081336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mzpvKDuzOxeMT+1xdgm0NnIiRFqfFBJz9m4dhmJhCCg=;
	b=ZyzhCJDB9P5NNl2yxrVBlNX5pqI/gY/e7rDAlRvVEHzmYwaB+sqSzPdnKWi50NSjkIShkG
	wKEurqBU9mcxwDE2MHNRMXX+VsaIJKFHVOVqL0t/fWvZiFblKVL/QXgUQ0bRPIG/R9dLUQ
	u959E+2jHdVG592A+SYGsXYeiDvvqR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-V_7eXe0lND-yRHpdZJ_AZA-1; Wed, 06 Nov 2019 18:02:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3F451005500;
	Wed,  6 Nov 2019 23:02:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ED875D9CD;
	Wed,  6 Nov 2019 23:02:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7FE4F1832DEA;
	Wed,  6 Nov 2019 23:01:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA6N1lPC008435 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Nov 2019 18:01:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 222D919D70; Wed,  6 Nov 2019 23:01:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92CA919757;
	Wed,  6 Nov 2019 23:01:41 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E421810C72C5;
	Wed,  6 Nov 2019 23:01:09 +0000 (UTC)
IronPort-SDR: LaywxM7z9aOoQMj8sHO5myfbCQhYXC0uM3G+UxMC+ufxFu8SROvYYemENHU0gpAfq3o2nCI2nc
	Mq8gI0x2xlvUSOPW4YOMUcjdm2IV/JZM31JNSgevSWutxd01n8t2ysq9i+duxVBGSi9WxJbPW2
	DQW6vfSChE9LtcvdMofMkaDsn9PZ9g+9UUvNZD2FZbXZYiZHv2fRD7y8QsgmUi+feGjSYefABN
	jLZvEQmWqcD4dPLZy2mQs3S/6iiKdGPa8UjI6t38snGP5yYHJFewnYlEjsrB3hDwqcaQrmfL1E
	n5k=
X-IronPort-AV: E=Sophos;i="5.68,276,1569254400"; d="scan'208";a="123926173"
Received: from mail-bl2nam02lp2050.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.50])
	by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2019 07:01:01 +0800
Received: from CO2PR04MB2328.namprd04.prod.outlook.com (10.166.95.11) by
	CO2PR04MB2183.namprd04.prod.outlook.com (10.166.215.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Wed, 6 Nov 2019 23:00:59 +0000
Received: from CO2PR04MB2328.namprd04.prod.outlook.com
	([fe80::7c3c:7056:ab43:7f7d]) by
	CO2PR04MB2328.namprd04.prod.outlook.com
	([fe80::7c3c:7056:ab43:7f7d%6]) with mapi id 15.20.2408.024;
	Wed, 6 Nov 2019 23:00:59 +0000
From: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
To: "dm-devel@redhat.com" <dm-devel@redhat.com>, "agk@redhat.com"
	<agk@redhat.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
	"zhangxiaoxu5@huawei.com" <zhangxiaoxu5@huawei.com>, "snitzer@redhat.com"
	<snitzer@redhat.com>
Thread-Topic: dm-zoned performance degradation after apply 75d66ffb48efb3 ("dm
	zoned:,properly handle backing device failure")
Thread-Index: AQHVi6CoxFet8iv/B0a4odCWFnMjZKdtzPYAgAakA4CACmPLgA==
Date: Wed, 6 Nov 2019 23:00:59 +0000
Message-ID: <283fcf104cab4c99e2e1665a05e13829c4f125b6.camel@wdc.com>
References: <203cc4c8-b380-5b2f-c9e7-766b3f031c8c@huawei.com>
	<38d2a401ad8111ec0e6806f3e165916b18769d6d.camel@wdc.com>
	<63f060dc-d3b9-f4d1-8c86-27e75f1d1441@huawei.com>
In-Reply-To: <63f060dc-d3b9-f4d1-8c86-27e75f1d1441@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e14adb9f-f299-4655-8dfe-08d7630d3063
x-ms-traffictypediagnostic: CO2PR04MB2183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR04MB2183EC7A6363D219CBCACA07E1790@CO2PR04MB2183.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(199004)(189003)(53754006)(14454004)(14444005)(6512007)(81156014)(2201001)(6246003)(8676002)(71200400001)(71190400001)(81166006)(86362001)(66946007)(66476007)(66556008)(66446008)(11346002)(446003)(2616005)(64756008)(36756003)(486006)(102836004)(316002)(305945005)(8936002)(76176011)(6436002)(186003)(110136005)(4001150100001)(26005)(6506007)(229853002)(7736002)(6486002)(76116006)(99286004)(476003)(25786009)(66066001)(2906002)(5660300002)(118296001)(91956017)(6116002)(2501003)(3846002)(478600001)(5024004)(256004)(21314003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2183;
	H:CO2PR04MB2328.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GssInZzLa3shfUS/C7QpLn5//s8vT9w85nXujiIlA14punurW1DwC0Zw9oV7SVCjBrCArxvqVNV4FY/lF43s/AcqoPzb4v4ird4E97y5OnHXFVQaGOfjkjrdBAYfY5MFMZ9PMAKM/XNKfFmgwnedB7UxAfWAFt4tGmwndjBxxMjffICgsJzGAJScmABdj5cmIQ0dMPgZxLnfZa6rupadMIyPJZr0DbuRWXki59oSEGHmxato5appZ8ssDMZzsb6PJsXvAIbYfVHpNFVkuyBPP7H3ob8waJYtS1TIPlY2VJD2srn39+4tXRWx1zoWlHwD/f1aqzmLarlZvvNXZjmNy3fXzd8WvCBRI4zSoA7IHDu+sgX+50pp1/HWUvSGAoYfUtggkHByoW+YigCyPByP5aMMUUz5RRHmIkTeVDen9YGegD5vadMWzyf70Ebe/Z9v
Content-ID: <3C293C767C08BE46BAA1C8FC0EE988EA@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14adb9f-f299-4655-8dfe-08d7630d3063
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 23:00:59.2330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlT00NQgrMOr3dsu3FoZFq7yvHmoQCbGUg0Jf/JEa2C9mIotPwv0OsovNjf1BX9Cfxgx/ei1d/o028Rk3dkxyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2183
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.64]); Wed, 06 Nov 2019 23:01:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Wed, 06 Nov 2019 23:01:31 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'Dmitry.Fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=206a29409=Dmitry.Fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA6N1lPC008435
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-zoned performance degradation after apply
 75d66ffb48efb3 ("dm zoned:, properly handle backing device failure")
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: V_7eXe0lND-yRHpdZJ_AZA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgWmhhbmcsCgpJIGp1c3QgcG9zdGVkIHRoZSBwYXRjaCB0aGF0IGZpeGVzIHRoaXMgaXNzdWUu
IENvdWxkIHlvdSBwbGVhc2UgdHJ5IGl0IGFuZCBsZXQKbWUga25vdyBob3cgdGhpcyBwYXRjaCB3
b3JrcyBmb3IgeW91PyBJbiBteSB0ZXN0aW5nLCBJIGRvbid0IHNlZSBhbnkgZXhjZXNzaXZlClRV
UnMgaXNzdWVkIHdpdGggdGhpcyBwYXRjaCBpbiBwbGFjZS4gSXQgdGFrZXMgYXJvdW5kIDEyIG1p
bnV0ZXMgdG8gcnVuCm1rZnMuZXh0NCBvbiBhIGZyZXNobHkgY3JlYXRlZCBkbS16b25lZCBkZXZp
Y2Ugb24gdG9wIG9mIGEgMTRUQiBTQ1NJIGRyaXZlLgpUaGUgc2FtZSB0ZXN0IG9uIHRvcCBvZiBh
IDE0VEIgU0FUQSBkcml2ZSB0YWtlcyBhcm91bmQgMTAgbWludXRlcy4gVGhlc2UgYXJlCmRpcmVj
dCBhdHRhY2hlZCBkcml2ZXMgb24gYSBwaHlzaWNhbCBzZXJ2ZXIuCgpJIGRpZG4ndCB0ZXN0IHRo
aXMgcGF0Y2ggb24gNC4xOSBrZXJuZWwuIElmIHlvdSBoYXZlIGFueSBmaW5kaW5ncyBhYm91dCBo
b3cKaXQgYmVoYXZlcywgZG8gbGV0IG1lIGtub3cuCgpSZWdhcmRzLApEbWl0cnkKCk9uIFRodSwg
MjAxOS0xMC0zMSBhdCAxNjoyMCArMDgwMCwgemhhbmd4aWFveHUgKEEpIHdyb3RlOgo+IGhpIERt
aXRyeSwgdGhhbmtzIGZvciB5b3VyIHJlcGx5Lgo+IAo+IEkgYWxzbyB0ZXN0IGl0IHVzZSB0aGUg
bWFpbmxpbmUsIGl0IGFsc28gdGFrZXMgbW9yZSB0aGFuIDEgaG91cnMuCj4gbXkgbWVjaGluZSBo
YXMgNjQgQ1BVcyBjb3JlIGFuZCB0aGUgZGlzayBpcyBTQVRBLgo+IAo+IHdoZW4gbWtmcy5leHQ0
LCBJIGZvdW5kIHRoZSAnc2NzaV90ZXN0X3VuaXRfcmVhZHknIHJ1biBtb3JlIHRoYW4gMTAwMCB0
aW1lcwo+IHBlciBzZWNvbmQgYnkgdGhlIGRpZmZlcmVudCBrd29ya2VyLgo+IGFuZCBldmVyeSAn
c2NzaV90ZXN0X3VuaXRfcmVhZHknIHRha2VzIG1vcmUgdGhhbiAyMDB1cywgYW5kIHRoZSBpbnRl
cnZhbAo+IGxlc3MgdGhhbiAyMHVzLgo+IFNvLCBJIHRoaW5rIHlvdXIgZ3Vlc3MgaXMgcmlnaHQu
Cj4gCj4gYnV0IHRoZXJlIGlzIGFub3RoZXIgcXVlc3Rpb24sIHdoeSA0LjE5IGJyYW5jaCB0YWtl
cyBtb3JlIHRoYW4gMTAgaG91cj8KPiBJIHdpbGwgd29yayBvbiBpdCwgaWYgYW55IGluZm9ybWF0
aW9uIGFib3V0IGl0LCBJIHdpbGwgcmVwbHkgeW91Lgo+IAo+IFRoYW5rcy4KPiAKPiBteSBzY3Jp
cHQ6Cj4gCWRtemFkbSAtLWZvcm1hdCAvZGV2L3NkaQo+IAllY2hvICIwIDIxNDg1MzIyMjQwIHpv
bmVkIC9kZXYvc2RpIiB8IGRtc2V0dXAgY3JlYXRlIGRtei1zZGkKPiAJZGF0ZTsgbWtmcy5leHQ0
IC9kZXYvbWFwcGVyL2Rtei1zZGk7IGRhdGUKPiAKPiBtYWlubGluZToKPiAJW3Jvb3RAbG9jYWxo
b3N0IH5dIyB1bmFtZSAtYQo+IAlMaW51eCBsb2NhbGhvc3QgNS40LjAtcmM1ICMxIFNNUCBUaHUg
T2N0IDMxIDExOjQxOjIwIENTVCAyMDE5IGFhcmNoNjQgYWFyY2g2NCBhYXJjaDY0IEdOVS9MaW51
eAo+IAo+IAlUaHUgT2N0IDMxIDEzOjU4OjU1IENTVCAyMDE5Cj4gCW1rZTJmcyAxLjQzLjYgKDI5
LUF1Zy0yMDE3KQo+IAlEaXNjYXJkaW5nIGRldmljZSBibG9ja3M6IGRvbmUKPiAJQ3JlYXRpbmcg
ZmlsZXN5c3RlbSB3aXRoIDI2ODQzNTQ1NjAgNGsgYmxvY2tzIGFuZCAzMzU1NDQzMjAgaW5vZGVz
Cj4gCUZpbGVzeXN0ZW0gVVVJRDogZTBkOGUwMWUtZWZhOC00N2ZkLWEwMTktYjE4NGU2NmY2NWIw
Cj4gCVN1cGVyYmxvY2sgYmFja3VwcyBzdG9yZWQgb24gYmxvY2tzOgo+IAkJMzI3NjgsIDk4MzA0
LCAxNjM4NDAsIDIyOTM3NiwgMjk0OTEyLCA4MTkyMDAsIDg4NDczNiwgMTYwNTYzMiwgMjY1NDIw
OCwKPiAJCTQwOTYwMDAsIDc5NjI2MjQsIDExMjM5NDI0LCAyMDQ4MDAwMCwgMjM4ODc4NzIsIDcx
NjYzNjE2LCA3ODY3NTk2OCwKPiAJCTEwMjQwMDAwMCwgMjE0OTkwODQ4LCA1MTIwMDAwMDAsIDU1
MDczMTc3NiwgNjQ0OTcyNTQ0LCAxOTM0OTE3NjMyLAo+IAkJMjU2MDAwMDAwMAo+IAo+IAlBbGxv
Y2F0aW5nIGdyb3VwIHRhYmxlczogZG9uZQo+IAlXcml0aW5nIGlub2RlIHRhYmxlczogZG9uZQo+
IAlDcmVhdGluZyBqb3VybmFsICgyNjIxNDQgYmxvY2tzKTogZG9uZQo+IAlXcml0aW5nIHN1cGVy
YmxvY2tzIGFuZCBmaWxlc3lzdGVtIGFjY291bnRpbmcgaW5mb3JtYXRpb246IGRvbmUKPiAKPiAJ
VGh1IE9jdCAzMSAxNTowMTowMSBDU1QgMjAxOQo+IAo+IGFmdGVyIGRlbGV0ZSB0aGUgJ2NoZWNr
X2V2ZW50cycgb24gbWFpbmxpbmU6Cj4gCVtyb290QGxvY2FsaG9zdCB+XSMgdW5hbWUgLWEKPiAJ
TGludXggbG9jYWxob3N0IDUuNC4wLXJjNSsgIzIgU01QIFRodSBPY3QgMzEgMTU6MDc6MzYgQ1NU
IDIwMTkgYWFyY2g2NCBhYXJjaDY0IGFhcmNoNjQgR05VL0xpbnV4Cj4gCVRodSBPY3QgMzEgMTU6
MTk6NTYgQ1NUIDIwMTkKPiAJbWtlMmZzIDEuNDMuNiAoMjktQXVnLTIwMTcpCj4gCURpc2NhcmRp
bmcgZGV2aWNlIGJsb2NrczogZG9uZQo+IAlDcmVhdGluZyBmaWxlc3lzdGVtIHdpdGggMjY4NDM1
NDU2MCA0ayBibG9ja3MgYW5kIDMzNTU0NDMyMCBpbm9kZXMKPiAJRmlsZXN5c3RlbSBVVUlEOiA3
MzUxOThlOC05ZGYwLTQ5ZmMtYWFhOC0yM2IwODY5ZGZhMDUKPiAJU3VwZXJibG9jayBiYWNrdXBz
IHN0b3JlZCBvbiBibG9ja3M6Cj4gCQkzMjc2OCwgOTgzMDQsIDE2Mzg0MCwgMjI5Mzc2LCAyOTQ5
MTIsIDgxOTIwMCwgODg0NzM2LCAxNjA1NjMyLCAyNjU0MjA4LAo+IAkJNDA5NjAwMCwgNzk2MjYy
NCwgMTEyMzk0MjQsIDIwNDgwMDAwLCAyMzg4Nzg3MiwgNzE2NjM2MTYsIDc4Njc1OTY4LAo+IAkJ
MTAyNDAwMDAwLCAyMTQ5OTA4NDgsIDUxMjAwMDAwMCwgNTUwNzMxNzc2LCA2NDQ5NzI1NDQsIDE5
MzQ5MTc2MzIsCj4gCQkyNTYwMDAwMDAwCj4gCj4gCUFsbG9jYXRpbmcgZ3JvdXAgdGFibGVzOiBk
b25lCj4gCVdyaXRpbmcgaW5vZGUgdGFibGVzOiBkb25lCj4gCUNyZWF0aW5nIGpvdXJuYWwgKDI2
MjE0NCBibG9ja3MpOiBkb25lCj4gCVdyaXRpbmcgc3VwZXJibG9ja3MgYW5kIGZpbGVzeXN0ZW0g
YWNjb3VudGluZyBpbmZvcm1hdGlvbjogZG9uZQo+IAo+IAlUaHUgT2N0IDMxIDE1OjMwOjUxIENT
VCAyMDE5Cj4gCj4g5ZyoIDIwMTkvMTAvMjcgMTA6NTYsIERtaXRyeSBGb21pY2hldiDlhpnpgZM6
Cj4gPiBaaGFuZywKPiA+IAo+ID4gSSBqdXN0IGRpZCBzb21lIHRlc3Rpbmcgb2YgdGhpcyBzY2Vu
YXJpbyB3aXRoIGEgcmVjZW50IGtlcm5lbCB0aGF0IGluY2x1ZGVzIHRoaXMgcGF0Y2guCj4gPiAK
PiA+IFRoZSBsb2cgYmVsb3cgaXMgYSBydW4gaW4gUUVNVSB3aXRoIDggQ1BVcyBhbmQgaXQgdG9v
ayAxOC41IG1pbnV0ZXMgdG8gY3JlYXRlIHRoZSBGUyBvbiBhCj4gPiAxNFRCIEFUQSBkcml2ZS4g
RG9pbmcgdGhlIHNhbWUgdGhpbmcgb24gYmFyZSBtZXRhbCB3aXRoIDMyIENQVXMgdGFrZXMgMTAu
NSBtaW51dGVzIGluIG15Cj4gPiBlbnZpcm9ubWVudC4gSG93ZXZlciwgd2hlbiBkb2luZyB0aGUg
c2FtZSB0ZXN0IHdpdGggYSBTQVMgZHJpdmUsIHRoZSBydW4gdGFrZXMgNDMgbWludXRlcy4KPiA+
IFRoaXMgaXMgbm90IHF1aXRlIHRoZSBkZWdyYWRhdGlvbiB5b3UgYXJlIG9ic2VydmluZywgYnV0
IHN0aWxsIGEgYmlnIHBlcmZvcm1hbmNlIGhpdC4KPiA+IAo+ID4gSXMgdGhlIGRpc2sgdGhhdCB5
b3UgYXJlIHVzaW5nIFNBUyBvciBTQVRBPwo+ID4gCj4gPiBNeSBjdXJyZW50IGd1ZXNzIGlzIHRo
YXQgc2QgZHJpdmVyIG1heSBnZW5lcmF0ZSBzb21lIFRFU1QgVU5JVCBSRUFEWSBjb21tYW5kcyB0
byBjaGVjayBpZgo+ID4gdGhlIGRyaXZlIGlzIHJlYWxseSBvbmxpbmUgYXMgYSBwYXJ0IG9mIGNo
ZWNrX2V2ZW50cygpIHByb2Nlc3NpbmcuIEZvciBBVEEgZHJpdmVzLCB0aGlzIGlzCj4gPiBuZWFy
bHkgYSBOT1Agc2luY2UgYWxsIFRVUnMgYXJlIGNvbXBsZXRlZCBpbnRlcm5hbGx5IGluIGxpYmF0
YS4gQnV0LCBpbiBTQ1NJIGNhc2UsIHRoZXNlCj4gPiBibG9ja2luZyBUVVJzIGFyZSBpc3N1ZWQg
dG8gdGhlIGRyaXZlIGFuZCBjZXJ0YWlubHkgbWF5IGRlZ3JhZGUgcGVyZm9ybWFuY2UuCj4gPiAK
PiA+IFRoZSBjaGVja19ldmVudHMoKSBjYWxsIGhhcyBiZWVuIGFkZGVkIHRvIGJkZXZfZGV2aWNl
X2lzX2R5aW5nKCkgYmVjYXVzZSBzaW1wbHkgY2FsbGluZwo+ID4gYmRldl9xdWV1ZV9keWluZygp
IGRvZXNuJ3QgY292ZXIgdGhlIHNpdHVhdGlvbiB3aGVuIHRoZSBkcml2ZSBnZXRzIG9mZmxpbmVk
IGluIFNDU0kgbGF5ZXIuCj4gPiBJdCBtaWdodCBiZSBwb3NzaWJsZSB0byBvbmx5IGNhbGwgY2hl
Y2tfZXZlbnRzKCkgb25jZSBiZWZvcmUgZXZlcnkgcmVjbGFpbSBydW4gYW5kIHRvIGF2b2lkCj4g
PiBjYWxsaW5nIGl0IGluIEkvTyBtYXBwaW5nIHBhdGguIElmIHRoaXMgd29ya3MsIHRoZSBvdmVy
aGVhZCB3b3VsZCBsaWtlbHkgYmUgYWNjZXB0YWJsZS4KPiA+IEkgYW0gZ29pbmcgdG8gdGFrZSBh
IGxvb2sgaW50byB0aGlzLgo+ID4gCj4gPiBSZWdhcmRzLAo+ID4gRG1pdHJ5Cj4gPiAKPiA+IFty
b290QHh4eCBkbXpdIyB1bmFtZSAtYQo+ID4gTGludXggeHh4IDUuNC4wLXJjMS1ETVorICMxIFNN
UCBGcmkgT2N0IDExIDExOjIzOjEzIFBEVCAyMDE5IHg4Nl82NCB4ODZfNjQgeDg2XzY0IEdOVS9M
aW51eAo+ID4gW3Jvb3RAeHh4IGRtel0jIGxzc2NzaQo+ID4gWzA6MDowOjBdICAgIGRpc2sgICAg
UUVNVSAgICAgUUVNVSBIQVJERElTSyAgICAyLjUrICAvZGV2L3NkYQo+ID4gWzE6MDowOjBdICAg
IHpiYyAgICAgQVRBICAgICAgSEdTVCBIU0g3MjE0MTVBTCBUMjQwICAvZGV2L3NkYgo+ID4gW3Jv
b3RAeHh4IGRtel0jIC4vc2V0dXAtZG16IHRlc3QgL2Rldi9zZGIKPiA+IFtyb290QHh4eCBkbXpd
IyBjYXQgL3Byb2Mva2FsbHN5bXMgfCBncmVwIGRtel9iZGV2X2lzX2R5aW5nCj4gPiAoc3RhbmRh
cmQgaW5wdXQpOjkwNzgyOmZmZmZmZmZmYzA3MGE0MDEgdCBkbXpfYmRldl9pc19keWluZy5jb2xk
CVtkbV96b25lZF0KPiA+IChzdGFuZGFyZCBpbnB1dCk6OTA4NDk6ZmZmZmZmZmZjMDcwNmUxMCB0
IGRtel9iZGV2X2lzX2R5aW5nCVtkbV96b25lZF0KPiA+IFtyb290QHh4eCBkbXpdIyB0aW1lIG1r
ZnMuZXh0NCAvZGV2L21hcHBlci90ZXN0Cj4gPiBta2UyZnMgMS40NC42ICg1LU1hci0yMDE5KQo+
ID4gRGlzY2FyZGluZyBkZXZpY2UgYmxvY2tzOiBkb25lCj4gPiBDcmVhdGluZyBmaWxlc3lzdGVt
IHdpdGggMzY2MDg0MDk2MCA0ayBibG9ja3MgYW5kIDQ1NzYwNTEyMCBpbm9kZXMKPiA+IEZpbGVz
eXN0ZW0gVVVJRDogNDUzNmJhY2QtY2ZiNS00MWIyLWIwYmYtYzI1MTNlNmUzMzYwCj4gPiBTdXBl
cmJsb2NrIGJhY2t1cHMgc3RvcmVkIG9uIGJsb2NrczoKPiA+IAkzMjc2OCwgOTgzMDQsIDE2Mzg0
MCwgMjI5Mzc2LCAyOTQ5MTIsIDgxOTIwMCwgODg0NzM2LCAxNjA1NjMyLCAyNjU0MjA4LAo+ID4g
CTQwOTYwMDAsIDc5NjI2MjQsIDExMjM5NDI0LCAyMDQ4MDAwMCwgMjM4ODc4NzIsIDcxNjYzNjE2
LCA3ODY3NTk2OCwKPiA+IAkxMDI0MDAwMDAsIDIxNDk5MDg0OCwgNTEyMDAwMDAwLCA1NTA3MzE3
NzYsIDY0NDk3MjU0NCwgMTkzNDkxNzYzMiwKPiA+IAkyNTYwMDAwMDAwCj4gPiAKPiA+IEFsbG9j
YXRpbmcgZ3JvdXAgdGFibGVzOiBkb25lCj4gPiBXcml0aW5nIGlub2RlIHRhYmxlczogZG9uZQo+
ID4gQ3JlYXRpbmcgam91cm5hbCAoMjYyMTQ0IGJsb2Nrcyk6IGRvbmUKPiA+IFdyaXRpbmcgc3Vw
ZXJibG9ja3MgYW5kIGZpbGVzeXN0ZW0gYWNjb3VudGluZyBpbmZvcm1hdGlvbjogZG9uZQo+ID4g
Cj4gPiAKPiA+IHJlYWwJMThtMzAuODY3cwo+ID4gdXNlcgkwbTAuMTcycwo+ID4gc3lzCTBtMTEu
MTk4cwo+ID4gCj4gPiAKPiA+IE9uIFNhdCwgMjAxOS0xMC0yNiBhdCAwOTo1NiArMDgwMCwgemhh
bmd4aWFveHUgKEEpIHdyb3RlOgo+ID4gPiBIaSBhbGwsIHdoZW4gSSAnbWtmcy5leHQ0JyBvbiB0
aGUgZG16IGRldmljZSBiYXNlZCBvbiAxMFQgc21yIGRpc2ssCj4gPiA+IGl0IHRha2VzIG1vcmUg
dGhhbiAxMCBob3VycyBhZnRlciBhcHBseSA3NWQ2NmZmYjQ4ZWZiMyAoImRtIHpvbmVkOgo+ID4g
PiBwcm9wZXJseSBoYW5kbGUgYmFja2luZyBkZXZpY2UgZmFpbHVyZSIpLgo+ID4gPiAKPiA+ID4g
QWZ0ZXIgZGVsZXRlIHRoZSAnY2hlY2tfZXZlbnRzJyBpbiAnZG16X2JkZXZfaXNfZHlpbmcnLCBp
dCBqdXN0Cj4gPiA+IHRha2UgbGVzcyB0aGFuIDEyIG1pbnMuCj4gPiA+IAo+ID4gPiBJIHRlc3Qg
aXQgYmFzZWQgb24gNC4xOSBicmFuY2guCj4gPiA+IE11c3Qgd2UgZG8gdGhlICdjaGVja19ldmVu
dHMnIGF0IG1hcHBpbmcgcGF0aCwgcmVjbGFpbSBvciBtZXRhZGF0YSBJL08/Cj4gPiA+IAo+ID4g
PiBUaGFua3MuCj4gPiA+IAoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhh
dC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

