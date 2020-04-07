Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8221A1C76
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 09:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586330475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BZ3mTJXuWrIgPbNbw22FU5zhqD9OGLt+1l/sPVfrSoY=;
	b=YRA+eKD2dditvrwtLM7S+LRO532WNKykwjHLcj5OE8oImqFrSsX7Xqp7mdKtbjxcwD4nRE
	8uPp427KH7/Tb0iCm63ZGePvL/qeRYsxT9HyEuluNMPvDgi98YHDo5hCD0OBoewdOGjisc
	kO2lPnOI9CZeT7xrMGnuHtkGvdURDSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-0-Zn1gCbM06x99PWKoehFQ-1; Wed, 08 Apr 2020 03:21:13 -0400
X-MC-Unique: 0-Zn1gCbM06x99PWKoehFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 237F2A0CCF;
	Wed,  8 Apr 2020 07:21:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B12A60BFB;
	Wed,  8 Apr 2020 07:21:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C40A418089C8;
	Wed,  8 Apr 2020 07:20:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037G9fxl027942 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 12:09:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9214810ABC89; Tue,  7 Apr 2020 16:09:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DC8010ABC88
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 16:09:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 035DB8002A0
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 16:09:39 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-455-cT6N2z0jM--WH06WDkxfbA-1; Tue, 07 Apr 2020 12:09:33 -0400
X-MC-Unique: cT6N2z0jM--WH06WDkxfbA-1
Received: by mail-pg1-f194.google.com with SMTP id k191so1924467pgc.13
	for <dm-devel@redhat.com>; Tue, 07 Apr 2020 09:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:date:message-id:references:cc:in-reply-to:to;
	bh=HIeYEWjY9iLocedwaESC/3JzT9JqTWW18TyKK7LlFo0=;
	b=X9hcp7oeO2k/Xsj/ue6x6WOnW+vrY4VhlyVZOXRTQtvuqpMFzV/QreiFuPvFmWOgdL
	kYgiWfh2nQF2OqNkuH4Cq9q2prId0p993Sy1WvDJ5MN1CES2vFxlHYc5IoZcfV4bTfUu
	nbxqLqHV1aypjuFFUwmZAnS2jogtmSdZB+qVanF3aviYr7ib4ocA8dsDljRh+18x1RpG
	DUp4ULz2dG6DscLW5t42wuOBvpofuju/CXqAm+dqVTSDO4cVAddJ7tN/MXrr6U90tiUL
	+fLuO4dYZPYpDvI72jmo4CLiM86MmX5Uonj7v8c80TuO9ek/A1qjOmmb+J6S26PKpKeC
	ROfw==
X-Gm-Message-State: AGi0PuZhM7luGCLqrl4Td3UT6QbqmyvaF1a68/1pc4w5RmD4LmbQ5qZu
	GX3KVy9zbCc6OoIcCbbZbjCazA==
