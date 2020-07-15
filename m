Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B5B51220948
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:53:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-1N1_D3T-PO2wXCdKjyHs1g-1; Wed, 15 Jul 2020 05:52:47 -0400
X-MC-Unique: 1N1_D3T-PO2wXCdKjyHs1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5446680BCA8;
	Wed, 15 Jul 2020 09:52:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF27C710A1;
	Wed, 15 Jul 2020 09:52:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8FDD11809554;
	Wed, 15 Jul 2020 09:52:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9qQYb007875 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:52:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCC601007A4C; Wed, 15 Jul 2020 09:52:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B82831008B99
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0331856A54
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:26 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-31-4mThnn_WO1GiFvRF_ZXMkA-2; Wed, 15 Jul 2020 05:52:22 -0400
X-MC-Unique: 4mThnn_WO1GiFvRF_ZXMkA-2
IronPort-SDR: cqrEyjB2yRhHw4OoehUxZvlhvbPF5TtuUPG8vxbayZPET2CP5l8l+Nojh9kTHoI5SIwK5L9EC/
	LI3WlbLQr2rrDC39T2vNq6Dl+ecEXHIGwFMCcrNf0o4I27GpMFy92GgdQglsCDzHeDH9opt2lY
	UmzX1lDvgBWYLoHKLA4PUmy2oljKyXa+/wMwNIC7HecKCEQUftkLi4Jnj2Igo3o5M0BRo12JNg
	DhS4ijs/jA4lU7JJ40p9y4JrcjAdDSKwi4wbhbPNPmg2icAKhA4Qk2jr8piUTvknStigfs7NVH
	6XI=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="251769665"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:52:20 +0800
IronPort-SDR: y5QE9+t7yVSg7OT7ajQ9/jbM3rsxPoFoLAhvwn8x9GMdioQpS+H5Ubp224SbOXgrRgr9DS7rto
	YB0q0V2ZEoZjKM0wYO7QPhWl1NxRKhUzU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 02:40:14 -0700
IronPort-SDR: 5RStOCRSiwttNm7b4JOwlxqTev1O/q7SxQjwZRjZw8DjbbW+76SmjiCSLzCsHwgMKpjN/z9Lev
	VHn5wSGoJexA==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 02:52:20 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 18:52:12 +0900
