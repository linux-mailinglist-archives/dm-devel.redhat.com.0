Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 787A120CD1D
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 10:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593417805;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vVRbnv0iemORY52pENkwO72EsrVyqb+zsLgh9ArQIaI=;
	b=F1Mh4k5JgBGxmL5Jg1vRr30np7eWCV6ROcLoPIhIbqFNWL3emdpX1qTBQhG6mmm7yLWHYG
	Nzsq305s0tFb3groZreTZK3K1Do7FZpAvOLMs/S6SBMV2Mcky03NW7G4t81YS1izc25/MX
	7NOhFMl2jskBMYGjD7aXJ+a7s+2OU+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Ux7VGcKWPiKB__jTTxPPTQ-1; Mon, 29 Jun 2020 04:03:23 -0400
X-MC-Unique: Ux7VGcKWPiKB__jTTxPPTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E479B100CD0D;
	Mon, 29 Jun 2020 08:03:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF01260C81;
	Mon, 29 Jun 2020 08:03:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64B46180954D;
	Mon, 29 Jun 2020 08:03:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05S18mlU010413 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 21:08:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 760A72144B5B; Sun, 28 Jun 2020 01:08:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E7FD2156A50
	for <dm-devel@redhat.com>; Sun, 28 Jun 2020 01:08:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74D23101A525
	for <dm-devel@redhat.com>; Sun, 28 Jun 2020 01:08:46 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-216-Dul9aItiMwGnA4DBBIutYA-1; Sat, 27 Jun 2020 21:08:43 -0400
X-MC-Unique: Dul9aItiMwGnA4DBBIutYA-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 57A59A24BF0B97332D6E;
	Sun, 28 Jun 2020 09:08:39 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.106) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
	Sun, 28 Jun 2020 09:08:35 +0800
To: Bryan Gurney <bgurney@redhat.com>, <dm-devel@redhat.com>,
	<snitzer@redhat.com>, <agk@redhat.com>
References: <1592601039-3868-1-git-send-email-bgurney@redhat.com>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <ab1e38c7-0394-a685-a406-2ead0291f4d5@huawei.com>
Date: Sun, 28 Jun 2020 09:08:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1592601039-3868-1-git-send-email-bgurney@redhat.com>
X-Originating-IP: [10.174.179.106]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05S18mlU010413
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2020 04:02:53 -0400
Subject: Re: [dm-devel] [PATCH v4 1/4] dm dust: report some message results
 back to user directly
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Content-Transfer-Encoding: base64

