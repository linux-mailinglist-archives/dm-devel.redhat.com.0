Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B23DC13FC63
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jan 2020 23:47:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579214866;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pF3AfXeZLVT9h1KZmKFZa2Rn3LP4+Dxb9sdzvFq3Q5Q=;
	b=hCtcC1PwMXRoSQgWIvclOpIkiSjAOZ2vqY42XcNf0fx+7mZpxiuGYfe4kMcMq5ZnisG1P/
	i9oIDOKYBX0soLUIHLSTct9TU7hhEP1cIjouNkCQKjfJjDVBpie1/TShCAXMAETeCgrfFy
	bE8nvmYMsWso0FSbLyLROe6uhPaAOqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-RXQRcLI4MLqIc7XHQWQgZg-1; Thu, 16 Jan 2020 17:47:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE504800A02;
	Thu, 16 Jan 2020 22:47:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A09755D9CD;
	Thu, 16 Jan 2020 22:47:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4432845FA;
	Thu, 16 Jan 2020 22:47:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00GMlKmo021587 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 17:47:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C0081109E751; Thu, 16 Jan 2020 22:47:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB2E5109E750
	for <dm-devel@redhat.com>; Thu, 16 Jan 2020 22:47:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57FC61011A78
	for <dm-devel@redhat.com>; Thu, 16 Jan 2020 22:47:18 +0000 (UTC)
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
	[192.185.46.225]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-67-bhMMY62OOAyFe1xtTAxvhw-1; Thu, 16 Jan 2020 17:47:14 -0500
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
	by gateway22.websitewelcome.com (Postfix) with ESMTP id 66D5111560
	for <dm-devel@redhat.com>; Thu, 16 Jan 2020 16:47:13 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id sDuzikbZBHiO0sDuziiArn; Thu, 16 Jan 2020 16:47:13 -0600
X-Authority-Reason: nr=8
Received: from [196.157.145.80] (port=9759 helo=[192.168.100.109])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1isDuy-001GJh-B5; Thu, 16 Jan 2020 15:47:12 -0700
To: Mikulas Patocka <mpatocka@redhat.com>, dm-devel@redhat.com
References: <b0341161-1a49-d03a-d096-abf3a81d319c@petasan.org>
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <29b129ad-8d42-cb55-14c5-d595615d2610@petasan.org>
Date: Fri, 17 Jan 2020 00:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <b0341161-1a49-d03a-d096-abf3a81d319c@petasan.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.157.145.80
X-Source-L: No
X-Exim-ID: 1isDuy-001GJh-B5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.109]) [196.157.145.80]:9759
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 8
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-MC-Unique: bhMMY62OOAyFe1xtTAxvhw-1
X-MC-Unique: RXQRcLI4MLqIc7XHQWQgZg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00GMlKmo021587
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-writecache: improve performance of large
 linear writes on SSDs
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

