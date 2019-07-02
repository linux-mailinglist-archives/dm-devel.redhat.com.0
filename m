Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E205D09E
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 15:27:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69A4621BA4;
	Tue,  2 Jul 2019 13:26:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCE2217966;
	Tue,  2 Jul 2019 13:26:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3036206D1;
	Tue,  2 Jul 2019 13:25:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x62DOJE7023780 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 09:24:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D096B3843; Tue,  2 Jul 2019 13:24:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C8831715A;
	Tue,  2 Jul 2019 13:24:15 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F73F307D849;
	Tue,  2 Jul 2019 13:23:52 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 9252A2D5C714C1E33159;
	Tue,  2 Jul 2019 21:23:49 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 2 Jul 2019
	21:23:42 +0800
From: Hou Tao <houtao1@huawei.com>
To: <linux-raid@vger.kernel.org>, <songliubraving@fb.com>
Date: Tue, 2 Jul 2019 21:29:17 +0800
Message-ID: <20190702132918.114818-3-houtao1@huawei.com>
In-Reply-To: <20190702132918.114818-1-houtao1@huawei.com>
References: <20190702132918.114818-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Tue, 02 Jul 2019 13:24:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 02 Jul 2019 13:24:07 +0000 (UTC) for IP:'45.249.212.35'
	DOMAIN:'szxga07-in.huawei.com' HELO:'huawei.com'
	FROM:'houtao1@huawei.com' RCPT:''
X-RedHat-Spam-Score: -0.002  (SPF_HELO_PASS,
	SPF_PASS) 45.249.212.35 szxga07-in.huawei.com
	45.249.212.35 szxga07-in.huawei.com <houtao1@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, neilb@suse.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	houtao1@huawei.com, agk@redhat.com
Subject: [dm-devel] [RFC PATCH 2/3] md: export inflight io counters and
	internal stats in debugfs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 02 Jul 2019 13:27:07 +0000 (UTC)

