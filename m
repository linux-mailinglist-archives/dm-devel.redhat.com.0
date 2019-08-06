Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C03FF82D5D
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 10:03:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B12243082E57;
	Tue,  6 Aug 2019 08:03:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE6CB60CC0;
	Tue,  6 Aug 2019 08:03:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D5C5E203;
	Tue,  6 Aug 2019 08:03:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7682mkU018918 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 04:02:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B97D660F80; Tue,  6 Aug 2019 08:02:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F4260CC0
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 08:02:45 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0575E307C826
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 08:02:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c2so83657085wrm.8
	for <dm-devel@redhat.com>; Tue, 06 Aug 2019 01:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9eCxiU7trAIwWtoYhqWEWGHnQv1gzwh/Q9h6ScO5S58=;
	b=uGsaTM/M2gCO96HNT2CT+L0/NsYOQP5WwmmlN+ya7tI16k5RMO2HwcYWh6H6R3oYHm
	rAzdwy+lnPGdSNHSO1FV3Crk5TwyEYOTLawosrkK1bSB0Ypn33n9eBbZXhy9wY6QNR3S
	amR1DiMRY2rT94FVuPH5ZMNe0BS2+l9qybrY3769M6HE/Fi2yk/NyDTlLcmW4DDJfDRm
	8/3szwCVQVOO/b231zSJdRgRtJQTLJ/3KKLUxisOaBJpzZOBhiIZxOBqyS+o68pY/jBw
	KfuEtggPHIGXBSjQq6RTjYiXzRgy4LhaB1z90bfk5rsi782P9hTmgRJ/c8Be1kI77Sfj
	hwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9eCxiU7trAIwWtoYhqWEWGHnQv1gzwh/Q9h6ScO5S58=;
	b=IW2yUtlh3D92zRnENwur9xnzy5S93j0PbVg6nz+5SYyAXCEjx2U+bF0Z/69JbFdnWJ
	uOJsPZL69EbMjaoCARcYjvATaxY5YSGCSR35ThdqCe4N8m89nZDBIwgBFMhLR2Gbtrgw
	J6vF2kbgJNXre1ludMstZNkQPXr37uUWMKncXw8jQYpx8sBWVn31vIoss1UZ67NtnIcw
	eacTl6glRVHf0LlaIjMg5UeGd2SO4xsTFFiUFZSKsd4/13/pUEcg8HWGlPvuOtmNN3Sd
	LfG59wcvx2E7c6fRuhOSxy1xfKDAUZUByO6gJMXX1tPu43x5PID5XT7qccIkz9qIzEwy
	utKg==
X-Gm-Message-State: APjAAAWEOpmTB/26Vp67aAFFFpUfmIZSBslFOiA9AXBWKxVmbpkIuPXF
	QeQfsoBeuNUCiqFpqeLfX+UEtQ==
X-Google-Smtp-Source: APXvYqx3eVQe//5zmmtHda+AHpMkDhzZCnwtpz2EpeHXLmtnqf3YRw+KKwvbS6VL0M/WsBChtG66rg==
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr3054604wrt.182.1565078563578; 
	Tue, 06 Aug 2019 01:02:43 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:582f:8334:9cd9:7241])
	by smtp.gmail.com with ESMTPSA id
	g12sm123785475wrv.9.2019.08.06.01.02.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 01:02:42 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Tue,  6 Aug 2019 11:02:33 +0300
Message-Id: <20190806080234.27998-2-ard.biesheuvel@linaro.org>
In-Reply-To: <20190806080234.27998-1-ard.biesheuvel@linaro.org>
References: <20190806080234.27998-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 06 Aug 2019 08:02:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 06 Aug 2019 08:02:45 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: herbert@gondor.apana.org.au, snitzer@redhat.com,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, ebiggers@kernel.org,
	dm-devel@redhat.com, gmazyland@gmail.com, agk@redhat.com
Subject: [dm-devel] [RFC PATCH 1/2] md/dm-crypt - restrict EBOIV to cbc(aes)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 06 Aug 2019 08:03:30 +0000 (UTC)

Support for the EBOIV IV mode was introduced this cycle, and is
explicitly intended for interoperability with BitLocker, which
only uses it combined with AES in CBC mode.

Using EBOIV in combination with any other skcipher or aead mode
is not recommended, and so there is no need to support this.
However, the way the EBOIV support is currently integrated permits
it to be combined with other skcipher or aead modes, and once the
cat is out of the bag, we will need to support it indefinitely.

So let's restrict EBOIV to cbc(aes), and reject attempts to
instantiate it with other modes.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/md/dm-crypt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index d5216bcc4649..a5e8d5bc1581 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -861,6 +861,13 @@ static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
 	struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
 	struct crypto_cipher *tfm;
 
+	if (test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags) ||
+	    strcmp("cbc(aes)",
+	           crypto_tfm_alg_name(crypto_skcipher_tfm(any_tfm(cc))))) {
+		ti->error = "Unsupported encryption mode for EBOIV";
+		return -EINVAL;
+	}
+
 	tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
 	if (IS_ERR(tfm)) {
 		ti->error = "Error allocating crypto tfm for EBOIV";
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
