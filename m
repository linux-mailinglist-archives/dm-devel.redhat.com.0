Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BA8B06A6
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 03:57:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE22B18C4260;
	Thu, 12 Sep 2019 01:57:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E515D9D5;
	Thu, 12 Sep 2019 01:57:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A33E24F30;
	Thu, 12 Sep 2019 01:57:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8C1r4eC003966 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 21:53:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76DB25DA5B; Thu, 12 Sep 2019 01:53:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 712685D9D5
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 01:53:00 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6BE812A2
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 01:52:58 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q21so14855613pfn.11
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 18:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=purestorage.com; s=google;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=SlbhNTih32jBHwuKusSg3EHVGJrUXld66zEFAzdE9Fo=;
	b=Km2u/sTzYaFtndT3BepQey4T20RY7W7AtCjDv4Tdg4mVyvFo6OptyFcxpILnyvOB3p
	3OXh3GCSncmEE2oGTolt+xvuIF3Ao5kRQA6m6AKkVQRTkZ45Ulco/Ken+ng4I2EYIFE2
	eRrwvZ9dL9UYn/Ki43rb4mj+oPLToq2cIiADE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=SlbhNTih32jBHwuKusSg3EHVGJrUXld66zEFAzdE9Fo=;
	b=lSY44ZPFwpqY/aRtNZx8q8tiixDOKOz1l8Z4JxOeQ1fe6VjOpveYJ7rlGlmKRYgUe/
	aULojqTEZfzYVd2clw5mvIp5XyuoGhql2nA4nQImKPzHYY5STPl7dnIMzquMO5UWY+f6
	Vm3uyQREOncHEca14PivZS0VIrwoW3kB4Y2vgKfS4wJb0EobRusroTNDigyKTVrklhIZ
	aQIcvlD4oLwd3Va06o94y9TPFnWCQDfqMyJdJ0uKAUn6XVd96qTbb8HvGLM549VsyEB+
	GQHndYKLORHJ+LoCSX/jAL8mt8wzFB61Te7j/TzYy8dXMFW7rG9rrfOl/2wE5gvKoebB
	+yxA==
X-Gm-Message-State: APjAAAWCbMEg9wITHe2X0JnmbztiMcONBjJD4S3TwdxnDpCCLzjksIhi
	AaHG42p+51YyTf+Iyq0cPM33ulWz/Lsqlg==
X-Google-Smtp-Source: APXvYqxgm/CYpycj0UnhGYllnUtaiiuZ+lECxHfL9Nbm2DuCoatOkvxUvngyUlN1gl9vnW9JrJfX3w==
X-Received: by 2002:aa7:8dcf:: with SMTP id j15mr36448407pfr.5.1568253178093; 
	Wed, 11 Sep 2019 18:52:58 -0700 (PDT)
Received: from brians-mbp.purestorage.com ([64.84.68.252])
	by smtp.gmail.com with ESMTPSA id
	x10sm31485873pfr.44.2019.09.11.18.52.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Sep 2019 18:52:57 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.2\))
Date: Wed, 11 Sep 2019 18:52:56 -0700
References: <EF473529-CF81-4AE9-BD96-08624B59BA10@purestorage.com>
	<ef113ecf-e564-a959-870e-b80af8fe5a30@gmail.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	device-mapper development <dm-devel@redhat.com>
In-Reply-To: <ef113ecf-e564-a959-870e-b80af8fe5a30@gmail.com>
Message-Id: <0A7F7644-C70C-4EEC-B697-AD3B3D8B58DC@purestorage.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 12 Sep 2019 01:52:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Thu, 12 Sep 2019 01:52:59 +0000 (UTC) for IP:'209.85.210.193'
	DOMAIN:'mail-pf1-f193.google.com'
	HELO:'mail-pf1-f193.google.com' FROM:'brian@purestorage.com'
	RCPT:''
X-RedHat-Spam-Score: -0.098  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.210.193 mail-pf1-f193.google.com 209.85.210.193
	mail-pf1-f193.google.com <brian@purestorage.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x8C1r4eC003966
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] ALUA support for PURE FlashArray
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Thu, 12 Sep 2019 01:57:52 +0000 (UTC)

