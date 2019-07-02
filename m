Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749A5D4B2
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 18:50:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 851AB81F13;
	Tue,  2 Jul 2019 16:50:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 855B11711C;
	Tue,  2 Jul 2019 16:50:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E6BB206D1;
	Tue,  2 Jul 2019 16:50:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x62GmoMg011483 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 12:48:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78E9987A3; Tue,  2 Jul 2019 16:48:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7475C422C
	for <dm-devel@redhat.com>; Tue,  2 Jul 2019 16:48:50 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 314FB81F25
	for <dm-devel@redhat.com>; Tue,  2 Jul 2019 16:48:35 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id j29so11871931lfk.10
	for <dm-devel@redhat.com>; Tue, 02 Jul 2019 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HomCk1VsjwBWm0dP9ApxcCmxBO/okyV8Fp4po7N++dQ=;
	b=kGbzR475Fk1fnv5DaMFggiI54T2jNgT0VfoTwrbGvLoGWXuBb84+6vXzgRGOv3lHD3
	pFnmstTbfqpQ3r+5GGapEUM/AFpcxk1qkqCeD/hYJeQv1nXCsioGDiiz3vB+0qwkUf+x
	ymm9GqdyrQz69UDZoUR/o3Lg3cqzx2dd6s5sOcugMOF2FGSh7IWDv75ds/N4sd+iDJEq
	7Fd6DawFuubuNNR5DGCqGtRSre8yWN6EkF8UYPrGv0+ShfCwt2iUIDRn3/5YMvTHaUAf
	BueHb4O6F8TB4SWbLJtd55hq0gO6UOPrvWy3MG9jktf1tU9K5nqa5QkeFwkQWcwbLY9v
	bUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HomCk1VsjwBWm0dP9ApxcCmxBO/okyV8Fp4po7N++dQ=;
	b=aIoICZ/rwdWcmjaPRUP9ltmXkrjlyUSq2LkH5c6mnbLKw4ViOXgenLODCmIJsbI4oL
	7YSqbwBm/VtHv3qM8n8qPgrJeb+qy4WcBSNzAg9N3KigBQ4h9Ub1SW+TgDCWUFJ08Kw6
	/R1rH27HRF6t+POcnx0/YYJyncdMAkRJG75Ln3yKJxzJfVT36Nk1s3+GVQJ/I5IP6x/k
	aHn0DBzkepDCwXLAbrwhhcz0rfFfJOr8fH7MdgziUHbsuh1rGvYgscnt7SufUIwZS9BY
	1G1g3+84CUj+BcvISBzYLxjuA7z2K7w4m+yXU7gvwyIkhGAZBWLEJwp+nHV72+WDERQM
	ioyQ==
X-Gm-Message-State: APjAAAWVaJ08lL44gW4cW5qIcLH6TdJcBROmYMVYejs4ecyVcc+uYxWz
	9r+OsKrLHRxXgvJ1LbU03GUUDg==
X-Google-Smtp-Source: APXvYqxvEwu5ZUm3B0pwXGdK64Ks8SPUEVibo6YB2I56UF8Y/EAl21aBD/lQ9kQOnyQ9cDW+o6pjuw==
X-Received: by 2002:a19:41cc:: with SMTP id
	o195mr13813141lfa.166.1562086113634; 
	Tue, 02 Jul 2019 09:48:33 -0700 (PDT)
Received: from e111045-lin.arm.com (89-212-78-239.static.t-2.net.
	[89.212.78.239]) by smtp.gmail.com with ESMTPSA id
	r17sm3906055ljc.85.2019.07.02.09.48.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 09:48:33 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Tue,  2 Jul 2019 18:48:11 +0200
Message-Id: <20190702164815.6341-4-ard.biesheuvel@linaro.org>
In-Reply-To: <20190702164815.6341-1-ard.biesheuvel@linaro.org>
References: <20190702164815.6341-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 02 Jul 2019 16:48:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Tue, 02 Jul 2019 16:48:35 +0000 (UTC) for IP:'209.85.167.52'
	DOMAIN:'mail-lf1-f52.google.com' HELO:'mail-lf1-f52.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.167.52 mail-lf1-f52.google.com 209.85.167.52
	mail-lf1-f52.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v7 3/7] md: dm-crypt: infer ESSIV block cipher
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 02 Jul 2019 16:50:24 +0000 (UTC)

Instead of allocating a crypto skcipher tfm 'foo' and attempting to
infer the encapsulated block cipher from the driver's 'name' field,
directly parse the string that we used to allocated the tfm. These
are always identical (unless the allocation failed, in which case
we bail anyway), but using the string allows us to use it in the
allocation, which is something we will need when switching to the
'essiv' crypto API template.

Reviewed-by: Milan Broz <gmazyland@gmail.com>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/dm-crypt.c | 41 +++++++++-----------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 1b16d34bb785..3c17d588f6db 100644
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
@@ -2434,32 +2426,35 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 	if (*ivmode && !strcmp(*ivmode, "lmk"))
 		cc->tfms_count = 64;
 
-	cc->key_parts = cc->tfms_count;
-
-	/* Allocate cipher */
-	ret = crypt_alloc_tfms(cc, cipher_api);
-	if (ret < 0) {
-		ti->error = "Error allocating crypto tfm";
-		return ret;
-	}
-
 	/* Alloc AEAD, can be used only in new format. */
 	if (crypt_integrity_aead(cc)) {
 		ret = crypt_ctr_auth_cipher(cc, cipher_api);
 		if (ret < 0) {
 			ti->error = "Invalid AEAD cipher spec";
 			return -ENOMEM;
-		}
-		cc->iv_size = crypto_aead_ivsize(any_tfm_aead(cc));
-	} else
-		cc->iv_size = crypto_skcipher_ivsize(any_tfm(cc));
+	       }
+	}
 
-	ret = crypt_ctr_blkdev_cipher(cc);
+	ret = crypt_ctr_blkdev_cipher(cc, cipher_api);
 	if (ret < 0) {
 		ti->error = "Cannot allocate cipher string";
 		return -ENOMEM;
 	}
 
+	cc->key_parts = cc->tfms_count;
+
+	/* Allocate cipher */
+	ret = crypt_alloc_tfms(cc, cipher_api);
+	if (ret < 0) {
+		ti->error = "Error allocating crypto tfm";
+		return ret;
+	}
+
+	if (crypt_integrity_aead(cc))
+		cc->iv_size = crypto_aead_ivsize(any_tfm_aead(cc));
+	else
+		cc->iv_size = crypto_skcipher_ivsize(any_tfm(cc));
+
 	return 0;
 }
 
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
