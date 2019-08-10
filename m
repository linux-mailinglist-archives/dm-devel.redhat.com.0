Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E288A65
	for <lists+dm-devel@lfdr.de>; Sat, 10 Aug 2019 11:41:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AB8A7E427;
	Sat, 10 Aug 2019 09:41:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02A4E60C5D;
	Sat, 10 Aug 2019 09:41:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A2F3180BA9A;
	Sat, 10 Aug 2019 09:41:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7A9fUWw009403 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 10 Aug 2019 05:41:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61C6C60C5D; Sat, 10 Aug 2019 09:41:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C8556B49A
	for <dm-devel@redhat.com>; Sat, 10 Aug 2019 09:41:30 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C3043086E21
	for <dm-devel@redhat.com>; Sat, 10 Aug 2019 09:41:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p17so100338625wrf.11
	for <dm-devel@redhat.com>; Sat, 10 Aug 2019 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pDwlcEgRHMP1A+eWN1ls3VEq1WPb0aAZmMnRS26btp0=;
	b=iy+v26NRzdcMasS+ielZ6t2ZRgVZqxgKuZUm+lNSRJkx/fwtoF+yZedxSzo3He7Tys
	gLZs4oAZOtlKp1LAqPi52bBRz4hxaeZfSBZy/4b1hQG4teBSAfwTT7qrlgU61he4I6n2
	gC4dM9F/IcE3V2dyeVFpIPo5kjIX/Gg9LDHiPZ9ZyCMm+PqtqYC87S9IjTUvbqxtaA7U
	vImOsFGwxxX3QoKc5cgxcB7gkbI+8ZRPL1S3b4CoBuAEkHIx8Skfs2c+7ubYPX60/FA+
	EQ5c5wrVHHZ13pNcpBd46PsIa6JvQ6WG/NUZQF7ViyD7vPkDlU3Vuq3RABzmPUyNBl2X
	MVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pDwlcEgRHMP1A+eWN1ls3VEq1WPb0aAZmMnRS26btp0=;
	b=bxnLnAX17snv5P7fpDfRA7YEOZdTZ6rmpG2ZoCb0KcD08obQ/CNjgG0lcwVE127nXc
	g1+ZaWIzFF62KZB53xbqTyN1a6pLMA+DWDQqjnr3pbNlYQiCqb+1QNNCbtylqobL/jE0
	tS2669hYcr74yJdlOinmpfXhMFM+M7MmNcQex1bFYJElYY8e4olTnJP/eX4ShtMYe5Ob
	rHq1XPK/X+WRDRfeMNUHO4gGJhP/QRmMq2343MfmhTdRIwwg2nbDSHlnp47ePqVx6cXG
	GewiPfDbd/ALsG7DIFkf7kGYkr+8HhzToFNR1+c/k2wl0eXOeO4G7TYc4FMvbOC1UmoY
	r0Mw==
X-Gm-Message-State: APjAAAWq5Fp0Zz9AX6EaJ4GHRQD9+x2cUBI1ttImJqMx6OH1ELhbDRHD
	UNbCa/DhpCe4jGbe/HK840yHKQ==
X-Google-Smtp-Source: APXvYqz0DtB6rsOsphVfLZ+N0o+A3Ho20CfcSQ33HM4jRLaGjsYL5y0vVCAWYKBmiTeQFUdkiopP6A==
X-Received: by 2002:adf:83c5:: with SMTP id 63mr520977wre.86.1565430088139;
	Sat, 10 Aug 2019 02:41:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:582f:8334:9cd9:7241])
	by smtp.gmail.com with ESMTPSA id n16sm519883wmk.12.2019.08.10.02.41.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 Aug 2019 02:41:27 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Sat, 10 Aug 2019 12:40:53 +0300
Message-Id: <20190810094053.7423-8-ard.biesheuvel@linaro.org>
In-Reply-To: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
References: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sat, 10 Aug 2019 09:41:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Sat, 10 Aug 2019 09:41:29 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v9 7/7] md: dm-crypt: omit parsing of the
	encapsulated cipher
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sat, 10 Aug 2019 09:41:46 +0000 (UTC)

Only the ESSIV IV generation mode used to use cc->cipher so it could
instantiate the bare cipher used to encrypt the IV. However, this is
now taken care of by the ESSIV template, and so no users of cc->cipher
remain. So remove it altogether.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/dm-crypt.c | 58 --------------------
 1 file changed, 58 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index d3f2634f41a8..e5ad3e596639 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -143,7 +143,6 @@ struct crypt_config {
 	struct task_struct *write_thread;
 	struct rb_root write_tree;
 
-	char *cipher;
 	char *cipher_string;
 	char *cipher_auth;
 	char *key_string;
@@ -2140,7 +2139,6 @@ static void crypt_dtr(struct dm_target *ti)
 	if (cc->dev)
 		dm_put_device(ti, cc->dev);
 
-	kzfree(cc->cipher);
 	kzfree(cc->cipher_string);
 	kzfree(cc->key_string);
 	kzfree(cc->cipher_auth);
@@ -2221,52 +2219,6 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
 	return 0;
 }
 
-/*
- * Workaround to parse cipher algorithm from crypto API spec.
- * The cc->cipher is currently used only in ESSIV.
- * This should be probably done by crypto-api calls (once available...)
- */
-static int crypt_ctr_blkdev_cipher(struct crypt_config *cc)
-{
-	const char *alg_name = NULL;
-	char *start, *end;
-
-	if (crypt_integrity_aead(cc)) {
-		alg_name = crypto_tfm_alg_name(crypto_aead_tfm(any_tfm_aead(cc)));
-		if (!alg_name)
-			return -EINVAL;
-		if (crypt_integrity_hmac(cc)) {
-			alg_name = strchr(alg_name, ',');
-			if (!alg_name)
-				return -EINVAL;
-		}
-		alg_name++;
-	} else {
-		alg_name = crypto_tfm_alg_name(crypto_skcipher_tfm(any_tfm(cc)));
-		if (!alg_name)
-			return -EINVAL;
-	}
-
-	start = strchr(alg_name, '(');
-	end = strchr(alg_name, ')');
-
-	if (!start && !end) {
-		cc->cipher = kstrdup(alg_name, GFP_KERNEL);
-		return cc->cipher ? 0 : -ENOMEM;
-	}
-
-	if (!start || !end || ++start >= end)
-		return -EINVAL;
-
-	cc->cipher = kzalloc(end - start + 1, GFP_KERNEL);
-	if (!cc->cipher)
-		return -ENOMEM;
-
-	strncpy(cc->cipher, start, end - start);
-
-	return 0;
-}
-
 /*
  * Workaround to parse HMAC algorithm from AEAD crypto API spec.
  * The HMAC is needed to calculate tag size (HMAC digest size).
@@ -2373,12 +2325,6 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
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
 
@@ -2413,10 +2359,6 @@ static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key
 	}
 	cc->key_parts = cc->tfms_count;
 
-	cc->cipher = kstrdup(cipher, GFP_KERNEL);
-	if (!cc->cipher)
-		goto bad_mem;
-
 	chainmode = strsep(&tmp, "-");
 	*ivmode = strsep(&tmp, ":");
 	*ivopts = tmp;
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
