Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 10B54220941
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:52:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-p3Ktg4nMPr6Uys7YIir_zQ-1; Wed, 15 Jul 2020 05:52:46 -0400
X-MC-Unique: p3Ktg4nMPr6Uys7YIir_zQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A09C8015F3;
	Wed, 15 Jul 2020 09:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A74B05FC34;
	Wed, 15 Jul 2020 09:52:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D363494F06;
	Wed, 15 Jul 2020 09:52:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9qQXP007872 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:52:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76AB710EE833; Wed, 15 Jul 2020 09:52:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71A3A1007A43
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9361792490A
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:23 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-31-ackgQleTMeu5eyQLIfN6Wg-1; Wed, 15 Jul 2020 05:52:21 -0400
X-MC-Unique: ackgQleTMeu5eyQLIfN6Wg-1
IronPort-SDR: AXn7l+sLdf2oRA5sPJnXgaaMJaknuNWFVg1xTEqcuSL6PDhOiWkAf51ZRcghOMMrb/U2ZB3RSD
	EEuWJsanaOnVIWysA/Bqc4nqr2CUBaRCYbN5tlw5Jo9V5GRhpeT2yaEheVcnvPsvuwMlwXZkQS
	NViznAlj3aOMuAuqyUjlLHm8gR5O/q320h+xrT8ZifF1lAlZbXPQ7uCfw68a7vfMEDD/2isqnu
	PJ/TMuiJbd1D7L7cclg0wLSo9JE3TzB/HDY0FM3tI+CMClrluP0NbCWOCzzlOuw+d7LeAGJtkz
	9BM=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="251769662"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:52:20 +0800
IronPort-SDR: MOD6S4L1im1AuV9EYCkz0KeRoJ2e5yVk4YFoCZGCfGd4j9ha0NDNwIgzTyihR6zM77W8jrLpcu
	B6/EVPkuz8pMYLEPv1egG6Cf6xbuqux+U=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 02:40:13 -0700
IronPort-SDR: 6UoT5rjrL2t5WEWqXCd9PlEcFsbSivMIt2mnDg5Pu0LWnM9KRYp5SlmO25u0mNeTzHni31gx9d
	S21mHuyyqm9A==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 02:52:19 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 18:52:11 +0900
Message-Id: <20200715095217.441885-3-damien.lemoal@wdc.com>
In-Reply-To: <20200715095217.441885-1-damien.lemoal@wdc.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 2/8] dm raid5: Fix compilation warning
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

