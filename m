Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 622ECF10F0
	for <lists+dm-devel@lfdr.de>; Wed,  6 Nov 2019 09:20:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573028439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vceJkTZMM/3bqB26UMuRDksbqeYKNjIFimA3+7AJfMU=;
	b=VMgsm7qz8ipu1TwB0R8YUR6WEaqf57zZ5U4Gwd2U2x0di1w3K09iI9/lse+YpGsebOT1O4
	n5ZA+JO9vOxCHeFsffLqVcPSOtRPJMmC09ig9dzhceDUvPDJ/YoZFihxjA/P4/LCLAZQCb
	lk06mBEbuXxiaeiLv6JoUojpkca9rU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-vNEVkZL-Pde0gmjJX6XLAw-1; Wed, 06 Nov 2019 03:20:36 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AB642B4;
	Wed,  6 Nov 2019 08:20:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFE1460CC0;
	Wed,  6 Nov 2019 08:20:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 288FC18089CD;
	Wed,  6 Nov 2019 08:20:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA5LJm2f002504 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 Nov 2019 16:19:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EE499608B7; Tue,  5 Nov 2019 21:19:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F93608B5
	for <dm-devel@redhat.com>; Tue,  5 Nov 2019 21:19:46 +0000 (UTC)
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
	[192.185.144.218])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91D863083394
	for <dm-devel@redhat.com>; Tue,  5 Nov 2019 21:19:45 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
	by gateway31.websitewelcome.com (Postfix) with ESMTP id 506EC4C200
	for <dm-devel@redhat.com>; Tue,  5 Nov 2019 15:19:45 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id S6Eri8vloW4frS6EricGxs; Tue, 05 Nov 2019 15:19:45 -0600
X-Authority-Reason: nr=8
Received: from [196.157.86.137] (port=16624 helo=[192.168.100.138])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1iS6Eq-000OQ3-A0; Tue, 05 Nov 2019 14:19:44 -0700
From: Maged Mokhtar <mmokhtar@petasan.org>
To: mpatocka@redhat.com
References: <fa95f1f0-67d6-d02e-6999-ba1f90d70fe2@petasan.org>
Message-ID: <8388b99a-a531-981e-9e36-8aeb3dffd18e@petasan.org>
Date: Tue, 5 Nov 2019 23:19:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <fa95f1f0-67d6-d02e-6999-ba1f90d70fe2@petasan.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.157.86.137
X-Source-L: No
X-Exim-ID: 1iS6Eq-000OQ3-A0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.138]) [196.157.86.137]:16624
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 3
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Tue, 05 Nov 2019 21:19:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Tue, 05 Nov 2019 21:19:45 +0000 (UTC) for IP:'192.185.144.218'
	DOMAIN:'gateway31.websitewelcome.com'
	HELO:'gateway31.websitewelcome.com' FROM:'mmokhtar@petasan.org'
	RCPT:''
X-RedHat-Spam-Score: 0.551  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_NEUTRAL) 192.185.144.218 gateway31.websitewelcome.com
	192.185.144.218 gateway31.websitewelcome.com
	<mmokhtar@petasan.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 06 Nov 2019 03:19:57 -0500
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-writecache: change config parameters
 using messages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: vNEVkZL-Pde0gmjJX6XLAw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

