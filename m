Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E23C81BE1AD
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 16:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588171948;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FE6z4IHWT58F6uqUhaFotF9eHKFt3NJYj8vavuXzYpg=;
	b=Pv3EGlZLeS1HoGw4nHT9nTg5+Jj4BID8c7W66RV4M/f8VPMpgGzPCqc1DnXN9c5C20ML3j
	APgG3wlNl01RXMK/804Pws8BfBQElHkjKCX2EgxxOzbz02HUarqucPd0pUCdj7sM/gQ4wA
	ymLgNR36CIbHLxHlKZ4xFRA0pYg559Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-m5jglduHNZu4ZoyoqtbDfw-1; Wed, 29 Apr 2020 10:52:25 -0400
X-MC-Unique: m5jglduHNZu4ZoyoqtbDfw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DF0C107ACCD;
	Wed, 29 Apr 2020 14:52:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E38AD5D76A;
	Wed, 29 Apr 2020 14:52:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC7561809542;
	Wed, 29 Apr 2020 14:52:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TEqAJo012833 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 10:52:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D0082157F23; Wed, 29 Apr 2020 14:52:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18EC62166BA4
	for <dm-devel@redhat.com>; Wed, 29 Apr 2020 14:52:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5EE4811E77
	for <dm-devel@redhat.com>; Wed, 29 Apr 2020 14:52:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-161-wUEnK2FGMWekBgMJER-gxw-1; Wed, 29 Apr 2020 10:52:04 -0400
X-MC-Unique: wUEnK2FGMWekBgMJER-gxw-1
Received: from [2601:1c0:6280:3f0::19c2]
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTo4A-0006Ji-PV; Wed, 29 Apr 2020 14:52:02 +0000
To: Heinz Mauelshagen <heinzm@redhat.com>, LKML
	<linux-kernel@vger.kernel.org>, dm-devel@redhat.com
References: <d33b3bfb-c38d-9770-e6a6-929519dc21d4@infradead.org>
	<980b6b95-6e18-40ff-f71c-058917c5b6ee@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f78d654d-3f98-151d-bc16-bf31a6547a66@infradead.org>