X-Google-Smtp-Source: APiQypITLm2s3Uh+Vl98RIEnmimFYjTaDemspyulatAWPiC2koBxBlFKkhN0zl0/vWOglnAZkOiwGw==
X-Received: by 2002:aa7:9695:: with SMTP id f21mr3288671pfk.93.1586275772707; 
	Tue, 07 Apr 2020 09:09:32 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:1ef2:1546:cd03:cc4:c9fb?
	([2601:646:c200:1ef2:1546:cd03:cc4:c9fb])
	by smtp.gmail.com with ESMTPSA id
	r140sm1175662pfc.137.2020.04.07.09.09.31
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 07 Apr 2020 09:09:31 -0700 (PDT)
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Date: Tue, 7 Apr 2020 09:09:30 -0700
Message-Id: <583AD128-5B10-4414-A35B-FEACF30B7C5A@amacapital.net>
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 037G9fxl027942
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 08 Apr 2020 03:20:33 -0400
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dm-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [dm-devel] [PATCH] memcpy_flushcache: use cache flusing for
	larger lengths
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Cj4gT24gQXByIDcsIDIwMjAsIGF0IDg6MDEgQU0sIE1pa3VsYXMgUGF0b2NrYSA8bXBhdG9ja2FA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4g77u/WyByZXNlbmRpbmcgdGhpcyB0byB4ODYgbWFpbnRh
aW5lcnMgXQo+IAo+IEhpCj4gCj4gSSB0ZXN0ZWQgcGVyZm9ybWFuY2Ugb2YgdmFyaW91cyBtZXRo
b2RzIGhvdyB0byB3cml0ZSB0byBvcHRhbmUtYmFzZWQKPiBwZXJzaXN0ZW50IG1lbW9yeSwgYW5k
IGZvdW5kIG91dCB0aGF0IG5vbi10ZW1wb3JhbCBzdG9yZXMgYWNoaWV2ZSAKPiB0aHJvdWdocHV0
IDEuMyBHQi9zLiA4IGNhY2hlZCBzdG9yZXMgaW1tZWRpYXRlbGx5IGZvbGxvd2VkIGJ5IGNsZmx1
c2hvcHQgCj4gb3IgY2x3YiBhY2hpZXZlIHRocm91Z2hwdXQgMS42IEdCL3MuCj4gCj4gbWVtY3B5
X2ZsdXNoY2FjaGUgdXNlcyBub24tdGVtcG9yYWwgc3RvcmVzLCBJIG1vZGlmaWVkIGl0IHRvIHVz
ZSBjYWNoZWQgCj4gc3RvcmVzICsgY2xmbHVzaG9wdCBhbmQgaXQgaW1wcm92ZWQgcGVyZm9ybWFu
Y2Ugb2YgdGhlIGRtLXdyaXRlY2FjaGUgCj4gdGFyZ2V0IHNpZ25pZmljYW50bHk6Cj4gCj4gZG0t
d3JpdGVjYWNoZSB0aHJvdWdocHV0Ogo+IChkZCBpZj0vZGV2L3plcm8gb2Y9L2Rldi9tYXBwZXIv
d2MgYnM9NjRrIG9mbGFnPWRpcmVjdCkKPiB3cml0ZWNhY2hlIGJsb2NrIHNpemUgICA1MTIgICAg
ICAgICAgICAgMTAyNCAgICAgICAgICAgIDIwNDggICAgICAgICAgICA0MDk2Cj4gbW92bnRpICAg
ICAgICAgICAgICAgICAgNDk2IE1CL3MgICAgICAgIDY0MiBNQi9zICAgICAgICA3MjUgTUIvcyAg
ICAgICAgNzQ0IE1CL3MKPiBjbGZsdXNob3B0ICAgICAgICAgICAgICAzNzMgTUIvcyAgICAgICAg
Njg4IE1CL3MgICAgICAgIDEuMSBHQi9zICAgICAgICAxLjIgR0Ivcwo+IAo+IEZvciBibG9jayBz
aXplIDUxMiwgbW92bnRpIHdvcmtzIGJldHRlciwgZm9yIGxhcmdlciBibG9jayBzaXplcywgCj4g
Y2xmbHVzaG9wdCBpcyBiZXR0ZXIuCj4gCj4gSSB3YXMgYWxzbyB0ZXN0aW5nIHRoZSBub3ZhZnMg
ZmlsZXN5c3RlbSwgaXQgaXMgbm90IHVwc3RyZWFtLCBidXQgaXQgCj4gYmVuZWZpdHRlZCBmcm9t
IHNpbWlsYXIgY2hhbmdlIGluIF9fbWVtY3B5X2ZsdXNoY2FjaGUgYW5kIAo+IF9fY29weV91c2Vy
X25vY2FjaGU6Cj4gd3JpdGUgdGhyb3VnaHB1dCBvbiBiaWcgZmlsZXMgLSBtb3ZudGk6IDY2MiBN
Qi9zLCBjbHdiOiAxMzIzIE1CL3MKPiB3cml0ZSB0aHJvdWdocHV0IG9uIHNtYWxsIGZpbGVzIC0g
bW92bnRpOiA2MjEgTUIvcywgY2x3YjogMTAxMyBNQi9zCj4gCj4gCj4gSSBzdWJtaXQgdGhpcyBw
YXRjaCBmb3IgX19tZW1jcHlfZmx1c2hjYWNoZSB0aGF0IGltcHJvdmVzIGRtLXdyaXRlY2FjaGUg
Cj4gcGVyZm9ybWFuY2UuCj4gCj4gT3RoZXIgaWRlYXMgLSBzaG91bGQgd2UgaW50cm9kdWNlIG1l
bWNweV90b19wbWVtIGluc3RlYWQgb2YgbW9kaWZ5aW5nIAo+IG1lbWNweV9mbHVzaGNhY2hlIGFu
ZCBtb3ZlIHRoaXMgbG9naWMgdGhlcmU/IE9yIHNob3VsZCBJIG1vZGlmeSB0aGUgCj4gZG0td3Jp
dGVjYWNoZSB0YXJnZXQgZGlyZWN0bHkgdG8gdXNlIGNsZmx1c2hvcHQgd2l0aCBubyBjaGFuZ2Ug
dG8gdGhlIAo+IGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBjb2RlPwo+IAo+IE1pa3VsYXMKPiAKPiAK
PiAKPiAKPiBGcm9tOiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRvY2thQHJlZGhhdC5jb20+Cj4gCj4g
SSB0ZXN0ZWQgZG0td3JpdGVjYWNoZSBwZXJmb3JtYW5jZSBvbiBhIG1hY2hpbmUgd2l0aCBPcHRh
bmUgbnZkaW1tIGFuZCBpdAo+IHR1cm5lZCBvdXQgdGhhdCBmb3IgbGFyZ2VyIHdyaXRlcywgY2Fj
aGVkIHN0b3JlcyArIGNhY2hlIGZsdXNoaW5nIHBlcmZvcm0KPiBiZXR0ZXIgdGhhbiBub24tdGVt
cG9yYWwgc3RvcmVzLiBUaGlzIGlzIHRoZSB0aHJvdWdocHV0IG9mIGRtLXdyaXRlY2FjaGUKPiBt
ZWFzdXJlZCB3aXRoIHRoaXMgY29tbWFuZDoKPiBkZCBpZj0vZGV2L3plcm8gb2Y9L2Rldi9tYXBw
ZXIvd2MgYnM9NjQgb2ZsYWc9ZGlyZWN0Cj4gCj4gYmxvY2sgc2l6ZSAgICA1MTIgICAgICAgIDEw
MjQgICAgICAgIDIwNDggICAgICAgIDQwOTYKPiBtb3ZudGkgICAgICAgIDQ5NiBNQi9zICAgIDY0
MiBNQi9zICAgIDcyNSBNQi9zICAgIDc0NCBNQi9zCj4gY2xmbHVzaG9wdCAgICAzNzMgTUIvcyAg
ICA2ODggTUIvcyAgICAxLjEgR0IvcyAgICAxLjIgR0Ivcwo+IAo+IFdlIGNhbiBzZWUgdGhhdCBm
b3Igc21hbGxlciBibG9jaywgbW92bnRpIHBlcmZvcm1zIGJldHRlciwgYnV0IGZvciBsYXJnZXIK
PiBibG9ja3MsIGNsZmx1c2hvcHQgaGFzIGJldHRlciBwZXJmb3JtYW5jZS4KPiAKPiBUaGlzIHBh
dGNoIGNoYW5nZXMgdGhlIGZ1bmN0aW9uIF9fbWVtY3B5X2ZsdXNoY2FjaGUgYWNjb3JkaW5nbHks
IHNvIHRoYXQKPiB3aXRoIHNpemUgPj0gNzY4IGl0IHBlcmZvcm1zIGNhY2hlZCBzdG9yZXMgYW5k
IGNhY2hlIGZsdXNoaW5nLiBOb3RlIHRoYXQKPiB3ZSBtdXN0IG5vdCB1c2UgdGhlIG5ldyBicmFu
Y2ggaWYgdGhlIENQVSBkb2Vzbid0IGhhdmUgY2xmbHVzaG9wdCAtIGluCj4gdGhhdCBjYXNlLCB0
aGUga2VybmVsIHdvdWxkIHVzZSBpbmVmZmljaWVudCAiY2xmbHVzaCIgaW5zdHJ1Y3Rpb24gdGhh
dCBoYXMKPiB2ZXJ5IGJhZCBwZXJmb3JtYW5jZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWt1bGFz
IFBhdG9ja2EgPG1wYXRvY2thQHJlZGhhdC5jb20+Cj4gCj4gLS0tCj4gYXJjaC94ODYvbGliL3Vz
ZXJjb3B5XzY0LmMgfCAgIDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
IDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gCj4gSW5kZXg6IGxpbnV4LTIuNi9h
cmNoL3g4Ni9saWIvdXNlcmNvcHlfNjQuYwo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAtLS0gbGludXgtMi42Lm9y
aWcvYXJjaC94ODYvbGliL3VzZXJjb3B5XzY0LmMgICAgMjAyMC0wMy0yNCAxNToxNTozNi42NDQ5
NDUwOTEgLTA0MDAKPiArKysgbGludXgtMi42L2FyY2gveDg2L2xpYi91c2VyY29weV82NC5jICAg
IDIwMjAtMDMtMzAgMDc6MTc6NTEuNDUwMjkwMDA3IC0wNDAwCj4gQEAgLTE1Miw2ICsxNTIsNDIg
QEAgdm9pZCBfX21lbWNweV9mbHVzaGNhY2hlKHZvaWQgKl9kc3QsIGNvbgo+ICAgICAgICAgICAg
cmV0dXJuOwo+ICAgIH0KPiAKPiArICAgIGlmIChzdGF0aWNfY3B1X2hhcyhYODZfRkVBVFVSRV9D
TEZMVVNIT1BUKSAmJiBzaXplID49IDc2OCAmJiBsaWtlbHkoYm9vdF9jcHVfZGF0YS54ODZfY2xm
bHVzaF9zaXplID09IDY0KSkgewo+ICsgICAgICAgIHdoaWxlICghSVNfQUxJR05FRChkZXN0LCA2
NCkpIHsKPiArICAgICAgICAgICAgYXNtKCJtb3ZxICAgICglMCksICUlcjhcbiIKPiArICAgICAg
ICAgICAgICAgICJtb3ZudGkgICUlcjgsICAgKCUxKVxuIgo+ICsgICAgICAgICAgICAgICAgOjog
InIiIChzb3VyY2UpLCAiciIgKGRlc3QpCj4gKyAgICAgICAgICAgICAgICA6ICJtZW1vcnkiLCAi
cjgiKTsKPiArICAgICAgICAgICAgZGVzdCArPSA4Owo+ICsgICAgICAgICAgICBzb3VyY2UgKz0g
ODsKPiArICAgICAgICAgICAgc2l6ZSAtPSA4Owo+ICsgICAgICAgIH0KPiArICAgICAgICBkbyB7
Cj4gKyAgICAgICAgICAgIGFzbSgibW92cSAgICAoJTApLCAlJXI4XG4iCj4gKyAgICAgICAgICAg
ICAgICAibW92cSAgIDgoJTApLCAlJXI5XG4iCj4gKyAgICAgICAgICAgICAgICAibW92cSAgMTYo
JTApLCAlJXIxMFxuIgo+ICsgICAgICAgICAgICAgICAgIm1vdnEgIDI0KCUwKSwgJSVyMTFcbiIK
PiArICAgICAgICAgICAgICAgICJtb3ZxICAgICUlcjgsICAgKCUxKVxuIgo+ICsgICAgICAgICAg
ICAgICAgIm1vdnEgICAgJSVyOSwgIDgoJTEpXG4iCj4gKyAgICAgICAgICAgICAgICAibW92cSAg
ICUlcjEwLCAxNiglMSlcbiIKPiArICAgICAgICAgICAgICAgICJtb3ZxICAgJSVyMTEsIDI0KCUx
KVxuIgo+ICsgICAgICAgICAgICAgICAgIm1vdnEgIDMyKCUwKSwgJSVyOFxuIgo+ICsgICAgICAg
ICAgICAgICAgIm1vdnEgIDQwKCUwKSwgJSVyOVxuIgo+ICsgICAgICAgICAgICAgICAgIm1vdnEg
IDQ4KCUwKSwgJSVyMTBcbiIKPiArICAgICAgICAgICAgICAgICJtb3ZxICA1NiglMCksICUlcjEx
XG4iCj4gKyAgICAgICAgICAgICAgICAibW92cSAgICAlJXI4LCAzMiglMSlcbiIKPiArICAgICAg
ICAgICAgICAgICJtb3ZxICAgICUlcjksIDQwKCUxKVxuIgo+ICsgICAgICAgICAgICAgICAgIm1v
dnEgICAlJXIxMCwgNDgoJTEpXG4iCj4gKyAgICAgICAgICAgICAgICAibW92cSAgICUlcjExLCA1
NiglMSlcbiIKPiArICAgICAgICAgICAgICAgIDo6ICJyIiAoc291cmNlKSwgInIiIChkZXN0KQo+
ICsgICAgICAgICAgICAgICAgOiAibWVtb3J5IiwgInI4IiwgInI5IiwgInIxMCIsICJyMTEiKTsK
CkRvZXMgdGhpcyBhY3R1YWxseSB3b3JrIGJldHRlciB0aGFuIHRoZSBjb3JyZXNwb25kaW5nIEMg
Y29kZT8KCkFsc28sIHRoYXQgbWVtb3J5IGNsb2JiZXIgcHJvYmFibHkgaXNu4oCZdCBkb2luZyB5
b3VyIGNvZGUgZ2VuZXJhdGlvbiBhbnkgZmF2b3JzLiAgRXhwZXJpbWVudGFsbHksIHlvdSBoYXZl
IHRoZSBjb25zdHJhaW50cyB3cm9uZy4gQW4g4oCccuKAnSBjb25zdHJhaW50IGRvZXNu4oCZdCB0
ZWxsIEdDQyB0aGF0IHlvdSBhcmUgZGVyZWZlcmVuY2luZyB0aGUgcG9pbnRlci4gIFlvdSBuZWVk
IHRvIHVzZSDigJxt4oCdIHdpdGggYSBjb3JyZWN0bHktc2l6ZWQgdHlwZS4gIEJ1dCBJIGJldCBw
bGFpbiBDIGlzIGF0IGxlYXN0IGFzIGdvb2QuCgo+ICsgICAgICAgICAgICBjbGZsdXNob3B0KCh2
b2lkICopZGVzdCk7Cj4gKyAgICAgICAgICAgIGRlc3QgKz0gNjQ7Cj4gKyAgICAgICAgICAgIHNv
dXJjZSArPSA2NDsKPiArICAgICAgICAgICAgc2l6ZSAtPSA2NDsKPiArICAgICAgICB9IHdoaWxl
IChzaXplID49IDY0KTsKPiArICAgIH0KPiArCj4gICAgLyogNHg4IG1vdm50aSBsb29wICovCj4g
ICAgd2hpbGUgKHNpemUgPj0gMzIpIHsKPiAgICAgICAgYXNtKCJtb3ZxICAgICglMCksICUlcjhc
biIKPiAKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRw
czovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

