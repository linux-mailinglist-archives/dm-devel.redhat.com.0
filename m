Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC17572C6
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jun 2019 22:42:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22F45308427C;
	Wed, 26 Jun 2019 20:42:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B75685C234;
	Wed, 26 Jun 2019 20:42:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53273C589;
	Wed, 26 Jun 2019 20:42:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QKfBh5007644 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 16:41:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15F835C226; Wed, 26 Jun 2019 20:41:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1002A5C205
	for <dm-devel@redhat.com>; Wed, 26 Jun 2019 20:41:07 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DD0F3086228
	for <dm-devel@redhat.com>; Wed, 26 Jun 2019 20:40:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f15so4292993wrp.2
	for <dm-devel@redhat.com>; Wed, 26 Jun 2019 13:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MLaZzAvT/8eVVuD4nlFoDPN31bViUGFEyHqNk0s5eAg=;
	b=vAcgW426+s/waAy6AV4OSUkKsoJrGz8ekwedzX+MSXivHsN3v3fs+EVYhZoxMvHwOG
	Mzk/B7n5GgYBAfdbHqlmQZf+z+znzczbvlyadvOIr6u+/zt9td8BGbZFFSA1H9ieuN09
	DOwUZmWa42JzJkYnzKC1JelqH+1kmTFZ5v2j8Ysxz8wfKQdrysi4VqmFiMT983O6SEa/
	EM/tOP8nF4CRX+JEQgU2Sh0BTp1YwId9uddUdv63gQejmBYciFFEJyqPEkuN7moyytJe
	twfmSptS4Rk0r1UGel10ro09fHrWbdnx1VZneEAReb72pk+7g08yb1cZNOuJ3rAPf60L
	TvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MLaZzAvT/8eVVuD4nlFoDPN31bViUGFEyHqNk0s5eAg=;
	b=gZqigFgCc7SjiMoq6X47FWoU92nmkexyouK0m5jngNQhs54q8CnYFGgC99cqhnaF1U
	xTVMFnJ5WdW3HPHZtJU4f8ipqdrqYzuaFTOilVPJ3xG0x5y0KrD203+YIm5GOYhisysx
	VUPgdTkTWXP40zkx0r+b+rxo91VddPk/SAZaMeXTjBFOTgqn1Ozizj4PRoK3B78Yj688
	qnTTZojXP4gSlfsfzT6NxaRrPlYdxzmMdKOibndVIrZy0dJqtu/5cSf/jtpoXgExf2tC
	riM0QBw1NbECz035IhBBfF0cMlOx2/Sm9Htql7iQqRPl7oGxZ0UM9UfeeMQlwoh1PB5a
	J8wA==
X-Gm-Message-State: APjAAAVGwQ0I03L+uauarEC5Yy45QSlRHN6D6eHCPBHsZLBdbWAujeMB
	UMXSJZs0qk1WBIlxsn3iYWsPig==
X-Google-Smtp-Source: APXvYqzJ8cOgQjpk8qAZgLGAQ23AbRjHI85hWlvEdSk0gCCHaEfx5zaiPw73NmK+iMhl1IBZHj1jtA==
X-Received: by 2002:a5d:6ccc:: with SMTP id c12mr4983762wrc.57.1561581657743; 
	Wed, 26 Jun 2019 13:40:57 -0700 (PDT)
Received: from sudo.home ([2a01:cb1d:112:6f00:9c7f:f574:ee94:7dec])
	by smtp.gmail.com with ESMTPSA id
	32sm35164587wra.35.2019.06.26.13.40.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jun 2019 13:40:57 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Wed, 26 Jun 2019 22:40:45 +0200
Message-Id: <20190626204047.32131-6-ard.biesheuvel@linaro.org>
In-Reply-To: <20190626204047.32131-1-ard.biesheuvel@linaro.org>
References: <20190626204047.32131-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 26 Jun 2019 20:40:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 26 Jun 2019 20:40:59 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.279  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	NO_DNS_FOR_FROM, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [dm-devel] [PATCH v5 5/7] crypto: essiv - add test vector for
	essiv(cbc(aes), aes, sha256)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 26 Jun 2019 20:42:28 +0000 (UTC)

Add a test vector for the ESSIV mode that is the most widely used,
i.e., using cbc(aes) and sha256.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 crypto/tcrypt.c  |   9 +
 crypto/testmgr.c |   6 +
 crypto/testmgr.h | 213 ++++++++++++++++++++
 3 files changed, 228 insertions(+)

