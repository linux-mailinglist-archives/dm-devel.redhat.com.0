Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B9053186726
	for <lists+dm-devel@lfdr.de>; Mon, 16 Mar 2020 09:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584349024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d1qBdNpsS0QM3hFRmYrqM0AD3kNyrAYCjdZbdO0xhqA=;
	b=ggwGgK34TEdVNZ+aeF5WNSPsiVOPYy+BOwrNVWKPmFJ6cgdcj85ZYnwtXVABOC6vCITx1I
	kYtqrwFZqZPKMYe9oGV+IjGw+/rDIs2yv2alQC2RbZe/9a1sGfwnMWXUJ3CpWvtwCq9AjY
	OoYGOyYIOdmjirY/owc+VfD5a2f4kOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-0NzKB8iJO5Kred-hFZcTjg-1; Mon, 16 Mar 2020 04:57:02 -0400
X-MC-Unique: 0NzKB8iJO5Kred-hFZcTjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E2BE8017CC;
	Mon, 16 Mar 2020 08:56:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1309F5C1B2;
	Mon, 16 Mar 2020 08:56:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B7C218034E9;
	Mon, 16 Mar 2020 08:56:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02G2ZGpJ017189 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Mar 2020 22:35:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D53BF18AE; Mon, 16 Mar 2020 02:35:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68C60ED17E
	for <dm-devel@redhat.com>; Mon, 16 Mar 2020 02:35:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 017E28F49CC
	for <dm-devel@redhat.com>; Mon, 16 Mar 2020 02:35:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-171-xIJFc5bKP0io3YvWKDS6pw-1;
	Sun, 15 Mar 2020 22:35:11 -0400
X-MC-Unique: xIJFc5bKP0io3YvWKDS6pw-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F12E8206E9;
	Mon, 16 Mar 2020 02:35:08 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 15 Mar 2020 22:34:46 -0400
