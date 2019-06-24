Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB38505AF
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:30:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C821A3162912;
	Mon, 24 Jun 2019 09:30:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F69360BFB;
	Mon, 24 Jun 2019 09:30:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 651D7206D6;
	Mon, 24 Jun 2019 09:30:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9T0RN004527 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7BFA560FDB; Mon, 24 Jun 2019 09:28:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE61860BF7;
	Mon, 24 Jun 2019 09:28:55 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5873859473;
	Mon, 24 Jun 2019 09:28:53 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:28:46 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:29 +0200
Message-Id: <20190624092756.7769-5-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Mon, 24 Jun 2019 09:28:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 24 Jun 2019 09:28:53 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 04/30] libmultipath: fix -Wstringop-overflow
	warning in merge_words()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 24 Jun 2019 09:30:20 +0000 (UTC)

Rml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIGZyb20gZ2NjIDk6CgpJbiBmaWxlIGluY2x1ZGVk
IGZyb20gL3Vzci9pbmNsdWRlL3N0cmluZy5oOjQ5NCwKICAgICAgICAgICAgICAgICBmcm9tIGRt
cGFyc2VyLmM6ODoKSW4gZnVuY3Rpb24g4oCYc3RybmNweeKAmSwKICAgIGlubGluZWQgZnJvbSDi
gJhtZXJnZV93b3Jkc+KAmSBhdCBkbXBhcnNlci5jOjQxOjI6Ci91c3IvaW5jbHVkZS9iaXRzL3N0
cmluZ19mb3J0aWZpZWQuaDoxMDY6MTA6IHdhcm5pbmc6IOKAmF9fYnVpbHRpbl9zdHJuY3B54oCZ
CiAgICAgICAgICAgICAgICAgc3BlY2lmaWVkIGJvdW5kIGRlcGVuZHMgb24gdGhlIGxlbmd0aCBv
ZiB0aGUgc291cmNlIGFyZ3VtZW50CiAgICAgICAgICAgICAgICAgWy1Xc3RyaW5nb3Atb3ZlcmZs
b3c9XQogIDEwNiB8ICAgcmV0dXJuIF9fYnVpbHRpbl9fX3N0cm5jcHlfY2hrIChfX2Rlc3QsIF9f
c3JjLCBfX2xlbiwgX19ib3MgKF9fZGVzdCkpOwogICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CmRtcGFy
c2VyLmM6IEluIGZ1bmN0aW9uIOKAmG1lcmdlX3dvcmRz4oCZOgpkbXBhcnNlci5jOjQxOjE5OiBu
b3RlOiBsZW5ndGggY29tcHV0ZWQgaGVyZQogICA0MSB8ICBzdHJuY3B5KHAsIHdvcmQsIHN0cmxl
bih3b3JkKSArIDEpOwogICAgICB8ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgoKU2ln
bmVkLW9mZi1ieTogTWFydGluIFdpbGNrIDxtd2lsY2tAc3VzZS5jb20+Ci0tLQogbGlibXVsdGlw
YXRoL2RtcGFyc2VyLmMgfCAxNSArKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGlibXVsdGlwYXRoL2Rt
cGFyc2VyLmMgYi9saWJtdWx0aXBhdGgvZG1wYXJzZXIuYwppbmRleCAwNGY2NzVjMS4uYThiMGI3
MWEgMTAwNjQ0Ci0tLSBhL2xpYm11bHRpcGF0aC9kbXBhcnNlci5jCisrKyBiL2xpYm11bHRpcGF0
aC9kbXBhcnNlci5jCkBAIC0yMSwyNCArMjEsMjEgQEAgc3RhdGljIGludAogbWVyZ2Vfd29yZHMo
Y2hhciAqKmRzdCwgY2hhciAqd29yZCkKIHsKIAljaGFyICogcCA9ICpkc3Q7Ci0JaW50IGxlbjsK
KwlpbnQgbGVuLCBkc3RsZW47CiAKLQlsZW4gPSBzdHJsZW4oKmRzdCkgKyBzdHJsZW4od29yZCkg
KyAxOwotCSpkc3QgPSBSRUFMTE9DKCpkc3QsIGxlbiArIDEpOworCWRzdGxlbiA9IHN0cmxlbigq
ZHN0KTsKKwlsZW4gPSBkc3RsZW4gKyBzdHJsZW4od29yZCkgKyAyOworCSpkc3QgPSBSRUFMTE9D
KCpkc3QsIGxlbik7CiAKIAlpZiAoISpkc3QpIHsKIAkJZnJlZShwKTsKIAkJcmV0dXJuIDE7CiAJ
fQogCi0JcCA9ICpkc3Q7Ci0KLQl3aGlsZSAoKnAgIT0gJ1wwJykKLQkJcCsrOwotCisJcCA9ICpk
c3QgKyBkc3RsZW47CiAJKnAgPSAnICc7CiAJKytwOwotCXN0cm5jcHkocCwgd29yZCwgc3RybGVu
KHdvcmQpICsgMSk7CisJc3RybmNweShwLCB3b3JkLCBsZW4gLSBkc3RsZW4gLSAxKTsKIAogCXJl
dHVybiAwOwogfQotLSAKMi4yMS4wCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxA
cmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2
ZWw=
