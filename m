Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9634495CBB
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jan 2022 10:21:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-MpN13b4KOxKmTfXELACoSg-1; Fri, 21 Jan 2022 04:21:27 -0500
X-MC-Unique: MpN13b4KOxKmTfXELACoSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 262228144E0;
	Fri, 21 Jan 2022 09:21:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 342A0795A1;
	Fri, 21 Jan 2022 09:21:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B589B4BB7C;
	Fri, 21 Jan 2022 09:20:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20L9KWkK027013 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jan 2022 04:20:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A81C940FF69F; Fri, 21 Jan 2022 09:20:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3CB240FF690
	for <dm-devel@redhat.com>; Fri, 21 Jan 2022 09:20:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86FD585A5A8
	for <dm-devel@redhat.com>; Fri, 21 Jan 2022 09:20:32 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-446-h5gD9K4mPa2X0b8ULzsm8A-1; Fri, 21 Jan 2022 04:20:30 -0500
X-MC-Unique: h5gD9K4mPa2X0b8ULzsm8A-1
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx005
	[212.227.17.184]) with ESMTPSA (Nemesis) id 1MysVs-1mNwOf0wKI-00w0dS;
	Fri, 21 Jan 2022 10:20:27 +0100
Message-ID: <cc736093-b027-e693-aa8c-bbbd001db3f3@gmx.com>
Date: Fri, 21 Jan 2022 17:20:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.5.0
To: Anand Jain <anand.jain@oracle.com>, Qu Wenruo <wqu@suse.com>,
	linux-btrfs@vger.kernel.org, dm-devel@redhat.com
References: <20220121052445.37692-1-wqu@suse.com>
	<36302c35-1b99-9e16-da6d-ebb33bb797d3@oracle.com>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
