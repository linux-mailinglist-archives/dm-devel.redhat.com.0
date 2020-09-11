Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 45ED72685C3
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:25:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-bVUbTPkYNBWxE1yq2dnZzA-1; Mon, 14 Sep 2020 03:24:25 -0400
X-MC-Unique: bVUbTPkYNBWxE1yq2dnZzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08ADD1074656;
	Mon, 14 Sep 2020 07:24:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D60E91A8EC;
	Mon, 14 Sep 2020 07:24:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BDBE8C7C1;
	Mon, 14 Sep 2020 07:24:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BGJElf016028 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 12:19:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5550810ABCA6; Fri, 11 Sep 2020 16:19:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50ABC10ABCA2
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:19:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E899A18AE947
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 16:19:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-467-ZaJJpxXSP72IzQtJ_iuYSA-1;
	Fri, 11 Sep 2020 12:19:04 -0400
X-MC-Unique: ZaJJpxXSP72IzQtJ_iuYSA-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id BADE820716FA;
	Fri, 11 Sep 2020 09:19:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BADE820716FA
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
References: <20200828015704.6629-1-tusharsu@linux.microsoft.com>
	<20200828015704.6629-2-tusharsu@linux.microsoft.com>
	<4802c73c2ed22c64ea4f315d3115ead919c3205e.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <1a456a10-bb49-206b-9fb9-cc996eea6e29@linux.microsoft.com>
Date: Fri, 11 Sep 2020 09:19:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4802c73c2ed22c64ea4f315d3115ead919c3205e.camel@linux.ibm.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08BGJElf016028
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 1/6] IMA: generalize keyring specific
 measurement constructs
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Content-Language: en-US

