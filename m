Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 55E80200348
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 10:08:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592554114;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6RYbvWiNhawo6m8RswO++clkzQb8GOFdtYvDcG47r3s=;
	b=DtI2y6GbE80nTtALiG1c/aOCrTT7LoAoYxtmiYzDks1pDh8o5vcmz6g/aAV9d4jqV8vIC6
	KjOkkaahBKIp/OUuD8gtk3y5NVjP3EyeehRwY9/HElBPeNXDtR5+B0vtB5FatDol4y+ma/
	LH1xpk4tKPaWVY3QTBZM08NU6Je/aeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-ztbHi94RM563fIAsPz8Zlg-1; Fri, 19 Jun 2020 04:08:31 -0400
X-MC-Unique: ztbHi94RM563fIAsPz8Zlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 085FD18FF661;
	Fri, 19 Jun 2020 08:08:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB94071663;
	Fri, 19 Jun 2020 08:08:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 478EA833C1;
	Fri, 19 Jun 2020 08:08:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J88MkR024719 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 04:08:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31C7210328F; Fri, 19 Jun 2020 08:08:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E76710328B
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 08:08:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44A7F101A525
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 08:08:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-283-UsJHea-ROTGlXaueHIhGNQ-1;
	Fri, 19 Jun 2020 04:08:15 -0400
X-MC-Unique: UsJHea-ROTGlXaueHIhGNQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 818B8AC85;
	Fri, 19 Jun 2020 08:08:13 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
References: <20200619074956.352647-1-damien.lemoal@wdc.com>
	<20200619074956.352647-3-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <171fcafa-4a37-16e5-fab6-879cf8f32e4d@suse.de>
Date: Fri, 19 Jun 2020 10:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619074956.352647-3-damien.lemoal@wdc.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05J88MkR024719
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [dm-devel] [PATCH 2/2] dm zoned: Fix reclaim zone selection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNi8xOS8yMCA5OjQ5IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBGcm9tOiBTaGluJ2lj
aGlybyBLYXdhc2FraSA8c2hpbmljaGlyby5rYXdhc2FraUB3ZGMuY29tPgo+IAo+IFdoZW4gZG0g
em9uZWQgaGFzIG11bHRpcGxlIGRldmljZXMsIHJhbmRvbSB6b25lcyBhcmUgbmV2ZXIgc2VsZWN0
ZWQgZm9yCj4gcmVjbGFpbSBpZiBhbGwgcmVzZXJ2ZWQgc2VxdWVudGlhbCB3cml0ZSB6b25lcyBh
cmUgaW4gdXNlIGFuZCBubwo+IHNlcXVlbnRpYWwgd3JpdGUgcmVxdWlyZWQgem9uZXMgY2FuIGJl
IHNlbGVjdGVkIGZvciByZWNsYWltLiBUaGlzIGNhbgo+IGxlYWQgdG8gZGVhZGxvY2tzIGFzIHNl
bGVjdGluZyBhIGNhY2hlIHpvbmUgYWxsb3dzIHJlY2xhaW1pbmcgYQo+IHNlcXVlbnRpYWwgem9u
ZSwgZW5zdXJpbmcgZm9yd2FyZCBwcm9ncmVzcy4KPiAKPiBGaXggdGhpcyBieSBhbHdheXMgZGVm
YXVsdGluZyB0byBzZWxlY3RpbmcgYSByYW5kb20gem9uZSB3aGVuIG5vCj4gc2VxdWVudGlhbCB3
cml0ZSByZXF1aXJlZCB6b25lIGNhbiBiZSBzZWxlY3RlZC4KPiAKPiBbRGFtaWVuOiBmaXggY29t
bWl0IG1lc3NhZ2VdCj4gCj4gU2lnbmVkLW9mZi1ieTogU2hpbidpY2hpcm8gS2F3YXNha2kgPHNo
aW5pY2hpcm8ua2F3YXNha2lAd2RjLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9h
bCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tZC9kbS16b25lZC1t
ZXRhZGF0YS5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFk
YXRhLmMgYi9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMKPiBpbmRleCA4YmRmNzFkY2U3
ZmIuLmMzMzJlMmMxMjFiOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFk
YXRhLmMKPiArKysgYi9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMKPiBAQCAtMjAyNSw3
ICsyMDI1LDcgQEAgc3RhdGljIHN0cnVjdCBkbV96b25lICpkbXpfZ2V0X3NlcV96b25lX2Zvcl9y
ZWNsYWltKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnptZCwKPiAgIHN0cnVjdCBkbV96b25lICpkbXpf
Z2V0X3pvbmVfZm9yX3JlY2xhaW0oc3RydWN0IGRtel9tZXRhZGF0YSAqem1kLAo+ICAgCQkJCQkg
dW5zaWduZWQgaW50IGRldl9pZHgsIGJvb2wgaWRsZSkKPiAgIHsKPiAtCXN0cnVjdCBkbV96b25l
ICp6b25lOwo+ICsJc3RydWN0IGRtX3pvbmUgKnpvbmUgPSBOVUxMOwo+ICAgCj4gICAJLyoKPiAg
IAkgKiBTZWFyY2ggZm9yIGEgem9uZSBjYW5kaWRhdGUgdG8gcmVjbGFpbTogMiBjYXNlcyBhcmUg
cG9zc2libGUuCj4gQEAgLTIwMzgsNyArMjAzOCw3IEBAIHN0cnVjdCBkbV96b25lICpkbXpfZ2V0
X3pvbmVfZm9yX3JlY2xhaW0oc3RydWN0IGRtel9tZXRhZGF0YSAqem1kLAo+ICAgCWRtel9sb2Nr
X21hcCh6bWQpOwo+ICAgCWlmIChsaXN0X2VtcHR5KCZ6bWQtPnJlc2VydmVkX3NlcV96b25lc19s
aXN0KSkKPiAgIAkJem9uZSA9IGRtel9nZXRfc2VxX3pvbmVfZm9yX3JlY2xhaW0oem1kLCBkZXZf
aWR4KTsKPiAtCWVsc2UKPiArCWlmICghem9uZSkKPiAgIAkJem9uZSA9IGRtel9nZXRfcm5kX3pv
bmVfZm9yX3JlY2xhaW0oem1kLCBkZXZfaWR4LCBpZGxlKTsKPiAgIAlkbXpfdW5sb2NrX21hcCh6
bWQpOwo+ICAgCj4gCkluZGVlZC4KClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVA
c3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAg
ICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBO
w7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoKLS0KZG0t
ZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

