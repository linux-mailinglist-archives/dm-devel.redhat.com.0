Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E65332F1A9
	for <lists+dm-devel@lfdr.de>; Fri,  5 Mar 2021 18:47:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614966424;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FWvLWWjpnfAZlAqwhiAcS9OLqvcRocul/KCUMq5gfJM=;
	b=ZGLPb67guWUGR7/ETsVwFi2lNsIOQyq8yPNKTMDya5uMlJZX+yuK1Acc5zHGUIhoMSJW/J
	m+2JtheBFXYdy4GO1mgLZFcxEJ9pTWvI7iwGAtNXege0++C2gNshGXrnE9G79MZ9BkkYz5
	Rojjfbsy9W8gQJ7hGJauqUoX7QmrvO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-8MD-JQQ4OPKM4mz8Tyk1Lw-1; Fri, 05 Mar 2021 12:47:02 -0500
X-MC-Unique: 8MD-JQQ4OPKM4mz8Tyk1Lw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 040AF1005D4C;
	Fri,  5 Mar 2021 17:46:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F17DC1C92F;
	Fri,  5 Mar 2021 17:46:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 846025002E;
	Fri,  5 Mar 2021 17:46:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 125HkRvn023133 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Mar 2021 12:46:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E70A05D6DC; Fri,  5 Mar 2021 17:46:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (ovpn-114-106.ams2.redhat.com [10.36.114.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1A05D6B1;
	Fri,  5 Mar 2021 17:46:25 +0000 (UTC)
To: JeffleXu <jefflexu@linux.alibaba.com>,
	Mikulas Patocka <mpatocka@redhat.com>
References: <20210302190555.201228400@debian-a64.vm>
	<33fa121a-88a8-5c27-0a43-a7efc9b5b3e3@linux.alibaba.com>
	<alpine.LRH.2.02.2103030505460.29593@file01.intranet.prod.int.rdu2.redhat.com>
	<157a750d-3d58-ae2e-07f1-b677c1b471c7@linux.alibaba.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <bd447632-f174-e6f2-ddf8-d5385da13f6b@redhat.com>
Date: Fri, 5 Mar 2021 18:46:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <157a750d-3d58-ae2e-07f1-b677c1b471c7@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Mike Snitzer <msnitzer@redhat.com>,
	caspar@linux.alibaba.com, io-uring@vger.kernel.org,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, hch@lst.de
Subject: Re: [dm-devel] [PATCH 4/4] dm: support I/O polling
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMy81LzIxIDEwOjUyIEFNLCBKZWZmbGVYdSB3cm90ZToKPgo+IE9uIDMvMy8yMSA2OjA5IFBN
LCBNaWt1bGFzIFBhdG9ja2Egd3JvdGU6Cj4+Cj4+IE9uIFdlZCwgMyBNYXIgMjAyMSwgSmVmZmxl
WHUgd3JvdGU6Cj4+Cj4+Pgo+Pj4gT24gMy8zLzIxIDM6MDUgQU0sIE1pa3VsYXMgUGF0b2NrYSB3
cm90ZToKPj4+Cj4+Pj4gU3VwcG9ydCBJL08gcG9sbGluZyBpZiBzdWJtaXRfYmlvX25vYWNjdF9t
cV9kaXJlY3QgcmV0dXJuZWQgbm9uLWVtcHR5Cj4+Pj4gY29va2llLgo+Pj4+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogTWlrdWxhcyBQYXRvY2thIDxtcGF0b2NrYUByZWRoYXQuY29tPgo+Pj4+Cj4+Pj4g
LS0tCj4+Pj4gICBkcml2ZXJzL21kL2RtLmMgfCAgICA1ICsrKysrCj4+Pj4gICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBJbmRleDogbGludXgtMi42L2RyaXZlcnMv
bWQvZG0uYwo+Pj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KPj4+PiAtLS0gbGludXgtMi42Lm9yaWcvZHJpdmVycy9t
ZC9kbS5jCTIwMjEtMDMtMDIgMTk6MjY6MzQuMDAwMDAwMDAwICswMTAwCj4+Pj4gKysrIGxpbnV4
LTIuNi9kcml2ZXJzL21kL2RtLmMJMjAyMS0wMy0wMiAxOToyNjozNC4wMDAwMDAwMDAgKzAxMDAK
Pj4+PiBAQCAtMTY4Miw2ICsxNjgyLDExIEBAIHN0YXRpYyB2b2lkIF9fc3BsaXRfYW5kX3Byb2Nl
c3NfYmlvKHN0cnUKPj4+PiAgIAkJfQo+Pj4+ICAgCX0KPj4+PiAgIAo+Pj4+ICsJaWYgKGNpLnBv
bGxfY29va2llICE9IEJMS19RQ19UX05PTkUpIHsKPj4+PiArCQl3aGlsZSAoYXRvbWljX3JlYWQo
JmNpLmlvLT5pb19jb3VudCkgPiAxICYmCj4+Pj4gKwkJICAgICAgIGJsa19wb2xsKGNpLnBvbGxf
cXVldWUsIGNpLnBvbGxfY29va2llLCB0cnVlKSkgOwo+Pj4+ICsJfQo+Pj4+ICsKPj4+PiAgIAkv
KiBkcm9wIHRoZSBleHRyYSByZWZlcmVuY2UgY291bnQgKi8KPj4+PiAgIAlkZWNfcGVuZGluZyhj
aS5pbywgZXJybm9fdG9fYmxrX3N0YXR1cyhlcnJvcikpOwo+Pj4+ICAgfQo+Pj4gSXQgc2VlbXMg
dGhhdCB0aGUgZ2VuZXJhbCBpZGVhIG9mIHlvdXIgZGVzaWduIGlzIHRvCj4+PiAxKSBzdWJtaXQg
Km9uZSogc3BsaXQgYmlvCj4+PiAyKSBibGtfcG9sbCgpLCB3YWl0aW5nIHRoZSBwcmV2aW91c2x5
IHN1Ym1pdHRlZCBzcGxpdCBiaW8gY29tcGxldHMKPj4gTm8sIEkgc3VibWl0IGFsbCB0aGUgYmlv
cyBhbmQgcG9sbCBmb3IgdGhlIGxhc3Qgb25lLgo+Pgo+Pj4gYW5kIHRoZW4gc3VibWl0IG5leHQg
c3BsaXQgYmlvLCByZXBlYXRpbmcgdGhlIGFib3ZlIHByb2Nlc3MuIEknbSBhZnJhaWQKPj4+IHRo
ZSBwZXJmb3JtYW5jZSBtYXkgYmUgYW4gaXNzdWUgaGVyZSwgc2luY2UgdGhlIGJhdGNoIGV2ZXJ5
IHRpbWUKPj4+IGJsa19wb2xsKCkgcmVhcHMgbWF5IGRlY3JlYXNlLgo+PiBDb3VsZCB5b3UgYmVu
Y2htYXJrIGl0Pwo+IEkgb25seSB0ZXN0ZWQgZG0tbGluZWFyLgo+Cj4gVGhlIGNvbmZpZ3VyYXRp
b24gKGRtIHRhYmxlKSBvZiBkbS1saW5lYXIgaXM6Cj4gMCAxMDQ4NTc2IGxpbmVhciAvZGV2L252
bWUwbjEgMAo+IDEwNDg1NzYgMTA0ODU3NiBsaW5lYXIgL2Rldi9udm1lMm4xIDAKPiAyMDk3MTUy
IDEwNDg1NzYgbGluZWFyIC9kZXYvbnZtZTVuMSAwCj4KPgo+IGZpbyBzY3JpcHQgdXNlZCBpczoK
PiBgYGAKPiAkY2F0IGZpby5jb25mCj4gW2dsb2JhbF0KPiBuYW1lPWlvdXJpbmctc3Fwb2xsLWlv
cG9sbC0xCj4gaW9lbmdpbmU9aW9fdXJpbmcKPiBpb2RlcHRoPTEyOAo+IG51bWpvYnM9MQo+IHRo
cmVhZAo+IHJ3PXJhbmRyZWFkCj4gZGlyZWN0PTEKPiByZWdpc3RlcmZpbGVzPTEKPiBoaXByaT0x
Cj4gcnVudGltZT0xMAo+IHRpbWVfYmFzZWQKPiBncm91cF9yZXBvcnRpbmcKPiByYW5kcmVwZWF0
PTAKPiBmaWxlbmFtZT0vZGV2L21hcHBlci90ZXN0ZGV2Cj4gYnM9NGsKPgo+IFtqb2ItMV0KPiBj
cHVzX2FsbG93ZWQ9MTQKPiBgYGAKPgo+IElPUFMgKElSUSBtb2RlKSB8IElPUFMgKGlvcG9sbCBt
b2RlIChoaXByaT0xKSkKPiAtLS0tLS0tLS0tLS0tLS0gfCAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAgICAgICAgICAgIDIxM2sgfAkJICAgMTlrCj4KPiBBdCBsZWFzdCwgaXQgZG9lc24ndCB3b3Jr
IHdlbGwgd2l0aCBpb191cmluZyBpbnRlcmZhY2UuCj4KPgoKCkplZmZlLAoKSSByYW4geW91ciBh
Ym92ZSBmaW8gdGVzdCBvbiBhIGxpbmVhciBMViBzcGxpdCBhY3Jvc3MgMyBOVk1lcyB0byBzZWNv
bmQgeW91ciBzcGxpdCBtYXBwaW5nCihzeXN0ZW06IDMyIGNvcmUgSW50ZWwsIDI1NkdpQiBSQU0p
IGNvbXBhcmluZyBpbyBlbmdpbmVzIHN5bmMsIGxpYmFpbyBhbmQgaW9fdXJpbmcsCnRoZSBsYXR0
ZXIgdy8gYW5kIHcvbyBoaXByaSAoc3luYytsaWJhaW8gb2J2aW91c2x5IHcvbyByZWdpc3RlcmZp
bGVzIGFuZCBoaXByaSkgd2hpY2ggcmVzdWx0ZWQgb2s6CgoKCnN5bmPCoCB8wqAgbGliYWlvwqAg
fMKgIElSUSBtb2RlIChoaXByaT0wKSB8IGlvcG9sbCAoaGlwcmk9MSkgCi0tLS0tLXwtLS0tLS0t
LS0tfC0tLS0tLS0tLS0tLS0tLS0tLS0tLXwtLS0tLS0tLS0tLS0tLS0tLSA1Ni4zSyB8wqDCoMKg
IAoyOTBLwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAzMjlLIHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgMzUxSyBJIGNhbid0IHNlY29uZCB5b3VyIApkcmFzdGljIGhpcHJpPTEg
ZHJvcCBoZXJlLi4uCkhlaW56CgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVk
aGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRl
dmVs

