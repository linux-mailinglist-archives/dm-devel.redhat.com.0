Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D14FF216555
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 06:27:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-SFVl2UGgOFygnHowbT6F9A-1; Tue, 07 Jul 2020 00:27:25 -0400
X-MC-Unique: SFVl2UGgOFygnHowbT6F9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91C3B800401;
	Tue,  7 Jul 2020 04:27:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47E7C10013D9;
	Tue,  7 Jul 2020 04:27:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7DE772F4D;
	Tue,  7 Jul 2020 04:27:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0674Qvg6023020 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 00:26:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 784702084823; Tue,  7 Jul 2020 04:26:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73C212026D69
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 04:26:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EFEC185A797
	for <dm-devel@redhat.com>; Tue,  7 Jul 2020 04:26:55 +0000 (UTC)
Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-102-JCTx9DpHOWKPJrEUrVbAeg-1; Tue, 07 Jul 2020 00:26:52 -0400
X-MC-Unique: JCTx9DpHOWKPJrEUrVbAeg-1
Received: from h3cspam01-ex.h3c.com (localhost [127.0.0.2] (may be forged))
	by h3cspam01-ex.h3c.com with ESMTP id 06738jHe080251;
	Tue, 7 Jul 2020 11:08:45 +0800 (GMT-8)
	(envelope-from wu.chongyun@h3c.com)
Received: from DAG2EX03-BASE.srv.huawei-3com.com ([10.8.0.66])
	by h3cspam01-ex.h3c.com with ESMTPS id 06738Fae078566
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jul 2020 11:08:15 +0800 (GMT-8)
	(envelope-from wu.chongyun@h3c.com)
Received: from DAG2EX01-BASE.srv.huawei-3com.com (10.8.0.64) by
	DAG2EX03-BASE.srv.huawei-3com.com (10.8.0.66) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Tue, 7 Jul 2020 11:08:16 +0800
Received: from DAG2EX01-BASE.srv.huawei-3com.com ([::1]) by
	DAG2EX01-BASE.srv.huawei-3com.com ([fe80::1bc:c83a:cbd0:6250%6]) with
	mapi id 15.01.1713.004; Tue, 7 Jul 2020 11:08:16 +0800
From: Chongyun Wu <wu.chongyun@h3c.com>
To: "Martin Wilck (mwilck@suse.com)" <mwilck@suse.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [dm-devel][PATCH]libmultipath/dmparser: add missing path with
	good status when sync state with dm kernel
Thread-Index: AdZUC8CQeqPTL5cXRDeDwcJUOc9ZrA==
Date: Tue, 7 Jul 2020 03:08:16 +0000
Message-ID: <bf821e180f4345aa9d5920bf50e28700@h3c.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.125.108.121]
x-sender-location: DAG2
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: h3cspam01-ex.h3c.com 06738Fae078566
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0674Qvg6023020
X-loop: dm-devel@redhat.com
Cc: Guozhonghua <guozhonghua@h3c.com>, Wangyong <wang.yongD@h3c.com>,
	Changlimin <changlimin@h3c.com>, Zhangguanghui <zhang.guanghui@h3c.com>,
	Chengchiwen <chengchiwen@h3c.com>