R2VudGxlIHBpbmcgcGxlYXNlLgoKSXQgY291bGQgYWRkIGZsZXhpYmlsaXR5IGluIGNoYW5naW5n
IGNhY2hlIHBhcmFtZXRlcnMgYWZ0ZXIgZGV2aWNlIGNyZWF0aW9uLgoKT24gMjIvMDkvMjAxOSAy
MTozOSwgTWFnZWQgTW9raHRhciB3cm90ZToKPiBTdXBwb3J0IGNoYW5naW5nIGNvbmZpZ3VyYXRp
b24gcGFyYW1ldGVycyB1c2luZyBkZXZpY2UtbWFwcGVyIG1lc3NhZ2VzCj4gRS5nLgo+IMKgwqAg
ZG1zZXR1cCBtZXNzYWdlIHZnMS9sdjEgMCBoaWdoX3dhdGVybWFyayA2MAo+Cj4gU2lnbmVkLW9m
Zi1ieTogTWFnZWQgTW9raHRhciA8bW1va2h0YXJAcGV0YXNhbi5vcmc+Cj4gLS0tCj4gwqBkcml2
ZXJzL21kL2RtLXdyaXRlY2FjaGUuYyB8wqDCoCA2OCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPgo+IC0tLSBh
L2RyaXZlcnMvbWQvZG0td3JpdGVjYWNoZS5jwqDCoMKgIDIwMTktMDgtMjUgMTY6MTM6NTQuMDAw
MDAwMDAwICswMjAwCj4gKysrIGIvZHJpdmVycy9tZC9kbS13cml0ZWNhY2hlLmPCoMKgwqAgMjAx
OS0wOS0yMSAxNjoyMjoyMy4wMDAwMDAwMDAgKzAyMDAKPiBAQCAtMTAwOSw2ICsxMDA5LDY5IEBA
IHN0YXRpYyBpbnQgcHJvY2Vzc19mbHVzaF9vbl9zdXNwZW5kX21lc2cKPiDCoMKgwqDCoCByZXR1
cm4gMDsKPiDCoH0KPgo+ICtzdGF0aWMgaW50IHNldF9jb25maWdfdmFsdWUoc3RydWN0IGRtX3dy
aXRlY2FjaGUgKndjLCBjaGFyICprZXksIGNoYXIgCj4gKnZhbCkKPiArewo+ICvCoMKgwqAgdW5z
aWduZWQgdix4Owo+ICvCoMKgwqAgaWYgKHNzY2FuZih2YWwsICIldSIsICZ2KSAhPSAxKQo+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiArwqDCoMKgIGlmICghc3RyY2FzZWNtcChr
ZXksICJoaWdoX3dhdGVybWFyayIpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgIGlmICh2IDwgMCB8fCB2
ID4gMTAwKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ICvCoMKg
wqDCoMKgwqDCoCB3Y19sb2NrKHdjKTsKPiArwqDCoMKgwqDCoMKgwqAgeCA9ICh1aW50NjRfdCl3
Yy0+bl9ibG9ja3MgKiAoMTAwIC0gdik7Cj4gK8KgwqDCoMKgwqDCoMKgIHggKz0gNTA7Cj4gK8Kg
wqDCoMKgwqDCoMKgIGRvX2Rpdih4LCAxMDApOwo+ICvCoMKgwqDCoMKgwqDCoCBpZiAod2MtPmZy
ZWVsaXN0X2xvd193YXRlcm1hcmsgPCB4KSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2Nf
dW5sb2NrKHdjKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiAr
wqDCoMKgwqDCoMKgwqAgfQo+ICvCoMKgwqDCoMKgwqDCoCB3Yy0+ZnJlZWxpc3RfaGlnaF93YXRl
cm1hcmsgPSB4Owo+ICvCoMKgwqDCoMKgwqDCoCB3Yy0+aGlnaF93bV9wZXJjZW50X3NldCA9IHRy
dWU7Cj4gK8KgwqDCoMKgwqDCoMKgIGlmICh3Yy0+ZnJlZWxpc3Rfc2l6ZSArIHdjLT53cml0ZWJh
Y2tfc2l6ZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDw9IHdjLT5mcmVlbGlzdF9oaWdoX3dh
dGVybWFyaykKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBxdWV1ZV93b3JrKHdjLT53cml0ZWJh
Y2tfd3EsICZ3Yy0+d3JpdGViYWNrX3dvcmspOwo+ICvCoMKgwqDCoMKgwqDCoCB3Y191bmxvY2so
d2MpOwo+ICvCoMKgwqAgfQo+ICvCoMKgwqAgZWxzZSBpZiAoIXN0cmNhc2VjbXAoa2V5LCAibG93
X3dhdGVybWFyayIpKSB7Cj4gK8KgwqDCoMKgwqDCoMKgIGlmICh2IDwgMCB8fCB2ID4gMTAwKQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ICvCoMKgwqDCoMKgwqDC
oCB3Y19sb2NrKHdjKTsKPiArwqDCoMKgwqDCoMKgwqAgeCA9ICh1aW50NjRfdCl3Yy0+bl9ibG9j
a3MgKiAoMTAwIC0gdik7Cj4gK8KgwqDCoMKgwqDCoMKgIHggKz0gNTA7Cj4gK8KgwqDCoMKgwqDC
oMKgIGRvX2Rpdih4LCAxMDApOwo+ICvCoMKgwqDCoMKgwqDCoCBpZiAoeCA8IHdjLT5mcmVlbGlz
dF9oaWdoX3dhdGVybWFyaykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdjX3VubG9jayh3
Yyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gK8KgwqDCoMKg
wqDCoMKgIH0KPiArwqDCoMKgwqDCoMKgwqAgd2MtPmZyZWVsaXN0X2xvd193YXRlcm1hcmsgPSB4
Owo+ICvCoMKgwqDCoMKgwqDCoCB3Yy0+bG93X3dtX3BlcmNlbnRfc2V0ID0gdHJ1ZTsKPiArwqDC
oMKgwqDCoMKgwqAgd2NfdW5sb2NrKHdjKTsKPiArwqDCoMKgIH0KPiArwqDCoMKgIGVsc2UgaWYg
KCFzdHJjYXNlY21wKGtleSwgIndyaXRlYmFja19qb2JzIikpIHsKPiArwqDCoMKgwqDCoMKgwqAg
d2NfbG9jayh3Yyk7Cj4gK8KgwqDCoMKgwqDCoMKgIHdjLT5tYXhfd3JpdGViYWNrX2pvYnMgPSB2
Owo+ICvCoMKgwqDCoMKgwqDCoCB3Yy0+bWF4X3dyaXRlYmFja19qb2JzX3NldCA9IHRydWU7Cj4g
K8KgwqDCoMKgwqDCoMKgIHdjX3VubG9jayh3Yyk7Cj4gK8KgwqDCoCB9Cj4gK8KgwqDCoCBlbHNl
IGlmICghc3RyY2FzZWNtcChrZXksICJhdXRvY29tbWl0X2Jsb2NrcyIpKSB7Cj4gK8KgwqDCoMKg
wqDCoMKgIHdjX2xvY2sod2MpOwo+ICvCoMKgwqDCoMKgwqDCoCB3Yy0+YXV0b2NvbW1pdF9ibG9j
a3MgPSB2Owo+ICvCoMKgwqDCoMKgwqDCoCB3Yy0+YXV0b2NvbW1pdF9ibG9ja3Nfc2V0ID0gdHJ1
ZTsKPiArwqDCoMKgwqDCoMKgwqAgd2NfdW5sb2NrKHdjKTsKPiArwqDCoMKgIH0KPiArwqDCoMKg
IGVsc2UgaWYgKCFzdHJjYXNlY21wKGtleSwgImF1dG9jb21taXRfdGltZSIpKSB7Cj4gK8KgwqDC
oMKgwqDCoMKgIGlmICh2IDwgMSB8fCB2ID4gMzYwMDAwMCkKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVJTlZBTDsKPiArwqDCoMKgwqDCoMKgwqAgd2NfbG9jayh3Yyk7Cj4gK8Kg
wqDCoMKgwqDCoMKgIHdjLT5hdXRvY29tbWl0X2ppZmZpZXMgPSBtc2Vjc190b19qaWZmaWVzKHYp
Owo+ICvCoMKgwqDCoMKgwqDCoCB3Yy0+YXV0b2NvbW1pdF90aW1lX3NldCA9IHRydWU7Cj4gK8Kg
wqDCoMKgwqDCoMKgIHdjX3VubG9jayh3Yyk7Cj4gK8KgwqDCoCB9Cj4gK8KgwqDCoCBlbHNlCj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ICvCoMKgwqAgcmV0dXJuIDA7Cj4gK30K
PiArCj4gwqBzdGF0aWMgaW50IHdyaXRlY2FjaGVfbWVzc2FnZShzdHJ1Y3QgZG1fdGFyZ2V0ICp0
aSwgdW5zaWduZWQgYXJnYywgCj4gY2hhciAqKmFyZ3YsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNoYXIgKnJlc3VsdCwgdW5zaWduZWQgbWF4bGVuKQo+IMKgewo+IEBA
IC0xMDE5LDYgKzEwODIsMTEgQEAgc3RhdGljIGludCB3cml0ZWNhY2hlX21lc3NhZ2Uoc3RydWN0
IGRtXwo+IMKgwqDCoMKgwqDCoMKgwqAgciA9IHByb2Nlc3NfZmx1c2hfbWVzZyhhcmdjLCBhcmd2
LCB3Yyk7Cj4gwqDCoMKgwqAgZWxzZSBpZiAoIXN0cmNhc2VjbXAoYXJndlswXSwgImZsdXNoX29u
X3N1c3BlbmQiKSkKPiDCoMKgwqDCoMKgwqDCoMKgIHIgPSBwcm9jZXNzX2ZsdXNoX29uX3N1c3Bl
bmRfbWVzZyhhcmdjLCBhcmd2LCB3Yyk7Cj4gK8KgwqDCoCBlbHNlIGlmIChhcmdjPT0yKSB7Cj4g
K8KgwqDCoMKgwqDCoMKgIHIgPSBzZXRfY29uZmlnX3ZhbHVlKHdjLCBhcmd2WzBdLCBhcmd2WzFd
KTsKPiArwqDCoMKgwqDCoMKgwqAgaWYgKHI9PS1FSU5WQUwpCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgRE1FUlIoImludmFsaWQgbWVzc2FnZSByZWNlaXZlZDogJXMgJXMiLCBhcmd2WzBdLCBh
cmd2WzFdKTsKPiArwqDCoMKgIH0KPiDCoMKgwqDCoCBlbHNlCj4gwqDCoMKgwqDCoMKgwqDCoCBE
TUVSUigidW5yZWNvZ25pc2VkIG1lc3NhZ2UgcmVjZWl2ZWQ6ICVzIiwgYXJndlswXSk7Cj4KCi0t
CmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

