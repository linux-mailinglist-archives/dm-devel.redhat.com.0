Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D26436CA0
	for <lists+dm-devel@lfdr.de>; Thu, 21 Oct 2021 23:25:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-Ihm2DGhrNSmvWcWCXzhCMg-1; Thu, 21 Oct 2021 17:25:00 -0400
X-MC-Unique: Ihm2DGhrNSmvWcWCXzhCMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F2E01006AA2;
	Thu, 21 Oct 2021 21:24:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C4CA1835D;
	Thu, 21 Oct 2021 21:24:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EE034EA31;
	Thu, 21 Oct 2021 21:24:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LLKF3G003731 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 17:20:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93EA71007266; Thu, 21 Oct 2021 21:20:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FBC410073AC
	for <dm-devel@redhat.com>; Thu, 21 Oct 2021 21:20:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD95A8001EA
	for <dm-devel@redhat.com>; Thu, 21 Oct 2021 21:20:12 +0000 (UTC)
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-433-4cAGS4nHPfmknDvCUSk0Dg-1;
	Thu, 21 Oct 2021 17:20:09 -0400
X-MC-Unique: 4cAGS4nHPfmknDvCUSk0Dg-1
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4Hb0Zb1rpKzJS;
	Thu, 21 Oct 2021 23:13:27 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Thu, 21 Oct 2021 23:13:27 +0200
Message-Id: <f0c83405252d9f0b92490087ee76806bc7e51e0f.1634850725.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19LLKF3G003731
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm: log table creation error code
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVscCBkZWJ1Z2dpbmcgdGFibGUgY3JlYXRpb24gZXJyb3JzIGJ5IGFkZGluZyB0aGUgZXJyb3Ig
bmFtZSBpbiB0aGUgbG9nLgoKU2lnbmVkLW9mZi1ieTogTWljaGHFgsKgTWlyb3PFgmF3IDxtaXJx
LWxpbnV4QHJlcmUucW1xbS5wbD4KU2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1p
cnEtbGludXhAcmVyZS5xbXFtLnBsPgotLS0KIGRyaXZlcnMvbWQvZG0tdGFibGUuYyB8IDQgKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL21kL2RtLXRhYmxlLmMgYi9kcml2ZXJzL21kL2RtLXRhYmxlLmMKaW5k
ZXggMjExMWRhYWFjYWJhLi4wMTc1MjI0MzllNzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWQvZG0t
dGFibGUuYworKysgYi9kcml2ZXJzL21kL2RtLXRhYmxlLmMKQEAgLTcwNiw3ICs3MDYsNyBAQCBp
bnQgZG1fdGFibGVfYWRkX3RhcmdldChzdHJ1Y3QgZG1fdGFibGUgKnQsIGNvbnN0IGNoYXIgKnR5
cGUsCiAKIAlyID0gZG1fc3BsaXRfYXJncygmYXJnYywgJmFyZ3YsIHBhcmFtcyk7CiAJaWYgKHIp
IHsKLQkJdGd0LT5lcnJvciA9ICJjb3VsZG4ndCBzcGxpdCBwYXJhbWV0ZXJzIChpbnN1ZmZpY2ll
bnQgbWVtb3J5KSI7CisJCXRndC0+ZXJyb3IgPSAiY291bGRuJ3Qgc3BsaXQgcGFyYW1ldGVycyI7
CiAJCWdvdG8gYmFkOwogCX0KIApAQCAtNzI0LDcgKzcyNCw3IEBAIGludCBkbV90YWJsZV9hZGRf
dGFyZ2V0KHN0cnVjdCBkbV90YWJsZSAqdCwgY29uc3QgY2hhciAqdHlwZSwKIAlyZXR1cm4gMDsK
IAogIGJhZDoKLQlETUVSUigiJXM6ICVzOiAlcyIsIGRtX2RldmljZV9uYW1lKHQtPm1kKSwgdHlw
ZSwgdGd0LT5lcnJvcik7CisJRE1FUlIoIiVzOiAlczogJXMgKCVwZSkiLCBkbV9kZXZpY2VfbmFt
ZSh0LT5tZCksIHR5cGUsIHRndC0+ZXJyb3IsIEVSUl9QVFIocikpOwogCWRtX3B1dF90YXJnZXRf
dHlwZSh0Z3QtPnR5cGUpOwogCXJldHVybiByOwogfQotLSAKMi4zMC4yCgoKLS0KZG0tZGV2ZWwg
bWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5j
b20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

