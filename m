Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 387AE23BDBA
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 18:08:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-MpgeYUwxNzSh6e-cM-m27Q-1; Tue, 04 Aug 2020 12:08:05 -0400
X-MC-Unique: MpgeYUwxNzSh6e-cM-m27Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9626E1902EA2;
	Tue,  4 Aug 2020 16:07:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 260CF6FEF4;
	Tue,  4 Aug 2020 16:07:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A50D31809554;
	Tue,  4 Aug 2020 16:07:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074G7dVf025531 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 12:07:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A2141112869; Tue,  4 Aug 2020 16:07:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 557E2111286D
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 16:07:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E203108C26A
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 16:07:36 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-307-F-hXhRu-NV-phT-wqMx_iQ-1;
	Tue, 04 Aug 2020 12:07:29 -0400
X-MC-Unique: F-hXhRu-NV-phT-wqMx_iQ-1
Received: from [10.137.106.139] (unknown [131.107.174.11])
	by linux.microsoft.com (Postfix) with ESMTPSA id C947F20B4908;
	Tue,  4 Aug 2020 09:07:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C947F20B4908
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Pavel Machek <pavel@ucw.cz>, Sasha Levin <sashal@kernel.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
From: Deven Bowers <deven.desai@linux.microsoft.com>
Message-ID: <fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
Date: Tue, 4 Aug 2020 09:07:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596386606.4087.20.camel@HansenPartnership.com>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 074G7dVf025531
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, zohar@linux.ibm.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, agk@redhat.com, paul@paul-moore.com,
	corbet@lwn.net, jmorris@namei.org, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com, jannh@google.com,
	linux-block@vger.kernel.org, viro@zeniv.linux.org.uk,
	axboe@kernel.dk, mdsakib@microsoft.com,
	linux-kernel@vger.kernel.org, eparis@redhat.com,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
 LSM (IPE)
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

