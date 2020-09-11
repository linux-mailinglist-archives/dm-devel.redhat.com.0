Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B9E2A2656B5
	for <lists+dm-devel@lfdr.de>; Fri, 11 Sep 2020 03:35:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-uPKFqI48PciUg5NSxocy4A-1; Thu, 10 Sep 2020 21:35:28 -0400
X-MC-Unique: uPKFqI48PciUg5NSxocy4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 865F280572E;
	Fri, 11 Sep 2020 01:35:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97CD181C46;
	Fri, 11 Sep 2020 01:35:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FCFB183D021;
	Fri, 11 Sep 2020 01:35:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08B1Z27D001327 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 21:35:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D14A7108BCE; Fri, 11 Sep 2020 01:35:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCF84104843
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 01:35:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73C9F800BED
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 01:35:00 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-593-Hez0IaE3OU6qgAJ5k2pR5A-1; Thu, 10 Sep 2020 21:34:57 -0400
X-MC-Unique: Hez0IaE3OU6qgAJ5k2pR5A-1
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id AA515F6A7F318C0A76CA;
	Fri, 11 Sep 2020 09:34:49 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.208) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
	Fri, 11 Sep 2020 09:34:43 +0800
To: Martin Wilck <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
	<3f34cd14-17a0-f7a4-6cdb-7a37aa5c31b4@huawei.com>
	<8ecf7f972b83be7fba3797327046c7cedf1179c8.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <aceb50c7-ddf5-b00e-1d05-4294c5650127@huawei.com>
Date: Fri, 11 Sep 2020 09:34:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8ecf7f972b83be7fba3797327046c7cedf1179c8.camel@suse.com>
X-Originating-IP: [10.174.178.208]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08B1Z27D001327
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V4 11/14] mpathpersist: check whether malloc
 paramp->trnptid_list fails in handle_args func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Language: en-GB

