Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C64701B1E4D
	for <lists+dm-devel@lfdr.de>; Tue, 21 Apr 2020 07:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587447921;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=raqm3YRmZQV2KO1ZamFg9wkuC3UwHaIk9/6L6TCo1Us=;
	b=M2lV1ngRXWpiPuNF6cvpG00yqmPZtW3D3iXo7kG39+guoBTYThHfGJ4ekgYdCDI0yFW0LN
	WB2kYbqe/qCqt/0S6Riso1JRizLa539nneXVskLk8CS8Akfd6Mv1ikD/EKgHfCd4ezKzQM
	pU0dBQ0QD3BjFCBL62Oxf4bH5ATK9aM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-51GrO8m8OhuWpTqgxaYDQg-1; Tue, 21 Apr 2020 01:45:18 -0400
X-MC-Unique: 51GrO8m8OhuWpTqgxaYDQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FE788017FE;
	Tue, 21 Apr 2020 05:45:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A180E60C87;
	Tue, 21 Apr 2020 05:45:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7939E93900;
	Tue, 21 Apr 2020 05:44:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03L5iZXi027761 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 01:44:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50C982166B2A; Tue, 21 Apr 2020 05:44:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D5942166B29
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 05:44:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E108802069
	for <dm-devel@redhat.com>; Tue, 21 Apr 2020 05:44:33 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-29-JIT0ZloIMfaNlhVHqcVNcQ-1;
	Tue, 21 Apr 2020 01:44:28 -0400
X-MC-Unique: JIT0ZloIMfaNlhVHqcVNcQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 2EAB0AB64;
	Tue, 21 Apr 2020 05:44:26 +0000 (UTC)
To: mwilck@suse.com, Mike Snitzer <snitzer@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
References: <20200420202909.9866-1-mwilck@suse.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <534a44cf-0291-7d25-cae1-5b2e4ce717be@suse.de>
Date: Tue, 21 Apr 2020 07:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420202909.9866-1-mwilck@suse.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03L5iZXi027761
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Bond <dbond@suse.com>
Subject: Re: [dm-devel] [PATCH] dm mpath: switch paths in dm_blk_ioctl()
	code path
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

T24gNC8yMC8yMCAxMDoyOSBQTSwgbXdpbGNrQHN1c2UuY29tIHdyb3RlOgo+IEZyb206IE1hcnRp
biBXaWxjayA8bXdpbGNrQHN1c2UuY29tPgo+IAo+IFNDU0kgTFVOIHBhc3N0aHJvdWdoIGNvZGUg
c3VjaCBhcyBxZW11J3MgInNjc2ktYmxvY2siIGRldmljZSBtb2RlbAo+IHBhc3MgZXZlcnkgSU8g
dG8gdGhlIGhvc3QgdmlhIFNHX0lPIGlvY3Rscy4gQ3VycmVudGx5LCBkbS1tdWx0aXBhdGgKPiBj
YWxscyBjaG9vc2VfcGdwYXRoKCkgb25seSBpbiB0aGUgYmxvY2sgSU8gY29kZSBwYXRoLCBub3Qg
aW4gdGhlCj4gaW9jdGwgY29kZSBwYXRoICh1bmxlc3MgY3VycmVudF9wZ3BhdGggaXMgTlVMTCku
IFRoaXMgaGFzIHRoZSBlZmZlY3QKPiB0aGF0IG5vIHBhdGggc3dpdGNoaW5nIGFuZCB0aHVzIG5v
IGxvYWQgYmFsYW5jaW5nIGlzIGRvbmUgZm9yCj4gU0NTSS1wYXNzdGhyb3VnaCBJTywgdW5sZXNz
IHRoZSBhY3RpdmUgcGF0aCBmYWlscy4KPiAKPiBGaXggdGhpcyBieSB1c2luZyB0aGUgc2FtZSBs
b2dpYyBpbiBtdWx0aXBhdGhfcHJlcGFyZV9pb2N0bCgpIGFzIGluCj4gbXVsdGlwYXRoX2Nsb25l
X2FuZF9tYXAoKS4KPiAKPiBOb3RlOiBUaGUgYWxsZWdlZGx5IGJlc3QgcGF0aCBzZWxlY3Rpb24g
YWxnb3JpdGhtLCBzZXJ2aWNlLXRpbWUsCj4gc3RpbGwgd291bGRuJ3Qgd29yayBwZXJmZWN0bHks
IGJlY2F1c2UgdGhlIGlvIHNpemUgb2YgdGhlIGN1cnJlbnQKPiByZXF1ZXN0IGlzIGFsd2F5cyBz
ZXQgdG8gMC4gQ2hhbmdpbmcgdGhhdCBmb3IgdGhlIElPIHBhc3N0aHJvdWdoCj4gY2FzZSB3b3Vs
ZCByZXF1aXJlIHRoZSBpb2N0bCBjbWQgYW5kIGFyZyB0byBiZSBwYXNzZWQgdG8gZG0ncwo+IHBy
ZXBhcmVfaW9jdGwoKSBtZXRob2QuCj4gLS0tCj4gICBkcml2ZXJzL21kL2RtLW1wYXRoLmMgfCAy
ICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS1tcGF0aC5jIGIvZHJpdmVycy9tZC9kbS1tcGF0
aC5jCj4gaW5kZXggNThmZDEzNy4uZjliNmE3YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21kL2Rt
LW1wYXRoLmMKPiArKysgYi9kcml2ZXJzL21kL2RtLW1wYXRoLmMKPiBAQCAtMTkxNiw3ICsxOTE2
LDcgQEAgc3RhdGljIGludCBtdWx0aXBhdGhfcHJlcGFyZV9pb2N0bChzdHJ1Y3QgZG1fdGFyZ2V0
ICp0aSwKPiAgIAlpbnQgcjsKPiAgIAo+ICAgCWN1cnJlbnRfcGdwYXRoID0gUkVBRF9PTkNFKG0t
PmN1cnJlbnRfcGdwYXRoKTsKPiAtCWlmICghY3VycmVudF9wZ3BhdGgpCj4gKwlpZiAoIWN1cnJl
bnRfcGdwYXRoIHx8ICF0ZXN0X2JpdChNUEFUSEZfUVVFVUVfSU8sICZtLT5mbGFncykpCj4gICAJ
CWN1cnJlbnRfcGdwYXRoID0gY2hvb3NlX3BncGF0aChtLCAwKTsKPiAgIAo+ICAgCWlmIChjdXJy
ZW50X3BncGF0aCkgewo+IApXZWxsIHNwb3R0ZWQuCgpSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5l
Y2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVj
a2UgICAgICAgICAgICBUZWFtbGVhZCBTdG9yYWdlICYgTmV0d29ya2luZwpoYXJlQHN1c2UuZGUg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAz
NjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZl
cgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8v
d3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