CgpPbiA4LzIvMjAyMCA5OjQzIEFNLCBKYW1lcyBCb3R0b21sZXkgd3JvdGU6Cj4gT24gU3VuLCAy
MDIwLTA4LTAyIGF0IDE2OjMxICswMjAwLCBQYXZlbCBNYWNoZWsgd3JvdGU6Cj4+IE9uIFN1biAy
MDIwLTA4LTAyIDEwOjAzOjAwLCBTYXNoYSBMZXZpbiB3cm90ZToKPj4+IE9uIFN1biwgQXVnIDAy
LCAyMDIwIGF0IDAxOjU1OjQ1UE0gKzAyMDAsIFBhdmVsIE1hY2hlayB3cm90ZToKPj4+PiBIaSEK
Pj4+Pgo+Pj4+PiBJUEUgaXMgYSBMaW51eCBTZWN1cml0eSBNb2R1bGUgd2hpY2ggYWxsb3dzIGZv
ciBhIGNvbmZpZ3VyYWJsZQo+Pj4+PiBwb2xpY3kgdG8gZW5mb3JjZSBpbnRlZ3JpdHkgcmVxdWly
ZW1lbnRzIG9uIHRoZSB3aG9sZSBzeXN0ZW0uCj4+Pj4+IEl0IGF0dGVtcHRzIHRvIHNvbHZlIHRo
ZSBpc3N1ZSBvZiBDb2RlIEludGVncml0eTogdGhhdCBhbnkgY29kZQo+Pj4+PiBiZWluZyBleGVj
dXRlZCAob3IgZmlsZXMgYmVpbmcgcmVhZCksIGFyZSBpZGVudGljYWwgdG8gdGhlCj4+Pj4+IHZl
cnNpb24gdGhhdCB3YXMgYnVpbHQgYnkgYSB0cnVzdGVkIHNvdXJjZS4KPj4+Pgo+Pj4+IEhvdyBp
cyB0aGF0IGRpZmZlcmVudCBmcm9tIHNlY3VyaXR5L2ludGVncml0eS9pbWE/Cj4+Pgo+Pj4gTWF5
YmUgaWYgeW91IHdvdWxkIGhhdmUgcmVhZCB0aGUgY292ZXIgbGV0dGVyIGFsbCB0aGUgd2F5IGRv
d24gdG8KPj4+IHRoZSA1dGggcGFyYWdyYXBoIHdoaWNoIGV4cGxhaW5zIGhvdyBJUEUgaXMgZGlm
ZmVyZW50IGZyb20gSU1BIHdlCj4+PiBjb3VsZCBhdm9pZGVkIHRoaXMgbWFpbCBleGNoYW5nZS4u
Lgo+Pgo+PiAiCj4+IElQRSBkaWZmZXJzIGZyb20gb3RoZXIgTFNNcyB3aGljaCBwcm92aWRlIGlu
dGVncml0eSBjaGVja2luZyAoZm9yCj4+IGluc3RhbmNlLAo+PiBJTUEpLCBhcyBpdCBoYXMgbm8g
ZGVwZW5kZW5jeSBvbiB0aGUgZmlsZXN5c3RlbSBtZXRhZGF0YSBpdHNlbGYuIFRoZQo+PiBhdHRy
aWJ1dGVzIHRoYXQgSVBFIGNoZWNrcyBhcmUgZGV0ZXJtaW5pc3RpYyBwcm9wZXJ0aWVzIHRoYXQg
ZXhpc3QKPj4gc29sZWx5Cj4+IGluIHRoZSBrZXJuZWwuIEFkZGl0aW9uYWxseSwgSVBFIHByb3Zp
ZGVzIG5vIGFkZGl0aW9uYWwgbWVjaGFuaXNtcyBvZgo+PiB2ZXJpZnlpbmcgdGhlc2UgZmlsZXMg
KGUuZy4gSU1BIFNpZ25hdHVyZXMpIC0gYWxsIG9mIHRoZSBhdHRyaWJ1dGVzCj4+IG9mCj4+IHZl
cmlmeWluZyBmaWxlcyBhcmUgZXhpc3RpbmcgZmVhdHVyZXMgd2l0aGluIHRoZSBrZXJuZWwsIHN1
Y2ggYXMKPj4gZG0tdmVyaXR5Cj4+IG9yIGZzdmVyaXR5Lgo+PiAiCj4+Cj4+IFRoYXQgaXMgbm90
IHJlYWxseSBoZWxwZnVsLgoKUGVyaGFwcyBJIGNhbiBleHBsYWluIChhbmQgcmUtd29yZCB0aGlz
IHBhcmFncmFwaCkgYSBiaXQgYmV0dGVyLgoKQXMgSmFtZXMgaW5kaWNhdGVzLCBJUEUgZG9lcyB0
cnkgdG8gY2xvc2UgdGhlIGdhcCBvZiB0aGUgSU1BIGxpbWl0YXRpb24Kd2l0aCB4YXR0ci4gSSBo
b25lc3RseSB3YXNu4oCZdCBmYW1pbGlhciB3aXRoIHRoZSBhcHBlbmRlZCBzaWduYXR1cmVzLAp3
aGljaCBzZWVtcyBmaW5lLgoKUmVnYXJkbGVzcywgdGhpcyBpc27igJl0IHRoZSBsYXJnZXIgYmVu
ZWZpdCB0aGF0IElQRSBwcm92aWRlcy4gVGhlCmxhcmdlciBiZW5lZml0IG9mIHRoaXMgaXMgaG93
IElQRSBzZXBhcmF0ZXMgX21lY2hhbmlzbXNfIChwcm9wZXJ0aWVzKQp0byBlbmZvcmNlIGludGVn
cml0eSByZXF1aXJlbWVudHMsIGZyb20gX3BvbGljeV8uIFRoZSBMU00gcHJvdmlkZXMKcG9saWN5
LCB3aGlsZSB0aGluZ3MgbGlrZSBkbS12ZXJpdHkgcHJvdmlkZSBtZWNoYW5pc20uCgpTbyB0byBz
cGVhaywgSVBFIGFjdHMgYXMgdGhlIGdsdWUgZm9yIG90aGVyIG1lY2hhbmlzbXMgdG8gbGV2ZXJh
Z2UgYQpjdXN0b21pemFibGUsIHN5c3RlbS13aWRlIHBvbGljeSB0byBlbmZvcmNlLiBXaGlsZSB0
aGlzIGluaXRpYWwKcGF0Y2hzZXQgb25seSBvbmJvYXJkcyBkbS12ZXJpdHksIHRoZXJl4oCZcyBh
bHNvIHBvdGVudGlhbCBmb3IgTUFDIGxhYmVscywKZnMtdmVyaXR5LCBhdXRoZW50aWNhdGVkIEJU
UkZTLCBkbS1pbnRlZ3JpdHksIGV0Yy4gSVBFIGxldmVyYWdlcwpleGlzdGluZyBzeXN0ZW1zIGlu
IHRoZSBrZXJuZWwsIHdoaWxlIElNQSB1c2VzIGl0cyBvd24uCgpBbm90aGVyIGRpZmZlcmVuY2Ug
aXMgdGhlIGdlbmVyYWwgY292ZXJhZ2UuIElNQSBoYXMgc29tZSBkaWZmaWN1bHRpZXMKaW4gY292
ZXJpbmcgbXByb3RlY3RbMV0sIElQRSBkb2VzbuKAmXQgKHRoZSBNQVBfQU5PTllNT1VTIGluZGlj
YXRlZCBieQpKYW5uIGluIHRoYXQgdGhyZWFkIHdvdWxkIGJlIGRlbmllZCBhcyB0aGUgZmlsZSBz
dHJ1Y3Qgd291bGQgYmUgbnVsbCwKd2l0aCBJUEXigJlzIGN1cnJlbnQgc2V0IG9mIHN1cHBvcnRl
ZCBtZWNoYW5pc21zLiBtcHJvdGVjdCB3b3VsZCBjb250aW51ZQp0byBmdW5jdGlvbiBhcyBleHBl
Y3RlZCBpZiB5b3UgY2hhbmdlIHRvIFBST1RfRVhFQykuCgo+IFBlcmhhcHMgdGhlIGJpZyBxdWVz
dGlvbiBpczogSWYgd2UgdXNlZCB0aGUgZXhpc3RpbmcgSU1BIGFwcGVuZGVkCj4gc2lnbmF0dXJl
IGZvciBkZXRhY2hlZCBzaWduYXR1cmVzIChlZmZlY3RpdmVseSBiZWNvbWluZyB0aGUKPiAicHJv
cGVydGllcyIgcmVmZXJyZWQgdG8gaW4gdGhlIGNvdmVyIGxldHRlcikgYW5kIGhvb2tlZCBJTUEg
aW50bwo+IGRldmljZSBtYXBwZXIgdXNpbmcgYWRkaXRpb25hbCBwb2xpY3kgdGVybXMsIHdvdWxk
IHRoYXQgc2F0aXNmeSBhbGwgdGhlCj4gcmVxdWlyZW1lbnRzIHRoaXMgbmV3IExTTSBoYXM/CgpX
ZWxsLCBNaW1pLCB3aGF0IGRvIHlvdSB0aGluaz8gU2hvdWxkIHdlIGludGVncmF0ZSBhbGwgdGhl
IGZlYXR1cmVzIG9mCklQRSBpbnRvIElNQSwgb3IgZG8geW91IHRoaW5rIHRoZXkgYXJlIHN1ZmZp
Y2llbnRseSBkaWZmZXJlbnQgaW4KYXJjaGl0ZWN0dXJlIHRoYXQgaXQgd291bGQgYmUgd29ydGgg
aXQgdG8ga2VlcCB0aGUgY29kZSBiYXNlIGluIHNlcGFyYXRlCkxTTXM/CgoKWzFdIApodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1pbnRlZ3JpdHkvMTU4ODY4ODIwNC41MTU3LjUuY2FtZWxA
bGludXguaWJtLmNvbS8KCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0
LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

