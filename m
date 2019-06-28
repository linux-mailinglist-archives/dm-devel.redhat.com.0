Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 907A759EDE
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 17:29:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A454781F25;
	Fri, 28 Jun 2019 15:28:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D839E5DD6B;
	Fri, 28 Jun 2019 15:28:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFD5B19725;
	Fri, 28 Jun 2019 15:28:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SFLcTX011012 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 11:21:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 289EC26DF3; Fri, 28 Jun 2019 15:21:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22E7026DF0
	for <dm-devel@redhat.com>; Fri, 28 Jun 2019 15:21:38 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B08F1C05B00E
	for <dm-devel@redhat.com>; Fri, 28 Jun 2019 15:21:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id g135so9490769wme.4
	for <dm-devel@redhat.com>; Fri, 28 Jun 2019 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qsECSzDwZmZWjunZWkZ4/sxN9oyV7lbTfmYWPWEtO7o=;
	b=o+7yKEDqtEK1l4oK+b/ES4RAAsXKsIEa21cEXJi2IgiwlDivOuMtbO/jaDNKKwI8Kz
	USDlJ6axNNDcAuaZtXM1OLo/Rvtz7Ho0Ad26n5jk13Nk0xkDxokRlRCLrfUaVxjpyKA3
	j093/r9Y1qEUeq7oY1Bmg59tDpUa0hQ+c8zyUeBYeWmBuyWPOdS9GEG1whhy3QscQWha
	qeL+g7AiXTmu85hd87LL+MEnUrxgncuVMfpLkXoiO4E8vWvZxRoCUjX5Q1I0FQJHCZJm
	szFfXdAYW4Ky1PuhipEvmhnAeskMN2TlnPNcyDfcqG1JpEEYI6s0jpYi8JR1IN1jexpj
	tlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qsECSzDwZmZWjunZWkZ4/sxN9oyV7lbTfmYWPWEtO7o=;
	b=VCsmmbslkZHNSYqZjDW5INvV+OcbCwoY6I1MSAQvJGFoR6HG05AMCoXWz/9XSSV0Lg
	U+qc1Zw+pkLU9OEVgiJfuGIqCkDbaqJ5Iyv4Hyrz1MIuzCvP/pBUpBfQ4KyYA7UJPOtE
	sdcaPl7odZAAKFqNlktTXsI/yioZBuh06oFgmD/fpNANFwisYMdi7EHRrwxSVU3kHQKW
	VasZfHIl1tkInCD/LyljVvv1sKhr7Kl0hFRbhf8iWxENR0lmO1dK2zmbljQWBcpnrs6i
	EvdLaUkz9GrNncNCJzaIFad7nAwkC5PLyjRSptxBWWrzu8pRC9AnDa7QNVxz+zOS4n0n
	WjNA==
X-Gm-Message-State: APjAAAVe0U/+KSdeJfv6M34jwm9kYsUyeYjcbulal2M75wpL/IGN8WGb
	1tL8VaJ2mqC01fZ7T2oi1cTmVeAbybY=
X-Google-Smtp-Source: APXvYqwPZ2WcHIkuqyg0P+aJ2AOQvMG3MAePNy0WhYDzpML2VIEA9+qwhg9WgnM9GBSD1k4LdJZ0oQ==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr7676832wmj.79.1561735285257;
	Fri, 28 Jun 2019 08:21:25 -0700 (PDT)
Received: from localhost.localdomain (91-167-84-221.subs.proxad.net.
	[91.167.84.221]) by smtp.gmail.com with ESMTPSA id
	u13sm2734319wrq.62.2019.06.28.08.21.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 28 Jun 2019 08:21:24 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Fri, 28 Jun 2019 17:21:08 +0200
Message-Id: <20190628152112.914-4-ard.biesheuvel@linaro.org>
In-Reply-To: <20190628152112.914-1-ard.biesheuvel@linaro.org>
References: <20190628152112.914-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 28 Jun 2019 15:21:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Fri, 28 Jun 2019 15:21:27 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v6 3/7] md: dm-crypt: infer ESSIV block cipher
	from cipher string directly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 28 Jun 2019 15:29:11 +0000 (UTC)

Instead of allocating a crypto skcipher tfm 'foo' and attempting to
infer the encapsulated block cipher from the driver's 'name' field,
directly parse the string that we used to allocated the tfm. These
are always identical (unless the allocation failed, in which case
we bail anyway), but using the string allows us to use it in the
allocation, which is something we will need when switching to the
'essiv' crypto API template.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/dm-crypt.c | 35 +++++++++-----------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 1b16d34bb785..f001f1104cb5 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2321,25 +2321,17 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
  * The cc->cipher is currently used only in ESSIV.
  * This should be probably done by crypto-api calls (once available...)
  */
-static int crypt_ctr_blkdev_cipher(struct crypt_config *cc)
+static int crypt_ctr_blkdev_cipher(struct crypt_config *cc, char *alg_name)
 {
-	const char *alg_name = NULL;
 	char *start, *end;
 
 	if (crypt_integrity_aead(cc)) {
-		alg_name = crypto_tfm_alg_name(crypto_aead_tfm(any_tfm_aead(cc)));
-		if (!alg_name)
-			return -EINVAL;
 		if (crypt_integrity_hmac(cc)) {
 			alg_name = strchr(alg_name, ',');
 			if (!alg_name)
 				return -EINVAL;
 		}
 		alg_name++;
-	} else {
-		alg_name = crypto_tfm_alg_name(crypto_skcipher_tfm(any_tfm(cc)));
-		if (!alg_name)
-			return -EINVAL;
 	}
 
 	start = strchr(alg_name, '(');
@@ -2434,6 +2426,20 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 	if (*ivmode && !strcmp(*ivmode, "lmk"))
 		cc->tfms_count = 64;
 
+	if (crypt_integrity_aead(cc)) {
+		ret = crypt_ctr_auth_cipher(cc, cipher_api);
+		if (ret < 0) {
+			ti->error = "Invalid AEAD cipher spec";
+			return -ENOMEM;
+	       }
+	}
+
+	ret = crypt_ctr_blkdev_cipher(cc, cipher_api);
+	if (ret < 0) {
+		ti->error = "Cannot allocate cipher string";
+		return -ENOMEM;
+	}
+
 	cc->key_parts = cc->tfms_count;
 
 	/* Allocate cipher */
@@ -2445,21 +2451,10 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 
 	/* Alloc AEAD, can be used only in new format. */
 	if (crypt_integrity_aead(cc)) {
-		ret = crypt_ctr_auth_cipher(cc, cipher_api);
-		if (ret < 0) {
-			ti->error = "Invalid AEAD cipher spec";
-			return -ENOMEM;
-		}
 		cc->iv_size = crypto_aead_ivsize(any_tfm_aead(cc));
 	} else
 		cc->iv_size = crypto_skcipher_ivsize(any_tfm(cc));
 
-	ret = crypt_ctr_blkdev_cipher(cc);
-	if (ret < 0) {
-		ti->error = "Cannot allocate cipher string";
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
