Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 52AAC2255A2
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 03:54:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-S5bx-3f2M3itbCLMGKEwGg-1; Sun, 19 Jul 2020 21:54:40 -0400
X-MC-Unique: S5bx-3f2M3itbCLMGKEwGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EF7018A1DEC;
	Mon, 20 Jul 2020 01:54:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 043741001B07;
	Mon, 20 Jul 2020 01:54:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E0E29A133;
	Mon, 20 Jul 2020 01:54:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K1r9XN006701 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Jul 2020 21:53:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61E802026D67; Mon, 20 Jul 2020 01:53:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3252026D5D
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 01:53:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B6E685A5B2
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 01:53:07 +0000 (UTC)
Received: from h3cspam02-ex.h3c.com (smtp.h3c.com [60.191.123.50]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-250-LKN8FV1hN22omgO5-DJOCQ-1; Sun, 19 Jul 2020 21:53:01 -0400
X-MC-Unique: LKN8FV1hN22omgO5-DJOCQ-1
Received: from DAG2EX02-BASE.srv.huawei-3com.com ([10.8.0.65])
	by h3cspam02-ex.h3c.com with ESMTPS id 06K1qTuY064232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Jul 2020 09:52:30 +0800 (GMT-8)
	(envelope-from wu.chongyun@h3c.com)
Received: from DAG2EX01-BASE.srv.huawei-3com.com (10.8.0.64) by
	DAG2EX02-BASE.srv.huawei-3com.com (10.8.0.65) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Mon, 20 Jul 2020 09:52:30 +0800
Received: from DAG2EX01-BASE.srv.huawei-3com.com ([fe80::a8f5:353e:bad4:10d8])
	by DAG2EX01-BASE.srv.huawei-3com.com ([fe80::a8f5:353e:bad4:10d8%6])
	with mapi id 15.01.1713.004; Mon, 20 Jul 2020 09:52:30 +0800
From: Chongyun Wu <wu.chongyun@h3c.com>
To: "mwilck@suse.com" <mwilck@suse.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>
Thread-Topic: [dm-devel] [PATCH 00/74] multipath-tools series part V: removed
	path handling
Thread-Index: AdZeOEAdCUC7ckLJSeedkSTLX18xVA==
Date: Mon, 20 Jul 2020 01:52:30 +0000
Message-ID: <311e3cc177cb481e872fd8b0909bddfd@h3c.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.125.108.121]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 06K1qTuY064232
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06K1r9XN006701
X-loop: dm-devel@redhat.com
Cc: Guozhonghua <guozhonghua@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Chengchiwen <chengchiwen@h3c.com>, Wangyong <wang.yongD@h3c.com>,
	Zhangguanghui <zhang.guanghui@h3c.com>
