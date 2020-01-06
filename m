Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4B5130FA9
	for <lists+dm-devel@lfdr.de>; Mon,  6 Jan 2020 10:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578303644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z0Q0th7I3D04AE4jk6rZdR+Wk5260CQx2BePhcgfm5k=;
	b=e1bv1wl2LKdDAuHScP1gX3wt807dgUPVNfmLpO2Tascsa15tusJdwkmZ6kEv7aHjQrJ/MA
	Wt4Xng8bL4vbDeTbO2+4Rtkgx08wRzKdGwGx/SoZylrZfAMCxk3yeRHm0cxiTfTWjj7U4a
	q9xC0s0u0wiw13m98JtmifDklkltwrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-44DdA61kPwGYFED6BgDEvQ-1; Mon, 06 Jan 2020 04:40:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C81A58024D1;
	Mon,  6 Jan 2020 09:40:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 237665D9D6;
	Mon,  6 Jan 2020 09:40:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0629618089C8;
	Mon,  6 Jan 2020 09:40:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00630uF7004638 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 5 Jan 2020 22:00:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A9BCD2166B2A; Mon,  6 Jan 2020 03:00:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A46922166B29
	for <dm-devel@redhat.com>; Mon,  6 Jan 2020 03:00:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98D2480206A
	for <dm-devel@redhat.com>; Mon,  6 Jan 2020 03:00:54 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
	(mail-eopbgr1310053.outbound.protection.outlook.com [40.107.131.53])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-OpH51jg8M-6JvJJmKEQf-Q-1; Sun, 05 Jan 2020 22:00:50 -0500
