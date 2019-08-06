Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E847382D5E
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 10:03:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 151F33002DC6;
	Tue,  6 Aug 2019 08:03:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E229C5D6D0;
	Tue,  6 Aug 2019 08:03:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CD9F3CB8;
	Tue,  6 Aug 2019 08:03:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7682nZl018923 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 04:02:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1EBD319C7F; Tue,  6 Aug 2019 08:02:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17E3CF6C5
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 08:02:48 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18E193091785
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 08:02:48 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n4so86961221wrs.3
	for <dm-devel@redhat.com>; Tue, 06 Aug 2019 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qm6JmV3kYksXWkeHC8pJWnKVfNR1ILujwNkPpqX8u58=;
	b=KO+jyoMY9ilq+waDLre4wpNqq5bKuzook/vdC1KlJZH8sM8Xr0/2PXSLIkBEXb88+G
	/FNvoKUgUdmlI2Dkh9Ppgs/BFXyxmZBEjb5ySCKUc9nqoUIAPKtwR/xdPXPnaY5/LqHZ
	+RWkYDUar7b5P3zL+bZxI2YOdjZggxbk0T6Q7AYB85IPrZo+/JCl9xvNy/uc598h9tyO
	4v1/GeZMfKP3rZyAuNuIODNX4HPPuHkyp2TpFmGXCaAi9y6wqmqs9EHEP/Odu4slwf8P
	p1I24ENa85XU5QBYPWtQhQWo/FitJ3sz8EQriWOkImaQpKRM16C/XczKEjk7G6DbMUJu
	pvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qm6JmV3kYksXWkeHC8pJWnKVfNR1ILujwNkPpqX8u58=;
	b=haaZizuRauWcuwVKOWa6coqLIxnafRIcSr4wOSQnCdEqh3VX44upYxYMcRqSdgZhOt
	yNHBHnxtg3PTU+m7KtKmzabrIDnSLeCTqr6GXrqlz0EmsnOze+BdBrOuViBLuwMKY434
	wDHa3WcrH0j/FOH3B8208+tP725ynnSiGYn3MIWN72kt510c9Ya8lExshXQQh4BYXMHG
	NJyItEkgB1zIrit5Pf6JeRRWUU3boJuRhBxq+ymSr97Y1T0iV6PTKYgv5nunoAkEf/2x
	sEv98Vd1gbjh7EnnZxlPn/UJUEhHjNIkqEhN76V0LR5Ro9k9AR7bRIM9Kej/z7AN/y6N
	UoEA==
X-Gm-Message-State: APjAAAVok85jeJ/E72sw91dyQL46PFhAnhhv8pCuHnNXDI/QqR6Q5zVc
	HGHngrlnKu6oqiF0GcRCxC5XNA==
X-Google-Smtp-Source: APXvYqxvem5JSqcJp5XyUjQpuY8Cpg9l/gyW5f2rVkfXFaOHymWoTrTuKPXcaq6FvQ7q9I+mBD5nKQ==
X-Received: by 2002:a5d:5507:: with SMTP id b7mr3023744wrv.35.1565078566677;
	Tue, 06 Aug 2019 01:02:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:582f:8334:9cd9:7241])
	by smtp.gmail.com with ESMTPSA id
	g12sm123785475wrv.9.2019.08.06.01.02.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 01:02:46 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Tue,  6 Aug 2019 11:02:34 +0300
Message-Id: <20190806080234.27998-3-ard.biesheuvel@linaro.org>
In-Reply-To: <20190806080234.27998-1-ard.biesheuvel@linaro.org>
References: <20190806080234.27998-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 06 Aug 2019 08:02:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 06 Aug 2019 08:02:48 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: herbert@gondor.apana.org.au, snitzer@redhat.com,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, ebiggers@kernel.org,
	dm-devel@redhat.com, gmazyland@gmail.com, agk@redhat.com
Subject: [dm-devel] [RFC PATCH 2/2] md/dm-crypt - switch to AES library for
	EBOIV
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 06 Aug 2019 08:03:49 +0000 (UTC)

The EBOIV IV mode reuses the same AES encryption key that is used for
encrypting the data, and uses it to perform a single block encryption
of the byte offset to produce the IV.

Since table-based AES is known to be susceptible to known-plaintext
attacks on the key, and given that the same key is used to encrypt
the byte offset (which is known to an attacker), we should be
careful not to permit arbitrary instantiations where the allocated
AES cipher is provided by aes-generic or other table-based drivers
that are known to be time variant and thus susceptible to this kind
of attack.

Instead, let's switch to the new AES library, which has a D-cache
footprint that is only 1/32th of the generic AES driver, and which
contains some mitigations to reduce the timing variance even further.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/dm-crypt.c | 33 ++++++--------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index a5e8d5bc1581..4650ab4b9415 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -27,6 +27,7 @@
 #include <linux/ctype.h>
 #include <asm/page.h>
 #include <asm/unaligned.h>
+#include <crypto/aes.h>
 #include <crypto/hash.h>
 #include <crypto/md5.h>
 #include <crypto/algapi.h>
@@ -121,7 +122,7 @@ struct iv_tcw_private {
 };
 
 struct iv_eboiv_private {
-	struct crypto_cipher *tfm;
+	struct crypto_aes_ctx aes_ctx;
 };
 
 /*
@@ -851,16 +852,12 @@ static void crypt_iv_eboiv_dtr(struct crypt_config *cc)
 {
 	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
 
-	crypto_free_cipher(eboiv->tfm);
-	eboiv->tfm = NULL;
+	memset(eboiv, 0, sizeof(*eboiv));
 }
 
 static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
 			    const char *opts)
 {
-	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
-	struct crypto_cipher *tfm;
-
 	if (test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags) ||
 	    strcmp("cbc(aes)",
 	           crypto_tfm_alg_name(crypto_skcipher_tfm(any_tfm(cc))))) {
@@ -868,20 +865,6 @@ static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
 		return -EINVAL;
 	}
 
-	tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
-	if (IS_ERR(tfm)) {
-		ti->error = "Error allocating crypto tfm for EBOIV";
-		return PTR_ERR(tfm);
-	}
-
-	if (crypto_cipher_blocksize(tfm) != cc->iv_size) {
-		ti->error = "Block size of EBOIV cipher does "
-			    "not match IV size of block cipher";
-		crypto_free_cipher(tfm);
-		return -EINVAL;
-	}
-
-	eboiv->tfm = tfm;
 	return 0;
 }
 
@@ -890,7 +873,7 @@ static int crypt_iv_eboiv_init(struct crypt_config *cc)
 	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
 	int err;
 
-	err = crypto_cipher_setkey(eboiv->tfm, cc->key, cc->key_size);
+	err = aes_expandkey(&eboiv->aes_ctx, cc->key, cc->key_size);
 	if (err)
 		return err;
 
@@ -899,8 +882,10 @@ static int crypt_iv_eboiv_init(struct crypt_config *cc)
 
 static int crypt_iv_eboiv_wipe(struct crypt_config *cc)
 {
-	/* Called after cc->key is set to random key in crypt_wipe() */
-	return crypt_iv_eboiv_init(cc);
+	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
+
+	memset(eboiv, 0, sizeof(*eboiv));
+	return 0;
 }
 
 static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
@@ -910,7 +895,7 @@ static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
 
 	memset(iv, 0, cc->iv_size);
 	*(__le64 *)iv = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
-	crypto_cipher_encrypt_one(eboiv->tfm, iv, iv);
+	aes_encrypt(&eboiv->aes_ctx, iv, iv);
 
 	return 0;
 }
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
