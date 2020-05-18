Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8D71D7EFD
	for <lists+dm-devel@lfdr.de>; Mon, 18 May 2020 18:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589820332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NFX0xsUT4wKZw8Cjtlzw6HQ33wcptcZdC4pasOxbECk=;
	b=QXVEcFCxnyLn0qGPS0MugXUx296Puws6UI1ZTqmGS9V5jOkWsGDKP4o5YPhD+Or3shTN4Q
	ffYYkMcUONE1RdgUfSLY2+kY9hALbGD1UY+FMnSJioiFj9afevnDs2VVnzA+5GZ3BJTGdK
	PFYfWOrdG1Gyxi1BVc2MAJ8N051dDuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-cwNL084EP-CwWQef7ythxw-1; Mon, 18 May 2020 12:45:29 -0400
X-MC-Unique: cwNL084EP-CwWQef7ythxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A38C7474;
	Mon, 18 May 2020 16:45:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC01139D;
	Mon, 18 May 2020 16:45:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A9381809543;
	Mon, 18 May 2020 16:45:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04IGirRt030144 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 May 2020 12:44:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6289219634; Mon, 18 May 2020 16:44:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65435797E9;
	Mon, 18 May 2020 16:44:50 +0000 (UTC)
Date: Mon, 18 May 2020 12:44:49 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200518164449.GA24518@redhat.com>
References: <367320.1589627953@turing-police>
	<7bb0d1c8-b164-d5f3-0218-5c71047c3a8c@suse.de>
