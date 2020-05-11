Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4B79C1CD80A
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 13:25:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589196326;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=irda4kLu9Zir/Vexi4fWK/Cg4JpelhChWGlXZmhSlbI=;
	b=Pr0SGN4DwOBZgDcJFKYwJEGkVzXu4AesXyHlMDY+G8Wp33aKJnb48FXAwMDvAAYB+kGMOt
	XNxNA9dtjHk9de1KbKOhBgPLji77xNpfz4Pb7domsoQD2vMAWeS1V8JmpoPVQxIPvHPhg2
	e9iM07fu/c92O0DeoylElFRTbDryj3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-eK6vwncbNIm0s3cGzjCdqQ-1; Mon, 11 May 2020 07:25:23 -0400
X-MC-Unique: eK6vwncbNIm0s3cGzjCdqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E74E835B45;
	Mon, 11 May 2020 11:25:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E319341FC;
	Mon, 11 May 2020 11:25:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D14C64CAA0;
	Mon, 11 May 2020 11:25:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BBP4lR018526 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 07:25:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30E5E20A8DCD; Mon, 11 May 2020 11:25:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC422026971
	for <dm-devel@redhat.com>; Mon, 11 May 2020 11:25:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 273F21859160
	for <dm-devel@redhat.com>; Mon, 11 May 2020 11:25:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-306-swN5y7CjOw2u8Y_ryyYEww-1;
	Mon, 11 May 2020 07:24:57 -0400
X-MC-Unique: swN5y7CjOw2u8Y_ryyYEww-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E74A0AFB2;
	Mon, 11 May 2020 11:24:58 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <2553e593-795d-6aed-f983-e990a283e2ff@suse.de>
