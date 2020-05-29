Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5795A1E8279
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 17:49:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590767372;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wPRR8aSJtzoCkiVILq9F1ztdK4AVPXidz+A8WUjFVO8=;
	b=TsnXQbpsuCEnY05TG8mrsAnUJHVwmCplMPgoFDbhp7pdW1h7RRlnRwfKg+oL19HTy3Unhk
	ctIoiMLJOo/HNia78ChRmVop1G1N+wIUJ7fI/GMiqnfNJWm5OrfA5PSqIfo9/0Q1m9TnmL
	fEw/pJJT8wk/Ao5vNApwyBvxh+kDM+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-G2cu21qlPOWgC9OjnA_33Q-1; Fri, 29 May 2020 11:49:29 -0400
X-MC-Unique: G2cu21qlPOWgC9OjnA_33Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAC2E107ACF6;
	Fri, 29 May 2020 15:49:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45CF65D9F3;
	Fri, 29 May 2020 15:49:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 892AF1809543;
	Fri, 29 May 2020 15:49:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04TFmmUc024045 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 11:48:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 868552026E1C; Fri, 29 May 2020 15:48:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82B302026DFD
	for <dm-devel@redhat.com>; Fri, 29 May 2020 15:48:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 385451801223
	for <dm-devel@redhat.com>; Fri, 29 May 2020 15:48:46 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-204-4Iq1jMSdNcKCm_XwMpdI3Q-1;
	Fri, 29 May 2020 11:48:43 -0400
X-MC-Unique: 4Iq1jMSdNcKCm_XwMpdI3Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 3D378B17A;
	Fri, 29 May 2020 15:48:42 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-14-hare@suse.de>
	<f38d9c9802239e3021b602af8c178428d72e791b.camel@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <2966c1c2-86e9-2be3-09b8-3ab7cdb29d6a@suse.de>