Message-Id: <20200715095217.441885-4-damien.lemoal@wdc.com>
In-Reply-To: <20200715095217.441885-1-damien.lemoal@wdc.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 3/8] md: Fix compilation warning
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmVtb3ZlIHRoZSBpZiBzdGF0ZW1lbnQgYXJvdW5kIHRoZSBjYWxscyB0byBzeXNmc19saW5rX3Jk
ZXYoKSB0byBhdm9pZAp0aGUgY29tcGlsYXRpb24gd2FybmluZ3M6Cgp3YXJuaW5nOiBzdWdnZXN0
IGJyYWNlcyBhcm91bmQgZW1wdHkgYm9keSBpbiBhbiDigJhpZuKAmSBzdGF0ZW1lbnQKCndoZW4g
Y29tcGlsaW5nIHdpdGggVz0xLiBGb3IgdGhlIGNhbGwgdG8gc3lzZnNfY3JlYXRlX2xpbmsoKSBn
ZW5lcmF0aW5nCnRoZSBzYW1lIHdhcm5pbmcsIHVzZSB0aGUgZXJyIHZhcmlhYmxlIHRvIHN0b3Jl
IHRoZSBmdW5jdGlvbiByZXN1bHQsCmF2b2lkaW5nIHRyaWdnZXJpbmcgYW5vdGhlciB3YXJuaW5n
IGFzIHRoZSBmdW5jdGlvbiBpcyBkZWNsYXJlZAphcyAnd2Fybl91bnVzZWRfcmVzdWx0Jy4KClNp
Z25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+Ci0tLQog
ZHJpdmVycy9tZC9tZC5jIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvbWQuYyBi
L2RyaXZlcnMvbWQvbWQuYwppbmRleCBmNTY3ZjUzNmI1MjkuLmY2YzgzNDgzYTVhMiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9tZC9tZC5jCisrKyBiL2RyaXZlcnMvbWQvbWQuYwpAQCAtMjQ0MSw4ICsy
NDQxLDggQEAgc3RhdGljIGludCBiaW5kX3JkZXZfdG9fYXJyYXkoc3RydWN0IG1kX3JkZXYgKnJk
ZXYsIHN0cnVjdCBtZGRldiAqbWRkZXYpCiAJCWdvdG8gZmFpbDsKIAogCWtvID0gJnBhcnRfdG9f
ZGV2KHJkZXYtPmJkZXYtPmJkX3BhcnQpLT5rb2JqOwotCWlmIChzeXNmc19jcmVhdGVfbGluaygm
cmRldi0+a29iaiwga28sICJibG9jayIpKQotCQkvKiBmYWlsdXJlIGhlcmUgaXMgT0sgKi87CisJ
LyogZmFpbHVyZSBoZXJlIGlzIE9LICovCisJZXJyID0gc3lzZnNfY3JlYXRlX2xpbmsoJnJkZXYt
PmtvYmosIGtvLCAiYmxvY2siKTsKIAlyZGV2LT5zeXNmc19zdGF0ZSA9IHN5c2ZzX2dldF9kaXJl
bnRfc2FmZShyZGV2LT5rb2JqLnNkLCAic3RhdGUiKTsKIAogCWxpc3RfYWRkX3JjdSgmcmRldi0+
c2FtZV9zZXQsICZtZGRldi0+ZGlza3MpOwpAQCAtMzIwMiw4ICszMjAyLDggQEAgc2xvdF9zdG9y
ZShzdHJ1Y3QgbWRfcmRldiAqcmRldiwgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgbGVuKQogCQkJ
cmV0dXJuIGVycjsKIAkJfSBlbHNlCiAJCQlzeXNmc19ub3RpZnlfZGlyZW50X3NhZmUocmRldi0+
c3lzZnNfc3RhdGUpOwotCQlpZiAoc3lzZnNfbGlua19yZGV2KHJkZXYtPm1kZGV2LCByZGV2KSkK
LQkJCS8qIGZhaWx1cmUgaGVyZSBpcyBPSyAqLzsKKwkJLyogZmFpbHVyZSBoZXJlIGlzIE9LICov
OworCQlzeXNmc19saW5rX3JkZXYocmRldi0+bWRkZXYsIHJkZXYpOwogCQkvKiBkb24ndCB3YWtl
dXAgYW55b25lLCBsZWF2ZSB0aGF0IHRvIHVzZXJzcGFjZS4gKi8KIAl9IGVsc2UgewogCQlpZiAo
c2xvdCA+PSByZGV2LT5tZGRldi0+cmFpZF9kaXNrcyAmJgpAQCAtOTA2MCw4ICs5MDYwLDggQEAg
c3RhdGljIGludCByZW1vdmVfYW5kX2FkZF9zcGFyZXMoc3RydWN0IG1kZGV2ICptZGRldiwKIAkJ
CXJkZXYtPnJlY292ZXJ5X29mZnNldCA9IDA7CiAJCX0KIAkJaWYgKG1kZGV2LT5wZXJzLT5ob3Rf
YWRkX2Rpc2sobWRkZXYsIHJkZXYpID09IDApIHsKLQkJCWlmIChzeXNmc19saW5rX3JkZXYobWRk
ZXYsIHJkZXYpKQotCQkJCS8qIGZhaWx1cmUgaGVyZSBpcyBPSyAqLzsKKwkJCS8qIGZhaWx1cmUg
aGVyZSBpcyBPSyAqLworCQkJc3lzZnNfbGlua19yZGV2KG1kZGV2LCByZGV2KTsKIAkJCWlmICgh
dGVzdF9iaXQoSm91cm5hbCwgJnJkZXYtPmZsYWdzKSkKIAkJCQlzcGFyZXMrKzsKIAkJCW1kX25l
d19ldmVudChtZGRldik7Ci0tIAoyLjI2LjIKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1k
ZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
bS1kZXZlbA==

