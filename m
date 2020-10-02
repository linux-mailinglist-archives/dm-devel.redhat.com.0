Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 888EF280F77
	for <lists+dm-devel@lfdr.de>; Fri,  2 Oct 2020 11:05:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-BKjmaX_TOI2mN8LmxYzHDA-1; Fri, 02 Oct 2020 05:05:41 -0400
X-MC-Unique: BKjmaX_TOI2mN8LmxYzHDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F4C78030C3;
	Fri,  2 Oct 2020 09:05:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1375560CCC;
	Fri,  2 Oct 2020 09:05:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17B1344A5F;
	Fri,  2 Oct 2020 09:05:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0927bZOW003063 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Oct 2020 03:37:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83E9F2157F5E; Fri,  2 Oct 2020 07:37:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EB1C2157F5D
	for <dm-devel@redhat.com>; Fri,  2 Oct 2020 07:37:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A532185A78B
	for <dm-devel@redhat.com>; Fri,  2 Oct 2020 07:37:31 +0000 (UTC)
Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch
	[83.166.143.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-87-JLdpAiD4PkCBg9ETncNVnw-1; Fri, 02 Oct 2020 03:37:29 -0400
X-MC-Unique: JLdpAiD4PkCBg9ETncNVnw-1
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id
	4C2hDM26gTzlhSjh; Fri,  2 Oct 2020 09:18:27 +0200 (CEST)
Received: from localhost (unknown [94.23.54.103])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id
	4C2hDL58YNzllmgM; Fri,  2 Oct 2020 09:18:26 +0200 (CEST)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Date: Fri,  2 Oct 2020 09:18:02 +0200
Message-Id: <20201002071802.535023-1-mic@digikod.net>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0927bZOW003063
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Oct 2020 04:59:27 -0400
Cc: Deven Bowers <deven.desai@linux.microsoft.com>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>,
	dm-devel@redhat.com,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	linux-integrity@vger.kernel.org, Milan Broz <gmazyland@gmail.com>,
	Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Subject: [dm-devel] [PATCH v1] dm verity: Add support for signature
	verification with 2nd keyring
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RnJvbTogTWlja2HDq2wgU2FsYcO8biA8bWljQGxpbnV4Lm1pY3Jvc29mdC5jb20+CgpBZGQgYSBu
ZXcgRE1fVkVSSVRZX1ZFUklGWV9ST09USEFTSF9TSUdfU0VDT05EQVJZX0tFWVJJTkcgY29uZmln
dXJhdGlvbgp0byBlbmFibGUgZG0tdmVyaXR5IHNpZ25hdHVyZXMgdG8gYmUgdmVyaWZpZWQgYWdh
aW5zdCB0aGUgc2Vjb25kYXJ5CnRydXN0ZWQga2V5cmluZy4gIFRoaXMgYWxsb3dzIGNlcnRpZmlj
YXRlIHVwZGF0ZXMgd2l0aG91dCBrZXJuZWwgdXBkYXRlCmFuZCByZWJvb3QsIGFsaWduaW5nIHdp
dGggbW9kdWxlIGFuZCBrZXJuZWwgKGtleGVjKSBzaWduYXR1cmUKdmVyaWZpY2F0aW9ucy4KClNp
Z25lZC1vZmYtYnk6IE1pY2thw6tsIFNhbGHDvG4gPG1pY0BsaW51eC5taWNyb3NvZnQuY29tPgpD
YzogSmFza2FyYW4gS2h1cmFuYSA8amFza2FyYW5raHVyYW5hQGxpbnV4Lm1pY3Jvc29mdC5jb20+
CkNjOiBNaWtlIFNuaXR6ZXIgPHNuaXR6ZXJAcmVkaGF0LmNvbT4KQ2M6IE1pbGFuIEJyb3ogPGdt
YXp5bGFuZEBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9tZC9LY29uZmlnICAgICAgICAgICAgICAg
IHwgMTMgKysrKysrKysrKysrLQogZHJpdmVycy9tZC9kbS12ZXJpdHktdmVyaWZ5LXNpZy5jIHwg
IDkgKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9LY29uZmlnIGIvZHJpdmVycy9tZC9LY29u
ZmlnCmluZGV4IDMwYmEzNTczNjI2Yy4uNjM4NzBmZGZlOGNlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L21kL0tjb25maWcKKysrIGIvZHJpdmVycy9tZC9LY29uZmlnCkBAIC01MzAsMTEgKzUzMCwyMiBA
QCBjb25maWcgRE1fVkVSSVRZX1ZFUklGWV9ST09USEFTSF9TSUcKIAlib29sICJWZXJpdHkgZGF0
YSBkZXZpY2Ugcm9vdCBoYXNoIHNpZ25hdHVyZSB2ZXJpZmljYXRpb24gc3VwcG9ydCIKIAlkZXBl
bmRzIG9uIERNX1ZFUklUWQogCXNlbGVjdCBTWVNURU1fREFUQV9WRVJJRklDQVRJT04KLQkgIGhl
bHAKKwktLS1oZWxwLS0tCiAJICBBZGQgYWJpbGl0eSBmb3IgZG0tdmVyaXR5IGRldmljZSB0byBi
ZSB2YWxpZGF0ZWQgaWYgdGhlCiAJICBwcmUtZ2VuZXJhdGVkIHRyZWUgb2YgY3J5cHRvZ3JhcGhp
YyBjaGVja3N1bXMgcGFzc2VkIGhhcyBhIHBrY3MjNwogCSAgc2lnbmF0dXJlIGZpbGUgdGhhdCBj
YW4gdmFsaWRhdGUgdGhlIHJvb3RoYXNoIG9mIHRoZSB0cmVlLgogCisJICBCeSBkZWZhdWx0LCBy
ZWx5IG9uIHRoZSBidWlsdGluIHRydXN0ZWQga2V5cmluZy4KKworCSAgSWYgdW5zdXJlLCBzYXkg
Ti4KKworY29uZmlnIERNX1ZFUklUWV9WRVJJRllfUk9PVEhBU0hfU0lHX1NFQ09OREFSWV9LRVlS
SU5HCisJYm9vbCAiVmVyaXR5IGRhdGEgZGV2aWNlIHJvb3QgaGFzaCBzaWduYXR1cmUgdmVyaWZp
Y2F0aW9uIHdpdGggc2Vjb25kYXJ5IGtleXJpbmciCisJZGVwZW5kcyBvbiBETV9WRVJJVFlfVkVS
SUZZX1JPT1RIQVNIX1NJRworCWRlcGVuZHMgb24gU0VDT05EQVJZX1RSVVNURURfS0VZUklORwor
CS0tLWhlbHAtLS0KKwkgIFJlbHkgb24gdGhlIHNlY29uZGFyeSB0cnVzdGVkIGtleXJpbmcgdG8g
dmVyaWZ5IGRtLXZlcml0eSBzaWduYXR1cmVzLgorCiAJICBJZiB1bnN1cmUsIHNheSBOLgogCiBj
b25maWcgRE1fVkVSSVRZX0ZFQwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS12ZXJpdHktdmVy
aWZ5LXNpZy5jIGIvZHJpdmVycy9tZC9kbS12ZXJpdHktdmVyaWZ5LXNpZy5jCmluZGV4IDYxNGU0
M2RiOTNhYS4uMjkzODVkYzQ3MGQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL21kL2RtLXZlcml0eS12
ZXJpZnktc2lnLmMKKysrIGIvZHJpdmVycy9tZC9kbS12ZXJpdHktdmVyaWZ5LXNpZy5jCkBAIC0x
MTksOCArMTE5LDEzIEBAIGludCB2ZXJpdHlfdmVyaWZ5X3Jvb3RfaGFzaChjb25zdCB2b2lkICpy
b290X2hhc2gsIHNpemVfdCByb290X2hhc2hfbGVuLAogCX0KIAogCXJldCA9IHZlcmlmeV9wa2Nz
N19zaWduYXR1cmUocm9vdF9oYXNoLCByb290X2hhc2hfbGVuLCBzaWdfZGF0YSwKLQkJCQlzaWdf
bGVuLCBOVUxMLCBWRVJJRllJTkdfVU5TUEVDSUZJRURfU0lHTkFUVVJFLAotCQkJCU5VTEwsIE5V
TEwpOworCQkJCXNpZ19sZW4sCisjaWZkZWYgQ09ORklHX0RNX1ZFUklUWV9WRVJJRllfUk9PVEhB
U0hfU0lHX1NFQ09OREFSWV9LRVlSSU5HCisJCQkJVkVSSUZZX1VTRV9TRUNPTkRBUllfS0VZUklO
RywKKyNlbHNlCisJCQkJTlVMTCwKKyNlbmRpZgorCQkJCVZFUklGWUlOR19VTlNQRUNJRklFRF9T
SUdOQVRVUkUsIE5VTEwsIE5VTEwpOwogCiAJcmV0dXJuIHJldDsKIH0KLS0gCjIuMjguMAoKCi0t
CmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