In-Reply-To: <36302c35-1b99-9e16-da6d-ebb33bb797d3@oracle.com>
X-Provags-ID: V03:K1:vZy+T4b0Dy6QuejMCHyjhptjFZPNhIWXCH40bXc86Knpk2Cmv+8
	O+qi7fQIWMY37vZ9HGpZKSizD99az60/rQYpi7Medqy9u7zxHRWJz9Lq6iPF8mEWuv1w3OB
	XhuPgnagrNKQ1TJ7TGTiWyLMgzkVFMtkd3YwPjXpvTCOWTEIwwYZPm1N2wwHgbWcTooIbiZ
	zC9zETVzwbj3KXI14TyzA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9D4Ubk7FrY4=:K1LvTcGB4Q7Kaca8St9SK0
	gpdOW1hQCJC4LxdYQLVnAjQC7vy+FjCrDtwAfpREu6FKj7lXvM2R4z5eB/60yhld9gw5YqIyJ
	ipFiDJM4W1sma0P8HAoXu/oR4CZMVDLbWC6zD9z5oan5Sa2cAJe8GtY26XMInK96jxwt1VQmy
	IzRdfdZjKIxWXph/36Elv5Up1VsYxeOQWwEoRLTeQmzZpdEcSxLk4OdxmtNsyUiGmEW6B1Bgz
	MQ58RQKCzCUbLmzUIvxMuKsTgDFBDJOt0EJnlG9yTqLCFGFC2jTAg06XJY7ggc5fABFMabrup
	mEmTTzrkKAXCdM7rR65IvY8lbNO3slEw9ayMx4J6J8BX7DjXSJAFPVuOWkVq3QlZQSk3ZBJFw
	YuDRZ9X1xPOMF/sgB7SDmQBckj+znqUW305gXaFhnsjQQ8R3dil+dR4EkD812FaE/V3SqxOfC
	NXrZgIk4HCZ+Xd2EWNKHY8z0tzEjuFrfmMHpSsCD2YJgFlL8AI5Db81nH63SPxWjzLiMG2Tfg
	zuwtjIxdMfdGnimyxETWyDcKMCPqms9jTMZn8ntvVSW+hNFpNJYohl2AtdPEpIi+LhauPlvP5
	LleHpT3VGv4Lf39md3Di/XfL+OO2HMjtPW8uYxjrXSiGbNV/f0KkwusOw+dywi2v9iS8YtrAR
	uSoGPPjrlnQUO566N/RDlIsXmbDYrQXejwOrNK6h+n8nPUzFApFBkLnroKTdHvZeCvt9Rjglu
	Dl7fjwHhGtbPbyx0rve6RKg2a4LFhNsH3XRm3mpNyLgN0HKctc7XdrBHZUrO9c5omxy6Oj0xZ
	b9q9GpSnFi/k5yX6SJM7lo1AkTtK0IO8RtRyWRn+n1Ap6LUdszrgNcfEgmxQ7ec2U4KJaPhMq
	Ks3Z29YiwDO/BLn2gJHPe3pED52NuQmITL1uBanf1Rp/Y3V6yfySY9GTN3UB3V/0FVPxveree
	WHAP4WoUcFQNQHE8CCxySylF76jRGQ0qO7TIm2UmCIlutYLHuczmae9LCT1MPr0i1qCzISdrS
	j/lM2KzUxJrN4kEI9MdFXaWiI1BAGrTsLQv/Mmn1vwJefq9FJBHs0tQ5DIkoIV7/Phzeolzzv
	W8+w5SLAWPKxnw=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20L9KWkK027013
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH RFC] btrfs: sysfs: add
 <uuid>/debug/io_accounting/ directory
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgpPbiAyMDIyLzEvMjEgMTc6MTQsIEFuYW5kIEphaW4gd3JvdGU6Cj4gT24gMjEvMDEvMjAyMiAx
MzoyNCwgUXUgV2VucnVvIHdyb3RlOgo+PiBbQkFDS0dST1VORF0KPj4gVGhlcmUgaXMgYSBzZXJp
ZXMgb2YgYnRyZnMgYXV0b2RlZnJhZyBidWdzIGluIHY1LjE2LCB0aGF0IHdvdWxkIGNhdXNlCj4+
IHdheSBtb3JlIElPIHRoYW4gcHJldmlvdXMga2VybmVscy4KPj4KPj4gVW5mb3J0dW5hdGVseSB0
aGVyZSBpc24ndCBhbnkgdGVzdCBjYXNlIGNvdmVyaW5nIGF1dG9kZWZyYWcsIG5vciB0aGVyZQo+
PiBpcyBhbnl3YXkgdG8gc2hvdyB0aGUgaW8gYWNjb3VudGluZyBvZiBhIGJ0cmZzLgo+Pgo+PiBb
V09SS0FST1VORF0KPj4gSSBvcmlnaW5hbGx5IHdhbnQgdG8gaW1wbGVtZW50IGEgZG0gdGFyZ2V0
IHRvIGRvIHRoZSBpbyBhY2NvdW50aW5nIGZvcgo+PiBhbGwgZmlsZXN5c3RlbXMsIGJ1dCBjYW4g
bm90IGZpbmQgYSBnb29kIGVub3VnaCBpbnRlcmZhY2UgKHRoZSBzdGF0dXMKPj4gaW50ZXJmYWNl
IGhhcyBvbmx5IDMgcHJlLWRlZmluZWQgd29ya2xvYWQpLgo+Pgo+PiBUaHVzIEkgdHVybmVkIHRv
IGJ0cmZzIHNwZWNpZmljIGlvIGFjY291bnRpbmcgZmlyc3QuCj4+IE9uZSB0aGluZyBzcGVjaWZp
YyB0byBidHJmcyBpcyBpdHMgaW50ZWdyYXRlZCB2b2x1bWUgbWFuYWdlbWVudC9SQUlELgo+Pgo+
PiBXaXRob3V0IHByb3BlciBwcm9maWxlcyBzcGVjaWZpY2F0aW9uLCBkZWZhdWx0IHByb2ZpbGUg
d2lsbCBjYXVzZQo+PiBtZXRhZGF0YSBJTyB0byBiZSBhY2NvdW50ZWQgdHdpY2UgKERVUCBwcm9m
aWxlKSBhbmQgb25seSBkYXRhIElPIGlzCj4+IGFjY291bnRlZCBjb3JyZWN0bHkuCj4+Cj4+IFNv
IGZvciBidHJmcyB0aGlzIHBhdGNoIHdpbGwgaW50cm9kdWNlIGEgbmV3IHN5c2ZzIGRpcmVjdG9y
eSBpbgo+PiAvc3lzL2ZzL2J0cmZzLzx1dWlkPi9kZWJ1Zy9pb19hY2NvdW50aW5nLwo+Pgo+PiBB
bmQgaGF2ZSB0aGUgZm9sbG93aW5nIGZpbGVzOgo+Pgo+PiAtIG1ldGFfcmVhZDrCoMKgwqAgTWV0
YWRhdGEgYnl0ZXMgcmVhZAo+PiAtIG1ldGFfd3JpdGU6wqDCoMKgIE1ldGFkYXRhIGJ5dGVzIHdy
aXR0ZW4KPj4gLSBkYXRhX3JlYWQ6wqDCoMKgIERhdGEgYnl0ZXMgcmVhZAo+PiAtIGRhdGFfd3Jp
dGU6wqDCoMKgIERhdGEgYnl0ZXMgd3JpdHRlbgo+PiDCoMKgwqDCoMKgwqDCoCAoaW5jbHVkaW5n
IGJvdGggem9uZWQgYXBwZW5kIGFuZCByZWd1bGFyIHdyaXRlKQo+Pgo+PiBBbmQgYWxsIHRoZXNl
IGFjY291bnRpbmcgaXMgaW4gbG9naWNhbCBhZGRyZXNzIHNwYWNlLCBtZWFuaW5nIHByb2ZpbGUK
Pj4gd2lsbCBub3QgYWZmZWN0IHRoZSB2YWx1ZXMuCj4+Cj4+IEFsbCB0aG9zZSB2YWx1ZXMgY2Fu
IGJlIHJlc2V0IGJ5IHNpbXBseSAiZWNobyAwIi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUXUgV2Vu
cnVvIDx3cXVAc3VzZS5jb20+Cj4+IC0tLQo+PiBSZWFzb24gZm9yIFJGQzoKPj4KPj4gLSAoVG8g
RE0gZ3V5cykgSXMgdGhlcmUgYW55IGdvb2Qgd2F5IHRvIGltcGxlbWVudCBhIGRtIHRhcmdldCB0
byBkbyAKPj4gdGhlIElPCj4+IMKgwqAgYWNjb3VudGluZz8KPj4gwqDCoCBBIG1vcmUgZ2VuZXJp
YyBvbmUgY2FuIGhlbHAgbW9yZSBmaWxlc3lzdGVtcy4KPj4KPj4gLSAoVG8gQnRyZnMgZ3V5cykg
SXMgdGhlIHN5c2ZzIGludGVyZmFjZSBmaW5lPwo+IAo+ICDCoEkgYW0gaW4gZm9yIGl0LiBJdCBj
YW4gYmUgYSBub24gZGVidWcgZmVhdHVyZSBJTU8uCj4gIMKgTW9yZSBiZWxvdy4KPiAKPj4gLS0t
Cj4+IMKgIGZzL2J0cmZzL2N0cmVlLmjCoMKgIHwgMTEgKysrKysrKwo+PiDCoCBmcy9idHJmcy9k
aXNrLWlvLmMgfMKgIDEgKwo+PiDCoCBmcy9idHJmcy9zeXNmcy5jwqDCoCB8IDc3ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAgZnMvYnRyZnMvdm9s
dW1lcy5jIHwgMjQgKysrKysrKysrKysrKysrCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMTEzIGlu
c2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2J0cmZzL2N0cmVlLmggYi9mcy9idHJm
cy9jdHJlZS5oCj4+IGluZGV4IGI0YTliMWM1OGQyMi4uMzk4M2JjZWFlZjdmIDEwMDY0NAo+PiAt
LS0gYS9mcy9idHJmcy9jdHJlZS5oCj4+ICsrKyBiL2ZzL2J0cmZzL2N0cmVlLmgKPj4gQEAgLTEw
MzUsMTAgKzEwMzUsMjEgQEAgc3RydWN0IGJ0cmZzX2ZzX2luZm8gewo+PiDCoCAjaWZkZWYgQ09O
RklHX0JUUkZTX0RFQlVHCj4+IMKgwqDCoMKgwqAgc3RydWN0IGtvYmplY3QgKmRlYnVnX2tvYmo7
Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGtvYmplY3QgKmRpc2NhcmRfZGVidWdfa29iajsKPj4gK8Kg
wqDCoCBzdHJ1Y3Qga29iamVjdCAqaW9fYWNjb3VudGluZ19kZWJ1Z19rb2JqOwo+PiDCoMKgwqDC
oMKgIHN0cnVjdCBsaXN0X2hlYWQgYWxsb2NhdGVkX3Jvb3RzOwo+PiDCoMKgwqDCoMKgIHNwaW5s
b2NrX3QgZWJfbGVha19sb2NrOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBsaXN0X2hlYWQgYWxsb2Nh
dGVkX2ViczsKPj4gKwo+PiArwqDCoMKgIHNwaW5sb2NrX3QgaW9fYWNjb3VudGluZ19sb2NrOwo+
PiArwqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAqIFRoZSBJTyBhY2NvdW50aW5nIHVuaXQgYXJlIGFs
bCBpbiBieXRlLCBhbmQgYXJlIGluIGxvZ2ljYWwgCj4+IGFkZHJlc3MKPj4gK8KgwqDCoMKgICog
c3BhY2UsIHdoaWNoIGlzIGJlZm9yZSB0aGUgUkFJRC9EVVAgbWFwcGluZy4KPj4gK8KgwqDCoMKg
ICovCj4+ICvCoMKgwqAgdTY0IG1ldGFfcmVhZDsKPj4gK8KgwqDCoCB1NjQgbWV0YV93cml0ZTsK
Pj4gK8KgwqDCoCB1NjQgZGF0YV9yZWFkOwo+PiArwqDCoMKgIHU2NCBkYXRhX3dyaXRlOwo+PiDC
oCAjZW5kaWYKPj4gwqAgfTsKPj4gZGlmZiAtLWdpdCBhL2ZzL2J0cmZzL2Rpc2staW8uYyBiL2Zz
L2J0cmZzL2Rpc2staW8uYwo+PiBpbmRleCA4N2E1YWRkYmVkZjYuLjQxYjU2ZmRlNmU5NyAxMDA2
NDQKPj4gLS0tIGEvZnMvYnRyZnMvZGlzay1pby5jCj4+ICsrKyBiL2ZzL2J0cmZzL2Rpc2staW8u
Ywo+PiBAQCAtMzA2NSw2ICszMDY1LDcgQEAgdm9pZCBidHJmc19pbml0X2ZzX2luZm8oc3RydWN0
IGJ0cmZzX2ZzX2luZm8gCj4+ICpmc19pbmZvKQo+PiDCoMKgwqDCoMKgIElOSVRfTElTVF9IRUFE
KCZmc19pbmZvLT5hbGxvY2F0ZWRfcm9vdHMpOwo+PiDCoMKgwqDCoMKgIElOSVRfTElTVF9IRUFE
KCZmc19pbmZvLT5hbGxvY2F0ZWRfZWJzKTsKPj4gwqDCoMKgwqDCoCBzcGluX2xvY2tfaW5pdCgm
ZnNfaW5mby0+ZWJfbGVha19sb2NrKTsKPj4gK8KgwqDCoCBzcGluX2xvY2tfaW5pdCgmZnNfaW5m
by0+aW9fYWNjb3VudGluZ19sb2NrKTsKPj4gwqAgI2VuZGlmCj4+IMKgwqDCoMKgwqAgZXh0ZW50
X21hcF90cmVlX2luaXQoJmZzX2luZm8tPm1hcHBpbmdfdHJlZSk7Cj4+IMKgwqDCoMKgwqAgYnRy
ZnNfaW5pdF9ibG9ja19yc3YoJmZzX2luZm8tPmdsb2JhbF9ibG9ja19yc3YsCj4+IGRpZmYgLS1n
aXQgYS9mcy9idHJmcy9zeXNmcy5jIGIvZnMvYnRyZnMvc3lzZnMuYwo+PiBpbmRleCBiZWI3Zjcy
ZDUwYjguLmRmZGVmOTNiZGVhYiAxMDA2NDQKPj4gLS0tIGEvZnMvYnRyZnMvc3lzZnMuYwo+PiAr
KysgYi9mcy9idHJmcy9zeXNmcy5jCj4+IEBAIC00MCw2ICs0MCw3IEBACj4+IMKgwqAgKiBidHJm
c19kZWJ1Z19mZWF0dXJlX2F0dHJzwqDCoMKgwqDCoMKgwqAgL3N5cy9mcy9idHJmcy9kZWJ1Zwo+
PiDCoMKgICogYnRyZnNfZGVidWdfbW91bnRfYXR0cnPCoMKgwqDCoMKgwqDCoCAvc3lzL2ZzL2J0
cmZzLzx1dWlkPi9kZWJ1Zwo+PiDCoMKgICogZGlzY2FyZF9kZWJ1Z19hdHRyc8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgL3N5cy9mcy9idHJmcy88dXVpZD4vZGVidWcvZGlzY2FyZAo+PiArICogaW9f
YWNjb3VudGluZ19kZWJ1Z19hdHRycyAgICAgICAgCj4+IC9zeXMvZnMvYnRyZnMvPHV1aWQ+L2Rl
YnVnL2lvX2FjY291bnRpbmcKPj4gwqDCoCAqLwo+PiDCoCBzdHJ1Y3QgYnRyZnNfZmVhdHVyZV9h
dHRyIHsKPj4gQEAgLTYxNiw2ICs2MTcsNjIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1
dGVfZ3JvdXAgCj4+IGJ0cmZzX2RlYnVnX2ZlYXR1cmVfYXR0cl9ncm91cCA9IHsKPj4gwqDCoMKg
wqDCoCAuYXR0cnMgPSBidHJmc19kZWJ1Z19mZWF0dXJlX2F0dHJzLAo+PiDCoCB9Owo+PiArLyog
SU8gYWNjb3VudGluZyAqLwo+PiArI2RlZmluZSBpb19hY2NvdW50aW5nX3RvX2ZzX2luZm8oX2tv
YmopICAgIAo+PiB0b19mc19pbmZvKChfa29iaiktPnBhcmVudC0+cGFyZW50KQo+PiArCj4+ICsj
ZGVmaW5lIERFQ0xBUkVfSU9fQUNDT1VOVElOR19PUFMobmFtZSnCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICtzdGF0aWMgc3NpemVfdCBpb19hY2NvdW50aW5nXyMj
bmFtZSMjX3Nob3coc3RydWN0IGtvYmplY3QgKmtvYmoswqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSAq
YSzCoMKgwqAgXAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY2hhciAqYnVmKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiAre8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
XAo+PiArwqDCoMKgIHN0cnVjdCBidHJmc19mc19pbmZvICpmc19pbmZvID0gaW9fYWNjb3VudGlu
Z190b19mc19pbmZvKGtvYmopO8KgwqDCoCBcCj4+ICvCoMKgwqAgdTY0IHJlc3VsdDvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgc3Bpbl9sb2NrKCZmc19pbmZvLT5pb19hY2NvdW50aW5n
X2xvY2spO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgIHJlc3VsdCA9IGZzX2lu
Zm8tPm5hbWU7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
Cj4+ICvCoMKgwqAgc3Bpbl91bmxvY2soJmZzX2luZm8tPmlvX2FjY291bnRpbmdfbG9jayk7wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqAgcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAi
JWxsdVxuIiwgcmVzdWx0KTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK33CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKPj4gK3N0YXRpYyBzc2l6ZV90IGlvX2FjY291bnRpbmdfIyNuYW1lIyNfc3RvcmUoc3Ry
dWN0IGtvYmplY3QgKmtvYmoswqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGtvYmpfYXR0cmlidXRlICphLMKgwqDCoCBcCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNo
YXIgKmJ1ZizCoMKgwqDCoMKgwqDCoCBcCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNpemVfdCBjb3VudCnCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK3vC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoCBzdHJ1Y3QgYnRyZnNfZnNfaW5mbyAqZnNfaW5mbyA9
IGlvX2FjY291bnRpbmdfdG9fZnNfaW5mbyhrb2JqKTvCoMKgwqAgXAo+PiArwqDCoMKgIHU2NCB2
YWx1ZTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXAo+PiArwqDCoMKgIGludCByZXQ7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgIHJl
dCA9IGtzdHJ0b3VsbChza2lwX3NwYWNlcyhidWYpLCAwLCAmdmFsdWUpO8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXAo+PiArwqDCoMKgIGlmIChyZXQpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBy
ZXQ7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+ICvC
oMKgwqAgc3Bpbl9sb2NrKCZmc19pbmZvLT5pb19hY2NvdW50aW5nX2xvY2spO8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+PiArwqDCoMKgIGZzX2luZm8tPm5hbWUgPSB2YWx1ZTvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK8KgwqDCoCBzcGluX3Vu
bG9jaygmZnNfaW5mby0+aW9fYWNjb3VudGluZ19sb2NrKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPj4gK8KgwqDCoCByZXR1cm4gY291bnQ7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4gK30KPj4gKwo+PiArREVDTEFSRV9JT19BQ0NP
VU5USU5HX09QUyhtZXRhX3JlYWQpOwo+PiArREVDTEFSRV9JT19BQ0NPVU5USU5HX09QUyhtZXRh
X3dyaXRlKTsKPj4gK0RFQ0xBUkVfSU9fQUNDT1VOVElOR19PUFMoZGF0YV9yZWFkKTsKPj4gK0RF
Q0xBUkVfSU9fQUNDT1VOVElOR19PUFMoZGF0YV93cml0ZSk7Cj4+ICsKPj4gK0JUUkZTX0FUVFJf
UlcoaW9fYWNjb3VudGluZywgbWV0YV9yZWFkLCBpb19hY2NvdW50aW5nX21ldGFfcmVhZF9zaG93
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIGlvX2FjY291bnRpbmdfbWV0YV9yZWFkX3N0b3JlKTsK
Pj4gK0JUUkZTX0FUVFJfUlcoaW9fYWNjb3VudGluZywgbWV0YV93cml0ZSwgaW9fYWNjb3VudGlu
Z19tZXRhX3dyaXRlX3Nob3csCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgaW9fYWNjb3VudGluZ19t
ZXRhX3dyaXRlX3N0b3JlKTsKPj4gK0JUUkZTX0FUVFJfUlcoaW9fYWNjb3VudGluZywgZGF0YV9y
ZWFkLCBpb19hY2NvdW50aW5nX2RhdGFfcmVhZF9zaG93LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
IGlvX2FjY291bnRpbmdfZGF0YV9yZWFkX3N0b3JlKTsKPj4gK0JUUkZTX0FUVFJfUlcoaW9fYWNj
b3VudGluZywgZGF0YV93cml0ZSwgaW9fYWNjb3VudGluZ19kYXRhX3dyaXRlX3Nob3csCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqAgaW9fYWNjb3VudGluZ19kYXRhX3dyaXRlX3N0b3JlKTsKPj4gKwo+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGUgKmlvX2FjY291bnRpbmdfZGVidWdfYXR0
cnNbXSA9IHsKPj4gK8KgwqDCoCBCVFJGU19BVFRSX1BUUihpb19hY2NvdW50aW5nLCBtZXRhX3Jl
YWQpLAo+PiArwqDCoMKgIEJUUkZTX0FUVFJfUFRSKGlvX2FjY291bnRpbmcsIG1ldGFfd3JpdGUp
LAo+PiArwqDCoMKgIEJUUkZTX0FUVFJfUFRSKGlvX2FjY291bnRpbmcsIGRhdGFfcmVhZCksCj4+
ICvCoMKgwqAgQlRSRlNfQVRUUl9QVFIoaW9fYWNjb3VudGluZywgZGF0YV93cml0ZSksCj4+ICvC
oMKgwqAgTlVMTCwKPj4gK307Cj4+ICsKPj4gwqAgI2VuZGlmCj4+IMKgIHN0YXRpYyBzc2l6ZV90
IGJ0cmZzX3Nob3dfdTY0KHU2NCAqdmFsdWVfcHRyLCBzcGlubG9ja190ICpsb2NrLCBjaGFyIAo+
PiAqYnVmKQo+PiBAQCAtMTIxOSw2ICsxMjc2LDEyIEBAIHZvaWQgYnRyZnNfc3lzZnNfcmVtb3Zl
X21vdW50ZWQoc3RydWN0IAo+PiBidHJmc19mc19pbmZvICpmc19pbmZvKQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAga29iamVjdF9kZWwoZnNfaW5mby0+ZGlzY2FyZF9kZWJ1Z19rb2JqKTsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGtvYmplY3RfcHV0KGZzX2luZm8tPmRpc2NhcmRfZGVidWdfa29iaik7
Cj4+IMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIGlmIChmc19pbmZvLT5pb19hY2NvdW50aW5nX2Rl
YnVnX2tvYmopIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHN5c2ZzX3JlbW92ZV9maWxlcyhmc19pbmZv
LT5pb19hY2NvdW50aW5nX2RlYnVnX2tvYmosCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaW9fYWNjb3VudGluZ19kZWJ1Z19hdHRycyk7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBrb2JqZWN0X2RlbChmc19pbmZvLT5pb19hY2NvdW50aW5nX2RlYnVnX2tvYmopOwo+PiArwqDC
oMKgwqDCoMKgwqAga29iamVjdF9wdXQoZnNfaW5mby0+aW9fYWNjb3VudGluZ19kZWJ1Z19rb2Jq
KTsKPj4gK8KgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgaWYgKGZzX2luZm8tPmRlYnVnX2tvYmopIHsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN5c2ZzX3JlbW92ZV9maWxlcyhmc19pbmZvLT5kZWJ1Z19r
b2JqLCAKPj4gYnRyZnNfZGVidWdfbW91bnRfYXR0cnMpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
a29iamVjdF9kZWwoZnNfaW5mby0+ZGVidWdfa29iaik7Cj4+IEBAIC0xODA0LDYgKzE4NjcsMjAg
QEAgaW50IGJ0cmZzX3N5c2ZzX2FkZF9tb3VudGVkKHN0cnVjdCAKPj4gYnRyZnNfZnNfaW5mbyAq
ZnNfaW5mbykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkaXNj
YXJkX2RlYnVnX2F0dHJzKTsKPj4gwqDCoMKgwqDCoCBpZiAoZXJyb3IpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIGZhaWx1cmU7Cj4+ICsKPj4gK8KgwqDCoCAvKiBpb19hY2NvdW50aW5nIGRp
cmVjdG9yeSAqLwo+PiArwqDCoMKgIGZzX2luZm8tPmlvX2FjY291bnRpbmdfZGVidWdfa29iaiA9
Cj4+ICvCoMKgwqDCoMKgwqDCoCBrb2JqZWN0X2NyZWF0ZV9hbmRfYWRkKCJpb19hY2NvdW50aW5n
Iixmc19pbmZvLT5kZWJ1Z19rb2JqKTsKPj4gK8KgwqDCoCBpZiAoIWZzX2luZm8tPmlvX2FjY291
bnRpbmdfZGVidWdfa29iaikgewo+PiArwqDCoMKgwqDCoMKgwqAgZXJyb3IgPSAtRU5PTUVNOwo+
PiArwqDCoMKgwqDCoMKgwqAgZ290byBmYWlsdXJlOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDC
oMKgIGVycm9yID0gc3lzZnNfY3JlYXRlX2ZpbGVzKGZzX2luZm8tPmlvX2FjY291bnRpbmdfZGVi
dWdfa29iaiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpb19hY2Nv
dW50aW5nX2RlYnVnX2F0dHJzKTsKPj4gK8KgwqDCoCBpZiAoZXJyb3IpCj4+ICvCoMKgwqDCoMKg
wqDCoCBnb3RvIGZhaWx1cmU7Cj4+ICsKPj4gwqAgI2VuZGlmCj4+IMKgwqDCoMKgwqAgZXJyb3Ig
PSBhZGRybV91bmtub3duX2ZlYXR1cmVfYXR0cnMoZnNfaW5mbywgdHJ1ZSk7Cj4+IGRpZmYgLS1n
aXQgYS9mcy9idHJmcy92b2x1bWVzLmMgYi9mcy9idHJmcy92b2x1bWVzLmMKPj4gaW5kZXggMjMz
MmUzMDI2ZWZhLi41OGYyZWMwYTYxMWEgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2J0cmZzL3ZvbHVtZXMu
Ywo+PiArKysgYi9mcy9idHJmcy92b2x1bWVzLmMKPj4gQEAgLTY3NjMsNiArNjc2MywyOSBAQCBz
dGF0aWMgdm9pZCBiaW9jX2Vycm9yKHN0cnVjdCBidHJmc19pb19jb250ZXh0IAo+PiAqYmlvYywg
c3RydWN0IGJpbyAqYmlvLCB1NjQgbG9naWMKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIH0KPj4gK3N0
YXRpYyB2b2lkIHVwZGF0ZV9pb19hY2NvdW50aW5nKHN0cnVjdCBidHJmc19mc19pbmZvICpmc19p
bmZvLCAKPj4gc3RydWN0IGJpbyAqYmlvKQo+PiArewo+PiArwqDCoMKgIHUzMiBsZW5ndGggPSBi
aW8tPmJpX2l0ZXIuYmlfc2l6ZTsKPj4gK8KgwqDCoCBib29sIG1ldGFkYXRhID0gYmlvLT5iaV9v
cGYgJiBSRVFfTUVUQTsKPj4gKwo+PiArI2lmZGVmwqDCoMKgIENPTkZJR19CVFJGU19ERUJVRwo+
PiArwqDCoMKgIHNwaW5fbG9jaygmZnNfaW5mby0+aW9fYWNjb3VudGluZ19sb2NrKTsKPj4gK8Kg
wqDCoCBpZiAoYmlvX29wKGJpbykgPT0gUkVRX09QX1JFQUQpIHsKPj4gK8KgwqDCoMKgwqDCoMKg
IGlmIChtZXRhZGF0YSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnNfaW5mby0+bWV0YV9y
ZWFkICs9IGxlbmd0aDsKPj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZnNfaW5mby0+ZGF0YV9yZWFkICs9IGxlbmd0aDsKPj4gK8KgwqDCoCB9IGVsc2Ug
ewo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG1ldGFkYXRhKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmc19pbmZvLT5tZXRhX3dyaXRlICs9IGxlbmd0aDsKPj4gK8KgwqDCoMKgwqDCoMKgIGVs
c2UKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnNfaW5mby0+ZGF0YV93cml0ZSArPSBsZW5n
dGg7Cj4+ICvCoMKgwqAgfQo+PiArwqDCoMKgIHNwaW5fdW5sb2NrKCZmc19pbmZvLT5pb19hY2Nv
dW50aW5nX2xvY2spOwo+PiArI2VuZGlmCj4+ICvCoMKgwqAgcmV0dXJuOwo+PiArfQo+PiArCj4+
IMKgIGJsa19zdGF0dXNfdCBidHJmc19tYXBfYmlvKHN0cnVjdCBidHJmc19mc19pbmZvICpmc19p
bmZvLCBzdHJ1Y3QgYmlvIAo+PiAqYmlvLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpbnQgbWlycm9yX251bSkKPj4gwqAgewo+PiBAQCAtNjc3Niw2ICs2Nzk5LDcgQEAgYmxr
X3N0YXR1c190IGJ0cmZzX21hcF9iaW8oc3RydWN0IGJ0cmZzX2ZzX2luZm8gCj4+ICpmc19pbmZv
LCBzdHJ1Y3QgYmlvICpiaW8sCj4gID4KPj4gwqDCoMKgwqDCoCBpbnQgdG90YWxfZGV2czsKPj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgYnRyZnNfaW9fY29udGV4dCAqYmlvYyA9IE5VTEw7Cj4+ICvCoMKg
wqAgdXBkYXRlX2lvX2FjY291bnRpbmcoZnNfaW5mbywgYmlvKTsKPiAKPiAgwqBHZW5lcmFsbHks
IHNwZWFraW5nIGFjY291bnRpbmcgc2hvdWxkIGdvIGF0IHRoZSBlbmQgb2YgSU8uCj4gIMKgT3Ro
ZXIgdGhhbiB0aGF0IGxvb2tzIGdvb2QuCgpUaGF0IGlzIGEgbGl0dGxlIG1vcmUgY29tcGxleCB0
aGFuIHRoaXMgc29sdXRpb24uCgpBdCBlbmRpbyB0aW1lLCB3ZSBubyBsb25nZXIgaGF2ZSByZWxp
YWJsZSBiaV9pdGVyLT5iaV9zaXplLgoKQW5kIGlmIHdlIGdvIGJpb19mb3JfZWFjaF9zZWdtZW50
KCksIGl0IHdpbGwgZ28gY29uZmxpY3RzIHdpdGggcmVjZW50IApiaW8gc3BsaXQgcGF0Y2hzZXQu
CgpUaHVzIEkgcHJlZmVyIHRvIGRvIHRoZSBhY2NvdW50aW5nIGJlZm9yZSB0aGUgSU8uCgo+IAo+
ICDCoEFsc28sIG5lZWQgYSB3YXkgdG8gcmVzZXQgdGhlIHZhbHVlcy4KCkNoZWNrIGlvX2FjY291
bnRpbmdfIyNuYW1lIyNfc3RvcmUoKSwgd2hpY2ggd2lsbCByZXNldCB0aGUgdmFsdWUgdG8gdGhl
IApwcm92aWRlZCBvbmUuCgpOb3JtYWxseSB3ZSBvbmx5IG5lZWQgdG8gImVjaG8gMCIgdG8gcmVz
ZXQuCgpUaGFua3MsClF1Cgo+IAo+IFRoYW5rcywgQW5hbmQKPiAKPj4gwqDCoMKgwqDCoCBsZW5n
dGggPSBiaW8tPmJpX2l0ZXIuYmlfc2l6ZTsKPj4gwqDCoMKgwqDCoCBtYXBfbGVuZ3RoID0gbGVu
Z3RoOwo+IAoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0
cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