Subject: [dm-devel] [PATCH]libmultipath/dmparser: add missing path with good
 status when sync state with dm kernel
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgTWFydGluIGFuZCBCZW4sCgpDbG91ZCB5b3UgaGVscCB0byB2aWV3IGJlbG93IHBhdGNoLCB0
aGFua3MuCgo+RnJvbSBiMjc4NmM4MWE3OGJmMzg2OGYzMDBmZDMxNzdlODUyZTcxOGU3NzkwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBDaG9uZ3l1biBXdSA8d3UuY2hvbmd5dW5AaDNj
LmNvbT4KRGF0ZTogTW9uLCA2IEp1bCAyMDIwIDExOjIyOjIxICswODAwClN1YmplY3Q6IFtQQVRD
SF0gbGlibXVsdGlwYXRoL2RtcGFyc2VyOiBhZGQgbWlzc2luZyBwYXRoIHdpdGggZ29vZCBzdGF0
dXMKIHdoZW4gc3luYyBzdGF0ZSB3aXRoIGRtIGtlcm5lbAoKQWRkIHBhdGggYmFjayBpbnRvIGRl
YW1vbiB2ZWNzLT5wYXRodmVjcyB3aGVuIGZvdW5kIHBhdGggbWlzc2luZyBpbgptdWx0aXBhdGhk
IHdoaWNoIGNhbiBmaXggZG0gaW8gYmxvY2tlZCBpc3N1ZS4KClRlc3QgZW52aXJvbm1lbnQ6CnNl
dmVyYWwgaG9zdHM7CmVhY2ggaG9zdCBoYXZlIDEwMCsgbXVsdGlwYXRoLCBlYWNoIG11bHRpcGF0
aCBoYXZlIDEgdG8gNCBwYXRocy4KcnVuIHVwL2Rvd24gc3RvcmFnZSBuZXR3b3JrIGxvb3Agc2Ny
aXB0IGZvciBkYXlzLgoKSXNzdWU6CkFmdGVyIHNldmVyYWwgaG91cnMgc3RvcCBzY3JpcHQsIGZv
dW5kIHNvbWUgaG9zdHMgaGF2ZSBkbSBpbyBibG9ja2VkIGlzc3VlOgpzbGF2ZSBibG9jayBkZXZp
Y2UgYWNjZXNzIHdlbGwsIGJ1dCBpdHMgZG0gZGV2aWNlIGJsb2NrZWQuCjM2YzBiZmMwMTAwYThk
NGEyMjgyMTRkYTUwMDAwMDAzYyBkbS0yMCBIVUFXRUksWFNHMQpzaXplPTM1MEcgZmVhdHVyZXM9
JzEgcXVldWVfaWZfbm9fcGF0aCcgaHdoYW5kbGVyPScwJyB3cD1ydwpgLSstIHBvbGljeT0ncm91
bmQtcm9iaW4gMCcgcHJpbz0xIHN0YXR1cz1lbmFibGVkCiAgfC0gMTowOjA6MjAgIHNkYmsgNjc6
MjI0ICBmYWlsZWQgcmVhZHkgcnVubmluZwptdWx0aXBhdGhkIHNob3cgcGF0aHMgY2Fubm90IGZv
dW5kIHNkYmshCgpUZXN0IHJlc3VsdDoKV2l0aCB0aGlzIHBhdGNoLCBydW4gc2NyaXB0IHNldmVy
YWwgZGF5cywgaW8gYmxvY2tlZCBpc3N1ZQpub3QgZm91bmQgYWdhaW4uCgpUaGlzIHBhdGNoIGNh
biBmaXggdGhpcyBpc3N1ZTogd2hlbiBmb3VuZCBwYXRoIG9ubHkgbWlzc2luZyBpbgptdWx0aXBh
dGhkIGJ1dCBzdGlsbCBpbiBkbSwgY2hlY2sgdGhlIG1pc3NpbmcgcGF0aCBzdGF0dXMgaWYgb2sK
dHJ5IHRvIGFkZCBpdCBiYWNrLCBhbmQgY2hlY2tlciBoYXZlIGNoYW5jZSB0byByZWluc3RhdGUg
dGhpcwpwYXRoIGFuZCB0aGUgZG0gaW8gYmxvY2tlZCBpc3N1ZSB3aWxsIGRpc2FwcGVhci4KClNp
Z25lZC1vZmYtYnk6IENob25neXVuIFd1IDx3dS5jaG9uZ3l1bkBoM2MuY29tPgotLS0KIGxpYm11
bHRpcGF0aC9kbXBhcnNlci5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
bGlibXVsdGlwYXRoL2RtcGFyc2VyLmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWJtdWx0aXBhdGgvZG1wYXJzZXIuYyBiL2xpYm11bHRp
cGF0aC9kbXBhcnNlci5jCmluZGV4IGI4NTZhMDdmLi4yZjkwYjE3YyAxMDA2NDQKLS0tIGEvbGli
bXVsdGlwYXRoL2RtcGFyc2VyLmMKKysrIGIvbGlibXVsdGlwYXRoL2RtcGFyc2VyLmMKQEAgLTMx
Nyw2ICszMTcsMTIgQEAgaW50IGRpc2Fzc2VtYmxlX21hcCh2ZWN0b3IgcGF0aHZlYywgY2hhciAq
cGFyYW1zLCBzdHJ1Y3QgbXVsdGlwYXRoICptcHAsCiAJCQkJLyogT25seSBjYWxsIHRoaXMgaW4g
bXVsdGlwYXRoIGNsaWVudCBtb2RlICovCiAJCQkJaWYgKCFpc19kYWVtb24gJiYgc3RvcmVfcGF0
aChwYXRodmVjLCBwcCkpCiAJCQkJCWdvdG8gb3V0MTsKKworCQkJCS8qIFRyeSB0byBhZGQgZ29v
ZCBzdGF0dXMgcGF0aCBiYWNrIHRvIGF2b2lkCisJCQkJICogZG0gaW8gYmxvY2tlZCBpc3N1ZSBp
biBzcGVjaWFsIGNvbmRpdGlvbi4KKwkJCQkgKi8KKwkJCQlpZihhZGRfbWlzc2luZ19wYXRoKHBh
dGh2ZWMsIGRldm5hbWUpKQorCQkJCQljb25kbG9nKDIsICJUcnkgdG8gYWRkIG1pc3NpbmcgcGF0
aCAlcyBmYWlsZWQiLCBkZXZuYW1lKTsKIAkJCX0gZWxzZSB7CiAJCQkJaWYgKCFzdHJsZW4ocHAt
Pnd3aWQpICYmCiAJCQkJICAgIHN0cmxlbihtcHAtPnd3aWQpKQpAQCAtNTY5LDMgKzU3NSwyOCBA
QCBpbnQgZGlzYXNzZW1ibGVfc3RhdHVzKGNoYXIgKnBhcmFtcywgc3RydWN0IG11bHRpcGF0aCAq
bXBwKQogCX0KIAlyZXR1cm4gMDsKIH0KKworLyogQWRkIG1pc3NpbmcgZ29vZCBzdGF0dXMgcGF0
aCBiYWNrIHRvIG11bHRpcGF0aGQgKi8KK2ludCBhZGRfbWlzc2luZ19wYXRoKHZlY3RvciBwYXRo
dmVjLCBjaGFyICptaXNzaW5nX2RldikKK3sKKwlzdHJ1Y3QgdWRldl9kZXZpY2UgKnVkZXZpY2U7
CisJc3RydWN0IGNvbmZpZyAqY29uZjsKKwlpbnQgcmV0ID0gMDsKKwkJCQkKKwljb25kbG9nKDIs
ICJDYW50J3QgZm91bmQgcGF0aCAlcyB0cnkgdG8gYWRkIGl0IGJhY2sgaWYgaXRzIHN0YXRlIGlz
IHVwLiIsIAorCQkJbWlzc2luZ19kZXYpOworCisJdWRldmljZSA9IHVkZXZfZGV2aWNlX25ld19m
cm9tX3N1YnN5c3RlbV9zeXNuYW1lKHVkZXYsICJibG9jayIsIG1pc3NpbmdfZGV2KTsKKwlpZiAo
IXVkZXZpY2UpIHsKKwkJY29uZGxvZygwLCAiJXM6IGNhbid0IGZpbmQgcGF0aCBmb3JtIHVkZXYi
LCBtaXNzaW5nX2Rldik7CisJCXJldHVybiAxOworCX0KKwljb25mID0gZ2V0X211bHRpcGF0aF9j
b25maWcoKTsKKwlwdGhyZWFkX2NsZWFudXBfcHVzaChwdXRfbXVsdGlwYXRoX2NvbmZpZywgY29u
Zik7CisJcmV0ID0gc3RvcmVfcGF0aGluZm8ocGF0aHZlYywgY29uZiwKKwkJCQkJCSB1ZGV2aWNl
LCBESV9BTEwgfCBESV9CTEFDS0xJU1QsIE5VTEwpOworCXB0aHJlYWRfY2xlYW51cF9wb3AoMSk7
CisJdWRldl9kZXZpY2VfdW5yZWYodWRldmljZSk7CisKKwlyZXR1cm4gcmV0OworfQpkaWZmIC0t
Z2l0IGEvbGlibXVsdGlwYXRoL2RtcGFyc2VyLmggYi9saWJtdWx0aXBhdGgvZG1wYXJzZXIuaApp
bmRleCBlMWJhZGIwYi4uNTE1Y2E5MDAgMTAwNjQ0Ci0tLSBhL2xpYm11bHRpcGF0aC9kbXBhcnNl
ci5oCisrKyBiL2xpYm11bHRpcGF0aC9kbXBhcnNlci5oCkBAIC0xLDMgKzEsNCBAQAogaW50IGFz
c2VtYmxlX21hcCAoc3RydWN0IG11bHRpcGF0aCAqLCBjaGFyICosIGludCk7CiBpbnQgZGlzYXNz
ZW1ibGVfbWFwICh2ZWN0b3IsIGNoYXIgKiwgc3RydWN0IG11bHRpcGF0aCAqLCBpbnQpOwogaW50
IGRpc2Fzc2VtYmxlX3N0YXR1cyAoY2hhciAqLCBzdHJ1Y3QgbXVsdGlwYXRoICopOworaW50IGFk
ZF9taXNzaW5nX3BhdGgodmVjdG9yIHBhdGh2ZWMsIGNoYXIgKm1pc3NpbmdfZGV2KTsKLS0gCjIu
MTIuMS53aW5kb3dzLjEKCgpCZXN0IFJlZ2FyZHOjrApDaG9uZ3l1biBXdQoKCi0tCmRtLWRldmVs
IG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