Date: Fri, 29 May 2020 17:48:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f38d9c9802239e3021b602af8c178428d72e791b.camel@wdc.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04TFmmUc024045
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 13/15] dm-zoned: allocate zone by device index
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8yOC8yMCA2OjA4IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiBXZWQsIDIwMjAt
MDUtMjcgYXQgMDg6MjIgKzAyMDAsIEhhbm5lcyBSZWluZWNrZSB3cm90ZToKPj4gV2hlbiBhbGxv
Y2F0aW5nIGEgem9uZSB3ZSBzaG91bGQgcGFzcyBpbiBhbiBpbmRpY2F0b3Igb24gd2hpY2gKPj4g
ZGV2aWNlIHRoZSB6b25lIHNob3VsZCBiZSBhbGxvY2F0ZWQ7IHRoaXMgaW5jcmVhc2VzIHBlcmZv
cm1hbmNlCj4+IGZvciBhIG11bHRpLWRldmljZSBzZXR1cCBhcyB0aGVuIHJlY2xhaW0gY2FuIGFs
bG9jYXRlIHpvbmVzIG9uCj4+IHRoZSBkZXZpY2UgZm9yIHdoaWNoIHJlY2xhaW0gaXMgcnVubmlu
Zy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+Cj4+
IC0tLQo+PiAgIGRyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRhdGEuYyB8IDE3ICsrKysrKysrKysr
LS0tLS0tCj4+ICAgZHJpdmVycy9tZC9kbS16b25lZC1yZWNsYWltLmMgIHwgIDMgKystCj4+ICAg
ZHJpdmVycy9tZC9kbS16b25lZC5oICAgICAgICAgIHwgIDMgKystCj4+ICAgMyBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jIGIvZHJpdmVycy9tZC9kbS16b25lZC1tZXRh
ZGF0YS5jCj4+IGluZGV4IDY4OWMxZGQ3YWIyMC4uMGQ2NWFmOTQzMDlhIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMKPj4gKysrIGIvZHJpdmVycy9tZC9kbS16
b25lZC1tZXRhZGF0YS5jCj4+IEBAIC0yMDQ1LDcgKzIwNDUsNyBAQCBzdHJ1Y3QgZG1fem9uZSAq
ZG16X2dldF9jaHVua19tYXBwaW5nKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnptZCwgdW5zaWduZWQg
aW50IGNodQo+PiAgIAkJCWdvdG8gb3V0Owo+PiAgIAo+PiAgIAkJLyogQWxsb2NhdGUgYSByYW5k
b20gem9uZSAqLwo+PiAtCQlkem9uZSA9IGRtel9hbGxvY196b25lKHptZCwgYWxsb2NfZmxhZ3Mp
Owo+PiArCQlkem9uZSA9IGRtel9hbGxvY196b25lKHptZCwgMCwgYWxsb2NfZmxhZ3MpOwo+PiAg
IAkJaWYgKCFkem9uZSkgewo+PiAgIAkJCWlmIChkbXpfZGV2X2lzX2R5aW5nKHptZCkpIHsKPj4g
ICAJCQkJZHpvbmUgPSBFUlJfUFRSKC1FSU8pOwo+PiBAQCAtMjE1MSw3ICsyMTUxLDcgQEAgc3Ry
dWN0IGRtX3pvbmUgKmRtel9nZXRfY2h1bmtfYnVmZmVyKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnpt
ZCwKPj4gICAJCWdvdG8gb3V0Owo+PiAgIAo+PiAgIAkvKiBBbGxvY2F0ZSBhIHJhbmRvbSB6b25l
ICovCj4+IC0JYnpvbmUgPSBkbXpfYWxsb2Nfem9uZSh6bWQsIGFsbG9jX2ZsYWdzKTsKPj4gKwli
em9uZSA9IGRtel9hbGxvY196b25lKHptZCwgMCwgYWxsb2NfZmxhZ3MpOwo+PiAgIAlpZiAoIWJ6
b25lKSB7Cj4+ICAgCQlpZiAoZG16X2Rldl9pc19keWluZyh6bWQpKSB7Cj4+ICAgCQkJYnpvbmUg
PSBFUlJfUFRSKC1FSU8pOwo+PiBAQCAtMjE4MiwxMSArMjE4MiwxMiBAQCBzdHJ1Y3QgZG1fem9u
ZSAqZG16X2dldF9jaHVua19idWZmZXIoc3RydWN0IGRtel9tZXRhZGF0YSAqem1kLAo+PiAgICAq
IEdldCBhbiB1bm1hcHBlZCAoZnJlZSkgem9uZS4KPj4gICAgKiBUaGlzIG11c3QgYmUgY2FsbGVk
IHdpdGggdGhlIG1hcHBpbmcgbG9jayBoZWxkLgo+PiAgICAqLwo+PiAtc3RydWN0IGRtX3pvbmUg
KmRtel9hbGxvY196b25lKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnptZCwgdW5zaWduZWQgbG9uZyBm
bGFncykKPj4gK3N0cnVjdCBkbV96b25lICpkbXpfYWxsb2Nfem9uZShzdHJ1Y3QgZG16X21ldGFk
YXRhICp6bWQsIHVuc2lnbmVkIGludCBkZXZfaWR4LAo+PiArCQkJICAgICAgIHVuc2lnbmVkIGxv
bmcgZmxhZ3MpCj4+ICAgewo+PiAgIAlzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0Owo+PiAgIAlzdHJ1
Y3QgZG1fem9uZSAqem9uZTsKPj4gLQl1bnNpZ25lZCBpbnQgZGV2X2lkeCA9IDA7Cj4+ICsJaW50
IGkgPSAwOwo+PiAgIAo+PiAgIGFnYWluOgo+PiAgIAlpZiAoZmxhZ3MgJiBETVpfQUxMT0NfQ0FD
SEUpCj4+IEBAIC0yMjAyLDggKzIyMDMsMTIgQEAgc3RydWN0IGRtX3pvbmUgKmRtel9hbGxvY196
b25lKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnptZCwgdW5zaWduZWQgbG9uZyBmbGFncykKPj4gICAJ
CSAqLwo+PiAgIAkJaWYgKCEoZmxhZ3MgJiBETVpfQUxMT0NfUkVDTEFJTSkpCj4+ICAgCQkJcmV0
dXJuIE5VTEw7Cj4+IC0JCWlmIChkZXZfaWR4IDwgem1kLT5ucl9kZXZzKSB7Cj4+IC0JCQlkZXZf
aWR4Kys7Cj4+ICsJCS8qCj4+ICsJCSAqIFRyeSB0byBhbGxvY2F0ZSBmcm9tIG90aGVyIGRldmlj
ZXMKPj4gKwkJICovCj4+ICsJCWlmIChpIDwgem1kLT5ucl9kZXZzKSB7Cj4+ICsJCQlkZXZfaWR4
ID0gKGRldl9pZHggKyAxKSAlIHptZC0+bnJfZGV2czsKPiAKPiBIdSA/IFlvdSBkZWxldGVkIGRl
dl9pZHggZGVjbGFyYXRpb24gYWJvdmUuLi4KPiAKSXQncyBub3cgdGhlIGZ1bmN0aW9uIGFyZ3Vt
ZW50IC4uLgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAg
ICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7D
vHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

