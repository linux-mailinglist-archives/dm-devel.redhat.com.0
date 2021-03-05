Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3256232F24D
	for <lists+dm-devel@lfdr.de>; Fri,  5 Mar 2021 19:19:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614968386;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EbqmkbXjIEgmTSih4L39D5R9vY2PVhzCpGjxzOPLcpo=;
	b=FDRLP7ZEortJZj4JpGOogi/ABx1XPakvARyxOXl6OwXu9Yk1GoZ/HEYRmCNFyKbE6SfP2n
	D6W92qKGyTiWELEpIWfKFEOhTTeuEWCzAbWbjFLxA6Cd8b5Z1Btufzl41xhQa1UZQf0nZT
	sZCEen4sGRYUHbWi2SZ63Oa9yFzAWrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-9nfH9wJYPRW0vWe04L5dzw-1; Fri, 05 Mar 2021 13:19:43 -0500
X-MC-Unique: 9nfH9wJYPRW0vWe04L5dzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90C7287A826;
	Fri,  5 Mar 2021 18:19:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1AE1001B2C;
	Fri,  5 Mar 2021 18:19:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6F891809C86;
	Fri,  5 Mar 2021 18:19:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 125IJQRo026346 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Mar 2021 13:19:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1188B179B3; Fri,  5 Mar 2021 18:19:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (ovpn-114-106.ams2.redhat.com [10.36.114.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF3AD19CB0;
	Fri,  5 Mar 2021 18:19:23 +0000 (UTC)
To: Mike Snitzer <snitzer@redhat.com>
References: <20210302190555.201228400@debian-a64.vm>
	<33fa121a-88a8-5c27-0a43-a7efc9b5b3e3@linux.alibaba.com>
	<alpine.LRH.2.02.2103030505460.29593@file01.intranet.prod.int.rdu2.redhat.com>
	<157a750d-3d58-ae2e-07f1-b677c1b471c7@linux.alibaba.com>
	<bd447632-f174-e6f2-ddf8-d5385da13f6b@redhat.com>
	<fc9707dc-0a21-90d3-ed4f-e201406c50eb@redhat.com>
	<20210305180938.GA21127@redhat.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <bf889267-35cd-1b65-c411-4a08b6b5720f@redhat.com>
Date: Fri, 5 Mar 2021 19:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305180938.GA21127@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, caspar@linux.alibaba.com, hch@lst.de,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	JeffleXu <jefflexu@linux.alibaba.com>, io-uring@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMy81LzIxIDc6MDkgUE0sIE1pa2UgU25pdHplciB3cm90ZToKPiBPbiBGcmksIE1hciAwNSAy
MDIxIGF0IDEyOjU2cG0gLTA1MDAsCj4gSGVpbnogTWF1ZWxzaGFnZW4gPGhlaW56bUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+PiBPbiAzLzUvMjEgNjo0NiBQTSwgSGVpbnogTWF1ZWxzaGFnZW4gd3Jv
dGU6Cj4+PiBPbiAzLzUvMjEgMTA6NTIgQU0sIEplZmZsZVh1IHdyb3RlOgo+Pj4+IE9uIDMvMy8y
MSA2OjA5IFBNLCBNaWt1bGFzIFBhdG9ja2Egd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgMyBNYXIgMjAy
MSwgSmVmZmxlWHUgd3JvdGU6Cj4+Pj4+Cj4+Pj4+PiBPbiAzLzMvMjEgMzowNSBBTSwgTWlrdWxh
cyBQYXRvY2thIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+PiBTdXBwb3J0IEkvTyBwb2xsaW5nIGlmIHN1
Ym1pdF9iaW9fbm9hY2N0X21xX2RpcmVjdCByZXR1cm5lZCBub24tZW1wdHkKPj4+Pj4+PiBjb29r
aWUuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRv
Y2thQHJlZGhhdC5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiAgwqAgZHJpdmVycy9t
ZC9kbS5jIHzCoMKgwqAgNSArKysrKwo+Pj4+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4+Pj4+Pj4KPj4+Pj4+PiBJbmRleDogbGludXgtMi42L2RyaXZlcnMvbWQvZG0u
Ywo+Pj4+Pj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KPj4+Pj4+PiAtLS0gbGludXgtMi42Lm9yaWcvZHJpdmVycy9t
ZC9kbS5jwqDCoMKgIDIwMjEtMDMtMDIKPj4+Pj4+PiAxOToyNjozNC4wMDAwMDAwMDAgKzAxMDAK
Pj4+Pj4+PiArKysgbGludXgtMi42L2RyaXZlcnMvbWQvZG0uY8KgwqDCoCAyMDIxLTAzLTAyIDE5
OjI2OjM0LjAwMDAwMDAwMCArMDEwMAo+Pj4+Pj4+IEBAIC0xNjgyLDYgKzE2ODIsMTEgQEAgc3Rh
dGljIHZvaWQgX19zcGxpdF9hbmRfcHJvY2Vzc19iaW8oc3RydQo+Pj4+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqAgfQo+Pj4+Pj4+ICDCoMKgwqDCoMKgIH0KPj4+Pj4+PiAgwqAgK8KgwqDCoCBpZiAo
Y2kucG9sbF9jb29raWUgIT0gQkxLX1FDX1RfTk9ORSkgewo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCB3aGlsZSAoYXRvbWljX3JlYWQoJmNpLmlvLT5pb19jb3VudCkgPiAxICYmCj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxrX3BvbGwoY2kucG9sbF9xdWV1ZSwgY2kucG9s
bF9jb29raWUsIHRydWUpKSA7Cj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICDC
oMKgwqDCoMKgIC8qIGRyb3AgdGhlIGV4dHJhIHJlZmVyZW5jZSBjb3VudCAqLwo+Pj4+Pj4+ICDC
oMKgwqDCoMKgIGRlY19wZW5kaW5nKGNpLmlvLCBlcnJub190b19ibGtfc3RhdHVzKGVycm9yKSk7
Cj4+Pj4+Pj4gIMKgIH0KPj4+Pj4+IEl0IHNlZW1zIHRoYXQgdGhlIGdlbmVyYWwgaWRlYSBvZiB5
b3VyIGRlc2lnbiBpcyB0bwo+Pj4+Pj4gMSkgc3VibWl0ICpvbmUqIHNwbGl0IGJpbwo+Pj4+Pj4g
MikgYmxrX3BvbGwoKSwgd2FpdGluZyB0aGUgcHJldmlvdXNseSBzdWJtaXR0ZWQgc3BsaXQgYmlv
IGNvbXBsZXRzCj4+Pj4+IE5vLCBJIHN1Ym1pdCBhbGwgdGhlIGJpb3MgYW5kIHBvbGwgZm9yIHRo
ZSBsYXN0IG9uZS4KPj4+Pj4KPj4+Pj4+IGFuZCB0aGVuIHN1Ym1pdCBuZXh0IHNwbGl0IGJpbywg
cmVwZWF0aW5nIHRoZSBhYm92ZSBwcm9jZXNzLgo+Pj4+Pj4gSSdtIGFmcmFpZAo+Pj4+Pj4gdGhl
IHBlcmZvcm1hbmNlIG1heSBiZSBhbiBpc3N1ZSBoZXJlLCBzaW5jZSB0aGUgYmF0Y2ggZXZlcnkg
dGltZQo+Pj4+Pj4gYmxrX3BvbGwoKSByZWFwcyBtYXkgZGVjcmVhc2UuCj4+Pj4+IENvdWxkIHlv
dSBiZW5jaG1hcmsgaXQ/Cj4+Pj4gSSBvbmx5IHRlc3RlZCBkbS1saW5lYXIuCj4+Pj4KPj4+PiBU
aGUgY29uZmlndXJhdGlvbiAoZG0gdGFibGUpIG9mIGRtLWxpbmVhciBpczoKPj4+PiAwIDEwNDg1
NzYgbGluZWFyIC9kZXYvbnZtZTBuMSAwCj4+Pj4gMTA0ODU3NiAxMDQ4NTc2IGxpbmVhciAvZGV2
L252bWUybjEgMAo+Pj4+IDIwOTcxNTIgMTA0ODU3NiBsaW5lYXIgL2Rldi9udm1lNW4xIDAKPj4+
Pgo+Pj4+Cj4+Pj4gZmlvIHNjcmlwdCB1c2VkIGlzOgo+Pj4+IGBgYAo+Pj4+ICRjYXQgZmlvLmNv
bmYKPj4+PiBbZ2xvYmFsXQo+Pj4+IG5hbWU9aW91cmluZy1zcXBvbGwtaW9wb2xsLTEKPj4+PiBp
b2VuZ2luZT1pb191cmluZwo+Pj4+IGlvZGVwdGg9MTI4Cj4+Pj4gbnVtam9icz0xCj4+Pj4gdGhy
ZWFkCj4+Pj4gcnc9cmFuZHJlYWQKPj4+PiBkaXJlY3Q9MQo+Pj4+IHJlZ2lzdGVyZmlsZXM9MQo+
Pj4+IGhpcHJpPTEKPj4+PiBydW50aW1lPTEwCj4+Pj4gdGltZV9iYXNlZAo+Pj4+IGdyb3VwX3Jl
cG9ydGluZwo+Pj4+IHJhbmRyZXBlYXQ9MAo+Pj4+IGZpbGVuYW1lPS9kZXYvbWFwcGVyL3Rlc3Rk
ZXYKPj4+PiBicz00awo+Pj4+Cj4+Pj4gW2pvYi0xXQo+Pj4+IGNwdXNfYWxsb3dlZD0xNAo+Pj4+
IGBgYAo+Pj4+Cj4+Pj4gSU9QUyAoSVJRIG1vZGUpIHwgSU9QUyAoaW9wb2xsIG1vZGUgKGhpcHJp
PTEpKQo+Pj4+IC0tLS0tLS0tLS0tLS0tLSB8IC0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMjEzayB8wqDCoMKgwqDCoMKgwqDCoMKgwqAgMTlrCj4+Pj4K
Pj4+PiBBdCBsZWFzdCwgaXQgZG9lc24ndCB3b3JrIHdlbGwgd2l0aCBpb191cmluZyBpbnRlcmZh
Y2UuCj4+Pj4KPj4+Pgo+Pj4KPj4+IEplZmZsZSwKPj4+Cj4+PiBJIHJhbiB5b3VyIGFib3ZlIGZp
byB0ZXN0IG9uIGEgbGluZWFyIExWIHNwbGl0IGFjcm9zcyAzIE5WTWVzIHRvCj4+PiBzZWNvbmQg
eW91ciBzcGxpdCBtYXBwaW5nCj4+PiAoc3lzdGVtOiAzMiBjb3JlIEludGVsLCAyNTZHaUIgUkFN
KSBjb21wYXJpbmcgaW8gZW5naW5lcyBzeW5jLAo+Pj4gbGliYWlvIGFuZCBpb191cmluZywKPj4+
IHRoZSBsYXR0ZXIgdy8gYW5kIHcvbyBoaXByaSAoc3luYytsaWJhaW8gb2J2aW91c2x5IHcvbwo+
Pj4gcmVnaXN0ZXJmaWxlcyBhbmQgaGlwcmkpIHdoaWNoIHJlc3VsdGVkIG9rOgo+Pj4KPj4+Cj4+
Pgo+Pj4gc3luY8KgIHzCoCBsaWJhaW/CoCB8wqAgSVJRIG1vZGUgKGhpcHJpPTApIHwgaW9wb2xs
IChoaXByaT0xKQo+Pj4gLS0tLS0tfC0tLS0tLS0tLS18LS0tLS0tLS0tLS0tLS0tLS0tLS0tfC0t
LS0tLS0tLS0tLS0tLS0tIDU2LjNLCj4+PiB8wqDCoMKgIDI5MEvCoCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDMyOUsgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAzNTFLIEkgY2Fu
J3Qgc2Vjb25kCj4+PiB5b3VyIGRyYXN0aWMgaGlwcmk9MSBkcm9wIGhlcmUuLi4KPj4KPj4gU29y
cnksIGVtYWlsIG1lc3MuCj4+Cj4+Cj4+IHN5bmMgwqAgfMKgIGxpYmFpb8KgIHzCoCBJUlEgbW9k
ZSAoaGlwcmk9MCkgfCBpb3BvbGwgKGhpcHJpPTEpCj4+IC0tLS0tLS18LS0tLS0tLS0tLXwtLS0t
LS0tLS0tLS0tLS0tLS0tLS18LS0tLS0tLS0tLS0tLS0tLS0KPj4gNTYuM0vCoCB8wqDCoMKgIDI5
MEvCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDMyOUsgfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAzNTFLCj4+Cj4+Cj4+Cj4+IEkgY2FuJ3Qgc2Vjb25kIHlvdXIgZHJhc3RpYyBo
aXByaT0xIGRyb3AgaGVyZS4uLgo+IEkgdGhpbmsgeW91ciByZXN1bHQgaXMganVzdCBzaG93Y2Fz
aW5nIHlvdXIgcG93ZXJmdWwgc3lzdGVtJ3MgYWJpbGl0eSB0bwo+IHBvbGwgZXZlcnkgcmVsYXRl
ZCBIVyBxdWV1ZS4uIHdoZXJlYXMgSmVmZmxlJ3Mgc3lzdGVtIGlzIGxpa2VseSBzb21laG93Cj4g
bW9yZSBjb25zdHJhaW5lZCAob24gYSBjcHUgbGV2ZWwsIG1lbW9yeSwgd2hhdGV2ZXIpLgoKSmVm
ZmxlLAoKbWluZCBleHBsYWluaW5nIHlvdXIgdGVzdCBzeXN0ZW0gY29uZmlndXJhdGlvbiBhIGJp
dCBtb3JlIChjb3JlcywgcmFtLCAKaS9vIGNvbmZpZyB0byB5b3VyIE5WTWVzKQpzbyB0aGF0IHdl
IGhhdmUgYSBiZXR0ZXIgYmFzZSBmb3Igc3VjaCBhc3N1bXB0aW9uPwoKVGhhbmtzLApIZWluegoK
Pgo+IE15IGJhc2lzIGZvciB0aGlzIGlzIHRoYXQgTWlrdWxhcycgY2hhbmdlcyBzaW1wbHkgYWx3
YXlzIHJldHVybiBhbgo+IGludmFsaWQgY29va2llIChCTEtfUUNfVF9OT05FKSBmb3IgcHVycG9z
ZXMgb2YgaW50ZWxsaWdlbnQgSU8gcG9sbGluZy4KPgo+IFN1Y2ggYW4gaW1wbGVtZW50YXRpb24g
aXMgY29tcGxldGVseSBpbnZhbGlkLgo+Cj4gSSBkaXNjdXNzZWQgd2l0aCBKZW5zIGFuZCBoZSBz
YWlkOgo+ICJpdCBuZWVkcyB0byByZXR1cm4gc29tZXRoaW5nIHRoYXQgZl9vcC0+aW9wb2xsKCkg
Y2FuIG1ha2Ugc2Vuc2Ugb2YuCj4gb3RoZXJ3aXNlIHlvdSBoYXZlIG5vIG9wdGlvbiBidXQgdG8g
dHJ5IGV2ZXJ5dGhpbmcuIgo+Cj4gTWlrZQo+Cj4gLS0KPiBkbS1kZXZlbCBtYWlsaW5nIGxpc3QK
PiBkbS1kZXZlbEByZWRoYXQuY29tCj4gaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbAoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJl
ZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1k
ZXZlbA==