Cgo+IEZyb206IE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2EgcmVkaGF0IGNvbT4KPiBUbzogTWlr
ZSBTbml0emVyIDxtc25pdHplciByZWRoYXQgY29tPiwgTmlraGlsIEtzaGlyc2FnYXIgPG5rc2hp
cnNhIAo+IHJlZGhhdCBjb20+Cj4gQ2M6IGRtLWRldmVsIHJlZGhhdCBjb20KPiBTdWJqZWN0OiBb
ZG0tZGV2ZWxdIFtQQVRDSF0gZG0td3JpdGVjYWNoZTogaW1wcm92ZSBwZXJmb3JtYW5jZSBvZiBs
YXJnZSAKPiBsaW5lYXIgd3JpdGVzIG9uIFNTRHMKPiBEYXRlOiBXZWQsIDE1IEphbiAyMDIwIDA0
OjM1OjIyIC0wNTAwIChFU1QpCj4gCj4gV2hlbiBkbS13cml0ZWNhY2hlIGlzIHVzZWQgd2l0aCBT
U0QgYXMgYSBjYWNoZSBkZXZpY2UsIGl0IHdvdWxkIHN1Ym1pdAo+IHNlcGFyYXRlIGJpbyBmb3Ig
ZWFjaCB3cml0dGVuIGJsb2NrLiBUaGUgSS9PcyB3b3VsZCBiZSBtZXJnZWQgYnkgdGhlIGRpc2sK
PiBzY2hlZHVsZXIsIGJ1dCB0aGlzIG1lcmdpbmcgZGVncmFkZXMgcGVyZm9ybWFuY2UuCj4gCj4g
VGhpcyBwYXRjaCBtYWtlcyBkbS13cml0ZWNhY2hlIHN1Ym1pdCBsYXJnZXIgYmlvcyAtIHdlIGNh
biBzdWJtaXQgbGFyZ2UKPiBiaW8gYXMgbG9uZyBhcyB0aGVyZSBpcyBjb25zZWN1dGl2ZSBmcmVl
IHNwYWNlIG9uIHRoZSBjYWNoZSBkZXZpY2UuCj4gCj4gQmVuY2htYXJrIChhcm02NCB3aXRoIDY0
ayBwYWdlIHNpemUsIHVzaW5nIC9kZXYvcmFtMCBhcyBhIGNhY2hlIGRldmljZSk6Cj4gCj4gZmlv
IC0tYnM9NTEyayAtLWlvZGVwdGg9MzIgLS1zaXplPTQwME0gLS1kaXJlY3Q9MSAKPiAtLWZpbGVu
YW1lPS9kZXYvbWFwcGVyL2NhY2hlIC0tcnc9cmFuZHdyaXRlIC0tbnVtam9icz0xIC0tbmFtZT10
ZXN0Cj4gCj4gYmxvY2vCoMKgIG9sZMKgwqDCoCBuZXcKPiBzaXplwqDCoMKgIE1pQi9zwqAgTWlC
L3MKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA1MTIJMTgxwqDCoMKgICA3MDAKPiAxawkzNDfC
oMKgwqAgIDEyNTYKPiAyayAgICA2NDTCoMKgwqAgIDIwMjAKPiA0a8KgwqDCoCAxMTgzwqDCoMKg
IDI3NTkKPiA4a8KgwqDCoCAxODUywqDCoMKgIDMzMzMKPiAxNmvCoMKgIDI0NjnCoMKgwqAgMzUw
OQo+IDMya8KgwqAgMjk3NMKgwqDCoCAzNjcwCj4gNjRrwqDCoCAzNDA0wqDCoMKgIDM4MTAKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRvY2thIHJlZGhhdCBjb20+Cj4g
Cj4gLS0tCj4gIMKgZHJpdmVycy9tZC9kbS13cml0ZWNhY2hlLmMgfMKgwqAgMjggKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLQo+ICDCoDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+IAo+IEluZGV4OiBsaW51eC0yLjYvZHJpdmVycy9tZC9kbS13cml0
ZWNhY2hlLmMKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Cj4gLS0tIGxpbnV4LTIuNi5vcmlnL2RyaXZlcnMvbWQvZG0t
d3JpdGVjYWNoZS5jwqDCoMKgIDIwMjAtMDEtMTQgCj4gMTY6MTE6MDkuMDAwMDAwMDAwICswMTAw
Cj4gKysrIGxpbnV4LTIuNi9kcml2ZXJzL21kL2RtLXdyaXRlY2FjaGUuY8KgwqDCoCAyMDIwLTAx
LTE0IAo+IDIxOjQyOjQ0LjAwMDAwMDAwMCArMDEwMAo+IEBAIC02MjYsNyArNjI2LDcgQEAgc3Rh
dGljIHZvaWQgd3JpdGVjYWNoZV9hZGRfdG9fZnJlZWxpc3Qocwo+ICDCoMKgwqDCoCB3Yy0+ZnJl
ZWxpc3Rfc2l6ZSsrOwo+ICDCoH0KPiAKPiAtc3RhdGljIHN0cnVjdCB3Y19lbnRyeSAqd3JpdGVj
YWNoZV9wb3BfZnJvbV9mcmVlbGlzdChzdHJ1Y3QgCj4gZG1fd3JpdGVjYWNoZSAqd2MpCj4gK3N0
YXRpYyBzdHJ1Y3Qgd2NfZW50cnkgKndyaXRlY2FjaGVfcG9wX2Zyb21fZnJlZWxpc3Qoc3RydWN0
IAo+IGRtX3dyaXRlY2FjaGUgKndjLCBzZWN0b3JfdCBleHBlY3RlZF9zZWN0b3IpCj4gIMKgewo+
ICDCoMKgwqDCoCBzdHJ1Y3Qgd2NfZW50cnkgKmU7Cj4gCj4gQEAgLTYzNSw2ICs2MzUsOCBAQCBz
dGF0aWMgc3RydWN0IHdjX2VudHJ5ICp3cml0ZWNhY2hlX3BvcF9mCj4gIMKgwqDCoMKgwqDCoMKg
wqAgaWYgKHVubGlrZWx5KCF3Yy0+Y3VycmVudF9mcmVlKSkKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBOVUxMOwo+ICDCoMKgwqDCoMKgwqDCoMKgIGUgPSB3Yy0+Y3VycmVudF9m
cmVlOwo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZXhwZWN0ZWRfc2VjdG9yICE9IChzZWN0b3JfdCkt
MSAmJiAKPiB1bmxpa2VseShjYWNoZV9zZWN0b3Iod2MsIGUpICE9IGV4cGVjdGVkX3NlY3Rvcikp
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7Cj4gIMKgwqDCoMKgwqDCoMKg
wqAgbmV4dCA9IHJiX25leHQoJmUtPnJiX25vZGUpOwo+ICDCoMKgwqDCoMKgwqDCoMKgIHJiX2Vy
YXNlKCZlLT5yYl9ub2RlLCAmd2MtPmZyZWV0cmVlKTsKPiAgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
dW5saWtlbHkoIW5leHQpKQo+IEBAIC02NDQsNiArNjQ2LDggQEAgc3RhdGljIHN0cnVjdCB3Y19l
bnRyeSAqd3JpdGVjYWNoZV9wb3BfZgo+ICDCoMKgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseShs
aXN0X2VtcHR5KCZ3Yy0+ZnJlZWxpc3QpKSkKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBOVUxMOwo+ICDCoMKgwqDCoMKgwqDCoMKgIGUgPSBjb250YWluZXJfb2Yod2MtPmZyZWVs
aXN0Lm5leHQsIHN0cnVjdCB3Y19lbnRyeSwgbHJ1KTsKPiArwqDCoMKgwqDCoMKgwqAgaWYgKGV4
cGVjdGVkX3NlY3RvciAhPSAoc2VjdG9yX3QpLTEgJiYgCj4gdW5saWtlbHkoY2FjaGVfc2VjdG9y
KHdjLCBlKSAhPSBleHBlY3RlZF9zZWN0b3IpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBOVUxMOwo+ICDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfZGVsKCZlLT5scnUpOwo+ICDCoMKg
wqDCoCB9Cj4gIMKgwqDCoMKgIHdjLT5mcmVlbGlzdF9zaXplLS07Cj4gQEAgLTExOTQsNyArMTE5
OCw3IEBAIHJlYWRfbmV4dF9ibG9jazoKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIGJpb19jb3B5Owo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZSA9IHdyaXRlY2FjaGVfcG9wX2Zyb21fZnJlZWxpc3Qod2MpOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGUgPSB3cml0ZWNhY2hlX3BvcF9mcm9tX2ZyZWVsaXN0KHdjLCAoc2VjdG9y
X3QpLTEpOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KCFlKSkgewo+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZWNhY2hlX3dhaXRfb25fZnJl
ZWxpc3Qod2MpOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsK
PiBAQCAtMTIwNiw5ICsxMjEwLDI1IEBAIGJpb19jb3B5Ogo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKFdDX01PREVfUE1FTSh3YykpIHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYmlvX2NvcHlfYmxvY2sod2MsIGJpbywgbWVtb3J5X2RhdGEod2MsIGUpKTsKPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkbV9hY2NlcHRfcGFydGlhbF9iaW8oYmlvLCB3Yy0+YmxvY2tfc2l6ZSA+PiAK
PiBTRUNUT1JfU0hJRlQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgYmlvX3NpemUgPSB3Yy0+YmxvY2tfc2l6ZTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNlY3Rvcl90IHN0YXJ0X2NhY2hlX3NlYyA9IGNhY2hlX3NlY3Rvcih3YywgZSk7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWN0b3JfdCBjdXJyZW50X2NhY2hlX3Nl
YyA9IHN0YXJ0X2NhY2hlX3NlYyArIAo+IChiaW9fc2l6ZSA+PiBTRUNUT1JfU0hJRlQpOwo+ICsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdoaWxlIChiaW9fc2l6ZSA8IGJpby0+
YmlfaXRlci5iaV9zaXplKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCB3Y19lbnRyeSAqZiA9IAo+IHdyaXRlY2FjaGVfcG9wX2Zyb21fZnJlZWxpc3Qo
d2MsIGN1cnJlbnRfY2FjaGVfc2VjKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKCFmKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB3cml0ZV9vcmlnaW5hbF9zZWN0b3Jfc2VxX2NvdW50KHdjLCBmLCAKPiBiaW8tPmJpX2l0ZXIu
Ymlfc2VjdG9yICsgKGJpb19zaXplID4+IFNFQ1RPUl9TSElGVCksIHdjLT5zZXFfY291bnQpOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3cml0ZWNhY2hlX2luc2Vy
dF9lbnRyeSh3YywgZik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHdjLT51bmNvbW1pdHRlZF9ibG9ja3MrKzsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYmlvX3NpemUgKz0gd2MtPmJsb2NrX3NpemU7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN1cnJlbnRfY2FjaGVfc2VjICs9IHdjLT5ibG9ja19z
aXplID4+IFNFQ1RPUl9TSElGVDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
PiArCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpb19zZXRfZGV2KGJpbywg
d2MtPnNzZF9kZXYtPmJkZXYpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlv
LT5iaV9pdGVyLmJpX3NlY3RvciA9IGNhY2hlX3NlY3Rvcih3YywgZSk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBiaW8tPmJpX2l0ZXIuYmlfc2VjdG9yID0gc3RhcnRfY2FjaGVf
c2VjOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1fYWNjZXB0X3BhcnRpYWxf
YmlvKGJpbywgYmlvX3NpemUgPj4gU0VDVE9SX1NISUZUKTsKPiArCj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseSh3Yy0+dW5jb21taXR0ZWRfYmxvY2tzID49
IAo+IHdjLT5hdXRvY29tbWl0X2Jsb2NrcykpIHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB3Yy0+dW5jb21taXR0ZWRfYmxvY2tzID0gMDsKPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBxdWV1ZV93b3JrKHdjLT53cml0ZWJhY2tf
d3EsICZ3Yy0+Zmx1c2hfd29yayk7CgoKVGhlIHNwZWVkIGdhaW4gbG9va3MgcXVpdGUgZ29vZC4K
T25lIGNvbmNlcm4gaXMgaWYgb3ZlciB0aW1lIHRoZSBmcmVlIGxpc3QgYmVjb21lcyBkZWZyYWdt
ZW50ZWQgbWVhbmluZyAKaXQgbWF5IGJlY29tZSBoYXJkZXIgZm9yIHRoZSBjdXJyZW50IGZyZWUg
ZW50cnkgdG8gaGF2ZSBjb25zZWN1dGl2ZSBmcmVlIApibG9ja3MuCgoKLS0KZG0tZGV2ZWwgbWFp
bGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2RtLWRldmVs

