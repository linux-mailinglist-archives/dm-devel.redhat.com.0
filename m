Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B0238AE9
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:09:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17ED43003097;
	Fri,  7 Jun 2019 13:09:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D88077FE8C;
	Fri,  7 Jun 2019 13:09:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5FCE9206D6;
	Fri,  7 Jun 2019 13:09:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D6sYe000405 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:06:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55A208CB89; Fri,  7 Jun 2019 13:06:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33F4B17D09;
	Fri,  7 Jun 2019 13:06:49 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6577A3007406;
	Fri,  7 Jun 2019 13:06:15 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:10 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:26 +0200
Message-Id: <20190607130552.13203-5-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Fri, 07 Jun 2019 13:06:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 07 Jun 2019 13:06:41 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 04/30] libmultipath: fix -Wstringop-overflow
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 07 Jun 2019 13:09:32 +0000 (UTC)

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