WG9zZSwKCkkganVzdCBzYXcgdGhpcy4gU29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNlLgoKSSBh
bSBub3Qgc3VyZSBpZiB0aGUgbWF4X3NlY3RvcnNfa2IgaXMgYSBrZXJuZWwgb3IgdWRldiBidWcu
IFdoYXQgSSB3b3VsZCBleHBlY3QgaXMgZm9yIHRoZSBibG9jayBsaW1pdHMgCklOUVVJUlkgVlBE
ICBwYWdlLCAweEIwLCB0byBiZSB1c2VkIHRvIHBvcHVsYXRlIHRoZSAvc3lzL2Jsb2NrIGVudHJp
ZXMgZm9yIG1heF9zZWN0b3JzX2tiLiBXZSBoYXZlIApzZWVuIExpbnV4IGRpc3RyaWJ1dGlvbnMg
dGhhdCBkb27igJl0IHNlZW0gdG8gZG8gdGhhdCBidXQgaW5zdGVhZCBwb3B1bGF0ZSB0aGF0IGVu
dHJ5IHdpdGggMzIgTUIgZXZlbiB0aG91Z2ggCndlIHJldHVybiA0IE1CIGFzIG91ciBsaW1pdC4g
V2UgYWRkIHRoZSA0IE1CIGxpbWl0IGluIGEgdWRldiBydWxlIHRoYXQgd2UgaGF2ZSBjcmVhdGVk
IGFuZCBwcm92aWRlIHRvIG91ciAKY3VzdG9tZXJzLiAgQWRkaW5nIGl0IGluIG11bHRpcGF0aC5j
b25mIHdpbGwgYWxzbyBnZXQgdXMgNCBNQiBmb3IgdGhlIGRtIGRldmljZSBhbmQgaXRzIHNsYXZl
cyB3aGljaCBpcyB3aGF0IHdlIAp3YW50LiBJIGRvbuKAmXQga25vdyBpZiB0aGVyZSBpcyBhIHBy
ZWZlcnJlZCB3YXkgYnV0IGlmIHdlIHVzZSBtdWx0aXBhdGguY29uZiB0aGVuIGhvcGVmdWxseSBu
byB1c2VycyB3aWxsIGV2ZXIgCmhhdmUgdG8gZGVhbCB3aXRoIHRoZSBoaWdoZXIgdmFsdWUgdGhh
dCB3aWxsIGVycm9yIG91dCBpZiBhIFNDU0kgcmVhZCBvciB3cml0ZSBpcyBhY3R1YWxseSBzZW50
IGxhcmdlciB0aGFuIAp0aGUgNCBNQiBtYXhpbXVtIHNpemUuCgpUaGFua3MsCkJyaWFuCgpCcmlh
biBCdW5rZXIKU1cgRW5nCmJyaWFuQHB1cmVzdG9yYWdlLmNvbQoKCgo+IE9uIEF1ZyA3LCAyMDE5
LCBhdCA5OjA1IEFNLCBYb3NlIFZhenF1ZXogUGVyZXogPHhvc2UudmF6cXVlekBnbWFpbC5jb20+
IHdyb3RlOgo+IAo+IE9uIDYvMjYvMTkgNzozNyBQTSwgQnJpYW4gQnVua2VyIHdyb3RlOgo+IAo+
PiBJdCBoYXMgYmVlbiBzb21lIHRpbWUgc2luY2Ugd2UgdXBkYXRlZCBvdXIgUFVSRSBGbGFzaEFy
cmF5IGNvbmZpZ3VyYXRpb24uIFRoZQo+PiBMaW51eCB2ZW5kb3JzIHRoYXQgd2UgaGFkIGJlZW4g
c2VlaW5nIGluIHRoZSBmaWVsZCB3ZXJlIHVzaW5nIHZlcnkgb2xkIHZlcnNpb25zCj4+IG9mIG11
bHRpcGF0aC10b29scywgc28gd2UgaGF2ZW7igJl0IG5lZWRlZCB0byBjaGFuZ2UgYW55dGhpbmcg
Zm9yIHNvbWUgdGltZS4gV2l0aAo+PiB0aGUgcmVsZWFzZSBvZiBSSEVMOCwgc29tZSBvZiBvdXIg
ZWFybGllciB2YWx1ZXMgaGF2ZSBiZWVuIGxvc3QgYnkgdXBzdHJlYW0KPj4gY2hhbmdlcy4gCj4+
IAo+PiBJbiBhZGRpdGlvbiB3ZSBoYXZlIG91ciBBY3RpdmUgQ2x1c3RlciBmZWF0dXJlIHdoaWNo
IGxldmVyYWdlcyBBTFVBIHNpbmNlIG91cgo+PiBsYXN0IHBhdGNoLiBUaGUgQUxVQSBjb25mZ3Vy
YXRpb24gd2lsbCB3b3JrIGZvciBhbGwgRmxhc2hBcnJheXMgd2l0aCBvciB3aXRob3V0Cj4+IEFj
dGl2ZSBDbHVzdGVyLgo+PiAKPj4gV2UgYXJlIGNoYW5naW5nIDMgdGhpbmdzLgo+PiAKPj4gMS4g
QUxVQSBzdXBwb3J0Cj4+IAo+PiAyLiBGYXN0IGZhaWwgdGltZW91dCBmcm9tIHRoZSBkZWZhdWx0
IG9mIDUgc2Vjb25kcyB0byAxMCBzZWNvbmRzIChXZSBuZWVkIHRoaXMKPj4gZm9yIG91ciBGQyBO
UElWIHBvcnQgbWlncmF0aW9uKS4KPj4gCj4+IDMuIE1heGltdW0gc2VjdG9yIHNpemUgb2YgNE1C
LiBTb21lIExpbnV4IHZlbmRvcnMgZG9u4oCZdCBob25vciB0aGUgYmxvY2sgbGltaXRzCj4+IFZQ
RCBwYWdlIG9mIElOUVVJUlkpLgo+IAo+IAo+ICMzLCBrZXJuZWwgb3IgdWRldiBidWc/Cj4gCj4g
Cj4+IGRpZmYgLS1naXQgYS9saWJtdWx0aXBhdGgvaHd0YWJsZS5jIGIvbGlibXVsdGlwYXRoL2h3
dGFibGUuYwo+PiBpbmRleCAxZDk2NDMzMy4uMzdlOTdmNjAgMTAwNjQ0Cj4+IC0tLSBhL2xpYm11
bHRpcGF0aC9od3RhYmxlLmMKPj4gKysrIGIvbGlibXVsdGlwYXRoL2h3dGFibGUuYwo+PiBAQCAt
MTAyNCw3ICsxMDI0LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgaHdlbnRyeSBkZWZhdWx0X2h3W10gPSB7
Cj4+ICAgICAgICAgICAgICAgIC8qIEZsYXNoQXJyYXkgKi8KPj4gICAgICAgICAgICAgICAgLnZl
bmRvciAgICAgICAgPSAiUFVSRSIsCj4+ICAgICAgICAgICAgICAgIC5wcm9kdWN0ICAgICAgID0g
IkZsYXNoQXJyYXkiLAo+PiAtICAgICAgICAgICAgICAgLnBncG9saWN5ICAgICAgPSBNVUxUSUJV
UywKPj4gKyAgICAgICAgICAgICAgIC5wZ3BvbGljeSAgICAgID0gR1JPVVBfQllfUFJJTywKPj4g
KyAgICAgICAgICAgICAgIC5wZ2ZhaWxiYWNrICAgID0gLUZBSUxCQUNLX0lNTUVESUFURSwKPj4g
KyAgICAgICAgICAgICAgIC5od2hhbmRsZXIgICAgID0gIjEgYWx1YSIsCj4+ICsgICAgICAgICAg
ICAgICAucHJpb19uYW1lICAgICA9IFBSSU9fQUxVQSwKPj4gKyAgICAgICAgICAgICAgIC5mYXN0
X2lvX2ZhaWwgID0gMTAsCj4+ICsgICAgICAgICAgICAgICAubWF4X3NlY3RvcnNfa2IgPSA0MDk2
LAoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8v
d3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==