diff --git a/crypto/tcrypt.c b/crypto/tcrypt.c
index ad78ab5b93cb..f990a209197e 100644
--- a/crypto/tcrypt.c
+++ b/crypto/tcrypt.c
@@ -2327,6 +2327,15 @@ static int do_test(const char *alg, u32 type, u32 mask, int m, u32 num_mb)
 				  0, speed_template_32);
 		break;
 
+	case 220:
+		test_acipher_speed("essiv(cbc(aes),aes,sha256)",
+				  ENCRYPT, sec, NULL, 0,
+				  speed_template_16_24_32);
+		test_acipher_speed("essiv(cbc(aes),aes,sha256)",
+				  DECRYPT, sec, NULL, 0,
+				  speed_template_16_24_32);
+		break;
+
 	case 300:
 		if (alg) {
 			test_hash_speed(alg, sec, generic_hash_speed_template);
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 658a7eeebab2..23703f3e9cbb 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4253,6 +4253,12 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.akcipher = __VECS(ecrdsa_tv_template)
 		}
+	}, {
+		.alg = "essiv(cbc(aes),aes,sha256)",
+		.test = alg_test_skcipher,
+		.suite = {
+			.cipher = __VECS(essiv_aes_cbc_tv_template)
+		}
 	}, {
 		.alg = "gcm(aes)",
 		.generic_driver = "gcm_base(ctr(aes-generic),ghash-generic)",
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 1fdae5993bc3..cca3561b0135 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -33575,4 +33575,217 @@ static const struct comp_testvec zstd_decomp_tv_template[] = {
 			  "functions.",
 	},
 };