Subject: Re: [dm-devel] [PATCH 00/74] multipath-tools series part V: removed
 path handling
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
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgTWFyaW4gYW5kIGFsbCwKCldpdGggYmVsb3cgcGF0Y2hlcywgcnVuIHVwL2Rvd24gc2NyaXB0
IGZvciBhIHdlZWssIERNIElPIGJsb2NrZWQgaXNzdWUgbm90IGhhcHBlbmVkIGFnYWluLCBJIHRo
aW5rIHRob3NlIHBhdGNoZXMgd29ya3MuCgpUZXN0ZWQtYnk6IHd1Y2hvbmd5dW4gKENsb3VkKSA8
d3UuY2hvbmd5dW5AaDNjLmNvbT4KCk1hcnRpbiBXaWxjayAoMjEpOgogIGxpYm11bHRpcGF0aDog
cHJvdGVjdCB1c2Ugb2YgcHAtPnVkZXYKICBsaWJtdWx0aXBhdGg6IGFkZCB1bmluaXRpYWxpemVf
cGF0aCgpCiAgbXVsdGlwYXRoLXRvb2xzOiBpbnRyb2R1Y2UgSU5JVF9SRU1PVkVEIHN0YXRlCiAg
bGlibXVsdGlwYXRoOiB1cGRhdGVfbXBwX3BhdGhzKCk6IGhhbmRsZSBJTklUX1JFTU9WRUQKICBs
aWJtdWx0aXBhdGg6IHZlcmlmeV9wYXRocygpOiBkb24ndCBkZWxldGUgcGF0aHMgZnJvbSBwYXRo
dmVjCiAgbGlibXVsdGlwYXRoOiBzeW5jX3BhdGhzKCk6IGhhbmRsZSBJTklUX1JFTU9WRUQKICBs
aWJtdWx0aXBhdGg6IG9ycGhhbl9wYXRocygpOiBkZWxldGUgcGF0aHMgaW4gSU5JVF9SRU1PVkVE
IHN0YXRlCiAgbGlibXVsdGlwYXRoOiBhZG9wdF9wYXRocygpOiBza2lwIHJlbW92ZWQgcGF0aHMK
ICBtdWx0aXBhdGhkOiBldl9yZW1vdmVfcGF0aCgpOiB1c2UgSU5JVF9SRU1PVkVECiAgbXVsdGlw
YXRoZDogZGVhbCB3aXRoIElOSVRfUkVNT1ZFRCBkdXJpbmcgcGF0aCBhZGRpdGlvbgogIG11bHRp
cGF0aGQ6IGNoZWNrX3BhdGgoKTogc2V0IHJldHJpZ2dlcl9kZWxheSBpZiBuZWNlc3NhcnkKICBs
aWJtdWx0aXBhdGg6IGFkZCB1cGRhdGVfcGF0aHZlY19mcm9tX2RtKCkKICBsaWJtdWx0aXBhdGg6
IHVwZGF0ZV9wYXRodmVjX2Zyb21fZG06IGhhbmRsZSBwcC0+bXBwIG1pc21hdGNoCiAgbGlibXVs
dGlwYXRoOiBkaXNhc3NlbWJsZV9tYXAoKTogYWx3YXlzIHNlYXJjaCBwYXRocyBieSBkZXZfdAog
IGxpYm11bHRpcGF0aDogZGlzYXNzZW1ibGVfbWFwKCk6IHJlcXVpcmUgbm9uLU5VTEwgcGF0aHZl
YwogIGxpYm11bHRpcGF0aDogZGlzYXNzZW1ibGVfbWFwKCk6IGdldCByaWQgb2YgImlzX2RhZW1v
biIgYXJndW1lbnQKICBsaWJtdWx0aXBhdGg6IGRpc2Fzc2VtYmxlX21hcCgpOiBkbyBub3QgY2hh
bmdlIHBhdGh2ZWMgYW5kIFdXSURzCiAgbXVsdGlwYXRoOiB1c2UgdXBkYXRlX3BhdGh2ZWNfZnJv
bV9kbSgpCiAgbGlibXBhdGhwZXJzaXN0OiB1c2UgdXBkYXRlX3BhdGh2ZWNfZnJvbV9kbSgpCiAg
bGlibXVsdGlwYXRoOiBkZWNyZWFzZSBsb2dsZXZlbCBpbiBzdG9yZV9wYXRoKCkKICBsaWJtdWx0
aXBhdGg6IGRtcGFyc2VyOiBjb25zdGlmeSBmdW5jdGlvbiBhcmd1bWVudHMKCgotLS0tLW9yaWdp
YW5sLS0tLS0Kt6K8/sjLOiBkbS1kZXZlbC1ib3VuY2VzQHJlZGhhdC5jb20gW21haWx0bzpkbS1k
ZXZlbC1ib3VuY2VzQHJlZGhhdC5jb21dILT6se0gbXdpbGNrQHN1c2UuY29tCreiy83KsbzkOiAy
MDIwxOo31MI5yNUgMTg6NTEKytW8/sjLOiBDaHJpc3RvcGhlIFZhcm9xdWkgPGNocmlzdG9waGUu
dmFyb3F1aUBvcGVuc3ZjLmNvbT47IEJlbmphbWluIE1hcnppbnNraSA8Ym1hcnppbnNAcmVkaGF0
LmNvbT4Ks63LzTogZG0tZGV2ZWxAcmVkaGF0LmNvbTsgTWFydGluIFdpbGNrIDxtd2lsY2tAc3Vz
ZS5jb20+Ctb3zOI6IFtkbS1kZXZlbF0gW1BBVENIIDAwLzc0XSBtdWx0aXBhdGgtdG9vbHMgc2Vy
aWVzIHBhcnQgVjogcmVtb3ZlZCBwYXRoIGhhbmRsaW5nCgpGcm9tOiBNYXJ0aW4gV2lsY2sgPG13
aWxja0BzdXNlLmNvbT4KCkhpIENocmlzdG9waGUsIGhpIEJlbiwKClRoaXMgaXMgcGFydCBWIG9m
IGEgbGFyZ2VyIHBhdGNoIHNlcmllcyBmb3IgbXVsdGlwYXRoLXRvb2xzIEkndmUgYmVlbiBwcmVw
YXJpbmcuCkl0J3MgYmFzZWQgb24gdGhlIHByZXZpb3VzbHkgc3VibWl0dGVkIHBhcnQgSVYuCgpU
aGUgZnVsbCBzZXJpZXMgd2lsbCBhbHNvIGJlIGF2YWlsYWJsZSBoZXJlOgpodHRwczovL2dpdGh1
Yi5jb20vbXdpbGNrL211bHRpcGF0aC10b29scy90cmVlL3Vwcy9zdWJtaXQtMjAwNwoKVGhlcmUg
YXJlIHRhZ3MgaW4gdGhhdCByZXBvIGZvciBlYWNoIHBhcnQgb2YgdGhlIHNlcmllcy4KVGhpcyBw
YXJ0IGlzIHRhZ2dlZCAic3VibWl0LTIwMDcwOS01Ii4KClRoZSBzZXJpZXMgYWRkcmVzc2VzIHNl
dmVyYWwgaXNzdWVzIHdpdGggbWlzc2luZywgdW5pbnRpYWxpemVkLCBhbmQgcmVtb3ZlZCBwYXRo
cy4gVGhlIG1vdGl2YXRpb24gd2FzIHRoYXQgSSBzdHJvbmdseSBkaXNsaWtlIHRoZSBzaWRlIGVm
ZmVjdHMgb2YgZGlzYXNzZW1ibGVfbWFwKCksIGFkZGluZyBwYXRocyBhbmQgc2V0dGluZyBXV0lE
cyB3aGlsZSBwYXJzaW5nIG1hcCBwYXJhbWV0ZXJzLiBJTU8gdGhpcyBoYXMgYWx3YXlzIGJlZW4g
YSBsYXllcmluZyB2aW9sYXRpb24uIFRoaXMgcGF0Y2ggc2V0IGFkZHMgYSBuZXcgZnVuY3Rpb24g
ZGVkaWNhdGVkIHRvIGhhbmRsaW5nIHBhdGhzIHdoaWNoIGhhdmUgbm90IGJlZW4gZGV0ZWN0ZWQg
dmlhIHVkZXYgYnV0IGFyZSBwcmVzZW50IGFzIG1lbWJlcnMgb2YgZG0gbWFwcy4gVGhhdCBtYWtl
cyBpdCBtdWNoIGVhc2llciB0byB0cmFjayBhbmQgaW1wcm92ZSB0aGUgbG9naWMgYXBwbGllZCB3
aGVuIHN1Y2ggZGV2aWNlcyBhcmUgZGV0ZWN0ZWQuCgpJIGJlbGlldmUgdGhhdCB0aGUgbmV3IGxv
Z2ljIHdpbGwgYWxzbyBmaXggdGhlIGlzc3VlIHJlY2VudGx5IHJlcG9ydGVkIGJ5IENob25neXVu
ICgibGlibXVsdGlwYXRoL2RtcGFyc2VyOiBhZGQgbWlzc2luZyBwYXRoIHdpdGggZ29vZCBzdGF0
dXMgd2hlbiBzeW5jIHN0YXRlIHdpdGggZG0ga2VybmVsIikuIEF0IGxlYXN0LCB0aGUgYXBwcm9h
Y2ggaXMgdmVyeSBzaW1pbGFyLCBhbHRob3VnaCB0aGUgY2FsbCB0byBwYXRoaW5mbygpIGZvciBu
ZXcgZGV2aWNlcyBub3cgaGFwcGVucyBpbiB1cGRhdGVfcGF0aHZlY19mcm9tX2RtKCkgcmF0aGVy
IHRoYW4gaW4gZGlzYXNzZW1ibGVfbWFwKCkuCgpUaGUgcGF0Y2ggc2V0IGFsc28gZ2V0cyByaWQg
b2YgdGhlICJpc19kYWVtb24iIGFyZ3VtZW50IGZvciBkaXNhc3NlbWJsZV9tYXAoKSwgY2F1c2lu
ZyBzZW1hbnRpY3MgaW4gZGFlbW9uIGFuZCBub24tZGFlbW9uIG1vZGUuIFRoZSByZWFzb24gZm9y
IHRoaXMgcGFyYW1ldGVyIGdvZXMgd2F5IGJhY2sgaW50byBoaXN0b3J5OyBpdCB3YXMgYXZvaWRp
bmcgdG8gcmUtYWRkIG1hbnVhbGx5IHJlbW92ZWQgcGF0aHMgYmVjYXVzZSB0aGV5IHdlcmUgc3Rp
bGwgc2hvd2luZyB1cCBpbiBtYXBzLiBCdXQgT1RPSCB3ZSBtdXN0IGFkZCBtaXNzaW5nIGRldmlj
ZXMgd2hpY2ggd2UndmUgZmFpbGVkIHRvIGRldGVjdC4gVGhlIHBhdGNoIHNldCBoYW5kbGVzIHRo
aXMgYnkgdHJhY2tpbmcgdGhlIHN0YXRlIG9mICJiZWluZyByZW1vdmVkIiBhcyBhIG5ldyBpbml0
IHN0YXRlLCBhbmQgb25seSBhY3R1YWxseSByZW1vdmluZyB0aGUgcGF0aHMgZnJvbSBwYXRodmVj
IHdoZW4gdGhleSBkb24ndCBzaG93IHVwIGluIG1hcHMgYW55IG1vcmUuCgpSZWdhcmRzCk1hcnRp
bgoKTWFydGluIFdpbGNrICgyMSk6CiAgbGlibXVsdGlwYXRoOiBwcm90ZWN0IHVzZSBvZiBwcC0+
dWRldgogIGxpYm11bHRpcGF0aDogYWRkIHVuaW5pdGlhbGl6ZV9wYXRoKCkKICBtdWx0aXBhdGgt
dG9vbHM6IGludHJvZHVjZSBJTklUX1JFTU9WRUQgc3RhdGUKICBsaWJtdWx0aXBhdGg6IHVwZGF0
ZV9tcHBfcGF0aHMoKTogaGFuZGxlIElOSVRfUkVNT1ZFRAogIGxpYm11bHRpcGF0aDogdmVyaWZ5
X3BhdGhzKCk6IGRvbid0IGRlbGV0ZSBwYXRocyBmcm9tIHBhdGh2ZWMKICBsaWJtdWx0aXBhdGg6
IHN5bmNfcGF0aHMoKTogaGFuZGxlIElOSVRfUkVNT1ZFRAogIGxpYm11bHRpcGF0aDogb3JwaGFu
X3BhdGhzKCk6IGRlbGV0ZSBwYXRocyBpbiBJTklUX1JFTU9WRUQgc3RhdGUKICBsaWJtdWx0aXBh
dGg6IGFkb3B0X3BhdGhzKCk6IHNraXAgcmVtb3ZlZCBwYXRocwogIG11bHRpcGF0aGQ6IGV2X3Jl
bW92ZV9wYXRoKCk6IHVzZSBJTklUX1JFTU9WRUQKICBtdWx0aXBhdGhkOiBkZWFsIHdpdGggSU5J
VF9SRU1PVkVEIGR1cmluZyBwYXRoIGFkZGl0aW9uCiAgbXVsdGlwYXRoZDogY2hlY2tfcGF0aCgp
OiBzZXQgcmV0cmlnZ2VyX2RlbGF5IGlmIG5lY2Vzc2FyeQogIGxpYm11bHRpcGF0aDogYWRkIHVw
ZGF0ZV9wYXRodmVjX2Zyb21fZG0oKQogIGxpYm11bHRpcGF0aDogdXBkYXRlX3BhdGh2ZWNfZnJv
bV9kbTogaGFuZGxlIHBwLT5tcHAgbWlzbWF0Y2gKICBsaWJtdWx0aXBhdGg6IGRpc2Fzc2VtYmxl
X21hcCgpOiBhbHdheXMgc2VhcmNoIHBhdGhzIGJ5IGRldl90CiAgbGlibXVsdGlwYXRoOiBkaXNh
c3NlbWJsZV9tYXAoKTogcmVxdWlyZSBub24tTlVMTCBwYXRodmVjCiAgbGlibXVsdGlwYXRoOiBk
aXNhc3NlbWJsZV9tYXAoKTogZ2V0IHJpZCBvZiAiaXNfZGFlbW9uIiBhcmd1bWVudAogIGxpYm11
bHRpcGF0aDogZGlzYXNzZW1ibGVfbWFwKCk6IGRvIG5vdCBjaGFuZ2UgcGF0aHZlYyBhbmQgV1dJ
RHMKICBtdWx0aXBhdGg6IHVzZSB1cGRhdGVfcGF0aHZlY19mcm9tX2RtKCkKICBsaWJtcGF0aHBl
cnNpc3Q6IHVzZSB1cGRhdGVfcGF0aHZlY19mcm9tX2RtKCkKICBsaWJtdWx0aXBhdGg6IGRlY3Jl
YXNlIGxvZ2xldmVsIGluIHN0b3JlX3BhdGgoKQogIGxpYm11bHRpcGF0aDogZG1wYXJzZXI6IGNv
bnN0aWZ5IGZ1bmN0aW9uIGFyZ3VtZW50cwoKIGxpYm1wYXRocGVyc2lzdC9tcGF0aF9wZXJzaXN0
LmMgICAgICAgfCAgNTYgKy0tLS0tCiBsaWJtdWx0aXBhdGgvY29uZmlndXJlLmMgICAgICAgICAg
ICAgIHwgICAyICstCiBsaWJtdWx0aXBhdGgvZGlzY292ZXJ5LmMgICAgICAgICAgICAgIHwgIDE1
ICstCiBsaWJtdWx0aXBhdGgvZG1wYXJzZXIuYyAgICAgICAgICAgICAgIHwgIDcwICsrLS0tLS0K
IGxpYm11bHRpcGF0aC9kbXBhcnNlci5oICAgICAgICAgICAgICAgfCAgIDQgKy0KIGxpYm11bHRp
cGF0aC9wcmlvcml0aXplcnMvYWx1YV9ydHBnLmMgfCAgIDYgKy0KIGxpYm11bHRpcGF0aC9zdHJ1
Y3RzLmMgICAgICAgICAgICAgICAgfCAgMjEgKy0KIGxpYm11bHRpcGF0aC9zdHJ1Y3RzLmggICAg
ICAgICAgICAgICAgfCAgIDYgKwogbGlibXVsdGlwYXRoL3N0cnVjdHNfdmVjLmMgICAgICAgICAg
ICB8IDI2MyArKysrKysrKysrKysrKysrKysrKysrKy0tLQogbGlibXVsdGlwYXRoL3N0cnVjdHNf
dmVjLmggICAgICAgICAgICB8ICAxMSArLQogbXVsdGlwYXRoL21haW4uYyAgICAgICAgICAgICAg
ICAgICAgICB8ICA3MSArLS0tLS0tCiBtdWx0aXBhdGhkL2NsaV9oYW5kbGVycy5jICAgICAgICAg
ICAgIHwgIDQ5ICsrKystCiBtdWx0aXBhdGhkL21haW4uYyAgICAgICAgICAgICAgICAgICAgIHwg
MTEzICsrKysrKysrLS0tCiAxMyBmaWxlcyBjaGFuZ2VkLCA0NDUgaW5zZXJ0aW9ucygrKSwgMjQy
IGRlbGV0aW9ucygtKQoKLS0KMi4yNi4yCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRl
dmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2Rt
LWRldmVsCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0
cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

