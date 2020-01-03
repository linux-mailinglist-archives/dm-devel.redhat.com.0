Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E507812FC6E
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jan 2020 19:25:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578075903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gbUINNwMQJzJrl20ThwULP30XytlMMKB7GEKXsln8sE=;
	b=GzAtLlUCs/r6inNbF8w2GR8T5sxvFYStCyfaAG7YDKMf+q8hzx9rzzXxWWsQPJ4jC73+sc
	YnhZe5OJ4HFfawy6O+eWal7bWEg/hsLJ7kAnWsMNJKc65pgPyFYJ+frnX619gYKW0QRPPz
	XYW/x87Xsj+Cq3NQ3uGAd09BGnGMiNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-Sunt5P4vOqyE_qCzNfxfaQ-1; Fri, 03 Jan 2020 13:25:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C245E10054C3;
	Fri,  3 Jan 2020 18:24:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77FBD7BA35;
	Fri,  3 Jan 2020 18:24:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1312D81E26;
	Fri,  3 Jan 2020 18:24:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003IOTSY020409 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 13:24:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E15882166B2A; Fri,  3 Jan 2020 18:24:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD3892166B29
	for <dm-devel@redhat.com>; Fri,  3 Jan 2020 18:24:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C20AD802884
	for <dm-devel@redhat.com>; Fri,  3 Jan 2020 18:24:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-121-iRREmyeCNjmd6n-6zBDQHQ-1;
	Fri, 03 Jan 2020 13:24:22 -0500
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9E5D62253D;
	Fri,  3 Jan 2020 18:24:20 +0000 (UTC)
Date: Fri, 3 Jan 2020 10:24:19 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: =?utf-8?B?eGlhbnJvbmcuemhvdSjlkajlhYjojaMp?= <xianrong.zhou@transsion.com>
Message-ID: <20200103182418.GQ19521@gmail.com>
References: <727b9e9279a546beb2ae63a18eae6ab0@transsion.com>
	<20191216185025.GF139479@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191216185025.GF139479@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: iRREmyeCNjmd6n-6zBDQHQ-1
