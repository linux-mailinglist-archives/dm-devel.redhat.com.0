Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 164B3278DB5
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 18:10:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-fPKUeFo_OliO4r2uItB9gg-1; Fri, 25 Sep 2020 12:10:39 -0400
X-MC-Unique: fPKUeFo_OliO4r2uItB9gg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59552EA321;
	Fri, 25 Sep 2020 16:10:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 082CD10013C1;
	Fri, 25 Sep 2020 16:10:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 856E81826D2B;
	Fri, 25 Sep 2020 16:10:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PGAN7p027806 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 12:10:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFBCA2028DCC; Fri, 25 Sep 2020 16:10:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D98B72026F94
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 16:10:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B748858296
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 16:10:20 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-496-4D388_7qN7u6DaILijhhQA-1; Fri, 25 Sep 2020 12:10:14 -0400
X-MC-Unique: 4D388_7qN7u6DaILijhhQA-1
Received: by mail-pg1-f176.google.com with SMTP id 197so2980349pge.8
	for <dm-devel@redhat.com>; Fri, 25 Sep 2020 09:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=2u9sPn2IhPEqtARC+c1HVZNhd+IPCwE7CcpXSjbuukw=;
	b=O9Av2QEaErfXLZcixJatoag7g07MuHPoEEXqgDq0YAzLElA75p6MBy7pIwEyt7hROj
	8ob+FHXf9B561Y6wpWgw67gvTWpsSqV3F7FGt6/CZat4Oc2U9fJFk8lJooQ5ViUptkgq
	Mk2iiAGePw9oiQRzm3MeKK5wPIGxQTUz190q9w26/XALBmuR6kh+mt7OvdNTtuOCAnbi
	MEyAPxAjVkjQIiMJHekycWcFXBvyWsIlPtMvA41O7o3SRTcKDJe+vjHDf+OrqNAaEb/B
	arx9pJtIaD9ZTP/IoKp9xciUXQ+fuz5THvUuCVR8b2U1txWhrta8txby4cVHNyk/XXhe
	+YCQ==
X-Gm-Message-State: AOAM531mGppw0VDnhyFrI8Hzk1807JMH4YD00R8C5OvCTptSELUb8Tew
	cLmNbPnELCW/1Kx/gDoo59ETfRZ9XhBeS2he
X-Google-Smtp-Source: ABdhPJy+gEuXTNt9jBrhZQ58/qaLOsuepbB/3ml+cnYulmo+nCVkAd9tTlvB0e72E5DLglcTBJtMzA==
X-Received: by 2002:a05:6a00:1506:b029:142:2501:3971 with SMTP id
	q6-20020a056a001506b029014225013971mr21745pfu.54.1601050212843; 
	Fri, 25 Sep 2020 09:10:12 -0700 (PDT)
Received: from localhost.localdomain ([192.30.189.3])
	by smtp.gmail.com with ESMTPSA id
	ih11sm2368358pjb.51.2020.09.25.09.10.11
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Sep 2020 09:10:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.0.3.2.33\))
From: Brian Bunker <brian@purestorage.com>
In-Reply-To: <495bf574-1f2f-a281-96e5-c7631b0f07f0@linux.ibm.com>
Date: Fri, 25 Sep 2020 09:10:10 -0700
Message-Id: <6D530ACA-1C7F-4AA4-BD18-9DD7B429920B@purestorage.com>
References: <04F146B1-3EB2-42C0-87EA-E0EABC3D8020@purestorage.com>
	<495bf574-1f2f-a281-96e5-c7631b0f07f0@linux.ibm.com>
To: Steffen Maier <maier@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08PGAN7p027806
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] Make LUNs higher than 255 more friendly to look at
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBhbSBub3Qgc3VnZ2VzdGluZyBjaGFuZ2luZyB0aGUgdGhlIExVTiB2YWx1ZSBpdHNlbGYsIG9u
bHkgdG8gcHJpbnQgaXQgaW4gYSB3YXkgdGhhdCBtYWtlIG1vcmUgc2Vuc2Ugd2l0aAp3aGF0IHRo
ZSB1c2VyIHdvdWxkIGV4cGVjdC4gSSBhbSBvcGVuIHRvIHNoYXJwZW5pbmcgdGhlIGNoZWNrIGlm
IHlvdSBhcmUgd29ycmllZCBhYm91dCBMVU4gYWRkcmVzc2luZwpkaWZmZXJlbnQgdGhhbiBwZXJp
cGhlcmFsIGFuZCBmbGF0LCBidXQgSSB0aGluayB0aGF0IHRoaXMgaXMgYXJndWFibHkgYmV0dGVy
IHRoYW4gd2hhdCBzaG93cyB3aXRob3V0IGl0LgoKSGVyZSBpcyBhbiBleGFtcGxlLCB0aGUgdXNl
ciBoYXMgY29ubmVjdGVkIExVTnMgdXAgdG8gMjU2LiBJIGFtIGluY2x1ZGluZyBqdXN0IExVTnMg
MjU1IGFuZCAyNTYgdG8Kc2hvdyB3aGF0IEkgbWVhbjoKCnJvb3RAYzEwNi0xOC1jdDA6fiMgcHVy
ZXZvbCBjb25uZWN0IHRhcmdldDEgLS1ob3N0IGluaXQxMDYtMTggLS1sdW4gMjU1Ck5hbWUgICAg
IEhvc3QgR3JvdXAgIEhvc3QgICAgICAgIExVTgp0YXJnZXQxICAtICAgICAgICAgICAgICAgICAg
ICAgaW5pdDEwNi0xOCAgMjU1CnJvb3RAYzEwNi0xOC1jdDA6fiMgcHVyZXZvbCBjb25uZWN0IHZh
bGlkYXRpb24xIC0taG9zdCBpbml0MTA2LTE4IC0tbHVuIDI1NgpOYW1lICAgICAgICAgSG9zdCBH
cm91cCAgSG9zdCAgICAgICAgTFVOCnZhbGlkYXRpb24xICAtICAgICAgICAgICAgICAgICAgIGlu
aXQxMDYtMTggIDI1NgoKV2hhdCBkb2VzIG11bHRpcGF0aCAtbGwgc2hvdz8KCltyb290QGluaXQx
MDYtMTggbXVsdGlwYXRoLXRvb2xzLTAuOC4zXSMgbXVsdGlwYXRoIC1sbAozNjI0YTkzNzAzODVl
NmNkYTY3NjQ5M2Y5MDAwMTEwMTQgZG0tMCBQVVJFLEZsYXNoQXJyYXkKc2l6ZT01MDBHIGZlYXR1
cmVzPScwJyBod2hhbmRsZXI9JzEgYWx1YScgd3A9cncKYC0rLSBwb2xpY3k9J3NlcnZpY2UtdGlt
ZSAwJyBwcmlvPTUwIHN0YXR1cz1hY3RpdmUKICB8LSA2OjA6MDoyNTUgICBzZGQgODo0OCAgYWN0
aXZlIHJlYWR5IHJ1bm5pbmcKICB8LSA3OjA6MDoyNTUgICBzZGcgODo5NiAgYWN0aXZlIHJlYWR5
IHJ1bm5pbmcKICB8LSA4OjA6MDoyNTUgICBzZGIgODoxNiAgYWN0aXZlIHJlYWR5IHJ1bm5pbmcK
ICBgLSA5OjA6MDoyNTUgICBzZGMgODozMiAgYWN0aXZlIHJlYWR5IHJ1bm5pbmcKMzYyNGE5Mzcw
Mzg1ZTZjZGE2NzY0OTNmOTAwMDExMDEzIGRtLTEgUFVSRSxGbGFzaEFycmF5CnNpemU9NTAwRyBm
ZWF0dXJlcz0nMCcgaHdoYW5kbGVyPScxIGFsdWEnIHdwPXJ3CmAtKy0gcG9saWN5PSdzZXJ2aWNl
LXRpbWUgMCcgcHJpbz01MCBzdGF0dXM9YWN0aXZlCiAgfC0gNjowOjA6MTY2NDAgc2RlIDg6NjQg
IGFjdGl2ZSByZWFkeSBydW5uaW5nCiAgfC0gNzowOjA6MTY2NDAgc2RoIDg6MTEyIGFjdGl2ZSBy
ZWFkeSBydW5uaW5nCiAgfC0gODowOjA6MTY2NDAgc2RpIDg6MTI4IGFjdGl2ZSByZWFkeSBydW5u
aW5nCiAgYC0gOTowOjA6MTY2NDAgc2RqIDg6MTQ0IGFjdGl2ZSByZWFkeSBydW5uaW5nCgpTbyB3
aGF0IHlvdSBjYW4gc2VlIGlzIHRoYXQgaXQgaXMgYWxyZWFkeSBjb25mdXNpbmcgdG8gdGhlIHVz
ZXIuIFRoZSBmaXJzdCAyNTUgTFVOcyBhcmUgaW4gcGVyaXBoZXJhbAphZGRyZXNzaW5nIG1vZGUg
YnV0IHdoZW4geW91IGdldCB0byBMVU4gMjU2IHRoZW4gaXQgbW92ZXMgaW50byBmbGF0IGFkZHJl
c3Mgc3BhY2UuIFdoYXQgSSBleHBlY3QgdGhlCnVzZXIgd291bGQgZXhwZWN0IGlmIHRoZXkgZGlk
buKAmXQgdW5kZXJzdGFuZCB0aGUgc2hpZnQgd291bGQgYmUgMjU1IGFuZCAyNTYuCgpNeSBjaGFu
Z2UgbWFrZXMgdGhpcyBpbnRvOgpbcm9vdEBpbml0MTA2LTE4IG11bHRpcGF0aC10b29scy0wLjgu
M10jIG11bHRpcGF0aCAtbGwKMzYyNGE5MzcwMzg1ZTZjZGE2NzY0OTNmOTAwMDExMDE0IGRtLTAg
UFVSRSxGbGFzaEFycmF5CnNpemU9NTAwRyBmZWF0dXJlcz0nMCcgaHdoYW5kbGVyPScxIGFsdWEn
IHdwPXJ3CmAtKy0gcG9saWN5PSdzZXJ2aWNlLXRpbWUgMCcgcHJpbz01MCBzdGF0dXM9YWN0aXZl
CiAgfC0gNjowOjA6MjU1IHNkZCA4OjQ4ICBhY3RpdmUgcmVhZHkgcnVubmluZwogIHwtIDc6MDow
OjI1NSBzZGcgODo5NiAgYWN0aXZlIHJlYWR5IHJ1bm5pbmcKICB8LSA4OjA6MDoyNTUgc2RiIDg6
MTYgIGFjdGl2ZSByZWFkeSBydW5uaW5nCiAgYC0gOTowOjA6MjU1IHNkYyA4OjMyICBhY3RpdmUg
cmVhZHkgcnVubmluZwozNjI0YTkzNzAzODVlNmNkYTY3NjQ5M2Y5MDAwMTEwMTMgZG0tMSBQVVJF
LEZsYXNoQXJyYXkKc2l6ZT01MDBHIGZlYXR1cmVzPScwJyBod2hhbmRsZXI9JzEgYWx1YScgd3A9
cncKYC0rLSBwb2xpY3k9J3NlcnZpY2UtdGltZSAwJyBwcmlvPTUwIHN0YXR1cz1hY3RpdmUKICB8
LSA2OjA6MDoyNTYgc2RlIDg6NjQgIGFjdGl2ZSByZWFkeSBydW5uaW5nCiAgfC0gNzowOjA6MjU2
IHNkaCA4OjExMiBhY3RpdmUgcmVhZHkgcnVubmluZwogIHwtIDg6MDowOjI1NiBzZGkgODoxMjgg
YWN0aXZlIHJlYWR5IHJ1bm5pbmcKICBgLSA5OjA6MDoyNTYgc2RqIDg6MTQ0IGFjdGl2ZSByZWFk
eSBydW5uaW5nCgpUaGFua3MsCkJyaWFuCgpCcmlhbiBCdW5rZXIKU1cgRW5nCmJyaWFuQHB1cmVz
dG9yYWdlLmNvbQoKCgo+IE9uIFNlcCAyNSwgMjAyMCwgYXQgNzoxNCBBTSwgU3RlZmZlbiBNYWll
ciA8bWFpZXJAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4gCj4gSGkgQnJpYW4sCj4gCj4gT24gOS8y
NC8yMCAxMToxMCBQTSwgQnJpYW4gQnVua2VyIHdyb3RlOgo+PiBGb3IgTFVOcyBiZXR3ZWVuIDAg
YW5kIDI1NSBwZXJpcGhlcmFsIGFkZHJlc3NpbmcgaXMgdXNlZC4gRm9yIExVTnMgaGlnaGVyIHRo
YW4gMjU1IHRoZSBMVU4gYWRkcmVzc2luZwo+PiBzaG91bGQgc3dpdGNoIHRvIGZsYXQgYWNjb3Jk
aW5nIHRvIHRoZSBzcGVjaWZpY2F0aW9uLiBJbnN0ZWFkIG9mIHByaW50aW5nIG91dCB0aGUgTFVO
IG51bWJlciB3aXRob3V0IHJlZ2FyZCB0bwo+PiB0aGUgc2hpZnRpbmcgb2YgYWRkcmVzcyBtZXRo
b2QsIGRpc3BsYXkgdGhlIExVTiBhcyBpdCB3YXMgaW50ZW5kZWQgdG8gYmUgdGhlIHVzZXIgY29u
bmVjdGluZyB0aGUgTFVOLiBUaGUKPj4gY3VycmVudCBkaXNwbGF5IGxlYXZlcyBhIG5vbi1vYnZp
b3VzIDE2Mzg0IG9mZnNldC4KPj4gSW4gc2hvcnQsIGEgTFVOIGNvbm5lY3RlZCBhcyAyNTggd2ls
bCBzaG93IHVwIGluIG11bHRpcGF0aCBvdXRwdXQgYXMgMTY2NDIuIEluc3RlYWQgZGlzcGxheSBp
dCBhcyB0aGUKPj4gZXhwZWN0ZWQgMjU4LiBUaGlzIGlzIGZvciBkaXNwbGF5IG9ubHkgYW5kIGRv
ZXNu4oCZdCBjaGFuZ2UgdGhlIGFjdHVhbCBjb250ZW50cyBvZiB0aGUgTFVOIHZhcmlhYmxlLgo+
PiBTaWduZWQtb2ZmLWJ5OiBCcmlhbiBCdW5rZXIgPGJyaWFuQHB1cmVzdG9yYWdlLmNvbT4KPj4g
X19fCj4+IC0tLSBhL2xpYm11bHRpcGF0aC9wcmludC5jICAgICAgMjAyMC0wOS0yNCAxMzo1Mjox
OC42NjE4MjgwMTEgLTA2MDAKPj4gKysrIGIvbGlibXVsdGlwYXRoL3ByaW50LmMgICAgICAyMDIw
LTA5LTI0IDE0OjI4OjI3LjYwMzU0MjMwMyAtMDYwMAo+PiBAQCAtMzk0LDcgKzM5NCw3IEBACj4+
ICAgICAgICAgICAgICAgICAgICAgICAgIHBwLT5zZ19pZC5ob3N0X25vLAo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICBwcC0+c2dfaWQuY2hhbm5lbCwKPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgcHAtPnNnX2lkLnNjc2lfaWQsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHBwLT5zZ19p
ZC5sdW4pOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAocHAtPnNnX2lkLmx1biAmIDB4NDAw
MCkgPyBwcC0+c2dfaWQubHVuIC0gMHg0MDAwIDogcHAtPnNnX2lkLmx1bik7Cj4+ICB9Cj4+ICBz
dGF0aWMgaW50Cj4gCj4gRm9yIExpbnV4IFNDU0kgZGV2aWNlcywgYW5kIGlmIEkgdW5kZXJzdG9v
ZCB0aGUgY29kZSBjb3JyZWN0bHkgW2xpYm11bHRpcGF0aC9kaXNjb3ZlcnkuYzpzY3NpX3N5c2Zz
X3BhdGhpbmZvKCldLCB0aGlzIHNlZW1zIHRoZSBTQ1NJIExVTiB2YWx1ZSBiZWluZyBwYXJ0IG9m
IHRoZSBTQ1NJIGRldmljZSBuYW1lIGluIGl0cyBIOkM6VDpMIGZvcm1hdC4gQUZBSUssIExpbnV4
IGludGVudGlvbmFsbHkgdHJlYXRzIHRoaXMgYXMgYW4gb3BhcXVlIDY0LWJpdCB2YWx1ZSB0byBy
ZWZsZWN0IGEgVDEwIFNBTSBMVU4gW2FzIGRlY2ltYWwgbnVtYmVyIHdpdGggcmV2ZXJzZWQgTFVO
IGxldmVscywgdGhvdWdoLCBzbyBhIHBlcmlwaGVyYWwgYWRkcmVzc2luZyBMVU4gaGFwcGVucyB0
byBsb29rIGxpa2UgYSBzbWFsbCBpbnRlZ2VyIHZhbHVlXS4gVGhpcyB3YXksIGl0IGFsd2F5cyB3
b3JrcyB3aXRoIGFueSAoY3VycmVudCBvciBmdXR1cmUpIExVTiBmb3JtYXQgYW5kIGl0cyBwb3Rl
bnRpYWxseSBkaWZmZXJlbnQgTFVOIGZvcm1hdCBmaWVsZHMvcGFydHMuCj4gCj4gVXNlcnMgbWF5
IHVzZSB0aGUgaGNpbCBvdXRwdXQgdG8gZmluZCB0aGUgY29ycmVzcG9uZGluZyBMaW51eCBTQ1NJ
IGRldmljZSBieSBpdHMgbmFtZS4gV291bGQgdGhpcyBzdGlsbCB3b3JrIGlmIHRoZSBvdXRwdXQg
dmFsdWUgd2FzIG1vZGlmaWVkPwo+IAo+IEFsc28sIHNvbWUgKEZDUC1hdHRhY2hlZCBTQ1NJKSBz
dG9yYWdlcyBpbiBwYXJ0aWN1bGFyIGNhc2VzIHVzZSBMVU4gZm9ybWF0IGZpZWxkcyBpbiBhZGRp
dGlvbiB0byAiLi4uIExVTiIgdG8gY29kZSBhIGxhcmdlciBzb21ld2hhdCBvcGFxdWUgNjQtYml0
IFQxMCBTQU0gTFVOIHZhbHVlLiBGb3IgaW5zdGFuY2UgIkJVUyBJREVOVElGSUVSIiB3aXRoIHBl
cmlwaGVyYWwgYWRkcmVzc2luZywgb3IgYSBub24temVybyAybmQgbGV2ZWwgd2l0aCBmbGF0IHNw
YWNlIGFkZHJlc3NpbmcuIEFib3ZlIGNvbnZlcnNpb24gc2VlbXMgdG8gYXQgbGVhc3QgcmVzdWx0
IGluIHVuZXhwZWN0ZWQgdmFsdWVzLgo+IAo+ICgoTm90IHN1cmUgZm9yIHRoaXMgY2FzZSwgYXMg
TlZNZSBtaWdodCB1c2UgaXRzIG93biBwcmludCBvdXRwdXQgY29kZSBpbiBsaWJtdWx0aXBhdGgv
Zm9yZWlnbi9udm1lLmM6IG52bWVfc3lzZnNfcGF0aGluZm8oKSBzZWVtcyB0byBiZSBhbm90aGVy
IHVzZXIgYXNzaWduaW5nIGEgbm9uLXplcm8gdmFsdWUgdG8gc2dfaWQubHVuIFtvcmlnaW5hdGlu
ZyBpbiB0aGUgbnNpZCAobmFtZXNwYWNlLUlEPyldLiBBbiB1bmNvbmRpdGlvbmFsIHZhbHVlIGNv
bnZlcnNpb24gaW4gdGhlIG91dHB1dCBwcmludGluZyBjb2RlIHBhdGggYmFzZWQgb24gU0NTSSBr
bm93bGVkZ2UgbWlnaHQgYnJlYWsgb3V0cHV0IG9mIHZhbHVlcyBiZWxvbmdpbmcgdG8gTlZNZSBw
YXRocy4pKQo+IAo+IC0tIAo+IE1pdCBmcmV1bmRsaWNoZW4gR3J1ZXNzZW4gLyBLaW5kIHJlZ2Fy
ZHMKPiBTdGVmZmVuIE1haWVyCj4gCj4gTGludXggb24gSUJNIFogRGV2ZWxvcG1lbnQKPiAKPiBo
dHRwczovL3d3dy5pYm0uY29tL3ByaXZhY3kvdXMvZW4vCj4gSUJNIERldXRzY2hsYW5kIFJlc2Vh
cmNoICYgRGV2ZWxvcG1lbnQgR21iSAo+IFZvcnNpdHplbmRlciBkZXMgQXVmc2ljaHRzcmF0czog
TWF0dGhpYXMgSGFydG1hbm4KPiBHZXNjaGFlZnRzZnVlaHJ1bmc6IERpcmsgV2l0dGtvcHAKPiBT
aXR6IGRlciBHZXNlbGxzY2hhZnQ6IEJvZWJsaW5nZW4KPiBSZWdpc3RlcmdlcmljaHQ6IEFtdHNn
ZXJpY2h0IFN0dXR0Z2FydCwgSFJCIDI0MzI5NAoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApk
bS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kbS1kZXZlbA==

