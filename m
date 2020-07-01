Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C16E6210329
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 06:54:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-MCtrON2QMUCHkxL4-p8TeQ-1; Wed, 01 Jul 2020 00:54:18 -0400
X-MC-Unique: MCtrON2QMUCHkxL4-p8TeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B25280572F;
	Wed,  1 Jul 2020 04:54:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27A166106A;
	Wed,  1 Jul 2020 04:54:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 518FF1809554;
	Wed,  1 Jul 2020 04:54:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0614qcTK008757 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 00:52:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8123E10A4F81; Wed,  1 Jul 2020 04:52:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48BE310A4F7C
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:52:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2602A8007B3
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 04:52:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-243-pX0ZxcdqOHmrAO03wUGEzQ-1;
	Wed, 01 Jul 2020 00:52:32 -0400
X-MC-Unique: pX0ZxcdqOHmrAO03wUGEzQ-1
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4F152207CD;
	Wed,  1 Jul 2020 04:52:30 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>, linux-crypto@vger.kernel.org
Date: Tue, 30 Jun 2020 21:52:17 -0700
Message-Id: <20200701045217.121126-7-ebiggers@kernel.org>
In-Reply-To: <20200701045217.121126-1-ebiggers@kernel.org>
References: <20200701045217.121126-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0614qcTK008757
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 6/6] dm-crypt: don't use drivers that have
	CRYPTO_ALG_ALLOCATES_MEMORY
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Mikulas Patocka <mpatocka@redhat.com>

Don't use crypto drivers that have the flag CRYPTO_ALG_ALLOCATES_MEMORY
set. These drivers allocate memory and thus they are unsuitable for block
I/O processing.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
---
 drivers/md/dm-crypt.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 000ddfab5ba0..7268faacbdf3 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -421,7 +421,8 @@ static int crypt_iv_lmk_ctr(struct crypt_config *cc, struct dm_target *ti,
 		return -EINVAL;
 	}
 
-	lmk->hash_tfm = crypto_alloc_shash("md5", 0, 0);
+	lmk->hash_tfm = crypto_alloc_shash("md5", 0,
+					   CRYPTO_ALG_ALLOCATES_MEMORY);
 	if (IS_ERR(lmk->hash_tfm)) {
 		ti->error = "Error initializing LMK hash";
 		return PTR_ERR(lmk->hash_tfm);
@@ -583,7 +584,8 @@ static int crypt_iv_tcw_ctr(struct crypt_config *cc, struct dm_target *ti,
 		return -EINVAL;
 	}
 
-	tcw->crc32_tfm = crypto_alloc_shash("crc32", 0, 0);
+	tcw->crc32_tfm = crypto_alloc_shash("crc32", 0,
+					    CRYPTO_ALG_ALLOCATES_MEMORY);
 	if (IS_ERR(tcw->crc32_tfm)) {
 		ti->error = "Error initializing CRC32 in TCW";
 		return PTR_ERR(tcw->crc32_tfm);
@@ -770,7 +772,8 @@ static int crypt_iv_elephant_ctr(struct crypt_config *cc, struct dm_target *ti,
 	struct iv_elephant_private *elephant = &cc->iv_gen_private.elephant;
 	int r;
 
-	elephant->tfm = crypto_alloc_skcipher("ecb(aes)", 0, 0);
+	elephant->tfm = crypto_alloc_skcipher("ecb(aes)", 0,
+					      CRYPTO_ALG_ALLOCATES_MEMORY);
 	if (IS_ERR(elephant->tfm)) {
 		r = PTR_ERR(elephant->tfm);
 		elephant->tfm = NULL;
@@ -2090,7 +2093,8 @@ static int crypt_alloc_tfms_skcipher(struct crypt_config *cc, char *ciphermode)
 		return -ENOMEM;
 
 	for (i = 0; i < cc->tfms_count; i++) {
-		cc->cipher_tfm.tfms[i] = crypto_alloc_skcipher(ciphermode, 0, 0);
+		cc->cipher_tfm.tfms[i] = crypto_alloc_skcipher(ciphermode, 0,
+						CRYPTO_ALG_ALLOCATES_MEMORY);
 		if (IS_ERR(cc->cipher_tfm.tfms[i])) {
 			err = PTR_ERR(cc->cipher_tfm.tfms[i]);
 			crypt_free_tfms(cc);
@@ -2116,7 +2120,8 @@ static int crypt_alloc_tfms_aead(struct crypt_config *cc, char *ciphermode)
 	if (!cc->cipher_tfm.tfms)
 		return -ENOMEM;
 
-	cc->cipher_tfm.tfms_aead[0] = crypto_alloc_aead(ciphermode, 0, 0);
+	cc->cipher_tfm.tfms_aead[0] = crypto_alloc_aead(ciphermode, 0,
+						CRYPTO_ALG_ALLOCATES_MEMORY);
 	if (IS_ERR(cc->cipher_tfm.tfms_aead[0])) {
 		err = PTR_ERR(cc->cipher_tfm.tfms_aead[0]);
 		crypt_free_tfms(cc);
@@ -2603,7 +2608,7 @@ static int crypt_ctr_auth_cipher(struct crypt_config *cc, char *cipher_api)
 		return -ENOMEM;
 	strncpy(mac_alg, start, end - start);
 
-	mac = crypto_alloc_ahash(mac_alg, 0, 0);
+	mac = crypto_alloc_ahash(mac_alg, 0, CRYPTO_ALG_ALLOCATES_MEMORY);
 	kfree(mac_alg);
 
 	if (IS_ERR(mac))
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

