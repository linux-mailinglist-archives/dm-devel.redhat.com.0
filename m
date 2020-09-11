Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8442685CF
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:26:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-vDWeLwUYOmGACw6xyZTCBw-1; Mon, 14 Sep 2020 03:26:48 -0400
X-MC-Unique: vDWeLwUYOmGACw6xyZTCBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9C9E81CAF8;
	Mon, 14 Sep 2020 07:26:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8A607839F;
	Mon, 14 Sep 2020 07:26:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EAE61832FDB;
	Mon, 14 Sep 2020 07:26:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BGj63H018421 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 12:45:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADD42110E98; Fri, 11 Sep 2020 16:45:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8AF7110EA3
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:45:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C990C18AE956
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:45:03 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-591-Pl3wuZpKNG-LkU5DWczP2g-1;
	Fri, 11 Sep 2020 12:44:59 -0400
X-MC-Unique: Pl3wuZpKNG-LkU5DWczP2g-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 955D820716FC;
	Fri, 11 Sep 2020 09:44:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 955D820716FC
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
References: <20200828015704.6629-1-tusharsu@linux.microsoft.com>
	<20200828015704.6629-4-tusharsu@linux.microsoft.com>
	<f11dbfc1382e60c04fdd519ce5122239fa0cab8b.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <c932ae94-d7c3-5d23-2bb4-95517f712ceb@linux.microsoft.com>
Date: Fri, 11 Sep 2020 09:44:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f11dbfc1382e60c04fdd519ce5122239fa0cab8b.camel@linux.ibm.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08BGj63H018421
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 3/6] IMA: update
 process_buffer_measurement to measure buffer hash
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Content-Language: en-US