MIME-Version: 1.0
In-Reply-To: <7bb0d1c8-b164-d5f3-0218-5c71047c3a8c@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com,
	Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
	linux-kernel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] next-20200514 - build issue in
	drivers/md/dm-zoned-target.c
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gTW9uLCBNYXkgMTggMjAyMCBhdCAgMjoyNWFtIC0wNDAwLApIYW5uZXMgUmVpbmVja2UgPGhh
cmVAc3VzZS5kZT4gd3JvdGU6Cgo+IE9uIDUvMTYvMjAgMToxOSBQTSwgVmFsZGlzIEtsxJN0bmll
a3Mgd3JvdGU6Cj4gPkFtIHNlZWluZyBhIGJ1aWxkIGVycm9yIGluIG5leHQtMDUxNC4gIC0wNDIw
IGJ1aWx0IE9LLgo+ID5idWlsZGluZyBhICdtYWtlIGFsbG1vZGNvbmZpZycgb24gYSBSUGk0IGlu
IDMyLWJpdCBtb2RlLgo+ID4KPiA+ICAgTU9EUE9TVCA3NTc1IG1vZHVsZXMKPiA+RVJST1I6IG1v
ZHBvc3Q6ICJfX2FlYWJpX3VsZGl2bW9kIiBbZHJpdmVycy9tZC9kbS16b25lZC5rb10gdW5kZWZp
bmVkIQo+ID4KPiA+b2JqZHVtcCBhbmQgJ21ha2UgZHJpdmVycy9tZC9kbS16b25lZC10YXJnZXQu
cycgdGVsbHMKPiA+bWUgdGhhdCB0aGUgcHJvYmxlbSBpcyBpbiBmdW5jdGlvbiBkbXpfZml4dXBf
ZGV2aWNlcygpLCBuZWFyIGhlcmU6Cj4gPgo+ID5AIGRyaXZlcnMvbWQvZG0tem9uZWQtdGFyZ2V0
LmM6ODA2OiAgICAgICAgICAgICByZWdfZGV2LT5ucl96b25lcyA9IERJVl9ST1VORF9VUChyZWdf
ZGV2LT5jYXBhY2l0eSwKPiA+ICAgICAgICAgbGRyICAgICByMCwgW3I2LCAjNTZdICAgQCByZWdf
ZGV2XzE2Ni0+Y2FwYWNpdHksIHJlZ19kZXZfMTY2LT5jYXBhY2l0eQo+ID4gICAgICAgICBhZGRz
ICAgIHIxLCByMywgcjEgICAgICBAIHRtcDMxNiwgXzIyNywgcmVnX2Rldl8xNjYtPmNhcGFjaXR5
Cj4gPiAgICAgICAgIGFkYyAgICAgcjAsIHIyLCByMCAgICAgIEAgdG1wMzE1LCBfMjI3LCByZWdf
ZGV2XzE2Ni0+Y2FwYWNpdHkKPiA+ICAgICAgICAgc3VicyAgICByMSwgcjEsICMxICAgICAgQCwg
dG1wMzE2LAo+ID5AIGRyaXZlcnMvbWQvZG0tem9uZWQtdGFyZ2V0LmM6ODA1OiAgICAgICAgICAg
ICByZWdfZGV2LT56b25lX25yX3NlY3RvcnMgPSB6b25lZF9kZXYtPnpvbmVfbnJfc2VjdG9yczsK
PiA+ICAgICAgICAgc3RyZCAgICByMiwgW3I2LCAjODBdICAgQCwgcmVnX2RldiwKPiA+QCBkcml2
ZXJzL21kL2RtLXpvbmVkLXRhcmdldC5jOjgwNjogICAgICAgICAgICAgcmVnX2Rldi0+bnJfem9u
ZXMgPSBESVZfUk9VTkRfVVAocmVnX2Rldi0+Y2FwYWNpdHksCj4gPiAgICAgICAgIHNiYyAgICAg
cjAsIHIwLCAjMCAgICAgIEAsIHRtcDMxNSwKPiA+ICAgICAgICAgYmwgICAgICBfX2FlYWJpX3Vs
ZGl2bW9kICAgICAgICAgICAgICAgIEAKPiA+QCBkcml2ZXJzL21kL2RtLXpvbmVkLXRhcmdldC5j
OjgwNjogICAgICAgICAgICAgcmVnX2Rldi0+bnJfem9uZXMgPSBESVZfUk9VTkRfVVAocmVnX2Rl
di0+Y2FwYWNpdHksCj4gPiAgICAgICAgIHN0ciAgICAgcjEsIFtyNiwgIzY0XSAgIEAgdG1wMzA2
LCByZWdfZGV2XzE2Ni0+bnJfem9uZXMKPiA+Cj4gPmdpdCBibGFtZSBwb2ludHMgYXQgdGhpcyBj
b21taXQ6Cj4gPgo+ID5jb21taXQgNzA5NzgyMDhlYzkxZDc5ODA2NmY0YzI5MWJjOThmZjkxNGJl
YTIyMgo+ID5BdXRob3I6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgo+ID5EYXRlOiAg
IE1vbiBNYXkgMTEgMTA6MjQ6MzAgMjAyMCArMDIwMAo+ID4KPiA+ICAgICBkbSB6b25lZDogbWV0
YWRhdGEgdmVyc2lvbiAyCj4gPgo+ID5SZXZlcnRpbmcgdGhhdCBjb21taXQgbGV0cyB0aGUgYnVp
bGQgY29tcGxldGUuCj4gPgo+ID4KPiBJIHRob3VnaHQgSSd2ZSBzZW5kIGEgcGF0Y2ggdG8gZml4
IHRoYXQgdXA7IERJVl9ST1VORF9VUCgpIG5lZWRzIHRvCj4gYmUgY2hhbmdlZCB0byBESVZfUk9V
TkRfVVBfVUxMKCkuCj4gSSdsbCBiZSBjaGVja2luZyBhbmQgd2lsbCBiZSBzZW5kaW5nIGEgcGF0
Y2ggaWYgbmVjZXNzYXJ5LgoKVW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZyBpdCB3YXMgZml4
ZWQgdXAgd2l0aCB0aGlzIGNvbW1pdCBsYXN0CndlZG5lc2RheSAoMTN0aCk6CgpodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9kZXZpY2UtbWFwcGVyL2xpbnV4
LWRtLmdpdC9jb21taXQvP2g9ZG0tNS44JmlkPTgxYTNhMTQ1M2VjNGU1ZGEwODFlMTM5NTczMjgw
MWE2MDBmZWIzNTIKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

