Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 104D441658B
	for <lists+dm-devel@lfdr.de>; Thu, 23 Sep 2021 20:57:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-sGnA3rHBPOaS-UDlb8ge7A-1; Thu, 23 Sep 2021 14:57:21 -0400
X-MC-Unique: sGnA3rHBPOaS-UDlb8ge7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB53F36300;
	Thu, 23 Sep 2021 18:57:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCF9218B5E;
	Thu, 23 Sep 2021 18:57:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 881AA1806D00;
	Thu, 23 Sep 2021 18:57:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18NIuu7C021946 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Sep 2021 14:56:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0891E208BDD3; Thu, 23 Sep 2021 18:56:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3D98208BDDC
	for <dm-devel@redhat.com>; Thu, 23 Sep 2021 18:56:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F638800B26
	for <dm-devel@redhat.com>; Thu, 23 Sep 2021 18:56:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-213-ZaHsSYOxODCOdh7tU6eO8Q-1;
	Thu, 23 Sep 2021 14:56:51 -0400
X-MC-Unique: ZaHsSYOxODCOdh7tU6eO8Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11C71610C8;
	Thu, 23 Sep 2021 18:56:50 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Thu, 23 Sep 2021 11:56:26 -0700
Message-Id: <20210923185629.54823-2-ebiggers@kernel.org>
In-Reply-To: <20210923185629.54823-1-ebiggers@kernel.org>
References: <20210923185629.54823-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, linux-scsi@vger.kernel.org,
	linux-mmc@vger.kernel.org, dm-devel@redhat.com,
	Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [PATCH v3 1/4] blk-crypto-fallback: properly prefix
	function and struct names
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

For clarity, avoid using just the "blk_crypto_" prefix for functions and
structs that are specific to blk-crypto-fallback.  Instead, use
"blk_crypto_fallback_".  Some places already did this, but others
didn't.

This is also a prerequisite for using "struct blk_crypto_keyslot" to
mean a generic blk-crypto keyslot (which is what it sounds like).
Rename the fallback one to "struct blk_crypto_fallback_keyslot".

No change in behavior.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/blk-crypto-fallback.c | 59 +++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index c322176a1e099..82b302597b474 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -72,7 +72,7 @@ static mempool_t *bio_fallback_crypt_ctx_pool;
 static DEFINE_MUTEX(tfms_init_lock);
 static bool tfms_inited[BLK_ENCRYPTION_MODE_MAX];
 