Date: Wed, 29 Apr 2020 07:52:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <980b6b95-6e18-40ff-f71c-058917c5b6ee@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03TEqAJo012833
X-loop: dm-devel@redhat.com
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH -next] md: dm-ebs-target: fix build errors &
 Kconfig entry
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gNC8yOS8yMCA1OjIzIEFNLCBIZWlueiBNYXVlbHNoYWdlbiB3cm90ZToKPiBPbiA0LzI4LzIw
IDU6MDMgUE0sIFJhbmR5IER1bmxhcCB3cm90ZToKPj4gRnJvbTogUmFuZHkgRHVubGFwIDxyZHVu
bGFwQGluZnJhZGVhZC5vcmc+Cj4+Cj4+IEZpeCBidWlsZCBlcnJvcnMgYnkgc2VsZWN0aW5nIERN
X0JVRklPLgo+Pgo+PiBGaXggS2NvbmZpZyBlbnRyeSBmb3JtYXR0aW5nIGJ5IHVzaW5nIHRhYnMg
aW5zdGVhZCBvZiBzcGFjZXMsCj4+IHVzaW5nICJoZWxwIiBpbnN0ZWFkIG9mICItLS1oZWxwLS0t
IiwgYW5kCj4+IGluZGVudGluZyBoZWxwIHRleHQgd2l0aCBvbmUgYWRkaXRpb25hbCBzcGFjZS4K
Pj4KPj4gRml4ZXMgdGhlc2UgYnVpbGQgZXJyb3JzOgo+Pgo+PiBsZDogZHJpdmVycy9tZC9kbS1l
YnMtdGFyZ2V0Lm86IGluIGZ1bmN0aW9uIGBfX2Vic19mb3JnZXRfYmlvJzoKPj4gZG0tZWJzLXRh
cmdldC5jOigudGV4dCsweDFiYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRtX2J1ZmlvX2Zv
cmdldCcKPj4gbGQ6IGRyaXZlcnMvbWQvZG0tZWJzLXRhcmdldC5vOiBpbiBmdW5jdGlvbiBgZWJz
X2R0cic6Cj4+IGRtLWVicy10YXJnZXQuYzooLnRleHQrMHgyZmUpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBkbV9idWZpb19jbGllbnRfZGVzdHJveScKPj4gbGQ6IGRyaXZlcnMvbWQvZG0tZWJz
LXRhcmdldC5vOiBpbiBmdW5jdGlvbiBgX19lYnNfcndfYmlvJzoKPj4gZG0tZWJzLXRhcmdldC5j
OigudGV4dCsweDRjNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRtX2J1ZmlvX2dldF9ibG9j
a19zaXplJwo+PiBsZDogZG0tZWJzLXRhcmdldC5jOigudGV4dCsweDRmMSk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGRtX2J1ZmlvX3JlYWQnCj4+IGxkOiBkbS1lYnMtdGFyZ2V0LmM6KC50ZXh0
KzB4NTA0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZG1fYnVmaW9fZ2V0X2Jsb2NrX3NpemUn
Cj4+IGxkOiBkbS1lYnMtdGFyZ2V0LmM6KC50ZXh0KzB4NTE5KTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgZG1fYnVmaW9fbmV3Jwo+PiBsZDogZG0tZWJzLXRhcmdldC5jOigudGV4dCsweDU2Nyk6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRtX2J1ZmlvX21hcmtfcGFydGlhbF9idWZmZXJfZGly
dHknCj4+IGxkOiBkbS1lYnMtdGFyZ2V0LmM6KC50ZXh0KzB4NTZmKTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byBgZG1fYnVmaW9fcmVsZWFzZScKPj4gbGQ6IGRyaXZlcnMvbWQvZG0tZWJzLXRhcmdl
dC5vOiBpbiBmdW5jdGlvbiBgX19lYnNfcHJvY2Vzc19iaW9zJzoKPj4gZG0tZWJzLXRhcmdldC5j
OigudGV4dCsweDZiZik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRtX2J1ZmlvX3ByZWZldGNo
Jwo+PiBsZDogZG0tZWJzLXRhcmdldC5jOigudGV4dCsweDcyZCk6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYGRtX2J1ZmlvX3ByZWZldGNoJwo+PiBsZDogZG0tZWJzLXRhcmdldC5jOigudGV4dCsw
eDc4Myk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRtX2J1ZmlvX3ByZWZldGNoJwo+PiBsZDog
ZG0tZWJzLXRhcmdldC5jOigudGV4dCsweDdmZSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRt
X2J1ZmlvX3dyaXRlX2RpcnR5X2J1ZmZlcnMnCj4+IGxkOiBkcml2ZXJzL21kL2RtLWVicy10YXJn
ZXQubzogaW4gZnVuY3Rpb24gYGVic19jdHInOgo+PiBkbS1lYnMtdGFyZ2V0LmM6KC50ZXh0KzB4
YTgyKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZG1fYnVmaW9fY2xpZW50X2NyZWF0ZScKPj4K
Pj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4+
IENjOiBIZWlueiBNYXVlbHNoYWdlbiA8ZG0tZGV2ZWxAcmVkaGF0LmNvbT4KPj4gQ2M6IEFsYXNk
YWlyIEtlcmdvbiA8YWdrQHJlZGhhdC5jb20+Cj4+IENjOiBNaWtlIFNuaXR6ZXIgPHNuaXR6ZXJA
cmVkaGF0LmNvbT4KPj4gQ2M6IGRtLWRldmVsQHJlZGhhdC5jb20KPj4gLS0tCj4+IMKgIGRyaXZl
cnMvbWQvS2NvbmZpZyB8wqDCoCAxMiArKysrKystLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gLS0tIGxpbnV4LW5leHQtMjAy
MDA0Mjgub3JpZy9kcml2ZXJzL21kL0tjb25maWcKPj4gKysrIGxpbnV4LW5leHQtMjAyMDA0Mjgv
ZHJpdmVycy9tZC9LY29uZmlnCj4+IEBAIC0zMzgsMTIgKzMzOCwxMiBAQCBjb25maWcgRE1fV1JJ
VEVDQUNIRQo+PiDCoMKgwqDCoMKgwqDCoMKgIHRvIGJlIGNhY2hlZCBpbiBzdGFuZGFyZCBSQU0u
Cj4+IMKgIMKgIGNvbmZpZyBETV9FQlMKPj4gLcKgwqDCoMKgwqDCoCB0cmlzdGF0ZSAiRW11bGF0
ZWQgYmxvY2sgc2l6ZSB0YXJnZXQgKEVYUEVSSU1FTlRBTCkiCj4+IC3CoMKgwqDCoMKgwqAgZGVw
ZW5kcyBvbiBCTEtfREVWX0RNCj4+IC3CoMKgwqDCoMKgwqAgZGVmYXVsdCBuCj4+IC3CoMKgwqDC
oMKgwqAgLS0taGVscC0tLQo+PiAtwqDCoMKgwqAgZG0tZWJzIGVtdWxhdGVzIHNtYWxsZXIgbG9n
aWNhbCBibG9jayBzaXplIG9uIGJhY2tpbmcgZGV2aWNlcwo+PiAtwqDCoMKgwqAgd2l0aCBsYXJn
ZXIgb25lcyAoZS5nLiA1MTIgYnl0ZSBzZWN0b3JzIG9uIDRLIG5hdGl2ZSBkaXNrcykuCj4+ICvC
oMKgwqAgdHJpc3RhdGUgIkVtdWxhdGVkIGJsb2NrIHNpemUgdGFyZ2V0IChFWFBFUklNRU5UQUwp
Igo+PiArwqDCoMKgIGRlcGVuZHMgb24gQkxLX0RFVl9ETQo+PiArwqDCoMKgIHNlbGVjdCBETV9C
VUZJTwo+PiArwqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAgZG0tZWJzIGVtdWxhdGVzIHNtYWxs
ZXIgbG9naWNhbCBibG9jayBzaXplIG9uIGJhY2tpbmcgZGV2aWNlcwo+PiArwqDCoMKgwqDCoCB3
aXRoIGxhcmdlciBvbmVzIChlLmcuIDUxMiBieXRlIHNlY3RvcnMgb24gNEsgbmF0aXZlIGRpc2tz
KS4KPj4gwqAgwqAgY29uZmlnIERNX0VSQQo+PiDCoMKgwqDCoMKgwqDCoMKgIHRyaXN0YXRlICJF
cmEgdGFyZ2V0IChFWFBFUklNRU5UQUwpIgo+IAo+IAo+IFRoYW5rcywgZmluZSB3aXRoIG1lIGZv
ciB0aGUgbW9zdCBwYXJ0Lgo+IAo+IFdlIG1haW5seSB1c2UgJy0tLWhlbHAtLS0nIGZvciBkbS9t
ZCB0aG91Z2gsIHNvIGxldHMncyBrZWVwIGl0LiBNaWtlPwo+IAo+IEhlaW56CgpTdXJlLCB5b3Ug
Y2FuIGtlZXAgaXQgZm9yIG5vdywgYnV0IGl0IGlzIGJlaW5nIHBoYXNlZCBvdXQuCgp0aGFua3Mu
Ci0tIAp+UmFuZHkKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

