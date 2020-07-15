Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 77E3D220942
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:52:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-1iL1FTaROrOUFxHv7ppydQ-1; Wed, 15 Jul 2020 05:52:46 -0400
X-MC-Unique: 1iL1FTaROrOUFxHv7ppydQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33DC28015CB;
	Wed, 15 Jul 2020 09:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8DA010013D0;
	Wed, 15 Jul 2020 09:52:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF1F5180954D;
	Wed, 15 Jul 2020 09:52:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9qTTZ007910 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:52:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37E71215688E; Wed, 15 Jul 2020 09:52:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 321932156A4D
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA7FC185A797
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:28 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-31-VbhgQGY7OqGYJP-4Oc0sGw-4; Wed, 15 Jul 2020 05:52:24 -0400
X-MC-Unique: VbhgQGY7OqGYJP-4Oc0sGw-4
IronPort-SDR: 0Ur6ZNExi/dSKt/xJy5QxxKqGfCgW6o62N7DMBbdJrgALOarXlhXR9XWC9uvJdqZFsTKd+pV43
	wpxADaeRCKCQr4Wa5m9WY/0puzBy7P2MenxWG/3gMQ3Qt5NbCz4oFtk20tYnCgQ7tpmy1YXdjB
	DSVP/rX4aMpDT1MaE4jPG9d/dT84doR0Q6ogyS/Q3IRC60IYSIcivVaW+O7pQcncYfYv/I/Snh
	mMOcmW2JXTpYtJnbfaJxfLMSfbkTmvHKW0nl1SeuWlz72jl9I6KfhVPkwrkRVMN5mfh3MLtQS4
	U8M=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="251769674"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:52:24 +0800
IronPort-SDR: e3w/WQi5Frh9nZXKtLr7ZspomL5yeq7iDvJiOE/lkSsUOx4CmKmh6R0k5/P3+7mafMMra+HJMh
	rXgWh2g4rUALcBodoE2fbDcq+rnNdt+kk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 02:40:17 -0700
IronPort-SDR: LxE990Ie3FlcgV7fqCnmSy/VdkIeSQ7P9yzSMahf8szQTUEqJkb4NfuCyyuSQ5obVNemmyRQ2n
	Yuqb+Hcq5Ljw==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 02:52:23 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 18:52:16 +0900
Message-Id: <20200715095217.441885-8-damien.lemoal@wdc.com>
In-Reply-To: <20200715095217.441885-1-damien.lemoal@wdc.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 7/8] dm ioctl: Fix compilation warning
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SW4gcmV0cmlldmVfc3RhdHVzKCksIHdoZW4gY29weWluZyB0aGUgdGFyZ2V0IHR5cGUgbmFtZSBp
biB0aGUKdGFyZ2V0X3R5cGUgc3RyaW5nIGZpZWxkIG9mIHN0cnVjdCBkbV90YXJnZXRfc3BlYywg
Y29weSBhdCBtb3N0CkRNX01BWF9UWVBFX05BTUUgLSAxIGNoYXJhY3RlciB0byBhdm9pZCB0aGUg
Y29tcGlsYXRpb24gd2FybmluZzoKCndhcm5pbmc6IOKAmF9fYnVpbHRpbl9zdHJuY3B54oCZIHNw
ZWNpZmllZCBib3VuZCAxNiBlcXVhbHMgZGVzdGluYXRpb24Kc2l6ZSBbLVdzdHJpbmdvcC10cnVu
Y2F0aW9uXQoKd2hlbiBjb21waWxpbmcgd2l0aCBXLTEuCgpTaWduZWQtb2ZmLWJ5OiBEYW1pZW4g
TGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPgotLS0KIGRyaXZlcnMvbWQvZG0taW9jdGwu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvZG0taW9jdGwuYyBiL2RyaXZlcnMvbWQvZG0taW9jdGwu
YwppbmRleCA0ODk5MzVkNWYyMmQuLjU3OTI4NzhkYmZmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
ZC9kbS1pb2N0bC5jCisrKyBiL2RyaXZlcnMvbWQvZG0taW9jdGwuYwpAQCAtMTE2OCw3ICsxMTY4
LDcgQEAgc3RhdGljIHZvaWQgcmV0cmlldmVfc3RhdHVzKHN0cnVjdCBkbV90YWJsZSAqdGFibGUs
CiAJCXNwZWMtPnNlY3Rvcl9zdGFydCA9IHRpLT5iZWdpbjsKIAkJc3BlYy0+bGVuZ3RoID0gdGkt
PmxlbjsKIAkJc3RybmNweShzcGVjLT50YXJnZXRfdHlwZSwgdGktPnR5cGUtPm5hbWUsCi0JCQlz
aXplb2Yoc3BlYy0+dGFyZ2V0X3R5cGUpKTsKKwkJCXNpemVvZihzcGVjLT50YXJnZXRfdHlwZSkg
LSAxKTsKIAogCQlvdXRwdHIgKz0gc2l6ZW9mKHN0cnVjdCBkbV90YXJnZXRfc3BlYyk7CiAJCXJl
bWFpbmluZyA9IGxlbiAtIChvdXRwdHIgLSBvdXRidWYpOwotLSAKMi4yNi4yCgotLQpkbS1kZXZl
bCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

