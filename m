Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F7A9F36
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 12:04:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD1F78980E5;
	Thu,  5 Sep 2019 10:04:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04DDC60126;
	Thu,  5 Sep 2019 10:04:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F9CC18089C8;
	Thu,  5 Sep 2019 10:04:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x85A4Wme027268 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 06:04:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16B1219C77; Thu,  5 Sep 2019 10:04:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 864C019C6A;
	Thu,  5 Sep 2019 10:04:27 +0000 (UTC)
Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3658C18F3500;
	Thu,  5 Sep 2019 10:04:24 +0000 (UTC)
Received: from DAG2EX09-IDC.srv.huawei-3com.com ([10.8.0.72])
	by h3cspam01-ex.h3c.com with ESMTPS id x85A3tHI034280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Sep 2019 18:03:56 +0800 (GMT-8)
	(envelope-from wu.chongyun@h3c.com)
Received: from DAG2EX01-BASE.srv.huawei-3com.com (10.8.0.64) by
	DAG2EX09-IDC.srv.huawei-3com.com (10.8.0.72) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 5 Sep 2019 18:03:57 +0800
Received: from DAG2EX01-BASE.srv.huawei-3com.com ([::1]) by
	DAG2EX01-BASE.srv.huawei-3com.com ([fe80::64d2:2654:b7b6:3653%6]) with
	mapi id 15.01.1713.004; Thu, 5 Sep 2019 18:03:57 +0800
From: Chongyun Wu <wu.chongyun@h3c.com>
To: Martin Wilck <Martin.Wilck@suse.com>, "bmarzins@redhat.com"
	<bmarzins@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [dm-devel] [PATCH] libmultipath:  multipath active paths count
	optimization
Thread-Index: AdVhNnQW1jI2k62vQWmrQDfZZyGCMACQyzgAABNEg+A=
Date: Thu, 5 Sep 2019 10:03:57 +0000
Message-ID: <5c5907c12623406c8d2da30bf31a180e@h3c.com>
References: <413f046d0cfc4d5dbd39ebed92068c8b@h3c.com>
	<e33a9aefa073e1d9c107dce12c32608afc50090e.camel@suse.com>
In-Reply-To: <e33a9aefa073e1d9c107dce12c32608afc50090e.camel@suse.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.125.108.109]
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam01-ex.h3c.com x85A3tHI034280
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Thu, 05 Sep 2019 10:04:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Thu, 05 Sep 2019 10:04:25 +0000 (UTC) for IP:'60.191.123.56'
	DOMAIN:'smtp.h3c.com' HELO:'h3cspam01-ex.h3c.com'
	FROM:'wu.chongyun@h3c.com' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 60.191.123.56 smtp.h3c.com 60.191.123.56
	smtp.h3c.com <wu.chongyun@h3c.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x85A4Wme027268
X-loop: dm-devel@redhat.com
Cc: Liucong <liu.cong@h3c.com>, Zhangcheng <zhang.chengA@h3c.com>,
	Guozhonghua <guozhonghua@h3c.com>,
	Zhangduan <zhang.duan@h3c.com>, Liliang <li.liangA@h3c.com>,
	Changlimin <changlimin@h3c.com>, Renqinwei <ren.qinwei@h3c.com>,
	Wangxibo <wang.xibo@h3c.com>, Likai <li.kai4@h3c.com>,
	Zhangguanghui <zhang.guanghui@h3c.com>,
	Wangyong <wang.yongD@h3c.com>, Huangyong <huang.yongA@h3c.com>
Subject: [dm-devel] =?utf-8?b?562U5aSNOiAgW1BBVENIXSBsaWJtdWx0aXBhdGg6ICBt?=
 =?utf-8?q?ultipath_active_paths_count_optimization?=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Thu, 05 Sep 2019 10:04:45 +0000 (UTC)

SGkgTWFydGluLAoKVGhhbmtzIGEgbG90LiAKSSB0aGluayBwYXRjaCBlMjI0ZDU3ICJsaWJtdXRp
cGF0aDogY29udGludWUgdG8gdXNlIG9sZCBzdGF0ZSBvbiBQQVRIX1BFTkRJTkciIG1pZ2h0IGZp
eCBvdXIgaXNzdWUgY29tcGFyZSB0byBvdXIgc3lzbG9nIG91dHB1dCwgSSB3aWxsIGNoZXJyeS1w
aWNrIGl0LiAKQW5kIGFsc28gbmVlZCBjaGVycnktcGljayA5YjcxNWJmICJtdWx0aXBhdGhkOiBG
aXggbWlzY291bnRpbmcgYWN0aXZlIHBhdGhzIiBmb3IgZ29vZC4KClJlZ2FyZHMKQ2hvbmd5dW4g
V3UKCi0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0K5Y+R5Lu25Lq6OiBNYXJ0aW4gV2lsY2sgW21haWx0
bzpNYXJ0aW4uV2lsY2tAc3VzZS5jb21dIArlj5HpgIHml7bpl7Q6IDIwMTnlubQ55pyINeaXpSAx
NTozNwrmlLbku7bkuro6IGJtYXJ6aW5zQHJlZGhhdC5jb207IGRtLWRldmVsQHJlZGhhdC5jb207
IHd1Y2hvbmd5dW4gKENsb3VkKSA8d3UuY2hvbmd5dW5AaDNjLmNvbT4K5oqE6YCBOiBndW96aG9u
Z2h1YSAoQ2xvdWQpIDxndW96aG9uZ2h1YUBoM2MuY29tPjsgbGlrYWkgKENsb3VkKSA8bGkua2Fp
NEBoM2MuY29tPjsgcmVucWlud2VpIChDbG91ZCkgPHJlbi5xaW53ZWlAaDNjLmNvbT47IGxpbGlh
bmcgKENsb3VkKSA8bGkubGlhbmdBQGgzYy5jb20+OyBsaXVjb25nIChDbG91ZCkgPGxpdS5jb25n
QGgzYy5jb20+OyB3YW5neW9uZyAoQ2xvdWQpIDx3YW5nLnlvbmdEQGgzYy5jb20+OyBjaGFuZ2xp
bWluIChDbG91ZCkgPGNoYW5nbGltaW5AaDNjLmNvbT47IHpoYW5nZHVhbiAoQ2xvdWQpIDx6aGFu
Zy5kdWFuQGgzYy5jb20+OyBodWFuZ3lvbmcgKENsb3VkKSA8aHVhbmcueW9uZ0FAaDNjLmNvbT47
IHdhbmd4aWJvIChDbG91ZCkgPHdhbmcueGlib0BoM2MuY29tPjsgemhhbmdndWFuZ2h1aSAoQ2xv
dWQpIDx6aGFuZy5ndWFuZ2h1aUBoM2MuY29tPjsgemhhbmdjaGVuZyAoQ2xvdWQpIDx6aGFuZy5j
aGVuZ0FAaDNjLmNvbT4K5Li76aKYOiBSZTogW2RtLWRldmVsXSBbUEFUQ0hdIGxpYm11bHRpcGF0
aDogbXVsdGlwYXRoIGFjdGl2ZSBwYXRocyBjb3VudCBvcHRpbWl6YXRpb24KCkhpIENob25neXVu
LAoKT24gVGh1LCAyMDE5LTA5LTA1IGF0IDAyOjU4ICswMDAwLCBDaG9uZ3l1biBXdSB3cm90ZToK
PiBIaSBNYXJ0aW4sIEJlbiBhbmQgb3RoZXIgdmlld2Vycwo+IAo+IENsb3VkIHlvdSBoZWxwIHRv
IHZpZXcgYmVsb3cgcGF0Y2ggd2hpY2ggdHJ5IHRvIGRlYWwgd2l0aCBhIG11bHRpcGF0aCAKPiBh
Y3RpdmUgcGF0aHMgY291bnQgbm90IHJpZ2h0IGlzc3VlLCB0aGFua3MgYSBsb3QuCj4gCj4gRnJv
bSBkZWVlNzE5NmVjZTQzYjAxYjhlZTYzNWU2MGNlNDY1MDgwOTA1YjVlIE1vbiBTZXAgMTcgMDA6
MDA6MDAKPiAyMDAxCj4gRnJvbTogQ2hvbmd5dW4gV3UgPHd1LmNob25neXVuQGgzYy5jb20+Cj4g
RGF0ZTogVHVlLCAyNyBBdWcgMjAxOSAxMzo1ODozMyArMDgwMAo+IFN1YmplY3Q6IFtQQVRDSF0g
bGlibXVsdGlwYXRoOiAgbXVsdGlwYXRoIGFjdGl2ZSBwYXRocyBjb3VudCAKPiBvcHRpbWl6YXRp
b24KPiAKPiBSZWFsbHkgY291bnQgbXVsdGlwYXRoIGFjdGl2ZSBwYXRocyBub3QgdXNlIG1wcC0+
bnJfYWN0aXZlKysgb3IgCj4gbXBwLT5ucl9hY3RpdmUtLSwgYmVjYXVzZSB0aGVyZSBhcmUgb3Ro
ZXIgcGxhY2VzIG1pZ2h0IGNhbGwgcGF0aGluZm8gCj4gdG8gY2hhbmdlIHBhdGggc3RhdGUgbm90
IG9ubHkgaW4gY2hlY2tfcGF0aCwgaWYgb3RoZXIgcGxhY2VzIGRldGVjdCAKPiBhbmQgY2hhbmdl
ZCBwYXRoIHN0YXRlIGJ1dCBub3QgZG8gbXBwLT5ucl9hY3RpdmUrKyBvciAKPiBtcHAtPm5yX2Fj
dGl2ZS0tLCB0aGUgYWN0aXZlIHBhdGhzIG1pZ2h0IG5vdCByaWdodCBhbnkgbW9yZS4KPiAKPiBX
ZSBtZWV0IGFuIGlzc3VlIHdoaWNoIGFjdHVhbGx5IGhhdmUgdGhyZWUgcGF0aHMgYnV0IGFmdGVy
IGFsbCBwYXRocyAKPiBkb3duIHN5c2xvZyByZXBvcnQgaGF2ZSB0aHJlZSBwYXRocyByZW1haW5p
bmcgc28gbXVsdGlwYXRoZCBub3Qgc2VuZCAKPiBkaXNhYmxlIHF1ZXVlaW5nIHRvIGRtIGFuZCB0
aGlzIGRtIGRldmljZSBiZWVuIGJsb2NrZWQuCj4gVGhpcyBwYXRjaCBtaWdodCBmaXggdGhpcyBp
c3N1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaG9uZ3l1biBXdSA8d3UuY2hvbmd5dW5AaDNjLmNv
bT4KPiAtLS0KPiAgbGlibXVsdGlwYXRoL3N0cnVjdHNfdmVjLmMgfCA4ICsrKysrKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgoKVGhhbmtzIGEg
bG90IGZvciB5b3VyIHBhdGNoLiBXZSd2ZSBkaXNjdXNzZWQgdGhpcyBwcmV2aW91c2x5LCBhbmQg
aW4gZ2VuZXJhbCwgdGhlcmUncyBsaXR0bGUgcmVhc29uIG5vdCB0byBkbyBpdCAtIHBhdGhjb3Vu
dCgpIGlzIGZhc3QsIGFuZCBjb3VsZCBiZSBtYWRlIGV2ZW4gZmFzdGVyLiBCdXQgaWYgd2UgZG8s
IHdlIHNob3VsZCBkaXRjaCB0aGUgbnJfYWN0aXZlIGZpZWxkIGFsdG9nZXRoZXIgLSBubyBuZWVk
IHRvIGNhcnJ5IGl0IGFyb3VuZCBpZiB3ZSByZS1jYWxjdWxhdGUgaXQgYW55d2F5IHdoZW4gd2Ug
bmVlZCBpdC4KCkhvd2V2ZXIsIGl0IHdvcnJpZXMgbWUgYSBiaXQgdGhhdCBucl9hY3RpdmUgbWF5
IGdvIHdyb25nLiBCb3RoIEJlbiBhbmQgSSBoYXZlIHJldmlld2VkIHRoZSBjb2RlIGFuZCB3ZSB0
aG91Z2h0IHRoZSBucl9hY3RpdmUgdHJhY2tpbmcgd2FzIGNvcnJlY3QuIFNvbWV0aGluZyBzZWVt
cyB0byBoYXBwZW4gaW4gb3VyIGNvZGUgdGhhdCB3ZSBkb24ndCB1bmRlcnN0YW5kLgoKIC0gY2Fu
IHlvdSBwbGVhc2UgY29uZmlybSB0aGF0IHlvdSBhcmUgdXNpbmcgdGhlIGxhdGVzdCBjb2RlLCBj
b250YWluaW5nIGUyMjRkNTcgImxpYm11dGlwYXRoOiBjb250aW51ZSB0byB1c2Ugb2xkIHN0YXRl
IG9uIFBBVEhfUEVORElORyIsIDliNzE1YmYgIm11bHRpcGF0aGQ6IEZpeCBtaXNjb3VudGluZyBh
Y3RpdmUgcGF0aHMiIGFuZCAoaW4gY2FzZSB5b3UncmUgdXNpbmcgdGhlIG1hcmdpbmFsX3BhdGhz
IG9wdGlvbnMpIGFsc28gN2Q0YjQwZiBhbmQKMDU4ZGY3NyA/CgogLSBJZiB5b3UgaGF2ZSBhIHJl
bGlhYmxlIHJlcHJvZHVjZXIsIHdvdWxkIHlvdSBtaW5kIGFkZGluZyBsb2cgbWVzc2FnZXMgdG8g
dGhlIGNvZGUgeW91IGp1c3Qgc3VibWl0dGVkLCBzbyB0aGF0IHdlIGNhbiBvYnNlcnZlIGhvdyBu
cl9hY3RpdmUgZXZvbHZlcyBpbiB0aW1lLCBhbmQgcGVyaGFwcyB1bmRlcnN0YW5kIHdoeSBpdCdz
IGdvaW5nIHdyb25nPwoKUmVnYXJkcwpNYXJ0aW4KCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGlu
Zm8vZG0tZGV2ZWw=