Date: Mon, 11 May 2020 13:24:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BBP4lR018526
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xMS8yMCAxMjo1NSBQTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4gT24gMjAyMC8wNS8x
MSAxMTo0NiwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4+IE1pa2UsCj4+Cj4+IEkgYW0gc3RpbGwg
c2VlaW5nIHRoZSB3YXJuaW5nOgo+Pgo+PiBbIDE4MjcuODM5NzU2XSBkZXZpY2UtbWFwcGVyOiB0
YWJsZTogMjUzOjE6IGFkZGluZyB0YXJnZXQgZGV2aWNlIHNkaiBjYXVzZWQgYW4KPj4gYWxpZ25t
ZW50IGluY29uc2lzdGVuY3k6IHBoeXNpY2FsX2Jsb2NrX3NpemU9NDA5NiwgbG9naWNhbF9ibG9j
a19zaXplPTQwOTYsCj4+IGFsaWdubWVudF9vZmZzZXQ9MCwgc3RhcnQ9MAo+PiBbIDE4MjcuODU2
NzM4XSBkZXZpY2UtbWFwcGVyOiB0YWJsZTogMjUzOjE6IGFkZGluZyB0YXJnZXQgZGV2aWNlIHNk
aiBjYXVzZWQgYW4KPj4gYWxpZ25tZW50IGluY29uc2lzdGVuY3k6IHBoeXNpY2FsX2Jsb2NrX3Np
emU9NDA5NiwgbG9naWNhbF9ibG9ja19zaXplPTQwOTYsCj4+IGFsaWdubWVudF9vZmZzZXQ9MCwg
c3RhcnQ9MAo+PiBbIDE4MjcuODc0MDMxXSBkZXZpY2UtbWFwcGVyOiB0YWJsZTogMjUzOjE6IGFk
ZGluZyB0YXJnZXQgZGV2aWNlIHNkaiBjYXVzZWQgYW4KPj4gYWxpZ25tZW50IGluY29uc2lzdGVu
Y3k6IHBoeXNpY2FsX2Jsb2NrX3NpemU9NDA5NiwgbG9naWNhbF9ibG9ja19zaXplPTQwOTYsCj4+
IGFsaWdubWVudF9vZmZzZXQ9MCwgc3RhcnQ9MAo+PiBbIDE4MjcuODkxMDg2XSBkZXZpY2UtbWFw
cGVyOiB0YWJsZTogMjUzOjE6IGFkZGluZyB0YXJnZXQgZGV2aWNlIHNkaiBjYXVzZWQgYW4KPj4g
YWxpZ25tZW50IGluY29uc2lzdGVuY3k6IHBoeXNpY2FsX2Jsb2NrX3NpemU9NDA5NiwgbG9naWNh
bF9ibG9ja19zaXplPTQwOTYsCj4+IGFsaWdubWVudF9vZmZzZXQ9MCwgc3RhcnQ9MAo+Pgo+PiB3
aGVuIG1peGluZyA1MTJCIHNlY3RvciBhbmQgNEtCIHNlY3RvciBkZXZpY2VzLiBJbnZlc3RpZ2F0
aW5nIG5vdy4KPiAKPiAKPiBPSy4gRmlndXJlZCB0aGF0IG9uZSBvdXQ6IHRoZSA1MDBHQiBTU0Qg
SSBhbSB1c2luZyBmb3IgdGhlIHJlZ3VsYXIgZGV2aWNlIGlzCj4gOTc2NzczMTY4IDUxMkIgc2Vj
dG9ycyBjYXBhY2l0eSwgdGhhdCBpcywgbm90IGEgbXVsdGlwbGUgb2YgdGhlIDI1Nk1CIHpvbmUg
c2l6ZSwKPiBhbmQgbm90IGV2ZW4gYSBtdWx0aXBsZSBvZiA0Sy4gVGhpcyBjYXVzZXMgdGhlIGNy
ZWF0aW9uIG9mIGEgMTJNQiBydW50IHpvbmUgb2YKPiAyNDYyNCBzZWN0b3JzLCB3aGljaCBpcyBp
Z25vcmVkLiBCdXQgdGhlIHN0YXJ0IHNlY3RvciBvZiB0aGUgc2Vjb25kIGRldmljZSBpbgo+IHRo
ZSBkbS10YWJsZSByZW1haW5zIDk3Njc3MzE2OCwgc28gbm90IGFsaWduZWQgb24gNEsuIFRoaXMg
Y2F1c2VzCj4gYmRldl9zdGFja19saW1pdHMgdG8gcmV0dXJuIGFuIGVycm9yIGFuZCB0aGUgYWJv
dmUgbWVzc2FnZXMgdG8gYmUgcHJpbnRlZC4KPiAKPiBTbyBJIHRoaW5rIHdlIG5lZWQgdG8gY29t
cGxldGVseSBpZ25vcmUgdGhlIGV2ZW50dWFsICJydW50IiB6b25lIG9mIHRoZSByZWd1bGFyCj4g
ZGV2aWNlIHNvIHRoYXQgZXZlcnl0aGluZyBhbGlnbnMgY29ycmVjdGx5LiBUaGlzIHdpbGwgbmVl
ZCBjaGFuZ2VzIGluIGJvdGgKPiBkbXphZG0gYW5kIGRtLXpvbmVkLgo+IAo+IEhhbm5lcywgSSBj
YW4gaGFjayBzb21ldGhpbmcgb24gdG9wIG9mIHlvdXIgc2VyaWVzLiBPciBjYW4geW91IHJlc2Vu
ZCB3aXRoIHRoYXQKPiBmaXhlZCA/Cj4gCj4gCj4gCj4gCkRvZXMgdGhpcyBvbmUgaGVscD8KCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLXpvbmVkLXRhcmdldC5jIGIvZHJpdmVycy9tZC9kbS16
b25lZC10YXJnZXQuYwppbmRleCBlYTQzZjY4OTJjZWQuLjVkYWNhODJiNWVjNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tZC9kbS16b25lZC10YXJnZXQuYworKysgYi9kcml2ZXJzL21kL2RtLXpvbmVk
LXRhcmdldC5jCkBAIC0xMDQxLDEzICsxMDQxLDE3IEBAIHN0YXRpYyBpbnQgZG16X2l0ZXJhdGVf
ZGV2aWNlcyhzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSwKICB7CiAgICAgICAgIHN0cnVjdCBkbXpfdGFy
Z2V0ICpkbXogPSB0aS0+cHJpdmF0ZTsKICAgICAgICAgdW5zaWduZWQgaW50IHpvbmVfbnJfc2Vj
dG9ycyA9IGRtel96b25lX25yX3NlY3RvcnMoZG16LT5tZXRhZGF0YSk7CisgICAgICAgdW5zaWdu
ZWQgaW50IG5yX3pvbmVzOwogICAgICAgICBzZWN0b3JfdCBjYXBhY2l0eTsKICAgICAgICAgaW50
IHI7CgotICAgICAgIGNhcGFjaXR5ID0gZG16LT5kZXZbMF0uY2FwYWNpdHkgJiB+KHpvbmVfbnJf
c2VjdG9ycyAtIDEpOworICAgICAgIG5yX3pvbmVzID0gRElWX1JPVU5EX0RPV04oZG16LT5kZXZb
MF0uY2FwYWNpdHksIHpvbmVfbnJfc2VjdG9ycyk7CisgICAgICAgY2FwYWNpdHkgPSBucl96b25l
cyAqIHpvbmVfbnJfc2VjdG9yczsKICAgICAgICAgciA9IGZuKHRpLCBkbXotPmRkZXZbMF0sIDAs
IGNhcGFjaXR5LCBkYXRhKTsKICAgICAgICAgaWYgKCFyICYmIGRtei0+ZGRldlsxXSkgewotICAg
ICAgICAgICAgICAgY2FwYWNpdHkgPSBkbXotPmRldlsxXS5jYXBhY2l0eSAmIH4oem9uZV9ucl9z
ZWN0b3JzIC0gMSk7CisgICAgICAgICAgICAgICBucl96b25lcyA9IERJVl9ST1VORF9ET1dOKGRt
ei0+ZGV2WzEuY2FwYWNpdHksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHpvbmVfbnJfc2VjdG9ycykpOworICAgICAgICAgICAgICAgY2FwYWNpdHkg
PSBucl96b25lcyAqIHpvbmVfbnJfc2VjdG9yczsKICAgICAgICAgICAgICAgICByID0gZm4odGks
IGRtei0+ZGRldlsxXSwgMCwgY2FwYWNpdHksIGRhdGEpOwogICAgICAgICB9CiAgICAgICAgIHJl
dHVybiByOwoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAg
ICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7D
vHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