Received: from SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13) by
	SG2PR04MB3676.apcprd04.prod.outlook.com (2603:1096:4:96::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2602.14; Mon, 6 Jan 2020 03:00:43 +0000
Received: from PU1APC01FT056.eop-APC01.prod.protection.outlook.com
	(2a01:111:f400:7ebd::204) by SG2PR04CA0151.outlook.office365.com
	(2603:1096:4::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10 via
	Frontend Transport; Mon, 6 Jan 2020 03:00:43 +0000
Received: from mail.transsion.com (27.115.63.14) by
	PU1APC01FT056.mail.protection.outlook.com (10.152.253.98) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 03:00:42 +0000
Received: from SH-EXC-MX01.transsion.com (10.150.2.41) by
	SH-EXC-MX01.transsion.com (10.150.2.41) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 6 Jan 2020 11:00:31 +0800
Received: from SH-EXC-MX01.transsion.com ([fe80::a9c9:4b06:6245:846c]) by
	SH-EXC-MX01.transsion.com ([fe80::a9c9:4b06:6245:846c%13]) with mapi id
	15.01.1591.008; Mon, 6 Jan 2020 11:00:31 +0800
From: =?utf-8?B?eGlhbnJvbmcuemhvdSjlkajlhYjojaMp?=
	<xianrong.zhou@transsion.com>
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: Reply: [dm-devel] [PATCH] dm-verity: unnecessary data blocks
	that need not read hash blocks
Thread-Index: AdXEPSSOvdMQQOseTsKjLS6M4G5zpw==
Date: Mon, 6 Jan 2020 03:00:30 +0000
Message-ID: <f6f161812916479bbe23ab7c8fe9ea32@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.151.93]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:27.115.63.14; IPV:; CTRY:CN; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(396003)(346002)(39850400004)(136003)(376002)(1110001)(339900001)(199004)(189003)(2906002)(85182001)(26005)(186003)(70586007)(2616005)(70206006)(24736004)(7696005)(8936002)(5660300002)(4326008)(36756003)(81156014)(108616005)(81166006)(426003)(356004)(86362001)(478600001)(316002)(336012)(54906003)(6916009)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SG2PR04MB3676;
	H:mail.transsion.com; FPR:; SPF:Fail; LANG:en;
	PTR:mail.reallytek.com; A:1; MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72fe767c-ca3c-4274-8861-08d792549e3b
X-MS-TrafficTypeDiagnostic: SG2PR04MB3676:
X-Microsoft-Antispam-PRVS: <SG2PR04MB367659E141A3DC661C4ACC05F83C0@SG2PR04MB3676.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0274272F87
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MrEheryBj0w5d2THTtITcIEdlY1RmqXaBYmKN6L6Gf/kE8PZw+FRwv0TvTDeAm4sleqOvZ+sskDoh+6ept0jmlszV7nYHQh2TcRKvqqam6eIL/CARwx7BM7HStVmhh1JZXzaXvQwIOqCn5dR3pNzNfw9q/a+v5L8TQRY+itS9t01okN5nEBVYSUKJ/iK4sWOadVTpaETVpWtiDUhFZjtlBhRdlVlVUCepkOQzVc0OaPSOB4C5abw+fA6PDoEVsb3oXd6JJ0+kLI8Q9bLA8jhD651rgwt9mmWvGjOsbvIRX7iXtzGZKWjmBN7UAzr3YmPTA4T+YlrX86qAiGTqZDz2i9QfF6Hg2O1l3YX8zATvU5xRqZTNJKNrvvRvRdejsZKD0USCZLcma2YfkZ2pd4zZC+D9RyBl7Au2ERdJhENcg/wK4JceJiYeD0ZrcHERFTI
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2020 03:00:42.3552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fe767c-ca3c-4274-8861-08d792549e3b
X-MS-Exchange-CrossTenant-Id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2; Ip=[27.115.63.14];
	Helo=[mail.transsion.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3676
X-MC-Unique: OpH51jg8M-6JvJJmKEQf-Q-1
X-MC-Unique: 44DdA61kPwGYFED6BgDEvQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00630uF7004638
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Jan 2020 04:40:14 -0500
Cc: =?utf-8?B?aGFpemhvdS5zb25nKOWui+a1t+iInyk=?= <haizhou.song@transsion.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	=?utf-8?B?d2FuYmluLndhbmco5rGq5LiH5paMKQ==?= <wanbin.wang@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?eXVhbmppb25nLmdhbyjpq5jmuIrngq8p?= <yuanjiong.gao@transsion.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	=?utf-8?B?cnV4aWFuLmZlbmco5Yav5YSS5ai0KQ==?=
	<ruxian.feng@transsion.com>, "agk@redhat.com" <agk@redhat.com>
Subject: [dm-devel] Reply: [PATCH] dm-verity: unnecessary data blocks that
 need not read hash blocks
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMTA6NTA6MjZBTSAtMDgwMCwgRXJpYyBCaWdnZXJzIHdy
b3RlOgo+IE9uIE1vbiwgRGVjIDE2LCAyMDE5IGF0IDAyOjAyOjMzQU0gKzAwMDAsIHhpYW5yb25n
Lnpob3Uo5ZGo5YWI6I2jKSB3cm90ZToKPiA+IGhleSBFcmljOgo+ID4gCj4gPiBPbiBXZWQsIERl
YyAxMSwgMjAxOSBhdCAxMTozMjo0MEFNICswODAwLCB6aG91IHhpYW5yb25nIHdyb3RlOgo+ID4g
PiBGcm9tOiAieGlhbnJvbmcuemhvdSIgPHhpYW5yb25nLnpob3VAdHJhbnNzaW9uLmNvbT4KPiA+
ID4gCj4gPiA+IElmIGNoZWNrX2F0X21vc3Rfb25jZSBlbmFibGVkLCBqdXN0IGxpa2UgdmVyaXR5
IHdvcmsgdGhlIAo+ID4gPiBwcmVmZXRjaGluZyB3b3JrIHNob3VsZCBjaGVjayBmb3IgZGF0YSBi
bG9jayBiaXRtYXAgZmlyc3RseSBiZWZvcmUgCj4gPiA+IHJlYWRpbmcgaGFzaCBibG9jayBhcyB3
ZWxsLiBTa2lwIGJpdC1zZXQgZGF0YSBibG9ja3MgZnJvbSBib3RoIAo+ID4gPiBlbmRzIG9mIGRh
dGEgYmxvY2sgcmFuZ2UgYnkgdGVzdGluZyB0aGUgdmFsaWRhdGVkIGJpdG1hcC4gVGhpcyBjYW4g
Cj4gPiA+IHJlZHVjZSB0aGUgYW1vdW50cyBvZiBkYXRhIGJsb2NrcyB3aGljaCBuZWVkIHRvIHJl
YWQgaGFzaCBibG9ja3MuCj4gPiA+IAo+ID4gPiBMYXVuY2hpbmcgOTEgYXBwcyBldmVyeSAxNXMg
YW5kIHJlcGVhdCAyMSByb3VuZHMgb24gQW5kcm9pZCBRLgo+ID4gPiBJbiBwcmVmZXRjaGluZyB3
b3JrIHdlIGNhbiBsZXQgb25seSAyNjAyLzM2MDMxMiA9IDAuNzIlIGRhdGEgCj4gPiA+IGJsb2Nr
cyByZWFsbHkgbmVlZCB0byByZWFkIGhhc2ggYmxvY2tzLgo+ID4gPiAKPiA+ID4gQnV0IHRoZSBy
ZWR1Y2VkIGRhdGEgYmxvY2tzIHJhbmdlIHdvdWxkIGJlIGVubGFyZ2VkIGFnYWluIGJ5IAo+ID4g
PiBkbV92ZXJpdHlfcHJlZmV0Y2hfY2x1c3RlciBsYXRlci4KPiA+ID4gCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IHhpYW5yb25nLnpob3UgPHhpYW5yb25nLnpob3VAdHJhbnNzaW9uLmNvbT4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogeXVhbmppb25nLmdhbyA8eXVhbmppb25nLmdhb0B0cmFuc3Npb24uY29t
Pgo+ID4gPiBUZXN0ZWQtYnk6IHJ1eGlhbi5mZW5nIDxydXhpYW4uZmVuZ0B0cmFuc3Npb24uY29t
Pgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbWQvZG0tdmVyaXR5LXRhcmdldC5jIHwgMTYgKysr
KysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPiA+
ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLXZlcml0eS10YXJnZXQuYyAKPiA+
ID4gYi9kcml2ZXJzL21kL2RtLXZlcml0eS10YXJnZXQuYyBpbmRleCA0ZmIzM2U3NTYyYzUuLjdi
OGViNzU0YzBiNgo+ID4gPiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tZC9kbS12ZXJpdHkt
dGFyZ2V0LmMKPiA+ID4gKysrIGIvZHJpdmVycy9tZC9kbS12ZXJpdHktdGFyZ2V0LmMKPiA+ID4g
QEAgLTU4MSw2ICs1ODEsMjIgQEAgc3RhdGljIHZvaWQgdmVyaXR5X3ByZWZldGNoX2lvKHN0cnVj
dCB3b3JrX3N0cnVjdCAqd29yaykKPiA+ID4gIAlzdHJ1Y3QgZG1fdmVyaXR5ICp2ID0gcHctPnY7
Cj4gPiA+ICAJaW50IGk7Cj4gPiA+ICAKPiA+ID4gKwlpZiAodi0+dmFsaWRhdGVkX2Jsb2Nrcykg
ewo+ID4gPiArCQl3aGlsZSAocHctPm5fYmxvY2tzKSB7Cj4gPiA+ICsJCQlpZiAodW5saWtlbHko
IXRlc3RfYml0KHB3LT5ibG9jaywgdi0+dmFsaWRhdGVkX2Jsb2NrcykpKQo+ID4gPiArCQkJCWJy
ZWFrOwo+ID4gPiArCQkJcHctPmJsb2NrKys7Cj4gPiA+ICsJCQlwdy0+bl9ibG9ja3MtLTsKPiA+
ID4gKwkJfQo+ID4gPiArCQl3aGlsZSAocHctPm5fYmxvY2tzKSB7Cj4gPiA+ICsJCQlpZiAodW5s
aWtlbHkoIXRlc3RfYml0KHB3LT5ibG9jayArIHB3LT5uX2Jsb2NrcyAtIDEsCj4gPiA+ICsJCQkJ
di0+dmFsaWRhdGVkX2Jsb2NrcykpKQo+ID4gPiArCQkJCWJyZWFrOwo+ID4gPiArCQkJcHctPm5f
YmxvY2tzLS07Cj4gPiA+ICsJCX0KPiA+ID4gKwkJaWYgKCFwdy0+bl9ibG9ja3MpCj4gPiA+ICsJ
CQlyZXR1cm47Cj4gPiA+ICsJfQo+ID4gCj4gPiBUaGlzIGlzIGEgZ29vZCBpZGVhLCBidXQgc2hv
dWxkbid0IHRoaXMgbG9naWMgZ28gaW4KPiA+IHZlcml0eV9zdWJtaXRfcHJlZmV0Y2goKSBwcmlv
ciB0byB0aGUgc3RydWN0IGRtX3Zlcml0eV9wcmVmZXRjaF93b3JrIAo+ID4gYmVpbmcgYWxsb2Nh
dGVkPyAgVGhlbiBpZiBubyBwcmVmZWNoaW5nIGlzIG5lZWRlZCwgYWxsb2NhdGluZyBhbmQgCj4g
PiBzY2hlZHVsaW5nIHRoZSB3b3JrIG9iamVjdCBjYW4gYmUgc2tpcHBlZC4KPiA+IAo+ID4gRXJp
YywgRG8geW91IG1lYW4gaXQgaXMgbW9yZSBzdWl0YWJsZSBpbiBkbV9idWZpb19wcmVmZXRjaCB3
aGljaCBpcyAKPiA+IGNhbGxlZCBvbiBkaWZmZXJlbnQgcGF0aHMgZXZlbiB0aG91Z2ggcHJlZmVj
aGluZyBpcyBkaXNhYmxlZCA/Cj4gPiAKPiAKPiBObywgSSdtIHRhbGtpbmcgYWJvdXQgdmVyaXR5
X3N1Ym1pdF9wcmVmZXRjaCgpLiAgCj4gdmVyaXR5X3N1Ym1pdF9wcmVmZXRjaCgpIGFsbG9jYXRl
cyBhbmQgc2NoZWR1bGVzIGEgd29yayBvYmplY3QsIHdoaWNoIGV4ZWN1dGVzIHZlcml0eV9wcmVm
ZXRjaF9pbygpLgo+IElmIGFsbCBkYXRhIGJsb2NrcyBpbiB0aGUgSS9PIHJlcXVlc3Qgd2VyZSBh
bHJlYWR5IHZhbGlkYXRlZCwgdGhlcmUncyAKPiBubyBuZWVkIHRvIGFsbG9jYXRlIGFuZCBzY2hl
ZHVsZSB0aGUgcHJlZmV0Y2ggd29yay4KPiAKPiAtIEVyaWMKPiAKClVuZGVyc3RhbmQuIFRoYW5r
cy4KCkFyZSB5b3UgcGxhbm5pbmcgdG8gc2VuZCBhIG5ldyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2g/
CgotIEVyaWMKClNvcnJ5IGZvciBkZWxheWluZy4KClllcywgc28gSSBzaG91bGQgbW92ZSB0aGUg
bW9kaWZpY2F0aW9uIGludG8gdmVyaXR5X3N1Ym1pdF9wcmVmZXRjaCBhbmQgcGxhY2UgaXQgYmVm
b3JlIGttYWxsb2Mgd29yayBvYmplY3QuIElzIGl0IG9rPwoKLS0KZG0tZGV2ZWwgbWFpbGluZyBs
aXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2RtLWRldmVs

