Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6157A29D
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BB853087958;
	Tue, 30 Jul 2019 07:55:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17FC910016E9;
	Tue, 30 Jul 2019 07:55:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C7C51800202;
	Tue, 30 Jul 2019 07:55:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TKAECk024770 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 16:10:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3270D60623; Mon, 29 Jul 2019 20:10:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBF2660A98;
	Mon, 29 Jul 2019 20:10:09 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-oln040092070051.outbound.protection.outlook.com [40.92.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E81FC81DE1;
	Mon, 29 Jul 2019 20:10:07 +0000 (UTC)
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
	(10.152.20.51) by DB5EUR03HT182.eop-EUR03.prod.protection.outlook.com
	(10.152.20.207) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2052.18;
	Mon, 29 Jul 2019 20:10:06 +0000
Received: from VI1P191MB0014.EURP191.PROD.OUTLOOK.COM (10.152.20.54) by
	DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2052.18 via Frontend Transport; Mon, 29 Jul 2019 20:10:06 +0000
Received: from VI1P191MB0014.EURP191.PROD.OUTLOOK.COM
	([fe80::e99c:132b:63d5:38bb]) by VI1P191MB0014.EURP191.PROD.OUTLOOK.COM
	([fe80::e99c:132b:63d5:38bb%10]) with mapi id 15.20.2115.005;
	Mon, 29 Jul 2019 20:10:05 +0000
From: =?utf-8?B?Q8OpZHJpYyBEZWxtYXM=?= <cedricde@outlook.fr>
To: Mike Snitzer <snitzer@redhat.com>
Thread-Topic: snapshot-origin with no snapshot may lead to BUG() in bio_split()
Thread-Index: AQHVPtXd6hciaGeZOEuQ/2U3g7tFtqbhuNwAgABcroA=
Date: Mon, 29 Jul 2019 20:10:05 +0000
Message-ID: <VI1P191MB00146C6F0225309076BE5A38B2DD0@VI1P191MB0014.EURP191.PROD.OUTLOOK.COM>
References: <VI1P191MB0014912D317079AAF7F3870BAECA0@VI1P191MB0014.EURP191.PROD.OUTLOOK.COM>
	<20190729143820.GA8423@redhat.com>
In-Reply-To: <20190729143820.GA8423@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0088.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:100:18::28) To VI1P191MB0014.EURP191.PROD.OUTLOOK.COM
	(2603:10a6:800:a4::13)
x-incomingtopheadermarker: OriginalChecksum:7C5ED321B7BBD45294A5FAB384BCA75DD19AF9D4F616CAA94D4DA570349700CA;
	UpperCasedChecksum:D6D1EBF7B3D263F2C082A9F78FC1A1EDE97850D5E50A39CBBF2A8737A2860612;
	SizeAsReceived:7536; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [D42Rs7LHnRHGU8nG/53Kq/fa3QNiLnb6Kj5ig1r9Gq0L2S1I+d8Po0fh5ekpqgmj]
x-microsoft-original-message-id: <1339201f-d11d-4367-de41-89319da078bf@outlook.fr>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:DB5EUR03HT182; 
x-ms-traffictypediagnostic: DB5EUR03HT182:
x-microsoft-antispam-message-info: hpxW8BIIjPiG7wHGxF8MecKg3WzYeMDIWbs+p31Tp2EBd81i1gMIt4B9Y4XyljXKaf9m9aC4eUfBKpR/xCgZ/x29PUjq4xaju+ThBzS0JeuJEjACWjIpc1gCIuVWaNitrxZRFbNJu+LNrGnvRZd/lV8nhYzACGAl9OeWg+YUIW6s0xK6WhZK1poznP4LI/ZD
Content-ID: <709E3904027011439CF7F8AA77AF7AAD@EURP191.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 75817c50-2a73-44e5-56b9-08d71460bf27
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 20:10:05.5499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT182
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Mon, 29 Jul 2019 20:10:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 29 Jul 2019 20:10:08 +0000 (UTC) for IP:'40.92.70.51'
	DOMAIN:'mail-oln040092070051.outbound.protection.outlook.com'
	HELO:'EUR03-AM5-obe.outbound.protection.outlook.com'
	FROM:'cedricde@outlook.fr' RCPT:''
X-RedHat-Spam-Score: 0  (FREEMAIL_FROM, FROM_EXCESS_BASE64, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS, SPF_PASS) 40.92.70.51
	mail-oln040092070051.outbound.protection.outlook.com
	40.92.70.51
	mail-oln040092070051.outbound.protection.outlook.com
	<cedricde@outlook.fr>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6TKAECk024770
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jul 2019 03:55:28 -0400
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] snapshot-origin with no snapshot may lead to BUG()
	in bio_split()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 30 Jul 2019 07:55:48 +0000 (UTC)

TGUgMjkvMDcvMjAxOSDDoCAxNjozOCwgTWlrZSBTbml0emVyIGEgw6ljcml0wqA6Cj4gT24gU2F0
LCBKdWwgMjAgMjAxOSBhdCAgNToyNmFtIC0wNDAwLAo+IEPDqWRyaWMgRGVsbWFzIDxjZWRyaWNk
ZUBvdXRsb29rLmZyPiB3cm90ZToKPiAKPj4gSGVsbG8sCj4+Cj4+IEkgZW5jb3VudGVyZWQgYSBi
dWcgd2hpbGUgd29ya2luZyB3aXRoIERNIHNuYXBzaG90IHRhcmdldHM6IGhhdmluZyBhCj4+IHNu
YXBzaG90LW9yaWdpbiB0YXJnZXQgd2l0aCBhbGwgc25hcHNob3RzIHJlbW92ZWQgbWF5IGxlYWQg
dG8KPj4gQlVHX09OKHNlY3RvcnMgPD0gMCkgaW4gZnVuY3Rpb24gYmlvX3NwbGl0KCkgKGZpbGUg
YmxvY2svYmlvLmMpLgo+IAo+IC4uLgo+ICAgCj4+IFN0ZXBzIHRvIHJlcHJvZHVjZToKPj4gdHJ1
bmNhdGUgLXMgNTAwTSBvcmlnaW4uYmluCj4+IHRydW5jYXRlIC1zIDUwTSBzbmFwc2hvdC5iaW4K
Pj4gbG9zZXR1cCAvZGV2L2xvb3AwIG9yaWdpbi5iaW4KPj4gbG9zZXR1cCAvZGV2L2xvb3AxIHNu
YXBzaG90LmJpbgo+PiBta2ZzLmV4dDQgL2Rldi9sb29wMAo+PiBkbXNldHVwIGNyZWF0ZSBzbmFw
IC0tdGFibGUgIjAgJChibG9ja2RldiAtLWdldHN6IC9kZXYvbG9vcDApIHNuYXBzaG90IC9kZXYv
bG9vcDAgL2Rldi9sb29wMSBOIDI1NiIKPj4gZG1zZXR1cCBjcmVhdGUgb3JpZyAtLXRhYmxlICIw
ICQoYmxvY2tkZXYgLS1nZXRzeiAvZGV2L2xvb3AwKSBzbmFwc2hvdC1vcmlnaW4gL2Rldi9sb29w
MCIKPj4gIyB1c2UgL2Rldi9tYXBwZXIvc25hcCBhbmQgL2Rldi9tYXBwZXIvb3JpZyB0aGVuIHVu
bW91bnQgdGhlbQo+PiBkbXNldHVwIHN1c3BlbmQgb3JpZwo+PiBkbXNldHVwIHJlbW92ZSBzbmFw
Cj4+IGRtc2V0dXAgcmVzdW1lIG9yaWcKPj4gZTJmc2NrIC9kZXYvbWFwcGVyL29yaWcKPj4gIyBC
VUcgaW4gYmlvX3NwbGl0KCkKPj4KPj4gU3RlcHMgdG8gcmVwcm9kdWNlICh0aGUgZXhwcmVzcyB3
YXkpOgo+PiB0cnVuY2F0ZSAtcyA1MDBNIG9yaWdpbi5iaW4KPj4gbG9zZXR1cCAvZGV2L2xvb3Aw
IG9yaWdpbi5iaW4KPj4gbWtmcy5leHQ0IC9kZXYvbG9vcDAKPj4gZG1zZXR1cCBjcmVhdGUgb3Jp
ZyAtLXRhYmxlICIwICQoYmxvY2tkZXYgLS1nZXRzeiAvZGV2L2xvb3AwKSBzbmFwc2hvdC1vcmln
aW4gL2Rldi9sb29wMCIKPj4gZTJmc2NrIC9kZXYvbWFwcGVyL29yaWcKPj4gIyBCVUcgaW4gYmlv
X3NwbGl0KCkKPj4KPj4KPj4gSSBsb29rZWQgYXQgdGhlIGNvZGUgYW5kIHRvIG15IG9waW5pb24g
dGhlIHByb2JsZW0gY29tZXMgZnJvbSBmdW5jdGlvbiBvcmlnaW5fbWFwIChmaWxlIGRyaXZlcnMv
bWQvZG0tc25hcC5jKS4gSW4gdGhlIGZvbGxvd2luZyBjb2RlOgo+Pgo+PiBzdGF0aWMgaW50IG9y
aWdpbl9tYXAoc3RydWN0IGRtX3RhcmdldCAqdGksIHN0cnVjdCBiaW8gKmJpbykKPj4gewo+PiAJ
c3RydWN0IGRtX29yaWdpbiAqbyA9IHRpLT5wcml2YXRlOwo+PiAJdW5zaWduZWQgYXZhaWxhYmxl
X3NlY3RvcnM7Cj4+IC4uLgo+PiAJYXZhaWxhYmxlX3NlY3RvcnMgPSBvLT5zcGxpdF9ib3VuZGFy
eSAtCj4+IAkJKCh1bnNpZ25lZCliaW8tPmJpX2l0ZXIuYmlfc2VjdG9yICYgKG8tPnNwbGl0X2Jv
dW5kYXJ5IC0gMSkpOwo+Pgo+PiAJaWYgKGJpb19zZWN0b3JzKGJpbykgPiBhdmFpbGFibGVfc2Vj
dG9ycykKPj4gCQlkbV9hY2NlcHRfcGFydGlhbF9iaW8oYmlvLCBhdmFpbGFibGVfc2VjdG9ycyk7
Cj4+IC4uLgo+Pgo+PiB3aGVuIHRoZXJlIGlzIG5vIHNuYXBzaG90LCBzcGxpdF9ib3VuZGFyeSBp
cyAwIHNvIGF2YWlsYWJsZV9zZWN0b3JzIGdldHMgYW4gaW52YWxpZCB2YWx1ZS4KPj4gVGhlIHBy
b2JsZW0gbm8gbW9yZSBhcHBlYXJzIGlmIHRoZSBmdW5jdGlvbiBvcmlnaW5fbWFwIGVhcmx5IGV4
aXRzIHVzaW5nIHRoZSBmb2xsb3dpbmcgcGF0Y2g6Cj4+IC0tLSBhL2RyaXZlcnMvbWQvZG0tc25h
cC5jICAgICAgMjAxOS0wNy0xNCAwODoxMToyMy4wMDAwMDAwMDAgKzAyMDAKPj4gKysrIGIvZHJp
dmVycy9tZC9kbS1zbmFwLmMgICAgICAyMDE5LTA3LTE5IDE3OjUwOjE1Ljg3NjAwMDAwMCArMDIw
MAo+PiBAQCAtMjMyOCw2ICsyMzI4LDkgQEAgc3RhdGljIGludCBvcmlnaW5fbWFwKHN0cnVjdCBk
bV90YXJnZXQgKgo+PiAgICAgICAgICBpZiAoYmlvX2RhdGFfZGlyKGJpbykgIT0gV1JJVEUpCj4+
ICAgICAgICAgICAgICAgICAgcmV0dXJuIERNX01BUElPX1JFTUFQUEVEOwo+PiAgIAo+PiArICAg
ICAgIGlmICh1bmxpa2VseSghby0+c3BsaXRfYm91bmRhcnkpKQo+PiArICAgICAgICAgICAgICAg
cmV0dXJuIGRvX29yaWdpbihvLT5kZXYsIGJpbyk7Cj4+ICsKPj4gICAgICAgICAgYXZhaWxhYmxl
X3NlY3RvcnMgPSBvLT5zcGxpdF9ib3VuZGFyeSAtCj4+ICAgICAgICAgICAgICAgICAgKCh1bnNp
Z25lZCliaW8tPmJpX2l0ZXIuYmlfc2VjdG9yICYgKG8tPnNwbGl0X2JvdW5kYXJ5IC0gMSkpOwo+
PiAgIAo+IAo+IFdoZW4gdGhlcmUgaXMgbm8gc25hcHNob3Qgc25hcHNob3Qtb3JpZ2luIHNob3Vs
ZG4ndCBiZSB1c2VkLgo+IAo+IFNvIHlvdXIgcGF0Y2ggbWF5IGZpeCB0aGUgQlVHKCkgeW91IGhp
dCBidXQgaXQgZG9lc24ndCBnbyBmYXIgZW5vdWdoCj4gd2l0aCB3YXJuaW5nIHRoZSB1c2VyIHRo
YXQgdGhleSd2ZSBlbnRlcmVkICJ1bnN1cHBvcnRlZCIgdGVycml0b3J5Lgo+IAo+IFJhdGhlciB0
aGFuIGNhbGwgZG9fb3JpZ2luKCkgSSdtIGluY2xpbmVkIHRvCj4gRE1FUlJfTElNSVQoIi4uLiB1
bnN1cHBvcnRlZCAuLi4iKSBhbmQgZXJyb3IgdGhlIElPLgo+IAo+IFdoYXQgYXJlIHlvdXIgcmVh
c29ucyBmb3Igd2FudGluZyB0byBzaWxlbnRseSBhbGxvdyB0aGlzIHVuc3VwcG9ydGVkCj4gdXNl
Y2FzZT8KPiAKPiBNaWtlCj4gCgpJIGRpZG4ndCBrbm93IHRoYXQgdGhpcyB1c2VjYXNlIGlzIHVu
c3VwcG9ydGVkLCAKRG9jdW1lbnRhdGlvbi9kZXZpY2UtbWFwcGVyL3NuYXBzaG90LnR4dCBsZXRz
IG1lIHRoaW5rIHRoYXQgZXZlbiBpZiB0aGUgCm9yaWdpbiBkZXZpY2Ugc2hvdWxkIGhhdmUgb25l
IG9yIG1vcmUgc25hcHNob3RzIGJhc2VkIG9uIGl0LCBpdCBpcyBub3QgCm1hbmRhdG9yeS4gSWYg
dGhpcyBjb25maWd1cmF0aW9uIGlzIG5vdCBzdXBwb3J0ZWQsIHlvdSBhcmUgYWJzb2x1dGVseSAK
cmlnaHQsIGl0IGlzIGJldHRlciB0byByYWlzZSBhbiBlcnJvci4KCkkgdGhpbmsgaXQgY291bGQg
YmUgbmljZSB0byBiZSBhYmxlIHRvIHBlcm1hbmVudGx5IHVzZSBhIHNuYXBzaG90LW9yaWdpbiAK
ZGV2aWNlIGFuZCB0byBjcmVhdGUgc25hcHNob3RzIG9ubHkgb24gZGVtYW5kICh3aXRob3V0IGZv
cmdldHRpbmcgdG8gCnN1c3BlbmQgdGhlIG9yaWdpbiBkZXZpY2UgZHVyaW5nIHNuYXBzaG90IGNy
ZWF0aW9uKSBob3dldmVyIGFueSAKY29ycmVjdGlvbiBvciBlcnJvciBub3RpZmljYXRpb24gaXMg
T0sgZm9yIG1lLgoKQ8OpZHJpYwoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJl
ZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs
