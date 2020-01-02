Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 05B4E12F6A2
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jan 2020 11:12:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578046339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RQEyUuRkIfGqvcj7/6Sr40EUIqwJTu3DMVAlHwdT7gI=;
	b=evKavHIi+rLu7ViNDpUGL4lZHVcfCVvJRUzBj12yH0W/Rh+pW+Tq9q3Tg2aWNPusodlJx7
	R6Ja4GcX42FNAawRDzFMtu9wvRNuCSJMf6INoNNbrgPL5jEEi50eYGmDDhqHQ+vx0gwLr9
	GN6y5mg76sTYeN+PqnZDskh0P16isoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-FnRhTMPWPyqdsF4Gy47IUw-1; Fri, 03 Jan 2020 05:12:17 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C864477;
	Fri,  3 Jan 2020 10:12:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAB3819C4F;
	Fri,  3 Jan 2020 10:12:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A1CA4E168;
	Fri,  3 Jan 2020 10:11:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 002FbVbG013664 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jan 2020 10:37:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF1E52026D69; Thu,  2 Jan 2020 15:37:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C99332022EA5
	for <dm-devel@redhat.com>; Thu,  2 Jan 2020 15:37:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB61B80209E
	for <dm-devel@redhat.com>; Thu,  2 Jan 2020 15:37:29 +0000 (UTC)
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
	[192.185.148.2]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-405-OnbO7_TsOsGN6Aa3uCa5pw-1; Thu, 02 Jan 2020 10:37:27 -0500
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
	by gateway30.websitewelcome.com (Postfix) with ESMTP id 7DE186462
	for <dm-devel@redhat.com>; Thu,  2 Jan 2020 09:37:26 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id n2XOiHJhk4kpjn2XOim82L; Thu, 02 Jan 2020 09:37:26 -0600
X-Authority-Reason: nr=8
Received: from [196.219.67.92] (port=53965 helo=[192.168.100.126])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1in2XN-0039us-De; Thu, 02 Jan 2020 08:37:25 -0700
From: Maged Mokhtar <mmokhtar@petasan.org>
To: mpatocka@redhat.com
References: <598c7c64-9b11-3407-2060-8d43b1ef1241@petasan.org>
Message-ID: <d76f7245-034c-f225-00fe-f33c5e9abf1a@petasan.org>
Date: Thu, 2 Jan 2020 17:37:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <598c7c64-9b11-3407-2060-8d43b1ef1241@petasan.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.219.67.92
X-Source-L: No
X-Exim-ID: 1in2XN-0039us-De
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.126]) [196.219.67.92]:53965
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 4
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-MC-Unique: OnbO7_TsOsGN6Aa3uCa5pw-1
X-MC-Unique: FnRhTMPWPyqdsF4Gy47IUw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 002FbVbG013664
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 03 Jan 2020 05:11:38 -0500
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm writecache: SB remove seq_count
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

