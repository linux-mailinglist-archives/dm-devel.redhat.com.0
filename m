Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8B19024E56C
	for <lists+dm-devel@lfdr.de>; Sat, 22 Aug 2020 06:33:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-z_A32X4pM3akFf9ISpXW5w-1; Sat, 22 Aug 2020 00:33:15 -0400
X-MC-Unique: z_A32X4pM3akFf9ISpXW5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25E9881F02D;
	Sat, 22 Aug 2020 04:33:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEB1E7C593;
	Sat, 22 Aug 2020 04:33:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 301D685CD;
	Sat, 22 Aug 2020 04:32:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07M4W3A3004567 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 22 Aug 2020 00:32:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92BFE2166BA3; Sat, 22 Aug 2020 04:32:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DBD72166B27
	for <dm-devel@redhat.com>; Sat, 22 Aug 2020 04:32:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7349A1815DC2
	for <dm-devel@redhat.com>; Sat, 22 Aug 2020 04:32:01 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-40-zzTXjnZwNzyEyHjuMVO7lw-1; Sat, 22 Aug 2020 00:31:56 -0400
X-MC-Unique: zzTXjnZwNzyEyHjuMVO7lw-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 1CF69E686E16C7C246FF;
	Sat, 22 Aug 2020 12:31:47 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.487.0;
	Sat, 22 Aug 2020 12:31:41 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, Zdenek Kabelac
	<zkabelac@redhat.com>
References: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
	<b2c96dc6-1e01-beb2-0ccb-22e1d0d980a6@huawei.com>
	<5b382b169a8c499acfc523adb81681fe941d743a.camel@suse.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <264c80ee-b179-616c-4551-dc1f8a53a8b6@huawei.com>