Message-Id: <20200316023453.1800-13-sashal@kernel.org>
In-Reply-To: <20200316023453.1800-1-sashal@kernel.org>
References: <20200316023453.1800-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02G2ZGpJ017189
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 16 Mar 2020 04:56:16 -0400
Cc: Sasha Levin <sashal@kernel.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	=?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
Subject: [dm-devel] [PATCH AUTOSEL 4.19 13/20] dm integrity: use
	dm_bio_record and dm_bio_restore
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogTWlrZSBTbml0emVyIDxzbml0emVyQHJlZGhhdC5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCAyNDhhYTI2NDVhYTdmYzkxNzVkMTEwN2MyNTkzY2M5MGQ0YWY1YTRlIF0KCkluIGNhc2VzIHdo
ZXJlIGRlY19pbl9mbGlnaHQoKSBoYXMgdG8gcmVxdWV1ZSB0aGUgaW50ZWdyaXR5X2Jpb193YWl0
CndvcmsgdG8gdHJhbnNmZXIgdGhlIHJlc3Qgb2YgdGhlIGRhdGEsIHRoZSBiaW8ncyBfX2JpX3Jl
bWFpbmluZyBtaWdodAphbHJlYWR5IGhhdmUgYmVlbiBkZWNyZW1lbnRlZCB0byAwLCBlLmcuOiBp
ZiBiaW8gcGFzc2VkIHRvIHVuZGVybHlpbmcKZGF0YSBkZXZpY2Ugd2FzIHNwbGl0IHZpYSBibGtf
cXVldWVfc3BsaXQoKS4KClVzZSBkbV9iaW9fe3JlY29yZCxyZXN0b3JlfSByYXRoZXIgdGhhbiBl
ZmZlY3RpdmVseSBvcGVuLWNvZGluZyB0aGVtIGluCmRtLWludGVncml0eSAtLSB0aGVzZSBtZXRo
b2RzIG5vdyBtYW5hZ2UgX19iaV9yZW1haW5pbmcgdG9vLgoKRGVwZW5kcy1vbjogZjdmMGIwNTdh
OWMxICgiZG0gYmlvIHJlY29yZDogc2F2ZS9yZXN0b3JlIGJpX2VuZF9pbyBhbmQgYmlfaW50ZWdy
aXR5IikKUmVwb3J0ZWQtYnk6IERhbmllbCBHbMO2Y2tuZXIgPGRnQGVtbGl4LmNvbT4KU3VnZ2Vz
dGVkLWJ5OiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRvY2thQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYt
Ynk6IE1pa2UgU25pdHplciA8c25pdHplckByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNo
YSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9tZC9kbS1pbnRlZ3JpdHku
YyB8IDMyICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21k
L2RtLWludGVncml0eS5jIGIvZHJpdmVycy9tZC9kbS1pbnRlZ3JpdHkuYwppbmRleCA1ODg1MjM5
Y2MxZjg1Li5kNzVhNGNlN2QxMmFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL21kL2RtLWludGVncml0
eS5jCisrKyBiL2RyaXZlcnMvbWQvZG0taW50ZWdyaXR5LmMKQEAgLTYsNiArNiw4IEBACiAgKiBU
aGlzIGZpbGUgaXMgcmVsZWFzZWQgdW5kZXIgdGhlIEdQTC4KICAqLwogCisjaW5jbHVkZSAiZG0t
YmlvLXJlY29yZC5oIgorCiAjaW5jbHVkZSA8bGludXgvY29tcGlsZXIuaD4KICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UtbWFwcGVyLmg+CkBAIC0yNzYs
MTEgKzI3OCw3IEBAIHN0cnVjdCBkbV9pbnRlZ3JpdHlfaW8gewogCiAJc3RydWN0IGNvbXBsZXRp
b24gKmNvbXBsZXRpb247CiAKLQlzdHJ1Y3QgZ2VuZGlzayAqb3JpZ19iaV9kaXNrOwotCXU4IG9y
aWdfYmlfcGFydG5vOwotCWJpb19lbmRfaW9fdCAqb3JpZ19iaV9lbmRfaW87Ci0Jc3RydWN0IGJp
b19pbnRlZ3JpdHlfcGF5bG9hZCAqb3JpZ19iaV9pbnRlZ3JpdHk7Ci0Jc3RydWN0IGJ2ZWNfaXRl
ciBvcmlnX2JpX2l0ZXI7CisJc3RydWN0IGRtX2Jpb19kZXRhaWxzIGJpb19kZXRhaWxzOwogfTsK
IAogc3RydWN0IGpvdXJuYWxfY29tcGxldGlvbiB7CkBAIC0xMjQ5LDE0ICsxMjQ3LDkgQEAgc3Rh
dGljIHZvaWQgaW50ZWdyaXR5X2VuZF9pbyhzdHJ1Y3QgYmlvICpiaW8pCiB7CiAJc3RydWN0IGRt
X2ludGVncml0eV9pbyAqZGlvID0gZG1fcGVyX2Jpb19kYXRhKGJpbywgc2l6ZW9mKHN0cnVjdCBk
bV9pbnRlZ3JpdHlfaW8pKTsKIAotCWJpby0+YmlfaXRlciA9IGRpby0+b3JpZ19iaV9pdGVyOwot
CWJpby0+YmlfZGlzayA9IGRpby0+b3JpZ19iaV9kaXNrOwotCWJpby0+YmlfcGFydG5vID0gZGlv
LT5vcmlnX2JpX3BhcnRubzsKLQlpZiAoZGlvLT5vcmlnX2JpX2ludGVncml0eSkgewotCQliaW8t
PmJpX2ludGVncml0eSA9IGRpby0+b3JpZ19iaV9pbnRlZ3JpdHk7CisJZG1fYmlvX3Jlc3RvcmUo
JmRpby0+YmlvX2RldGFpbHMsIGJpbyk7CisJaWYgKGJpby0+YmlfaW50ZWdyaXR5KQogCQliaW8t
PmJpX29wZiB8PSBSRVFfSU5URUdSSVRZOwotCX0KLQliaW8tPmJpX2VuZF9pbyA9IGRpby0+b3Jp
Z19iaV9lbmRfaW87CiAKIAlpZiAoZGlvLT5jb21wbGV0aW9uKQogCQljb21wbGV0ZShkaW8tPmNv
bXBsZXRpb24pOwpAQCAtMTMzNiw3ICsxMzI5LDcgQEAgc3RhdGljIHZvaWQgaW50ZWdyaXR5X21l
dGFkYXRhKHN0cnVjdCB3b3JrX3N0cnVjdCAqdykKIAkJaWYgKCFjaGVja3N1bXMpCiAJCQljaGVj
a3N1bXMgPSBjaGVja3N1bXNfb25zdGFjazsKIAotCQlfX2Jpb19mb3JfZWFjaF9zZWdtZW50KGJ2
LCBiaW8sIGl0ZXIsIGRpby0+b3JpZ19iaV9pdGVyKSB7CisJCV9fYmlvX2Zvcl9lYWNoX3NlZ21l
bnQoYnYsIGJpbywgaXRlciwgZGlvLT5iaW9fZGV0YWlscy5iaV9pdGVyKSB7CiAJCQl1bnNpZ25l
ZCBwb3M7CiAJCQljaGFyICptZW0sICpjaGVja3N1bXNfcHRyOwogCkBAIC0xMzgwLDcgKzEzNzMs
NyBAQCBzdGF0aWMgdm9pZCBpbnRlZ3JpdHlfbWV0YWRhdGEoc3RydWN0IHdvcmtfc3RydWN0ICp3
KQogCQlpZiAobGlrZWx5KGNoZWNrc3VtcyAhPSBjaGVja3N1bXNfb25zdGFjaykpCiAJCQlrZnJl
ZShjaGVja3N1bXMpOwogCX0gZWxzZSB7Ci0JCXN0cnVjdCBiaW9faW50ZWdyaXR5X3BheWxvYWQg
KmJpcCA9IGRpby0+b3JpZ19iaV9pbnRlZ3JpdHk7CisJCXN0cnVjdCBiaW9faW50ZWdyaXR5X3Bh
eWxvYWQgKmJpcCA9IGRpby0+YmlvX2RldGFpbHMuYmlfaW50ZWdyaXR5OwogCiAJCWlmIChiaXAp
IHsKIAkJCXN0cnVjdCBiaW9fdmVjIGJpdjsKQEAgLTE3ODQsMjAgKzE3NzcsMTMgQEAgc3RhdGlj
IHZvaWQgZG1faW50ZWdyaXR5X21hcF9jb250aW51ZShzdHJ1Y3QgZG1faW50ZWdyaXR5X2lvICpk
aW8sIGJvb2wgZnJvbV9tYXAKIAl9IGVsc2UKIAkJZGlvLT5jb21wbGV0aW9uID0gTlVMTDsKIAot
CWRpby0+b3JpZ19iaV9pdGVyID0gYmlvLT5iaV9pdGVyOwotCi0JZGlvLT5vcmlnX2JpX2Rpc2sg
PSBiaW8tPmJpX2Rpc2s7Ci0JZGlvLT5vcmlnX2JpX3BhcnRubyA9IGJpby0+YmlfcGFydG5vOwor
CWRtX2Jpb19yZWNvcmQoJmRpby0+YmlvX2RldGFpbHMsIGJpbyk7CiAJYmlvX3NldF9kZXYoYmlv
LCBpYy0+ZGV2LT5iZGV2KTsKLQotCWRpby0+b3JpZ19iaV9pbnRlZ3JpdHkgPSBiaW9faW50ZWdy
aXR5KGJpbyk7CiAJYmlvLT5iaV9pbnRlZ3JpdHkgPSBOVUxMOwogCWJpby0+Ymlfb3BmICY9IH5S
RVFfSU5URUdSSVRZOwotCi0JZGlvLT5vcmlnX2JpX2VuZF9pbyA9IGJpby0+YmlfZW5kX2lvOwog
CWJpby0+YmlfZW5kX2lvID0gaW50ZWdyaXR5X2VuZF9pbzsKLQogCWJpby0+YmlfaXRlci5iaV9z
aXplID0gZGlvLT5yYW5nZS5uX3NlY3RvcnMgPDwgU0VDVE9SX1NISUZUOworCiAJZ2VuZXJpY19t
YWtlX3JlcXVlc3QoYmlvKTsKIAogCWlmIChuZWVkX3N5bmNfaW8pIHsKLS0gCjIuMjAuMQoKCi0t
CmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