+
+/* based on aes_cbc_tv_template */
+static const struct cipher_testvec essiv_aes_cbc_tv_template[] = {
+	{
+		.key    = "\x06\xa9\x21\x40\x36\xb8\xa1\x5b"
+			  "\x51\x2e\x03\xd5\x34\x12\x00\x06",
+		.klen   = 16,
+		.iv	= "\x3d\xaf\xba\x42\x9d\x9e\xb4\x30"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	= "Single block msg",
+		.ctext	= "\xfa\x59\xe7\x5f\x41\x56\x65\xc3"
+			  "\x36\xca\x6b\x72\x10\x9f\x8c\xd4",
+		.len	= 16,
+	}, {
+		.key    = "\xc2\x86\x69\x6d\x88\x7c\x9a\xa0"
+			  "\x61\x1b\xbb\x3e\x20\x25\xa4\x5a",
+		.klen   = 16,
+		.iv     = "\x56\x2e\x17\x99\x6d\x09\x3d\x28"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
+			  "\x10\x11\x12\x13\x14\x15\x16\x17"
+			  "\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f",
+		.ctext	= "\xc8\x59\x9a\xfe\x79\xe6\x7b\x20"
+			  "\x06\x7d\x55\x0a\x5e\xc7\xb5\xa7"
+			  "\x0b\x9c\x80\xd2\x15\xa1\xb8\x6d"
+			  "\xc6\xab\x7b\x65\xd9\xfd\x88\xeb",
+		.len	= 32,
+	}, {
+		.key	= "\x8e\x73\xb0\xf7\xda\x0e\x64\x52"
+			  "\xc8\x10\xf3\x2b\x80\x90\x79\xe5"
+			  "\x62\xf8\xea\xd2\x52\x2c\x6b\x7b",
+		.klen	= 24,
+		.iv	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	= "\x6b\xc1\xbe\xe2\x2e\x40\x9f\x96"
+			  "\xe9\x3d\x7e\x11\x73\x93\x17\x2a"
+			  "\xae\x2d\x8a\x57\x1e\x03\xac\x9c"
+			  "\x9e\xb7\x6f\xac\x45\xaf\x8e\x51"
+			  "\x30\xc8\x1c\x46\xa3\x5c\xe4\x11"
+			  "\xe5\xfb\xc1\x19\x1a\x0a\x52\xef"
+			  "\xf6\x9f\x24\x45\xdf\x4f\x9b\x17"
+			  "\xad\x2b\x41\x7b\xe6\x6c\x37\x10",
+		.ctext	= "\x96\x6d\xa9\x7a\x42\xe6\x01\xc7"
+			  "\x17\xfc\xa7\x41\xd3\x38\x0b\xe5"
+			  "\x51\x48\xf7\x7e\x5e\x26\xa9\xfe"
+			  "\x45\x72\x1c\xd9\xde\xab\xf3\x4d"
+			  "\x39\x47\xc5\x4f\x97\x3a\x55\x63"
+			  "\x80\x29\x64\x4c\x33\xe8\x21\x8a"
+			  "\x6a\xef\x6b\x6a\x8f\x43\xc0\xcb"
+			  "\xf0\xf3\x6e\x74\x54\x44\x92\x44",
+		.len	= 64,
+	}, {
+		.key	= "\x60\x3d\xeb\x10\x15\xca\x71\xbe"
+			  "\x2b\x73\xae\xf0\x85\x7d\x77\x81"
+			  "\x1f\x35\x2c\x07\x3b\x61\x08\xd7"
+			  "\x2d\x98\x10\xa3\x09\x14\xdf\xf4",
+		.klen	= 32,
+		.iv	= "\x00\x01\x02\x03\x04\x05\x06\x07"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	= "\x6b\xc1\xbe\xe2\x2e\x40\x9f\x96"
+			  "\xe9\x3d\x7e\x11\x73\x93\x17\x2a"
+			  "\xae\x2d\x8a\x57\x1e\x03\xac\x9c"
+			  "\x9e\xb7\x6f\xac\x45\xaf\x8e\x51"
+			  "\x30\xc8\x1c\x46\xa3\x5c\xe4\x11"
+			  "\xe5\xfb\xc1\x19\x1a\x0a\x52\xef"
+			  "\xf6\x9f\x24\x45\xdf\x4f\x9b\x17"
+			  "\xad\x2b\x41\x7b\xe6\x6c\x37\x10",
+		.ctext	= "\x24\x52\xf1\x48\x74\xd0\xa7\x93"
+			  "\x75\x9b\x63\x46\xc0\x1c\x1e\x17"
+			  "\x4d\xdc\x5b\x3a\x27\x93\x2a\x63"
+			  "\xf7\xf1\xc7\xb3\x54\x56\x5b\x50"
+			  "\xa3\x31\xa5\x8b\xd6\xfd\xb6\x3c"
+			  "\x8b\xf6\xf2\x45\x05\x0c\xc8\xbb"
+			  "\x32\x0b\x26\x1c\xe9\x8b\x02\xc0"
+			  "\xb2\x6f\x37\xa7\x5b\xa8\xa9\x42",
+		.len	= 64,
+	}, {
+		.key	= "\xC9\x83\xA6\xC9\xEC\x0F\x32\x55"
+			  "\x0F\x32\x55\x78\x9B\xBE\x78\x9B"
+			  "\xBE\xE1\x04\x27\xE1\x04\x27\x4A"
+			  "\x6D\x90\x4A\x6D\x90\xB3\xD6\xF9",
+		.klen	= 32,
+		.iv	= "\xE7\x82\x1D\xB8\x53\x11\xAC\x47"
+			  "\x00\x00\x00\x00\x00\x00\x00\x00",
+		.ptext	= "\x50\xB9\x22\xAE\x17\x80\x0C\x75"
+			  "\xDE\x47\xD3\x3C\xA5\x0E\x9A\x03"
+			  "\x6C\xF8\x61\xCA\x33\xBF\x28\x91"
+			  "\x1D\x86\xEF\x58\xE4\x4D\xB6\x1F"
+			  "\xAB\x14\x7D\x09\x72\xDB\x44\xD0"
+			  "\x39\xA2\x0B\x97\x00\x69\xF5\x5E"
+			  "\xC7\x30\xBC\x25\x8E\x1A\x83\xEC"
+			  "\x55\xE1\x4A\xB3\x1C\xA8\x11\x7A"
+			  "\x06\x6F\xD8\x41\xCD\x36\x9F\x08"
+			  "\x94\xFD\x66\xF2\x5B\xC4\x2D\xB9"
+			  "\x22\x8B\x17\x80\xE9\x52\xDE\x47"
+			  "\xB0\x19\xA5\x0E\x77\x03\x6C\xD5"
+			  "\x3E\xCA\x33\x9C\x05\x91\xFA\x63"
+			  "\xEF\x58\xC1\x2A\xB6\x1F\x88\x14"
+			  "\x7D\xE6\x4F\xDB\x44\xAD\x16\xA2"
+			  "\x0B\x74\x00\x69\xD2\x3B\xC7\x30"
+			  "\x99\x02\x8E\xF7\x60\xEC\x55\xBE"
+			  "\x27\xB3\x1C\x85\x11\x7A\xE3\x4C"
+			  "\xD8\x41\xAA\x13\x9F\x08\x71\xFD"
+			  "\x66\xCF\x38\xC4\x2D\x96\x22\x8B"
+			  "\xF4\x5D\xE9\x52\xBB\x24\xB0\x19"
+			  "\x82\x0E\x77\xE0\x49\xD5\x3E\xA7"
+			  "\x10\x9C\x05\x6E\xFA\x63\xCC\x35"
+			  "\xC1\x2A\x93\x1F\x88\xF1\x5A\xE6"
+			  "\x4F\xB8\x21\xAD\x16\x7F\x0B\x74"
+			  "\xDD\x46\xD2\x3B\xA4\x0D\x99\x02"
+			  "\x6B\xF7\x60\xC9\x32\xBE\x27\x90"
+			  "\x1C\x85\xEE\x57\xE3\x4C\xB5\x1E"
+			  "\xAA\x13\x7C\x08\x71\xDA\x43\xCF"
+			  "\x38\xA1\x0A\x96\xFF\x68\xF4\x5D"
+			  "\xC6\x2F\xBB\x24\x8D\x19\x82\xEB"
+			  "\x54\xE0\x49\xB2\x1B\xA7\x10\x79"
+			  "\x05\x6E\xD7\x40\xCC\x35\x9E\x07"
+			  "\x93\xFC\x65\xF1\x5A\xC3\x2C\xB8"
+			  "\x21\x8A\x16\x7F\xE8\x51\xDD\x46"
+			  "\xAF\x18\xA4\x0D\x76\x02\x6B\xD4"
+			  "\x3D\xC9\x32\x9B\x04\x90\xF9\x62"
+			  "\xEE\x57\xC0\x29\xB5\x1E\x87\x13"
+			  "\x7C\xE5\x4E\xDA\x43\xAC\x15\xA1"
+			  "\x0A\x73\xFF\x68\xD1\x3A\xC6\x2F"
+			  "\x98\x01\x8D\xF6\x5F\xEB\x54\xBD"
+			  "\x26\xB2\x1B\x84\x10\x79\xE2\x4B"
+			  "\xD7\x40\xA9\x12\x9E\x07\x70\xFC"
+			  "\x65\xCE\x37\xC3\x2C\x95\x21\x8A"
+			  "\xF3\x5C\xE8\x51\xBA\x23\xAF\x18"
+			  "\x81\x0D\x76\xDF\x48\xD4\x3D\xA6"
+			  "\x0F\x9B\x04\x6D\xF9\x62\xCB\x34"
+			  "\xC0\x29\x92\x1E\x87\xF0\x59\xE5"
+			  "\x4E\xB7\x20\xAC\x15\x7E\x0A\x73"
+			  "\xDC\x45\xD1\x3A\xA3\x0C\x98\x01"
+			  "\x6A\xF6\x5F\xC8\x31\xBD\x26\x8F"
+			  "\x1B\x84\xED\x56\xE2\x4B\xB4\x1D"
+			  "\xA9\x12\x7B\x07\x70\xD9\x42\xCE"
+			  "\x37\xA0\x09\x95\xFE\x67\xF3\x5C"
+			  "\xC5\x2E\xBA\x23\x8C\x18\x81\xEA"
+			  "\x53\xDF\x48\xB1\x1A\xA6\x0F\x78"
+			  "\x04\x6D\xD6\x3F\xCB\x34\x9D\x06"
+			  "\x92\xFB\x64\xF0\x59\xC2\x2B\xB7"
+			  "\x20\x89\x15\x7E\xE7\x50\xDC\x45"
+			  "\xAE\x17\xA3\x0C\x75\x01\x6A\xD3"
+			  "\x3C\xC8\x31\x9A\x03\x8F\xF8\x61"
+			  "\xED\x56\xBF\x28\xB4\x1D\x86\x12",
+		.ctext	= "\x97\x7f\x69\x0f\x0f\x34\xa6\x33"
+			  "\x66\x49\x7e\xd0\x4d\x1b\xc9\x64"
+			  "\xf9\x61\x95\x98\x11\x00\x88\xf8"
+			  "\x2e\x88\x01\x0f\x2b\xe1\xae\x3e"
+			  "\xfe\xd6\x47\x30\x11\x68\x7d\x99"
+			  "\xad\x69\x6a\xe8\x41\x5f\x1e\x16"
+			  "\x00\x3a\x47\xdf\x8e\x7d\x23\x1c"
+			  "\x19\x5b\x32\x76\x60\x03\x05\xc1"
+			  "\xa0\xff\xcf\xcc\x74\x39\x46\x63"
+			  "\xfe\x5f\xa6\x35\xa7\xb4\xc1\xf9"
+			  "\x4b\x5e\x38\xcc\x8c\xc1\xa2\xcf"
+			  "\x9a\xc3\xae\x55\x42\x46\x93\xd9"
+			  "\xbd\x22\xd3\x8a\x19\x96\xc3\xb3"
+			  "\x7d\x03\x18\xf9\x45\x09\x9c\xc8"
+			  "\x90\xf3\x22\xb3\x25\x83\x9a\x75"
+			  "\xbb\x04\x48\x97\x3a\x63\x08\x04"
+			  "\xa0\x69\xf6\x52\xd4\x89\x93\x69"
+			  "\xb4\x33\xa2\x16\x58\xec\x4b\x26"
+			  "\x76\x54\x10\x0b\x6e\x53\x1e\xbc"
+			  "\x16\x18\x42\xb1\xb1\xd3\x4b\xda"
+			  "\x06\x9f\x8b\x77\xf7\xab\xd6\xed"
+			  "\xa3\x1d\x90\xda\x49\x38\x20\xb8"
+			  "\x6c\xee\xae\x3e\xae\x6c\x03\xb8"
+			  "\x0b\xed\xc8\xaa\x0e\xc5\x1f\x90"
+			  "\x60\xe2\xec\x1b\x76\xd0\xcf\xda"
+			  "\x29\x1b\xb8\x5a\xbc\xf4\xba\x13"
+			  "\x91\xa6\xcb\x83\x3f\xeb\xe9\x7b"
+			  "\x03\xba\x40\x9e\xe6\x7a\xb2\x4a"
+			  "\x73\x49\xfc\xed\xfb\x55\xa4\x24"
+			  "\xc7\xa4\xd7\x4b\xf5\xf7\x16\x62"
+			  "\x80\xd3\x19\x31\x52\x25\xa8\x69"
+			  "\xda\x9a\x87\xf5\xf2\xee\x5d\x61"
+			  "\xc1\x12\x72\x3e\x52\x26\x45\x3a"
+			  "\xd8\x9d\x57\xfa\x14\xe2\x9b\x2f"
+			  "\xd4\xaa\x5e\x31\xf4\x84\x89\xa4"
+			  "\xe3\x0e\xb0\x58\x41\x75\x6a\xcb"
+			  "\x30\x01\x98\x90\x15\x80\xf5\x27"
+			  "\x92\x13\x81\xf0\x1c\x1e\xfc\xb1"
+			  "\x33\xf7\x63\xb0\x67\xec\x2e\x5c"
+			  "\x85\xe3\x5b\xd0\x43\x8a\xb8\x5f"
+			  "\x44\x9f\xec\x19\xc9\x8f\xde\xdf"
+			  "\x79\xef\xf8\xee\x14\x87\xb3\x34"
+			  "\x76\x00\x3a\x9b\xc7\xed\xb1\x3d"
+			  "\xef\x07\xb0\xe4\xfd\x68\x9e\xeb"
+			  "\xc2\xb4\x1a\x85\x9a\x7d\x11\x88"
+			  "\xf8\xab\x43\x55\x2b\x8a\x4f\x60"
+			  "\x85\x9a\xf4\xba\xae\x48\x81\xeb"
+			  "\x93\x07\x97\x9e\xde\x2a\xfc\x4e"
+			  "\x31\xde\xaa\x44\xf7\x2a\xc3\xee"
+			  "\x60\xa2\x98\x2c\x0a\x88\x50\xc5"
+			  "\x6d\x89\xd3\xe4\xb6\xa7\xf4\xb0"
+			  "\xcf\x0e\x89\xe3\x5e\x8f\x82\xf4"
+			  "\x9d\xd1\xa9\x51\x50\x8a\xd2\x18"
+			  "\x07\xb2\xaa\x3b\x7f\x58\x9b\xf4"
+			  "\xb7\x24\x39\xd3\x66\x2f\x1e\xc0"
+			  "\x11\xa3\x56\x56\x2a\x10\x73\xbc"
+			  "\xe1\x23\xbf\xa9\x37\x07\x9c\xc3"
+			  "\xb2\xc9\xa8\x1c\x5b\x5c\x58\xa4"
+			  "\x77\x02\x26\xad\xc3\x40\x11\x53"
+			  "\x93\x68\x72\xde\x05\x8b\x10\xbc"
+			  "\xa6\xd4\x1b\xd9\x27\xd8\x16\x12"
+			  "\x61\x2b\x31\x2a\x44\x87\x96\x58",
+		.len	= 496,
+	},
+};
+
 #endif	/* _CRYPTO_TESTMGR_H */
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
