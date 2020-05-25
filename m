Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 153961E0839
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 09:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590393240;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jqBlyW0G44MvlKvW03UDYm+eLgdDtulLN/lrdK3vN5Q=;
	b=DRA4gUxpugdsDsb8mQqZEo6eOibPdf+tRZljsPGHikUxIj1yYGtDaZ+OYWNmD5DnJTpWuY
	/7F5CG+AFqcU/Q4yC0eZGwOTX/PXuiVPHr5zpQavBwGYC4FCdiesYJB1Xxj9rcvlAuqVzf
	sNizUtl5KdjV4R6Cpp0Z2KznMLJtl58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-IOlYm4LpPoSXydxehRnAjg-1; Mon, 25 May 2020 03:53:58 -0400
X-MC-Unique: IOlYm4LpPoSXydxehRnAjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3CB21005512;
	Mon, 25 May 2020 07:53:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C90179C22;
	Mon, 25 May 2020 07:53:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF3397CCC5;
	Mon, 25 May 2020 07:53:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P7rebJ023763 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 03:53:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4531833239; Mon, 25 May 2020 07:53:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3508A3323C
	for <dm-devel@redhat.com>; Mon, 25 May 2020 07:53:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 596BC800294
	for <dm-devel@redhat.com>; Mon, 25 May 2020 07:53:37 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-204-ZKJRPUd4NsOOFBkdoxxesQ-1;
	Mon, 25 May 2020 03:53:34 -0400
X-MC-Unique: ZKJRPUd4NsOOFBkdoxxesQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 142E6ABEC;
	Mon, 25 May 2020 07:53:36 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-12-hare@suse.de>
	<CY4PR04MB375158B6B94B1452DFDFCF98E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <d597df35-f014-ec87-16b7-38bfa77f9241@suse.de>
