Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5A703220947
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:53:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-R7m9-ue4PPSE0B8vlgX2JA-1; Wed, 15 Jul 2020 05:52:49 -0400
X-MC-Unique: R7m9-ue4PPSE0B8vlgX2JA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA28D1DE6;
	Wed, 15 Jul 2020 09:52:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7FE45D9C5;
	Wed, 15 Jul 2020 09:52:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F03294F06;
	Wed, 15 Jul 2020 09:52:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9qS1M007890 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:52:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22A1386D90; Wed, 15 Jul 2020 09:52:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E2D3F11C0
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 149BC1832D24
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:25 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-265-HsZRztcSOe2Tbbxps7S4QQ-3; Wed, 15 Jul 2020 05:52:22 -0400
X-MC-Unique: HsZRztcSOe2Tbbxps7S4QQ-3
IronPort-SDR: J6v+2bVyt5HqkRMY0hkMYwkgkZDv+pJkUnJY1eAPsgJkhfZsskjrfZyLkb+3QoT+LLUROlTHdm
	lfyEOqnKOo2VS/YNN1lsDW3moH/Wm0DTVLYwqfySy2P9Qh7V5Ts5IYdhzVDntcdGtRCGNQBxxh
	mwnko9Ney7DVYAOraqz3s6IUIBTv6rtSXxoPCYSTU06UvML+X+isNzPRHSobYy+RhOG8WGvHN5
	EDtB2sa0UOt6YKPdu1gQJ9eh4owEEjxY6yg//8dfwTUceZ92nZq+55uX2UzNsoMN9+Jnowhpfo
	rkY=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="251769668"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:52:21 +0800
IronPort-SDR: sM79oto3r7Sb5VgwS9QP3rzMgY/WjdQ+2nn2yIojk0YODhp5iFgduk0VJWJl/s+pkmLmi6gkQR
	kPs5XuhZS7GKvNTicPZA4ni/p2StRsGDk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 02:40:14 -0700
IronPort-SDR: DnWCT7o6qpbm13srqRRDFagzaXAtSw8A1HWhAphQq/KMQhD6F6GknAGrpZxWOFew82bP/AG0Mu
	P6B2ZWlvgJmQ==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 02:52:21 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 18:52:13 +0900
Message-Id: <20200715095217.441885-5-damien.lemoal@wdc.com>
In-Reply-To: <20200715095217.441885-1-damien.lemoal@wdc.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 4/8] dm raid10: Fix compilation warning
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmVtb3ZlIHRoZSBpZiBzdGF0ZW1lbnQgYXJvdW5kIHRoZSBjYWxsIHRvIHN5c2ZzX2xpbmtfcmRl
digpIGluCnJhaWQxMF9zdGFydF9yZXNoYXBlKCkgdG8gYXZvaWQgdGhlIGNvbXBpbGF0aW9uIHdh
cm5pbmc6Cgp3YXJuaW5nOiBzdWdnZXN0IGJyYWNlcyBhcm91bmQgZW1wdHkgYm9keSBpbiBhbiDi
gJhpZuKAmSBzdGF0ZW1lbnQKCndoZW4gY29tcGlsaW5nIHdpdGggVz0xLgoKU2lnbmVkLW9mZi1i
eTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4KLS0tCiBkcml2ZXJzL21k
L3JhaWQxMC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvcmFpZDEwLmMgYi9kcml2ZXJzL21k
L3JhaWQxMC5jCmluZGV4IGVjMTM2ZTQ0YWVmNy4uMDhmNjk3ZjNkZGM4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL21kL3JhaWQxMC5jCisrKyBiL2RyaXZlcnMvbWQvcmFpZDEwLmMKQEAgLTQzMDcsOCAr
NDMwNyw4IEBAIHN0YXRpYyBpbnQgcmFpZDEwX3N0YXJ0X3Jlc2hhcGUoc3RydWN0IG1kZGV2ICpt
ZGRldikKIAkJCQkJZWxzZQogCQkJCQkJcmRldi0+cmVjb3Zlcnlfb2Zmc2V0ID0gMDsKIAotCQkJ
CQlpZiAoc3lzZnNfbGlua19yZGV2KG1kZGV2LCByZGV2KSkKLQkJCQkJCS8qIEZhaWx1cmUgaGVy
ZSAgaXMgT0sgKi87CisJCQkJCS8qIEZhaWx1cmUgaGVyZSBpcyBPSyAqLworCQkJCQlzeXNmc19s
aW5rX3JkZXYobWRkZXYsIHJkZXYpOwogCQkJCX0KIAkJCX0gZWxzZSBpZiAocmRldi0+cmFpZF9k
aXNrID49IGNvbmYtPnByZXYucmFpZF9kaXNrcwogCQkJCSAgICYmICF0ZXN0X2JpdChGYXVsdHks
ICZyZGV2LT5mbGFncykpIHsKLS0gCjIuMjYuMgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRt
LWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2RtLWRldmVs

