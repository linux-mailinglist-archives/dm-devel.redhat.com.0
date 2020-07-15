Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A2B6322083C
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:09:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-wkJPErUwOYeKS0LoPhB4Mw-1; Wed, 15 Jul 2020 05:09:55 -0400
X-MC-Unique: wkJPErUwOYeKS0LoPhB4Mw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6C918A1DE0;
	Wed, 15 Jul 2020 09:09:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE0165C1BD;
	Wed, 15 Jul 2020 09:09:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E1BB180954D;
	Wed, 15 Jul 2020 09:09:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F99WrK003287 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:09:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28C21207B2C2; Wed, 15 Jul 2020 09:09:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2007D207B2B8
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:09:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1CB41012444
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:09:28 +0000 (UTC)
Received: from mx2.suse.de (195.135.220.15 [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-289-wP3FyoS9MZKh01I6G9hc0g-1;
	Wed, 15 Jul 2020 05:09:26 -0400
X-MC-Unique: wP3FyoS9MZKh01I6G9hc0g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 64704AF5A;
	Wed, 15 Jul 2020 09:09:28 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200715081752.28130-1-hare@suse.de>
	<CY4PR04MB37511C00F22BDC73456FC252E77E0@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=hare@suse.de; prefer-encrypt=mutual; keydata=
	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
	azzYF4VRJsdl+d0MCaSy8mUh
Message-ID: <a2aac870-d8a1-ab95-0c6e-b4e474f62ae9@suse.de>
Date: Wed, 15 Jul 2020 11:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB37511C00F22BDC73456FC252E77E0@CY4PR04MB3751.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06F99WrK003287
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm zoned: update atime for new buffer zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gNy8xNS8yMCAxMDo0OSBBTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4gT24gMjAyMC8wNy8x
NSAxNzoxOCwgSGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBXaGVuIGEgbmV3IGJ1ZmZlciB6b25l
IGlzIGFsbG9jYXRlZCBpbiBkbXpfaGFuZGxlX2J1ZmZlcmVkX3dyaXRlKCkKPj4gd2Ugc2hvdWxk
IHVwZGF0ZSB0aGUgJ2F0aW1lJyB0byBpbmZvcm0gcmVjbGFpbSB0aGF0IHRoaXMgem9uZSBoYXMK
Pj4gYmVlbiBhY2Nlc3NlZC4KPj4gT3RoZXJ3aXNlIHdlIGVuZCB1cCB3aXRoIHRoZSBwYXRob2xv
Z2ljYWwgY2FzZSB3aGVyZSB0aGUgZmlyc3Qgd3JpdGUKPj4gYWxsb2NhdGVzIGEgbmV3IGJ1ZmZl
ciB6b25lLCBidXQgdGhlIG5leHQgd3JpdGUgd2lsbCBzdGFydCByZWNsYWltCj4+IGJlZm9yZSBw
cm9jZXNzaW5nIHRoZSBiaW8uIEFzIHRoZSBhdGltZSBpcyBub3Qgc2V0IHJlY2xhaW0gZGVjbGFy
ZXMKPj4gdGhlIHN5c3RlbSBpZGxlIGFuZCByZWNsYWltcyB0aGUgem9uZS4gVGhlbiB0aGUgd3Jp
dGUgd2lsbCBiZSBwcm9jZXNzZWQKPj4gYW5kIHJlLWFsbG9jYXRlIHRoZSB2ZXJ5IHNhbWUgem9u
ZSBhZ2FpbjsgdGhpcyByZXBlYXRzIGZvciBldmVyeQo+PiBjb25zZWN1dGl2ZSB3cml0ZSwgbWFr
aW5nIGZvciBhIF92ZXJ5XyBzbG93IG1rZnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhhbm5lcyBS
ZWluZWNrZSA8aGFyZUBzdXNlLmRlPgo+PiAtLS0KPj4gIGRyaXZlcnMvbWQvZG0tem9uZWQtdGFy
Z2V0LmMgfCAzICsrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS16b25lZC10YXJnZXQuYyBiL2RyaXZlcnMvbWQvZG0t
em9uZWQtdGFyZ2V0LmMKPj4gaW5kZXggY2Y5MTUwMDljMzA2Li5iMzJkMzdiZWYxNGYgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvbWQvZG0tem9uZWQtdGFyZ2V0LmMKPj4gKysrIGIvZHJpdmVycy9t
ZC9kbS16b25lZC10YXJnZXQuYwo+PiBAQCAtMjk3LDYgKzI5Nyw5IEBAIHN0YXRpYyBpbnQgZG16
X2hhbmRsZV9idWZmZXJlZF93cml0ZShzdHJ1Y3QgZG16X3RhcmdldCAqZG16LAo+PiAgCWlmIChk
bXpfaXNfcmVhZG9ubHkoYnpvbmUpKQo+PiAgCQlyZXR1cm4gLUVST0ZTOwo+PiAgCj4+ICsJLyog
VGVsbCByZWNsYWltIHdlJ3JlIGRvaW5nIHNvbWUgd29yayBoZXJlICovCj4+ICsJZG16X3JlY2xh
aW1fYmlvX2FjYyhiem9uZS0+ZGV2LT5yZWNsYWltKTsKPj4gKwo+PiAgCS8qIFN1Ym1pdCB3cml0
ZSAqLwo+PiAgCXJldCA9IGRtel9zdWJtaXRfYmlvKGRteiwgYnpvbmUsIGJpbywgY2h1bmtfYmxv
Y2ssIG5yX2Jsb2Nrcyk7Cj4+ICAJaWYgKHJldCkKPiAKPiBUaGlzIGlzIHdpdGhvdXQgYSBjYWNo
ZSBkZXZpY2UsIHJpZ2h0ID8gT3RoZXJ3aXNlLCBzaW5jZSB0aGUgY2FjaGUgZGV2aWNlIGhhcyBu
bwo+IHJlY2xhaW0sIGl0IHdvdWxkIG5vdCBtYWtlIG11Y2ggc2Vuc2UuCj4gCj4gSW4gZmFjdCwg
SSB0aGluayB0aGF0IHRoZSBhdGltZSB0aW1lc3RhbXAgYmVpbmcgYXR0YWNoZWQgdG8gZWFjaCBk
ZXZpY2UgcmVjbGFpbQo+IHN0cnVjdHVyZSBpcyBhIHByb2JsZW0uIFdlIGRvIG5vdCBuZWVkIHRo
YXQgc2luY2Ugd2UgYWx3YXlzIHRyaWdnZXIgcmVjbGFpbSBmb3IKPiBhbGwgZHJpdmVzLiBXZSBv
bmx5IHdhbnQgdG8gc2VlIGlmIHRoZSB0YXJnZXQgaXMgYnVzeSBvciBub3QsIHNvIGF0aW1lIHNo
b3VsZCBiZQo+IGF0dGFjaGVkIHRvIHN0cnVjdCBkbXpfbWV0YWRhdGEuCj4gCj4gVGhhdCB3aWxs
IHNpbXBsaWZ5IHRoaW5ncyBzaW5jZSB3ZSB3aWxsIG5vdCBuZWVkIHRvIGNhcmUgYWJvdXQgd2hp
Y2ggem9uZS93aGljaAo+IGRldmljZSBpcyBiZWluZyBhY2Nlc3NlZCB0byB0cmFjayBhY3Rpdml0
eS4gV2UgY2FuIGp1c3QgaGF2ZToKPiAKPiAJZG16X3JlY2xhaW1fYmlvX2FjYyhkbXotPm1ldGFk
YXRhKTsKPiAKPiBUaG91Z2h0cyA/Cj4gCldlbGwsIEkgbWlnaHQgYmUgb2ZmIHRoZSBtYXJrIHdp
dGggdGhpcyBwYXRjaCwgYnV0IEkgZGlkIHJ1biBpbnRvIHRoZQp0aGUgbWVudGlvbmVkIHBhdGhv
bG9naWNhbCBiZWhhdmlvdXI7IHRoZXJlIHdhcyBleGFjdGx5IF9vbmVfIHpvbmUKY2FjaGVkLCBh
bGwgSS9PIHdhcyBnb2luZyBpbnRvIHRoYXQgem9uZSwgYW5kIHJlY2xhaW0gKHNlZW1lZCkgdG8g
YmUKYnVzeSB3aXRoIHRoYXQgdmVyeSB6b25lLgpUaGUgbGF0dGVyIGlzIGFjdHVhbGx5IGNvbmpl
Y3R1cmUsIGFzIEkgZGlkIF9ub3RfIGdldCBhbnkgbWVzc2FnZXMgZnJvbQp0aGUgcmVjbGFpbSBv
biB0aGF0IGRldmljZS4KSSd2ZSBzZWVuIGlkbGUgbWVzc2FnZXMgZnJvbSByZWNsYWltIG9uIHRo
ZSBvdGhlciBkZXZpY2VzLCBidXQgcmVjbGFpbQpmcm9tIG9uZSBkZXZpY2Ugd2FzIHN1c3BpY2lv
dXNseSBzaWxlbnQuCkFuZCBJL08gd2VudCB0aHJvdWdoLCBidXQgX2RlYWRfIHNsb3cuIEFsbCB3
cml0ZXMsIG1pbmQgKHRoYXQgd2FzIGR1cmluZwpta2ZzIHRpbWUpLCBzbyBJIGdhdGhlcmVkIGl0
IG1pZ2h0IGJlIGR1ZSB0byB0aGUgYXRpbWUgYWNjb3VudGluZyBub3QKYmVpbmcgZG9uZSBjb3Jy
ZWN0bHkuCgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UJCSAgICAgICAg
ICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZQkJCSAgICAgICAgICAgICAg
ICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJn
KSwgR0Y6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1k
ZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
bS1kZXZlbA==