-static struct blk_crypto_keyslot {
+static struct blk_crypto_fallback_keyslot {
 	enum blk_crypto_mode_num crypto_mode;
 	struct crypto_skcipher *tfms[BLK_ENCRYPTION_MODE_MAX];
 } *blk_crypto_keyslots;
@@ -88,9 +88,9 @@ static struct bio_set crypto_bio_split;
  */
 static u8 blank_key[BLK_CRYPTO_MAX_KEY_SIZE];
 
-static void blk_crypto_evict_keyslot(unsigned int slot)
+static void blk_crypto_fallback_evict_keyslot(unsigned int slot)
 {
-	struct blk_crypto_keyslot *slotp = &blk_crypto_keyslots[slot];
+	struct blk_crypto_fallback_keyslot *slotp = &blk_crypto_keyslots[slot];
 	enum blk_crypto_mode_num crypto_mode = slotp->crypto_mode;
 	int err;
 
@@ -103,34 +103,34 @@ static void blk_crypto_evict_keyslot(unsigned int slot)
 	slotp->crypto_mode = BLK_ENCRYPTION_MODE_INVALID;
 }
 
-static int blk_crypto_keyslot_program(struct blk_keyslot_manager *ksm,
-				      const struct blk_crypto_key *key,
-				      unsigned int slot)
+static int blk_crypto_fallback_keyslot_program(struct blk_keyslot_manager *ksm,
+					       const struct blk_crypto_key *key,
+					       unsigned int slot)
 {
-	struct blk_crypto_keyslot *slotp = &blk_crypto_keyslots[slot];
+	struct blk_crypto_fallback_keyslot *slotp = &blk_crypto_keyslots[slot];
 	const enum blk_crypto_mode_num crypto_mode =
 						key->crypto_cfg.crypto_mode;
 	int err;
 
 	if (crypto_mode != slotp->crypto_mode &&
 	    slotp->crypto_mode != BLK_ENCRYPTION_MODE_INVALID)
-		blk_crypto_evict_keyslot(slot);
+		blk_crypto_fallback_evict_keyslot(slot);
 
 	slotp->crypto_mode = crypto_mode;
 	err = crypto_skcipher_setkey(slotp->tfms[crypto_mode], key->raw,
 				     key->size);
 	if (err) {
-		blk_crypto_evict_keyslot(slot);
+		blk_crypto_fallback_evict_keyslot(slot);
 		return err;
 	}
 	return 0;
 }
 
-static int blk_crypto_keyslot_evict(struct blk_keyslot_manager *ksm,
-				    const struct blk_crypto_key *key,
-				    unsigned int slot)
+static int blk_crypto_fallback_keyslot_evict(struct blk_keyslot_manager *ksm,
+					     const struct blk_crypto_key *key,
+					     unsigned int slot)
 {
-	blk_crypto_evict_keyslot(slot);
+	blk_crypto_fallback_evict_keyslot(slot);
 	return 0;
 }
 
@@ -140,8 +140,8 @@ static int blk_crypto_keyslot_evict(struct blk_keyslot_manager *ksm,
  * hardware.
  */
 static const struct blk_ksm_ll_ops blk_crypto_ksm_ll_ops = {
-	.keyslot_program	= blk_crypto_keyslot_program,
-	.keyslot_evict		= blk_crypto_keyslot_evict,
+	.keyslot_program	= blk_crypto_fallback_keyslot_program,
+	.keyslot_evict		= blk_crypto_fallback_keyslot_evict,
 };
 
 static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
@@ -159,7 +159,7 @@ static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
 	bio_endio(src_bio);
 }
 
-static struct bio *blk_crypto_clone_bio(struct bio *bio_src)
+static struct bio *blk_crypto_fallback_clone_bio(struct bio *bio_src)
 {
 	struct bvec_iter iter;
 	struct bio_vec bv;
@@ -186,12 +186,13 @@ static struct bio *blk_crypto_clone_bio(struct bio *bio_src)
 	return bio;
 }
 
-static bool blk_crypto_alloc_cipher_req(struct blk_ksm_keyslot *slot,
-					struct skcipher_request **ciph_req_ret,
-					struct crypto_wait *wait)
+static bool
+blk_crypto_fallback_alloc_cipher_req(struct blk_ksm_keyslot *slot,
+				     struct skcipher_request **ciph_req_ret,
+				     struct crypto_wait *wait)
 {
 	struct skcipher_request *ciph_req;
-	const struct blk_crypto_keyslot *slotp;
+	const struct blk_crypto_fallback_keyslot *slotp;
 	int keyslot_idx = blk_ksm_get_slot_idx(slot);
 
 	slotp = &blk_crypto_keyslots[keyslot_idx];
@@ -209,7 +210,7 @@ static bool blk_crypto_alloc_cipher_req(struct blk_ksm_keyslot *slot,
 	return true;
 }
 
-static bool blk_crypto_split_bio_if_needed(struct bio **bio_ptr)
+static bool blk_crypto_fallback_split_bio_if_needed(struct bio **bio_ptr)
 {
 	struct bio *bio = *bio_ptr;
 	unsigned int i = 0;
@@ -276,7 +277,7 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 	blk_status_t blk_st;
 
 	/* Split the bio if it's too big for single page bvec */
-	if (!blk_crypto_split_bio_if_needed(bio_ptr))
+	if (!blk_crypto_fallback_split_bio_if_needed(bio_ptr))
 		return false;
 
 	src_bio = *bio_ptr;
@@ -284,7 +285,7 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 	data_unit_size = bc->bc_key->crypto_cfg.data_unit_size;
 
 	/* Allocate bounce bio for encryption */
-	enc_bio = blk_crypto_clone_bio(src_bio);
+	enc_bio = blk_crypto_fallback_clone_bio(src_bio);
 	if (!enc_bio) {
 		src_bio->bi_status = BLK_STS_RESOURCE;
 		return false;
@@ -301,7 +302,7 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 	}
 
 	/* and then allocate an skcipher_request for it */
-	if (!blk_crypto_alloc_cipher_req(slot, &ciph_req, &wait)) {
+	if (!blk_crypto_fallback_alloc_cipher_req(slot, &ciph_req, &wait)) {
 		src_bio->bi_status = BLK_STS_RESOURCE;
 		goto out_release_keyslot;
 	}
@@ -403,7 +404,7 @@ static void blk_crypto_fallback_decrypt_bio(struct work_struct *work)
 	}
 
 	/* and then allocate an skcipher_request for it */
-	if (!blk_crypto_alloc_cipher_req(slot, &ciph_req, &wait)) {
+	if (!blk_crypto_fallback_alloc_cipher_req(slot, &ciph_req, &wait)) {
 		bio->bi_status = BLK_STS_RESOURCE;
 		goto out;
 	}
@@ -473,9 +474,9 @@ static void blk_crypto_fallback_decrypt_endio(struct bio *bio)
  * @bio_ptr: pointer to the bio to prepare
  *
  * If bio is doing a WRITE operation, this splits the bio into two parts if it's
- * too big (see blk_crypto_split_bio_if_needed). It then allocates a bounce bio
- * for the first part, encrypts it, and update bio_ptr to point to the bounce
- * bio.
+ * too big (see blk_crypto_fallback_split_bio_if_needed()). It then allocates a
+ * bounce bio for the first part, encrypts it, and updates bio_ptr to point to
+ * the bounce bio.
  *
  * For a READ operation, we mark the bio for decryption by using bi_private and
  * bi_end_io.
@@ -610,7 +611,7 @@ static int blk_crypto_fallback_init(void)
 int blk_crypto_fallback_start_using_mode(enum blk_crypto_mode_num mode_num)
 {
 	const char *cipher_str = blk_crypto_modes[mode_num].cipher_str;
-	struct blk_crypto_keyslot *slotp;
+	struct blk_crypto_fallback_keyslot *slotp;
 	unsigned int i;
 	int err = 0;
 
-- 
2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

