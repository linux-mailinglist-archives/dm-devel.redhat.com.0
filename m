Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6832320AE4D
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 10:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593159277;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LWXHCneXZr4gUNyeVYLnyWV1rqapyGfBXK3znixWBzg=;
	b=cTtSrWWeHWN8hQcQs4eiznvgSUgei7W8K+36PIXwU2KcFKzR0Vsa3VitUwKkgdwlWn7tEA
	/wp7Kqqnsv9jQiF3ONENhug1/nHtbgZaCXxRcJj1zs5PIWofPlJlhVrcahm+oJAfJ6y+vs
	haGWfpbUXKaC0MvtepP7DQhB7nH/+oU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-fq7YPb--OJ62zXJd4wuh-w-1; Fri, 26 Jun 2020 04:14:34 -0400
X-MC-Unique: fq7YPb--OJ62zXJd4wuh-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929961009615;
	Fri, 26 Jun 2020 08:14:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF74101E670;
	Fri, 26 Jun 2020 08:14:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DB26875B5;
	Fri, 26 Jun 2020 08:14:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PDL9PO000387 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 09:21:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 265A62144B47; Thu, 25 Jun 2020 13:21:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 214482144B39
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:21:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CD12108C26A
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 13:21:06 +0000 (UTC)
Received: from out20-87.mail.aliyun.com (out20-87.mail.aliyun.com
	[115.124.20.87]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-lDKYM_bzPB6yeYQ-jIF3RQ-1; Thu, 25 Jun 2020 09:20:59 -0400
X-MC-Unique: lDKYM_bzPB6yeYQ-jIF3RQ-1
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07437085|-1; CH=green;
	DM=|CONTINUE|false|;
	DS=CONTINUE|ham_alarm|0.018693-0.000393809-0.980913;
	FP=0|0|0|0|0|-1|-1|-1; HT=e02c03301; MF=aiden.leong@aibsd.com;
	NM=1; PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.HsKfs8N_1593091249;
Received: from 192.168.181.130(mailfrom:aiden.leong@aibsd.com
	fp:SMTPD_---.HsKfs8N_1593091249)
	by smtp.aliyun-inc.com(10.147.43.230);
	Thu, 25 Jun 2020 21:20:50 +0800
To: Ferdinand Blomqvist <ferdinand.blomqvist@gmail.com>
References: <20200625073621.4919-1-aiden.leong@aibsd.com>
	<20200625130624.GC1036@mail-personal>
From: Aiden Leong <aiden.leong@aibsd.com>
Message-ID: <8809849e-832c-d268-bda1-807157e92e5b@aibsd.com>
Date: Thu, 25 Jun 2020 06:20:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625130624.GC1036@mail-personal>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Jun 2020 04:13:56 -0400
Cc: Mike Snitzer <snitzer@redhat.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [RFC v2] Reed-Solomon Code: Update no_eras to the
 actual number of errors
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

SGksCgpZb3UgYXJlIHJpZ2h0LiBJIGZvcmdvdCB0aGUgcmV0dXJuIHZhbHVlIGlzIG51bWJlciBv
ZiBlcnJvcnMgcmF0aGVyIHRoYW4gCnN0YXR1cyBjb2RlLgoKU29ycnkgdG8gYm90aGVyIHlvdS4K
Ck9uIDYvMjUvMjAgNjowNiBBTSwgRmVyZGluYW5kIEJsb21xdmlzdCB3cm90ZToKPiBIaSEKPgo+
IE9uIDIwMjAtMDYtMjUgMDA6MzY6MDEsIEFpZGVuIExlb25nIHdyb3RlOgo+PiBDb3JyIGFuZCBl
cmFzX3BvcyBhcmUgdXBkYXRlZCB0byBhY3R1YWwgY29ycmVjdGlvbiBwYXR0ZXJuIGFuZCBlcmFz
dXJlCj4+IHBvc2l0aW9ucywgYnV0IG5vX2VyYXMgaXMgbm90Lgo+Pgo+PiBXaGVuIHRoaXMgbGli
cmFyeSBpcyB1c2VkIHRvIHJlY292ZXIgbG9zdCBieXRlcywgd2Ugbm9ybWFsbHkgbWVtc2V0IHRo
ZQo+PiBsb3N0IHRydW5rIG9mIGJ5dGVzIHRvIHplcm8gYXMgYSBwbGFjZWhvbGRlci4gVW5mb3J0
dW5hdGVseSwgaWYgdGhlIGxvc3QKPj4gYnl0ZSBpcyB6ZXJvLCBiW2ldIGlzIHplcm8gdG9vLiBX
aXRob3V0IGNvcnJlY3Qgbm9fZXJhcywgdXNlcnMgd29uJ3QgYmUKPj4gYWJsZSB0byBkZXRlcm1p
bmUgdGhlIHZhbGlkIGxlbmd0aCBvZiBjb3JyIGFuZCBlcmFzX3Bvcy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogQWlkZW4gTGVvbmcgPGFpZGVuLmxlb25nQGFpYnNkLmNvbT4KPgo+IEknbSBub3Qgc3Vy
ZSBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgdHJ5IHRvIGRvLiBkZWNvZGVfcnMqIGFscmVhZHkgcmV0
dXJucwo+IHRoZSBudW1iZXIgb2YgZXJyb3JzIGNvcnJldGVkIChvciBzb21ldGhpbmcgbmVnYXRp
dmUgdXBvbiBmYWlsdXJlKS4gU28KPiB5b3VyIGxhc3Qgc3RhdG1lbnQgaXMgZmFsc2UuIFRoZSBs
ZW5ndCBvZiBjb3JyIGFuZCBlcmFzX3BvcyBpcyByZXR1cm5lZAo+IGJ5IHRoZSBmdW5jdGlvbi4g
U28gdGhpcyBjaGFuZ2UgaXMgdW5uZWNlc3NhcnkuIE1vcmUgY29tbWVudHMgaW5saW5lLgo+Cj4+
Cj4+IGRpZmYgLS1naXQgYS9saWIvcmVlZF9zb2xvbW9uL2RlY29kZV9ycy5jIGIvbGliL3JlZWRf
c29sb21vbi9kZWNvZGVfcnMuYwo+PiBpbmRleCA4MDVkZTg0YWU4M2QuLjQ0MTM2ZWEzM2QxNiAx
MDA2NDQKPj4gLS0tIGEvbGliL3JlZWRfc29sb21vbi9kZWNvZGVfcnMuYwo+PiArKysgYi9saWIv
cmVlZF9zb2xvbW9uL2RlY29kZV9ycy5jCj4+IEBAIC0yNCw2ICsyNCw3IEBACj4+IMKgwqDCoMKg
aW50IGNvdW50ID0gMDsKPj4gwqDCoMKgwqBpbnQgbnVtX2NvcnJlY3RlZDsKPj4gwqDCoMKgwqB1
aW50MTZfdCBtc2sgPSAodWludDE2X3QpIHJzLT5ubjsKPj4gK8KgwqDCoCBpbnQgbm9fZXJhc19s
b2NhbCA9IG5vX2VyYXMgPyAqbm9fZXJhcyA6IDA7Cj4+Cj4+IMKgwqDCoMKgLyoKPj4gwqDCoMKg
wqAgKiBUaGUgZGVjb2RlciBidWZmZXJzIGFyZSBpbiB0aGUgcnMgY29udHJvbCBzdHJ1Y3QuIFRo
ZXkgYXJlCj4+IEBAIC0xMDYsMTEgKzEwNywxMSBAQAo+PiDCoMKgwqDCoG1lbXNldCgmbGFtYmRh
WzFdLCAwLCBucm9vdHMgKiBzaXplb2YobGFtYmRhWzBdKSk7Cj4+IMKgwqDCoMKgbGFtYmRhWzBd
ID0gMTsKPj4KPj4gLcKgwqDCoCBpZiAobm9fZXJhcyA+IDApIHsKPj4gK8KgwqDCoCBpZiAobm9f
ZXJhc19sb2NhbCA+IDApIHsKPj4gwqDCoMKgwqDCoMKgwqAgLyogSW5pdCBsYW1iZGEgdG8gYmUg
dGhlIGVyYXN1cmUgbG9jYXRvciBwb2x5bm9taWFsICovCj4+IMKgwqDCoMKgwqDCoMKgIGxhbWJk
YVsxXSA9IGFscGhhX3RvW3JzX21vZG5uKHJzLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBwcmltICogKG5uIC0gMSAtIChlcmFzX3Bvc1swXSArIHBhZCkpKV07Cj4+
IC3CoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAxOyBpIDwgbm9fZXJhczsgaSsrKSB7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBmb3IgKGkgPSAxOyBpIDwgbm9fZXJhc19sb2NhbDsgaSsrKSB7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdSA9IHJzX21vZG5uKHJzLCBwcmltICogKG5uIC0gMSAtIChlcmFz
X3Bvc1tpXSArIHBhZCkpKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGogPSBpICsg
MTsgaiA+IDA7IGotLSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdG1wID0g
aW5kZXhfb2ZbbGFtYmRhW2ogLSAxXV07Cj4+IEBAIC0xMjksOCArMTMwLDggQEAKPj4gwqDCoMKg
wqAgKiBCZWdpbiBCZXJsZWthbXAtTWFzc2V5IGFsZ29yaXRobSB0byBkZXRlcm1pbmUgZXJyb3Ir
ZXJhc3VyZQo+PiDCoMKgwqDCoCAqIGxvY2F0b3IgcG9seW5vbWlhbAo+PiDCoMKgwqDCoCAqLwo+
PiAtwqDCoMKgIHIgPSBub19lcmFzOwo+PiAtwqDCoMKgIGVsID0gbm9fZXJhczsKPj4gK8KgwqDC
oCByID0gbm9fZXJhc19sb2NhbDsKPj4gK8KgwqDCoCBlbCA9IG5vX2VyYXNfbG9jYWw7Cj4+IMKg
wqDCoMKgd2hpbGUgKCsrciA8PSBucm9vdHMpIHvCoMKgwqAgLyogciBpcyB0aGUgc3RlcCBudW1i
ZXIgKi8KPj4gwqDCoMKgwqDCoMKgwqAgLyogQ29tcHV0ZSBkaXNjcmVwYW5jeSBhdCB0aGUgci10
aCBzdGVwIGluIHBvbHktZm9ybSAqLwo+PiDCoMKgwqDCoMKgwqDCoCBkaXNjcl9yID0gMDsKPj4g
QEAgLTE1OCw4ICsxNTksOCBAQAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBl
bHNlCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRbaSArIDFdID0g
bGFtYmRhW2kgKyAxXTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmICgyICogZWwgPD0gciArIG5vX2VyYXMgLSAxKSB7Cj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWwgPSByICsgbm9fZXJhcyAtIGVsOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoMiAqIGVsIDw9IHIgKyBub19lcmFzX2xvY2FsIC0gMSkgewo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsID0gciArIG5vX2VyYXNfbG9jYWwg
LSBlbDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogMiBsaW5lcyBiZWxvdzogQih4KSA8LS0gaW52KGRpc2Ny
X3IpICoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBsYW1iZGEoeCkKPj4g
QEAgLTMxMiwxNCArMzEzLDIxIEBACj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
cmFzX3Bvc1tqKytdID0gbG9jW2ldIC0gcGFkOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4gwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG5vX2VyYXMpCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICpub19lcmFzID0gajsKPiBBdCB0aGlzIHBvaW50IGogd2ls
bCBiZSBlcXVhbCB0byBudW1fY29ycmVjdGVkLiBTbyB3aHkgcmV0dXJuIHRoaXMKPiBpbmZvcm1h
dGlvbiBpbiBub19lcmFzLCB3aGVuIGl0IGlzIGFscmVhZHkgcmV0dXJuZWQgYnkgdGhlIGZ1bmN0
aW9uPwo+Cj4+IMKgwqDCoMKgfSBlbHNlIGlmIChkYXRhICYmIHBhcikgewo+PiDCoMKgwqDCoMKg
wqDCoCAvKiBBcHBseSBlcnJvciB0byBkYXRhIGFuZCBwYXJpdHkgKi8KPj4gK8KgwqDCoMKgwqDC
oMKgIGogPSAwOwo+PiDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykg
ewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChsb2NbaV0gPCAobm4gLSBucm9vdHMpKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGF0YVtsb2NbaV0gLSBwYWRdIF49IGJb
aV07Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcGFyW2xvY1tpXSAtIHBhZCAtIGxlbl0gXj0gYltpXTsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGJbaV0pCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaisrOwo+PiDCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAobm9fZXJh
cykKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKm5vX2VyYXMgPSBqOwo+Cj4gU2FtZSBhcyBh
Ym92ZS4KPgo+PiAyLjI1LjEKPj4KPgo+IEJlc3QsCj4gRmVyZGluYW5kCj4KCi0tCmRtLWRldmVs
IG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

