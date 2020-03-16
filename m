Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAB2186724
	for <lists+dm-devel@lfdr.de>; Mon, 16 Mar 2020 09:57:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584349018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P16wDJztWiIuDJGQwIEjDNqMChdn4q3BuO0bUWoj0S8=;
	b=AJBmTOc21WnN9OB5MXniWE7C40sl0P8aSQ87O7M2deUbk3jutrfD2QA8sCaxvhKFK+r2KW
	EJbu0kfSb0lb8RTTYKKPsxrEZ5CTTr+6YyWauWQMMlzCrStWfeNOVJpOGA6dW6jC1FmO6W
	0Z7PCge2ePZ4kgKqMJKSA2vZ1IWtehY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-SYiP0QoJOnywZzdCMBy7Ag-1; Mon, 16 Mar 2020 04:56:56 -0400
X-MC-Unique: SYiP0QoJOnywZzdCMBy7Ag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A562800D6C;
	Mon, 16 Mar 2020 08:56:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5052592D50;
	Mon, 16 Mar 2020 08:56:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC74086FF3;
	Mon, 16 Mar 2020 08:56:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02G2YiUj017164 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Mar 2020 22:34:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC16B2063FE5; Mon, 16 Mar 2020 02:34:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C53622026D66
	for <dm-devel@redhat.com>; Mon, 16 Mar 2020 02:34:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE90F8F49C9
	for <dm-devel@redhat.com>; Mon, 16 Mar 2020 02:34:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-184-JCKxL9gPPJi5AoxzHdcKyQ-1;
	Sun, 15 Mar 2020 22:34:39 -0400
X-MC-Unique: JCKxL9gPPJi5AoxzHdcKyQ-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 914A420754;
	Mon, 16 Mar 2020 02:34:37 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 15 Mar 2020 22:33:59 -0400
