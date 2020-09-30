Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1EC27E895
	for <lists+dm-devel@lfdr.de>; Wed, 30 Sep 2020 14:30:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-aEjoMSJsPcaVxSzI1tN1bQ-1; Wed, 30 Sep 2020 08:30:27 -0400
X-MC-Unique: aEjoMSJsPcaVxSzI1tN1bQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B316F85C70F;
	Wed, 30 Sep 2020 12:30:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 620357A431;
	Wed, 30 Sep 2020 12:30:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7A21922E1;
	Wed, 30 Sep 2020 12:30:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08UCSCv3030850 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 30 Sep 2020 08:28:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2C24EAFA7; Wed, 30 Sep 2020 12:28:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD14CEAFA2
	for <dm-devel@redhat.com>; Wed, 30 Sep 2020 12:28:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 024C38582A1
	for <dm-devel@redhat.com>; Wed, 30 Sep 2020 12:28:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-378-OrcX3a9jPmKDr19SsqWI_g-1;
	Wed, 30 Sep 2020 08:28:06 -0400
X-MC-Unique: OrcX3a9jPmKDr19SsqWI_g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BC78EAEF8;
	Wed, 30 Sep 2020 12:08:13 +0000 (UTC)
To: Steffen Maier <maier@linux.ibm.com>, Brian Bunker <brian@purestorage.com>,
	device-mapper development <dm-devel@redhat.com>
References: <D7BC3D02-400E-4F70-9A61-6E959F5AE5A5@purestorage.com>
	<c2d499b3-b2d1-eaae-bf23-8875b974012a@linux.ibm.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f095e46c-05b0-0ea1-4d26-d101075f5ac3@suse.de>
