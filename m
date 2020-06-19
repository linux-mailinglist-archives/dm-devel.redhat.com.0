Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 62469200346
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 10:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592554073;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cJBn15t/cV5asqMq9P+4LDzGLh97N6OW9DX6ZkyU5EI=;
	b=ald0AfMwdYHdw+T6zzjcjIjHnYt7GbaXyKXdW8B24kjI+/0z06SthAnxGolq6NZQnqEzd8
	1aVzz9DXMnOWBI6QqP8GnHE8+2M3rMo5qFToFDEsRvVy7dO2WlJH+7X9rRfmhC/FU+gWeH
	RPuSLqcktP2/DOKqa9cJWBnGwBsSWTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-N3VzC3cdNJKILvt2aya1kQ-1; Fri, 19 Jun 2020 04:07:51 -0400
X-MC-Unique: N3VzC3cdNJKILvt2aya1kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A43A5107ACF3;
	Fri, 19 Jun 2020 08:07:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EB125C1D0;
	Fri, 19 Jun 2020 08:07:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEA831809547;
	Fri, 19 Jun 2020 08:07:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J87YOM024605 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 04:07:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFA0C2156A2E; Fri, 19 Jun 2020 08:07:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAD752157F23
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 08:07:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7447E8316EB
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 08:07:32 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-261-98Oq-a64MGynPU8c2RaEPg-1;
	Fri, 19 Jun 2020 04:07:30 -0400
X-MC-Unique: 98Oq-a64MGynPU8c2RaEPg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id EA115AC85;
	Fri, 19 Jun 2020 08:07:27 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
References: <20200619074956.352647-1-damien.lemoal@wdc.com>
	<20200619074956.352647-2-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <57fa0c31-0c73-9142-b116-25d637d32485@suse.de>
Date: Fri, 19 Jun 2020 10:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619074956.352647-2-damien.lemoal@wdc.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05J87YOM024605
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm zoned: Fix random zone reclaim
	selection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNi8xOS8yMCA5OjQ5IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBDb21taXQgMjA5NDA0
