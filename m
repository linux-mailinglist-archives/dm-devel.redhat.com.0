Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9FC4FC599
	for <lists+dm-devel@lfdr.de>; Mon, 11 Apr 2022 22:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649708216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HCkYgSQ/577nsFMxj0LLRfKjp7Hkx3j8IkrBv23uuLo=;
	b=D/RgoKCMFsNo8tpkO7vs2665PeMeoGQrLhYUQGe9NdUfdfnzDMxYgOh1Eq//f6zpDIr8I1
	CZzxnCcXa93XE34JYcAfDOHytSE8Vb2vsniIl3CwAukIjesQcaogghR941lNuxEFCoqCI7
	chNoVULw+IzfqLWDKRytaXihLItYYt4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-Bnavei07Nw-wcjAd4cHWmg-1; Mon, 11 Apr 2022 16:16:53 -0400
X-MC-Unique: Bnavei07Nw-wcjAd4cHWmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6D9A29ABA2D;
	Mon, 11 Apr 2022 20:16:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 079E640CFD10;
	Mon, 11 Apr 2022 20:16:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B649E1940376;
	Mon, 11 Apr 2022 20:16:46 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2C7011940365
 for <dm-devel@listman.corp.redhat.com>; Mon, 11 Apr 2022 20:16:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0E6604292CB; Mon, 11 Apr 2022 20:16:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.40.192.67] (unknown [10.40.192.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 614A34292C8;
 Mon, 11 Apr 2022 20:16:44 +0000 (UTC)
Message-ID: <cc43900d-35a3-14ae-73ef-919ab02e01ff@redhat.com>
Date: Mon, 11 Apr 2022 22:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Joe Thornber <ejt@redhat.com>
References: <YlNUhtXltj8vgvcZ@itl-email>
 <e65dbacc-f241-22ba-62a9-a6f522cce9dc@redhat.com>
 <YlRjvp7SH3To0pHe@itl-email>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <YlRjvp7SH3To0pHe@itl-email>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [dm-devel] Potential enhancements to dm-thin v2
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDExLiAwNC4gMjIgdiAxOToyMiBEZW1pIE1hcmllIE9iZW5vdXIgbmFwc2FsKGEpOgo+IE9u
IE1vbiwgQXByIDExLCAyMDIyIGF0IDEwOjE2OjAyQU0gKzAyMDAsIFpkZW5layBLYWJlbGFjIHdy
b3RlOgo+PiBEbmUgMTEuIDA0LiAyMiB2IDA6MDMgRGVtaSBNYXJpZSBPYmVub3VyIG5hcHNhbChh
KToKPj4KPj4gWW91ciBwcm9wb3NhbCBhY3R1YWxseSBicmVha3MgdGhpcyBzZXF1ZW5jZSBhbmQg
d291bGQgbW92ZSB0aGluZ3MgdG8gdGhlCj4+IHN0YXRlIG9mwqAgJ2d1ZXNzIGF0IHdoaWNoIHN0
YXRlcyB3ZSBhcmUgbm93Jy4gKGFuZCBJTUhPIHByZXNlbnRzIG11Y2ggbW9yZQo+PiByaXNrIHRo
YW4gdmlydHVhbCBwcm9ibGVtIHdpdGggc3VzcGVuZCBmcm9tIHVzZXItc3BhY2UgLSB3aGljaCBp
cyBvbmx5IGEKPj4gcHJvYmxlbSBpZiB5b3UgYXJlIHVzaW5nIHN1c3BlbmRlZCBkZXZpY2UgYXMg
J3N3YXAnIGFuZCAncm9vdGZzJyAtIHNvIHRoZXJlCj4+IGFyZSB2ZXJ5IGVhc3kgd2F5cyBob3cg
dG8gb3JjaGVzdHJhdGUgeW91ciBMVnMgdG8gYXZvaWQgc3VjaCBwcm9ibGVtcykuCj4gVGhlIGlu
dGVudCBpcyBsZXNzIOKAnGd1ZXNzIHdoYXQgc3RhdGVzIHdlIGFyZSBub3figJ0gYW5kIG1vcmUg
4oCcSXQgbG9va3MKPiBsaWtlIGRtLXRoaW4gYWxyZWFkeSBoYXMgdGhlIGRhdGEgc3RydWN0dXJl
cyBuZWVkZWQgdG8gc3RvcmUgc29tZQo+IHBlci10aGluIG1ldGFkYXRhLCBhbmQgdGhhdCBjb3Vs
ZCBtYWtlIHdyaXRpbmcgYSBzaW1wbGUgdXNlcnNwYWNlIHZvbHVtZQo+IG1hbmFnZXIgRkFSIEZB
UiBlYXNpZXLigJ0uICBJdCBhcHBlYXJzIHRvIG1lIHRoYXQgdGhlIG9ubHkgY2hhbmdlIG5lZWRl
ZAoKCkkgZG8gbm90IHNwZW5kIGhvdXJzIGV4cGxhaW5pbmcgYWxsIHRoZSBkZXRhaWxzIC0gYnV0
IHJ1bm5pbmcganVzdCB0aGUgc3VzcGVuZCAKYWxvbmUgbWF5IHJlc3VsdCBpbiBtYW55IGRpZmZl
cm50IHByb2JsZW0gd2hlcmUgdGhlIHRoaW5ncyBsaWtlIHJ1bm5pbmcgCnRoaW4tcG9vbCBvdXQt
b2YtZGF0YSBzcGFjZSBpcyBvbmUgb2YgdGhlIGVhc2llc3QuCgpCYXNpY2FsbHkgZWFjaCBzdGVw
IG11c3QgYmUgZGVzaWduZWQgd2l0aMKgICdwb3dlci1vZmYnIGhhcHBlbiBkdXJpbmcgdGhlIApv
cGVyYXRpb24uIEZvciBlYWNoIHN0ZXAgeW91IG5lZWQgdG8ga25vdyBob3cgdGhlIHJlY292ZXJ5
IHN0ZXAgbG9va3MgbGlrZSBhbmQgCmhvdyB0aGUgbHZtMiAmIGtlcm5lbCBtZXRhZGF0YSBjL3dv
dWxkIG1hdGNoIHRvZ2V0aGVyLsKgIENvbWJpbmluZyBtYW55IHN0ZXBzIAp0b2dldGhlciBpbnRv
IGEgc2luZ2xlICdrZXJuZWwnIGNhbGwganVzdCBpbmNyZWFzZXMgYWxyZWFkeSBsYXJnZSByYW5n
ZSBvZiAKZXJyb3JzLsKgIFNvIGluIG1hbnkgY2FzZSB3ZSBzaW1wbHkgZG8gZmF2b3VyIHRvIGtl
ZXAgb3BlcmF0aW9uIG1vcmUgCidsb3ctbGV2ZWwtYXRvbWljJyBldmVuIGF0IHNsaWdodCBoaWdo
ZXIgcGVyZm9ybWFuY2UgcHJpY2UgKGFzIHNhaWQgLSB3ZSd2ZSAKbmV2ZXIgc2VlbiBhIGNyZWF0
aW9uIG9mIHNuYXBzaG90IHRvIGJlICdtc2VjJyBjcml0aWNhbCBvcGVyYXRpb24gLSBhc8KgIHRo
ZcKgIAonc3VzcGVuZCcgd2l0aCBpbXBsaWNpdCBmbHVzaCAmIGZzZnJlZXplIGl0c2VsZiBtaWdo
dCBiZSBmYXIgbW9yZSBleHBlbnNpdmUgCm9wZXJhdGlvbi4KCgoKPj4gQnV0IElNSE8gY3JlYXRp
b24gYW5kIHJlbW92YWwgb2YgdGhvdXNhbmRzIG9mIGRldmljZXMgaW4gdmVyeSBzaG9ydCBwZXJp
b2QKPj4gb2YgdGltZSByYXRoZXIgc3VnZ2VzdCB0aGVyZSBpcyBzb21ldGhpbmcgc3ViLW9wdGlt
YWwgaW4geW91ciBvcmlnaW5hbAo+PiBzb2Z0d2FyZSBkZXNpZ24gYXMgSSdtIHJlYWxseSBoYXZp
bmcgaGFyZCB0aW1lIGltYWdpbmluZyB3aHkgd291bGQgeW91IG5lZWQKPj4gdGhpcyA/Cj4gVGhl
cmUgdmVyeSB3ZWxsIGNvdWxkIGJlIChzdWdnZXN0aW9ucyBmb3IgaW1wcm92ZW1lbnQgd2VsY29t
ZSkuCj4KPj4gSWYgeW91IHdpc2ggdG8gb3BlcmF0ZSBsb3RzIG9mIGRldmljZXMgLSBrZWVwIHRo
ZW0gc2ltcGx5IGNyZWF0ZWQgYW5kIHJlYWR5Cj4+IC0gYW5kIGV2ZW50dWFsbHkgYmxrZGlzY2Fy
ZCB0aGVtIGZvciBuZXh0IGRldmljZSByZXVzZS4KPiBUaGF0IHdvdWxkIHdvcmsgZm9yIHZvbGF0
aWxlIHZvbHVtZXMsIGJ1dCB0aG9zZSBhcmUgb25seSBhYm91dCAxLzMgb2YKPiB0aGUgdm9sdW1l
cyBpbiBhIFF1YmVzIE9TIHN5c3RlbS4gIFRoZSBvdGhlciAyLzMgYXJlIHdyaXRhYmxlIHNuYXBz
aG90cy4KPiBBbHNvLCBRdWJlcyBPUyBoYXMgZm91bmQgYmxrZGlzY2FyZCBvbiB0aGlucyB0byBi
ZSBhIHBlcmZvcm1hbmNlCj4gcHJvYmxlbS4gIEl0IHVzZWQgdG8gbG9jayB1cCBlbnRpcmUgcG9v
bHMgdW50aWwgUXViZXMgT1MgbW92ZWQgdG8gZG9pbmcKPiB0aGUgYmxrZGlzY2FyZCBpbiBjaHVu
a3MuCgpBbHdheXMgbWFrZSBzdXJlIHlvdSB1c2UgcmVjZW50IExpbnV4IGtlcm5lbHMuCgpCbGtk
aXNjYXJkIHNob3VsZCBub3QgZGlmZmVyIGZyb20gbHZyZW1vdmUgdG9vIG11Y2jCoCAtIGFsc28g
ZXhwZXJpbWVudCBob3cgCnRoZcKgICdsdmNoYW5nZSAtLWRpc2NhcmRzwqAgcGFzc2Rvd258bm9w
YXNzZG93biBwb29sTFYnIHdvcmtzLgoKCj4+IEknbSBhbHNvIHVuc3VyZSBmcm9tIHdoZXJlIHdv
dWxkIGFyaXNlIGFueSBzcGVjaWFsIG5lZWQgdG8gaW5zdGFudGlhdGXCoCB0aGF0Cj4+IG1hbnkg
c25hcHNob3RzIC3CoCBpZiB0aGVyZSBpcyBzb21lIHZhbGlkICYgbG9naWNhbCBwdXJwb3NlIC3C
oMKgIGx2bTIgY2FuIGhhdmUKPj4gZXh0ZW5kZWQgdXNlciBzcGFjZSBBUEkgdG8gY3JlYXRlIG11
bHRpcGxlIHNuYXBzaG90cyBhdCBvbmNlIG1heWJlIChzbwo+PiBpLmUuwqDCoMKgIGNyZWF0ZcKg
IDEwIHNuYXBzaG90c8KgwqAgd2l0aMKgwqDCoMKgwqAgbmFtZS0lZMKgIG9mIGEgc2luZ2xlIHRo
aW5MVikKPiBUaGlzIHdvdWxkIGJlIGFtYXppbmcsIGFuZCBRdWJlcyBPUyBzaG91bGQgYmUgYWJs
ZSB0byB1c2UgaXQuICBUaGF0Cj4gc2FpZCwgUXViZXMgT1Mgd291bGQgcHJlZmVyIHRvIGJlIGFi
bGUgdG8gY2hvb3NlIHRoZSBuYW1lIG9mIGVhY2ggdm9sdW1lCj4gc2VwYXJhdGVseS4gIENvdWxk
IHRoZXJlIGJlIGEgbW9yZSBnZW5lcmFsIGJhdGNoaW5nIG9wZXJhdGlvbj8gIEp1c3QKPiBzdXBw
b3J0aW5nIOKAmGx2bSBsdmNyZWF0ZeKAmSBhbmQg4oCYbHZtIGx2c+KAmSB3b3VsZCBiZSBncmVh
dCwgYnV0IHN1cHBvcnQgZm9yCj4g4oCYbHZtIGx2cmVtb3Zl4oCZLCDigJhsdm0gbHZyZW5hbWXi
gJksIOKAmGx2bSBsdmV4dGVuZOKAmSwgYW5kIOKAmGx2bSBsdmNoYW5nZQo+IC0tYWN0aXZhdGU9
eeKAmSBhcyB3ZWxsIHdvdWxkIGJlIGV2ZW4gYmV0dGVyLgoKVGhlcmUgaXMga2luZCBvZiAnaGlk
ZGVuJyBwbGFuIGluc2lkZSBjb21tYW5kIGxpbmUgcHJvY2Vzc2luZyB0byBhbGxvdyAKJ2dyb3Vw
ZWQnwqAgcHJvY2Vzc2luZy4KCmx2Y3JlYXRlIC0tc25hcHNob3TCoCAtLW5hbWUgbHYxwqAgLS1z
bmFwc2hvdCAtLW5hbWUgbHYyIHZnL29yaWdpbgoKSG93ZXZlciB0aGVyZSBpcyBjdXJyZW50bHkg
bm8gbWFuIHBvd2VyIHRvIHByb2NlZWQgZnVydGhlciBvbiB0aGlzIHBhcnQgYXMgd2UgCmhhdmUg
b3RoZXIgcGFydHMgb2YgY29kZSBuZWVkZWQgZW5oYW5jZW1lbnRzLgoKQnV0IHdlIG1heSBwdXQg
dGhpcyBvbiBvdXIgVE9ETyBwbGFucy4uLgoKPj4gTm90IHRvIG1lbnRpb25pbmcgb3BlcmF0aW5n
IHRoYXQgbWFueSB0aGluIHZvbHVtZXMgZnJvbSBhIHNpbmdsZSB0aGluLXBvb2wKPj4gaXMgYWxz
byBub3RoaW5nIGNsb3NlIHRvIGhpZ2ggcGVyZm9ybWFuY2UgZ29hbCB5b3UgdHJ5IHRvIHJlYWNo
Li4uCj4gV291bGQgeW91IG1pbmQgZXhwbGFpbmluZz8gIE15IHVuZGVyc3RhbmRpbmcsIGFuZCB0
aGUgYmFzaXMgb2YKPiBlc3NlbnRpYWxseSBhbGwgbXkgZmVhdHVyZSByZXF1ZXN0cyBpbiB0aGlz
IGFyZWEsIHdhcyB0aGF0IHZpcnR1YWxseSBhbGwKPiBvZiB0aGUgY29zdCBvZiBMVk0gaXMgdGhl
IHVzZXJzcGFjZSBtZXRhZGF0YSBvcGVyYXRpb25zLCB1ZGV2IHN5bmNpbmcsCj4gYW5kIGRldmlj
ZSBzY2FubmluZy4gIEkgaGF2ZSBiZWVuIGFzc3VtaW5nIHRoYXQgdGhlIGtlcm5lbCBkb2VzIG5v
dCBoYXZlCj4gcGVyZm9ybWFuY2UgcHJvYmxlbXMgd2l0aCBsYXJnZSBudW1iZXJzIG9mIHRoaW4g
dm9sdW1lcy4KCgpUaGUgbWFpbiBpZGVhIGJlaGluZCB0aGUgY29tbWVudCBpcyAtwqAgd2hlbiB0
aGVyZSBpcyBpbmNyZWFzZWQgZGlzayB1c2FnZSAtIAp0aGUgbWFuaXB1bGF0aW9uIHdpdGggdGhp
bi1wb29sIG1ldGFkYXRhIGFuZCBsb2NraW5nIHdpbGwgc29vbiBzdGFydCB0byBiZSBhIApjb25z
aWRlcmFibGUgcGVyZm9ybWFuY2UgcHJvYmxlbS4KClNvIHdoaWxlIGl0J3MgZWFzeSB0byBoYXZl
IGFjdGl2ZcKgIDEwMDAgdGhpbkxWcyBmcm9tIGEgc2luZ2xlIHRoaW4tcG9vbCB0aGF0IAphcmUg
VU5VU0VELCBzaXR1YXRpb24gaXMgZHJhbWF0aWNhbGx5IGRpZmZlcmVudCB3aGVuIHRoZXJlIExW
cyB3b3VsZCBiZSBpbiAKc29tZSBoZWF2eSB1c2UgbG9hZC7CoCBUaGVyZSB5b3Ugc2hvdWxkIGtl
ZXAgdGhlIGFjdGl2ZSB0aGluTFYgYXQgbG93IG51bWJlciAKb2bCoCB0ZW5zwqAgTFZzLCBlc3Bl
Y2lhbGx5IGlmIHlvdSBhcmUgcGVyZm9ybWFuY2Ugb3JpZW50ZWQuwqAgVGhlIGxpZ2h0ZXIgdXNh
Z2UgCmFuZCBsZXNzIHByb3Zpc2lvbmluZyBhbmQgZXNwZWNpYWxseSBiaWdnZXIgYmxvY2sgc2l6
ZSAtIGltcHJvdmUKCgo+Cj4gUmlnaHQgbm93LCBteSBtYWNoaW5lIGhhcyAzMzQgYWN0aXZlIHRo
aW4gdm9sdW1lcywgc3BsaXQgYmV0d2VlbiBvbmUKPiBwb29sIG9uIGFuIE5WTWUgZHJpdmUgYW5k
IG9uZSBvbiBhIHNwaW5uaW5nIGhhcmQgZHJpdmUuICBUaGUgcG9vbCBvbiBhbgo+IE5WTWUgZHJp
dmUgaGFzIDMxMiBhY3RpdmUgdGhpbiB2b2x1bWVzLCBvZiB3aGljaCBJIGJlbGlldmUgNjQgYXJl
IGluIHVzZS4KPiBBcmUgdGhlc2UgbnVtYmVycyBoaWdoIGVub3VnaCB0byBjYXVzZSBzaWduaWZp
Y2FudCBwZXJmb3JtYW5jZQo+IHBlbmFsdGllcyBmb3IgZG0tdGhpbiB2MSwgYW5kIHdvdWxkIHRo
ZXkgY2F1c2UgcHJvYmxlbXMgZm9yIGRtLXRoaW4gdjI/CgpUaGVyZSBhcmUgbm90IHlldCBhbnkg
bnVtYmVycyBmb3IgdjIKCkZvciB2MSAtIDY0IHRoaW5zIG1pZ2h0IGV2ZW50dWFsbHkgZXhwZXJp
ZW5jZSBzb21lIGNvbmdlc3Rpb24gZm9yIGhlYXZ5IGxvYWQgCihjb21wYXJlZCB3aXRoICduYXRp
dmUnIHJhdyBzcGluZGxlKS4KCj4gSG93IG11Y2ggb2YgYSBwZXJmb3JtYW5jZSB3aW4gY2FuIEkg
ZXhwZWN0IGZyb20gb25seSBhY3RpdmF0aW5nIHRoZQo+IHN1YnNldCBvZiB2b2x1bWVzIEkgYWN0
dWFsbHkgdXNlPwoKCkkgY2FuIG9ubHkgYWR2aWNlIGJlbmNobWFyayB3aXRoIHNvbWUgZ29vZCBh
cHByb3hpbWF0aW9uIG9mIHlvdXIgZXhwZWN0ZWQgCndvcmtsb2FkLgoKSW4gc29tZSBjYXNlcyBp
dCBtYXkgYXBwZWFyIHlvdXIgd29ya2xvYWQgaXMgbm90IHRvbyBzZW5zaXRpdmUgdG8gdmFyaW91
cyAKbG9ja2luZyBsaW1pdGF0aW9ucy4KCgpSZWdhcmRzCgoKWmRlbmVrCgoKLS0KZG0tZGV2ZWwg
bWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbAo=

