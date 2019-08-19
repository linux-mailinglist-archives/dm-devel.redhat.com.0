Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D762392671
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 16:18:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 227D53175296;
	Mon, 19 Aug 2019 14:18:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EADBC1C930;
	Mon, 19 Aug 2019 14:18:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 873B5180BA9A;
	Mon, 19 Aug 2019 14:18:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JEIJkI012826 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 10:18:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 06BA01DA; Mon, 19 Aug 2019 14:18:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBE711DC
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 14:18:18 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA5768D5BB2
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 14:18:17 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id o4so1785799wmh.2
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TmnznT0hptKHz4ZiqoCAURLmBmT8IKpbKUZOSS9EXts=;
	b=k+j7hV4F10gOP4bMJkudPvXJal9wc7ostfNWhX69nckFbpPExiJV7p4QjTKfjoFZQq
	pInlW7RUfZyQMvHKjQBFuxcEWIOBMoZjrddkAw5Z49QLLWyIyv4g9jWwqj+GsH8pVfDb
	zJK8mvK7ncMm/PNWGQmVvM4Py1h/LjalRpAsU3UZVXU2SqAACHlHumAFDpBMbrd7/K0K
	iXV99u5zT9fRxJuEl45V7tEB68zI+Ayb6xzlT/CXN6BxQvactcGb3N0AVQse7Lg0DWvG
	wn5U0pfe7/gud+eK//rnDgb/9kg1H9TMCNrVDArXHAOXbGj20DOsFpZ+3ZcpCIYf0UD5
	EN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TmnznT0hptKHz4ZiqoCAURLmBmT8IKpbKUZOSS9EXts=;
	b=GXYFsFp9KDw4ww5rGnWrrDPovY7C2Pbg1z6Ka4GEtK8zgyXlAVbQ457Wt8L+h2cnh7
	mPJVCMcB2gqKzj9PUM320pV9OIJlRP5mVjqGSLfuALOLa/mcRTOa0eMOOLIL7jk3rdGO
	C7XeuYPl2CVUzeQA7wRBQWS7+kaX8FxgRXc6WjNfzCUIBjcVVVV7GU/Z8pFTHeZxaZOv
	Bzp1bX4kKkRrSm94lOfVK2eWI8hyKlqMYsek/y75d3HXVwODn1rkbWQk/ZLBaEIAsXjb
	mxLZ0lboYoRThS1Ezs82lQ3dbIlzqZ8NtPe7S3a/r+9FODDa+MUePN9Pe4TmY9Eio+BP
	llbA==
X-Gm-Message-State: APjAAAXO8fe0WNfDtU/AmMsEGfE4lz9Pbf9fzfXRke7CN4MrtRohaJ9T
	DxjwG/eVGo7ib3Thu1kqyYHnBQ==
X-Google-Smtp-Source: APXvYqxm4dAYSZtWJ/9uKMswwvikaruxT5nCAUBOTEXRHzwDMj/5FaK+RysVKFbVb1sMmEMW55L3FA==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr4087230wmc.169.1566224296584; 
	Mon, 19 Aug 2019 07:18:16 -0700 (PDT)
Received: from localhost.localdomain (11.172.185.81.rev.sfr.net.
	[81.185.172.11]) by smtp.gmail.com with ESMTPSA id
	b26sm12693352wmj.14.2019.08.19.07.18.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Aug 2019 07:18:15 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Mon, 19 Aug 2019 17:17:38 +0300
Message-Id: <20190819141738.1231-7-ard.biesheuvel@linaro.org>
In-Reply-To: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
References: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Mon, 19 Aug 2019 14:18:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Mon, 19 Aug 2019 14:18:18 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v13 6/6] md: dm-crypt: omit parsing of the
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 19 Aug 2019 14:18:24 +0000 (UTC)

Only the ESSIV IV generation mode used to use cc->cipher so it could
instantiate the bare cipher used to encrypt the IV. However, this is
now taken care of by the ESSIV template, and so no users of cc->cipher
remain. So remove it altogether.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/dm-crypt.c | 58 --------------------
 1 file changed, 58 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index e3e6e111edfc..0dd1fb027ac0 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -147,7 +147,6 @@ struct crypt_config {
 	struct task_struct *write_thread;
 	struct rb_root write_tree;
 
-	char *cipher;
 	char *cipher_string;
 	char *cipher_auth;
 	char *key_string;
@@ -2166,7 +2165,6 @@ static void crypt_dtr(struct dm_target *ti)
 	if (cc->dev)
 		dm_put_device(ti, cc->dev);
 
-	kzfree(cc->cipher);
 	kzfree(cc->cipher_string);
 	kzfree(cc->key_string);
 	kzfree(cc->cipher_auth);
@@ -2247,52 +2245,6 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
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
@@ -2402,12 +2354,6 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
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
 
@@ -2442,10 +2388,6 @@ static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key
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
