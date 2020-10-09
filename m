Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F2F2D28AFA5
	for <lists+dm-devel@lfdr.de>; Mon, 12 Oct 2020 10:09:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-iywr5o9dPO-miDVNMQBMMg-1; Mon, 12 Oct 2020 04:09:02 -0400
X-MC-Unique: iywr5o9dPO-miDVNMQBMMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EB2718A8220;
	Mon, 12 Oct 2020 08:08:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3845D10013C4;
	Mon, 12 Oct 2020 08:08:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 421AA9231D;
	Mon, 12 Oct 2020 08:08:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0999xgLH011925 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Oct 2020 05:59:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35955207A80F; Fri,  9 Oct 2020 09:59:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31024207A80D
	for <dm-devel@redhat.com>; Fri,  9 Oct 2020 09:59:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 508D8858294
	for <dm-devel@redhat.com>; Fri,  9 Oct 2020 09:59:39 +0000 (UTC)
Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch
	[83.166.143.171]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-284-CdKKccEDPb28c-SomanB0w-1; Fri, 09 Oct 2020 05:59:36 -0400
X-MC-Unique: CdKKccEDPb28c-SomanB0w-1
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id
	4C73G20ms8zlhJG2; Fri,  9 Oct 2020 11:50:02 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [94.23.54.103])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id
	4C73G12Gytzllmh6; Fri,  9 Oct 2020 11:50:01 +0200 (CEST)
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
References: <20201002071802.535023-1-mic@digikod.net>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <bda2ffd7-3b7c-33a4-667f-a3435e112fc1@digikod.net>
Date: Fri, 9 Oct 2020 11:50:03 +0200
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <20201002071802.535023-1-mic@digikod.net>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0999xgLH011925
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 04:08:26 -0400
Cc: Deven Bowers <deven.desai@linux.microsoft.com>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	Milan Broz <gmazyland@gmail.com>,
	Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Subject: Re: [dm-devel] [PATCH v1] dm verity: Add support for signature
 verification with 2nd keyring
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksCgpXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIHBhdGNoPwoKUmVnYXJkcywKIE1pY2th
w6tsCgpPbiAwMi8xMC8yMDIwIDA5OjE4LCBNaWNrYcOrbCBTYWxhw7xuIHdyb3RlOgo+IEZyb206
IE1pY2thw6tsIFNhbGHDvG4gPG1pY0BsaW51eC5taWNyb3NvZnQuY29tPgo+IAo+IEFkZCBhIG5l
dyBETV9WRVJJVFlfVkVSSUZZX1JPT1RIQVNIX1NJR19TRUNPTkRBUllfS0VZUklORyBjb25maWd1
cmF0aW9uCj4gdG8gZW5hYmxlIGRtLXZlcml0eSBzaWduYXR1cmVzIHRvIGJlIHZlcmlmaWVkIGFn
YWluc3QgdGhlIHNlY29uZGFyeQo+IHRydXN0ZWQga2V5cmluZy4gIFRoaXMgYWxsb3dzIGNlcnRp
ZmljYXRlIHVwZGF0ZXMgd2l0aG91dCBrZXJuZWwgdXBkYXRlCj4gYW5kIHJlYm9vdCwgYWxpZ25p
bmcgd2l0aCBtb2R1bGUgYW5kIGtlcm5lbCAoa2V4ZWMpIHNpZ25hdHVyZQo+IHZlcmlmaWNhdGlv
bnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlja2HDq2wgU2FsYcO8biA8bWljQGxpbnV4Lm1pY3Jv
c29mdC5jb20+Cj4gQ2M6IEphc2thcmFuIEtodXJhbmEgPGphc2thcmFua2h1cmFuYUBsaW51eC5t
aWNyb3NvZnQuY29tPgo+IENjOiBNaWtlIFNuaXR6ZXIgPHNuaXR6ZXJAcmVkaGF0LmNvbT4KPiBD
YzogTWlsYW4gQnJveiA8Z21henlsYW5kQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZC9L
Y29uZmlnICAgICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKysrLQo+ICBkcml2ZXJzL21kL2Rt
LXZlcml0eS12ZXJpZnktc2lnLmMgfCAgOSArKysrKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
OSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21kL0tjb25maWcgYi9kcml2ZXJzL21kL0tjb25maWcKPiBpbmRleCAzMGJhMzU3MzYyNmMuLjYz
ODcwZmRmZThjZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21kL0tjb25maWcKPiArKysgYi9kcml2
ZXJzL21kL0tjb25maWcKPiBAQCAtNTMwLDExICs1MzAsMjIgQEAgY29uZmlnIERNX1ZFUklUWV9W
RVJJRllfUk9PVEhBU0hfU0lHCj4gIAlib29sICJWZXJpdHkgZGF0YSBkZXZpY2Ugcm9vdCBoYXNo
IHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gc3VwcG9ydCIKPiAgCWRlcGVuZHMgb24gRE1fVkVSSVRZ
Cj4gIAlzZWxlY3QgU1lTVEVNX0RBVEFfVkVSSUZJQ0FUSU9OCj4gLQkgIGhlbHAKPiArCS0tLWhl
bHAtLS0KPiAgCSAgQWRkIGFiaWxpdHkgZm9yIGRtLXZlcml0eSBkZXZpY2UgdG8gYmUgdmFsaWRh
dGVkIGlmIHRoZQo+ICAJICBwcmUtZ2VuZXJhdGVkIHRyZWUgb2YgY3J5cHRvZ3JhcGhpYyBjaGVj
a3N1bXMgcGFzc2VkIGhhcyBhIHBrY3MjNwo+ICAJICBzaWduYXR1cmUgZmlsZSB0aGF0IGNhbiB2
YWxpZGF0ZSB0aGUgcm9vdGhhc2ggb2YgdGhlIHRyZWUuCj4gIAo+ICsJICBCeSBkZWZhdWx0LCBy
ZWx5IG9uIHRoZSBidWlsdGluIHRydXN0ZWQga2V5cmluZy4KPiArCj4gKwkgIElmIHVuc3VyZSwg
c2F5IE4uCj4gKwo+ICtjb25maWcgRE1fVkVSSVRZX1ZFUklGWV9ST09USEFTSF9TSUdfU0VDT05E
QVJZX0tFWVJJTkcKPiArCWJvb2wgIlZlcml0eSBkYXRhIGRldmljZSByb290IGhhc2ggc2lnbmF0
dXJlIHZlcmlmaWNhdGlvbiB3aXRoIHNlY29uZGFyeSBrZXlyaW5nIgo+ICsJZGVwZW5kcyBvbiBE
TV9WRVJJVFlfVkVSSUZZX1JPT1RIQVNIX1NJRwo+ICsJZGVwZW5kcyBvbiBTRUNPTkRBUllfVFJV
U1RFRF9LRVlSSU5HCj4gKwktLS1oZWxwLS0tCj4gKwkgIFJlbHkgb24gdGhlIHNlY29uZGFyeSB0
cnVzdGVkIGtleXJpbmcgdG8gdmVyaWZ5IGRtLXZlcml0eSBzaWduYXR1cmVzLgo+ICsKPiAgCSAg
SWYgdW5zdXJlLCBzYXkgTi4KPiAgCj4gIGNvbmZpZyBETV9WRVJJVFlfRkVDCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWQvZG0tdmVyaXR5LXZlcmlmeS1zaWcuYyBiL2RyaXZlcnMvbWQvZG0tdmVy
aXR5LXZlcmlmeS1zaWcuYwo+IGluZGV4IDYxNGU0M2RiOTNhYS4uMjkzODVkYzQ3MGQ1IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbWQvZG0tdmVyaXR5LXZlcmlmeS1zaWcuYwo+ICsrKyBiL2RyaXZl
cnMvbWQvZG0tdmVyaXR5LXZlcmlmeS1zaWcuYwo+IEBAIC0xMTksOCArMTE5LDEzIEBAIGludCB2
ZXJpdHlfdmVyaWZ5X3Jvb3RfaGFzaChjb25zdCB2b2lkICpyb290X2hhc2gsIHNpemVfdCByb290
X2hhc2hfbGVuLAo+ICAJfQo+ICAKPiAgCXJldCA9IHZlcmlmeV9wa2NzN19zaWduYXR1cmUocm9v
dF9oYXNoLCByb290X2hhc2hfbGVuLCBzaWdfZGF0YSwKPiAtCQkJCXNpZ19sZW4sIE5VTEwsIFZF
UklGWUlOR19VTlNQRUNJRklFRF9TSUdOQVRVUkUsCj4gLQkJCQlOVUxMLCBOVUxMKTsKPiArCQkJ
CXNpZ19sZW4sCj4gKyNpZmRlZiBDT05GSUdfRE1fVkVSSVRZX1ZFUklGWV9ST09USEFTSF9TSUdf
U0VDT05EQVJZX0tFWVJJTkcKPiArCQkJCVZFUklGWV9VU0VfU0VDT05EQVJZX0tFWVJJTkcsCj4g
KyNlbHNlCj4gKwkJCQlOVUxMLAo+ICsjZW5kaWYKPiArCQkJCVZFUklGWUlOR19VTlNQRUNJRklF
RF9TSUdOQVRVUkUsIE5VTEwsIE5VTEwpOwo+ICAKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAKCgot
LQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

