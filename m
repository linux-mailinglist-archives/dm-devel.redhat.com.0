Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3B0218044
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-h6rI-76IPdeRpJb2CHNSZQ-1; Wed, 08 Jul 2020 03:07:07 -0400
X-MC-Unique: h6rI-76IPdeRpJb2CHNSZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B41DA7BAC;
	Wed,  8 Jul 2020 07:07:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0292760E1C;
	Wed,  8 Jul 2020 07:06:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E9B41809547;
	Wed,  8 Jul 2020 07:06:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06876QCL004026 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 03:06:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3AE2A2026D69; Wed,  8 Jul 2020 07:06:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36E8E20A0535
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 07:06:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B796857CF5
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 07:06:24 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-113-y2dn4bQRN5iWdYlGAGuV-A-1;
	Wed, 08 Jul 2020 03:06:19 -0400
X-MC-Unique: y2dn4bQRN5iWdYlGAGuV-A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7C71AAC1D;
	Wed,  8 Jul 2020 07:06:18 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
References: <20200708002023.738147-1-damien.lemoal@wdc.com>
	<20200708002023.738147-2-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <01536689-70c9-2a30-c75f-740c3a64c3ef@suse.de>
Date: Wed, 8 Jul 2020 09:06:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200708002023.738147-2-damien.lemoal@wdc.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06876QCL004026
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm zoned: Fix zone reclaim trigger
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNy84LzIwIDI6MjAgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IFRyaWdnZXJyaW5nIHJl
Y2xhaW0gb25seSBiYXNlZCBvbiB0aGUgcGVyY2VudGFnZSBvZiB1bm1hcHBlZCBjYWNoZQo+IHpv
bmVzIGNhbiBmYWlsIHRvIGRldGVjdCBjYXNlcyB3aGVyZSByZWNsYWltIGlzIG5lZWRlZCwgZS5n
LiBpZiB0aGUKPiB0YXJnZXQgaGFzIG9ubHkgMiBvciAzIGNhY2hlIHpvbmVzIGFuZCBvbmx5IG9u
ZSB1bm1hcHBlZCBjYWNoZSB6b25lLAo+IHRoZSBwZXJjZW50YWdlIG9mIGZyZWUgY2FjaGUgem9u
ZSBpcyBoaWdoZXIgdGhhbgo+IERNWl9SRUNMQUlNX0xPV19VTk1BUF9aT05FUyAoMzAlKSBhbmQg
cmVjbGFpbSBkb2VzIG5vdCB0cmlnZ2VyLgo+IFRoaXMgcHJvYmxlbSwgY29tYmluZWQgd2l0aCB0
aGUgZmFjdCB0aGF0IGRtel9zY2hlZHVsZV9yZWNsYWltKCkgaXMKPiBjYWxsZWQgZnJvbSBkbXpf
aGFuZGxlX2JpbygpIHdpdGhvdXQgdGhlIG1hcCBsb2NrIGhlbGQgbGVhZHMgdG8gYSByYWNlCj4g
YmV0d2VlbiB6b25lIGFsbG9jYXRpb24gYW5kIGRtel9zaG91bGRfcmVjbGFpbSgpIHJlc3VsdC4g
RGVwZW5kaW5nIG9uCj4gdGhlIHdvcmtsb2FkIGFwcGxpZWQsIHRoaXMgcmFjZSBjYW4gbGVhZCB0
byB0aGUgd3JpdGUgcGF0aCBmb3JldmVyCj4gd2FpdGluZyBmb3IgYSBmcmVlIHpvbmUgd2l0aG91
dCByZWNsYWltIGJlaW5nIHRyaWdnZXJyZWQuCj4gCj4gRml4IHRoaXMgYnkgbW92aW5nIGRtel9z
Y2hlZHVsZV9yZWNsYWltKCkgaW5zaWRlIGRtel9hbGxvY196b25lKCkKPiB1bmRlciB0aGUgbWFw
IGxvY2ssIGNoZWNraW5nIHRoZSBuZWVkIGZvciB6b25lIHJlY2xhaW0gd2hlbmV2ZXIgYSBuZXcK
PiBkYXRhIG9yIGJ1ZmZlciB6b25lIG5lZWRzIHRvIGJlIGFsbG9jYXRlZC4KPiAKPiBBbHNvIGZp
eCBkbXpfcmVjbGFpbV9wZXJjZW50YWdlKCkgdG8gYWx3YXlzIHJldHVybiAwIGlmIHRoZSBudW1i
ZXIgb2YKPiB1bm1hcHBlZCBjYWNoZSAob3IgcmFuZG9tKSB6b25lIGlzIGxlc3MgdGhhbiBvciBl
cXVhbCB0byAxLgo+IAo+IFN1Z2dlc3RlZC1ieTogU2hpbidpY2hpcm8gS2F3YXNha2kgPHNoaW5p
Y2hpcm8ua2F3YXNha2lAd2RjLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8
ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tZC9kbS16b25lZC1tZXRh
ZGF0YS5jIHwgIDkgKysrKysrKystCj4gICBkcml2ZXJzL21kL2RtLXpvbmVkLXJlY2xhaW0uYyAg
fCAgMiArKwo+ICAgZHJpdmVycy9tZC9kbS16b25lZC10YXJnZXQuYyAgIHwgMTAgKy0tLS0tLS0t
LQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jIGIvZHJpdmVy
cy9tZC9kbS16b25lZC1tZXRhZGF0YS5jCj4gaW5kZXggNWNmNmY1ZjU1MmUwLi5iMjk4ZmVmYjAy
MmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jCj4gKysrIGIv
ZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jCj4gQEAgLTIyMTcsOCArMjIxNywxNSBAQCBz
dHJ1Y3QgZG1fem9uZSAqZG16X2FsbG9jX3pvbmUoc3RydWN0IGRtel9tZXRhZGF0YSAqem1kLCB1
bnNpZ25lZCBpbnQgZGV2X2lkeCwKPiAgIHsKPiAgIAlzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0Owo+
ICAgCXN0cnVjdCBkbV96b25lICp6b25lOwo+IC0JaW50IGkgPSAwOwo+ICsJaW50IGk7Cj4gKwo+
ICsJLyogU2NoZWR1bGUgcmVjbGFpbSB0byBlbnN1cmUgZnJlZSB6b25lcyBhcmUgYXZhaWxhYmxl
ICovCj4gKwlpZiAoIShmbGFncyAmIERNWl9BTExPQ19SRUNMQUlNKSkgewo+ICsJCWZvciAoaSA9
IDA7IGkgPCB6bWQtPm5yX2RldnM7IGkrKykKPiArCQkJZG16X3NjaGVkdWxlX3JlY2xhaW0oem1k
LT5kZXZbaV0ucmVjbGFpbSk7Cj4gKwl9Cj4gICAKPiArCWkgPSAwOwo+ICAgYWdhaW46Cj4gICAJ
aWYgKGZsYWdzICYgRE1aX0FMTE9DX0NBQ0hFKQo+ICAgCQlsaXN0ID0gJnptZC0+dW5tYXBfY2Fj
aGVfbGlzdDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS16b25lZC1yZWNsYWltLmMgYi9k
cml2ZXJzL21kL2RtLXpvbmVkLXJlY2xhaW0uYwo+IGluZGV4IGRkMWVlYmY2ZTUwZi4uOWM2ZTI2
NDQ2NWJjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWQvZG0tem9uZWQtcmVjbGFpbS5jCj4gKysr
IGIvZHJpdmVycy9tZC9kbS16b25lZC1yZWNsYWltLmMKPiBAQCAtNDU2LDYgKzQ1Niw4IEBAIHN0
YXRpYyB1bnNpZ25lZCBpbnQgZG16X3JlY2xhaW1fcGVyY2VudGFnZShzdHJ1Y3QgZG16X3JlY2xh
aW0gKnpyYykKPiAgIAkJbnJfem9uZXMgPSBkbXpfbnJfcm5kX3pvbmVzKHptZCwgenJjLT5kZXZf
aWR4KTsKPiAgIAkJbnJfdW5tYXAgPSBkbXpfbnJfdW5tYXBfcm5kX3pvbmVzKHptZCwgenJjLT5k
ZXZfaWR4KTsKPiAgIAl9Cj4gKwlpZiAobnJfdW5tYXAgPD0gMSkKPiArCQlyZXR1cm4gMDsKPiAg
IAlyZXR1cm4gbnJfdW5tYXAgKiAxMDAgLyBucl96b25lczsKPiAgIH0KPiAgIAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21kL2RtLXpvbmVkLXRhcmdldC5jIGIvZHJpdmVycy9tZC9kbS16b25lZC10
YXJnZXQuYwo+IGluZGV4IGNmOTE1MDA5YzMwNi4uNDJhYTUxMzlkZjdjIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbWQvZG0tem9uZWQtdGFyZ2V0LmMKPiArKysgYi9kcml2ZXJzL21kL2RtLXpvbmVk
LXRhcmdldC5jCj4gQEAgLTQwMCwxNSArNDAwLDcgQEAgc3RhdGljIHZvaWQgZG16X2hhbmRsZV9i
aW8oc3RydWN0IGRtel90YXJnZXQgKmRteiwgc3RydWN0IGRtX2NodW5rX3dvcmsgKmN3LAo+ICAg
CQlkbV9wZXJfYmlvX2RhdGEoYmlvLCBzaXplb2Yoc3RydWN0IGRtel9iaW9jdHgpKTsKPiAgIAlz
dHJ1Y3QgZG16X21ldGFkYXRhICp6bWQgPSBkbXotPm1ldGFkYXRhOwo+ICAgCXN0cnVjdCBkbV96
b25lICp6b25lOwo+IC0JaW50IGksIHJldDsKPiAtCj4gLQkvKgo+IC0JICogV3JpdGUgbWF5IHRy
aWdnZXIgYSB6b25lIGFsbG9jYXRpb24uIFNvIG1ha2Ugc3VyZSB0aGUKPiAtCSAqIGFsbG9jYXRp
b24gY2FuIHN1Y2NlZWQuCj4gLQkgKi8KPiAtCWlmIChiaW9fb3AoYmlvKSA9PSBSRVFfT1BfV1JJ
VEUpCj4gLQkJZm9yIChpID0gMDsgaSA8IGRtei0+bnJfZGRldnM7IGkrKykKPiAtCQkJZG16X3Nj
aGVkdWxlX3JlY2xhaW0oZG16LT5kZXZbaV0ucmVjbGFpbSk7Cj4gKwlpbnQgcmV0Owo+ICAgCj4g
ICAJZG16X2xvY2tfbWV0YWRhdGEoem1kKTsKPiAgIAo+IApJIHNlZW0gdG8gaGF2ZSBydW4gaW50
byB0aGlzIGR1cmluZyBteSB0ZXN0aW5nLCB0b28sIGJ1dCB0aGVuIGFzIEknZCAKYXJndWFibHkg
aGFkIHByb2dyYW1taW5nIGVycm9ycyBhdCB0aGF0IHRpbWUgSSBkaWRuJ3QgbWFuYWdlIHRvIHJl
Y3JlYXRlIAppdC4gVGhhbmtzIGZvciB0cmFja2luZyBpdCBkb3duLgoKUmV2aWV3ZWQtYnk6IEhh
bm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFu
bmVzIFJlaW5lY2tlICAgICAgICAgICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFy
ZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJ
bWVuZMO2cmZmZXIKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

