Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA3B1D280C
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 08:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589438518;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ClBNRhgNtjzhXkSfDDL07U/HidpjL7K0r2K1Q6IhvLI=;
	b=VAqiTYPaYcOMl04GlFtaqJI7pIWv8u8tdo1bimKB79Q8PWELBL9NqMpKHGKS7+rLUWeBmF
	x1cMQM63hqS1RJgzCMBgJzXzSvIsa9e1KS8jrwao/ODox5SA65dpEX3HoC40oWcmkyhhey
	ygllE8jfkjytQws0Kf7bVGO/JCqa5mA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-y8aFv6huNOW36kctcQHtyw-1; Thu, 14 May 2020 02:41:55 -0400
X-MC-Unique: y8aFv6huNOW36kctcQHtyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 350BF461;
	Thu, 14 May 2020 06:41:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68F4D60BF1;
	Thu, 14 May 2020 06:41:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E01524E982;
	Thu, 14 May 2020 06:41:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E6fa8k030284 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 02:41:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D241012F76E; Thu, 14 May 2020 06:41:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1B17112321
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:41:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40926185A78B
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:41:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-80-H7bAiBdiNRaiHZJ1CyCpog-1;
	Thu, 14 May 2020 02:41:30 -0400
X-MC-Unique: H7bAiBdiNRaiHZJ1CyCpog-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 119F3ABD0;
	Thu, 14 May 2020 06:41:32 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200513070729.71461-1-hare@suse.de>
	<20200513070729.71461-3-hare@suse.de>
	<BY5PR04MB6900F36D4228D0FD0216AD61E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <a95309e9-c0d1-cd9e-4e93-c7fb52667b2d@suse.de>
Date: Thu, 14 May 2020 08:41:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900F36D4228D0FD0216AD61E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04E6fa8k030284
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/2] dm-zoned: split off random and cache
	zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xMy8yMCAyOjQ0IFBNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzA1LzEz
