Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 827EC203259
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 10:47:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592815660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wd+O+AlV/58cnUXK5Kt9o8PLat4+lOVmb6itvtgD+rQ=;
	b=dmYDqhDuXy5I7QUFcxZqoDaSFzKtkpQzdhiGYellcT+si2CDRpkH6EyhUMK3ld6LQOg/vX
	q7B4hP8h5dOn2biTPLW/Sgg68jhpTCRyUDXAaflFTjqOIaGRsRCtLZIEI/lKQ32NHIU8hW
	NLURWPDhFTeVkzrHnBOKlL7WazFvCio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-HxxLIPzGO8GLlvkQ7f6TRg-1; Mon, 22 Jun 2020 04:47:38 -0400
X-MC-Unique: HxxLIPzGO8GLlvkQ7f6TRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 037EF107ACF7;
	Mon, 22 Jun 2020 08:47:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D469B100238D;
	Mon, 22 Jun 2020 08:47:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9330A833CD;
	Mon, 22 Jun 2020 08:47:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05K0u3B5006443 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 20:56:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4BEB710551A6; Sat, 20 Jun 2020 00:56:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4702F10551A4
	for <dm-devel@redhat.com>; Sat, 20 Jun 2020 00:56:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FB52800294
	for <dm-devel@redhat.com>; Sat, 20 Jun 2020 00:56:01 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-58-ewxgqnyKOn2luJ9AVg_YfQ-1; Fri, 19 Jun 2020 20:55:58 -0400
X-MC-Unique: ewxgqnyKOn2luJ9AVg_YfQ-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id F3B3E515EA5FD67CB697;
	Sat, 20 Jun 2020 08:55:53 +0800 (CST)
Received: from [127.0.0.1] (10.166.212.218) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
	Sat, 20 Jun 2020 08:55:49 +0800
To: Bryan Gurney <bgurney@redhat.com>, <dm-devel@redhat.com>,
	<snitzer@redhat.com>, <agk@redhat.com>
References: <1592601039-3868-1-git-send-email-bgurney@redhat.com>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <180daafd-7719-87e4-353b-31eb047179ac@huawei.com>
Date: Sat, 20 Jun 2020 08:55:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1592601039-3868-1-git-send-email-bgurney@redhat.com>
X-Originating-IP: [10.166.212.218]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05K0u3B5006443
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 04:47:18 -0400
Subject: Re: [dm-devel] [PATCH v4 1/4] dm dust: report some message results
 back to user directly
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Content-Transfer-Encoding: base64

SGksCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgZml4IGFuZCB0aGlzIHBhdGNoc2V0ISBJdCBsb29r
cyBiZXR0ZXIgdGhhbgpiZWZvcmUhCgpUaGFua3MsCkt1bi4KCtTaIDIwMjAvNi8yMCA1OjEwLCBC
cnlhbiBHdXJuZXkg0LS1wDoKPiBGcm9tOiB5YW5nZXJrdW4gPHlhbmdlcmt1bkBodWF3ZWkuY29t
Pgo+IAo+IEZyb206IHlhbmdlcmt1biA8eWFuZ2Vya3VuQGh1YXdlaS5jb20+Cj4gCj4gU29tZSB0
eXBlIG9mIG1lc3NhZ2UocXVlcnlibG9jay9jb3VudGJhZGJsb2Nrcy9yZW1vdmViYWRibG9jaykg
bWF5IGJldHRlcgo+IHJlcG9ydCByZXN1bHRzIHRvIHVzZXIgZGlyZWN0bHkuIERvIGl0IHdpdGgg
RE1FTUlULgo+IAo+IFtCcnlhbjogbWFpbnRhaW4gX19mdW5jX18gb3V0cHV0IGluIERNRU1JVCBt
ZXNzYWdlc10KPiAKPiBTaWduZWQtb2ZmLWJ5OiB5YW5nZXJrdW4gPHlhbmdlcmt1bkBodWF3ZWku
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEJyeWFuIEd1cm5leSA8Ymd1cm5leUByZWRoYXQuY29tPgo+
IC0tLQo+ICAgZHJpdmVycy9tZC9kbS1kdXN0LmMgfCAzMSArKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvZG0tZHVzdC5jIGIvZHJpdmVycy9t
ZC9kbS1kdXN0LmMKPiBpbmRleCBmZjAzYjkwMDcyYzUuLmYxZjJkZDZhNGU4NCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL21kL2RtLWR1c3QuYwo+ICsrKyBiL2RyaXZlcnMvbWQvZG0tZHVzdC5jCj4g
QEAgLTEzOCwyMCArMTM4LDIyIEBAIHN0YXRpYyBpbnQgZHVzdF9hZGRfYmxvY2soc3RydWN0IGR1
c3RfZGV2aWNlICpkZCwgdW5zaWduZWQgbG9uZyBsb25nIGJsb2NrLAo+ICAgCXJldHVybiAwOwo+
ICAgfQo+ICAgCj4gLXN0YXRpYyBpbnQgZHVzdF9xdWVyeV9ibG9jayhzdHJ1Y3QgZHVzdF9kZXZp
Y2UgKmRkLCB1bnNpZ25lZCBsb25nIGxvbmcgYmxvY2spCj4gK3N0YXRpYyBpbnQgZHVzdF9xdWVy
eV9ibG9jayhzdHJ1Y3QgZHVzdF9kZXZpY2UgKmRkLCB1bnNpZ25lZCBsb25nIGxvbmcgYmxvY2ss
IGNoYXIgKnJlc3VsdCwKPiArCQkJICAgIHVuc2lnbmVkIGludCBtYXhsZW4sIHVuc2lnbmVkIGlu
dCAqc3pfcHRyKQo+ICAgewo+ICAgCXN0cnVjdCBiYWRibG9jayAqYmJsb2NrOwo+ICAgCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7Cj4gKwl1bnNpZ25lZCBpbnQgc3ogPSAqc3pfcHRyOwo+ICAgCj4gICAJ
c3Bpbl9sb2NrX2lycXNhdmUoJmRkLT5kdXN0X2xvY2ssIGZsYWdzKTsKPiAgIAliYmxvY2sgPSBk
dXN0X3JiX3NlYXJjaCgmZGQtPmJhZGJsb2NrbGlzdCwgYmxvY2spOwo+ICAgCWlmIChiYmxvY2sg
IT0gTlVMTCkKPiAtCQlETUlORk8oIiVzOiBibG9jayAlbGx1IGZvdW5kIGluIGJhZGJsb2NrbGlz
dCIsIF9fZnVuY19fLCBibG9jayk7Cj4gKwkJRE1FTUlUKCIlczogYmxvY2sgJWxsdSBmb3VuZCBp
biBiYWRibG9ja2xpc3QiLCBfX2Z1bmNfXywgYmxvY2spOwo+ICAgCWVsc2UKPiAtCQlETUlORk8o
IiVzOiBibG9jayAlbGx1IG5vdCBmb3VuZCBpbiBiYWRibG9ja2xpc3QiLCBfX2Z1bmNfXywgYmxv
Y2spOwo+ICsJCURNRU1JVCgiJXM6IGJsb2NrICVsbHUgbm90IGZvdW5kIGluIGJhZGJsb2NrbGlz
dCIsIF9fZnVuY19fLCBibG9jayk7Cj4gICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGQtPmR1
c3RfbG9jaywgZmxhZ3MpOwo+ICAgCj4gLQlyZXR1cm4gMDsKPiArCXJldHVybiAxOwo+ICAgfQo+
ICAgCj4gICBzdGF0aWMgaW50IF9fZHVzdF9tYXBfcmVhZChzdHJ1Y3QgZHVzdF9kZXZpY2UgKmRk
LCBzZWN0b3JfdCB0aGlzYmxvY2spCj4gQEAgLTI1OSwxMSArMjYxLDEzIEBAIHN0YXRpYyBib29s
IF9fZHVzdF9jbGVhcl9iYWRibG9ja3Moc3RydWN0IHJiX3Jvb3QgKnRyZWUsCj4gICAJcmV0dXJu
IHRydWU7Cj4gICB9Cj4gICAKPiAtc3RhdGljIGludCBkdXN0X2NsZWFyX2JhZGJsb2NrcyhzdHJ1
Y3QgZHVzdF9kZXZpY2UgKmRkKQo+ICtzdGF0aWMgaW50IGR1c3RfY2xlYXJfYmFkYmxvY2tzKHN0
cnVjdCBkdXN0X2RldmljZSAqZGQsIGNoYXIgKnJlc3VsdCwgdW5zaWduZWQgaW50IG1heGxlbiwK
PiArCQkJCXVuc2lnbmVkIGludCAqc3pfcHRyKQo+ICAgewo+ICAgCXVuc2lnbmVkIGxvbmcgZmxh
Z3M7Cj4gICAJc3RydWN0IHJiX3Jvb3QgYmFkYmxvY2tsaXN0Owo+ICAgCXVuc2lnbmVkIGxvbmcg
bG9uZyBiYWRibG9ja19jb3VudDsKPiArCXVuc2lnbmVkIGludCBzeiA9ICpzel9wdHI7Cj4gICAK
PiAgIAlzcGluX2xvY2tfaXJxc2F2ZSgmZGQtPmR1c3RfbG9jaywgZmxhZ3MpOwo+ICAgCWJhZGJs
b2NrbGlzdCA9IGRkLT5iYWRibG9ja2xpc3Q7Cj4gQEAgLTI3MywxMSArMjc3LDExIEBAIHN0YXRp
YyBpbnQgZHVzdF9jbGVhcl9iYWRibG9ja3Moc3RydWN0IGR1c3RfZGV2aWNlICpkZCkKPiAgIAlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZkZC0+ZHVzdF9sb2NrLCBmbGFncyk7Cj4gICAKPiAgIAlp
ZiAoIV9fZHVzdF9jbGVhcl9iYWRibG9ja3MoJmJhZGJsb2NrbGlzdCwgYmFkYmxvY2tfY291bnQp
KQo+IC0JCURNSU5GTygiJXM6IG5vIGJhZGJsb2NrcyBmb3VuZCIsIF9fZnVuY19fKTsKPiArCQlE
TUVNSVQoIiVzOiBubyBiYWRibG9ja3MgZm91bmQiLCBfX2Z1bmNfXyk7Cj4gICAJZWxzZQo+IC0J
CURNSU5GTygiJXM6IGJhZGJsb2NrcyBjbGVhcmVkIiwgX19mdW5jX18pOwo+ICsJCURNRU1JVCgi
JXM6IGJhZGJsb2NrcyBjbGVhcmVkIiwgX19mdW5jX18pOwo+ICAgCj4gLQlyZXR1cm4gMDsKPiAr
CXJldHVybiAxOwo+ICAgfQo+ICAgCj4gICAvKgo+IEBAIC0zODMsNyArMzg3LDcgQEAgc3RhdGlj
IHZvaWQgZHVzdF9kdHIoc3RydWN0IGRtX3RhcmdldCAqdGkpCj4gICB9Cj4gICAKPiAgIHN0YXRp
YyBpbnQgZHVzdF9tZXNzYWdlKHN0cnVjdCBkbV90YXJnZXQgKnRpLCB1bnNpZ25lZCBpbnQgYXJn
YywgY2hhciAqKmFyZ3YsCj4gLQkJCWNoYXIgKnJlc3VsdF9idWYsIHVuc2lnbmVkIGludCBtYXhs
ZW4pCj4gKwkJCWNoYXIgKnJlc3VsdCwgdW5zaWduZWQgaW50IG1heGxlbikKPiAgIHsKPiAgIAlz
dHJ1Y3QgZHVzdF9kZXZpY2UgKmRkID0gdGktPnByaXZhdGU7Cj4gICAJc2VjdG9yX3Qgc2l6ZSA9
IGlfc2l6ZV9yZWFkKGRkLT5kZXYtPmJkZXYtPmJkX2lub2RlKSA+PiBTRUNUT1JfU0hJRlQ7Cj4g
QEAgLTM5Myw2ICszOTcsNyBAQCBzdGF0aWMgaW50IGR1c3RfbWVzc2FnZShzdHJ1Y3QgZG1fdGFy
Z2V0ICp0aSwgdW5zaWduZWQgaW50IGFyZ2MsIGNoYXIgKiphcmd2LAo+ICAgCXVuc2lnbmVkIGNo
YXIgd3JfZmFpbF9jbnQ7Cj4gICAJdW5zaWduZWQgaW50IHRtcF91aTsKPiAgIAl1bnNpZ25lZCBs
b25nIGZsYWdzOwo+ICsJdW5zaWduZWQgaW50IHN6ID0gMDsKPiAgIAljaGFyIGR1bW15Owo+ICAg
Cj4gICAJaWYgKGFyZ2MgPT0gMSkgewo+IEBAIC00MTAsMTIgKzQxNSwxMiBAQCBzdGF0aWMgaW50
IGR1c3RfbWVzc2FnZShzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSwgdW5zaWduZWQgaW50IGFyZ2MsIGNo
YXIgKiphcmd2LAo+ICAgCQkJciA9IDA7Cj4gICAJCX0gZWxzZSBpZiAoIXN0cmNhc2VjbXAoYXJn
dlswXSwgImNvdW50YmFkYmxvY2tzIikpIHsKPiAgIAkJCXNwaW5fbG9ja19pcnFzYXZlKCZkZC0+
ZHVzdF9sb2NrLCBmbGFncyk7Cj4gLQkJCURNSU5GTygiY291bnRiYWRibG9ja3M6ICVsbHUgYmFk
YmxvY2socykgZm91bmQiLAo+ICsJCQlETUVNSVQoImNvdW50YmFkYmxvY2tzOiAlbGx1IGJhZGJs
b2NrKHMpIGZvdW5kIiwKPiAgIAkJCSAgICAgICBkZC0+YmFkYmxvY2tfY291bnQpOwo+ICAgCQkJ
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGQtPmR1c3RfbG9jaywgZmxhZ3MpOwo+IC0JCQlyID0g
MDsKPiArCQkJciA9IDE7Cj4gICAJCX0gZWxzZSBpZiAoIXN0cmNhc2VjbXAoYXJndlswXSwgImNs
ZWFyYmFkYmxvY2tzIikpIHsKPiAtCQkJciA9IGR1c3RfY2xlYXJfYmFkYmxvY2tzKGRkKTsKPiAr
CQkJciA9IGR1c3RfY2xlYXJfYmFkYmxvY2tzKGRkLCByZXN1bHQsIG1heGxlbiwgJnN6KTsKPiAg
IAkJfSBlbHNlIGlmICghc3RyY2FzZWNtcChhcmd2WzBdLCAicXVpZXQiKSkgewo+ICAgCQkJaWYg
KCFkZC0+cXVpZXRfbW9kZSkKPiAgIAkJCQlkZC0+cXVpZXRfbW9kZSA9IHRydWU7Cj4gQEAgLTQ0
MSw3ICs0NDYsNyBAQCBzdGF0aWMgaW50IGR1c3RfbWVzc2FnZShzdHJ1Y3QgZG1fdGFyZ2V0ICp0
aSwgdW5zaWduZWQgaW50IGFyZ2MsIGNoYXIgKiphcmd2LAo+ICAgCQllbHNlIGlmICghc3RyY2Fz
ZWNtcChhcmd2WzBdLCAicmVtb3ZlYmFkYmxvY2siKSkKPiAgIAkJCXIgPSBkdXN0X3JlbW92ZV9i
bG9jayhkZCwgYmxvY2spOwo+ICAgCQllbHNlIGlmICghc3RyY2FzZWNtcChhcmd2WzBdLCAicXVl
cnlibG9jayIpKQo+IC0JCQlyID0gZHVzdF9xdWVyeV9ibG9jayhkZCwgYmxvY2spOwo+ICsJCQly
ID0gZHVzdF9xdWVyeV9ibG9jayhkZCwgYmxvY2ssIHJlc3VsdCwgbWF4bGVuLCAmc3opOwo+ICAg
CQllbHNlCj4gICAJCQlpbnZhbGlkX21zZyA9IHRydWU7Cj4gICAKPiAKCgotLQpkbS1kZXZlbCBt
YWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