SGkgTWlrZSwgZG9lcyB0aGVyZSBhbnkgYWR2aWNlIGZvciB0aGlzIHBhdGNoc2V0PwoKVGhhbmtz
LApLdW4uCgrU2iAyMDIwLzYvMjAgNToxMCwgQnJ5YW4gR3VybmV5INC0tcA6Cj4gRnJvbTogeWFu
Z2Vya3VuIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4KPiAKPiBGcm9tOiB5YW5nZXJrdW4gPHlhbmdl
cmt1bkBodWF3ZWkuY29tPgo+IAo+IFNvbWUgdHlwZSBvZiBtZXNzYWdlKHF1ZXJ5YmxvY2svY291
bnRiYWRibG9ja3MvcmVtb3ZlYmFkYmxvY2spIG1heSBiZXR0ZXIKPiByZXBvcnQgcmVzdWx0cyB0
byB1c2VyIGRpcmVjdGx5LiBEbyBpdCB3aXRoIERNRU1JVC4KPiAKPiBbQnJ5YW46IG1haW50YWlu
IF9fZnVuY19fIG91dHB1dCBpbiBETUVNSVQgbWVzc2FnZXNdCj4gCj4gU2lnbmVkLW9mZi1ieTog
eWFuZ2Vya3VuIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCcnlhbiBH
dXJuZXkgPGJndXJuZXlAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbWQvZG0tZHVzdC5j
IHwgMzEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL21kL2RtLWR1c3QuYyBiL2RyaXZlcnMvbWQvZG0tZHVzdC5jCj4gaW5kZXggZmYwM2I5MDA3
MmM1Li5mMWYyZGQ2YTRlODQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZC9kbS1kdXN0LmMKPiAr
KysgYi9kcml2ZXJzL21kL2RtLWR1c3QuYwo+IEBAIC0xMzgsMjAgKzEzOCwyMiBAQCBzdGF0aWMg
aW50IGR1c3RfYWRkX2Jsb2NrKHN0cnVjdCBkdXN0X2RldmljZSAqZGQsIHVuc2lnbmVkIGxvbmcg
bG9uZyBibG9jaywKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IGR1c3Rf
cXVlcnlfYmxvY2soc3RydWN0IGR1c3RfZGV2aWNlICpkZCwgdW5zaWduZWQgbG9uZyBsb25nIGJs
b2NrKQo+ICtzdGF0aWMgaW50IGR1c3RfcXVlcnlfYmxvY2soc3RydWN0IGR1c3RfZGV2aWNlICpk
ZCwgdW5zaWduZWQgbG9uZyBsb25nIGJsb2NrLCBjaGFyICpyZXN1bHQsCj4gKwkJCSAgICB1bnNp
Z25lZCBpbnQgbWF4bGVuLCB1bnNpZ25lZCBpbnQgKnN6X3B0cikKPiAgIHsKPiAgIAlzdHJ1Y3Qg
YmFkYmxvY2sgKmJibG9jazsKPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICsJdW5zaWduZWQg
aW50IHN6ID0gKnN6X3B0cjsKPiAgIAo+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZkZC0+ZHVzdF9s
b2NrLCBmbGFncyk7Cj4gICAJYmJsb2NrID0gZHVzdF9yYl9zZWFyY2goJmRkLT5iYWRibG9ja2xp
c3QsIGJsb2NrKTsKPiAgIAlpZiAoYmJsb2NrICE9IE5VTEwpCj4gLQkJRE1JTkZPKCIlczogYmxv
Y2sgJWxsdSBmb3VuZCBpbiBiYWRibG9ja2xpc3QiLCBfX2Z1bmNfXywgYmxvY2spOwo+ICsJCURN
RU1JVCgiJXM6IGJsb2NrICVsbHUgZm91bmQgaW4gYmFkYmxvY2tsaXN0IiwgX19mdW5jX18sIGJs
b2NrKTsKPiAgIAllbHNlCj4gLQkJRE1JTkZPKCIlczogYmxvY2sgJWxsdSBub3QgZm91bmQgaW4g
YmFkYmxvY2tsaXN0IiwgX19mdW5jX18sIGJsb2NrKTsKPiArCQlETUVNSVQoIiVzOiBibG9jayAl
bGx1IG5vdCBmb3VuZCBpbiBiYWRibG9ja2xpc3QiLCBfX2Z1bmNfXywgYmxvY2spOwo+ICAgCXNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmRkLT5kdXN0X2xvY2ssIGZsYWdzKTsKPiAgIAo+IC0JcmV0
dXJuIDA7Cj4gKwlyZXR1cm4gMTsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIGludCBfX2R1c3RfbWFw
X3JlYWQoc3RydWN0IGR1c3RfZGV2aWNlICpkZCwgc2VjdG9yX3QgdGhpc2Jsb2NrKQo+IEBAIC0y
NTksMTEgKzI2MSwxMyBAQCBzdGF0aWMgYm9vbCBfX2R1c3RfY2xlYXJfYmFkYmxvY2tzKHN0cnVj
dCByYl9yb290ICp0cmVlLAo+ICAgCXJldHVybiB0cnVlOwo+ICAgfQo+ICAgCj4gLXN0YXRpYyBp
bnQgZHVzdF9jbGVhcl9iYWRibG9ja3Moc3RydWN0IGR1c3RfZGV2aWNlICpkZCkKPiArc3RhdGlj
IGludCBkdXN0X2NsZWFyX2JhZGJsb2NrcyhzdHJ1Y3QgZHVzdF9kZXZpY2UgKmRkLCBjaGFyICpy
ZXN1bHQsIHVuc2lnbmVkIGludCBtYXhsZW4sCj4gKwkJCQl1bnNpZ25lZCBpbnQgKnN6X3B0cikK
PiAgIHsKPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgCXN0cnVjdCByYl9yb290IGJhZGJs
b2NrbGlzdDsKPiAgIAl1bnNpZ25lZCBsb25nIGxvbmcgYmFkYmxvY2tfY291bnQ7Cj4gKwl1bnNp
Z25lZCBpbnQgc3ogPSAqc3pfcHRyOwo+ICAgCj4gICAJc3Bpbl9sb2NrX2lycXNhdmUoJmRkLT5k
dXN0X2xvY2ssIGZsYWdzKTsKPiAgIAliYWRibG9ja2xpc3QgPSBkZC0+YmFkYmxvY2tsaXN0Owo+
IEBAIC0yNzMsMTEgKzI3NywxMSBAQCBzdGF0aWMgaW50IGR1c3RfY2xlYXJfYmFkYmxvY2tzKHN0
cnVjdCBkdXN0X2RldmljZSAqZGQpCj4gICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGQtPmR1
c3RfbG9jaywgZmxhZ3MpOwo+ICAgCj4gICAJaWYgKCFfX2R1c3RfY2xlYXJfYmFkYmxvY2tzKCZi
YWRibG9ja2xpc3QsIGJhZGJsb2NrX2NvdW50KSkKPiAtCQlETUlORk8oIiVzOiBubyBiYWRibG9j
a3MgZm91bmQiLCBfX2Z1bmNfXyk7Cj4gKwkJRE1FTUlUKCIlczogbm8gYmFkYmxvY2tzIGZvdW5k
IiwgX19mdW5jX18pOwo+ICAgCWVsc2UKPiAtCQlETUlORk8oIiVzOiBiYWRibG9ja3MgY2xlYXJl
ZCIsIF9fZnVuY19fKTsKPiArCQlETUVNSVQoIiVzOiBiYWRibG9ja3MgY2xlYXJlZCIsIF9fZnVu
Y19fKTsKPiAgIAo+IC0JcmV0dXJuIDA7Cj4gKwlyZXR1cm4gMTsKPiAgIH0KPiAgIAo+ICAgLyoK
PiBAQCAtMzgzLDcgKzM4Nyw3IEBAIHN0YXRpYyB2b2lkIGR1c3RfZHRyKHN0cnVjdCBkbV90YXJn
ZXQgKnRpKQo+ICAgfQo+ICAgCj4gICBzdGF0aWMgaW50IGR1c3RfbWVzc2FnZShzdHJ1Y3QgZG1f
dGFyZ2V0ICp0aSwgdW5zaWduZWQgaW50IGFyZ2MsIGNoYXIgKiphcmd2LAo+IC0JCQljaGFyICpy
ZXN1bHRfYnVmLCB1bnNpZ25lZCBpbnQgbWF4bGVuKQo+ICsJCQljaGFyICpyZXN1bHQsIHVuc2ln
bmVkIGludCBtYXhsZW4pCj4gICB7Cj4gICAJc3RydWN0IGR1c3RfZGV2aWNlICpkZCA9IHRpLT5w
cml2YXRlOwo+ICAgCXNlY3Rvcl90IHNpemUgPSBpX3NpemVfcmVhZChkZC0+ZGV2LT5iZGV2LT5i
ZF9pbm9kZSkgPj4gU0VDVE9SX1NISUZUOwo+IEBAIC0zOTMsNiArMzk3LDcgQEAgc3RhdGljIGlu
dCBkdXN0X21lc3NhZ2Uoc3RydWN0IGRtX3RhcmdldCAqdGksIHVuc2lnbmVkIGludCBhcmdjLCBj
aGFyICoqYXJndiwKPiAgIAl1bnNpZ25lZCBjaGFyIHdyX2ZhaWxfY250Owo+ICAgCXVuc2lnbmVk
IGludCB0bXBfdWk7Cj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCXVuc2lnbmVkIGludCBz
eiA9IDA7Cj4gICAJY2hhciBkdW1teTsKPiAgIAo+ICAgCWlmIChhcmdjID09IDEpIHsKPiBAQCAt
NDEwLDEyICs0MTUsMTIgQEAgc3RhdGljIGludCBkdXN0X21lc3NhZ2Uoc3RydWN0IGRtX3Rhcmdl
dCAqdGksIHVuc2lnbmVkIGludCBhcmdjLCBjaGFyICoqYXJndiwKPiAgIAkJCXIgPSAwOwo+ICAg
CQl9IGVsc2UgaWYgKCFzdHJjYXNlY21wKGFyZ3ZbMF0sICJjb3VudGJhZGJsb2NrcyIpKSB7Cj4g
ICAJCQlzcGluX2xvY2tfaXJxc2F2ZSgmZGQtPmR1c3RfbG9jaywgZmxhZ3MpOwo+IC0JCQlETUlO
Rk8oImNvdW50YmFkYmxvY2tzOiAlbGx1IGJhZGJsb2NrKHMpIGZvdW5kIiwKPiArCQkJRE1FTUlU
KCJjb3VudGJhZGJsb2NrczogJWxsdSBiYWRibG9jayhzKSBmb3VuZCIsCj4gICAJCQkgICAgICAg
ZGQtPmJhZGJsb2NrX2NvdW50KTsKPiAgIAkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRkLT5k
dXN0X2xvY2ssIGZsYWdzKTsKPiAtCQkJciA9IDA7Cj4gKwkJCXIgPSAxOwo+ICAgCQl9IGVsc2Ug
aWYgKCFzdHJjYXNlY21wKGFyZ3ZbMF0sICJjbGVhcmJhZGJsb2NrcyIpKSB7Cj4gLQkJCXIgPSBk
dXN0X2NsZWFyX2JhZGJsb2NrcyhkZCk7Cj4gKwkJCXIgPSBkdXN0X2NsZWFyX2JhZGJsb2Nrcyhk
ZCwgcmVzdWx0LCBtYXhsZW4sICZzeik7Cj4gICAJCX0gZWxzZSBpZiAoIXN0cmNhc2VjbXAoYXJn
dlswXSwgInF1aWV0IikpIHsKPiAgIAkJCWlmICghZGQtPnF1aWV0X21vZGUpCj4gICAJCQkJZGQt
PnF1aWV0X21vZGUgPSB0cnVlOwo+IEBAIC00NDEsNyArNDQ2LDcgQEAgc3RhdGljIGludCBkdXN0
X21lc3NhZ2Uoc3RydWN0IGRtX3RhcmdldCAqdGksIHVuc2lnbmVkIGludCBhcmdjLCBjaGFyICoq
YXJndiwKPiAgIAkJZWxzZSBpZiAoIXN0cmNhc2VjbXAoYXJndlswXSwgInJlbW92ZWJhZGJsb2Nr
IikpCj4gICAJCQlyID0gZHVzdF9yZW1vdmVfYmxvY2soZGQsIGJsb2NrKTsKPiAgIAkJZWxzZSBp
ZiAoIXN0cmNhc2VjbXAoYXJndlswXSwgInF1ZXJ5YmxvY2siKSkKPiAtCQkJciA9IGR1c3RfcXVl
cnlfYmxvY2soZGQsIGJsb2NrKTsKPiArCQkJciA9IGR1c3RfcXVlcnlfYmxvY2soZGQsIGJsb2Nr
LCByZXN1bHQsIG1heGxlbiwgJnN6KTsKPiAgIAkJZWxzZQo+ICAgCQkJaW52YWxpZF9tc2cgPSB0
cnVlOwo+ICAgCj4gCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