IDE2OjA3LCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+IEluc3RlYWQgb2YgZW11bGF0aW5nIHpv
bmVzIG9uIHRoZSByZWd1bGFyIGRpc2sgYXMgcmFuZG9tIHpvbmVzCj4+IHRoaXMgcGF0Y2ggYWRk
cyBhIG5ldyAnY2FjaGUnIHpvbmUgdHlwZS4KPj4gVGhpcyBhbGxvd3MgdXMgdG8gdXNlIHRoZSBy
YW5kb20gem9uZXMgb24gdGhlIHpvbmVkIGRpc2sgYXMKPj4gZGF0YSB6b25lcyAoaWYgY2FjaGUg
em9uZXMgYXJlIHByZXNlbnQpLCBhbmQgaW1wcm92ZXMgcGVyZm9ybWFuY2UKPj4gYXMgdGhlIHpv
bmVzIG9uIHRoZSAoc2xvd2VyKSB6b25lZCBkaXNrIGFyZSB0aGVuIG5ldmVyIHVzZWQKPj4gZm9y
IGNhY2hpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNl
LmRlPgo+PiAtLS0KWyAuLiBdCj4+IEBAIC0xODMwLDE3ICsxODYxLDE5IEBAIHN0YXRpYyB2b2lk
IGRtel93YWl0X2Zvcl9yZWNsYWltKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnptZCwgc3RydWN0IGRt
X3pvbmUgKnpvbmUpCj4+ICAgfQo+PiAgIAo+PiAgIC8qCj4+IC0gKiBTZWxlY3QgYSByYW5kb20g
d3JpdGUgem9uZSBmb3IgcmVjbGFpbS4KPj4gKyAqIFNlbGVjdCBhIGNhY2hlIG9yIHJhbmRvbSB3
cml0ZSB6b25lIGZvciByZWNsYWltLgo+PiAgICAqLwo+PiAgIHN0YXRpYyBzdHJ1Y3QgZG1fem9u
ZSAqZG16X2dldF9ybmRfem9uZV9mb3JfcmVjbGFpbShzdHJ1Y3QgZG16X21ldGFkYXRhICp6bWQp
Cj4+ICAgewo+PiAgIAlzdHJ1Y3QgZG1fem9uZSAqZHpvbmUgPSBOVUxMOwo+PiAgIAlzdHJ1Y3Qg
ZG1fem9uZSAqem9uZTsKPj4gKwlzdHJ1Y3QgbGlzdF9oZWFkICp6b25lX2xpc3QgPSAmem1kLT5t
YXBfcm5kX2xpc3Q7Cj4+ICAgCj4+IC0JaWYgKGxpc3RfZW1wdHkoJnptZC0+bWFwX3JuZF9saXN0
KSkKPj4gLQkJcmV0dXJuIEVSUl9QVFIoLUVCVVNZKTsKPj4gKwkvKiBJZiB3ZSBoYXZlIGNhY2hl
IHpvbmVzIHNlbGVjdCBmcm9tIHRoZSBjYWNoZSB6b25lIGxpc3QgKi8KPj4gKwlpZiAoem1kLT5u
cl9jYWNoZSkKPj4gKwkJem9uZV9saXN0ID0gJnptZC0+bWFwX2NhY2hlX2xpc3Q7Cj4+ICAgCj4+
IC0JbGlzdF9mb3JfZWFjaF9lbnRyeSh6b25lLCAmem1kLT5tYXBfcm5kX2xpc3QsIGxpbmspIHsK
Pj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHpvbmUsIHpvbmVfbGlzdCwgbGluaykgewo+PiAgIAkJ
aWYgKGRtel9pc19idWYoem9uZSkpCj4+ICAgCQkJZHpvbmUgPSB6b25lLT5iem9uZTsKPj4gICAJ
CWVsc2UKPj4gQEAgLTE4NTMsMTUgKzE4ODYsMjEgQEAgc3RhdGljIHN0cnVjdCBkbV96b25lICpk
bXpfZ2V0X3JuZF96b25lX2Zvcl9yZWNsYWltKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnptZCkKPj4g
ICB9Cj4+ICAgCj4+ICAgLyoKPj4gLSAqIFNlbGVjdCBhIGJ1ZmZlcmVkIHNlcXVlbnRpYWwgem9u
ZSBmb3IgcmVjbGFpbS4KPj4gKyAqIFNlbGVjdCBhIGJ1ZmZlcmVkIHJhbmRvbSB3cml0ZSBvciBz
ZXF1ZW50aWFsIHpvbmUgZm9yIHJlY2xhaW0uCj4gCj4gUmFuZG9tIHdyaXRlIHpvbmVkIHNob3Vs
ZCBuZXZlciBiZSAiYnVmZmVyZWQiLCBvciB0byBiZSB2ZXJ5IHByZWNpc2UsIHRoZXkgd2lsbAo+
IGJlIG9ubHkgZHVyaW5nIHRoZSB0aW1lIHJlY2xhaW0gbW92ZXMgYSBjYWNoZSB6b25lIGRhdGEg
dG8gYSByYW5kb20gem9uZS4gVGhhdAo+IGlzIHZpc2libGUgaW4gdGhlIGRtel9oYW5kbGVfd3Jp
dGUoKSBjaGFuZ2UgdGhhdCBleGVjdXRlCj4gZG16X2hhbmRsZV9kaXJlY3Rfd3JpdGUoKSBmb3Ig
Y2FjaGUgb3IgYnVmZmVyZWQgem9uZXMgaW5zdGVhZCBvZiB1c2luZwo+IGRtel9oYW5kbGVfYnVm
ZmVyZWRfd3JpdGUoKS4gU28gSSB0aGluayB0aGlzIGNvbW1lbnQgY2FuIHN0YXkgYXMgaXMuCj4g
Cj4+ICAgICovCj4+ICAgc3RhdGljIHN0cnVjdCBkbV96b25lICpkbXpfZ2V0X3NlcV96b25lX2Zv
cl9yZWNsYWltKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnptZCkKPj4gICB7Cj4+ICAgCXN0cnVjdCBk
bV96b25lICp6b25lOwo+PiAgIAo+PiAtCWlmIChsaXN0X2VtcHR5KCZ6bWQtPm1hcF9zZXFfbGlz
dCkpCj4+IC0JCXJldHVybiBFUlJfUFRSKC1FQlVTWSk7Cj4+IC0KPj4gKwlpZiAoem1kLT5ucl9j
YWNoZSkgewo+PiArCQkvKiBJZiB3ZSBoYXZlIGNhY2hlIHpvbmVzIHN0YXJ0IHdpdGggcmFuZG9t
IHpvbmVzICovCj4+ICsJCWxpc3RfZm9yX2VhY2hfZW50cnkoem9uZSwgJnptZC0+bWFwX3JuZF9s
aXN0LCBsaW5rKSB7Cj4+ICsJCQlpZiAoIXpvbmUtPmJ6b25lKQo+PiArCQkJCWNvbnRpbnVlOwo+
PiArCQkJaWYgKGRtel9sb2NrX3pvbmVfcmVjbGFpbSh6b25lKSkKPj4gKwkJCQlyZXR1cm4gem9u
ZTsKPj4gKwkJfQo+PiArCX0KPiAKPiBGb3IgdGhlIHJlYXNvbiBzdGF0ZWQgYWJvdmUsIEkgdGhp
bmsgdGhpcyBjaGFuZ2UgaXMgbm90IG5lY2Vzc2FyeSBlaXRoZXIuCj4gCkFoLiBJbmRlZWQuIFRo
ZSBhYm92ZSBodW5rIG1ha2VzIHVzIHJlY2xhaW0gdGhlIHJhbmRvbSB6b25lcywgdG9vLCB3aGlj
aApzdHJpY3RseSBzcGVha2luZyBpc24ndCBuZWNlc3NhcnkuCkknbGwgYmUgZHJvcHBpbmcgaXQg
YW5kIHNlZSBob3cgdGhpbmdzIGJlaGF2ZS4KCj4+ICAgCWxpc3RfZm9yX2VhY2hfZW50cnkoem9u
ZSwgJnptZC0+bWFwX3NlcV9saXN0LCBsaW5rKSB7Cj4+ICAgCQlpZiAoIXpvbmUtPmJ6b25lKQo+
PiAgIAkJCWNvbnRpbnVlOwo+PiBAQCAtMTkxMSw2ICsxOTUwLDcgQEAgc3RydWN0IGRtX3pvbmUg
KmRtel9nZXRfY2h1bmtfbWFwcGluZyhzdHJ1Y3QgZG16X21ldGFkYXRhICp6bWQsIHVuc2lnbmVk
IGludCBjaHUKPj4gICAJdW5zaWduZWQgaW50IGR6b25lX2lkOwo+PiAgIAlzdHJ1Y3QgZG1fem9u
ZSAqZHpvbmUgPSBOVUxMOwo+PiAgIAlpbnQgcmV0ID0gMDsKPj4gKwlpbnQgYWxsb2NfZmxhZ3Mg
PSB6bWQtPm5yX2NhY2hlID8gRE1aX0FMTE9DX0NBQ0hFIDogRE1aX0FMTE9DX1JORDsKPj4gICAK
Pj4gICAJZG16X2xvY2tfbWFwKHptZCk7Cj4+ICAgYWdhaW46Cj4+IEBAIC0xOTI1LDcgKzE5NjUs
NyBAQCBzdHJ1Y3QgZG1fem9uZSAqZG16X2dldF9jaHVua19tYXBwaW5nKHN0cnVjdCBkbXpfbWV0
YWRhdGEgKnptZCwgdW5zaWduZWQgaW50IGNodQo+PiAgIAkJCWdvdG8gb3V0Owo+PiAgIAo+PiAg
IAkJLyogQWxsb2NhdGUgYSByYW5kb20gem9uZSAqLwo+PiAtCQlkem9uZSA9IGRtel9hbGxvY196
b25lKHptZCwgRE1aX0FMTE9DX1JORCk7Cj4+ICsJCWR6b25lID0gZG16X2FsbG9jX3pvbmUoem1k
LCBhbGxvY19mbGFncyk7Cj4+ICAgCQlpZiAoIWR6b25lKSB7Cj4+ICAgCQkJaWYgKGRtel9kZXZf
aXNfZHlpbmcoem1kKSkgewo+PiAgIAkJCQlkem9uZSA9IEVSUl9QVFIoLUVJTyk7Cj4+IEBAIC0y
MDE4LDYgKzIwNTgsNyBAQCBzdHJ1Y3QgZG1fem9uZSAqZG16X2dldF9jaHVua19idWZmZXIoc3Ry
dWN0IGRtel9tZXRhZGF0YSAqem1kLAo+PiAgIAkJCQkgICAgIHN0cnVjdCBkbV96b25lICpkem9u
ZSkKPj4gICB7Cj4+ICAgCXN0cnVjdCBkbV96b25lICpiem9uZTsKPj4gKwlpbnQgYWxsb2NfZmxh
Z3MgPSB6bWQtPm5yX2NhY2hlID8gRE1aX0FMTE9DX0NBQ0hFIDogRE1aX0FMTE9DX1JORDsKPj4g
ICAKPj4gICAJZG16X2xvY2tfbWFwKHptZCk7Cj4+ICAgYWdhaW46Cj4+IEBAIC0yMDI2LDcgKzIw
NjcsNyBAQCBzdHJ1Y3QgZG1fem9uZSAqZG16X2dldF9jaHVua19idWZmZXIoc3RydWN0IGRtel9t
ZXRhZGF0YSAqem1kLAo+PiAgIAkJZ290byBvdXQ7Cj4+ICAgCj4+ICAgCS8qIEFsbG9jYXRlIGEg
cmFuZG9tIHpvbmUgKi8KPj4gLQliem9uZSA9IGRtel9hbGxvY196b25lKHptZCwgRE1aX0FMTE9D
X1JORCk7Cj4+ICsJYnpvbmUgPSBkbXpfYWxsb2Nfem9uZSh6bWQsIGFsbG9jX2ZsYWdzKTsKPj4g
ICAJaWYgKCFiem9uZSkgewo+PiAgIAkJaWYgKGRtel9kZXZfaXNfZHlpbmcoem1kKSkgewo+PiAg
IAkJCWJ6b25lID0gRVJSX1BUUigtRUlPKTsKPj4gQEAgLTIwNDMsNyArMjA4NCwxMCBAQCBzdHJ1
Y3QgZG1fem9uZSAqZG16X2dldF9jaHVua19idWZmZXIoc3RydWN0IGRtel9tZXRhZGF0YSAqem1k
LAo+PiAgIAliem9uZS0+Y2h1bmsgPSBkem9uZS0+Y2h1bms7Cj4+ICAgCWJ6b25lLT5iem9uZSA9
IGR6b25lOwo+PiAgIAlkem9uZS0+YnpvbmUgPSBiem9uZTsKPj4gLQlsaXN0X2FkZF90YWlsKCZi
em9uZS0+bGluaywgJnptZC0+bWFwX3JuZF9saXN0KTsKPj4gKwlpZiAoYWxsb2NfZmxhZ3MgPT0g
RE1aX0FMTE9DX0NBQ0hFKQo+PiArCQlsaXN0X2FkZF90YWlsKCZiem9uZS0+bGluaywgJnptZC0+
bWFwX2NhY2hlX2xpc3QpOwo+PiArCWVsc2UKPj4gKwkJbGlzdF9hZGRfdGFpbCgmYnpvbmUtPmxp
bmssICZ6bWQtPm1hcF9ybmRfbGlzdCk7Cj4+ICAgb3V0Ogo+PiAgIAlkbXpfdW5sb2NrX21hcCh6
bWQpOwo+PiAgIAo+PiBAQCAtMjA1OSwzMSArMjEwMyw1MyBAQCBzdHJ1Y3QgZG1fem9uZSAqZG16
X2FsbG9jX3pvbmUoc3RydWN0IGRtel9tZXRhZGF0YSAqem1kLCB1bnNpZ25lZCBsb25nIGZsYWdz
KQo+PiAgIAlzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0Owo+PiAgIAlzdHJ1Y3QgZG1fem9uZSAqem9u
ZTsKPj4gICAKPj4gLQlpZiAoZmxhZ3MgJiBETVpfQUxMT0NfUk5EKQo+PiArCXN3aXRjaCAoZmxh
Z3MpIHsKPj4gKwljYXNlIERNWl9BTExPQ19DQUNIRToKPj4gKwkJbGlzdCA9ICZ6bWQtPnVubWFw
X2NhY2hlX2xpc3Q7Cj4+ICsJCWJyZWFrOwo+PiArCWNhc2UgRE1aX0FMTE9DX1JORDoKPj4gICAJ
CWxpc3QgPSAmem1kLT51bm1hcF9ybmRfbGlzdDsKPj4gLQllbHNlCj4+IC0JCWxpc3QgPSAmem1k
LT51bm1hcF9zZXFfbGlzdDsKPj4gKwkJYnJlYWs7Cj4+ICsJZGVmYXVsdDoKPj4gKwkJaWYgKHpt
ZC0+bnJfY2FjaGUpPiArCQkJbGlzdCA9ICZ6bWQtPnVubWFwX3JuZF9saXN0Owo+PiArCQllbHNl
Cj4+ICsJCQlsaXN0ID0gJnptZC0+dW5tYXBfc2VxX2xpc3Q7Cj4+ICsJCWJyZWFrOwo+PiArCX0K
Pj4gICBhZ2FpbjoKPj4gICAJaWYgKGxpc3RfZW1wdHkobGlzdCkpIHsKPj4gICAJCS8qCj4+IC0J
CSAqIE5vIGZyZWUgem9uZTogaWYgdGhpcyBpcyBmb3IgcmVjbGFpbSwgYWxsb3cgdXNpbmcgdGhl
Cj4+IC0JCSAqIHJlc2VydmVkIHNlcXVlbnRpYWwgem9uZXMuCj4+ICsJCSAqIE5vIGZyZWUgem9u
ZTogcmV0dXJuIE5VTEwgaWYgdGhpcyBpcyBmb3Igbm90IHJlY2xhaW0uCj4gCj4gcy9mb3Igbm90
IHJlY2xhaW0vbm90IGZvciByZWNsYWltCj4gClsgLi4gXQo+IAo+IEFwYXJ0IGZyb20gdGhlIG5p
dHMgYWJvdmUsIGFsbCBsb29rIGdvb2QuIEkgYW0gcnVubmluZyB0aGlzIHJpZ2h0IG5vdyBhbmQg
aXQgaXMKPiBydW5uaW5nIGF0IFNNUiBkcml2ZSBzcGVlZCAhIEF3ZXNvbWUgISBXaWxsIHNlbmQg
YSBwbG90IG9uY2UgdGhlIHJ1biBpcyBvdmVyLgo+IApUaGFua3MuIEknbGwgYmUgcmVzcGlubmlu
ZyB0aGUgcGF0Y2ggYW5kIHdpbCBiZSByZXBvc3RpbmcgaXQuCgpDaGVlcnMsCgpIYW5uZXMKLS0g
CkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICBUZWFtbGVhZCBTdG9yYWdlICYgTmV0d29y
a2luZwpoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3
NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6
IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEBy
ZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZl
bA==

