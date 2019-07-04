Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A71B65FCFF
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 20:32:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B14CFC18B2EE;
	Thu,  4 Jul 2019 18:32:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26005D1CC;
	Thu,  4 Jul 2019 18:32:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0B014EBC5;
	Thu,  4 Jul 2019 18:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x64IV0q1010327 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 14:31:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7D10176D7; Thu,  4 Jul 2019 18:31:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2B89176D5
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 18:30:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 896008667B
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 18:30:46 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b2so6282293wrx.11
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HomCk1VsjwBWm0dP9ApxcCmxBO/okyV8Fp4po7N++dQ=;
	b=JCPKfk7ZExLY06Ns+/JxSMk3qpW7waz8rQbYKrVyVsI7deea8HckVyvq4YL3XFrUbC
	xtsO0mTEttwgKRZGcIPG1l3UARCxTePSEmP4tYU2y0aHI+vsaS0T8Pk0Ljqmo3VKmmGN
	k8BePG67m7sg2re2lqDgG2ZmMO9QKmdRu19P9bDZrCS0ZpfhdfJ4Ryr5FVfDL/w8kd9F
	6xXFaA/dwRo0RgkwouDkK8KLbmbCq3x0Jy311vMRrDG+HUgFySh36N6LO6xkVji4y05t
	E29IBsgq/HEdkIvNZK4EGM9Y1IUaQW35zd5evMQPPfU2guPp5ubuCBPc2bJuS6iR+vXa
	P/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HomCk1VsjwBWm0dP9ApxcCmxBO/okyV8Fp4po7N++dQ=;
	b=SDTQoXIcHhz9Yzk3Z1PTYZmVyysJ5iZpAe/W4z2A4gfGG1KsbuJo8zNJo2wRGDDxmD
	YHwkJnKS/2tNzV/Q3Gjp0yr62nLwrwtZ3UJNO7sYeJYhnw9bNruj5vv+f2MeMGA3EFMP
	m6GgK38pYmu1hrWJmuDBBOESMs3ybXcf5kgQT9w47vAX7Kb/fyiSt5xzIMi6yGxyzUES
	wL1k5vBugF2uO1ExsFouya//0lcwy3Mq84F4/5gjS3NFkw20gITY7OvyZV0kHuS6PdQE
	7LoUKLKCsEwpPcB2NXNPd4EGA2HBERiRTFnD2oYagEIEZr8aaGN95rRFPH8BsW1zwqbU
	iaoA==
X-Gm-Message-State: APjAAAX/hE/PKhzB2BlcuWfo8MRT23OFUxw72cXOTmCGn+WvpoCaUiis
	HGaJIhvQYG0C+y33ouNLx41RiQ==
X-Google-Smtp-Source: APXvYqzq5Zds2jh431RjpslUcPSbnkuwn2SnCi51dyRaM8ylPkZ+ADGalrumBW7C+PPcVGKElno8NQ==
X-Received: by 2002:a5d:4403:: with SMTP id z3mr10882wrq.29.1562265045221;
	Thu, 04 Jul 2019 11:30:45 -0700 (PDT)
Received: from e111045-lin.arm.com (93-143-123-179.adsl.net.t-com.hr.
	[93.143.123.179]) by smtp.gmail.com with ESMTPSA id
	o6sm11114695wra.27.2019.07.04.11.30.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 11:30:44 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Thu,  4 Jul 2019 20:30:13 +0200
Message-Id: <20190704183017.31570-4-ard.biesheuvel@linaro.org>
In-Reply-To: <20190704183017.31570-1-ard.biesheuvel@linaro.org>
References: <20190704183017.31570-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 04 Jul 2019 18:30:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 04 Jul 2019 18:30:46 +0000 (UTC) for IP:'209.85.221.47'
	DOMAIN:'mail-wr1-f47.google.com' HELO:'mail-wr1-f47.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.21  (DKIM_INVALID, DKIM_SIGNED, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.221.47 mail-wr1-f47.google.com
	209.85.221.47 mail-wr1-f47.google.com
	<ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v8 3/7] md: dm-crypt: infer ESSIV block cipher
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 04 Jul 2019 18:32:12 +0000 (UTC)

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