Message-Id: <20200316023411.1263-23-sashal@kernel.org>
In-Reply-To: <20200316023411.1263-1-sashal@kernel.org>
References: <20200316023411.1263-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02G2YiUj017164
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 16 Mar 2020 04:56:16 -0400
Cc: Sasha Levin <sashal@kernel.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	=?UTF-8?q?Daniel=20Gl=C3=B6ckner?= <dg@emlix.com>
Subject: [dm-devel] [PATCH AUTOSEL 5.4 23/35] dm integrity: use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
L2RtLWludGVncml0eS5jIGIvZHJpdmVycy9tZC9kbS1pbnRlZ3JpdHkuYwppbmRleCA1N2FjNjAz
ZjM3NDEwLi4xNDViYzJlN2VhZjAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL21kL2RtLWludGVncml0
eS5jCisrKyBiL2RyaXZlcnMvbWQvZG0taW50ZWdyaXR5LmMKQEAgLTYsNiArNiw4IEBACiAgKiBU
aGlzIGZpbGUgaXMgcmVsZWFzZWQgdW5kZXIgdGhlIEdQTC4KICAqLwogCisjaW5jbHVkZSAiZG0t
YmlvLXJlY29yZC5oIgorCiAjaW5jbHVkZSA8bGludXgvY29tcGlsZXIuaD4KICNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UtbWFwcGVyLmg+CkBAIC0yOTIs
MTEgKzI5NCw3IEBAIHN0cnVjdCBkbV9pbnRlZ3JpdHlfaW8gewogCiAJc3RydWN0IGNvbXBsZXRp
b24gKmNvbXBsZXRpb247CiAKLQlzdHJ1Y3QgZ2VuZGlzayAqb3JpZ19iaV9kaXNrOwotCXU4IG9y
aWdfYmlfcGFydG5vOwotCWJpb19lbmRfaW9fdCAqb3JpZ19iaV9lbmRfaW87Ci0Jc3RydWN0IGJp
b19pbnRlZ3JpdHlfcGF5bG9hZCAqb3JpZ19iaV9pbnRlZ3JpdHk7Ci0Jc3RydWN0IGJ2ZWNfaXRl
ciBvcmlnX2JpX2l0ZXI7CisJc3RydWN0IGRtX2Jpb19kZXRhaWxzIGJpb19kZXRhaWxzOwogfTsK
IAogc3RydWN0IGpvdXJuYWxfY29tcGxldGlvbiB7CkBAIC0xNDQ3LDE0ICsxNDQ1LDkgQEAgc3Rh
dGljIHZvaWQgaW50ZWdyaXR5X2VuZF9pbyhzdHJ1Y3QgYmlvICpiaW8pCiB7CiAJc3RydWN0IGRt
X2ludGVncml0eV9pbyAqZGlvID0gZG1fcGVyX2Jpb19kYXRhKGJpbywgc2l6ZW9mKHN0cnVjdCBk
bV9pbnRlZ3JpdHlfaW8pKTsKIAotCWJpby0+YmlfaXRlciA9IGRpby0+b3JpZ19iaV9pdGVyOwot
CWJpby0+YmlfZGlzayA9IGRpby0+b3JpZ19iaV9kaXNrOwotCWJpby0+YmlfcGFydG5vID0gZGlv
LT5vcmlnX2JpX3BhcnRubzsKLQlpZiAoZGlvLT5vcmlnX2JpX2ludGVncml0eSkgewotCQliaW8t
PmJpX2ludGVncml0eSA9IGRpby0+b3JpZ19iaV9pbnRlZ3JpdHk7CisJZG1fYmlvX3Jlc3RvcmUo
JmRpby0+YmlvX2RldGFpbHMsIGJpbyk7CisJaWYgKGJpby0+YmlfaW50ZWdyaXR5KQogCQliaW8t
PmJpX29wZiB8PSBSRVFfSU5URUdSSVRZOwotCX0KLQliaW8tPmJpX2VuZF9pbyA9IGRpby0+b3Jp
Z19iaV9lbmRfaW87CiAKIAlpZiAoZGlvLT5jb21wbGV0aW9uKQogCQljb21wbGV0ZShkaW8tPmNv
bXBsZXRpb24pOwpAQCAtMTUzOSw3ICsxNTMyLDcgQEAgc3RhdGljIHZvaWQgaW50ZWdyaXR5X21l
dGFkYXRhKHN0cnVjdCB3b3JrX3N0cnVjdCAqdykKIAkJCX0KIAkJfQogCi0JCV9fYmlvX2Zvcl9l
YWNoX3NlZ21lbnQoYnYsIGJpbywgaXRlciwgZGlvLT5vcmlnX2JpX2l0ZXIpIHsKKwkJX19iaW9f
Zm9yX2VhY2hfc2VnbWVudChidiwgYmlvLCBpdGVyLCBkaW8tPmJpb19kZXRhaWxzLmJpX2l0ZXIp
IHsKIAkJCXVuc2lnbmVkIHBvczsKIAkJCWNoYXIgKm1lbSwgKmNoZWNrc3Vtc19wdHI7CiAKQEAg
LTE1ODMsNyArMTU3Niw3IEBAIHN0YXRpYyB2b2lkIGludGVncml0eV9tZXRhZGF0YShzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKncpCiAJCWlmIChsaWtlbHkoY2hlY2tzdW1zICE9IGNoZWNrc3Vtc19vbnN0
YWNrKSkKIAkJCWtmcmVlKGNoZWNrc3Vtcyk7CiAJfSBlbHNlIHsKLQkJc3RydWN0IGJpb19pbnRl
Z3JpdHlfcGF5bG9hZCAqYmlwID0gZGlvLT5vcmlnX2JpX2ludGVncml0eTsKKwkJc3RydWN0IGJp
b19pbnRlZ3JpdHlfcGF5bG9hZCAqYmlwID0gZGlvLT5iaW9fZGV0YWlscy5iaV9pbnRlZ3JpdHk7
CiAKIAkJaWYgKGJpcCkgewogCQkJc3RydWN0IGJpb192ZWMgYml2OwpAQCAtMjAwMiwyMCArMTk5
NSwxMyBAQCBzdGF0aWMgdm9pZCBkbV9pbnRlZ3JpdHlfbWFwX2NvbnRpbnVlKHN0cnVjdCBkbV9p
bnRlZ3JpdHlfaW8gKmRpbywgYm9vbCBmcm9tX21hcAogCX0gZWxzZQogCQlkaW8tPmNvbXBsZXRp
b24gPSBOVUxMOwogCi0JZGlvLT5vcmlnX2JpX2l0ZXIgPSBiaW8tPmJpX2l0ZXI7Ci0KLQlkaW8t
Pm9yaWdfYmlfZGlzayA9IGJpby0+YmlfZGlzazsKLQlkaW8tPm9yaWdfYmlfcGFydG5vID0gYmlv
LT5iaV9wYXJ0bm87CisJZG1fYmlvX3JlY29yZCgmZGlvLT5iaW9fZGV0YWlscywgYmlvKTsKIAli
aW9fc2V0X2RldihiaW8sIGljLT5kZXYtPmJkZXYpOwotCi0JZGlvLT5vcmlnX2JpX2ludGVncml0
eSA9IGJpb19pbnRlZ3JpdHkoYmlvKTsKIAliaW8tPmJpX2ludGVncml0eSA9IE5VTEw7CiAJYmlv
LT5iaV9vcGYgJj0gflJFUV9JTlRFR1JJVFk7Ci0KLQlkaW8tPm9yaWdfYmlfZW5kX2lvID0gYmlv
LT5iaV9lbmRfaW87CiAJYmlvLT5iaV9lbmRfaW8gPSBpbnRlZ3JpdHlfZW5kX2lvOwotCiAJYmlv
LT5iaV9pdGVyLmJpX3NpemUgPSBkaW8tPnJhbmdlLm5fc2VjdG9ycyA8PCBTRUNUT1JfU0hJRlQ7
CisKIAlnZW5lcmljX21ha2VfcmVxdWVzdChiaW8pOwogCiAJaWYgKG5lZWRfc3luY19pbykgewot
LSAKMi4yMC4xCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20K
aHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