NWZlNWI1ICgiZG0gem9uZWQ6IHByZWZlciBmdWxsIHpvbmVzIGZvciByZWNsYWltIikKPiBtb2Rp
ZmllZCBkbXpfZ2V0X3JuZF96b25lX2Zvcl9yZWNsYWltKCkgdG8gYWRkIGEgc2VhcmNoIGZvciB0
aGUgYnVmZmVyCj4gem9uZSB3aXRoIHRoZSBoZWF2aWVzdCB3ZWlnaHQgYXMgYW4gb3B0aW1hbCBj
YW5kaWRhdGUgZm9yIHJlY2xhaW0uIFRoaXMKPiBtb2RpZmljYXRpb24gdXNlcyB0aGUgem9uZSBw
b2ludGVyIHZhcmlhYmwgImxhc3QiIHdoaWNoIGlzIHNldCBvbmx5IG9uY2UKPiBhbmQgbmV2ZXIg
bW9kaWZpZWQgYXMgem9uZXMgYXJlIHNjYW5uZWQsIHJlc3VsdGluZyBpbiB0aGUgc2VhcmNoIGJl
aW5nCj4gaW5lZmVjdGl2ZS4gRnVydGhlcm1vcmUsIGlmIHRoZSBzZWxlY3RlZCBidWZmZXIgem9u
ZSBhdCB0aGUgZW5kIG9mIHRoZQo+IHNlYXJjaCBsb29wIGlzIGFjdGl2ZSBvciBhbHJlYWR5IGxv
Y2tlZCBmb3IgcmVjbGFpbSwKPiBkbXpfZ2V0X3JuZF96b25lX2Zvcl9yZWNsYWltKCkgcmV0dXJu
cyBOVUxMIGV2ZW4gaWYgb3RoZXIgcmFuZG9tIHpvbmVzCj4gd2l0aCBhIGxlc3NlciB3ZWlnaHQg
Y2FuIGJlIHJlY2xhaW1lZC4KPiAKPiBUbyBmaXggdGhlIHNlYXJjaCBhbmQgdG8gZ3VhcmFudGVl
IHRoYXQgcmVjbGFpbSBjYW4gbWFrZSBmb3J3YXJkCj4gcHJvZ3Jlc3MsIGZpeCBkbXpfZ2V0X3Ju
ZF96b25lX2Zvcl9yZWNsYWltKCkgbG9vcCB0byBjb3JyZWN0bHkgZmluZAo+IHRoZSBidWZmZXIg
em9uZSB3aXRoIHRoZSBoZWF2aWVzdCB3ZWlnaHQgdXNpbmcgdGhlIHZhcmlhYmxlIG1heHdfei4K
PiBBbHNvIG1ha2Ugc3VyZSB0byBmYWxsYmFjayB0byBmaW5kaW5nIHRoZSBmaXJzdCByYW5kb20g
em9uZSB0aGF0IGNhbgo+IGJlIHJlY2xhaW1lZCBpZiB0aGlzIGJlc3QgY2FuZGlkYXRlIHpvbmUg
Y2Fubm90IGJlIHJlY2xhaW1lZC4KPiAKPiBXaGlsZSBhdCBpdCwgYWxzbyBmaXggdGhlIGRldmlj
ZSBpbmRleCBjaGVjayB0byBjb25zaWRlciBvbmx5IHJhbmRvbQo+IHpvbmVzLCBpZ25vcmluZyBj
YWNoZSB6b25lcyBiZWxvbmdpbmcgdG8gdGhlIGNhY2hlIGRldmljZSBpZiBvbmUgaXMKPiB1c2Vk
IGFzIHRoYXQgZGV2aWNlIGRvZXMgbm90IGhhdmUgYSByZWNsYWltIHByb2Nlc3MuCj4gCj4gRml4
ZXM6IDIwOTQwNDVmZTViNSAoImRtIHpvbmVkOiBwcmVmZXIgZnVsbCB6b25lcyBmb3IgcmVjbGFp
bSIpCj4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNv
bT4KPiAtLS0KPiAgIGRyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRhdGEuYyB8IDM1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLXpv
bmVkLW1ldGFkYXRhLmMgYi9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMKPiBpbmRleCAx
MzBiNWE2ZDlmMTIuLjhiZGY3MWRjZTdmYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21kL2RtLXpv
bmVkLW1ldGFkYXRhLmMKPiArKysgYi9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMKPiBA
QCAtMTk0OSw3ICsxOTQ5LDcgQEAgc3RhdGljIHN0cnVjdCBkbV96b25lICpkbXpfZ2V0X3JuZF96
b25lX2Zvcl9yZWNsYWltKHN0cnVjdCBkbXpfbWV0YWRhdGEgKnptZCwKPiAgIAkJCQkJCSAgICB1
bnNpZ25lZCBpbnQgaWR4LCBib29sIGlkbGUpCj4gICB7Cj4gICAJc3RydWN0IGRtX3pvbmUgKmR6
b25lID0gTlVMTDsKPiAtCXN0cnVjdCBkbV96b25lICp6b25lLCAqbGFzdCA9IE5VTEw7Cj4gKwlz
dHJ1Y3QgZG1fem9uZSAqem9uZSwgKm1heHdfeiA9IE5VTEw7Cj4gICAJc3RydWN0IGxpc3RfaGVh
ZCAqem9uZV9saXN0Owo+ICAgCj4gICAJLyogSWYgd2UgaGF2ZSBjYWNoZSB6b25lcyBzZWxlY3Qg
ZnJvbSB0aGUgY2FjaGUgem9uZSBsaXN0ICovCj4gQEAgLTE5NjEsMTggKzE5NjEsMzcgQEAgc3Rh
dGljIHN0cnVjdCBkbV96b25lICpkbXpfZ2V0X3JuZF96b25lX2Zvcl9yZWNsYWltKHN0cnVjdCBk
bXpfbWV0YWRhdGEgKnptZCwKPiAgIAl9IGVsc2UKPiAgIAkJem9uZV9saXN0ID0gJnptZC0+ZGV2
W2lkeF0ubWFwX3JuZF9saXN0Owo+ICAgCj4gKwkvKgo+ICsJICogRmluZCB0aGUgYnVmZmVyIHpv
bmUgd2l0aCB0aGUgaGVhdmllc3Qgd2VpZ2h0IG9yIHRoZSBmaXJzdCAob2xkZXN0KQo+ICsJICog
ZGF0YSB6b25lIHRoYXQgY2FuIGJlIHJlY2xhaW1lZC4KPiArCSAqLwo+ICAgCWxpc3RfZm9yX2Vh
Y2hfZW50cnkoem9uZSwgem9uZV9saXN0LCBsaW5rKSB7Cj4gICAJCWlmIChkbXpfaXNfYnVmKHpv
bmUpKSB7Cj4gICAJCQlkem9uZSA9IHpvbmUtPmJ6b25lOwo+IC0JCQlpZiAoZHpvbmUtPmRldi0+
ZGV2X2lkeCAhPSBpZHgpCj4gKwkJCWlmIChkbXpfaXNfcm5kKGR6b25lKSAmJiBkem9uZS0+ZGV2
LT5kZXZfaWR4ICE9IGlkeCkKPiAgIAkJCQljb250aW51ZTsKPiAtCQkJaWYgKCFsYXN0KSB7Cj4g
LQkJCQlsYXN0ID0gZHpvbmU7Cj4gLQkJCQljb250aW51ZTsKPiAtCQkJfQo+IC0JCQlpZiAobGFz
dC0+d2VpZ2h0IDwgZHpvbmUtPndlaWdodCkKPiArCQkJaWYgKCFtYXh3X3ogfHwgbWF4d196LT53
ZWlnaHQgPCBkem9uZS0+d2VpZ2h0KQo+ICsJCQkJbWF4d196ID0gZHpvbmU7Cj4gKwkJfSBlbHNl
IHsKPiArCQkJZHpvbmUgPSB6b25lOwo+ICsJCQlpZiAoZG16X2xvY2tfem9uZV9yZWNsYWltKGR6
b25lKSkKPiArCQkJCXJldHVybiBkem9uZTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJaWYgKG1heHdf
eiAmJiBkbXpfbG9ja196b25lX3JlY2xhaW0obWF4d196KSkKPiArCQlyZXR1cm4gbWF4d196Owo+
ICsKPiArCS8qCj4gKwkgKiBJZiB3ZSBjb21lIGhlcmUsIG5vbmUgb2YgdGhlIHpvbmVzIGluc3Bl
Y3RlZCBjb3VsZCBiZSBsb2NrZWQgZm9yCj4gKwkgKiByZWNsYWltLiBUcnkgYWdhaW4sIGJlaW5n
IG1vcmUgYWdncmVzc2l2ZSwgdGhhdCBpcywgZmluZCB0aGUKPiArCSAqIGZpcnN0IHpvbmUgdGhh
dCBjYW4gYmUgcmVjbGFpbWVkIHJlZ2FyZGxlc3Mgb2YgaXRzIHdlaXRnaHQuCj4gKwkgKi8KPiAr
CWxpc3RfZm9yX2VhY2hfZW50cnkoem9uZSwgem9uZV9saXN0LCBsaW5rKSB7Cj4gKwkJaWYgKGRt
el9pc19idWYoem9uZSkpIHsKPiArCQkJZHpvbmUgPSB6b25lLT5iem9uZTsKPiArCQkJaWYgKGRt
el9pc19ybmQoZHpvbmUpICYmIGR6b25lLT5kZXYtPmRldl9pZHggIT0gaWR4KQo+ICAgCQkJCWNv
bnRpbnVlOwo+IC0JCQlkem9uZSA9IGxhc3Q7Cj4gICAJCX0gZWxzZQo+ICAgCQkJZHpvbmUgPSB6
b25lOwo+ICAgCQlpZiAoZG16X2xvY2tfem9uZV9yZWNsYWltKGR6b25lKSkKPiAKSSBrbm93IGl0
IHdhc24ndCB0aGF0IGVhc3kuIFRoYW5rcyBmb3IgdGhlIGZpeC4KClJldmlld2VkLWJ5OiBIYW5u
ZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5l
cyBSZWluZWNrZSAgICAgICAgICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVA
c3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1l
bmTDtnJmZmVyCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20K
aHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