UmVtb3ZlIHRoZSBpZiBzdGF0ZW1lbnQgYXJvdW5kIHRoZSBjYWxscyB0byBzeXNmc19saW5rX3Jk
ZXYoKSB0byBhdm9pZAp0aGUgY29tcGlsYXRpb24gd2FybmluZyAic3VnZ2VzdCBicmFjZXMgYXJv
dW5kIGVtcHR5IGJvZHkgaW4gYW4g4oCYaWbigJkKc3RhdGVtZW50IiB3aGVuIGNvbXBpbGluZyB3
aXRoIFc9MS4KCkFsc28gZml4IGZ1bmN0aW9uIGRlc2NyaXB0aW9uIGNvbW1lbnRzIHRvIGF2b2lk
IGtkb2MgZm9ybWF0IHdhcm5pbmdzLgoKU2lnbmVkLW9mZi1ieTogRGFtaWVuIExlIE1vYWwgPGRh
bWllbi5sZW1vYWxAd2RjLmNvbT4KLS0tCiBkcml2ZXJzL21kL3JhaWQ1LmMgfCAxMiArKysrKyst
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9yYWlkNS5jIGIvZHJpdmVycy9tZC9yYWlkNS5jCmluZGV4
IGFiODA2N2Y5Y2U4Yy4uNWNkMWRkNDQ4ODFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL21kL3JhaWQ1
LmMKKysrIGIvZHJpdmVycy9tZC9yYWlkNS5jCkBAIC0yMjE3LDkgKzIyMTcsOSBAQCBzdGF0aWMg
aW50IGdyb3dfc3RyaXBlcyhzdHJ1Y3QgcjVjb25mICpjb25mLCBpbnQgbnVtKQogLyoqCiAgKiBz
Y3JpYmJsZV9hbGxvYyAtIGFsbG9jYXRlIHBlcmNwdSBzY3JpYmJsZSBidWZmZXIgZm9yIHJlcXVp
cmVkIHNpemUKICAqCQkgICAgb2YgdGhlIHNjcmliYmxlIHJlZ2lvbgotICogQHBlcmNwdSAtIGZy
b20gZm9yX2VhY2hfcHJlc2VudF9jcHUoKSBvZiB0aGUgY2FsbGVyCi0gKiBAbnVtIC0gdG90YWwg
bnVtYmVyIG9mIGRpc2tzIGluIHRoZSBhcnJheQotICogQGNudCAtIHNjcmliYmxlIG9ianMgY291
bnQgZm9yIHJlcXVpcmVkIHNpemUgb2YgdGhlIHNjcmliYmxlIHJlZ2lvbgorICogQHBlcmNwdTog
ZnJvbSBmb3JfZWFjaF9wcmVzZW50X2NwdSgpIG9mIHRoZSBjYWxsZXIKKyAqIEBudW06IHRvdGFs
IG51bWJlciBvZiBkaXNrcyBpbiB0aGUgYXJyYXkKKyAqIEBjbnQ6IHNjcmliYmxlIG9ianMgY291
bnQgZm9yIHJlcXVpcmVkIHNpemUgb2YgdGhlIHNjcmliYmxlIHJlZ2lvbgogICoKICAqIFRoZSBz
Y3JpYmJsZSBidWZmZXIgc2l6ZSBtdXN0IGJlIGVub3VnaCB0byBjb250YWluOgogICogMS8gYSBz
dHJ1Y3QgcGFnZSBwb2ludGVyIGZvciBlYWNoIGRldmljZSBpbiB0aGUgYXJyYXkgKzIKQEAgLTM3
MTAsNyArMzcxMCw3IEBAIHN0YXRpYyBpbnQgZmV0Y2hfYmxvY2soc3RydWN0IHN0cmlwZV9oZWFk
ICpzaCwgc3RydWN0IHN0cmlwZV9oZWFkX3N0YXRlICpzLAogCXJldHVybiAwOwogfQogCi0vKioK
Ky8qCiAgKiBoYW5kbGVfc3RyaXBlX2ZpbGwgLSByZWFkIG9yIGNvbXB1dGUgZGF0YSB0byBzYXRp
c2Z5IHBlbmRpbmcgcmVxdWVzdHMuCiAgKi8KIHN0YXRpYyB2b2lkIGhhbmRsZV9zdHJpcGVfZmls
bChzdHJ1Y3Qgc3RyaXBlX2hlYWQgKnNoLApAQCAtNzk0NCw4ICs3OTQ0LDggQEAgc3RhdGljIGlu
dCByYWlkNV9zdGFydF9yZXNoYXBlKHN0cnVjdCBtZGRldiAqbWRkZXYpCiAJCQkJCWVsc2UKIAkJ
CQkJCXJkZXYtPnJlY292ZXJ5X29mZnNldCA9IDA7CiAKLQkJCQkJaWYgKHN5c2ZzX2xpbmtfcmRl
dihtZGRldiwgcmRldikpCi0JCQkJCQkvKiBGYWlsdXJlIGhlcmUgaXMgT0sgKi87CisJCQkJCS8q
IEZhaWx1cmUgaGVyZSBpcyBPSyAqLworCQkJCQlzeXNmc19saW5rX3JkZXYobWRkZXYsIHJkZXYp
OwogCQkJCX0KIAkJCX0gZWxzZSBpZiAocmRldi0+cmFpZF9kaXNrID49IGNvbmYtPnByZXZpb3Vz
X3JhaWRfZGlza3MKIAkJCQkgICAmJiAhdGVzdF9iaXQoRmF1bHR5LCAmcmRldi0+ZmxhZ3MpKSB7
Ci0tIAoyLjI2LjIKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29t
Cmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

