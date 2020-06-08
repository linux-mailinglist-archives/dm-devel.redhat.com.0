Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2B47B1F12E3
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jun 2020 08:35:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591598102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UzGGrySA061qOKoUtwb8RwILG+V5heN+mnrIZ5re3eo=;
	b=C2VTCWTJN8s8aTYC4qu9X3Hf+4C/L2+Spgl+rlg8EF7tv1bUyO+ERCgSTn602fIwKnqynh
	ZZQv+XcaU44OPetRaIy2ftOFYk0QAcM3UUJiAxwRaKgmhp72Vk02NrtIytpSJQxR7i8/rL
	aWrMSBjN5+Ve+ezSF3hrUYLeitHCG2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-b_7BRd2vM0Wklq5NHk__5w-1; Mon, 08 Jun 2020 02:35:00 -0400
X-MC-Unique: b_7BRd2vM0Wklq5NHk__5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67CA9107ACF3;
	Mon,  8 Jun 2020 06:34:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 676805D9C9;
	Mon,  8 Jun 2020 06:34:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3818C65D10;
	Mon,  8 Jun 2020 06:34:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0586XqdL007326 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 02:33:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CCE5F7D282; Mon,  8 Jun 2020 06:33:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8D057D2AC
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 06:33:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB0E18026A2
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 06:33:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-434-_XDg4JoFOp6P2OHSgvy7Pw-1;
	Mon, 08 Jun 2020 02:33:46 -0400
X-MC-Unique: _XDg4JoFOp6P2OHSgvy7Pw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B6AE2AEE7;
	Mon,  8 Jun 2020 06:22:57 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
References: <20200608042059.1256086-1-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <7a8f66c6-3ecd-a255-d1d3-82c5a3f8147b@suse.de>
Date: Mon, 8 Jun 2020 08:22:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608042059.1256086-1-damien.lemoal@wdc.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0586XqdL007326
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm zoned: Fix uninitialized pointer
	dereference
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

T24gNi84LzIwIDY6MjAgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IE1ha2Ugc3VyZSB0aGF0
IHRoZSBsb2NhbCB2YXJpYWJsZSByem9uZSBpbiBkbXpfZG9fcmVjbGFpbSgpIGlzIGFsd2F5cwo+
IGluaXRpYWxpemVkIGJlZm9yZSBiZWluZyB1c2VkIGZvciBwcmludGluZyBkZWJ1ZyBtZXNzYWdl
cy4KPiAKPiBGaXhlczogZjk3ODA5YWVjNTg5ICgiZG0gem9uZWQ6IHBlci1kZXZpY2UgcmVjbGFp
bSIpCj4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNv
bT4KPiBDYzogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+Cj4gLS0tCj4gICBkcml2ZXJz
L21kL2RtLXpvbmVkLXJlY2xhaW0uYyB8IDQgKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2Rt
LXpvbmVkLXJlY2xhaW0uYyBiL2RyaXZlcnMvbWQvZG0tem9uZWQtcmVjbGFpbS5jCj4gaW5kZXgg
MjI2MWI0ZGQ2MGI3Li5kZDFlZWJmNmU1MGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZC9kbS16
b25lZC1yZWNsYWltLmMKPiArKysgYi9kcml2ZXJzL21kL2RtLXpvbmVkLXJlY2xhaW0uYwo+IEBA
IC0zNzcsNiArMzc3LDcgQEAgc3RhdGljIGludCBkbXpfZG9fcmVjbGFpbShzdHJ1Y3QgZG16X3Jl
Y2xhaW0gKnpyYykKPiAgIAkJCWRtel9tZXRhZGF0YV9sYWJlbCh6bWQpLCB6cmMtPmRldl9pZHgp
Owo+ICAgCQlyZXR1cm4gLUVCVVNZOwo+ICAgCX0KPiArCXJ6b25lID0gZHpvbmU7Cj4gICAKPiAg
IAlzdGFydCA9IGppZmZpZXM7Cj4gICAJaWYgKGRtel9pc19jYWNoZShkem9uZSkgfHwgZG16X2lz
X3JuZChkem9uZSkpIHsKPiBAQCAtMzkxLDggKzM5Miw2IEBAIHN0YXRpYyBpbnQgZG16X2RvX3Jl
Y2xhaW0oc3RydWN0IGRtel9yZWNsYWltICp6cmMpCj4gICAJCQkgKi8KPiAgIAkJCXJldCA9IGRt
el9yZWNsYWltX3JuZF9kYXRhKHpyYywgZHpvbmUpOwo+ICAgCQl9Cj4gLQkJcnpvbmUgPSBkem9u
ZTsKPiAtCj4gICAJfSBlbHNlIHsKPiAgIAkJc3RydWN0IGRtX3pvbmUgKmJ6b25lID0gZHpvbmUt
PmJ6b25lOwo+ICAgCQlzZWN0b3JfdCBjaHVua19ibG9jayA9IDA7Cj4gQEAgLTQxNSw3ICs0MTQs
NiBAQCBzdGF0aWMgaW50IGRtel9kb19yZWNsYWltKHN0cnVjdCBkbXpfcmVjbGFpbSAqenJjKQo+
ICAgCQkJICogYmUgbGF0ZXIgcmVjbGFpbWVkLgo+ICAgCQkJICovCj4gICAJCQlyZXQgPSBkbXpf
cmVjbGFpbV9zZXFfZGF0YSh6cmMsIGR6b25lKTsKPiAtCQkJcnpvbmUgPSBkem9uZTsKPiAgIAkJ
fQo+ICAgCX0KPiAgIG91dDoKPiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBz
dXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAg
ICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7D
vHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