QW55IGZlZWRiYWNrIG9uIHRoaXMgcGF0Y2ggcGxlYXNlLgoKCk9uIDA2LzEyLzIwMTkgMjE6MDMs
IE1hZ2VkIE1va2h0YXIgd3JvdGU6Cj4gUmVtb3ZlcyBzZXFfY291bnQgZnJvbSBzdXBlciBibG9j
ay4gQ3VycmVudGx5IHRoZSBzdXBlciBibG9jayBnZXRzIAo+IHdyaXR0ZW4gaW4gZWFjaCBjb21t
aXQgdG8gdXBkYXRlIHRoZSBzZXFfY291bnQgd2hpY2ggaXMganVzdCB1c2VkIHdoZW4gCj4gdGhl
IHRhcmdldCBpcyByZXN0YXJ0ZWQvcmVzdW1lZC4gVGhpcyBleHRyYSBpb3AgaGFzIGEgcGVyZm9y
bWFuY2UgaW1wYWN0IAo+IG9uIHNtYWxsIGJsb2NrIHNpemUgd3JpdGVzIHdoaWNoIGRvIEZVQS9z
eW5jIG9uIGV2ZXJ5IHJlcXVlc3QuIEEgNGsgc3luYyAKPiB3cml0ZSBjdXJyZW50bHkgcmVxdWly
ZXMgMyB3cml0ZSBvcHM6IHN1Ym1pdHRlZCBkYXRhLCBtZXRhZGF0YSArIHN1cGVyIAo+IGJsb2Nr
IHNlcV9jb3VudCB1cGRhdGUsIHJlbW92YWwgb2Ygc2VxX2NvdW50IHVwZGF0ZSByZWR1Y2VzIHJl
cXVpcmVkIAo+IHdyaXRlIG9wcyB0byAyLgo+IAo+IFJlYnVpbGQgb2Ygc2VxX2NvdW50IGF0IHN0
YXJ0L3Jlc3VtcHRpb24gY2FuIGJlIGRvbmUgcXVpY2tseSBieSBsb29waW5nIAo+IHRocm91Z2gg
bWVtb3J5IGVudHJ5IG1ldGFkYXRhIHdpdGhpbiB0aGUgcmVzdW1lKCkgZnVuY3Rpb24uCj4gCj4g
U2lnbmVkLW9mZi1ieTogTWFnZWQgTW9raHRhciA8bW1va2h0YXJAcGV0YXNhbi5vcmc+Cj4gLS0t
Cj4gIMKgZHJpdmVycy9tZC9kbS13cml0ZWNhY2hlLmMgfMKgwqAgNTYgKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0KPiAgwqAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pCj4gCj4gLS0tIGEvZHJpdmVycy9tZC9kbS13cml0ZWNhY2hlLmPC
oMKgwqAgMjAxOS0xMi0wNiAwMzowNzo1My4wMDAwMDAwMDAgLTA4MDAKPiArKysgYi9kcml2ZXJz
L21kL2RtLXdyaXRlY2FjaGUuY8KgwqDCoCAyMDE5LTEyLTA2IDA5OjI1OjQ1LjAwMDAwMDAwMCAt
MDgwMAo+IEBAIC01Miw3ICs1Miw4IEBAIGRvIHvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gIMKgI2VuZGlmCj4gCj4gIMKg
I2RlZmluZSBNRU1PUllfU1VQRVJCTE9DS19NQUdJQ8KgwqDCoMKgwqDCoMKgIDB4MjM0ODkzMjEK
PiAtI2RlZmluZSBNRU1PUllfU1VQRVJCTE9DS19WRVJTSU9OwqDCoMKgIDEKPiArI2RlZmluZSBN
RU1PUllfU1VQRVJCTE9DS19WRVJTSU9OXzHCoMKgwqAgMQo+ICsjZGVmaW5lIE1FTU9SWV9TVVBF
UkJMT0NLX1ZFUlNJT05fMsKgwqDCoCAyCj4gCj4gIMKgc3RydWN0IHdjX21lbW9yeV9lbnRyeSB7
Cj4gIMKgwqDCoMKgIF9fbGU2NCBvcmlnaW5hbF9zZWN0b3I7Cj4gQEAgLTY3LDcgKzY4LDYgQEAg
c3RydWN0IHdjX21lbW9yeV9zdXBlcmJsb2NrIHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IF9fbGUzMiBibG9ja19zaXplOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19sZTMyIHBh
ZDsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fbGU2NCBuX2Jsb2NrczsKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBfX2xlNjQgc2VxX2NvdW50Owo+ICDCoMKgwqDCoMKgwqDCoMKgIH07
Cj4gIMKgwqDCoMKgwqDCoMKgwqAgX19sZTY0IHBhZGRpbmdbOF07Cj4gIMKgwqDCoMKgIH07Cj4g
QEAgLTM4MCw2ICszODAsNDEgQEAgc3RhdGljIHVpbnQ2NF90IHJlYWRfc2VxX2NvdW50KHN0cnVj
dCBkbQo+ICDCoCNlbmRpZgo+ICDCoH0KPiAKPiArc3RhdGljIHVpbnQ2NF90IHJlYWRfbGFzdF9z
ZXFfY291bnQoc3RydWN0IGRtX3dyaXRlY2FjaGUgKndjKQo+ICt7Cj4gK8KgwqDCoCBzaXplX3Qg
YjsKPiArwqDCoMKgIHVpbnQ2NF90IGxhc3Rfc2VxX2NvdW50ID0gMDsKPiArwqDCoMKgIHVpbnQ2
NF90IHNlcV9jb3VudDsKPiArwqDCoMKgIF9fbGU2NCBlbXB0eSA9IGNwdV90b19sZTY0KC0xKTsK
PiArCj4gK8KgwqDCoCBpZiAoV0NfTU9ERV9QTUVNKHdjKSkgewo+ICvCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3Qgd2NfbWVtb3J5X2VudHJ5IHdtZTsKPiArwqDCoMKgwqDCoMKgwqAgZm9yIChiID0gMDsg
YiA8IHdjLT5uX2Jsb2NrczsgYisrKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQlVHX09O
KG1lbWNweV9tY3NhZmUoJndtZSwgJnNiKHdjKS0+ZW50cmllc1tiXSwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNpemVvZihzdHJ1Y3Qgd2NfbWVtb3J5X2VudHJ5KSkpOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh3bWUuc2VxX2NvdW50ICE9IGVtcHR5KSB7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXFfY291bnQgPSBsZTY0X3RvX2NwdSh3bWUu
c2VxX2NvdW50KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChsYXN0X3Nl
cV9jb3VudCA8IHNlcV9jb3VudCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbGFzdF9zZXFfY291bnQgPSBzZXFfY291bnQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gK8KgwqDCoCB9Cj4gK8KgwqDCoCBlbHNlIHsKPiAr
wqDCoMKgwqDCoMKgwqAgc3RydWN0IHdjX21lbW9yeV9lbnRyeSAqcCA9ICZzYih3YyktPmVudHJp
ZXNbMF07Cj4gK8KgwqDCoMKgwqDCoMKgIGIgPSB3Yy0+bl9ibG9ja3M7Cj4gK8KgwqDCoMKgwqDC
oMKgIHdoaWxlICgwIDwgYikgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwLT5zZXFf
Y291bnQgIT0gZW1wdHkpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlcV9j
b3VudCA9IGxlNjRfdG9fY3B1KHAtPnNlcV9jb3VudCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAobGFzdF9zZXFfY291bnQgPCBzZXFfY291bnQpCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhc3Rfc2VxX2NvdW50ID0gc2VxX2NvdW50Owo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwKys7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYi0tOwo+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gK8Kg
wqDCoCB9Cj4gK8KgwqDCoCByZXR1cm4gbGFzdF9zZXFfY291bnQ7Cj4gK30KPiArCj4gIMKgc3Rh
dGljIHZvaWQgY2xlYXJfc2VxX2NvdW50KHN0cnVjdCBkbV93cml0ZWNhY2hlICp3Yywgc3RydWN0
IHdjX2VudHJ5ICplKQo+ICDCoHsKPiAgwqAjaWZkZWYgRE1fV1JJVEVDQUNIRV9IQU5ETEVfSEFS
RFdBUkVfRVJST1JTCj4gQEAgLTczMCw4ICs3NjUsNiBAQCBzdGF0aWMgdm9pZCB3cml0ZWNhY2hl
X2ZsdXNoKHN0cnVjdCBkbV93Cj4gIMKgwqDCoMKgwqDCoMKgwqAgd3JpdGVjYWNoZV93YWl0X2Zv
cl9pb3Mod2MsIFdSSVRFKTsKPiAKPiAgwqDCoMKgwqAgd2MtPnNlcV9jb3VudCsrOwo+IC3CoMKg
wqAgcG1lbV9hc3NpZ24oc2Iod2MpLT5zZXFfY291bnQsIGNwdV90b19sZTY0KHdjLT5zZXFfY291
bnQpKTsKPiAtwqDCoMKgIHdyaXRlY2FjaGVfZmx1c2hfcmVnaW9uKHdjLCAmc2Iod2MpLT5zZXFf
Y291bnQsIHNpemVvZiAKPiBzYih3YyktPnNlcV9jb3VudCk7Cj4gIMKgwqDCoMKgIHdyaXRlY2Fj
aGVfY29tbWl0X2ZsdXNoZWQod2MpOwo+IAo+ICDCoMKgwqDCoCB3Yy0+b3Zlcndyb3RlX2NvbW1p
dHRlZCA9IGZhbHNlOwo+IEBAIC04NzYsNyArOTA5LDYgQEAgc3RhdGljIHZvaWQgd3JpdGVjYWNo
ZV9yZXN1bWUoc3RydWN0IGRtXwo+ICDCoMKgwqDCoCBzdHJ1Y3QgZG1fd3JpdGVjYWNoZSAqd2Mg
PSB0aS0+cHJpdmF0ZTsKPiAgwqDCoMKgwqAgc2l6ZV90IGI7Cj4gIMKgwqDCoMKgIGJvb2wgbmVl
ZF9mbHVzaCA9IGZhbHNlOwo+IC3CoMKgwqAgX19sZTY0IHNiX3NlcV9jb3VudDsKPiAgwqDCoMKg
wqAgaW50IHI7Cj4gCj4gIMKgwqDCoMKgIHdjX2xvY2sod2MpOwo+IEBAIC04OTQsMTIgKzkyNiw3
IEBAIHN0YXRpYyB2b2lkIHdyaXRlY2FjaGVfcmVzdW1lKHN0cnVjdCBkbV8KPiAgwqDCoMKgwqAg
fQo+ICDCoMKgwqDCoCB3Yy0+ZnJlZWxpc3Rfc2l6ZSA9IDA7Cj4gCj4gLcKgwqDCoCByID0gbWVt
Y3B5X21jc2FmZSgmc2Jfc2VxX2NvdW50LCAmc2Iod2MpLT5zZXFfY291bnQsIAo+IHNpemVvZih1
aW50NjRfdCkpOwo+IC3CoMKgwqAgaWYgKHIpIHsKPiAtwqDCoMKgwqDCoMKgwqAgd3JpdGVjYWNo
ZV9lcnJvcih3YywgciwgImhhcmR3YXJlIG1lbW9yeSBlcnJvciB3aGVuIHJlYWRpbmcgCj4gc3Vw
ZXJibG9jazogJWQiLCByKTsKPiAtwqDCoMKgwqDCoMKgwqAgc2Jfc2VxX2NvdW50ID0gY3B1X3Rv
X2xlNjQoMCk7Cj4gLcKgwqDCoCB9Cj4gLcKgwqDCoCB3Yy0+c2VxX2NvdW50ID0gbGU2NF90b19j
cHUoc2Jfc2VxX2NvdW50KTsKPiArwqDCoMKgIHdjLT5zZXFfY291bnQgPSByZWFkX2xhc3Rfc2Vx
X2NvdW50KHdjKSArIDE7Cj4gCj4gIMKgI2lmZGVmIERNX1dSSVRFQ0FDSEVfSEFORExFX0hBUkRX
QVJFX0VSUk9SUwo+ICDCoMKgwqDCoCBmb3IgKGIgPSAwOyBiIDwgd2MtPm5fYmxvY2tzOyBiKysp
IHsKPiBAQCAtMTc1NywxMCArMTc4NCw5IEBAIHN0YXRpYyBpbnQgaW5pdF9tZW1vcnkoc3RydWN0
IGRtX3dyaXRlY2EKPiAKPiAgwqDCoMKgwqAgZm9yIChiID0gMDsgYiA8IEFSUkFZX1NJWkUoc2Io
d2MpLT5wYWRkaW5nKTsgYisrKQo+ICDCoMKgwqDCoMKgwqDCoMKgIHBtZW1fYXNzaWduKHNiKHdj
KS0+cGFkZGluZ1tiXSwgY3B1X3RvX2xlNjQoMCkpOwo+IC3CoMKgwqAgcG1lbV9hc3NpZ24oc2Io
d2MpLT52ZXJzaW9uLCBjcHVfdG9fbGUzMihNRU1PUllfU1VQRVJCTE9DS19WRVJTSU9OKSk7Cj4g
K8KgwqDCoCBwbWVtX2Fzc2lnbihzYih3YyktPnZlcnNpb24sIAo+IGNwdV90b19sZTMyKE1FTU9S
WV9TVVBFUkJMT0NLX1ZFUlNJT05fMikpOwo+ICDCoMKgwqDCoCBwbWVtX2Fzc2lnbihzYih3Yykt
PmJsb2NrX3NpemUsIGNwdV90b19sZTMyKHdjLT5ibG9ja19zaXplKSk7Cj4gIMKgwqDCoMKgIHBt
ZW1fYXNzaWduKHNiKHdjKS0+bl9ibG9ja3MsIGNwdV90b19sZTY0KHdjLT5uX2Jsb2NrcykpOwo+
IC3CoMKgwqAgcG1lbV9hc3NpZ24oc2Iod2MpLT5zZXFfY291bnQsIGNwdV90b19sZTY0KDApKTsK
PiAKPiAgwqDCoMKgwqAgZm9yIChiID0gMDsgYiA8IHdjLT5uX2Jsb2NrczsgYisrKQo+ICDCoMKg
wqDCoMKgwqDCoMKgIHdyaXRlX29yaWdpbmFsX3NlY3Rvcl9zZXFfY291bnQod2MsICZ3Yy0+ZW50
cmllc1tiXSwgLTEsIC0xKTsKPiBAQCAtMjE1OSwxMSArMjE4NSwxMyBAQCBpbnZhbGlkX29wdGlv
bmFsOgo+ICDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gYmFkOwo+ICDCoMKgwqDCoCB9Cj4gCj4gLcKg
wqDCoCBpZiAobGUzMl90b19jcHUocy52ZXJzaW9uKSAhPSBNRU1PUllfU1VQRVJCTE9DS19WRVJT
SU9OKSB7Cj4gK8KgwqDCoCBpZiAobGUzMl90b19jcHUocy52ZXJzaW9uKSAhPSBNRU1PUllfU1VQ
RVJCTE9DS19WRVJTSU9OXzEgJiYKPiArwqDCoMKgwqDCoMKgwqAgbGUzMl90b19jcHUocy52ZXJz
aW9uKSAhPSBNRU1PUllfU1VQRVJCTE9DS19WRVJTSU9OXzIpIHsKPiAgwqDCoMKgwqDCoMKgwqDC
oCB0aS0+ZXJyb3IgPSAiSW52YWxpZCB2ZXJzaW9uIGluIHRoZSBzdXBlcmJsb2NrIjsKPiAgwqDC
oMKgwqDCoMKgwqDCoCByID0gLUVJTlZBTDsKPiAgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGJhZDsK
PiAgwqDCoMKgwqAgfQo+ICvCoMKgwqAgcG1lbV9hc3NpZ24oc2Iod2MpLT52ZXJzaW9uLCAKPiBj
cHVfdG9fbGUzMihNRU1PUllfU1VQRVJCTE9DS19WRVJTSU9OXzIpKTsKPiAKPiAgwqDCoMKgwqAg
aWYgKGxlMzJfdG9fY3B1KHMuYmxvY2tfc2l6ZSkgIT0gd2MtPmJsb2NrX3NpemUpIHsKPiAgwqDC
oMKgwqDCoMKgwqDCoCB0aS0+ZXJyb3IgPSAiQmxvY2sgc2l6ZSBkb2VzIG5vdCBtYXRjaCBzdXBl
cmJsb2NrIjsKCi0tIApNYWdlZCBNb2todGFyCkNFTyBQZXRhU0FOCjQgRW1hZCBFbCBEZWVuIEth
bWVsCkNhaXJvIDExMzcxLCBFZ3lwdAp3d3cucGV0YXNhbi5vcmcKKzIwMTAwNjk3OTkzMQpza3lw
ZTogbWFnZWQubW9raHRhcgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRo
YXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