X-MC-Unique: Sunt5P4vOqyE_qCzNfxfaQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 003IOTSY020409
X-loop: dm-devel@redhat.com
Cc: =?utf-8?B?d2VpbWluLm1hbyjmr5vljavmsJEp?= <weimin.mao@transsion.com>,
	=?utf-8?B?aGFpemhvdS5zb25nKOWui+a1t+iInyk=?= <haizhou.song@transsion.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	=?utf-8?B?d2FuYmluLndhbmco5rGq5LiH5paMKQ==?= <wanbin.wang@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?eXVhbmppb25nLmdhbyjpq5jmuIrngq8p?= <yuanjiong.gao@transsion.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	=?utf-8?B?cnV4aWFuLmZlbmco5Yav5YSS5ai0KQ==?=
	<ruxian.feng@transsion.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-verity: unnecessary data blocks that need
 not read hash blocks
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMTA6NTA6MjZBTSAtMDgwMCwgRXJpYyBCaWdnZXJzIHdy
b3RlOgo+IE9uIE1vbiwgRGVjIDE2LCAyMDE5IGF0IDAyOjAyOjMzQU0gKzAwMDAsIHhpYW5yb25n
Lnpob3Uo5ZGo5YWI6I2jKSB3cm90ZToKPiA+IGhleSBFcmljOgo+ID4gCj4gPiBPbiBXZWQsIERl
YyAxMSwgMjAxOSBhdCAxMTozMjo0MEFNICswODAwLCB6aG91IHhpYW5yb25nIHdyb3RlOgo+ID4g
PiBGcm9tOiAieGlhbnJvbmcuemhvdSIgPHhpYW5yb25nLnpob3VAdHJhbnNzaW9uLmNvbT4KPiA+
ID4gCj4gPiA+IElmIGNoZWNrX2F0X21vc3Rfb25jZSBlbmFibGVkLCBqdXN0IGxpa2UgdmVyaXR5
IHdvcmsgdGhlIHByZWZldGNoaW5nIAo+ID4gPiB3b3JrIHNob3VsZCBjaGVjayBmb3IgZGF0YSBi
bG9jayBiaXRtYXAgZmlyc3RseSBiZWZvcmUgcmVhZGluZyBoYXNoIAo+ID4gPiBibG9jayBhcyB3
ZWxsLiBTa2lwIGJpdC1zZXQgZGF0YSBibG9ja3MgZnJvbSBib3RoIGVuZHMgb2YgZGF0YSBibG9j
ayAKPiA+ID4gcmFuZ2UgYnkgdGVzdGluZyB0aGUgdmFsaWRhdGVkIGJpdG1hcC4gVGhpcyBjYW4g
cmVkdWNlIHRoZSBhbW91bnRzIG9mIAo+ID4gPiBkYXRhIGJsb2NrcyB3aGljaCBuZWVkIHRvIHJl
YWQgaGFzaCBibG9ja3MuCj4gPiA+IAo+ID4gPiBMYXVuY2hpbmcgOTEgYXBwcyBldmVyeSAxNXMg
YW5kIHJlcGVhdCAyMSByb3VuZHMgb24gQW5kcm9pZCBRLgo+ID4gPiBJbiBwcmVmZXRjaGluZyB3
b3JrIHdlIGNhbiBsZXQgb25seSAyNjAyLzM2MDMxMiA9IDAuNzIlIGRhdGEgYmxvY2tzIAo+ID4g
PiByZWFsbHkgbmVlZCB0byByZWFkIGhhc2ggYmxvY2tzLgo+ID4gPiAKPiA+ID4gQnV0IHRoZSBy
ZWR1Y2VkIGRhdGEgYmxvY2tzIHJhbmdlIHdvdWxkIGJlIGVubGFyZ2VkIGFnYWluIGJ5IAo+ID4g
PiBkbV92ZXJpdHlfcHJlZmV0Y2hfY2x1c3RlciBsYXRlci4KPiA+ID4gCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IHhpYW5yb25nLnpob3UgPHhpYW5yb25nLnpob3VAdHJhbnNzaW9uLmNvbT4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogeXVhbmppb25nLmdhbyA8eXVhbmppb25nLmdhb0B0cmFuc3Npb24uY29t
Pgo+ID4gPiBUZXN0ZWQtYnk6IHJ1eGlhbi5mZW5nIDxydXhpYW4uZmVuZ0B0cmFuc3Npb24uY29t
Pgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbWQvZG0tdmVyaXR5LXRhcmdldC5jIHwgMTYgKysr
KysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykKPiA+
ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLXZlcml0eS10YXJnZXQuYyAKPiA+
ID4gYi9kcml2ZXJzL21kL2RtLXZlcml0eS10YXJnZXQuYyBpbmRleCA0ZmIzM2U3NTYyYzUuLjdi
OGViNzU0YzBiNiAKPiA+ID4gMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbWQvZG0tdmVyaXR5
LXRhcmdldC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbWQvZG0tdmVyaXR5LXRhcmdldC5jCj4gPiA+
IEBAIC01ODEsNiArNTgxLDIyIEBAIHN0YXRpYyB2b2lkIHZlcml0eV9wcmVmZXRjaF9pbyhzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gPiA+ICAJc3RydWN0IGRtX3Zlcml0eSAqdiA9IHB3LT52
Owo+ID4gPiAgCWludCBpOwo+ID4gPiAgCj4gPiA+ICsJaWYgKHYtPnZhbGlkYXRlZF9ibG9ja3Mp
IHsKPiA+ID4gKwkJd2hpbGUgKHB3LT5uX2Jsb2Nrcykgewo+ID4gPiArCQkJaWYgKHVubGlrZWx5
KCF0ZXN0X2JpdChwdy0+YmxvY2ssIHYtPnZhbGlkYXRlZF9ibG9ja3MpKSkKPiA+ID4gKwkJCQli
cmVhazsKPiA+ID4gKwkJCXB3LT5ibG9jaysrOwo+ID4gPiArCQkJcHctPm5fYmxvY2tzLS07Cj4g
PiA+ICsJCX0KPiA+ID4gKwkJd2hpbGUgKHB3LT5uX2Jsb2Nrcykgewo+ID4gPiArCQkJaWYgKHVu
bGlrZWx5KCF0ZXN0X2JpdChwdy0+YmxvY2sgKyBwdy0+bl9ibG9ja3MgLSAxLAo+ID4gPiArCQkJ
CXYtPnZhbGlkYXRlZF9ibG9ja3MpKSkKPiA+ID4gKwkJCQlicmVhazsKPiA+ID4gKwkJCXB3LT5u
X2Jsb2Nrcy0tOwo+ID4gPiArCQl9Cj4gPiA+ICsJCWlmICghcHctPm5fYmxvY2tzKQo+ID4gPiAr
CQkJcmV0dXJuOwo+ID4gPiArCX0KPiA+IAo+ID4gVGhpcyBpcyBhIGdvb2QgaWRlYSwgYnV0IHNo
b3VsZG4ndCB0aGlzIGxvZ2ljIGdvIGluIHZlcml0eV9zdWJtaXRfcHJlZmV0Y2goKQo+ID4gcHJp
b3IgdG8gdGhlIHN0cnVjdCBkbV92ZXJpdHlfcHJlZmV0Y2hfd29yayBiZWluZyBhbGxvY2F0ZWQ/
ICBUaGVuIGlmIG5vCj4gPiBwcmVmZWNoaW5nIGlzIG5lZWRlZCwgYWxsb2NhdGluZyBhbmQgc2No
ZWR1bGluZyB0aGUgd29yayBvYmplY3QgY2FuIGJlCj4gPiBza2lwcGVkLgo+ID4gCj4gPiBFcmlj
LCBEbyB5b3UgbWVhbiBpdCBpcyBtb3JlIHN1aXRhYmxlIGluIGRtX2J1ZmlvX3ByZWZldGNoIHdo
aWNoIGlzIGNhbGxlZCBvbgo+ID4gZGlmZmVyZW50IHBhdGhzIGV2ZW4gdGhvdWdoIHByZWZlY2hp
bmcgaXMgZGlzYWJsZWQgPwo+ID4gCj4gCj4gTm8sIEknbSB0YWxraW5nIGFib3V0IHZlcml0eV9z
dWJtaXRfcHJlZmV0Y2goKS4gIHZlcml0eV9zdWJtaXRfcHJlZmV0Y2goKQo+IGFsbG9jYXRlcyBh
bmQgc2NoZWR1bGVzIGEgd29yayBvYmplY3QsIHdoaWNoIGV4ZWN1dGVzIHZlcml0eV9wcmVmZXRj
aF9pbygpLgo+IElmIGFsbCBkYXRhIGJsb2NrcyBpbiB0aGUgSS9PIHJlcXVlc3Qgd2VyZSBhbHJl
YWR5IHZhbGlkYXRlZCwgdGhlcmUncyBubyBuZWVkIHRvCj4gYWxsb2NhdGUgYW5kIHNjaGVkdWxl
IHRoZSBwcmVmZXRjaCB3b3JrLgo+IAo+IC0gRXJpYwo+IAoKQXJlIHlvdSBwbGFubmluZyB0byBz
ZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhpcyBwYXRjaD8KCi0gRXJpYwoKCi0tCmRtLWRldmVsIG1h
aWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9kbS1kZXZlbA==

