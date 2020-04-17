Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 428521AD667
	for <lists+dm-devel@lfdr.de>; Fri, 17 Apr 2020 08:44:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587105861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FXLw6JtIrXAlIRehMb1ooBgofH0iiwAatvuZY58pgpg=;
	b=iEfmNXSYiiXM/rvF99HKSk2BpRvg//rDfkmN0a4ZZuLsVdnzVG4SOqmSo+MHv9zI6h67l1
	BFnnWgRGDa5WP838e/uiXtMTSYgQEFlMsg5k1LTPPsRwfBk2VQSjPLkwrikt8ZRqEKZV4r
	vNxXah0BdHxSQSoTdIbgL7zMLyFsWII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-54S9LzuRMJOeAvJCczRXqA-1; Fri, 17 Apr 2020 02:44:19 -0400
X-MC-Unique: 54S9LzuRMJOeAvJCczRXqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6E85802686;
	Fri, 17 Apr 2020 06:44:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEBA211A098;
	Fri, 17 Apr 2020 06:44:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F12A934FB;
	Fri, 17 Apr 2020 06:44:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03H0nsg0016378 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 20:49:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A3722166B2C; Fri, 17 Apr 2020 00:49:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 862CE2166B28
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 00:49:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE6E28FF672
	for <dm-devel@redhat.com>; Fri, 17 Apr 2020 00:49:51 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-156-olrpMf9zMQySzdP_iwpg_g-1;
	Thu, 16 Apr 2020 20:49:45 -0400
X-MC-Unique: olrpMf9zMQySzdP_iwpg_g-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7355420B4737;
	Thu, 16 Apr 2020 17:49:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7355420B4737
To: Casey Schaufler <casey@schaufler-ca.com>, linux-integrity@vger.kernel.org, 
	zohar@linux.ibm.com, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, dm-devel@redhat.com
References: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
	<b8dcaa3d-5006-2730-aa57-fb99e13c4472@schaufler-ca.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <1feebdbe-94a8-16f7-deea-704e858a40a4@linux.microsoft.com>
Date: Thu, 16 Apr 2020 17:49:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b8dcaa3d-5006-2730-aa57-fb99e13c4472@schaufler-ca.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03H0nsg0016378
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 17 Apr 2020 02:43:50 -0400
Cc: sashal@kernel.org, nramas@linux.microsoft.com, jmorris@namei.org,
	chpebeni@linux.microsoft.com, suredd@microsoft.com, balajib@microsoft.com