Date: Mon, 25 May 2020 09:53:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB375158B6B94B1452DFDFCF98E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P7rebJ023763
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 11/12] dm-zoned: round-robin load balancer
 for reclaiming zones
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8yNS8yMCA0OjQyIEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzA1LzIz
IDA6MzksIEhhbm5lcyBSZWluZWNrZSB3cm90ZToKPj4gV2hlbiByZWNsYWltaW5nIHpvbmVzIHdl
IHNob3VsZCBhcmJpdHJhdGUgYmV0d2VlbiB0aGUgem9uZWQKPj4gZGV2aWNlcyB0byBnZXQgYSBi
ZXR0ZXIgdGhyb3VnaHB1dC4gU28gaW1wbGVtZW50IGEgc2ltcGxlCj4+IHJvdW5kLXJvYmluIGxv
YWQgYmFsYW5jZXIgYmV0d2VlbiB0aGUgem9uZWQgZGV2aWNlcy4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbWQv
ZG0tem9uZWQtbWV0YWRhdGEuYyB8IDggKysrKysrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21k
L2RtLXpvbmVkLW1ldGFkYXRhLmMgYi9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMKPj4g
aW5kZXggODc3ODRlNzc4NWJjLi4yNWRjYWQyYTU2NWYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bWQvZG0tem9uZWQtbWV0YWRhdGEuYwo+PiArKysgYi9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFk
YXRhLmMKPj4gQEAgLTE3MSw2ICsxNzEsOCBAQCBzdHJ1Y3QgZG16X21ldGFkYXRhIHsKPj4gICAJ
dW5zaWduZWQgaW50CQlucl9yZXNlcnZlZF9zZXE7Cj4+ICAgCXVuc2lnbmVkIGludAkJbnJfY2h1
bmtzOwo+PiAgIAo+PiArCXVuc2lnbmVkIGludAkJbGFzdF9hbGxvY19pZHg7Cj4+ICsKPj4gICAJ
LyogWm9uZSBpbmZvcm1hdGlvbiBhcnJheSAqLwo+PiAgIAlzdHJ1Y3QgeGFycmF5CQl6b25lczsK
Pj4gICAKPj4gQEAgLTIxNzgsNyArMjE4MCw3IEBAIHN0cnVjdCBkbV96b25lICpkbXpfYWxsb2Nf
em9uZShzdHJ1Y3QgZG16X21ldGFkYXRhICp6bWQsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4+ICAg
ewo+PiAgIAlzdHJ1Y3QgbGlzdF9oZWFkICpsaXN0Owo+PiAgIAlzdHJ1Y3QgZG1fem9uZSAqem9u
ZTsKPj4gLQl1bnNpZ25lZCBpbnQgZGV2X2lkeCA9IDA7Cj4+ICsJdW5zaWduZWQgaW50IGRldl9p
ZHggPSB6bWQtPmxhc3RfYWxsb2NfaWR4Owo+PiAgIAo+PiAgIGFnYWluOgo+PiAgIAlpZiAoZmxh
Z3MgJiBETVpfQUxMT0NfQ0FDSEUpCj4+IEBAIC0yMjE0LDYgKzIyMTYsOSBAQCBzdHJ1Y3QgZG1f
em9uZSAqZG16X2FsbG9jX3pvbmUoc3RydWN0IGRtel9tZXRhZGF0YSAqem1kLCB1bnNpZ25lZCBs
b25nIGZsYWdzKQo+PiAgIAl6b25lID0gbGlzdF9maXJzdF9lbnRyeShsaXN0LCBzdHJ1Y3QgZG1f
em9uZSwgbGluayk7Cj4+ICAgCWxpc3RfZGVsX2luaXQoJnpvbmUtPmxpbmspOwo+PiAgIAo+PiAr
CWlmICghKGZsYWdzICYgRE1aX0FMTE9DX0NBQ0hFKSkKPj4gKwkJem1kLT5sYXN0X2FsbG9jX2lk
eCA9IChkZXZfaWR4ICsgMSkgJSB6bWQtPm5yX2RldnM7Cj4+ICsKPj4gICAJaWYgKGRtel9pc19j
YWNoZSh6b25lKSkKPj4gICAJCWF0b21pY19kZWMoJnptZC0+dW5tYXBfbnJfY2FjaGUpOwo+PiAg
IAllbHNlIGlmIChkbXpfaXNfcm5kKHpvbmUpKQo+PiBAQCAtMjgzOSw2ICsyODQ0LDcgQEAgaW50
IGRtel9jdHJfbWV0YWRhdGEoc3RydWN0IGRtel9kZXYgKmRldiwgaW50IG51bV9kZXYsCj4+ICAg
CXptZC0+ZGV2ID0gZGV2Owo+PiAgIAl6bWQtPm5yX2RldnMgPSBudW1fZGV2Owo+PiAgIAl6bWQt
Pm1ibGtfcmJ0cmVlID0gUkJfUk9PVDsKPj4gKwl6bWQtPmxhc3RfYWxsb2NfaWR4ID0gMDsKPj4g
ICAJaW5pdF9yd3NlbSgmem1kLT5tYmxrX3NlbSk7Cj4+ICAgCW11dGV4X2luaXQoJnptZC0+bWJs
a19mbHVzaF9sb2NrKTsKPj4gICAJc3Bpbl9sb2NrX2luaXQoJnptZC0+bWJsa19sb2NrKTsKPj4K
PiAKPiAKPiBPSy4gU28gbXkgY29tbWVudCBvbiBwYXRjaCA4IGlzIGFscmVhZHkgYWRkcmVzc2Vk
LiBPciBhdCBsZWFzdCBwYXJ0bHkuLi4gV2hlcmUKPiBpcyBsYXN0X2FsbG9jX2lkeCBhY3R1YWxs
eSB1c2VkID8gSXQgbG9va3MgbGlrZSB0aGlzIG9ubHkgc2V0cyBsYXN0X2FsbG9jX2lkeAo+IGJ1
dCBkbyBub3QgdXNlIHRoYXQgdmFsdWUgb24gZW50cnkgdG8gZG16X2FsbG9jX3pvbmUoKSB0byBh
bGxvY2F0ZSB0aGUgem9uZS4KPiAKQXcsIGZzY2suIFNvbWV0aGluZyB3ZW50IGFzdHJheSB3aGVu
IGdlbmVyYXRpbmcgdGhlIHBhdGNoZXMuCldpbGwgYmUgZml4aW5nIGl0IHVwIGZvciB0aGUgbmV4
dCByb3VuZC4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAg
ICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBO
w7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoKLS0KZG0t
ZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