VGhlcmUgYXJlIHNvIG1hbnkgaW8gY291bnRlcnMgYW5kIHN0YXRzL2ZsYWdzIGluIG1kLCBzbyBJ
IHRoaW5rCmV4cG9ydCB0aGVzZSBpbmZvIGluIGRlYnVnZnMgd2lsbCBiZSBoZWxwZnVsIGZvciBv
bmxpbmUtZGVidWdnaW5nLAplc3BlY2lhbGx5IHdoZW4gdGhlIHZtbGludXggYW5kIGNyYXNoIHV0
aWxpdHkgYXJlIG5vdCBhdmFpbGFibGUuCkFuZCB0aGVzZSBmaWxlcyBjYW4gYWxzbyBiZSB1dGls
aXplZCBkdXJpbmcgY29kZSB1bmRlcnN0YW5kaW5nLgoKRGVidWcgaW5mbyBhcmUgZGl2aWRlZCBp
bnRvIHR3byBkZWJ1Z2ZzIGZpbGVzOgoqIGlvc3RhdAogIGNvbnRhaW5zIGlvIGNvdW50ZXJzIGFu
ZCBpbyByZWxhdGVkIHN0YXRzIChlLmcuLCBtZGRldi0+cGVuZGluZ193cml0ZXMKICBhbmQgdGhl
IGFjdGl2ZSBzdGF0dXMgb2YgbWRkZXYtPnNiX3dhaXQpCiogc3RhdAogIGNvbnRhaW5zIGludGVy
bmFsIHN0YXRzIG9yIGZsYWdzIChlLmcuLCBtZGRldi0+c2JfZmxhZ3MpCgpUaGVzZSB0d28gZGVi
dWdmcyBmaWxlcyB3aWxsIGJlIGNyZWF0ZWQgYm90aCBieSBtZC1jb3JlIGFuZCB0aGUgdXNlZApt
ZC1wZXJzb25hbGl0eSBmb3IgZWFjaCBtZCBkZXZpY2UuIFRoaXMgcGF0Y2ggY3JlYXRlcyBkZWJ1
ZyBmaWxlcwpmb3IgbWQtY29yZSB1bmRlciAvc3lzL2tlcm5lbC9kZWJ1Zy9ibG9jay9tZFgsIGFu
ZCB0aGUgZm9sbG93aW5nIHBhdGNoCndpbGwgY3JlYXRlcyB0aGVzZSBmaWxlcyBmb3IgUkFJRDEu
IFRoZSBmb2xsb3dpbmcgbGluZXMgc2hvdyB0aGUgaGllcmFyY2h5Cm9mIGRlYnVnZnMgZmlsZXMg
Y3JlYXRlZCBmb3IgYSBSQUlEMSBkZXZpY2U6CgogICQgcHdkCiAgL3N5cy9rZXJuZWwvZGVidWcv
YmxvY2svbWQwCiAgJCB0cmVlCiAgLgogIOKUnOKUgOKUgCBpb3N0YXQKICDilJzilIDilIAgcmFp
ZDEKICDilILCoMKgIOKUnOKUgOKUgCBpb3N0YXQKICDilILCoMKgIOKUlOKUgOKUgCBzdGF0CiAg
4pSU4pSA4pSAIHN0YXQKClNpZ25lZC1vZmYtYnk6IEhvdSBUYW8gPGhvdXRhbzFAaHVhd2VpLmNv
bT4KLS0tCiBkcml2ZXJzL21kL21kLmMgfCA2NSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL21kL21kLmggfCAgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDY2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21kL21kLmMgYi9k
cml2ZXJzL21kL21kLmMKaW5kZXggOTgwMWQ1NDBmZWExLi5kY2ViOGZkNTliYTAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbWQvbWQuYworKysgYi9kcml2ZXJzL21kL21kLmMKQEAgLTY0LDExICs2NCwx
NCBAQAogI2luY2x1ZGUgIm1kLmgiCiAjaW5jbHVkZSAibWQtYml0bWFwLmgiCiAjaW5jbHVkZSAi
bWQtY2x1c3Rlci5oIgorI2luY2x1ZGUgIm1kLWRlYnVnZnMuaCIKIAogI2lmbmRlZiBNT0RVTEUK
IHN0YXRpYyB2b2lkIGF1dG9zdGFydF9hcnJheXMoaW50IHBhcnQpOwogI2VuZGlmCiAKK2V4dGVy
biBzdHJ1Y3QgZGVudHJ5ICpibGtfZGVidWdmc19yb290OworCiAvKiBwZXJzX2xpc3QgaXMgYSBs
aXN0IG9mIHJlZ2lzdGVyZWQgcGVyc29uYWxpdGllcyBwcm90ZWN0ZWQKICAqIGJ5IHBlcnNfbG9j
ay4KICAqIHBlcnNfbG9jayBkb2VzIGV4dHJhIHNlcnZpY2UgdG8gcHJvdGVjdCBhY2Nlc3NlcyB0
bwpAQCAtNTE5MSw2ICs1MTk0LDY1IEBAIG1kX2F0dHJfc3RvcmUoc3RydWN0IGtvYmplY3QgKmtv
YmosIHN0cnVjdCBhdHRyaWJ1dGUgKmF0dHIsCiAJcmV0dXJuIHJ2OwogfQogCitzdGF0aWMgaW50
IG1kX2RiZ19pb3N0YXRfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCit7CisJ
c3RydWN0IG1kZGV2ICptZGRldiA9IG0tPnByaXZhdGU7CisJaW50IGFjdGl2ZV9ibV9pbyA9IDA7
CisKKwlzcGluX2xvY2soJm1kZGV2LT5sb2NrKTsKKwlpZiAobWRkZXYtPmJpdG1hcCkKKwkJYWN0
aXZlX2JtX2lvID0gYXRvbWljX3JlYWQoJm1kZGV2LT5iaXRtYXAtPnBlbmRpbmdfd3JpdGVzKTsK
KwlzcGluX3VubG9jaygmbWRkZXYtPmxvY2spOworCisJc2VxX3ByaW50ZihtLCAiYWN0aXZlX2lv
ICVkXG4iLAorCQkJYXRvbWljX3JlYWQoJm1kZGV2LT5hY3RpdmVfaW8pKTsKKwlzZXFfcHJpbnRm
KG0sICJzYl93YWl0ICVkIHBlbmRpbmdfd3JpdGVzICVkXG4iLAorCQkJd2FpdHF1ZXVlX2FjdGl2
ZSgmbWRkZXYtPnNiX3dhaXQpLAorCQkJYXRvbWljX3JlYWQoJm1kZGV2LT5wZW5kaW5nX3dyaXRl
cykpOworCXNlcV9wcmludGYobSwgInJlY292ZXJ5X2FjdGl2ZSAlZFxuIiwKKwkJCWF0b21pY19y
ZWFkKCZtZGRldi0+cmVjb3ZlcnlfYWN0aXZlKSk7CisJc2VxX3ByaW50ZihtLCAiYml0bWFwIHBl
bmRpbmdfd3JpdGVzICVkXG4iLCBhY3RpdmVfYm1faW8pOworCisJcmV0dXJuIDA7Cit9CisKK3N0
YXRpYyBpbnQgbWRfZGJnX3N0YXRfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEp
Cit7CisJc3RydWN0IG1kZGV2ICptZGRldiA9IG0tPnByaXZhdGU7CisKKwlzZXFfcHJpbnRmKG0s
ICJmbGFncyAweCVseFxuIiwgbWRkZXYtPmZsYWdzKTsKKwlzZXFfcHJpbnRmKG0sICJzYl9mbGFn
cyAweCVseFxuIiwgbWRkZXYtPnNiX2ZsYWdzKTsKKwlzZXFfcHJpbnRmKG0sICJyZWNvdmVyeSAw
eCVseFxuIiwgbWRkZXYtPnJlY292ZXJ5KTsKKworCXJldHVybiAwOworfQorCitzdGF0aWMgY29u
c3Qgc3RydWN0IG1kX2RlYnVnZnNfZmlsZSBtZF9kYmdfZmlsZXNbXSA9IHsKKwl7Lm5hbWUgPSAi
aW9zdGF0IiwgLnNob3cgPSBtZF9kYmdfaW9zdGF0X3Nob3d9LAorCXsubmFtZSA9ICJzdGF0Iiwg
LnNob3cgPSBtZF9kYmdfc3RhdF9zaG93fSwKKwl7fSwKK307CisKK3N0YXRpYyB2b2lkIG1kX3Vu
cmVnaXN0ZXJfZGVidWdmcyhzdHJ1Y3QgbWRkZXYgKm1kZGV2KQoreworCWRlYnVnZnNfcmVtb3Zl
X3JlY3Vyc2l2ZShtZGRldi0+ZGVidWdmc19kaXIpOworfQorCitzdGF0aWMgdm9pZCBtZF9yZWdp
c3Rlcl9kZWJ1Z2ZzKHN0cnVjdCBtZGRldiAqbWRkZXYpCit7CisJY29uc3QgY2hhciAqbmFtZTsK
KwlzdHJ1Y3QgZGVudHJ5ICpkaXI7CisKKwluYW1lID0ga29iamVjdF9uYW1lKCZkaXNrX3RvX2Rl
dihtZGRldi0+Z2VuZGlzayktPmtvYmopOworCWRpciA9IGRlYnVnZnNfY3JlYXRlX2RpcihuYW1l
LCBibGtfZGVidWdmc19yb290KTsKKwlpZiAoIUlTX0VSUl9PUl9OVUxMKGRpcikpIHsKKwkJbWRf
ZGVidWdmc19jcmVhdGVfZmlsZXMoZGlyLCBtZGRldiwgbWRfZGJnX2ZpbGVzKTsKKwkJbWRkZXYt
PmRlYnVnZnNfZGlyID0gZGlyOworCX0gZWxzZSB7CisJCW1kZGV2LT5kZWJ1Z2ZzX2RpciA9IE5V
TEw7CisJfQorfQorCiBzdGF0aWMgdm9pZCBtZF9mcmVlKHN0cnVjdCBrb2JqZWN0ICprbykKIHsK
IAlzdHJ1Y3QgbWRkZXYgKm1kZGV2ID0gY29udGFpbmVyX29mKGtvLCBzdHJ1Y3QgbWRkZXYsIGtv
YmopOwpAQCAtNTIyNyw2ICs1Mjg5LDcgQEAgc3RhdGljIHZvaWQgbWRkZXZfZGVsYXllZF9kZWxl
dGUoc3RydWN0IHdvcmtfc3RydWN0ICp3cykKIHsKIAlzdHJ1Y3QgbWRkZXYgKm1kZGV2ID0gY29u
dGFpbmVyX29mKHdzLCBzdHJ1Y3QgbWRkZXYsIGRlbF93b3JrKTsKIAorCW1kX3VucmVnaXN0ZXJf
ZGVidWdmcyhtZGRldik7CiAJc3lzZnNfcmVtb3ZlX2dyb3VwKCZtZGRldi0+a29iaiwgJm1kX2Jp
dG1hcF9ncm91cCk7CiAJa29iamVjdF9kZWwoJm1kZGV2LT5rb2JqKTsKIAlrb2JqZWN0X3B1dCgm
bWRkZXYtPmtvYmopOwpAQCAtNTM1Myw2ICs1NDE2LDggQEAgc3RhdGljIGludCBtZF9hbGxvYyhk
ZXZfdCBkZXYsIGNoYXIgKm5hbWUpCiAJaWYgKG1kZGV2LT5rb2JqLnNkICYmCiAJICAgIHN5c2Zz
X2NyZWF0ZV9ncm91cCgmbWRkZXYtPmtvYmosICZtZF9iaXRtYXBfZ3JvdXApKQogCQlwcl9kZWJ1
ZygicG9pbnRsZXNzIHdhcm5pbmdcbiIpOworCisJbWRfcmVnaXN0ZXJfZGVidWdmcyhtZGRldik7
CiAJbXV0ZXhfdW5sb2NrKCZtZGRldi0+b3Blbl9tdXRleCk7CiAgYWJvcnQ6CiAJbXV0ZXhfdW5s
b2NrKCZkaXNrc19tdXRleCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL21kL21kLmggYi9kcml2ZXJz
L21kL21kLmgKaW5kZXggN2M5MzBjMDkxMTkzLi5lNzllZjIxMDFjNDUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbWQvbWQuaAorKysgYi9kcml2ZXJzL21kL21kLmgKQEAgLTQ2Niw2ICs0NjYsNyBAQCBz
dHJ1Y3QgbWRkZXYgewogCXVuc2lnbmVkIGludAkJCWdvb2RfZGV2aWNlX25yOwkvKiBnb29kIGRl
dmljZSBudW0gd2l0aGluIGNsdXN0ZXIgcmFpZCAqLwogCiAJYm9vbAloYXNfc3VwZXJibG9ja3M6
MTsKKwlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzX2RpcjsKIH07CiAKIGVudW0gcmVjb3ZlcnlfZmxh
Z3MgewotLSAKMi4yMi4wCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0
LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