Subject: Re: [dm-devel] [RFC] IMA: New IMA measurements for dm-crypt and
	selinux
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAyMDIwLTA0LTA4IDk6MzQgYS5tLiwgQ2FzZXkgU2NoYXVmbGVyIHdyb3RlOgo+IE9uIDQv
OC8yMDIwIDM6MTkgQU0sIFR1c2hhciBTdWdhbmRoaSB3cm90ZToKPHNuaXA+Cj4+Cj4+IEIuIE1l
YXN1cmluZyBzZWxpbnV4IGNvbnN0cnVjdHM6Cj4+ICDCoMKgwqAgV2UgcHJvcG9zZSB0byBhZGQg
YW4gSU1BIGhvb2sgaW4gZW5mb3JjaW5nX3NldCgpIHByZXNlbnQgdW5kZXIKPj4gIMKgwqDCoCBz
ZWN1cml0eS9zZWxpbnV4L2luY2x1ZGUvc2VjdXJpdHkuaC4KPj4gIMKgwqDCoCBlbmZvcmNpbmdf
c2V0KCkgc2V0cyB0aGUgc2VsaW51eCBzdGF0ZSB0byBlbmZvcmNpbmcvcGVybWlzc2l2ZSBldGMu
Cj4+ICDCoMKgwqAgYW5kIGlzIGNhbGxlZCBmcm9tIGtleSBwbGFjZXMgbGlrZSBzZWxpbnV4X2lu
aXQoKSwKPj4gIMKgwqDCoCBzZWxfd3JpdGVfZW5mb3JjZSgpIGV0Yy4KPj4gIMKgwqDCoCBUaGUg
aG9vayB3aWxsIG1lYXN1cmUgdmFyaW91cyBhdHRyaWJ1dGVzIHJlbGF0ZWQgdG8gc2VsaW51eCBz
dGF0dXMuCj4+ICDCoMKgwqAgTWFqb3JpdHkgb2YgdGhlIGF0dHJpYnV0ZXMgYXJlIHByZXNlbnQg
aW4gdGhlIHN0cnVjdCBzZWxpbnV4X3N0YXRlCj4+ICDCoMKgwqAgcHJlc2VudCBpbiBzZWN1cml0
eS9zZWxpbnV4L2luY2x1ZGUvc2VjdXJpdHkuaAo+PiAgwqDCoMKgIGUuZy4KPj4gIMKgwqDCoCAk
c2VzdGF0dXMKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFTGludXggc3RhdHVzOsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGVuYWJsZWQKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFTGlu
dXhmcyBtb3VudDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgL3N5cy9mcy9zZWxpbnV4Cj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBTRUxpbnV4IHJvb3QgZGlyZWN0b3J5OsKgwqDCoMKgwqAgL2V0
Yy9zZWxpbnV4Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMb2FkZWQgcG9saWN5IG5hbWU6wqDC
oMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIEN1cnJlbnQg
bW9kZTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGVybWlzc2l2ZQo+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgTW9kZSBmcm9tIGNvbmZpZyBmaWxlOsKgwqDCoMKgwqDCoCBwZXJtaXNz
aXZlCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQb2xpY3kgTUxTIHN0YXR1czrCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlbmFibGVkCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQb2xpY3kgZGVueV91
bmtub3duIHN0YXR1czrCoCBhbGxvd2VkCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNZW1vcnkg
cHJvdGVjdGlvbiBjaGVja2luZzrCoCByZXF1ZXN0ZWQgKGluc2VjdXJlKQo+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgTWF4IGtlcm5lbCBwb2xpY3kgdmVyc2lvbjrCoMKgIDMyCj4+Cj4+ICDCoMKg
wqAgVGhlIGFib3ZlIGF0dHJpYnV0ZXMgd2lsbCBiZSBzZXJpYWxpemVkIGludG8gYSBzZXQgb2Yg
a2V5PXZhbHVlCj4+ICDCoMKgwqAgcGFpcnMgd2hlbiBwYXNzZWQgdG8gSU1BIGZvciBtZWFzdXJl
bWVudC4KPj4KPj4gIMKgwqDCoCBQcm9wb3NlZCBGdW5jdGlvbiBTaWduYXR1cmUgb2YgdGhlIElN
QSBob29rOgo+PiAgwqDCoMKgIHZvaWQgaW1hX3NlbGludXhfc3RhdHVzKHZvaWQgKnNlbGludXhf
c3RhdHVzLCBpbnQgbGVuKTsKPj4KPj4gUGxlYXNlIHByb3ZpZGUgY29tbWVudHNcZmVlZGJhY2sg
b24gdGhlIHByb3Bvc2FsLgo+IAo+IFRMO0RSIC0gV2h5IG1ha2UgdGhpcyBTRUxpbnV4IHNwZWNp
ZmljPwo+IAo+IEludGVncmF0aW5nIElNQSBhbmQgU0VMaW51eCBpcyBhIGxheWVyaW5nIHZpb2xh
dGlvbiBhdCBiZXN0Lgo+IFdoeSBpc24ndCB0aGlzIGltYV9sc21fc3RhdHVzKHZvaWQgKmxzbV9z
dGF0dXMsIGludCBsZW4pPwpUaGF0IHNlZW1zIGxpa2UgYSBnb29kIGlkZWEuCkkgd2lsbCBpbnZl
c3RpZ2F0ZSB3aGVyZSBjYW4gSSBwbGFjZSB0aGUgaG9vayBmb3IgTFNNLgpQbGVhc2UgbGV0IG1l
IGtub3cgaWYgeW91IGhhdmUgYW55IHJlY29tbWVuZGF0aW9ucy4KPiBPciwgYmV0dGVyIHlldCwg
aG93IGFib3V0IGltYV9sc21fc3RhdHVzKGNoYXIgKm5hbWUsIHZvaWQgKnZhbHVlLCBpbnQgbGVu
KSwKPiBhbmQgeW91IHBhc3MgZWFjaCBuYW1lL3ZhbHVlIHBhaXIgc2VwYXJhdGVseT8gVGhhdCBt
YWtlcyB0aGUKPiBpbnRlcmZhY2UgZ2VuZXJhbGx5IHVzZWZ1bC4KPiAKPiBCZWxpZXZlIGl0IG9y
IG5vdCwgdGhlcmUgKkFSRSogc2VjdXJpdHkgbW9kdWxlcyB0aGF0Cj4gYXJlIG5vdCBTRUxpbnV4
Lgo+IAo+Pgo+PiBUaGFua3MsCj4+IFR1c2hhcgo+Pgo+PiBbMV0gaHR0cHM6Ly9zb3VyY2Vmb3Jn
ZS5uZXQvcC9saW51eC1pbWEvd2lraS9Ib21lLwo+PiBbMl0gaHR0cHM6Ly9zZWxpbnV4cHJvamVj
dC5vcmcvcGFnZS9GQVEKPj4gWzNdIGh0dHBzOi8vZ2l0bGFiLmNvbS9jcnlwdHNldHVwL2NyeXB0
c2V0dXAvd2lraXMvRE1DcnlwdAoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEBy
ZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZl
bA==