CgpPbiAyMDIwLTA4LTMxIDQ6NTUgYS5tLiwgTWltaSBab2hhciB3cm90ZToKPiBPbiBUaHUsIDIw
MjAtMDgtMjcgYXQgMTg6NTYgLTA3MDAsIFR1c2hhciBTdWdhbmRoaSB3cm90ZToKPj4gSU1BIGZ1
bmN0aW9ucyBzdWNoIGFzIGltYV9tYXRjaF9rZXlyaW5nKCksIHByb2Nlc3NfYnVmZmVyX21lYXN1
cmVtZW50KCksCj4+IGltYV9tYXRjaF9wb2xpY3koKSBldGMuIGhhbmRsZSBkYXRhIHNwZWNpZmlj
IHRvIGtleXJpbmdzLiBDdXJyZW50bHksCj4+IHRoZXNlIGNvbnN0cnVjdHMgYXJlIG5vdCBnZW5l
cmljIHRvIGhhbmRsZSBhbnkgZnVuYyBzcGVjaWZpYyBkYXRhLgo+PiBUaGlzIG1ha2VzIGl0IGhh
cmRlciB0byBleHRlbmQgd2l0aG91dCBjb2RlIGR1cGxpY2F0aW9uLgo+Pgo+PiBSZWZhY3RvciB0
aGUga2V5cmluZyBzcGVjaWZpYyBtZWFzdXJlbWVudCBjb25zdHJ1Y3RzIHRvIGJlIGdlbmVyaWMg
YW5kCj4+IHJldXNhYmxlIGluIG90aGVyIG1lYXN1cmVtZW50IHNjZW5hcmlvcy4KPiAKPiBNb3N0
bHkgdGhpcyBwYXRjaCBjaGFuZ2VzIHRoZSB2YXJpYWJsZSBuYW1lIGZyb20ga2V5cmluZyB0byBm
dW5jX2RhdGEsCj4gd2hpY2ggaXMgZ29vZC4gIE90aGVyIGNoYW5nZXMgc2hvdWxkIGJlIG1pbmlt
aXplZC4KPiAKVGhlIG9ubHkgb3RoZXIgY2hhbmdlIGluIHRoaXMgcGF0Y2ggaXMgaW50cm9kdWN0
aW9uIG9mCmJvb2wgYWxsb3dfZW1wdHlfb3B0X2xpc3QsIHdoaWNoIGlzIG5lZWRlZCBhcyBwZXIg
bXkgY29tbWVudCBiZWxvdy4KCk1heWJlIEkgY2FuIG1vdmUgImFsbG93X2VtcHR5X29wdF9saXN0
IiB0byBhIG5ldyBwYXRjaCBhZnRlciB0aGlzIG9uZSBpbgp0aGlzIHNlcmllcy4KCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFR1c2hhciBTdWdhbmRoaSA8dHVzaGFyc3VAbGludXgubWljcm9zb2Z0LmNv
bT4KPj4gLS0tCj4gCj4gPHNuaXA+Cj4gCj4+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9pbnRlZ3Jp
dHkvaW1hL2ltYV9wb2xpY3kuYyBiL3NlY3VyaXR5L2ludGVncml0eS9pbWEvaW1hX3BvbGljeS5j
Cj4+IGluZGV4IGZlMWRmMzczYzExMy4uODg2NmU4NGQwMDYyIDEwMDY0NAo+PiAtLS0gYS9zZWN1
cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9wb2xpY3kuYwo+PiArKysgYi9zZWN1cml0eS9pbnRlZ3Jp
dHkvaW1hL2ltYV9wb2xpY3kuYwo+PiBAQCAtNDUxLDE1ICs0NTEsMjEgQEAgaW50IGltYV9sc21f
cG9saWN5X2NoYW5nZShzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25lZCBsb25nIGV2
ZW50LAo+PiAgIH0KPj4gICAKPj4gICAvKioKPj4gLSAqIGltYV9tYXRjaF9rZXlyaW5nIC0gZGV0
ZXJtaW5lIHdoZXRoZXIgdGhlIGtleXJpbmcgbWF0Y2hlcyB0aGUgbWVhc3VyZSBydWxlCj4+IC0g
KiBAcnVsZTogYSBwb2ludGVyIHRvIGEgcnVsZQo+PiAtICogQGtleXJpbmc6IG5hbWUgb2YgdGhl
IGtleXJpbmcgdG8gbWF0Y2ggYWdhaW5zdCB0aGUgbWVhc3VyZSBydWxlCj4+ICsgKiBpbWFfbWF0
Y2hfcnVsZV9kYXRhIC0gZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIGdpdmVuIGZ1bmNfZGF0YSBtYXRj
aGVzCj4+ICsgKgkJCSB0aGUgbWVhc3VyZSBydWxlIGRhdGEKPj4gKyAqIEBydWxlOiBJTUEgcG9s
aWN5IHJ1bGUKPj4gKyAqIEBvcHRfbGlzdDogcnVsZSBkYXRhIHRvIG1hdGNoIGZ1bmNfZGF0YSBh
Z2FpbnN0Cj4+ICsgKiBAZnVuY19kYXRhOiBkYXRhIHRvIG1hdGNoIGFnYWluc3QgdGhlIG1lYXN1
cmUgcnVsZSBkYXRhCj4+ICsgKiBAYWxsb3dfZW1wdHlfb3B0X2xpc3Q6IElmIHRydWUgbWF0Y2hl
cyBhbGwgZnVuY19kYXRhCj4+ICAgICogQGNyZWQ6IGEgcG9pbnRlciB0byBhIGNyZWRlbnRpYWxz
IHN0cnVjdHVyZSBmb3IgdXNlciB2YWxpZGF0aW9uCj4+ICAgICoKPj4gLSAqIFJldHVybnMgdHJ1
ZSBpZiBrZXlyaW5nIG1hdGNoZXMgb25lIGluIHRoZSBydWxlLCBmYWxzZSBvdGhlcndpc2UuCj4+
ICsgKiBSZXR1cm5zIHRydWUgaWYgZnVuY19kYXRhIG1hdGNoZXMgb25lIGluIHRoZSBydWxlLCBm
YWxzZSBvdGhlcndpc2UuCj4+ICAgICovCj4+IC1zdGF0aWMgYm9vbCBpbWFfbWF0Y2hfa2V5cmlu
ZyhzdHJ1Y3QgaW1hX3J1bGVfZW50cnkgKnJ1bGUsCj4+IC0JCQkgICAgICBjb25zdCBjaGFyICpr
ZXlyaW5nLCBjb25zdCBzdHJ1Y3QgY3JlZCAqY3JlZCkKPj4gK3N0YXRpYyBib29sIGltYV9tYXRj
aF9ydWxlX2RhdGEoc3RydWN0IGltYV9ydWxlX2VudHJ5ICpydWxlLAo+PiArCQkJCWNvbnN0IHN0
cnVjdCBpbWFfcnVsZV9vcHRfbGlzdCAqb3B0X2xpc3QsCj4gCj4gT2sKPiAKPj4gKwkJCQljb25z
dCBjaGFyICpmdW5jX2RhdGEsCj4+ICsJCQkJYm9vbCBhbGxvd19lbXB0eV9vcHRfbGlzdCwKPiAK
PiBBcyB0aGUgcG9saWN5IGlzIGxvYWRlZCwgc2hvdWxkbid0IHRoZSBydWxlcyBzaG91bGQgYmUg
Y2hlY2tlZCwgbm90Cj4gaGVyZSBvbiB1c2FnZT8KPiAKPiBNaW1pCgpTaW5jZSAia2V5cmluZ3M9
IiBpcyBvcHRpb25hbCwgSSBjYW5ub3QgY2hlY2sgdGhlIHJ1bGUgYXQgbG9hZCB0aW1lIGZvcgpr
ZXlyaW5ncy4gZnVuYz1LRVlfQ0hFQ0sgbWF5IG9yIG1heSBub3QgaGF2ZSAia2V5cmluZ3M9Iiwg
YW5kIGJvdGggYXJlCnZhbGlkIHNjZW5hcmlvcy4KCkhvd2V2ZXIgImNyaXRpY2FsX2tlcm5lbF9k
YXRhX3NvdXJjZXM9IiBpcyBtYW5kYXRvcnkgZm9yIApmdW5jPUNSSVRJQ0FMX0RBVEEuCgpTbyBJ
IGFtIGFscmVhZHkgbWFraW5nIHRoYXQgY2hlY2sgYXQgcG9saWN5IGxvYWQgdGltZS4KClNlZSBw
YXRjaCA1LzYg4oCTIGZ1bmN0aW9uIGltYV9tYXRjaF9ydWxlcygpLCB3aGVyZSBJIGNoZWNrIGZv
cgpJTUFfREFUQV9TT1VSQ0VTLgoKKyAgICAgICBjYXNlIENSSVRJQ0FMX0RBVEE6CjxzbmlwPgor
ICAgICAgICAgICAgICAgaWYgKCEoZW50cnktPmZsYWdzICYgSU1BX0RBVEFfU09VUkNFUykgfHwK
PHNuaXA+CisgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKKwoKU2luY2UgaW1h
X21hdGNoX3J1bGVfZGF0YSAodGhpcyBmdW5jdGlvbikgaGFuZGxlcyBib3RoIGZ1bmM9S0VZX0NI
RUNLIAphbmQgZnVuYz1DUklUSUNBTF9EQVRBLCB3ZSBoYXZlIHRvIHVzZSB0aGUgYm9vbCAiYWxs
b3dfZW1wdHlfb3B0X2xpc3QiCnRvIGRpZmZlcmVudGlhdGUgYmV0d2VlbiB0aGUgdHdvIHNjZW5h
cmlvcyDigJMgd2hldGhlciB0aGUgcnVsZSBpcwpvcHRpb25hbCBvciBub3QgZm9yIGEgZ2l2ZW4g
ZnVuYy4KCj4gCj4+ICsJCQkJY29uc3Qgc3RydWN0IGNyZWQgKmNyZWQpCj4+ICAgewo+PiAgIAli
b29sIG1hdGNoZWQgPSBmYWxzZTsKPj4gICAJc2l6ZV90IGk7Cj4+CgoKLS0KZG0tZGV2ZWwgbWFp
bGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2RtLWRldmVs

