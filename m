Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE45503E5
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:44:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C5EA83F4C;
	Mon, 24 Jun 2019 07:44:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F52D5D9C8;
	Mon, 24 Jun 2019 07:44:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C39DB206D6;
	Mon, 24 Jun 2019 07:43:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5LD7qXT014241 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 09:07:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC18019CB1; Fri, 21 Jun 2019 13:07:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E586118AAB
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:50 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83109307D854
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:31 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k18so5881432ljc.11
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2vhySjd6HyAQGz86wftxAId7gw5oA1TV6yT5lbqXCs8=;
	b=d3qDl7gtl1j+Hk3gb4K9KzB8LgwmlfJO9/Yo2ozFsDzcLkQTT7WxQR8Xj2jQC6naSF
	1d5MH4Hg/i/lDsXxqSx1YKJCpvMaAYROYH+kzVZGWYebgZj+2M7XyZwqiyv6R8pMQijt
	QekloHa3XLx2rYBXWeh0hYlfYHO5RtIHnNrPiaHKmAeHsIJgszBNpLpg2c9pc3h0pucO
	jKelgmr4Hzo2RjY35WGuQwDh5TCTVbTZdWWx5PdBA+O2x8WkagZji9/C2bRtzvl4yKRK
	mUI21721hUJvD7/oFR2F/14ymv0qkzuNyn7SsvGbT8OqoY6IitKrsaFZRSQMDusYuH2Q
	/XPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2vhySjd6HyAQGz86wftxAId7gw5oA1TV6yT5lbqXCs8=;
	b=t20biouE0GkFYJVRwqElwEVJvFXwZtLRlEzedcBCVaJcjf42EbHx0hW6kzuzkiZ0ug
	9ecHS2O3AcXPW4qLEP5Jgl5iq3WuT72JNNuTfCTzVs3znvg59OaKCmgMwamB1+COtU1c
	RtoySlX69Srzu5wmNxLR3z2fZn3i4vT5n2lgADVL3qxamnUyerWh1q/rRjsW+1wpifDU
	8LDp79hoZj5liLshdsE2t20B0UBD+RZXxnHYqV8mNDv/rMRlFQMYU8fazBhW+XHTB0AZ
	EMnacEWp5TkrEi/SAlOF3jFmOZt6+AKYWXBqKkWvjw4ZYzNhmInpFvn7F46sstGIxk4/
	VlZg==
X-Gm-Message-State: APjAAAUelUlRgOnQDgzzSJf0xU+Z4IZJtGclUN18liK60FaLEb5ARpWd
	ks8sfjS6ly/Vgzgn1IR+1OI7MHL9QvI=
X-Google-Smtp-Source: APXvYqyaj5zE2Q4iZD1SSrYtvHM9/oy8VgGciJ2+N1JfUErT2t/do01rXTFk51qdeIQwjDJN9L3VMA==
X-Received: by 2002:a2e:650a:: with SMTP id z10mr32642486ljb.28.1561122449940; 
	Fri, 21 Jun 2019 06:07:29 -0700 (PDT)
Received: from skyninja.webspeed.dk (2-111-91-225-cable.dk.customer.tdc.net.
	[2.111.91.225])
	by smtp.gmail.com with ESMTPSA id r2sm387100lfi.51.2019.06.21.06.07.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 06:07:29 -0700 (PDT)
From: =?UTF-8?q?Matias=20Bj=C3=B8rling?= <mb@lightnvm.io>
To: axboe@fb.com, hch@lst.de, damien.lemoal@wdc.com,
	chaitanya.kulkarni@wdc.com, dmitry.fomichev@wdc.com,
	ajay.joshi@wdc.com, aravind.ramesh@wdc.com, martin.petersen@oracle.com, 
	James.Bottomley@HansenPartnership.com, agk@redhat.com, snitzer@redhat.com
Date: Fri, 21 Jun 2019 15:07:08 +0200
Message-Id: <20190621130711.21986-2-mb@lightnvm.io>
In-Reply-To: <20190621130711.21986-1-mb@lightnvm.io>
References: <20190621130711.21986-1-mb@lightnvm.io>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 21 Jun 2019 13:07:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 21 Jun 2019 13:07:32 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: 0.191  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.208.196 mail-lj1-f196.google.com
	209.85.208.196 mail-lj1-f196.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 24 Jun 2019 03:43:21 -0400
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	=?UTF-8?q?Matias=20Bj=C3=B8rling?= <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 1/4] block: add zone open,
	close and finish support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 24 Jun 2019 07:44:02 +0000 (UTC)

RnJvbTogQWpheSBKb3NoaSA8YWpheS5qb3NoaUB3ZGMuY29tPgoKWm9uZWQgYmxvY2sgZGV2aWNl
cyBhbGxvd3Mgb25lIHRvIGNvbnRyb2wgem9uZSB0cmFuc2l0aW9ucyBieSB1c2luZwpleHBsaWNp
dCBjb21tYW5kcy4gVGhlIGF2YWlsYWJsZSB0cmFuc2l0aW9ucyBhcmU6CgogICogT3BlbiB6b25l
OiBUcmFuc2l0aW9uIGEgem9uZSB0byBvcGVuIHN0YXRlLgogICogQ2xvc2Ugem9uZTogVHJhbnNp
dGlvbiBhIHpvbmUgdG8gY2xvc2VkIHN0YXRlLgogICogRmluaXNoIHpvbmU6IFRyYW5zaXRpb24g
YSB6b25lIHRvIGZ1bGwgc3RhdGUuCgpBbGxvdyBrZXJuZWwgdG8gaXNzdWUgdGhlc2UgdHJhbnNp
dGlvbnMgYnkgaW50cm9kdWNpbmcKYmxrZGV2X3pvbmVzX21nbXRfb3AoKSBhbmQgYWRkIHRocmVl
IG5ldyByZXF1ZXN0IG9wY29kZXM6CgogICogUkVRX0lPX1pPTkVfT1BFTiwgUkVRX0lPX1pPTkVf
Q0xPU0UsIGFuZCBSRVFfT1BfWk9ORV9GSU5JU0gKCkFsbG93IHVzZXItc3BhY2UgdG8gaXNzdWUg
dGhlIHRyYW5zaXRpb25zIHRocm91Z2ggdGhlIGZvbGxvd2luZyBpb2N0bHM6CgogICogQkxLT1BF
TlpPTkUsIEJMS0NMT1NFWk9ORSwgYW5kIEJMS0ZJTklTSFpPTkUuCgpTaWduZWQtb2ZmLWJ5OiBB
amF5IEpvc2hpIDxhamF5Lmpvc2hpQHdkYy5jb20+ClNpZ25lZC1vZmYtYnk6IEFyYXZpbmQgUmFt
ZXNoIDxhcmF2aW5kLnJhbWVzaEB3ZGMuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXRpYXMgQmrDuHJs
aW5nIDxtYXRpYXMuYmpvcmxpbmdAd2RjLmNvbT4KLS0tCiBibG9jay9ibGstY29yZS5jICAgICAg
ICAgICAgICB8ICAzICsrCiBibG9jay9ibGstem9uZWQuYyAgICAgICAgICAgICB8IDUxICsrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0KIGJsb2NrL2lvY3RsLmMgICAgICAgICAgICAgICAg
IHwgIDUgKystCiBpbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oICAgICB8IDI3ICsrKysrKysrKysr
KysrKy0tCiBpbmNsdWRlL2xpbnV4L2Jsa2Rldi5oICAgICAgICB8IDU3ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvYmxrem9uZWQuaCB8IDE3
ICsrKysrKysrKy0tCiA2IGZpbGVzIGNoYW5nZWQsIDEzMyBpbnNlcnRpb25zKCspLCAyNyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ibG9jay9ibGstY29yZS5jIGIvYmxvY2svYmxrLWNvcmUu
YwppbmRleCA4MzQwZjY5NjcwZDguLmMwZjBkYmFkNTQ4ZCAxMDA2NDQKLS0tIGEvYmxvY2svYmxr
LWNvcmUuYworKysgYi9ibG9jay9ibGstY29yZS5jCkBAIC04OTcsNiArODk3LDkgQEAgZ2VuZXJp
Y19tYWtlX3JlcXVlc3RfY2hlY2tzKHN0cnVjdCBiaW8gKmJpbykKIAkJCWdvdG8gbm90X3N1cHBv
cnRlZDsKIAkJYnJlYWs7CiAJY2FzZSBSRVFfT1BfWk9ORV9SRVNFVDoKKwljYXNlIFJFUV9PUF9a
T05FX09QRU46CisJY2FzZSBSRVFfT1BfWk9ORV9DTE9TRToKKwljYXNlIFJFUV9PUF9aT05FX0ZJ
TklTSDoKIAkJaWYgKCFibGtfcXVldWVfaXNfem9uZWQocSkpCiAJCQlnb3RvIG5vdF9zdXBwb3J0
ZWQ7CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvYmxvY2svYmxrLXpvbmVkLmMgYi9ibG9jay9ibGst
em9uZWQuYwppbmRleCBhZTdlOTFiZDA2MTguLmQwYzkzMzU5M2I5MyAxMDA2NDQKLS0tIGEvYmxv
Y2svYmxrLXpvbmVkLmMKKysrIGIvYmxvY2svYmxrLXpvbmVkLmMKQEAgLTIwMSwyMCArMjAxLDIy
IEBAIGludCBibGtkZXZfcmVwb3J0X3pvbmVzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIHNl
Y3Rvcl90IHNlY3RvciwKIEVYUE9SVF9TWU1CT0xfR1BMKGJsa2Rldl9yZXBvcnRfem9uZXMpOwog
CiAvKioKLSAqIGJsa2Rldl9yZXNldF96b25lcyAtIFJlc2V0IHpvbmVzIHdyaXRlIHBvaW50ZXIK
KyAqIGJsa2Rldl96b25lc19tZ210X29wIC0gUGVyZm9ybSB0aGUgc3BlY2lmaWVkIG9wZXJhdGlv
biBvbiB0aGUgem9uZShzKQogICogQGJkZXY6CVRhcmdldCBibG9jayBkZXZpY2UKLSAqIEBzZWN0
b3I6CVN0YXJ0IHNlY3RvciBvZiB0aGUgZmlyc3Qgem9uZSB0byByZXNldAotICogQG5yX3NlY3Rv
cnM6CU51bWJlciBvZiBzZWN0b3JzLCBhdCBsZWFzdCB0aGUgbGVuZ3RoIG9mIG9uZSB6b25lCisg
KiBAb3A6CQlPcGVyYXRpb24gdG8gYmUgcGVyZm9ybWVkIG9uIHRoZSB6b25lKHMpCisgKiBAc2Vj
dG9yOglTdGFydCBzZWN0b3Igb2YgdGhlIGZpcnN0IHpvbmUgdG8gb3BlcmF0ZSBvbgorICogQG5y
X3NlY3RvcnM6CU51bWJlciBvZiBzZWN0b3JzLCBhdCBsZWFzdCB0aGUgbGVuZ3RoIG9mIG9uZSB6
b25lIGFuZAorICogICAgICAgICAgICAgIG11c3QgYmUgem9uZSBzaXplIGFsaWduZWQuCiAgKiBA
Z2ZwX21hc2s6CU1lbW9yeSBhbGxvY2F0aW9uIGZsYWdzIChmb3IgYmlvX2FsbG9jKQogICoKICAq
IERlc2NyaXB0aW9uOgotICogICAgUmVzZXQgdGhlIHdyaXRlIHBvaW50ZXIgb2YgdGhlIHpvbmVz
IGNvbnRhaW5lZCBpbiB0aGUgcmFuZ2UKKyAqICAgIFBlcmZvcm0gdGhlIHNwZWNpZmllZCBvcGVy
YXRpb24gY29udGFpbmVkIGluIHRoZSByYW5nZQogICogICAgQHNlY3Rvci4uQHNlY3RvcitAbnJf
c2VjdG9ycy4gU3BlY2lmeWluZyB0aGUgZW50aXJlIGRpc2sgc2VjdG9yIHJhbmdlCiAgKiAgICBp
cyB2YWxpZCwgYnV0IHRoZSBzcGVjaWZpZWQgcmFuZ2Ugc2hvdWxkIG5vdCBjb250YWluIGNvbnZl
bnRpb25hbCB6b25lcy4KICAqLwotaW50IGJsa2Rldl9yZXNldF96b25lcyhzdHJ1Y3QgYmxvY2tf
ZGV2aWNlICpiZGV2LAotCQkgICAgICAgc2VjdG9yX3Qgc2VjdG9yLCBzZWN0b3JfdCBucl9zZWN0
b3JzLAotCQkgICAgICAgZ2ZwX3QgZ2ZwX21hc2spCitpbnQgYmxrZGV2X3pvbmVzX21nbXRfb3Ao
c3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgZW51bSByZXFfb3BmIG9wLAorCQkJIHNlY3Rvcl90
IHNlY3Rvciwgc2VjdG9yX3QgbnJfc2VjdG9ycywKKwkJCSBnZnBfdCBnZnBfbWFzaykKIHsKIAlz
dHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSA9IGJkZXZfZ2V0X3F1ZXVlKGJkZXYpOwogCXNlY3Rvcl90
IHpvbmVfc2VjdG9yczsKQEAgLTIyNiw2ICsyMjgsOSBAQCBpbnQgYmxrZGV2X3Jlc2V0X3pvbmVz
KHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsCiAJaWYgKCFibGtfcXVldWVfaXNfem9uZWQocSkp
CiAJCXJldHVybiAtRU9QTk9UU1VQUDsKIAorCWlmICghb3BfaXNfem9uZV9tZ210X29wKG9wKSkK
KwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJaWYgKGJkZXZfcmVhZF9vbmx5KGJkZXYpKQogCQly
ZXR1cm4gLUVQRVJNOwogCkBAIC0yNDgsNyArMjUzLDcgQEAgaW50IGJsa2Rldl9yZXNldF96b25l
cyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LAogCQliaW8gPSBibGtfbmV4dF9iaW8oYmlvLCAw
LCBnZnBfbWFzayk7CiAJCWJpby0+YmlfaXRlci5iaV9zZWN0b3IgPSBzZWN0b3I7CiAJCWJpb19z
ZXRfZGV2KGJpbywgYmRldik7Ci0JCWJpb19zZXRfb3BfYXR0cnMoYmlvLCBSRVFfT1BfWk9ORV9S
RVNFVCwgMCk7CisJCWJpb19zZXRfb3BfYXR0cnMoYmlvLCBvcCwgMCk7CiAKIAkJc2VjdG9yICs9
IHpvbmVfc2VjdG9yczsKIApAQCAtMjY0LDcgKzI2OSw3IEBAIGludCBibGtkZXZfcmVzZXRfem9u
ZXMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwKIAogCXJldHVybiByZXQ7CiB9Ci1FWFBPUlRf
U1lNQk9MX0dQTChibGtkZXZfcmVzZXRfem9uZXMpOworRVhQT1JUX1NZTUJPTF9HUEwoYmxrZGV2
X3pvbmVzX21nbXRfb3ApOwogCiAvKgogICogQkxLUkVQT1JUWk9ORSBpb2N0bCBwcm9jZXNzaW5n
LgpAQCAtMzI5LDE1ICszMzQsMTYgQEAgaW50IGJsa2Rldl9yZXBvcnRfem9uZXNfaW9jdGwoc3Ry
dWN0IGJsb2NrX2RldmljZSAqYmRldiwgZm1vZGVfdCBtb2RlLAogfQogCiAvKgotICogQkxLUkVT
RVRaT05FIGlvY3RsIHByb2Nlc3NpbmcuCisgKiBab25lIG9wZXJhdGlvbiAob3BlbiwgY2xvc2Us
IGZpbmlzaCBvciByZXNldCkgaW9jdGwgcHJvY2Vzc2luZy4KICAqIENhbGxlZCBmcm9tIGJsa2Rl
dl9pb2N0bC4KICAqLwotaW50IGJsa2Rldl9yZXNldF96b25lc19pb2N0bChzdHJ1Y3QgYmxvY2tf
ZGV2aWNlICpiZGV2LCBmbW9kZV90IG1vZGUsCi0JCQkgICAgIHVuc2lnbmVkIGludCBjbWQsIHVu
c2lnbmVkIGxvbmcgYXJnKQoraW50IGJsa2Rldl96b25lc19tZ210X29wX2lvY3RsKHN0cnVjdCBi
bG9ja19kZXZpY2UgKmJkZXYsIGZtb2RlX3QgbW9kZSwKKwkJCQl1bnNpZ25lZCBpbnQgY21kLCB1
bnNpZ25lZCBsb25nIGFyZykKIHsKIAl2b2lkIF9fdXNlciAqYXJncCA9ICh2b2lkIF9fdXNlciAq
KWFyZzsKIAlzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcTsKIAlzdHJ1Y3QgYmxrX3pvbmVfcmFuZ2Ug
enJhbmdlOworCWVudW0gcmVxX29wZiBvcDsKIAogCWlmICghYXJncCkKIAkJcmV0dXJuIC1FSU5W
QUw7CkBAIC0zNTgsOCArMzY0LDI1IEBAIGludCBibGtkZXZfcmVzZXRfem9uZXNfaW9jdGwoc3Ry
dWN0IGJsb2NrX2RldmljZSAqYmRldiwgZm1vZGVfdCBtb2RlLAogCWlmIChjb3B5X2Zyb21fdXNl
cigmenJhbmdlLCBhcmdwLCBzaXplb2Yoc3RydWN0IGJsa196b25lX3JhbmdlKSkpCiAJCXJldHVy
biAtRUZBVUxUOwogCi0JcmV0dXJuIGJsa2Rldl9yZXNldF96b25lcyhiZGV2LCB6cmFuZ2Uuc2Vj
dG9yLCB6cmFuZ2UubnJfc2VjdG9ycywKLQkJCQkgIEdGUF9LRVJORUwpOworCXN3aXRjaCAoY21k
KSB7CisJY2FzZSBCTEtSRVNFVFpPTkU6CisJCW9wID0gUkVRX09QX1pPTkVfUkVTRVQ7CisJCWJy
ZWFrOworCWNhc2UgQkxLT1BFTlpPTkU6CisJCW9wID0gUkVRX09QX1pPTkVfT1BFTjsKKwkJYnJl
YWs7CisJY2FzZSBCTEtDTE9TRVpPTkU6CisJCW9wID0gUkVRX09QX1pPTkVfQ0xPU0U7CisJCWJy
ZWFrOworCWNhc2UgQkxLRklOSVNIWk9ORToKKwkJb3AgPSBSRVFfT1BfWk9ORV9GSU5JU0g7CisJ
CWJyZWFrOworCWRlZmF1bHQ6CisJCXJldHVybiAtRU5PVFRZOworCX0KKworCXJldHVybiBibGtk
ZXZfem9uZXNfbWdtdF9vcChiZGV2LCBvcCwgenJhbmdlLnNlY3RvciwgenJhbmdlLm5yX3NlY3Rv
cnMsCisJCQkJICAgIEdGUF9LRVJORUwpOwogfQogCiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxv
bmcgKmJsa19hbGxvY196b25lX2JpdG1hcChpbnQgbm9kZSwKZGlmZiAtLWdpdCBhL2Jsb2NrL2lv
Y3RsLmMgYi9ibG9jay9pb2N0bC5jCmluZGV4IDE1YTBlYjgwYWRhOS4uZGY3ZmU1NGRiMTU4IDEw
MDY0NAotLS0gYS9ibG9jay9pb2N0bC5jCisrKyBiL2Jsb2NrL2lvY3RsLmMKQEAgLTUzMiw3ICs1
MzIsMTAgQEAgaW50IGJsa2Rldl9pb2N0bChzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBmbW9k
ZV90IG1vZGUsIHVuc2lnbmVkIGNtZCwKIAljYXNlIEJMS1JFUE9SVFpPTkU6CiAJCXJldHVybiBi
bGtkZXZfcmVwb3J0X3pvbmVzX2lvY3RsKGJkZXYsIG1vZGUsIGNtZCwgYXJnKTsKIAljYXNlIEJM
S1JFU0VUWk9ORToKLQkJcmV0dXJuIGJsa2Rldl9yZXNldF96b25lc19pb2N0bChiZGV2LCBtb2Rl
LCBjbWQsIGFyZyk7CisJY2FzZSBCTEtPUEVOWk9ORToKKwljYXNlIEJMS0NMT1NFWk9ORToKKwlj
YXNlIEJMS0ZJTklTSFpPTkU6CisJCXJldHVybiBibGtkZXZfem9uZXNfbWdtdF9vcF9pb2N0bChi
ZGV2LCBtb2RlLCBjbWQsIGFyZyk7CiAJY2FzZSBCTEtHRVRaT05FU1o6CiAJCXJldHVybiBwdXRf
dWludChhcmcsIGJkZXZfem9uZV9zZWN0b3JzKGJkZXYpKTsKIAljYXNlIEJMS0dFVE5SWk9ORVM6
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oIGIvaW5jbHVkZS9saW51eC9i
bGtfdHlwZXMuaAppbmRleCA5NTIwMmY4MDY3NmMuLjA2N2VmOTI0MjI3NSAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9saW51eC9ibGtfdHlwZXMuaAorKysgYi9pbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5o
CkBAIC0yODQsMTMgKzI4NCwyMCBAQCBlbnVtIHJlcV9vcGYgewogCVJFUV9PUF9ESVNDQVJECQk9
IDMsCiAJLyogc2VjdXJlbHkgZXJhc2Ugc2VjdG9ycyAqLwogCVJFUV9PUF9TRUNVUkVfRVJBU0UJ
PSA1LAotCS8qIHJlc2V0IGEgem9uZSB3cml0ZSBwb2ludGVyICovCi0JUkVRX09QX1pPTkVfUkVT
RVQJPSA2LAogCS8qIHdyaXRlIHRoZSBzYW1lIHNlY3RvciBtYW55IHRpbWVzICovCiAJUkVRX09Q
X1dSSVRFX1NBTUUJPSA3LAogCS8qIHdyaXRlIHRoZSB6ZXJvIGZpbGxlZCBzZWN0b3IgbWFueSB0
aW1lcyAqLwogCVJFUV9PUF9XUklURV9aRVJPRVMJPSA5LAogCisJLyogcmVzZXQgYSB6b25lIHdy
aXRlIHBvaW50ZXIgKi8KKwlSRVFfT1BfWk9ORV9SRVNFVAk9IDE2LAorCS8qIE9wZW4gem9uZShz
KSAqLworCVJFUV9PUF9aT05FX09QRU4JPSAxNywKKwkvKiBDbG9zZSB6b25lKHMpICovCisJUkVR
X09QX1pPTkVfQ0xPU0UJPSAxOCwKKwkvKiBGaW5pc2ggem9uZShzKSAqLworCVJFUV9PUF9aT05F
X0ZJTklTSAk9IDE5LAorCiAJLyogU0NTSSBwYXNzdGhyb3VnaCB1c2luZyBzdHJ1Y3Qgc2NzaV9y
ZXF1ZXN0ICovCiAJUkVRX09QX1NDU0lfSU4JCT0gMzIsCiAJUkVRX09QX1NDU0lfT1VUCQk9IDMz
LApAQCAtMzc1LDYgKzM4MiwyMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYmlvX3NldF9vcF9hdHRy
cyhzdHJ1Y3QgYmlvICpiaW8sIHVuc2lnbmVkIG9wLAogCWJpby0+Ymlfb3BmID0gb3AgfCBvcF9m
bGFnczsKIH0KIAorLyoKKyAqIENoZWNrIGlmIHRoZSBvcCBpcyB6b25lZCBvcGVyYXRpb24uCisg
Ki8KK3N0YXRpYyBpbmxpbmUgYm9vbCBvcF9pc196b25lX21nbXRfb3AoZW51bSByZXFfb3BmIG9w
KQoreworCXN3aXRjaCAob3ApIHsKKwljYXNlIFJFUV9PUF9aT05FX1JFU0VUOgorCWNhc2UgUkVR
X09QX1pPTkVfT1BFTjoKKwljYXNlIFJFUV9PUF9aT05FX0NMT1NFOgorCWNhc2UgUkVRX09QX1pP
TkVfRklOSVNIOgorCQlyZXR1cm4gdHJ1ZTsKKwlkZWZhdWx0OgorCQlyZXR1cm4gZmFsc2U7CisJ
fQorfQorCiBzdGF0aWMgaW5saW5lIGJvb2wgb3BfaXNfd3JpdGUodW5zaWduZWQgaW50IG9wKQog
ewogCXJldHVybiAob3AgJiAxKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYmxrZGV2Lmgg
Yi9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oCmluZGV4IDU5MjY2OWJjYzUzNi4uOTQzMDg0ZjlkYzlj
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oCisrKyBiL2luY2x1ZGUvbGludXgv
YmxrZGV2LmgKQEAgLTM0OCwxNCArMzQ4LDE1IEBAIGV4dGVybiB1bnNpZ25lZCBpbnQgYmxrZGV2
X25yX3pvbmVzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYpOwogZXh0ZXJuIGludCBibGtkZXZf
cmVwb3J0X3pvbmVzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsCiAJCQkgICAgICAgc2VjdG9y
X3Qgc2VjdG9yLCBzdHJ1Y3QgYmxrX3pvbmUgKnpvbmVzLAogCQkJICAgICAgIHVuc2lnbmVkIGlu
dCAqbnJfem9uZXMsIGdmcF90IGdmcF9tYXNrKTsKLWV4dGVybiBpbnQgYmxrZGV2X3Jlc2V0X3pv
bmVzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIHNlY3Rvcl90IHNlY3RvcnMsCi0JCQkgICAg
ICBzZWN0b3JfdCBucl9zZWN0b3JzLCBnZnBfdCBnZnBfbWFzayk7CiBleHRlcm4gaW50IGJsa19y
ZXZhbGlkYXRlX2Rpc2tfem9uZXMoc3RydWN0IGdlbmRpc2sgKmRpc2spOwogCiBleHRlcm4gaW50
IGJsa2Rldl9yZXBvcnRfem9uZXNfaW9jdGwoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgZm1v
ZGVfdCBtb2RlLAogCQkJCSAgICAgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcp
OwotZXh0ZXJuIGludCBibGtkZXZfcmVzZXRfem9uZXNfaW9jdGwoc3RydWN0IGJsb2NrX2Rldmlj
ZSAqYmRldiwgZm1vZGVfdCBtb2RlLAotCQkJCSAgICB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25l
ZCBsb25nIGFyZyk7CitleHRlcm4gaW50IGJsa2Rldl96b25lc19tZ210X29wX2lvY3RsKHN0cnVj
dCBibG9ja19kZXZpY2UgKmJkZXYsIGZtb2RlX3QgbW9kZSwKKwkJCQkJdW5zaWduZWQgaW50IGNt
ZCwgdW5zaWduZWQgbG9uZyBhcmcpOworZXh0ZXJuIGludCBibGtkZXZfem9uZXNfbWdtdF9vcChz
dHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCBlbnVtIHJlcV9vcGYgb3AsCisJCQkJc2VjdG9yX3Qg
c2VjdG9yLCBzZWN0b3JfdCBucl9zZWN0b3JzLAorCQkJCWdmcF90IGdmcF9tYXNrKTsKIAogI2Vs
c2UgLyogQ09ORklHX0JMS19ERVZfWk9ORUQgKi8KIApAQCAtMzc2LDE1ICszNzcsNTcgQEAgc3Rh
dGljIGlubGluZSBpbnQgYmxrZGV2X3JlcG9ydF96b25lc19pb2N0bChzdHJ1Y3QgYmxvY2tfZGV2
aWNlICpiZGV2LAogCXJldHVybiAtRU5PVFRZOwogfQogCi1zdGF0aWMgaW5saW5lIGludCBibGtk
ZXZfcmVzZXRfem9uZXNfaW9jdGwoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwKLQkJCQkJICAg
Zm1vZGVfdCBtb2RlLCB1bnNpZ25lZCBpbnQgY21kLAotCQkJCQkgICB1bnNpZ25lZCBsb25nIGFy
ZykKK3N0YXRpYyBpbmxpbmUgaW50IGJsa2Rldl96b25lc19tZ210X29wX2lvY3RsKHN0cnVjdCBi
bG9ja19kZXZpY2UgKmJkZXYsCisJCQkJCSAgICAgZm1vZGVfdCBtb2RlLCB1bnNpZ25lZCBpbnQg
Y21kLAorCQkJCQkgICAgIHVuc2lnbmVkIGxvbmcgYXJnKQoreworCXJldHVybiAtRU5PVFRZOwor
fQorCitzdGF0aWMgaW5saW5lIGludCBibGtkZXZfem9uZXNfbWdtdF9vcChzdHJ1Y3QgYmxvY2tf
ZGV2aWNlICpiZGV2LAorCQkJCSAgICAgICBlbnVtIHJlcV9vcGYgb3AsCisJCQkJICAgICAgIHNl
Y3Rvcl90IHNlY3Rvciwgc2VjdG9yX3QgbnJfc2VjdG9ycywKKwkJCQkgICAgICAgZ2ZwX3QgZ2Zw
X21hc2spCiB7CiAJcmV0dXJuIC1FTk9UVFk7CiB9CiAKICNlbmRpZiAvKiBDT05GSUdfQkxLX0RF
Vl9aT05FRCAqLwogCitzdGF0aWMgaW5saW5lIGludCBibGtkZXZfcmVzZXRfem9uZXMoc3RydWN0
IGJsb2NrX2RldmljZSAqYmRldiwKKwkJCQkgICAgIHNlY3Rvcl90IHNlY3Rvciwgc2VjdG9yX3Qg
bnJfc2VjdG9ycywKKwkJCQkgICAgIGdmcF90IGdmcF9tYXNrKQoreworCXJldHVybiBibGtkZXZf
em9uZXNfbWdtdF9vcChiZGV2LCBSRVFfT1BfWk9ORV9SRVNFVCwKKwkJCQkgICAgc2VjdG9yLCBu
cl9zZWN0b3JzLCBnZnBfbWFzayk7Cit9CisKK3N0YXRpYyBpbmxpbmUgaW50IGJsa2Rldl9vcGVu
X3pvbmVzKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsCisJCQkJICAgIHNlY3Rvcl90IHNlY3Rv
ciwgc2VjdG9yX3QgbnJfc2VjdG9ycywKKwkJCQkgICAgZ2ZwX3QgZ2ZwX21hc2spCit7CisJcmV0
dXJuIGJsa2Rldl96b25lc19tZ210X29wKGJkZXYsIFJFUV9PUF9aT05FX09QRU4sCisJCQkJICAg
IHNlY3RvciwgbnJfc2VjdG9ycywgZ2ZwX21hc2spOworfQorCitzdGF0aWMgaW5saW5lIGludCBi
bGtkZXZfY2xvc2Vfem9uZXMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwKKwkJCQkgICAgIHNl
Y3Rvcl90IHNlY3Rvciwgc2VjdG9yX3QgbnJfc2VjdG9ycywKKwkJCQkgICAgIGdmcF90IGdmcF9t
YXNrKQoreworCXJldHVybiBibGtkZXZfem9uZXNfbWdtdF9vcChiZGV2LCBSRVFfT1BfWk9ORV9D
TE9TRSwKKwkJCQkgICAgc2VjdG9yLCBucl9zZWN0b3JzLAorCQkJCSAgICBnZnBfbWFzayk7Cit9
CisKK3N0YXRpYyBpbmxpbmUgaW50IGJsa2Rldl9maW5pc2hfem9uZXMoc3RydWN0IGJsb2NrX2Rl
dmljZSAqYmRldiwKKwkJCQkgICAgICBzZWN0b3JfdCBzZWN0b3IsIHNlY3Rvcl90IG5yX3NlY3Rv
cnMsCisJCQkJICAgICAgZ2ZwX3QgZ2ZwX21hc2spCit7CisJcmV0dXJuIGJsa2Rldl96b25lc19t
Z210X29wKGJkZXYsIFJFUV9PUF9aT05FX0ZJTklTSCwKKwkJCQkgICAgc2VjdG9yLCBucl9zZWN0
b3JzLAorCQkJCSAgICBnZnBfbWFzayk7Cit9CisKIHN0cnVjdCByZXF1ZXN0X3F1ZXVlIHsKIAkv
KgogCSAqIFRvZ2V0aGVyIHdpdGggcXVldWVfaGVhZCBmb3IgY2FjaGVsaW5lIHNoYXJpbmcKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9ibGt6b25lZC5oIGIvaW5jbHVkZS91YXBpL2xp
bnV4L2Jsa3pvbmVkLmgKaW5kZXggNDk4ZWVjODEzNDk0Li43MDFlMDY5MmI4ZDMgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvdWFwaS9saW51eC9ibGt6b25lZC5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51
eC9ibGt6b25lZC5oCkBAIC0xMjAsOSArMTIwLDExIEBAIHN0cnVjdCBibGtfem9uZV9yZXBvcnQg
ewogfTsKIAogLyoqCi0gKiBzdHJ1Y3QgYmxrX3pvbmVfcmFuZ2UgLSBCTEtSRVNFVFpPTkUgaW9j
dGwgcmVxdWVzdAotICogQHNlY3Rvcjogc3RhcnRpbmcgc2VjdG9yIG9mIHRoZSBmaXJzdCB6b25l
IHRvIGlzc3VlIHJlc2V0IHdyaXRlIHBvaW50ZXIKLSAqIEBucl9zZWN0b3JzOiBUb3RhbCBudW1i
ZXIgb2Ygc2VjdG9ycyBvZiAxIG9yIG1vcmUgem9uZXMgdG8gcmVzZXQKKyAqIHN0cnVjdCBibGtf
em9uZV9yYW5nZSAtIEJMS1JFU0VUWk9ORS9CTEtPUEVOWk9ORS8KKyAqCQkJICAgQkxLQ0xPU0Va
T05FL0JMS0ZJTklTSFpPTkUgaW9jdGwKKyAqCQkJICAgcmVxdWVzdAorICogQHNlY3Rvcjogc3Rh
cnRpbmcgc2VjdG9yIG9mIHRoZSBmaXJzdCB6b25lIHRvIG9wZXJhdGUgb24KKyAqIEBucl9zZWN0
b3JzOiBUb3RhbCBudW1iZXIgb2Ygc2VjdG9ycyBvZiBhbGwgem9uZXMgdG8gb3BlcmF0ZSBvbgog
ICovCiBzdHJ1Y3QgYmxrX3pvbmVfcmFuZ2UgewogCV9fdTY0CQlzZWN0b3I7CkBAIC0xMzksMTAg
KzE0MSwxOSBAQCBzdHJ1Y3QgYmxrX3pvbmVfcmFuZ2UgewogICogICAgICAgICAgICAgICAgc2Vj
dG9yIHJhbmdlLiBUaGUgc2VjdG9yIHJhbmdlIG11c3QgYmUgem9uZSBhbGlnbmVkLgogICogQEJM
S0dFVFpPTkVTWjogR2V0IHRoZSBkZXZpY2Ugem9uZSBzaXplIGluIG51bWJlciBvZiA1MTIgQiBz
ZWN0b3JzLgogICogQEJMS0dFVE5SWk9ORVM6IEdldCB0aGUgdG90YWwgbnVtYmVyIG9mIHpvbmVz
IG9mIHRoZSBkZXZpY2UuCisgKiBAQkxLT1BFTlpPTkU6IE9wZW4gdGhlIHpvbmVzIGluIHRoZSBz
cGVjaWZpZWQgc2VjdG9yIHJhbmdlLiBUaGUKKyAqICAgICAgICAgICAgICAgc2VjdG9yIHJhbmdl
IG11c3QgYmUgem9uZSBhbGlnbmVkLgorICogQEJMS0NMT1NFWk9ORTogQ2xvc2UgdGhlIHpvbmVz
IGluIHRoZSBzcGVjaWZpZWQgc2VjdG9yIHJhbmdlLiBUaGUKKyAqICAgICAgICAgICAgICAgIHNl
Y3RvciByYW5nZSBtdXN0IGJlIHpvbmUgYWxpZ25lZC4KKyAqIEBCTEtGSU5JU0haT05FOiBGaW5p
c2ggdGhlIHpvbmVzIGluIHRoZSBzcGVjaWZpZWQgc2VjdG9yIHJhbmdlLiBUaGUKKyAqICAgICAg
ICAgICAgICAgICBzZWN0b3IgcmFuZ2UgbXVzdCBiZSB6b25lIGFsaWduZWQuCiAgKi8KICNkZWZp
bmUgQkxLUkVQT1JUWk9ORQlfSU9XUigweDEyLCAxMzAsIHN0cnVjdCBibGtfem9uZV9yZXBvcnQp
CiAjZGVmaW5lIEJMS1JFU0VUWk9ORQlfSU9XKDB4MTIsIDEzMSwgc3RydWN0IGJsa196b25lX3Jh
bmdlKQogI2RlZmluZSBCTEtHRVRaT05FU1oJX0lPUigweDEyLCAxMzIsIF9fdTMyKQogI2RlZmlu
ZSBCTEtHRVROUlpPTkVTCV9JT1IoMHgxMiwgMTMzLCBfX3UzMikKKyNkZWZpbmUgQkxLT1BFTlpP
TkUJX0lPVygweDEyLCAxMzQsIHN0cnVjdCBibGtfem9uZV9yYW5nZSkKKyNkZWZpbmUgQkxLQ0xP
U0VaT05FCV9JT1coMHgxMiwgMTM1LCBzdHJ1Y3QgYmxrX3pvbmVfcmFuZ2UpCisjZGVmaW5lIEJM
S0ZJTklTSFpPTkUJX0lPVygweDEyLCAxMzYsIHN0cnVjdCBibGtfem9uZV9yYW5nZSkKIAogI2Vu
ZGlmIC8qIF9VQVBJX0JMS1pPTkVEX0ggKi8KLS0gCjIuMTkuMQoKLS0KZG0tZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2RtLWRldmVs