CgpPbiAyMDIwLTA4LTMxIDEwOjAyIGEubS4sIE1pbWkgWm9oYXIgd3JvdGU6Cj4gT24gVGh1LCAy
MDIwLTA4LTI3IGF0IDE4OjU3IC0wNzAwLCBUdXNoYXIgU3VnYW5kaGkgd3JvdGU6Cj4+IHByb2Nl
c3NfYnVmZmVyX21lYXN1cmVtZW50KCkgY3VycmVudGx5IG9ubHkgbWVhc3VyZXMgdGhlIGlucHV0
IGJ1ZmZlci4KPj4gV2hlbiB0aGUgYnVmZmVyIGJlaW5nIG1lYXN1cmVkIGlzIHRvbyBsYXJnZSwg
aXQgbWF5IHJlc3VsdCBpbiBibG9hdGVkCj4+IElNQSBsb2dzLgo+IAo+IFRoZSBzdWJqZWN0IG9m
ICB0aGlzIHNlbnRlbmNlIHJlZmVycyB0byBhbiBpbmRpdmlkdWFsIHJlY29yZCwgd2hpbGUKPiAi
YmxvYXRlZCIgcmVmZXJzIHRvIHRoZSBtZWFzdXJlbWVudCBsaXN0LiAgQSAiYmxvYXRlZCIgbWVh
c3VyZW1lbnQgbGlzdAo+IHdvdWxkIGNvbnRhaW4gdG9vIG1hbnkgb3IgdW5uZWNlc3NhcnkgcmVj
b3Jkcy4gIFlvdXIgY29uY2VybiBzZWVtcyB0bwo+IGJlIHdpdGggdGhlIHNpemUgb2YgdGhlIGlu
ZGl2aWR1YWwgcmVjb3JkLCBub3QgdGhlIG51bWJlciBvZgo+IG1lYXN1cmVtZW50IGxpc3QgZW50
cmllcy4KPiAKVGhlIGludGVudCBiZWhpbmQgdGhhdCBkZXNjcmlwdGlvbiB3YXMgdHdvZm9sZC4g
T25lLCBhcyB5b3UgbWVudGlvbmVkLAp0aGUgaW5kaXZpZHVhbCByZWNvcmQgc2l6ZSBiZWluZyBs
YXJnZTsgYW5kIHR3bywgbXVsdGlwbGUgbGFyZ2Utc2l6ZWQKaW5kaXZpZHVhbCByZWNvcmRzIHdp
bGwgZXZlbnR1YWxseSBibG9hdCB0aGUgbWVhc3VyZW1lbnQgbGlzdCB0b28uCgpJdCBjYW4gaGFw
cGVuIGluIFNlTGludXggY2FzZSBhcyB3ZSBkaXNjb3ZlcmVkLiBUaGUgU2VMaW51eCBwb2xpY3kK
KHdoaWNoIGNhbiBiZSBhIGZldyBNQnMpIGNhbiBjaGFuZ2UgZnJvbSAnZm9vJywgdG8gJ2Jhcics
IGJhY2sgdG8gJ2ZvbycuCkFuZCB0aGUgcmVxdWlyZW1lbnQgZnJvbSBTZUxpbnV4IGlzIHRoYXQg
J2Zvbycgc2hvdWxkIGJlIG1lYXN1cmVkIHRoZQpzZWNvbmQgdGltZSB0b28uIFdoZW4gJ2Zvbycg
YW5kICdiYXInIGFyZSBsYXJnZSwgdGhlIGluZGl2aWR1YWwgcmVjb3JkcwppbiB0aGUgaW1hIGxv
ZyB3aWxsIGJlIGxhcmdlLCB3aGljaCB3aWxsIGFsc28gcmVzdWx0IGluIG1lYXN1cmVtZW50IGxp
c3QKYmVpbmcgYmxvYXRlZC4KCkJ1dCBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuIHdpdGggdGhl
IGN1cnJlbnQgd29yZGluZy4gSSB3aWxsIHVwZGF0ZSAKdGhlIHBhdGNoIGRlc2NyaXB0aW9uIGFj
Y29yZGluZ2x5LgoKPiBNZWFzdXJpbmcgdGhlIGhhc2ggb2YgdGhlIGJ1ZmZlciBkYXRhIGlzIHNp
bWlsYXIgdG8gbWVhc3VyaW5nIHRoZSBmaWxlCj4gZGF0YS4gIEluIHRoZSBjYXNlIG9mIHRoZSBm
aWxlIGRhdGEsIGhvd2V2ZXIsIHRoZSBhdHRlc3RhdGlvbiBzZXJ2ZXIKPiBtYXkgcmVseSBvbiBh
IHdoaXRlIGxpc3QgbWFuaWZlc3QvREIgb3IgdGhlIGZpbGUgc2lnbmF0dXJlIHRvIHZlcmlmeQo+
IHRoZSBmaWxlIGRhdGEgaGFzaC4gIEZvciBidWZmZXIgbWVhc3VyZW1lbnRzLCBob3cgd2lsbCB0
aGUgYXR0ZXN0YXRpb24KPiBzZXJ2ZXIgYXNjZXJ0YWluIHdoYXQgaXMgYSB2YWxpZCBidWZmZXIg
aGFzaD8KVGhlIGNsaWVudCBhbmQgdGhlIHNlcnZlciBpbXBsZW1lbnRhdGlvbiB3aWxsIGdvIGhh
bmQgaW4gaGFuZC4gVGhlCmNsaWVudC9rZXJuZWwgd291bGQga25vdyB3aGF0IGRhdGEgaXMgbWVh
c3VyZWQgYXMtaXMKKGUuZy4gS0VYRUNfQ01ETElORSksIGFuZCB3aGF0IGRhdGEgaGFzIGl04oCZ
cyBoYXNoIG1lYXN1cmVkCihlLmcuIFNlTGludXggUG9saWN5KS4gQW5kIHRoZSBhdHRlc3RhdGlv
biBzZXJ2ZXIgd291bGQgdmVyaWZ5IGRhdGEvaGFzaAphY2NvcmRpbmdseS4KCkp1c3QgbGlrZSB0
aGUgZGF0YSBiZWluZyBtZWFzdXJlZCBpbiBvdGhlciBjYXNlcywgdGhlIGF0dGVzdGF0aW9uIHNl
cnZlciAKd2lsbCBrbm93IHdoYXQgYXJlIHBvc3NpYmxlIHZhbHVlcyBvZiB0aGUgbGFyZ2UgYnVm
ZmVycyBiZWluZyBtZWFzdXJlZC4gCkl0IHdpbGwgaGF2ZSB0byBtYWludGFpbiB0aGUgaGFzaCBv
ZiB0aG9zZSBidWZmZXIgdmFsdWVzLgo+IAo+IEhpbnQ6ICBJIGFzc3VtZSwgY29ycmVjdCBtZSBp
ZiBJJ20gd3JvbmcsIHRoZSBtZWFzdXJlbWVudCBsaXN0IHJlY29yZAo+IHRlbXBsYXRlIGRhdGEg
aXMgbm90IG1lYW50IHRvIGJlIHZlcmlmaWVkLCBidXQgdXNlZCB0byBkZXRlY3QgaWYgdGhlICJj
cml0aWNhbCBkYXRhIiBjaGFuZ2VkLgo+IApBcyBtZW50aW9uZWQgYWJvdmUsIHRoZSB1c2UgY2Fz
ZSBmb3IgdGhpcyBmZWF0dXJlIGlzIGluLW1lbW9yeSBsb2FkZWQgClNlTGludXggcG9saWN5LCB3
aGljaCBjYW4gYmUgcXVpdGUgbGFyZ2UgKHNldmVyYWwgTUJzKSDigJMgdGhhdCdzIHdoeSB0aGlz
IApmdW5jdGlvbmFsaXR5LiBUaGUgZGF0YSBpcyBtZWFudCB0byBiZSB2ZXJpZmllZCBieSB0aGUg
YXR0ZXN0YXRpb24gc2VydmVyLgoKPiBQbGVhc2UgdXBkYXRlIHRoZSBwYXRjaCBkZXNjcmlwdGlv
biBhY2NvcmRpbmdseS4KSSB3aWxsIHVwZGF0ZSB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gdG8gY2xh
cmlmeSBhbGwgdGhpcy4KPiAKPj4KPj4gSW50cm9kdWNlIGEgYm9vbGVhbiBwYXJhbWV0ZXIgbWVh
c3VyZV9idWZfaGFzaCB0byBzdXBwb3J0IG1lYXN1cmluZwo+PiBoYXNoIG9mIGEgYnVmZmVyLCB3
aGljaCB3b3VsZCBiZSBtdWNoIHNtYWxsZXIsIGluc3RlYWQgb2YgdGhlIGJ1ZmZlcgo+PiBpdHNl
bGYuCj4+IFNpZ25lZC1vZmYtYnk6IFR1c2hhciBTdWdhbmRoaSA8dHVzaGFyc3VAbGludXgubWlj
cm9zb2Z0LmNvbT4KPj4gLS0tCj4gCj4gPHNuaXA+Cj4gCj4+ICsrKyBiL3NlY3VyaXR5L2ludGVn
cml0eS9pbWEvaW1hX21haW4uYwo+PiBAQCAtNzMzLDE3ICs3MzMsMjEgQEAgaW50IGltYV9sb2Fk
X2RhdGEoZW51bSBrZXJuZWxfbG9hZF9kYXRhX2lkIGlkKQo+PiAgICAqIEBmdW5jOiBJTUEgaG9v
awo+PiAgICAqIEBwY3I6IHBjciB0byBleHRlbmQgdGhlIG1lYXN1cmVtZW50Cj4+ICAgICogQGZ1
bmNfZGF0YTogcHJpdmF0ZSBkYXRhIHNwZWNpZmljIHRvIEBmdW5jLCBjYW4gYmUgTlVMTC4KPj4g
KyAqIEBtZWFzdXJlX2J1Zl9oYXNoOiBpZiBzZXQgdG8gdHJ1ZSAtIHdpbGwgbWVhc3VyZSBoYXNo
IG9mIHRoZSBidWYsCj4+ICsgKiAgICAgICAgICAgICAgICAgICAgaW5zdGVhZCBvZiBidWYKPj4g
ICAgKgo+PiAgICAqIEJhc2VkIG9uIHBvbGljeSwgdGhlIGJ1ZmZlciBpcyBtZWFzdXJlZCBpbnRv
IHRoZSBpbWEgbG9nLgo+PiAgICAqLwo+PiAgIGludCBwcm9jZXNzX2J1ZmZlcl9tZWFzdXJlbWVu
dChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBjb25zdCB2b2lkICpidWYsIGludCBzaXplLAo+PiAgIAkJ
CSAgICAgICBjb25zdCBjaGFyICpldmVudG5hbWUsIGVudW0gaW1hX2hvb2tzIGZ1bmMsCj4+IC0J
CQkgICAgICAgaW50IHBjciwgY29uc3QgY2hhciAqZnVuY19kYXRhKQo+PiArCQkJICAgICAgIGlu
dCBwY3IsIGNvbnN0IGNoYXIgKmZ1bmNfZGF0YSwKPj4gKwkJCSAgICAgICBib29sIG1lYXN1cmVf
YnVmX2hhc2gpCj4+ICAgewo+PiAgIAlpbnQgcmV0ID0gMDsKPj4gICAJY29uc3QgY2hhciAqYXVk
aXRfY2F1c2UgPSAiRU5PTUVNIjsKPj4gICAJc3RydWN0IGltYV90ZW1wbGF0ZV9lbnRyeSAqZW50
cnkgPSBOVUxMOwo+PiAgIAlzdHJ1Y3QgaW50ZWdyaXR5X2lpbnRfY2FjaGUgaWludCA9IHt9Owo+
PiArCXN0cnVjdCBpbnRlZ3JpdHlfaWludF9jYWNoZSBkaWdlc3RfaWludCA9IHt9Owo+PiAgIAlz
dHJ1Y3QgaW1hX2V2ZW50X2RhdGEgZXZlbnRfZGF0YSA9IHsuaWludCA9ICZpaW50LAo+PiAgIAkJ
CQkJICAgIC5maWxlbmFtZSA9IGV2ZW50bmFtZSwKPj4gICAJCQkJCSAgICAuYnVmID0gYnVmLAo+
PiBAQCAtNzUyLDcgKzc1Niw3IEBAIGludCBwcm9jZXNzX2J1ZmZlcl9tZWFzdXJlbWVudChzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBjb25zdCB2b2lkICpidWYsIGludCBzaXplLAo+PiAgIAlzdHJ1Y3Qg
ewo+PiAgIAkJc3RydWN0IGltYV9kaWdlc3RfZGF0YSBoZHI7Cj4+ICAgCQljaGFyIGRpZ2VzdFtJ
TUFfTUFYX0RJR0VTVF9TSVpFXTsKPj4gLQl9IGhhc2ggPSB7fTsKPj4gKwl9IGhhc2ggPSB7fSwg
ZGlnZXN0X2hhc2ggPSB7fTsKPj4gICAJaW50IHZpb2xhdGlvbiA9IDA7Cj4+ICAgCWludCBhY3Rp
b24gPSAwOwo+PiAgIAl1MzIgc2VjaWQ7Cj4+IEBAIC04MDEsNiArODA1LDI0IEBAIGludCBwcm9j
ZXNzX2J1ZmZlcl9tZWFzdXJlbWVudChzdHJ1Y3QgaW5vZGUgKmlub2RlLCBjb25zdCB2b2lkICpi
dWYsIGludCBzaXplLAo+PiAgIAkJZ290byBvdXQ7Cj4+ICAgCX0KPj4gICAKPj4gKwlpZiAobWVh
c3VyZV9idWZfaGFzaCkgewo+PiArCQlkaWdlc3RfaWludC5pbWFfaGFzaCA9ICZkaWdlc3RfaGFz
aC5oZHI7Cj4+ICsJCWRpZ2VzdF9paW50LmltYV9oYXNoLT5hbGdvID0gaW1hX2hhc2hfYWxnbzsK
Pj4gKwkJZGlnZXN0X2lpbnQuaW1hX2hhc2gtPmxlbmd0aCA9IGhhc2hfZGlnZXN0X3NpemVbaW1h
X2hhc2hfYWxnb107Cj4+ICsKPj4gKwkJcmV0ID0gaW1hX2NhbGNfYnVmZmVyX2hhc2goaGFzaC5o
ZHIuZGlnZXN0LAo+PiArCQkJCQkgICBpaW50LmltYV9oYXNoLT5sZW5ndGgsCj4+ICsJCQkJCSAg
IGRpZ2VzdF9paW50LmltYV9oYXNoKTsKPj4gKwkJaWYgKHJldCA8IDApIHsKPj4gKwkJCWF1ZGl0
X2NhdXNlID0gImRpZ2VzdF9oYXNoaW5nX2Vycm9yIjsKPj4gKwkJCWdvdG8gb3V0Owo+PiArCQl9
Cj4+ICsKPj4gKwkJZXZlbnRfZGF0YS5paW50ID0gJmRpZ2VzdF9paW50Owo+PiArCQlldmVudF9k
YXRhLmJ1ZiA9IGhhc2guaGRyLmRpZ2VzdDsKPj4gKwkJZXZlbnRfZGF0YS5idWZfbGVuID0gaWlu
dC5pbWFfaGFzaC0+bGVuZ3RoOwo+PiArCX0KPj4gKwo+IAo+IFRoZXJlIHNlZW1zIHRvIGJlIHNv
bWUgY29kZSBhbmQgdmFyaWFibGUgZHVwbGljYXRpb24gYnkgZG9pbmcgaXQgdGhpcwo+IHdheS4g
IENvcHlpbmcgdGhlIGNhbHVjbGF0ZWQgYnVmZmVyIGRhdGEgaGFzaCB0byBhIHRlbXBvcmFyeSBi
dWZmZXIKPiBtaWdodCBlbGltaW5hdGUgaXQuCj4gCldpdGggdGhlIHdheSBpbWFfY2FsY19idWZm
ZXJfaGFzaCgpIGlzIGltcGxlbWVudGVkLCBJIHdhcyBjb252aW5jZWQgdGhhdAp0aGUgdmFyaWFi
bGUgZHVwbGljYXRpb24gd2FzIG5lZWRlZC4gSSBkaWRuJ3Qgd2FudCB0byB3cml0ZSBhIGhlbHBl
ciAKZnVuY3Rpb24gaW4gb3JkZXIgdG8gbWluaW1pemUgdGhlIHVubmVjZXNzYXJ5IGNvZGUgY2h1
cm4gaW4gcF9iX20oKS4KQnV0IEkgd2lsbCByZXZpc2l0IHRoaXMgdG8gc2VlIGhvdyBJIGNhbiBy
ZWR1Y2UgdGhlIGNvZGUgYW5kIHZhcmlhYmxlIApkdXBsaWNhdGlvbi4KClRoYW5rcyBmb3IgdGhl
IGZlZWRiYWNrLgo+PiAgIAlyZXQgPSBpbWFfYWxsb2NfaW5pdF90ZW1wbGF0ZSgmZXZlbnRfZGF0
YSwgJmVudHJ5LCB0ZW1wbGF0ZSk7Cj4+ICAgCWlmIChyZXQgPCAwKSB7Cj4+ICAgCQlhdWRpdF9j
YXVzZSA9ICJhbGxvY19lbnRyeSI7CgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVs
QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRl
dmVs