CgpPbiAyMDIwLzkvMTEgMjo0OCwgTWFydGluIFdpbGNrIHdyb3RlOgo+IE9uIFRodSwgMjAyMC0w
OS0xMCBhdCAxODo1MiArMDgwMCwgbGl4aWFva2VuZyB3cm90ZToKPj4gSW4gaGFuZGxlX2FyZ3Mg
ZnVuYywgd2UgZG9ub3QgY2hlY2sgd2hldGhlciBtYWxsb2MgcGFyYW1wIGFuZAo+PiBlYWNoIHBh
cmFtcC0+dHJucHRpZF9saXN0W2pdIGZhaWxzIGJlZm9yZSB1c2luZyB0aGVtLCBpdCBtYXkKPj4g
Y2F1c2UgYWNjZXNzIE5VTEwgcG9pbnRlci4KPj4KPj4gSGVyZSwgd2UgYWRkIGFsbG9jX3Byb3V0
X3BhcmFtX2Rlc2NyaXB0b3IgdG8gYWxsb2NhdGUgYW5kIGluaXQKPj4gcGFyYW1wLCBhbmQgd2Ug
YWRkIGZyZWVfcHJvdXRfcGFyYW1fZGVzY3JpcHRvciB0byBmcmVlIHBhcmFtcAo+PiBhbmQgZWFj
aCBwYXJhbXAtPnRybnB0aWRfbGlzdFtqXS4KPj4KPj4gV2UgY2hhbmdlIG51bV90cmFuc3BvcnQg
dG8gbnVtX3RyYW5zcG9ydGlkcyB0byBjb21iaW5lIHRoZW0uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFpoaXFpYW5nIExpdSA8bGl1emhpcWlhbmcyNkBodWF3ZWkuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBsaXhpYW9rZW5nIDxsaXhpYW9rZW5nQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiAgbXBhdGhwZXJz
aXN0L21haW4uYyB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0KPj4gLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL21wYXRocGVyc2lzdC9tYWluLmMgYi9tcGF0aHBlcnNp
c3QvbWFpbi5jCj4+IGluZGV4IDI4YmZlNDEwLi5kYTY3YzE1YyAxMDA2NDQKPj4gLS0tIGEvbXBh
dGhwZXJzaXN0L21haW4uYwo+PiArKysgYi9tcGF0aHBlcnNpc3QvbWFpbi5jCj4+IEBAIC0xNTMs
NiArMTUzLDM4IEBAIHN0YXRpYyBpbnQgZG9fYmF0Y2hfZmlsZShjb25zdCBjaGFyICpiYXRjaF9m
bikKPj4gIAlyZXR1cm4gcmV0Owo+PiAgfQo+Pgo+PiArc3RhdGljIHN0cnVjdCBwcm91dF9wYXJh
bV9kZXNjcmlwdG9yICoKPj4gK2FsbG9jX3Byb3V0X3BhcmFtX2Rlc2NyaXB0b3IoaW50IG51bV90
cmFuc3BvcnRpZCkKPj4gK3sKPj4gKwlzdHJ1Y3QgcHJvdXRfcGFyYW1fZGVzY3JpcHRvciAqcGFy
YW1wOwo+PiArCj4+ICsJaWYgKG51bV90cmFuc3BvcnRpZCA8IDAgfHwgbnVtX3RyYW5zcG9ydGlk
ID4gTVBBVEhfTVhfVElEUykKPj4gKwkJcmV0dXJuIE5VTEw7Cj4+ICsKPj4gKwlwYXJhbXA9IG1h
bGxvYyhzaXplb2Yoc3RydWN0IHByb3V0X3BhcmFtX2Rlc2NyaXB0b3IpICsKPj4gKwkJCQkoc2l6
ZW9mKHN0cnVjdCB0cmFuc3BvcnRpZCAqKSAqCj4+IG51bV90cmFuc3BvcnRpZCkpOwo+PiArCj4+
ICsJaWYgKCFwYXJhbXApCj4+ICsJCXJldHVybiBOVUxMOwo+PiArCj4+ICsJcGFyYW1wLT5udW1f
dHJhbnNwb3J0aWQgPSBudW1fdHJhbnNwb3J0aWQ7Cj4+ICsJbWVtc2V0KHBhcmFtcCwgMCwgc2l6
ZW9mKHN0cnVjdCBwcm91dF9wYXJhbV9kZXNjcmlwdG9yKSArCj4+ICsJCQkoc2l6ZW9mKHN0cnVj
dCB0cmFuc3BvcnRpZCAqKSAqCj4+IG51bV90cmFuc3BvcnRpZCkpOwo+PiArCXJldHVybiBwYXJh
bXA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIGZyZWVfcHJvdXRfcGFyYW1fZGVzY3JpcHRv
cihzdHJ1Y3QKPj4gcHJvdXRfcGFyYW1fZGVzY3JpcHRvciAqcGFyYW1wKQo+PiArewo+PiArCWlu
dCBpOwo+PiArCWlmICghcGFyYW1wKQo+PiArCQlyZXR1cm47Cj4+ICsKPj4gKwlmb3IgKGkgPSAw
OyBpIDwgcGFyYW1wLT5udW1fdHJhbnNwb3J0aWQ7IGkrKykKPj4gKwkJZnJlZShwYXJhbXAtPnRy
bnB0aWRfbGlzdFtpXSk7Cj4gCj4gVGhpcyBjYXVzZXMgYSBjb21waWxhdGlvbiBlcnJvci4gRGlk
bid0IHlvdSBjb21waWxlLXRlc3Q/Cj4gCj4gbWFpbi5jOiBJbiBmdW5jdGlvbiDigJhmcmVlX3By
b3V0X3BhcmFtX2Rlc2NyaXB0b3LigJk6Cj4gbWFpbi5jOjE4MjoxNjogZXJyb3I6IGNvbXBhcmlz
b24gb2YgaW50ZWdlciBleHByZXNzaW9ucyBvZiBkaWZmZXJlbnQKPiBzaWduZWRuZXNzOiDigJhp
bnTigJkgYW5kIOKAmHVpbnQzMl904oCZIHtha2Eg4oCYdW5zaWduZWQgaW504oCZfSBbLVdlcnJv
cj1zaV0KPiAgIDE4MiB8ICBmb3IgKGkgPSAwOyBpIDwgcGFyYW1wLT5udW1fdHJhbnNwb3J0aWQ7
IGkrKykKPiAgICAgICB8ICAgICAgICAgICAgICAgIF4KPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWlu
ZyB0cmVhdGVkIGFzIGVycm9ycwo+IAo+IFJlZ2FyZHMsCj4gTWFydGluCj4gCkhpIE1hcnRpbiwK
ICBXaGVuIEkgY29tcGlsZSBpdCwgSSBhZGQgYSBwYXRjaCB0aGF0cyBjaGFuZ2VzIGludCB0byB1
bnNpZ25lZCBpbnQuCkJ1dCBJIGRvbid0IHRoaW5rIGl0IGlzIGFuIGVycm9yLiBJdCBpcyAganVz
dCBhIHdhcm5pbmcgYW5kIGJlY29tZXMgYW4KZXJyb3Igd2l0aCBbLVdlcnJvcl0uIEFueXdheSwg
SSB3aWxsIGNoYW5nZSBpbnQgdG8gdW5zaWduZWQgaXQgYW5kIHNlbmQKaXQgYWdhaW4uIFRoYW5r
cy4KClJlZ2FyZHMKTGl4aWFva2VuZwoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZl
bEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1k
ZXZlbA==

