Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CB333221B73
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jul 2020 06:38:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-a35Fvds5OFGR5Ih7TVJ3BA-1; Thu, 16 Jul 2020 00:38:51 -0400
X-MC-Unique: a35Fvds5OFGR5Ih7TVJ3BA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 067BE18A1DE8;
	Thu, 16 Jul 2020 04:38:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7508D2B6DB;
	Thu, 16 Jul 2020 04:38:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EDC6A9622F;
	Thu, 16 Jul 2020 04:38:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06G4cQBV010367 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jul 2020 00:38:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6888110CB297; Thu, 16 Jul 2020 04:38:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 646F010CB296
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B85F085A5B3
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:23 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-372-lQyxvcAKM6CyEg9C_N_hhg-1; Thu, 16 Jul 2020 00:38:21 -0400
X-MC-Unique: lQyxvcAKM6CyEg9C_N_hhg-1
IronPort-SDR: IVVl8xYpiWFrwZd5OYxmAXG0AE4VNiSq7RZnSM47VZCPyG2yuDROM8Pspdxp4W4tjIxC8gS0sP
	UeN5zd6DEsZkHfgrr9ktzoxh38pXmbK4EyxZsU+4TTsSLKFKroq0toouffpDFxXNkJHl29uyy5
	oOGUTXex/kG8BX2Lq1voZJy5KoYmFWZZhDDmwJ2Vzu3JRaoTdvS4yGni2yfcYaPa3j+JgxIQW1
	Kg9FBiOHb2cEh8IxA8O3IPsTymQTv5oznwjCURN4xSM3B8Vm1ETqQzGzaYjm8MLWm2utyYLqWq
	s/c=
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; d="scan'208";a="142711056"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 12:38:19 +0800
IronPort-SDR: BiaVJSFWU87i2nxeLt//MjCS05pG1VstIsVqml2Zfw7qfT9FOOgg7kpPSQyimbWumV2oBYS6pW
	MdSUViXwiDLkuuuFmKRzdwvU4MtADv2E0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 21:26:44 -0700
IronPort-SDR: 5yvs1HQkVnBq38SpGu10txQN+fn4taK/hhz3MLsf14E/30uLROeKyibQc53iJuChgw/badonGC
	TWlK4kirHNFA==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 21:38:19 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 16 Jul 2020 13:38:14 +0900
Message-Id: <20200716043815.605448-4-damien.lemoal@wdc.com>
In-Reply-To: <20200716043815.605448-1-damien.lemoal@wdc.com>
References: <20200716043815.605448-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 3/4] dm ioctl: Fix compilation warning
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
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

