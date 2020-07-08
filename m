Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1407F218045
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-Omkq-JcKOgCBnNyoVrJFSA-1; Wed, 08 Jul 2020 03:07:08 -0400
X-MC-Unique: Omkq-JcKOgCBnNyoVrJFSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7637818829D4;
	Wed,  8 Jul 2020 07:07:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 161A2B3A65;
	Wed,  8 Jul 2020 07:07:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1CA86C9DA;
	Wed,  8 Jul 2020 07:06:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06876qKn004068 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 03:06:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 981A1114FEFD; Wed,  8 Jul 2020 07:06:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92091114FEFC
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 07:06:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7D0418A6660
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 07:06:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-312-Vm3hm988NpKHPxOu_bAsMA-1;
	Wed, 08 Jul 2020 03:06:45 -0400
X-MC-Unique: Vm3hm988NpKHPxOu_bAsMA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F423CACA0;
	Wed,  8 Jul 2020 07:06:44 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
References: <20200708002023.738147-1-damien.lemoal@wdc.com>
	<20200708002023.738147-3-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <999404f4-ad95-1cf0-d739-e0e892dd96da@suse.de>
Date: Wed, 8 Jul 2020 09:06:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200708002023.738147-3-damien.lemoal@wdc.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06876qKn004068
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [dm-devel] [PATCH 2/2] dm zoned: Remove set but unused variables
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNy84LzIwIDI6MjAgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IEluIGRtel9yZWNsYWlt
X3dvcmsoKSwgdGhlIHZhcmlhYmxlcyBucl91bm1hcF9ybmQgYW5kIG5yX3JuZCBhcmUgc2V0IGJ1
dAo+IHVudXNlZC4gUmVtb3ZlIHRoZW0uCj4gCj4gRml4ZXM6IGY5NzgwOWFlYzU4OSAoImRtIHpv
bmVkOiBwZXItZGV2aWNlIHJlY2xhaW0iKQo+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2Fs
IDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL21kL2RtLXpvbmVkLXJl
Y2xhaW0uYyB8IDUgKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS16b25lZC1yZWNsYWlt
LmMgYi9kcml2ZXJzL21kL2RtLXpvbmVkLXJlY2xhaW0uYwo+IGluZGV4IDljNmUyNjQ0NjViYy4u
OWMwZWNjOTU2OGE0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWQvZG0tem9uZWQtcmVjbGFpbS5j
Cj4gKysrIGIvZHJpdmVycy9tZC9kbS16b25lZC1yZWNsYWltLmMKPiBAQCAtNTAzLDcgKzUwMyw3
IEBAIHN0YXRpYyB2b2lkIGRtel9yZWNsYWltX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3Jr
KQo+ICAgewo+ICAgCXN0cnVjdCBkbXpfcmVjbGFpbSAqenJjID0gY29udGFpbmVyX29mKHdvcmss
IHN0cnVjdCBkbXpfcmVjbGFpbSwgd29yay53b3JrKTsKPiAgIAlzdHJ1Y3QgZG16X21ldGFkYXRh
ICp6bWQgPSB6cmMtPm1ldGFkYXRhOwo+IC0JdW5zaWduZWQgaW50IHBfdW5tYXAsIG5yX3VubWFw
X3JuZCA9IDAsIG5yX3JuZCA9IDA7Cj4gKwl1bnNpZ25lZCBpbnQgcF91bm1hcDsKPiAgIAlpbnQg
cmV0Owo+ICAgCj4gICAJaWYgKGRtel9kZXZfaXNfZHlpbmcoem1kKSkKPiBAQCAtNTI5LDkgKzUy
OSw2IEBAIHN0YXRpYyB2b2lkIGRtel9yZWNsYWltX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQo+ICAgCQl6cmMtPmtjX3Rocm90dGxlLnRocm90dGxlID0gbWluKDc1VSwgMTAwVSAtIHBf
dW5tYXAgLyAyKTsKPiAgIAl9Cj4gICAKPiAtCW5yX3VubWFwX3JuZCA9IGRtel9ucl91bm1hcF9y
bmRfem9uZXMoem1kLCB6cmMtPmRldl9pZHgpOwo+IC0JbnJfcm5kID0gZG16X25yX3JuZF96b25l
cyh6bWQsIHpyYy0+ZGV2X2lkeCk7Cj4gLQo+ICAgCURNREVCVUcoIiglcy8ldSk6IFJlY2xhaW0g
KCV1KTogJXMsICV1JSUgZnJlZSB6b25lcyAoJXUvJXUgY2FjaGUgJXUvJXUgcmFuZG9tKSIsCj4g
ICAJCWRtel9tZXRhZGF0YV9sYWJlbCh6bWQpLCB6cmMtPmRldl9pZHgsCj4gICAJCXpyYy0+a2Nf
dGhyb3R0bGUudGhyb3R0bGUsCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVA
c3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAg
ICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBO
w7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoKLS0KZG0t
ZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