Date: Wed, 30 Sep 2020 14:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c2d499b3-b2d1-eaae-bf23-8875b974012a@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08UCSCv3030850
X-loop: dm-devel@redhat.com
Cc: Benjamin Block <bblock@linux.ibm.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: Extract the LUN number for
 peripheral, flat, and logical unit address methods
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gOS8zMC8yMCAxOjA5IFBNLCBTdGVmZmVuIE1haWVyIHdyb3RlOgo+IE9uIDkvMjkvMjAgMTox
NCBBTSwgQnJpYW4gQnVua2VyIHdyb3RlOgo+PiBGb3IgTFVOcyBiZXR3ZWVuIDAgYW5kIDI1NSBw
ZXJpcGhlcmFsIGFkZHJlc3NpbmcgaXMgdXNlZC4gRm9yIExVTnMgCj4+IGhpZ2hlciB0aGFuIDI1
NSB0aGUgTFVOIGFkZHJlc3NpbmcKPj4gc2hvdWxkIHN3aXRjaCB0byBmbGF0IGFjY29yZGluZyB0
byB0aGUgc3BlY2lmaWNhdGlvbi4gSW5zdGVhZCBvZiAKPj4gcHJpbnRpbmcgb3V0IHRoZSBMVU4g
bnVtYmVyIHdpdGhvdXQgcmVnYXJkIHRvCj4+IHRoZSBzaGlmdGluZyBvZiBhZGRyZXNzIG1ldGhv
ZCwgZGlzcGxheSB0aGUgTFVOIGFzIGl0IHdhcyBpbnRlbmRlZCB0byAKPj4gYmUgdGhlIHVzZXIg
Y29ubmVjdGluZyB0aGUgTFVOLiBUaGUKPj4gY3VycmVudCBkaXNwbGF5IGxlYXZlcyBhIG5vbi1v
YnZpb3VzIDE2Mzg0IG9mZnNldC4KPj4KPj4gSW4gc2hvcnQsIGEgTFVOIGNvbm5lY3RlZCBhcyAy
NTggd2lsbCBzaG93IHVwIGluIG11bHRpcGF0aCBvdXRwdXQgYXMgCj4+IDE2NjQyLiBJbnN0ZWFk
IGRpc3BsYXkgaXQgYXMgdGhlCj4+IGV4cGVjdGVkIDI1OC4gVGhpcyBpcyBmb3IgZGlzcGxheSBv
bmx5IGFuZCBkb2VzbuKAmXQgY2hhbmdlIHRoZSBhY3R1YWwgCj4+IGNvbnRlbnRzIG9mIHRoZSBM
VU4gdmFyaWFibGUuCj4gCj4gW3RoaXMgaXMga2luZCBvZiBhIGNvbnRpbnVhdGlvbiBvZiB0aGUg
ZGlzY3Vzc2lvbiB0aGF0IHN0YXJ0ZWQgd2l0aCB0aGUgCj4gMXN0IHZlcnNpb24gb2YgdGhlIHBh
dGggaW4gCj4gaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9hcmNoaXZlcy9kbS1kZXZlbC8yMDIwLVNl
cHRlbWJlci9tc2cwMDU5Mi5odG1sXQo+IAo+IFVzZXJzIGFuZCB0b29scyBzdWNoIGFzIAo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9pYm0tczM5MC10b29scy9zMzkwLXRvb2xzL2Jsb2IvbWFzdGVyL3pp
b21vbi96aW9tb24gCj4gcGFyc2UgdGhlIGhjaWwgb3V0cHV0IG9mIG11bHRpcGF0aChkKSB0byBm
aW5kIHRoZSBjb3JyZXNwb25kaW5nIExpbnV4IAo+IFNDU0kgZGV2aWNlIGJ5IGl0cyB3ZWxsLWRl
ZmluZWQgbmFtZS4KPiBJIHRoaW5rIHRoaXMgY2hhbmdlIHdvdWxkIGJyZWFrIHRob3NlLgo+IAo+
IElJUkMsIHRvb2xzIHN1Y2ggYXMgcmVzY2FuLXNjc2ktYnVzLnNoIFtzZzNfdXRpbHNdIHdlcmUg
aW50ZW50aW9uYWxseSAKPiBjaGFuZ2VkIGZyb20gZGVjb2RpbmcgdGhlIExVTiBmb3JtYXQgdG8g
d29ya2luZyB3aXRoIGFuIG9wYXF1ZSA2NC1iaXQgTFVOLgo+IFtodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1zY3NpLzUxMjg4QzVGLjEwODA4MDJAc3VzZS5kZS9ULyNtYWJhOTU0ZmM1MGVm
YTI0ZTRjMDU0NDUwNmQ0YzQwMjUyNjlkNmM2MF0gCj4gCkkgY2FuIG5vdCBhZ3JlZSBtb3JlLgpU
aGUgcHJpbmNpcGFsIHByb2JsZW0gaXMgdGhhdCB0aGVyZSB3YXMgYSBzaGlmdCBpbiB0aGUgZGVm
aW5pdGlvbiBvZiB0aGUgCkxVTiBudW1iZXIgYmV0d2VlbiBTQ1NJLTMvU0FNIGFuZCBTQU0tMjsg
cHJpb3IgdG8gU0FNLTIgX2FueV8gNjQtYml0IApudW1iZXIgd2FzIGEgdmFsaWQgTFVOLCB3aGVy
ZWFzIFNBTS0yIGludHJvZHVjZWQgdGhlIExVTiBudW1iZXIgc3RydWN0dXJlLgpTbyBhbnkgbWVh
bmluZyBhIExVTiBtaWdodCBoYXZlIGRlcGVuZHMgb24gdGhlIGNsYWltZWQgc3RhbmRhcmQuCkFk
ZGl0aW9uYWxseSwgcXVpdGUgc29tZSBhcnJheXMgb3BlcmF0ZSBpbiAnbGVnYWN5JyBtb2RlLCB0
cnlpbmcgdG8gCnByZXNlcnZlIGJhY2t3YXJkcyBjb21wYWJpbGl0eSB3aXRoIHRoZSBvcmlnaW5h
bCBTQ1NJLTIgc3RhbmRhcmQuCkhlbmNlIGZpZ3VyaW5nIG91dCB3aGljaCBzdGFuZGFyZCBpcyBh
Y3R1YWxseSB1c2VkIGJ5IHRoZSBpbXBsZW1lbnRhdGlvbiAKaXMgY2hhbGxlbmdpbmcgYXQgdGlt
ZXMuCgpCdXQgaXQgYWxzbyBtZWFucyB0aGF0IExVTiAweDQxMDAgY291bGQgcmVmZXIgdG8gTFVO
IDE2NjQwIChmb3IgU0NTSS0zKSwgCm9yIHRvIExVTiAyNTYgKGZvciBTQU0tMikuCk9yIHRoZSBk
ZXZpY2UgbWlnaHQgY2hvb3NlIHRvIHVzZSBoaWVyYXJjaGljYWwgTFVOIGFkZHJlc3NpbmcsIHdo
aWNoIAptYWtlcyBpdCBwcmV0dHkgaGFyZCB0byBleHRyYWN0IGEgdmFsaWQgKGFuZCB1bmlxdWUh
KSBMVU4gbnVtYmVyLgoKU28gaW4gdGhlIGVuZCB3ZSBkZWNpZGVkIHRvIF9ub3RfIGRlY29kZSB0
aGUgTFVOIG51bWJlciwgYXMgdGhlIGludGVybmFsIApzdHJ1Y3R1cmUgaXMgb25seSBldmVyIHVz
ZWZ1bCBmb3IgdGhlIHRhcmdldCwgbm90IHRoZSBpbml0aWF0b3IuCgpDaGVlcnMsCgpIYW5uZXMK
LS0gCkRyLiBIYW5uZXMgUmVpbmVja2UJCSAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0
ZWN0CmhhcmVAc3VzZS5kZQkJCSAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR0Y6IEZlbGl4IEltZW5kw7ZyZmZl
cgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8v
d3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

