Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 090C41BE7A7
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 21:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588189685;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mbY8ip4G0bduIq9VZv+mvsLz9NZ/hETO/cF3LiSDokw=;
	b=G4Y6Ag4id9a4I1oCb73efNZzf/0qheUswGZ8MDTsTG7B+1ddMMIcRZDtAqihxDedmjLa/T
	UBS5qZKTgW4gR94mFF9dOWb6OCkS0GUWgO4TiGESv6VNI7SDMAOsT87Ao+ucwc6oAtB7v8
	ZTU+kA/lrs4TC9XGmEyVHt5SBHiWTZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-_Dnl89LaMO61OZw4zOZ1eg-1; Wed, 29 Apr 2020 15:47:36 -0400
X-MC-Unique: _Dnl89LaMO61OZw4zOZ1eg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15F0C80058A;
	Wed, 29 Apr 2020 19:47:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C8E860BF4;
	Wed, 29 Apr 2020 19:47:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F330C1809541;
	Wed, 29 Apr 2020 19:47:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TJlJ98007079 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 15:47:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03FCF79B6; Wed, 29 Apr 2020 19:47:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (unknown [10.40.193.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39254196AE;
	Wed, 29 Apr 2020 19:47:15 +0000 (UTC)
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>
References: <alpine.LRH.2.02.2004291225140.3914@file01.intranet.prod.int.rdu2.redhat.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <36ff2aa8-6357-45cd-a507-27392e5de724@redhat.com>
Date: Wed, 29 Apr 2020 21:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2004291225140.3914@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-writecache: improve performance on
 Optane-based persistent memory
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

T24gNC8yOS8yMCA2OjMwIFBNLCBNaWt1bGFzIFBhdG9ja2Egd3JvdGU6Cj4gSGkKPgo+IFRoaXMg
aXMgdGhlIGNsZmx1c2hvcHQgcGF0Y2ggZm9yIHRoZSBuZXh0IG1lcmdlIHdpbmRvdy4KPgo+IE1p
a3VsYXMKPgo+Cj4gRnJvbTogTWlrdWxhcyBQYXRvY2thIDxtcGF0b2NrYUByZWRoYXQuY29tPgo+
Cj4gV2hlbiB0ZXN0aW5nIHRoZSBkbS13cml0ZWNhY2hlIHRhcmdldCBvbiBhIHJlYWwgT3B0YW5l
LWJhc2VkIHBlcnNpc3RlbnQKPiBtZW1vcnksIGl0IHR1cm5lZCBvdXQgdGhhdCBleHBsaWNpdCBj
YWNoZSBmbHVzaGluZyB1c2luZyB0aGUgY2xmbHVzaG9wdAo+IGluc3RydWN0aW9uIHBlcmZvcm1z
IGJldHRlciB0aGFuIG5vbi10ZW1wb3JhbCBzdG9yZXMgZm9yIGJsb2NrIHNpemVzIDFrLAo+IDJr
IGFuZCA0ay4KPgo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBmdW5jdGlvbiBtZW1jcHlfZmx1c2hj
YWNoZV9vcHRpbWl6ZWQgdGhhdCB0ZXN0cyBpZgo+IGNsZmx1c2hvcHQgaXMgcHJlc2VudCAtIGFu
ZCBpZiBpdCBpcywgd2UgdXNlIGl0IGluc3RlYWQgb2YKPiBtZW1jcHlfZmx1c2hjYWNoZS4KPgo+
IFNpZ25lZC1vZmYtYnk6IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FAcmVkaGF0LmNvbT4KPgo+
IC0tLQo+ICAgZHJpdmVycy9tZC9kbS13cml0ZWNhY2hlLmMgfCAgIDI5ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gSW5kZXg6IGxpbnV4LTIuNi9kcml2ZXJzL21kL2RtLXdyaXRlY2FjaGUu
Ywo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KPiAtLS0gbGludXgtMi42Lm9yaWcvZHJpdmVycy9tZC9kbS13cml0ZWNh
Y2hlLmMJMjAyMC0wNC0yOSAxODowOTo1My41OTk5OTkwMDAgKzAyMDAKPiArKysgbGludXgtMi42
L2RyaXZlcnMvbWQvZG0td3JpdGVjYWNoZS5jCTIwMjAtMDQtMjkgMTg6MjI6MzYuMTM5OTk5MDAw
ICswMjAwCj4gQEAgLTExMzcsNiArMTEzNywzMyBAQCBzdGF0aWMgaW50IHdyaXRlY2FjaGVfbWVz
c2FnZShzdHJ1Y3QgZG1fCj4gICAJcmV0dXJuIHI7Cj4gICB9Cj4gICAKPiArc3RhdGljIHZvaWQg
bWVtY3B5X2ZsdXNoY2FjaGVfb3B0aW1pemVkKHZvaWQgKmRlc3QsIHZvaWQgKnNvdXJjZSwgc2l6
ZV90IHNpemUpCj4gK3sKPiArCS8qCj4gKwkgKiBjbHVmaHNvcHQgcGVyZm9ybXMgYmV0dGVyIHdp
dGggYmxvY2sgc2l6ZSAxMDI0LCAyMDQ4LCA0MDk2CgoKVHlwbzrCoMKgwqDCoMKgwqAgXmNsZmx1
c2hvcHQKCkhlaW56CgoKPiArCSAqIG5vbi10ZW1wb3JhbCBzdG9yZXMgcGVyZm9ybSBiZXR0ZXIg
d2l0aCBibG9jayBzaXplIDUxMgo+ICsJICoKPiArCSAqIGJsb2NrIHNpemUgICA1MTIgICAgICAg
ICAgICAgMTAyNCAgICAgICAgICAgIDIwNDggICAgICAgICAgICA0MDk2Cj4gKwkgKiBtb3ZudGkg
ICAgICAgNDk2IE1CL3MgICAgICAgIDY0MiBNQi9zICAgICAgICA3MjUgTUIvcyAgICAgICAgNzQ0
IE1CL3MKPiArCSAqIGNsZmx1c2hvcHQgICAzNzMgTUIvcyAgICAgICAgNjg4IE1CL3MgICAgICAg
IDEuMSBHQi9zICAgICAgICAxLjIgR0Ivcwo+ICsJICovCj4gKyNpZmRlZiBDT05GSUdfWDg2Cj4g
KwlpZiAoc3RhdGljX2NwdV9oYXMoWDg2X0ZFQVRVUkVfQ0xGTFVTSE9QVCkgJiYKPiArCSAgICBs
aWtlbHkoYm9vdF9jcHVfZGF0YS54ODZfY2xmbHVzaF9zaXplID09IDY0KSAmJgo+ICsJICAgIGxp
a2VseShzaXplID49IDc2OCkpIHsKPiArCQlkbyB7Cj4gKwkJCW1lbWNweSgodm9pZCAqKWRlc3Qs
ICh2b2lkICopc291cmNlLCA2NCk7Cj4gKwkJCWNsZmx1c2hvcHQoKHZvaWQgKilkZXN0KTsKPiAr
CQkJZGVzdCArPSA2NDsKPiArCQkJc291cmNlICs9IDY0Owo+ICsJCQlzaXplIC09IDY0Owo+ICsJ
CX0gd2hpbGUgKHNpemUgPj0gNjQpOwo+ICsJCXJldHVybjsKPiArCX0KPiArI2VuZGlmCj4gKwlt
ZW1jcHlfZmx1c2hjYWNoZShkZXN0LCBzb3VyY2UsIHNpemUpOwo+ICt9Cj4gKwo+ICAgc3RhdGlj
IHZvaWQgYmlvX2NvcHlfYmxvY2soc3RydWN0IGRtX3dyaXRlY2FjaGUgKndjLCBzdHJ1Y3QgYmlv
ICpiaW8sIHZvaWQgKmRhdGEpCj4gICB7Cj4gICAJdm9pZCAqYnVmOwo+IEBAIC0xMTYyLDcgKzEx
ODksNyBAQCBzdGF0aWMgdm9pZCBiaW9fY29weV9ibG9jayhzdHJ1Y3QgZG1fd3JpCj4gICAJCQl9
Cj4gICAJCX0gZWxzZSB7Cj4gICAJCQlmbHVzaF9kY2FjaGVfcGFnZShiaW9fcGFnZShiaW8pKTsK
PiAtCQkJbWVtY3B5X2ZsdXNoY2FjaGUoZGF0YSwgYnVmLCBzaXplKTsKPiArCQkJbWVtY3B5X2Zs
dXNoY2FjaGVfb3B0aW1pemVkKGRhdGEsIGJ1Ziwgc2l6ZSk7Cj4gICAJCX0KPiAgIAo+ICAgCQli
dmVjX2t1bm1hcF9pcnEoYnVmLCAmZmxhZ3MpOwo+Cj4gLS0KPiBkbS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkbS1kZXZlbEByZWRoYXQuY29tCj4gaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2RtLWRldmVsCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVk
aGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