Date: Sat, 22 Aug 2020 12:31:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5b382b169a8c499acfc523adb81681fe941d743a.camel@suse.com>
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07M4W3A3004567
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH V2 1/5] multipathd: adopt static char* arr in
 daemon_status
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Ck9uIDIwMjAvOC8yMSAyMTo0MiwgTWFydGluIFdpbGNrIHdyb3RlOgo+IE9uIEZyaSwgMjAyMC0w
OC0yMSBhdCAxODo1OCArMDgwMCwgWmhpcWlhbmcgTGl1IHdyb3RlOgo+PiBXZSBhZG9wdCBzdGF0
aWMgY2hhciogYXJyYXkgKGRlbW9uX3N0YXR1c19tc2cpIGluIGRhZW1vbl9zdGF0dXMgZnVuYywK
Pj4gc28gaXQgbG9va3MgbW9yZSBzaW1wbGVyIGFuZCBlYXNpZXIgdG8gZXhwYW5kLgo+Pgo+PiBW
MS0+VjI6Cj4+IC0gdXNlICJpbnQiIGFzIHRoZSB0eXBlIG9mICJzdGF0dXMiIChzdWdnZXN0ZWQg
YnkgTWFydGluKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBaaGlxaWFuZyBMaXUgPGxpdXpoaXFpYW5n
MjZAaHVhd2VpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogbGl4aWFva2VuZyA8bGl4aWFva2VuZ0Bo
dWF3ZWkuY29tPgo+PiAtLS0KPj4gIG11bHRpcGF0aGQvbWFpbi5jIHwgMzAgKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tCj4+ICBtdWx0aXBhdGhkL21haW4uaCB8ICAzICsrLQo+PiAgMiBm
aWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL211bHRpcGF0aGQvbWFpbi5jIGIvbXVsdGlwYXRoZC9tYWluLmMKPj4gaW5kZXgg
OWVjNjU4NTYuLjYyY2Y0ZmY0IDEwMDY0NAo+PiAtLS0gYS9tdWx0aXBhdGhkL21haW4uYwo+PiAr
KysgYi9tdWx0aXBhdGhkL21haW4uYwo+PiBkaWZmIC0tZ2l0IGEvbXVsdGlwYXRoZC9tYWluLmgg
Yi9tdWx0aXBhdGhkL21haW4uaAo+PiBpbmRleCA1ZGZmMTdlNS4uNmE1NTkyYzAgMTAwNjQ0Cj4+
IC0tLSBhL211bHRpcGF0aGQvbWFpbi5oCj4+ICsrKyBiL211bHRpcGF0aGQvbWFpbi5oCj4+IEBA
IC00LDEyICs0LDEzIEBACj4+ICAjZGVmaW5lIE1BUEdDSU5UIDUKPj4KPj4gIGVudW0gZGFlbW9u
X3N0YXR1cyB7Cj4+IC0JREFFTU9OX0lOSVQsCj4+ICsJREFFTU9OX0lOSVQgPSAwLAo+PiAgCURB
RU1PTl9TVEFSVCwKPj4gIAlEQUVNT05fQ09ORklHVVJFLAo+PiAgCURBRU1PTl9JRExFLAo+PiAg
CURBRU1PTl9SVU5OSU5HLAo+PiAgCURBRU1PTl9TSFVURE9XTiwKPj4gKwlEQUVNT05fU1RBVFVT
X1NJWkUsCj4+ICB9Owo+IAo+IFRoaXMgYnJlYWtzIGNvbXBpbGF0aW9uOgo+IAo+IG1haW4uYzog
SW4gZnVuY3Rpb24g4oCYc2Rfbm90aWZ5X3N0YXR1c+KAmToKPiBtYWluLmM6MTg0OjI6IGVycm9y
OiBlbnVtZXJhdGlvbiB2YWx1ZSDigJhEQUVNT05fU1RBVFVTX1NJWkXigJkgbm90IGhhbmRsZWQK
PiBpbiBzd2l0Y2ggWy1XZXJyb3I9c3dpdGNoXQo+ICAgc3dpdGNoIChzdGF0ZSkgewo+ICAgXn5+
fn5+Cj4gCj4gUGxlYXNlIGF2b2lkIGludHJvZHVjaW5nIERBRU1PTl9TVEFUVVNfU0laRS4KPiAK
PiBUaGlzIHdvdWxkIGJlIGZpeGVkIGJ5IHlvdXIgcGF0Y2ggMiBiZWNhdXNlIGl0IHJlbW92ZXMg
dGhlIHN3aXRjaAo+IHN0YXRlbWVudCwgYnV0IG5vIHBhdGNoIGluIGEgc2VyaWVzIHNob3VsZCBi
cmVhayBjb21waWxhdGlvbiwgdG8gCj4gYWxsb3cgZnV0dXJlIGJpc2VjdGlvbnMuCj4gCj4gSSBo
YXZlIHRvIHdpdGhkcmF3IG15ICJSZXZpZXdlZC1ieTogZm9yIHRoZSB0aW1lIGJlaW5nLCBzb3Jy
eS4KCj4gTWFydGluCgpUaGFua3MgZm9yIHlvdXIgcmVwbHkuCkkgdGhpbmsgd2Ugc2hvdWxkIGtl
ZXAgREFFTU9OX1NUQVRVU19TSVpFIGZvciBib3VuZGFyeSBjaGVjay4KRm9yIHNvbHZpbmcgdGhl
IHByb2JsZW0sIHdlIGNhbiBhZGQgZGVmYXVsdCBjYXNlIGluIHN3aXRjaChzdGF0ZSkKaW4gc2Rf
bm90aWZ5X3N0YXR1cyBmdW5jLgoKSSB3aWxsIHNlbmQgdGhlIHYzIHBhdGNoIHNlcmllcy4KClJl
Z2FyZHMKWmhpcWlhbmcgTGl1Cj4gCj4gCj4+Cj4+ICBzdHJ1Y3QgcHJvdXRfcGFyYW1fZGVzY3Jp
cHRvcjsKPiAKPiAKPiAKPiAuCj4gCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVs
QHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRl
dmVs

