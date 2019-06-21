Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA87503E4
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:44:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABD693082DD3;
	Mon, 24 Jun 2019 07:44:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81A5E5D9C5;
	Mon, 24 Jun 2019 07:44:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DC701806B1D;
	Mon, 24 Jun 2019 07:43:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5LD7sHV014244 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 09:07:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C6065B68A; Fri, 21 Jun 2019 13:07:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2732D5B689
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:51 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDC1D3086203
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:32 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id m23so5856223lje.12
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=yP4hCZ6yL3D/UZqgqC/Ov+Z6vjll5loZko6056/cetY=;
	b=WiMV9WZtz6n4ISyy7pUtYCnGw26um/pfnCPW0IUhTrj5WLELiUwQzTzG1Ps+Fm34sU
	niM84VraxJjxEYv4lANQu3cYxfRtxumRLPBQhauTyA3CnBL4peWd+iHPQtOun7Vq50zL
	HNHQiBxrBvNYVwNdhOGm90h2gZQDczlnARy2Q53GRYk/CeAka+BWLGtHypDgvFyVfhri
	lTPNVcm6BwJSShquC+A8X9br/R1xmVZkUNVve76ifd960/mo4rMXML0R/zeJGhy+vvhd
	T1yWVku6ySVz5E63YpGfCMcCgCDAfB92y09Sw+3UECBT3fmJSiSVa5pI9at0YCp0c5rI
	Zzlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yP4hCZ6yL3D/UZqgqC/Ov+Z6vjll5loZko6056/cetY=;
	b=q6dnzMIfLUnO3/D7Qd4LX/HcWeQ9DLun2lvbB7ecPYNb7Klk8GhXHDK0kplB4JA/Jj
	m3iivwi1ZIevr8E/Hk/aIR1fbxX/4ypd0TSQ3vn8uRqeZ7PwdL9+F/mVBkaCi7paMdId
	0CxeDr9C2su+2XAM6DxHkyDn0Qhgs0DpCo7xnMvey/hetufyMZlpsSQnNPflWlgOc6dN
	yx8DLO7JLNYujMfMVlglvJ85NsiS6/k8t5T3DUMzNmTk3ez67NBKncQvOuWSxZ7hm30c
	noBrcoEa2GypE3B4czm1NEHBCzs2d/OocfJx6VEAttX5rXcTU3D4McFwshBC06BimoxJ
	XHOA==
X-Gm-Message-State: APjAAAX421qJUvyqayNLduehuMLz7HDvRnDHtP43g5GCequhbZwrcyEl
	/gwyEd/W+J14JwOBV0BV3Ino7g==
X-Google-Smtp-Source: APXvYqz0iDNEIsEABaU1xi7aYwfBGvl2BdjDcs2x8HZgfccJp7p8AirvIqLaeTE1wbjQW06IpIgp+g==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr3609956ljg.197.1561122451127; 
	Fri, 21 Jun 2019 06:07:31 -0700 (PDT)
Received: from skyninja.webspeed.dk (2-111-91-225-cable.dk.customer.tdc.net.
	[2.111.91.225])
	by smtp.gmail.com with ESMTPSA id r2sm387100lfi.51.2019.06.21.06.07.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 06:07:30 -0700 (PDT)
From: =?UTF-8?q?Matias=20Bj=C3=B8rling?= <mb@lightnvm.io>
To: axboe@fb.com, hch@lst.de, damien.lemoal@wdc.com,
	chaitanya.kulkarni@wdc.com, dmitry.fomichev@wdc.com,
	ajay.joshi@wdc.com, aravind.ramesh@wdc.com, martin.petersen@oracle.com, 
	James.Bottomley@HansenPartnership.com, agk@redhat.com, snitzer@redhat.com
Date: Fri, 21 Jun 2019 15:07:09 +0200
Message-Id: <20190621130711.21986-3-mb@lightnvm.io>
In-Reply-To: <20190621130711.21986-1-mb@lightnvm.io>
References: <20190621130711.21986-1-mb@lightnvm.io>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 21 Jun 2019 13:07:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 21 Jun 2019 13:07:33 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 24 Jun 2019 03:43:21 -0400
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	=?UTF-8?q?Matias=20Bj=C3=B8rling?= <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 2/4] null_blk: add zone open, close,
	and finish support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 24 Jun 2019 07:44:01 +0000 (UTC)

RnJvbTogQWpheSBKb3NoaSA8YWpheS5qb3NoaUB3ZGMuY29tPgoKSW1wbGVtZW50IFJFUV9PUF9a
T05FX09QRU4sIFJFUV9PUF9aT05FX0NMT1NFIGFuZCBSRVFfT1BfWk9ORV9GSU5JU0gKc3VwcG9y
dCB0byBhbGxvdyBleHBsaWNpdCBjb250cm9sIG9mIHpvbmUgc3RhdGVzLgoKU2lnbmVkLW9mZi1i
eTogQWpheSBKb3NoaSA8YWpheS5qb3NoaUB3ZGMuY29tPgpTaWduZWQtb2ZmLWJ5OiBNYXRpYXMg
QmrDuHJsaW5nIDxtYXRpYXMuYmpvcmxpbmdAd2RjLmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL251
bGxfYmxrLmggICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2Jsb2NrL251bGxfYmxrX21haW4uYyAg
fCAxMyArKysrKysrKysrLS0tCiBkcml2ZXJzL2Jsb2NrL251bGxfYmxrX3pvbmVkLmMgfCAzMyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIDMgZmlsZXMgY2hhbmdlZCwgNDIgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL251
bGxfYmxrLmggYi9kcml2ZXJzL2Jsb2NrL251bGxfYmxrLmgKaW5kZXggMzRiMjJkNjUyM2JhLi42
MmVmNjVjYjBmM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svbnVsbF9ibGsuaAorKysgYi9k
cml2ZXJzL2Jsb2NrL251bGxfYmxrLmgKQEAgLTkzLDcgKzkzLDcgQEAgaW50IG51bGxfem9uZV9y
ZXBvcnQoc3RydWN0IGdlbmRpc2sgKmRpc2ssIHNlY3Rvcl90IHNlY3RvciwKIAkJICAgICBnZnBf
dCBnZnBfbWFzayk7CiB2b2lkIG51bGxfem9uZV93cml0ZShzdHJ1Y3QgbnVsbGJfY21kICpjbWQs
IHNlY3Rvcl90IHNlY3RvciwKIAkJCXVuc2lnbmVkIGludCBucl9zZWN0b3JzKTsKLXZvaWQgbnVs
bF96b25lX3Jlc2V0KHN0cnVjdCBudWxsYl9jbWQgKmNtZCwgc2VjdG9yX3Qgc2VjdG9yKTsKK3Zv
aWQgbnVsbF96b25lX21nbXRfb3Aoc3RydWN0IG51bGxiX2NtZCAqY21kLCBzZWN0b3JfdCBzZWN0
b3IpOwogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgaW50IG51bGxfem9uZV9pbml0KHN0cnVjdCBudWxs
Yl9kZXZpY2UgKmRldikKIHsKQEAgLTExMSw2ICsxMTEsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
bnVsbF96b25lX3dyaXRlKHN0cnVjdCBudWxsYl9jbWQgKmNtZCwgc2VjdG9yX3Qgc2VjdG9yLAog
CQkJCSAgIHVuc2lnbmVkIGludCBucl9zZWN0b3JzKQogewogfQotc3RhdGljIGlubGluZSB2b2lk
IG51bGxfem9uZV9yZXNldChzdHJ1Y3QgbnVsbGJfY21kICpjbWQsIHNlY3Rvcl90IHNlY3Rvcikg
e30KK3N0YXRpYyBpbmxpbmUgdm9pZCBudWxsX3pvbmVfbWdtdF9vcChzdHJ1Y3QgbnVsbGJfY21k
ICpjbWQsIHNlY3Rvcl90IHNlY3Rvcikge30KICNlbmRpZiAvKiBDT05GSUdfQkxLX0RFVl9aT05F
RCAqLwogI2VuZGlmIC8qIF9fTlVMTF9CTEtfSCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9j
ay9udWxsX2Jsa19tYWluLmMgYi9kcml2ZXJzL2Jsb2NrL251bGxfYmxrX21haW4uYwppbmRleCA0
NDdkNjM1Yzc5YTIuLjUwNThmYjk4MGM5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9udWxs
X2Jsa19tYWluLmMKKysrIGIvZHJpdmVycy9ibG9jay9udWxsX2Jsa19tYWluLmMKQEAgLTEyMDks
MTAgKzEyMDksMTcgQEAgc3RhdGljIGJsa19zdGF0dXNfdCBudWxsX2hhbmRsZV9jbWQoc3RydWN0
IG51bGxiX2NtZCAqY21kKQogCQkJbnJfc2VjdG9ycyA9IGJsa19ycV9zZWN0b3JzKGNtZC0+cnEp
OwogCQl9CiAKLQkJaWYgKG9wID09IFJFUV9PUF9XUklURSkKKwkJc3dpdGNoIChvcCkgeworCQlj
YXNlIFJFUV9PUF9XUklURToKIAkJCW51bGxfem9uZV93cml0ZShjbWQsIHNlY3RvciwgbnJfc2Vj
dG9ycyk7Ci0JCWVsc2UgaWYgKG9wID09IFJFUV9PUF9aT05FX1JFU0VUKQotCQkJbnVsbF96b25l
X3Jlc2V0KGNtZCwgc2VjdG9yKTsKKwkJCWJyZWFrOworCQljYXNlIFJFUV9PUF9aT05FX1JFU0VU
OgorCQljYXNlIFJFUV9PUF9aT05FX09QRU46CisJCWNhc2UgUkVRX09QX1pPTkVfQ0xPU0U6CisJ
CWNhc2UgUkVRX09QX1pPTkVfRklOSVNIOgorCQkJbnVsbF96b25lX21nbXRfb3AoY21kLCBzZWN0
b3IpOworCQkJYnJlYWs7CisJCX0KIAl9CiBvdXQ6CiAJLyogQ29tcGxldGUgSU8gYnkgaW5saW5l
LCBzb2Z0aXJxIG9yIHRpbWVyICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL251bGxfYmxr
X3pvbmVkLmMgYi9kcml2ZXJzL2Jsb2NrL251bGxfYmxrX3pvbmVkLmMKaW5kZXggZmNhMGM5N2Zm
MWFhLi40N2Q5NTZiMmUxNDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svbnVsbF9ibGtfem9u
ZWQuYworKysgYi9kcml2ZXJzL2Jsb2NrL251bGxfYmxrX3pvbmVkLmMKQEAgLTEyMSwxNyArMTIx
LDQ0IEBAIHZvaWQgbnVsbF96b25lX3dyaXRlKHN0cnVjdCBudWxsYl9jbWQgKmNtZCwgc2VjdG9y
X3Qgc2VjdG9yLAogCX0KIH0KIAotdm9pZCBudWxsX3pvbmVfcmVzZXQoc3RydWN0IG51bGxiX2Nt
ZCAqY21kLCBzZWN0b3JfdCBzZWN0b3IpCit2b2lkIG51bGxfem9uZV9tZ210X29wKHN0cnVjdCBu
dWxsYl9jbWQgKmNtZCwgc2VjdG9yX3Qgc2VjdG9yKQogewogCXN0cnVjdCBudWxsYl9kZXZpY2Ug
KmRldiA9IGNtZC0+bnEtPmRldjsKIAl1bnNpZ25lZCBpbnQgem5vID0gbnVsbF96b25lX25vKGRl
diwgc2VjdG9yKTsKIAlzdHJ1Y3QgYmxrX3pvbmUgKnpvbmUgPSAmZGV2LT56b25lc1t6bm9dOwor
CWVudW0gcmVxX29wZiBvcCA9IHJlcV9vcChjbWQtPnJxKTsKIAogCWlmICh6b25lLT50eXBlID09
IEJMS19aT05FX1RZUEVfQ09OVkVOVElPTkFMKSB7CiAJCWNtZC0+ZXJyb3IgPSBCTEtfU1RTX0lP
RVJSOwogCQlyZXR1cm47CiAJfQogCi0Jem9uZS0+Y29uZCA9IEJMS19aT05FX0NPTkRfRU1QVFk7
Ci0Jem9uZS0+d3AgPSB6b25lLT5zdGFydDsKKwlzd2l0Y2ggKG9wKSB7CisJY2FzZSBSRVFfT1Bf
Wk9ORV9SRVNFVDoKKwkJem9uZS0+Y29uZCA9IEJMS19aT05FX0NPTkRfRU1QVFk7CisJCXpvbmUt
PndwID0gem9uZS0+c3RhcnQ7CisJCXJldHVybjsKKwljYXNlIFJFUV9PUF9aT05FX09QRU46CisJ
CWlmICh6b25lLT5jb25kID09IEJMS19aT05FX0NPTkRfRlVMTCkgeworCQkJY21kLT5lcnJvciA9
IEJMS19TVFNfSU9FUlI7CisJCQlyZXR1cm47CisJCX0KKwkJem9uZS0+Y29uZCA9IEJMS19aT05F
X0NPTkRfRVhQX09QRU47CisJCXJldHVybjsKKwljYXNlIFJFUV9PUF9aT05FX0NMT1NFOgorCQlp
ZiAoem9uZS0+Y29uZCA9PSBCTEtfWk9ORV9DT05EX0ZVTEwpIHsKKwkJCWNtZC0+ZXJyb3IgPSBC
TEtfU1RTX0lPRVJSOworCQkJcmV0dXJuOworCQl9CisJCXpvbmUtPmNvbmQgPSBCTEtfWk9ORV9D
T05EX0NMT1NFRDsKKwkJcmV0dXJuOworCWNhc2UgUkVRX09QX1pPTkVfRklOSVNIOgorCQl6b25l
LT5jb25kID0gQkxLX1pPTkVfQ09ORF9GVUxMOworCQl6b25lLT53cCA9IHpvbmUtPnN0YXJ0ICsg
em9uZS0+bGVuOworCQlyZXR1cm47CisJZGVmYXVsdDoKKwkJLyogSW52YWxpZCB6b25lIGNvbmRp
dGlvbiAqLworCQljbWQtPmVycm9yID0gQkxLX1NUU19JT0VSUjsKKwkJcmV0dXJuOworCX0KIH0K
LS0gCjIuMTkuMQoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20K
aHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs
