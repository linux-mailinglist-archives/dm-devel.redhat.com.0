Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F5A8A1A8
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 16:54:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9281130EA1A9;
	Mon, 12 Aug 2019 14:54:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44A9380228;
	Mon, 12 Aug 2019 14:54:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D59A8E204;
	Mon, 12 Aug 2019 14:54:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7CErx9Z025044 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 10:53:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 044425D6B2; Mon, 12 Aug 2019 14:53:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABF275D704
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 14:53:56 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5EA1C3064FD4
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 14:53:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g67so12053976wme.1
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RPAXMF1cZCQBFyoO5A8Rg5Pyb4a0kwaVK9Utdlrc6bw=;
	b=HPd1I4UgBWiDtrDqP8Ibwq0bukCpSgD2COS1aF+OJautrHGb22YSz6iSzyREDD7/iU
	+8RHZSigttoAcV4j0A4x0NPM2Gc1eVLwnNdLZGqNXz7k55tir9Vfeebrn6byVb8fssmB
	aJt8sE3BGLbxRpw8XzNRSg9dwjt/faluQIM2oRa2YTLYpQS6yUF7c6TWGeMvQIOG6WV5
	EhxcX7W8sbfoE5+fOdz9xTut4arwIvhboa21yo1QN94hYf2Js7Mp8avqzVpvvz6GdP+H
	HmLGftm+HF6lDkAyS2bLhdetY9nz6kMccX0ZGOmYvwj1JHnX8dRCGCrcYIqn3rfqdROg
	RbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RPAXMF1cZCQBFyoO5A8Rg5Pyb4a0kwaVK9Utdlrc6bw=;
	b=cDXwqVGX33Hryz0jGsKQbywtraD7rB1v+45eFiQymgvXuT1zV9BkBmd+Fdi/e3PvWY
	5AiY2vXbfg4k+Js7ilCzBv/zaZGU5IxXRlBve7itcuvOvrcq3934MmpqIEvIiN4C2R5U
	zYl73u3B+2OGndiM1+Go4Y+nAJmyzGRN2DM3ppK/jMOLSZvfhWIsy3fqSGFifgdc0CrQ
	PxEhwxyl86f6iJpkT50fAl05Uq5gwELqd3Bq8zyRFkTKTVg+Y6MrWg6Pq8yWrWb4/neb
	MTvUIrI4Lp3TPptLeXN3j9LMHI9zjKkjTrI8oULXResZYFn0kanx5dMEPIoq+e5A7kVZ
	rEGg==
X-Gm-Message-State: APjAAAWbOjAsldCDkipBWS4P1zakHfSrhz3H3HbiOu+q3mrPg5s1eJK5
	A+byS8urkxQbCR8sCgQPfJyWsQ==
X-Google-Smtp-Source: APXvYqzsX9jGCzgbY3nph2SZ/NkCZDR8QVdOrP8Q0upsnGNRaqynD6WofTQaCwEM5IwdsBMfLcLCcQ==
X-Received: by 2002:a1c:760b:: with SMTP id r11mr28955527wmc.41.1565621634015; 
	Mon, 12 Aug 2019 07:53:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:1c0e:f938:89a1:8e17])
	by smtp.gmail.com with ESMTPSA id
	k13sm23369190wro.97.2019.08.12.07.53.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Aug 2019 07:53:53 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Mon, 12 Aug 2019 17:53:24 +0300
Message-Id: <20190812145324.27090-8-ard.biesheuvel@linaro.org>
In-Reply-To: <20190812145324.27090-1-ard.biesheuvel@linaro.org>
References: <20190812145324.27090-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 12 Aug 2019 14:53:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Mon, 12 Aug 2019 14:53:55 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.542  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v10 7/7] md: dm-crypt: omit parsing of the
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 12 Aug 2019 14:54:04 +0000 (UTC)

Only the ESSIV IV generation mode used to use cc->cipher so it could
instantiate the bare cipher used to encrypt the IV. However, this is
now taken care of by the ESSIV template, and so no users of cc->cipher
remain. So remove it altogether.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/dm-crypt.c | 58 --------------------
 1 file changed, 58 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index d44d24853aee..f87f6495652f 100644
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
@@ -2376,12 +2328,6 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
 	else
 		cc->iv_size = crypto_skcipher_ivsize(any_tfm(cc));
 
-	ret = crypt_ctr_blkdev_cipher(cc);
-	if (ret < 0) {
-		ti->error = "Cannot allocate cipher string";
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
@@ -2416,10 +2362,6 @@ static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key
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
