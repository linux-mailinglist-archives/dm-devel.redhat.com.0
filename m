Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E5432606
	for <lists+dm-devel@lfdr.de>; Mon, 18 Oct 2021 20:07:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Pw5JSoL7Oe-m1XQ8z1ugfg-1; Mon, 18 Oct 2021 14:07:01 -0400
X-MC-Unique: Pw5JSoL7Oe-m1XQ8z1ugfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D7F810A8E01;
	Mon, 18 Oct 2021 18:06:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E56017F72;
	Mon, 18 Oct 2021 18:06:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A3994E58E;
	Mon, 18 Oct 2021 18:06:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19II6egB016405 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 14:06:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFB2940D1B9D; Mon, 18 Oct 2021 18:06:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8B1C40C1257
	for <dm-devel@redhat.com>; Mon, 18 Oct 2021 18:06:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84BCD18A01A5
	for <dm-devel@redhat.com>; Mon, 18 Oct 2021 18:06:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-176-gT_tt2JTN26PCn3TCIeA8Q-1;
	Mon, 18 Oct 2021 14:06:35 -0400
X-MC-Unique: gT_tt2JTN26PCn3TCIeA8Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8959610C7;
	Mon, 18 Oct 2021 18:06:33 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Mon, 18 Oct 2021 11:04:52 -0700
Message-Id: <20211018180453.40441-4-ebiggers@kernel.org>
In-Reply-To: <20211018180453.40441-1-ebiggers@kernel.org>
References: <20211018180453.40441-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-scsi@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>, linux-mmc@vger.kernel.org,
	dm-devel@redhat.com, "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [dm-devel] [PATCH v6 3/4] blk-crypto: rename blk_keyslot_manager to
	blk_crypto_profile
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

blk_keyslot_manager is misnamed because it doesn't necessarily manage
keyslots.  It actually does several different things:

  - Contains the crypto capabilities of the device.

  - Provides functions to control the inline encryption hardware.
    Originally these were just for programming/evicting keyslots;
    however, new functionality (hardware-wrapped keys) will require new
    functions here which are unrelated to keyslots.  Moreover,
    device-mapper devices already (ab)use "keyslot_evict" to pass key
    eviction requests to their underlying devices even though
    device-mapper devices don't have any keyslots themselves (so it
    really should be "evict_key", not "keyslot_evict").

  - Sometimes (but not always!) it manages keyslots.  Originally it
    always did, but device-mapper devices don't have keyslots
    themselves, so they use a "passthrough keyslot manager" which
    doesn't actually manage keyslots.  This hack works, but the
    terminology is unnatural.  Also, some hardware doesn't have keyslots
    and thus also uses a "passthrough keyslot manager" (support for such
    hardware is yet to be upstreamed, but it will happen eventually).

Let's stop having keyslot managers which don't actually manage keyslots.
Instead, rename blk_keyslot_manager to blk_crypto_profile.

This is a fairly big change, since for consistency it also has to update
keyslot manager-related function names, variable names, and comments --
not just the actual struct name.  However it's still a fairly
straightforward change, as it doesn't change any actual functionality.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC
Reviewed-by: Mike Snitzer <snitzer@redhat.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/blk-crypto-fallback.c        |  71 ++--
 block/blk-crypto-profile.c         | 520 ++++++++++++++---------------
 block/blk-crypto.c                 |  27 +-
 block/blk-integrity.c              |   4 +-
 drivers/md/dm-core.h               |   2 +-
 drivers/md/dm-table.c              | 168 +++++-----
 drivers/md/dm.c                    |   8 +-
 drivers/mmc/core/crypto.c          |  11 +-
 drivers/mmc/host/cqhci-crypto.c    |  31 +-
 drivers/scsi/ufs/ufshcd-crypto.c   |  32 +-
 drivers/scsi/ufs/ufshcd-crypto.h   |   9 +-
 drivers/scsi/ufs/ufshcd.c          |   2 +-
 drivers/scsi/ufs/ufshcd.h          |   4 +-
 include/linux/blk-crypto-profile.h | 164 +++++----
 include/linux/blk-mq.h             |   2 +-
 include/linux/blkdev.h             |  16 +-
 include/linux/device-mapper.h      |   4 +-
 include/linux/mmc/host.h           |   2 +-
 18 files changed, 555 insertions(+), 522 deletions(-)

diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index 08bfea292c754..c87aba8584c64 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -78,7 +78,7 @@ static struct blk_crypto_fallback_keyslot {
 	struct crypto_skcipher *tfms[BLK_ENCRYPTION_MODE_MAX];
 } *blk_crypto_keyslots;
 
-static struct blk_keyslot_manager blk_crypto_ksm;
+static struct blk_crypto_profile blk_crypto_fallback_profile;
 static struct workqueue_struct *blk_crypto_wq;
 static mempool_t *blk_crypto_bounce_page_pool;
 static struct bio_set crypto_bio_split;
@@ -104,9 +104,10 @@ static void blk_crypto_fallback_evict_keyslot(unsigned int slot)
 	slotp->crypto_mode = BLK_ENCRYPTION_MODE_INVALID;
 }
 
-static int blk_crypto_fallback_keyslot_program(struct blk_keyslot_manager *ksm,
-					       const struct blk_crypto_key *key,
-					       unsigned int slot)
+static int
+blk_crypto_fallback_keyslot_program(struct blk_crypto_profile *profile,
+				    const struct blk_crypto_key *key,
+				    unsigned int slot)
 {
 	struct blk_crypto_fallback_keyslot *slotp = &blk_crypto_keyslots[slot];
 	const enum blk_crypto_mode_num crypto_mode =
@@ -127,7 +128,7 @@ static int blk_crypto_fallback_keyslot_program(struct blk_keyslot_manager *ksm,
 	return 0;
 }
 
-static int blk_crypto_fallback_keyslot_evict(struct blk_keyslot_manager *ksm,
+static int blk_crypto_fallback_keyslot_evict(struct blk_crypto_profile *profile,
 					     const struct blk_crypto_key *key,
 					     unsigned int slot)
 {
@@ -135,14 +136,9 @@ static int blk_crypto_fallback_keyslot_evict(struct blk_keyslot_manager *ksm,
 	return 0;
 }
 
-/*
- * The crypto API fallback KSM ops - only used for a bio when it specifies a
- * blk_crypto_key that was not supported by the device's inline encryption
- * hardware.
- */
-static const struct blk_ksm_ll_ops blk_crypto_ksm_ll_ops = {
-	.keyslot_program	= blk_crypto_fallback_keyslot_program,
-	.keyslot_evict		= blk_crypto_fallback_keyslot_evict,
+static const struct blk_crypto_ll_ops blk_crypto_fallback_ll_ops = {
+	.keyslot_program        = blk_crypto_fallback_keyslot_program,
+	.keyslot_evict          = blk_crypto_fallback_keyslot_evict,
 };
 
 static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
@@ -188,13 +184,13 @@ static struct bio *blk_crypto_fallback_clone_bio(struct bio *bio_src)
 }
 
 static bool
-blk_crypto_fallback_alloc_cipher_req(struct blk_ksm_keyslot *slot,
+blk_crypto_fallback_alloc_cipher_req(struct blk_crypto_keyslot *slot,
 				     struct skcipher_request **ciph_req_ret,
 				     struct crypto_wait *wait)
 {
 	struct skcipher_request *ciph_req;
 	const struct blk_crypto_fallback_keyslot *slotp;
-	int keyslot_idx = blk_ksm_get_slot_idx(slot);
+	int keyslot_idx = blk_crypto_keyslot_index(slot);
 
 	slotp = &blk_crypto_keyslots[keyslot_idx];
 	ciph_req = skcipher_request_alloc(slotp->tfms[slotp->crypto_mode],
@@ -266,7 +262,7 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 {
 	struct bio *src_bio, *enc_bio;
 	struct bio_crypt_ctx *bc;
-	struct blk_ksm_keyslot *slot;
+	struct blk_crypto_keyslot *slot;
 	int data_unit_size;
 	struct skcipher_request *ciph_req = NULL;
 	DECLARE_CRYPTO_WAIT(wait);
@@ -293,10 +289,11 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 	}
 
 	/*
-	 * Use the crypto API fallback keyslot manager to get a crypto_skcipher
-	 * for the algorithm and key specified for this bio.
+	 * Get a blk-crypto-fallback keyslot that contains a crypto_skcipher for
+	 * this bio's algorithm and key.
 	 */
-	blk_st = blk_ksm_get_slot_for_key(&blk_crypto_ksm, bc->bc_key, &slot);
+	blk_st = blk_crypto_get_keyslot(&blk_crypto_fallback_profile,
+					bc->bc_key, &slot);
 	if (blk_st != BLK_STS_OK) {
 		src_bio->bi_status = blk_st;
 		goto out_put_enc_bio;
@@ -364,7 +361,7 @@ static bool blk_crypto_fallback_encrypt_bio(struct bio **bio_ptr)
 out_free_ciph_req:
 	skcipher_request_free(ciph_req);
 out_release_keyslot:
-	blk_ksm_put_slot(slot);
+	blk_crypto_put_keyslot(slot);
 out_put_enc_bio:
 	if (enc_bio)
 		bio_put(enc_bio);
@@ -382,7 +379,7 @@ static void blk_crypto_fallback_decrypt_bio(struct work_struct *work)
 		container_of(work, struct bio_fallback_crypt_ctx, work);
 	struct bio *bio = f_ctx->bio;
 	struct bio_crypt_ctx *bc = &f_ctx->crypt_ctx;
-	struct blk_ksm_keyslot *slot;
+	struct blk_crypto_keyslot *slot;
 	struct skcipher_request *ciph_req = NULL;
 	DECLARE_CRYPTO_WAIT(wait);
 	u64 curr_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
@@ -395,10 +392,11 @@ static void blk_crypto_fallback_decrypt_bio(struct work_struct *work)
 	blk_status_t blk_st;
 
 	/*
-	 * Use the crypto API fallback keyslot manager to get a crypto_skcipher
-	 * for the algorithm and key specified for this bio.
+	 * Get a blk-crypto-fallback keyslot that contains a crypto_skcipher for
+	 * this bio's algorithm and key.
 	 */
-	blk_st = blk_ksm_get_slot_for_key(&blk_crypto_ksm, bc->bc_key, &slot);
+	blk_st = blk_crypto_get_keyslot(&blk_crypto_fallback_profile,
+					bc->bc_key, &slot);
 	if (blk_st != BLK_STS_OK) {
 		bio->bi_status = blk_st;
 		goto out_no_keyslot;
@@ -436,7 +434,7 @@ static void blk_crypto_fallback_decrypt_bio(struct work_struct *work)
 
 out:
 	skcipher_request_free(ciph_req);
-	blk_ksm_put_slot(slot);
+	blk_crypto_put_keyslot(slot);
 out_no_keyslot:
 	mempool_free(f_ctx, bio_fallback_crypt_ctx_pool);
 	bio_endio(bio);
@@ -501,8 +499,8 @@ bool blk_crypto_fallback_bio_prep(struct bio **bio_ptr)
 		return false;
 	}
 
-	if (!blk_ksm_crypto_cfg_supported(&blk_crypto_ksm,
-					  &bc->bc_key->crypto_cfg)) {
+	if (!__blk_crypto_cfg_supported(&blk_crypto_fallback_profile,
+					&bc->bc_key->crypto_cfg)) {
 		bio->bi_status = BLK_STS_NOTSUPP;
 		return false;
 	}
@@ -528,7 +526,7 @@ bool blk_crypto_fallback_bio_prep(struct bio **bio_ptr)
 
 int blk_crypto_fallback_evict_key(const struct blk_crypto_key *key)
 {
-	return blk_ksm_evict_key(&blk_crypto_ksm, key);
+	return __blk_crypto_evict_key(&blk_crypto_fallback_profile, key);
 }
 
 static bool blk_crypto_fallback_inited;
@@ -536,6 +534,7 @@ static int blk_crypto_fallback_init(void)
 {
 	int i;
 	int err;
+	struct blk_crypto_profile *profile = &blk_crypto_fallback_profile;
 
 	if (blk_crypto_fallback_inited)
 		return 0;
@@ -546,24 +545,24 @@ static int blk_crypto_fallback_init(void)
 	if (err)
 		goto out;
 
-	err = blk_ksm_init(&blk_crypto_ksm, blk_crypto_num_keyslots);
+	err = blk_crypto_profile_init(profile, blk_crypto_num_keyslots);
 	if (err)
 		goto fail_free_bioset;
 	err = -ENOMEM;
 
-	blk_crypto_ksm.ksm_ll_ops = blk_crypto_ksm_ll_ops;
-	blk_crypto_ksm.max_dun_bytes_supported = BLK_CRYPTO_MAX_IV_SIZE;
+	profile->ll_ops = blk_crypto_fallback_ll_ops;
+	profile->max_dun_bytes_supported = BLK_CRYPTO_MAX_IV_SIZE;
 
 	/* All blk-crypto modes have a crypto API fallback. */
 	for (i = 0; i < BLK_ENCRYPTION_MODE_MAX; i++)
-		blk_crypto_ksm.crypto_modes_supported[i] = 0xFFFFFFFF;
-	blk_crypto_ksm.crypto_modes_supported[BLK_ENCRYPTION_MODE_INVALID] = 0;
+		profile->modes_supported[i] = 0xFFFFFFFF;
+	profile->modes_supported[BLK_ENCRYPTION_MODE_INVALID] = 0;
 
 	blk_crypto_wq = alloc_workqueue("blk_crypto_wq",
 					WQ_UNBOUND | WQ_HIGHPRI |
 					WQ_MEM_RECLAIM, num_online_cpus());
 	if (!blk_crypto_wq)
-		goto fail_free_ksm;
+		goto fail_destroy_profile;
 
 	blk_crypto_keyslots = kcalloc(blk_crypto_num_keyslots,
 				      sizeof(blk_crypto_keyslots[0]),
@@ -597,8 +596,8 @@ static int blk_crypto_fallback_init(void)
 	kfree(blk_crypto_keyslots);
 fail_free_wq:
 	destroy_workqueue(blk_crypto_wq);
-fail_free_ksm:
-	blk_ksm_destroy(&blk_crypto_ksm);
+fail_destroy_profile:
+	blk_crypto_profile_destroy(profile);
 fail_free_bioset:
 	bioset_exit(&crypto_bio_split);
 out:
diff --git a/block/blk-crypto-profile.c b/block/blk-crypto-profile.c
index 1a235fa3c3e82..605ba0626a5c0 100644
--- a/block/blk-crypto-profile.c
+++ b/block/blk-crypto-profile.c
@@ -4,26 +4,22 @@
  */
 
 /**
- * DOC: The Keyslot Manager
+ * DOC: blk-crypto profiles
  *
- * Many devices with inline encryption support have a limited number of "slots"
- * into which encryption contexts may be programmed, and requests can be tagged
- * with a slot number to specify the key to use for en/decryption.
+ * 'struct blk_crypto_profile' contains all generic inline encryption-related
+ * state for a particular inline encryption device.  blk_crypto_profile serves
+ * as the way that drivers for inline encryption hardware expose their crypto
+ * capabilities and certain functions (e.g., functions to program and evict
+ * keys) to upper layers.  Device drivers that want to support inline encryption
+ * construct a crypto profile, then associate it with the disk's request_queue.
  *
- * As the number of slots is limited, and programming keys is expensive on
- * many inline encryption hardware, we don't want to program the same key into
- * multiple slots - if multiple requests are using the same key, we want to
- * program just one slot with that key and use that slot for all requests.
+ * If the device has keyslots, then its blk_crypto_profile also handles managing
+ * these keyslots in a device-independent way, using the driver-provided
+ * functions to program and evict keys as needed.  This includes keeping track
+ * of which key and how many I/O requests are using each keyslot, getting
+ * keyslots for I/O requests, and handling key eviction requests.
  *
- * The keyslot manager manages these keyslots appropriately, and also acts as
- * an abstraction between the inline encryption hardware and the upper layers.
- *
- * Lower layer devices will set up a keyslot manager in their request queue
- * and tell it how to perform device specific operations like programming/
- * evicting keys from keyslots.
- *
- * Upper layers will call blk_ksm_get_slot_for_key() to program a
- * key into some slot in the inline encryption hardware.
+ * For more information, see Documentation/block/inline-encryption.rst.
  */
 
 #define pr_fmt(fmt) "blk-crypto: " fmt
@@ -37,77 +33,75 @@
 #include <linux/blkdev.h>
 #include <linux/blk-integrity.h>
 
-struct blk_ksm_keyslot {
+struct blk_crypto_keyslot {
 	atomic_t slot_refs;
 	struct list_head idle_slot_node;
 	struct hlist_node hash_node;
 	const struct blk_crypto_key *key;
-	struct blk_keyslot_manager *ksm;
+	struct blk_crypto_profile *profile;
 };
 
-static inline void blk_ksm_hw_enter(struct blk_keyslot_manager *ksm)
+static inline void blk_crypto_hw_enter(struct blk_crypto_profile *profile)
 {
 	/*
-	 * Calling into the driver requires ksm->lock held and the device
+	 * Calling into the driver requires profile->lock held and the device
 	 * resumed.  But we must resume the device first, since that can acquire
-	 * and release ksm->lock via blk_ksm_reprogram_all_keys().
+	 * and release profile->lock via blk_crypto_reprogram_all_keys().
 	 */
-	if (ksm->dev)
-		pm_runtime_get_sync(ksm->dev);
-	down_write(&ksm->lock);
+	if (profile->dev)
+		pm_runtime_get_sync(profile->dev);
+	down_write(&profile->lock);
 }
 
-static inline void blk_ksm_hw_exit(struct blk_keyslot_manager *ksm)
+static inline void blk_crypto_hw_exit(struct blk_crypto_profile *profile)
 {
-	up_write(&ksm->lock);
-	if (ksm->dev)
-		pm_runtime_put_sync(ksm->dev);
-}
-
-static inline bool blk_ksm_is_passthrough(struct blk_keyslot_manager *ksm)
-{
-	return ksm->num_slots == 0;
+	up_write(&profile->lock);
+	if (profile->dev)
+		pm_runtime_put_sync(profile->dev);
 }
 
 /**
- * blk_ksm_init() - Initialize a keyslot manager
- * @ksm: The keyslot_manager to initialize.
- * @num_slots: The number of key slots to manage.
+ * blk_crypto_profile_init() - Initialize a blk_crypto_profile
+ * @profile: the blk_crypto_profile to initialize
+ * @num_slots: the number of keyslots
  *
- * Allocate memory for keyslots and initialize a keyslot manager. Called by
- * e.g. storage drivers to set up a keyslot manager in their request_queue.
+ * Storage drivers must call this when starting to set up a blk_crypto_profile,
+ * before filling in additional fields.
  *
  * Return: 0 on success, or else a negative error code.
  */
-int blk_ksm_init(struct blk_keyslot_manager *ksm, unsigned int num_slots)
+int blk_crypto_profile_init(struct blk_crypto_profile *profile,
+			    unsigned int num_slots)
 {
 	unsigned int slot;
 	unsigned int i;
 	unsigned int slot_hashtable_size;
 
-	memset(ksm, 0, sizeof(*ksm));
+	memset(profile, 0, sizeof(*profile));
+	init_rwsem(&profile->lock);
 
 	if (num_slots == 0)
-		return -EINVAL;
+		return 0;
 
-	ksm->slots = kvcalloc(num_slots, sizeof(ksm->slots[0]), GFP_KERNEL);
-	if (!ksm->slots)
-		return -ENOMEM;
+	/* Initialize keyslot management data. */
 
-	ksm->num_slots = num_slots;
+	profile->slots = kvcalloc(num_slots, sizeof(profile->slots[0]),
+				  GFP_KERNEL);
+	if (!profile->slots)
+		return -ENOMEM;
 
-	init_rwsem(&ksm->lock);
+	profile->num_slots = num_slots;
 
-	init_waitqueue_head(&ksm->idle_slots_wait_queue);
-	INIT_LIST_HEAD(&ksm->idle_slots);
+	init_waitqueue_head(&profile->idle_slots_wait_queue);
+	INIT_LIST_HEAD(&profile->idle_slots);
 
 	for (slot = 0; slot < num_slots; slot++) {
-		ksm->slots[slot].ksm = ksm;
-		list_add_tail(&ksm->slots[slot].idle_slot_node,
-			      &ksm->idle_slots);
+		profile->slots[slot].profile = profile;
+		list_add_tail(&profile->slots[slot].idle_slot_node,
+			      &profile->idle_slots);
 	}
 
-	spin_lock_init(&ksm->idle_slots_lock);
+	spin_lock_init(&profile->idle_slots_lock);
 
 	slot_hashtable_size = roundup_pow_of_two(num_slots);
 	/*
@@ -117,74 +111,80 @@ int blk_ksm_init(struct blk_keyslot_manager *ksm, unsigned int num_slots)
 	if (slot_hashtable_size < 2)
 		slot_hashtable_size = 2;
 
-	ksm->log_slot_ht_size = ilog2(slot_hashtable_size);
-	ksm->slot_hashtable = kvmalloc_array(slot_hashtable_size,
-					     sizeof(ksm->slot_hashtable[0]),
-					     GFP_KERNEL);
-	if (!ksm->slot_hashtable)
-		goto err_destroy_ksm;
+	profile->log_slot_ht_size = ilog2(slot_hashtable_size);
+	profile->slot_hashtable =
+		kvmalloc_array(slot_hashtable_size,
+			       sizeof(profile->slot_hashtable[0]), GFP_KERNEL);
+	if (!profile->slot_hashtable)
+		goto err_destroy;
 	for (i = 0; i < slot_hashtable_size; i++)
-		INIT_HLIST_HEAD(&ksm->slot_hashtable[i]);
+		INIT_HLIST_HEAD(&profile->slot_hashtable[i]);
 
 	return 0;
 
-err_destroy_ksm:
-	blk_ksm_destroy(ksm);
+err_destroy:
+	blk_crypto_profile_destroy(profile);
 	return -ENOMEM;
 }
-EXPORT_SYMBOL_GPL(blk_ksm_init);
+EXPORT_SYMBOL_GPL(blk_crypto_profile_init);
 
-static void blk_ksm_destroy_callback(void *ksm)
+static void blk_crypto_profile_destroy_callback(void *profile)
 {
-	blk_ksm_destroy(ksm);
+	blk_crypto_profile_destroy(profile);
 }
 
 /**
- * devm_blk_ksm_init() - Resource-managed blk_ksm_init()
- * @dev: The device which owns the blk_keyslot_manager.
- * @ksm: The blk_keyslot_manager to initialize.
- * @num_slots: The number of key slots to manage.
+ * devm_blk_crypto_profile_init() - Resource-managed blk_crypto_profile_init()
+ * @dev: the device which owns the blk_crypto_profile
+ * @profile: the blk_crypto_profile to initialize
+ * @num_slots: the number of keyslots
  *
- * Like blk_ksm_init(), but causes blk_ksm_destroy() to be called automatically
- * on driver detach.
+ * Like blk_crypto_profile_init(), but causes blk_crypto_profile_destroy() to be
+ * called automatically on driver detach.
  *
  * Return: 0 on success, or else a negative error code.
  */
-int devm_blk_ksm_init(struct device *dev, struct blk_keyslot_manager *ksm,
-		      unsigned int num_slots)
+int devm_blk_crypto_profile_init(struct device *dev,
+				 struct blk_crypto_profile *profile,
+				 unsigned int num_slots)
 {
-	int err = blk_ksm_init(ksm, num_slots);
+	int err = blk_crypto_profile_init(profile, num_slots);
 
 	if (err)
 		return err;
 
-	return devm_add_action_or_reset(dev, blk_ksm_destroy_callback, ksm);
+	return devm_add_action_or_reset(dev,
+					blk_crypto_profile_destroy_callback,
+					profile);
 }
-EXPORT_SYMBOL_GPL(devm_blk_ksm_init);
+EXPORT_SYMBOL_GPL(devm_blk_crypto_profile_init);
 
 static inline struct hlist_head *
-blk_ksm_hash_bucket_for_key(struct blk_keyslot_manager *ksm,
-			    const struct blk_crypto_key *key)
+blk_crypto_hash_bucket_for_key(struct blk_crypto_profile *profile,
+			       const struct blk_crypto_key *key)
 {
-	return &ksm->slot_hashtable[hash_ptr(key, ksm->log_slot_ht_size)];
+	return &profile->slot_hashtable[
+			hash_ptr(key, profile->log_slot_ht_size)];
 }
 
-static void blk_ksm_remove_slot_from_lru_list(struct blk_ksm_keyslot *slot)
+static void
+blk_crypto_remove_slot_from_lru_list(struct blk_crypto_keyslot *slot)
 {
-	struct blk_keyslot_manager *ksm = slot->ksm;
+	struct blk_crypto_profile *profile = slot->profile;
 	unsigned long flags;
 
-	spin_lock_irqsave(&ksm->idle_slots_lock, flags);
+	spin_lock_irqsave(&profile->idle_slots_lock, flags);
 	list_del(&slot->idle_slot_node);
-	spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
+	spin_unlock_irqrestore(&profile->idle_slots_lock, flags);
 }
 
-static struct blk_ksm_keyslot *blk_ksm_find_keyslot(
-					struct blk_keyslot_manager *ksm,
-					const struct blk_crypto_key *key)
+static struct blk_crypto_keyslot *
+blk_crypto_find_keyslot(struct blk_crypto_profile *profile,
+			const struct blk_crypto_key *key)
 {
-	const struct hlist_head *head = blk_ksm_hash_bucket_for_key(ksm, key);
-	struct blk_ksm_keyslot *slotp;
+	const struct hlist_head *head =
+		blk_crypto_hash_bucket_for_key(profile, key);
+	struct blk_crypto_keyslot *slotp;
 
 	hlist_for_each_entry(slotp, head, hash_node) {
 		if (slotp->key == key)
@@ -193,68 +193,79 @@ static struct blk_ksm_keyslot *blk_ksm_find_keyslot(
 	return NULL;
 }
 
-static struct blk_ksm_keyslot *blk_ksm_find_and_grab_keyslot(
-					struct blk_keyslot_manager *ksm,
-					const struct blk_crypto_key *key)
+static struct blk_crypto_keyslot *
+blk_crypto_find_and_grab_keyslot(struct blk_crypto_profile *profile,
+				 const struct blk_crypto_key *key)
 {
-	struct blk_ksm_keyslot *slot;
+	struct blk_crypto_keyslot *slot;
 
-	slot = blk_ksm_find_keyslot(ksm, key);
+	slot = blk_crypto_find_keyslot(profile, key);
 	if (!slot)
 		return NULL;
 	if (atomic_inc_return(&slot->slot_refs) == 1) {
 		/* Took first reference to this slot; remove it from LRU list */
-		blk_ksm_remove_slot_from_lru_list(slot);
+		blk_crypto_remove_slot_from_lru_list(slot);
 	}
 	return slot;
 }
 
-unsigned int blk_ksm_get_slot_idx(struct blk_ksm_keyslot *slot)
+/**
+ * blk_crypto_keyslot_index() - Get the index of a keyslot
+ * @slot: a keyslot that blk_crypto_get_keyslot() returned
+ *
+ * Return: the 0-based index of the keyslot within the device's keyslots.
+ */
+unsigned int blk_crypto_keyslot_index(struct blk_crypto_keyslot *slot)
 {
-	return slot - slot->ksm->slots;
+	return slot - slot->profile->slots;
 }
-EXPORT_SYMBOL_GPL(blk_ksm_get_slot_idx);
+EXPORT_SYMBOL_GPL(blk_crypto_keyslot_index);
 
 /**
- * blk_ksm_get_slot_for_key() - Program a key into a keyslot.
- * @ksm: The keyslot manager to program the key into.
- * @key: Pointer to the key object to program, including the raw key, crypto
- *	 mode, and data unit size.
- * @slot_ptr: A pointer to return the pointer of the allocated keyslot.
+ * blk_crypto_get_keyslot() - Get a keyslot for a key, if needed.
+ * @profile: the crypto profile of the device the key will be used on
+ * @key: the key that will be used
+ * @slot_ptr: If a keyslot is allocated, an opaque pointer to the keyslot struct
+ *	      will be stored here; otherwise NULL will be stored here.
+ *
+ * If the device has keyslots, this gets a keyslot that's been programmed with
+ * the specified key.  If the key is already in a slot, this reuses it;
+ * otherwise this waits for a slot to become idle and programs the key into it.
  *
- * Get a keyslot that's been programmed with the specified key.  If one already
- * exists, return it with incremented refcount.  Otherwise, wait for a keyslot
- * to become idle and program it.
+ * This must be paired with a call to blk_crypto_put_keyslot().
  *
- * Context: Process context. Takes and releases ksm->lock.
- * Return: BLK_STS_OK on success (and keyslot is set to the pointer of the
- *	   allocated keyslot), or some other blk_status_t otherwise (and
- *	   keyslot is set to NULL).
+ * Context: Process context. Takes and releases profile->lock.
+ * Return: BLK_STS_OK on success, meaning that either a keyslot was allocated or
+ *	   one wasn't needed; or a blk_status_t error on failure.
  */
-blk_status_t blk_ksm_get_slot_for_key(struct blk_keyslot_manager *ksm,
-				      const struct blk_crypto_key *key,
-				      struct blk_ksm_keyslot **slot_ptr)
+blk_status_t blk_crypto_get_keyslot(struct blk_crypto_profile *profile,
+				    const struct blk_crypto_key *key,
+				    struct blk_crypto_keyslot **slot_ptr)
 {
-	struct blk_ksm_keyslot *slot;
+	struct blk_crypto_keyslot *slot;
 	int slot_idx;
 	int err;
 
 	*slot_ptr = NULL;
 
-	if (blk_ksm_is_passthrough(ksm))
+	/*
+	 * If the device has no concept of "keyslots", then there is no need to
+	 * get one.
+	 */
+	if (profile->num_slots == 0)
 		return BLK_STS_OK;
 
-	down_read(&ksm->lock);
-	slot = blk_ksm_find_and_grab_keyslot(ksm, key);
-	up_read(&ksm->lock);
+	down_read(&profile->lock);
+	slot = blk_crypto_find_and_grab_keyslot(profile, key);
+	up_read(&profile->lock);
 	if (slot)
 		goto success;
 
 	for (;;) {
-		blk_ksm_hw_enter(ksm);
-		slot = blk_ksm_find_and_grab_keyslot(ksm, key);
+		blk_crypto_hw_enter(profile);
+		slot = blk_crypto_find_and_grab_keyslot(profile, key);
 		if (slot) {
-			blk_ksm_hw_exit(ksm);
+			blk_crypto_hw_exit(profile);
 			goto success;
 		}
 
@@ -262,22 +273,22 @@ blk_status_t blk_ksm_get_slot_for_key(struct blk_keyslot_manager *ksm,
 		 * If we're here, that means there wasn't a slot that was
 		 * already programmed with the key. So try to program it.
 		 */
-		if (!list_empty(&ksm->idle_slots))
+		if (!list_empty(&profile->idle_slots))
 			break;
 
-		blk_ksm_hw_exit(ksm);
-		wait_event(ksm->idle_slots_wait_queue,
-			   !list_empty(&ksm->idle_slots));
+		blk_crypto_hw_exit(profile);
+		wait_event(profile->idle_slots_wait_queue,
+			   !list_empty(&profile->idle_slots));
 	}
 
-	slot = list_first_entry(&ksm->idle_slots, struct blk_ksm_keyslot,
+	slot = list_first_entry(&profile->idle_slots, struct blk_crypto_keyslot,
 				idle_slot_node);
-	slot_idx = blk_ksm_get_slot_idx(slot);
+	slot_idx = blk_crypto_keyslot_index(slot);
 
-	err = ksm->ksm_ll_ops.keyslot_program(ksm, key, slot_idx);
+	err = profile->ll_ops.keyslot_program(profile, key, slot_idx);
 	if (err) {
-		wake_up(&ksm->idle_slots_wait_queue);
-		blk_ksm_hw_exit(ksm);
+		wake_up(&profile->idle_slots_wait_queue);
+		blk_crypto_hw_exit(profile);
 		return errno_to_blk_status(err);
 	}
 
@@ -285,97 +296,98 @@ blk_status_t blk_ksm_get_slot_for_key(struct blk_keyslot_manager *ksm,
 	if (slot->key)
 		hlist_del(&slot->hash_node);
 	slot->key = key;
-	hlist_add_head(&slot->hash_node, blk_ksm_hash_bucket_for_key(ksm, key));
+	hlist_add_head(&slot->hash_node,
+		       blk_crypto_hash_bucket_for_key(profile, key));
 
 	atomic_set(&slot->slot_refs, 1);
 
-	blk_ksm_remove_slot_from_lru_list(slot);
+	blk_crypto_remove_slot_from_lru_list(slot);
 
-	blk_ksm_hw_exit(ksm);
+	blk_crypto_hw_exit(profile);
 success:
 	*slot_ptr = slot;
 	return BLK_STS_OK;
 }
 
 /**
- * blk_ksm_put_slot() - Release a reference to a slot
- * @slot: The keyslot to release the reference of.
+ * blk_crypto_put_keyslot() - Release a reference to a keyslot
+ * @slot: The keyslot to release the reference of (may be NULL).
  *
  * Context: Any context.
  */
-void blk_ksm_put_slot(struct blk_ksm_keyslot *slot)
+void blk_crypto_put_keyslot(struct blk_crypto_keyslot *slot)
 {
-	struct blk_keyslot_manager *ksm;
+	struct blk_crypto_profile *profile;
 	unsigned long flags;
 
 	if (!slot)
 		return;
 
-	ksm = slot->ksm;
+	profile = slot->profile;
 
 	if (atomic_dec_and_lock_irqsave(&slot->slot_refs,
-					&ksm->idle_slots_lock, flags)) {
-		list_add_tail(&slot->idle_slot_node, &ksm->idle_slots);
-		spin_unlock_irqrestore(&ksm->idle_slots_lock, flags);
-		wake_up(&ksm->idle_slots_wait_queue);
+					&profile->idle_slots_lock, flags)) {
+		list_add_tail(&slot->idle_slot_node, &profile->idle_slots);
+		spin_unlock_irqrestore(&profile->idle_slots_lock, flags);
+		wake_up(&profile->idle_slots_wait_queue);
 	}
 }
 
 /**
- * blk_ksm_crypto_cfg_supported() - Find out if a crypto configuration is
- *				    supported by a ksm.
- * @ksm: The keyslot manager to check
- * @cfg: The crypto configuration to check for.
- *
- * Checks for crypto_mode/data unit size/dun bytes support.
+ * __blk_crypto_cfg_supported() - Check whether the given crypto profile
+ *				  supports the given crypto configuration.
+ * @profile: the crypto profile to check
+ * @cfg: the crypto configuration to check for
  *
- * Return: Whether or not this ksm supports the specified crypto config.
+ * Return: %true if @profile supports the given @cfg.
  */
-bool blk_ksm_crypto_cfg_supported(struct blk_keyslot_manager *ksm,
-				  const struct blk_crypto_config *cfg)
+bool __blk_crypto_cfg_supported(struct blk_crypto_profile *profile,
+				const struct blk_crypto_config *cfg)
 {
-	if (!ksm)
+	if (!profile)
 		return false;
-	if (!(ksm->crypto_modes_supported[cfg->crypto_mode] &
-	      cfg->data_unit_size))
+	if (!(profile->modes_supported[cfg->crypto_mode] & cfg->data_unit_size))
 		return false;
-	if (ksm->max_dun_bytes_supported < cfg->dun_bytes)
+	if (profile->max_dun_bytes_supported < cfg->dun_bytes)
 		return false;
 	return true;
 }
 
 /**
- * blk_ksm_evict_key() - Evict a key from the lower layer device.
- * @ksm: The keyslot manager to evict from
- * @key: The key to evict
+ * __blk_crypto_evict_key() - Evict a key from a device.
+ * @profile: the crypto profile of the device
+ * @key: the key to evict.  It must not still be used in any I/O.
+ *
+ * If the device has keyslots, this finds the keyslot (if any) that contains the
+ * specified key and calls the driver's keyslot_evict function to evict it.
  *
- * Find the keyslot that the specified key was programmed into, and evict that
- * slot from the lower layer device. The slot must not be in use by any
- * in-flight IO when this function is called.
+ * Otherwise, this just calls the driver's keyslot_evict function if it is
+ * implemented, passing just the key (without any particular keyslot).  This
+ * allows layered devices to evict the key from their underlying devices.
  *
- * Context: Process context. Takes and releases ksm->lock.
+ * Context: Process context. Takes and releases profile->lock.
  * Return: 0 on success or if there's no keyslot with the specified key, -EBUSY
  *	   if the keyslot is still in use, or another -errno value on other
  *	   error.
  */
-int blk_ksm_evict_key(struct blk_keyslot_manager *ksm,
-		      const struct blk_crypto_key *key)
+int __blk_crypto_evict_key(struct blk_crypto_profile *profile,
+			   const struct blk_crypto_key *key)
 {
-	struct blk_ksm_keyslot *slot;
+	struct blk_crypto_keyslot *slot;
 	int err = 0;
 
-	if (blk_ksm_is_passthrough(ksm)) {
-		if (ksm->ksm_ll_ops.keyslot_evict) {
-			blk_ksm_hw_enter(ksm);
-			err = ksm->ksm_ll_ops.keyslot_evict(ksm, key, -1);
-			blk_ksm_hw_exit(ksm);
+	if (profile->num_slots == 0) {
+		if (profile->ll_ops.keyslot_evict) {
+			blk_crypto_hw_enter(profile);
+			err = profile->ll_ops.keyslot_evict(profile, key, -1);
+			blk_crypto_hw_exit(profile);
 			return err;
 		}
 		return 0;
 	}
 
-	blk_ksm_hw_enter(ksm);
-	slot = blk_ksm_find_keyslot(ksm, key);
+	blk_crypto_hw_enter(profile);
+	slot = blk_crypto_find_keyslot(profile, key);
 	if (!slot)
 		goto out_unlock;
 
@@ -383,8 +395,8 @@ int blk_ksm_evict_key(struct blk_keyslot_manager *ksm,
 		err = -EBUSY;
 		goto out_unlock;
 	}
-	err = ksm->ksm_ll_ops.keyslot_evict(ksm, key,
-					    blk_ksm_get_slot_idx(slot));
+	err = profile->ll_ops.keyslot_evict(profile, key,
+					    blk_crypto_keyslot_index(slot));
 	if (err)
 		goto out_unlock;
 
@@ -392,81 +404,84 @@ int blk_ksm_evict_key(struct blk_keyslot_manager *ksm,
 	slot->key = NULL;
 	err = 0;
 out_unlock:
-	blk_ksm_hw_exit(ksm);
+	blk_crypto_hw_exit(profile);
 	return err;
 }
 
 /**
- * blk_ksm_reprogram_all_keys() - Re-program all keyslots.
- * @ksm: The keyslot manager
+ * blk_crypto_reprogram_all_keys() - Re-program all keyslots.
+ * @profile: The crypto profile
  *
  * Re-program all keyslots that are supposed to have a key programmed.  This is
  * intended only for use by drivers for hardware that loses its keys on reset.
  *
- * Context: Process context. Takes and releases ksm->lock.
+ * Context: Process context. Takes and releases profile->lock.
  */
-void blk_ksm_reprogram_all_keys(struct blk_keyslot_manager *ksm)
+void blk_crypto_reprogram_all_keys(struct blk_crypto_profile *profile)
 {
 	unsigned int slot;
 
-	if (blk_ksm_is_passthrough(ksm))
+	if (profile->num_slots == 0)
 		return;
 
 	/* This is for device initialization, so don't resume the device */
-	down_write(&ksm->lock);
-	for (slot = 0; slot < ksm->num_slots; slot++) {
-		const struct blk_crypto_key *key = ksm->slots[slot].key;
+	down_write(&profile->lock);
+	for (slot = 0; slot < profile->num_slots; slot++) {
+		const struct blk_crypto_key *key = profile->slots[slot].key;
 		int err;
 
 		if (!key)
 			continue;
 
-		err = ksm->ksm_ll_ops.keyslot_program(ksm, key, slot);
+		err = profile->ll_ops.keyslot_program(profile, key, slot);
 		WARN_ON(err);
 	}
-	up_write(&ksm->lock);
+	up_write(&profile->lock);
 }
-EXPORT_SYMBOL_GPL(blk_ksm_reprogram_all_keys);
+EXPORT_SYMBOL_GPL(blk_crypto_reprogram_all_keys);
 
-void blk_ksm_destroy(struct blk_keyslot_manager *ksm)
+void blk_crypto_profile_destroy(struct blk_crypto_profile *profile)
 {
-	if (!ksm)
+	if (!profile)
 		return;
-	kvfree(ksm->slot_hashtable);
-	kvfree_sensitive(ksm->slots, sizeof(ksm->slots[0]) * ksm->num_slots);
-	memzero_explicit(ksm, sizeof(*ksm));
+	kvfree(profile->slot_hashtable);
+	kvfree_sensitive(profile->slots,
+			 sizeof(profile->slots[0]) * profile->num_slots);
+	memzero_explicit(profile, sizeof(*profile));
 }
-EXPORT_SYMBOL_GPL(blk_ksm_destroy);
+EXPORT_SYMBOL_GPL(blk_crypto_profile_destroy);
 
-bool blk_ksm_register(struct blk_keyslot_manager *ksm, struct request_queue *q)
+bool blk_crypto_register(struct blk_crypto_profile *profile,
+			 struct request_queue *q)
 {
 	if (blk_integrity_queue_supports_integrity(q)) {
 		pr_warn("Integrity and hardware inline encryption are not supported together. Disabling hardware inline encryption.\n");
 		return false;
 	}
-	q->ksm = ksm;
+	q->crypto_profile = profile;
 	return true;
 }
-EXPORT_SYMBOL_GPL(blk_ksm_register);
+EXPORT_SYMBOL_GPL(blk_crypto_register);
 
-void blk_ksm_unregister(struct request_queue *q)
+void blk_crypto_unregister(struct request_queue *q)
 {
-	q->ksm = NULL;
+	q->crypto_profile = NULL;
 }
 
 /**
- * blk_ksm_intersect_modes() - restrict supported modes by child device
- * @parent: The keyslot manager for parent device
- * @child: The keyslot manager for child device, or NULL
+ * blk_crypto_intersect_capabilities() - restrict supported crypto capabilities
+ *					 by child device
+ * @parent: the crypto profile for the parent device
+ * @child: the crypto profile for the child device, or NULL
  *
- * Clear any crypto mode support bits in @parent that aren't set in @child.
- * If @child is NULL, then all parent bits are cleared.
+ * This clears all crypto capabilities in @parent that aren't set in @child.  If
+ * @child is NULL, then this clears all parent capabilities.
  *
- * Only use this when setting up the keyslot manager for a layered device,
- * before it's been exposed yet.
+ * Only use this when setting up the crypto profile for a layered device, before
+ * it's been exposed yet.
  */
-void blk_ksm_intersect_modes(struct blk_keyslot_manager *parent,
-			     const struct blk_keyslot_manager *child)
+void blk_crypto_intersect_capabilities(struct blk_crypto_profile *parent,
+				       const struct blk_crypto_profile *child)
 {
 	if (child) {
 		unsigned int i;
@@ -474,73 +489,63 @@ void blk_ksm_intersect_modes(struct blk_keyslot_manager *parent,
 		parent->max_dun_bytes_supported =
 			min(parent->max_dun_bytes_supported,
 			    child->max_dun_bytes_supported);
-		for (i = 0; i < ARRAY_SIZE(child->crypto_modes_supported);
-		     i++) {
-			parent->crypto_modes_supported[i] &=
-				child->crypto_modes_supported[i];
-		}
+		for (i = 0; i < ARRAY_SIZE(child->modes_supported); i++)
+			parent->modes_supported[i] &= child->modes_supported[i];
 	} else {
 		parent->max_dun_bytes_supported = 0;
-		memset(parent->crypto_modes_supported, 0,
-		       sizeof(parent->crypto_modes_supported));
+		memset(parent->modes_supported, 0,
+		       sizeof(parent->modes_supported));
 	}
 }
-EXPORT_SYMBOL_GPL(blk_ksm_intersect_modes);
+EXPORT_SYMBOL_GPL(blk_crypto_intersect_capabilities);
 
 /**
- * blk_ksm_is_superset() - Check if a KSM supports a superset of crypto modes
- *			   and DUN bytes that another KSM supports. Here,
- *			   "superset" refers to the mathematical meaning of the
- *			   word - i.e. if two KSMs have the *same* capabilities,
- *			   they *are* considered supersets of each other.
- * @ksm_superset: The KSM that we want to verify is a superset
- * @ksm_subset: The KSM that we want to verify is a subset
+ * blk_crypto_has_capabilities() - Check whether @target supports at least all
+ *				   the crypto capabilities that @reference does.
+ * @target: the target profile
+ * @reference: the reference profile
  *
- * Return: True if @ksm_superset supports a superset of the crypto modes and DUN
- *	   bytes that @ksm_subset supports.
+ * Return: %true if @target supports all the crypto capabilities of @reference.
  */
-bool blk_ksm_is_superset(struct blk_keyslot_manager *ksm_superset,
-			 struct blk_keyslot_manager *ksm_subset)
+bool blk_crypto_has_capabilities(const struct blk_crypto_profile *target,
+				 const struct blk_crypto_profile *reference)
 {
 	int i;
 
-	if (!ksm_subset)
+	if (!reference)
 		return true;
 
-	if (!ksm_superset)
+	if (!target)
 		return false;
 
-	for (i = 0; i < ARRAY_SIZE(ksm_superset->crypto_modes_supported); i++) {
-		if (ksm_subset->crypto_modes_supported[i] &
-		    (~ksm_superset->crypto_modes_supported[i])) {
+	for (i = 0; i < ARRAY_SIZE(target->modes_supported); i++) {
+		if (reference->modes_supported[i] & ~target->modes_supported[i])
 			return false;
-		}
 	}
 
-	if (ksm_subset->max_dun_bytes_supported >
-	    ksm_superset->max_dun_bytes_supported) {
+	if (reference->max_dun_bytes_supported >
+	    target->max_dun_bytes_supported)
 		return false;
-	}
 
 	return true;
 }
-EXPORT_SYMBOL_GPL(blk_ksm_is_superset);
+EXPORT_SYMBOL_GPL(blk_crypto_has_capabilities);
 
 /**
- * blk_ksm_update_capabilities() - Update the restrictions of a KSM to those of
- *				   another KSM
- * @target_ksm: The KSM whose restrictions to update.
- * @reference_ksm: The KSM to whose restrictions this function will update
- *		   @target_ksm's restrictions to.
+ * blk_crypto_update_capabilities() - Update the capabilities of a crypto
+ *				      profile to match those of another crypto
+ *				      profile.
+ * @dst: The crypto profile whose capabilities to update.
+ * @src: The crypto profile whose capabilities this function will update @dst's
+ *	 capabilities to.
  *
  * Blk-crypto requires that crypto capabilities that were
  * advertised when a bio was created continue to be supported by the
  * device until that bio is ended. This is turn means that a device cannot
  * shrink its advertised crypto capabilities without any explicit
  * synchronization with upper layers. So if there's no such explicit
- * synchronization, @reference_ksm must support all the crypto capabilities that
- * @target_ksm does
- * (i.e. we need blk_ksm_is_superset(@reference_ksm, @target_ksm) == true).
+ * synchronization, @src must support all the crypto capabilities that
+ * @dst does (i.e. we need blk_crypto_has_capabilities(@src, @dst)).
  *
  * Note also that as long as the crypto capabilities are being expanded, the
  * order of updates becoming visible is not important because it's alright
@@ -549,31 +554,12 @@ EXPORT_SYMBOL_GPL(blk_ksm_is_superset);
  * might result in blk-crypto-fallback being used if available, or the bio being
  * failed).
  */
-void blk_ksm_update_capabilities(struct blk_keyslot_manager *target_ksm,
-				 struct blk_keyslot_manager *reference_ksm)
+void blk_crypto_update_capabilities(struct blk_crypto_profile *dst,
+				    const struct blk_crypto_profile *src)
 {
-	memcpy(target_ksm->crypto_modes_supported,
-	       reference_ksm->crypto_modes_supported,
-	       sizeof(target_ksm->crypto_modes_supported));
+	memcpy(dst->modes_supported, src->modes_supported,
+	       sizeof(dst->modes_supported));
 
-	target_ksm->max_dun_bytes_supported =
-				reference_ksm->max_dun_bytes_supported;
-}
-EXPORT_SYMBOL_GPL(blk_ksm_update_capabilities);
-
-/**
- * blk_ksm_init_passthrough() - Init a passthrough keyslot manager
- * @ksm: The keyslot manager to init
- *
- * Initialize a passthrough keyslot manager.
- * Called by e.g. storage drivers to set up a keyslot manager in their
- * request_queue, when the storage driver wants to manage its keys by itself.
- * This is useful for inline encryption hardware that doesn't have the concept
- * of keyslots, and for layered devices.
- */
-void blk_ksm_init_passthrough(struct blk_keyslot_manager *ksm)
-{
-	memset(ksm, 0, sizeof(*ksm));
-	init_rwsem(&ksm->lock);
+	dst->max_dun_bytes_supported = src->max_dun_bytes_supported;
 }
-EXPORT_SYMBOL_GPL(blk_ksm_init_passthrough);
+EXPORT_SYMBOL_GPL(blk_crypto_update_capabilities);
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 76ce7a5d2676b..ec9efeeeca918 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -218,8 +218,9 @@ static bool bio_crypt_check_alignment(struct bio *bio)
 
 blk_status_t __blk_crypto_init_request(struct request *rq)
 {
-	return blk_ksm_get_slot_for_key(rq->q->ksm, rq->crypt_ctx->bc_key,
-					&rq->crypt_keyslot);
+	return blk_crypto_get_keyslot(rq->q->crypto_profile,
+				      rq->crypt_ctx->bc_key,
+				      &rq->crypt_keyslot);
 }
 
 /**
@@ -233,7 +234,7 @@ blk_status_t __blk_crypto_init_request(struct request *rq)
  */
 void __blk_crypto_free_request(struct request *rq)
 {
-	blk_ksm_put_slot(rq->crypt_keyslot);
+	blk_crypto_put_keyslot(rq->crypt_keyslot);
 	mempool_free(rq->crypt_ctx, bio_crypt_ctx_pool);
 	blk_crypto_rq_set_defaults(rq);
 }
@@ -264,6 +265,7 @@ bool __blk_crypto_bio_prep(struct bio **bio_ptr)
 {
 	struct bio *bio = *bio_ptr;
 	const struct blk_crypto_key *bc_key = bio->bi_crypt_context->bc_key;
+	struct blk_crypto_profile *profile;
 
 	/* Error if bio has no data. */
 	if (WARN_ON_ONCE(!bio_has_data(bio))) {
@@ -280,8 +282,8 @@ bool __blk_crypto_bio_prep(struct bio **bio_ptr)
 	 * Success if device supports the encryption context, or if we succeeded
 	 * in falling back to the crypto API.
 	 */
-	if (blk_ksm_crypto_cfg_supported(bdev_get_queue(bio->bi_bdev)->ksm,
-					 &bc_key->crypto_cfg))
+	profile = bdev_get_queue(bio->bi_bdev)->crypto_profile;
+	if (__blk_crypto_cfg_supported(profile, &bc_key->crypto_cfg))
 		return true;
 
 	if (blk_crypto_fallback_bio_prep(bio_ptr))
@@ -357,7 +359,7 @@ bool blk_crypto_config_supported(struct request_queue *q,
 				 const struct blk_crypto_config *cfg)
 {
 	return IS_ENABLED(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) ||
-	       blk_ksm_crypto_cfg_supported(q->ksm, cfg);
+	       __blk_crypto_cfg_supported(q->crypto_profile, cfg);
 }
 
 /**
@@ -378,7 +380,7 @@ bool blk_crypto_config_supported(struct request_queue *q,
 int blk_crypto_start_using_key(const struct blk_crypto_key *key,
 			       struct request_queue *q)
 {
-	if (blk_ksm_crypto_cfg_supported(q->ksm, &key->crypto_cfg))
+	if (__blk_crypto_cfg_supported(q->crypto_profile, &key->crypto_cfg))
 		return 0;
 	return blk_crypto_fallback_start_using_mode(key->crypto_cfg.crypto_mode);
 }
@@ -394,18 +396,17 @@ int blk_crypto_start_using_key(const struct blk_crypto_key *key,
  * evicted from any hardware that it might have been programmed into.  The key
  * must not be in use by any in-flight IO when this function is called.
  *
- * Return: 0 on success or if key is not present in the q's ksm, -err on error.
+ * Return: 0 on success or if the key wasn't in any keyslot; -errno on error.
  */
 int blk_crypto_evict_key(struct request_queue *q,
 			 const struct blk_crypto_key *key)
 {
-	if (blk_ksm_crypto_cfg_supported(q->ksm, &key->crypto_cfg))
-		return blk_ksm_evict_key(q->ksm, key);
+	if (__blk_crypto_cfg_supported(q->crypto_profile, &key->crypto_cfg))
+		return __blk_crypto_evict_key(q->crypto_profile, key);
 
 	/*
-	 * If the request queue's associated inline encryption hardware didn't
-	 * have support for the key, then the key might have been programmed
-	 * into the fallback keyslot manager, so try to evict from there.
+	 * If the request_queue didn't support the key, then blk-crypto-fallback
+	 * may have been used, so try to evict the key from blk-crypto-fallback.
 	 */
 	return blk_crypto_fallback_evict_key(key);
 }
diff --git a/block/blk-integrity.c b/block/blk-integrity.c
index cef534a7cbc98..d670d54e5f7ac 100644
--- a/block/blk-integrity.c
+++ b/block/blk-integrity.c
@@ -409,9 +409,9 @@ void blk_integrity_register(struct gendisk *disk, struct blk_integrity *template
 	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, disk->queue);
 
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
-	if (disk->queue->ksm) {
+	if (disk->queue->crypto_profile) {
 		pr_warn("blk-integrity: Integrity and hardware inline encryption are not supported together. Disabling hardware inline encryption.\n");
-		blk_ksm_unregister(disk->queue);
+		blk_crypto_unregister(disk->queue);
 	}
 #endif
 }
diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index 841ed87999e79..b855fef4f38a6 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -200,7 +200,7 @@ struct dm_table {
 	struct dm_md_mempools *mempools;
 
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
-	struct blk_keyslot_manager *ksm;
+	struct blk_crypto_profile *crypto_profile;
 #endif
 };
 
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index d95142102bd25..bcddc5effd155 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -170,7 +170,7 @@ static void free_devices(struct list_head *devices, struct mapped_device *md)
 	}
 }
 
-static void dm_table_destroy_keyslot_manager(struct dm_table *t);
+static void dm_table_destroy_crypto_profile(struct dm_table *t);
 
 void dm_table_destroy(struct dm_table *t)
 {
@@ -200,7 +200,7 @@ void dm_table_destroy(struct dm_table *t)
 
 	dm_free_md_mempools(t->mempools);
 
-	dm_table_destroy_keyslot_manager(t);
+	dm_table_destroy_crypto_profile(t);
 
 	kfree(t);
 }
@@ -1186,8 +1186,8 @@ static int dm_table_register_integrity(struct dm_table *t)
 
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
 
-struct dm_keyslot_manager {
-	struct blk_keyslot_manager ksm;
+struct dm_crypto_profile {
+	struct blk_crypto_profile profile;
 	struct mapped_device *md;
 };
 
@@ -1213,13 +1213,11 @@ static int dm_keyslot_evict_callback(struct dm_target *ti, struct dm_dev *dev,
  * When an inline encryption key is evicted from a device-mapper device, evict
  * it from all the underlying devices.
  */
-static int dm_keyslot_evict(struct blk_keyslot_manager *ksm,
+static int dm_keyslot_evict(struct blk_crypto_profile *profile,
 			    const struct blk_crypto_key *key, unsigned int slot)
 {
-	struct dm_keyslot_manager *dksm = container_of(ksm,
-						       struct dm_keyslot_manager,
-						       ksm);
-	struct mapped_device *md = dksm->md;
+	struct mapped_device *md =
+		container_of(profile, struct dm_crypto_profile, profile)->md;
 	struct dm_keyslot_evict_args args = { key };
 	struct dm_table *t;
 	int srcu_idx;
@@ -1239,150 +1237,148 @@ static int dm_keyslot_evict(struct blk_keyslot_manager *ksm,
 	return args.err;
 }
 
-static const struct blk_ksm_ll_ops dm_ksm_ll_ops = {
-	.keyslot_evict = dm_keyslot_evict,
-};
-
-static int device_intersect_crypto_modes(struct dm_target *ti,
-					 struct dm_dev *dev, sector_t start,
-					 sector_t len, void *data)
+static int
+device_intersect_crypto_capabilities(struct dm_target *ti, struct dm_dev *dev,
+				     sector_t start, sector_t len, void *data)
 {
-	struct blk_keyslot_manager *parent = data;
-	struct blk_keyslot_manager *child = bdev_get_queue(dev->bdev)->ksm;
+	struct blk_crypto_profile *parent = data;
+	struct blk_crypto_profile *child =
+		bdev_get_queue(dev->bdev)->crypto_profile;
 
-	blk_ksm_intersect_modes(parent, child);
+	blk_crypto_intersect_capabilities(parent, child);
 	return 0;
 }
 
-void dm_destroy_keyslot_manager(struct blk_keyslot_manager *ksm)
+void dm_destroy_crypto_profile(struct blk_crypto_profile *profile)
 {
-	struct dm_keyslot_manager *dksm = container_of(ksm,
-						       struct dm_keyslot_manager,
-						       ksm);
+	struct dm_crypto_profile *dmcp = container_of(profile,
+						      struct dm_crypto_profile,
+						      profile);
 
-	if (!ksm)
+	if (!profile)
 		return;
 
-	blk_ksm_destroy(ksm);
-	kfree(dksm);
+	blk_crypto_profile_destroy(profile);
+	kfree(dmcp);
 }
 
-static void dm_table_destroy_keyslot_manager(struct dm_table *t)
+static void dm_table_destroy_crypto_profile(struct dm_table *t)
 {
-	dm_destroy_keyslot_manager(t->ksm);
-	t->ksm = NULL;
+	dm_destroy_crypto_profile(t->crypto_profile);
+	t->crypto_profile = NULL;
 }
 
 /*
- * Constructs and initializes t->ksm with a keyslot manager that
- * represents the common set of crypto capabilities of the devices
- * described by the dm_table. However, if the constructed keyslot
- * manager does not support a superset of the crypto capabilities
- * supported by the current keyslot manager of the mapped_device,
- * it returns an error instead, since we don't support restricting
- * crypto capabilities on table changes. Finally, if the constructed
- * keyslot manager doesn't actually support any crypto modes at all,
- * it just returns NULL.
+ * Constructs and initializes t->crypto_profile with a crypto profile that
+ * represents the common set of crypto capabilities of the devices described by
+ * the dm_table.  However, if the constructed crypto profile doesn't support all
+ * crypto capabilities that are supported by the current mapped_device, it
+ * returns an error instead, since we don't support removing crypto capabilities
+ * on table changes.  Finally, if the constructed crypto profile is "empty" (has
+ * no crypto capabilities at all), it just sets t->crypto_profile to NULL.
  */
-static int dm_table_construct_keyslot_manager(struct dm_table *t)
+static int dm_table_construct_crypto_profile(struct dm_table *t)
 {
-	struct dm_keyslot_manager *dksm;
-	struct blk_keyslot_manager *ksm;
+	struct dm_crypto_profile *dmcp;
+	struct blk_crypto_profile *profile;
 	struct dm_target *ti;
 	unsigned int i;
-	bool ksm_is_empty = true;
+	bool empty_profile = true;
 
-	dksm = kmalloc(sizeof(*dksm), GFP_KERNEL);
-	if (!dksm)
+	dmcp = kmalloc(sizeof(*dmcp), GFP_KERNEL);
+	if (!dmcp)
 		return -ENOMEM;
-	dksm->md = t->md;
+	dmcp->md = t->md;
 
-	ksm = &dksm->ksm;
-	blk_ksm_init_passthrough(ksm);
-	ksm->ksm_ll_ops = dm_ksm_ll_ops;
-	ksm->max_dun_bytes_supported = UINT_MAX;
-	memset(ksm->crypto_modes_supported, 0xFF,
-	       sizeof(ksm->crypto_modes_supported));
+	profile = &dmcp->profile;
+	blk_crypto_profile_init(profile, 0);
+	profile->ll_ops.keyslot_evict = dm_keyslot_evict;
+	profile->max_dun_bytes_supported = UINT_MAX;
+	memset(profile->modes_supported, 0xFF,
+	       sizeof(profile->modes_supported));
 
 	for (i = 0; i < dm_table_get_num_targets(t); i++) {
 		ti = dm_table_get_target(t, i);
 
 		if (!dm_target_passes_crypto(ti->type)) {
-			blk_ksm_intersect_modes(ksm, NULL);
+			blk_crypto_intersect_capabilities(profile, NULL);
 			break;
 		}
 		if (!ti->type->iterate_devices)
 			continue;
-		ti->type->iterate_devices(ti, device_intersect_crypto_modes,
-					  ksm);
+		ti->type->iterate_devices(ti,
+					  device_intersect_crypto_capabilities,
+					  profile);
 	}
 
-	if (t->md->queue && !blk_ksm_is_superset(ksm, t->md->queue->ksm)) {
+	if (t->md->queue &&
+	    !blk_crypto_has_capabilities(profile,
+					 t->md->queue->crypto_profile)) {
 		DMWARN("Inline encryption capabilities of new DM table were more restrictive than the old table's. This is not supported!");
-		dm_destroy_keyslot_manager(ksm);
+		dm_destroy_crypto_profile(profile);
 		return -EINVAL;
 	}
 
 	/*
-	 * If the new KSM doesn't actually support any crypto modes, we may as
-	 * well represent it with a NULL ksm.
+	 * If the new profile doesn't actually support any crypto capabilities,
+	 * we may as well represent it with a NULL profile.
 	 */
-	ksm_is_empty = true;
-	for (i = 0; i < ARRAY_SIZE(ksm->crypto_modes_supported); i++) {
-		if (ksm->crypto_modes_supported[i]) {
-			ksm_is_empty = false;
+	for (i = 0; i < ARRAY_SIZE(profile->modes_supported); i++) {
+		if (profile->modes_supported[i]) {
+			empty_profile = false;
 			break;
 		}
 	}
 
-	if (ksm_is_empty) {
-		dm_destroy_keyslot_manager(ksm);
-		ksm = NULL;
+	if (empty_profile) {
+		dm_destroy_crypto_profile(profile);
+		profile = NULL;
 	}
 
 	/*
-	 * t->ksm is only set temporarily while the table is being set
-	 * up, and it gets set to NULL after the capabilities have
-	 * been transferred to the request_queue.
+	 * t->crypto_profile is only set temporarily while the table is being
+	 * set up, and it gets set to NULL after the profile has been
+	 * transferred to the request_queue.
 	 */
-	t->ksm = ksm;
+	t->crypto_profile = profile;
 
 	return 0;
 }
 
-static void dm_update_keyslot_manager(struct request_queue *q,
-				      struct dm_table *t)
+static void dm_update_crypto_profile(struct request_queue *q,
+				     struct dm_table *t)
 {
-	if (!t->ksm)
+	if (!t->crypto_profile)
 		return;
 
-	/* Make the ksm less restrictive */
-	if (!q->ksm) {
-		blk_ksm_register(t->ksm, q);
+	/* Make the crypto profile less restrictive. */
+	if (!q->crypto_profile) {
+		blk_crypto_register(t->crypto_profile, q);
 	} else {
-		blk_ksm_update_capabilities(q->ksm, t->ksm);
-		dm_destroy_keyslot_manager(t->ksm);
+		blk_crypto_update_capabilities(q->crypto_profile,
+					       t->crypto_profile);
+		dm_destroy_crypto_profile(t->crypto_profile);
 	}
-	t->ksm = NULL;
+	t->crypto_profile = NULL;
 }
 
 #else /* CONFIG_BLK_INLINE_ENCRYPTION */
 
-static int dm_table_construct_keyslot_manager(struct dm_table *t)
+static int dm_table_construct_crypto_profile(struct dm_table *t)
 {
 	return 0;
 }
 
-void dm_destroy_keyslot_manager(struct blk_keyslot_manager *ksm)
+void dm_destroy_crypto_profile(struct blk_crypto_profile *profile)
 {
 }
 
-static void dm_table_destroy_keyslot_manager(struct dm_table *t)
+static void dm_table_destroy_crypto_profile(struct dm_table *t)
 {
 }
 
-static void dm_update_keyslot_manager(struct request_queue *q,
-				      struct dm_table *t)
+static void dm_update_crypto_profile(struct request_queue *q,
+				     struct dm_table *t)
 {
 }
 
@@ -1414,9 +1410,9 @@ int dm_table_complete(struct dm_table *t)
 		return r;
 	}
 
-	r = dm_table_construct_keyslot_manager(t);
+	r = dm_table_construct_crypto_profile(t);
 	if (r) {
-		DMERR("could not construct keyslot manager.");
+		DMERR("could not construct crypto profile.");
 		return r;
 	}
 
@@ -2070,7 +2066,7 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 			return r;
 	}
 
-	dm_update_keyslot_manager(q, t);
+	dm_update_crypto_profile(q, t);
 	disk_update_readahead(t->md->disk);
 
 	return 0;
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 4184fd8ccb084..8b91f4f0e0531 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1663,14 +1663,14 @@ static const struct dax_operations dm_dax_ops;
 static void dm_wq_work(struct work_struct *work);
 
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
-static void dm_queue_destroy_keyslot_manager(struct request_queue *q)
+static void dm_queue_destroy_crypto_profile(struct request_queue *q)
 {
-	dm_destroy_keyslot_manager(q->ksm);
+	dm_destroy_crypto_profile(q->crypto_profile);
 }
 
 #else /* CONFIG_BLK_INLINE_ENCRYPTION */
 
-static inline void dm_queue_destroy_keyslot_manager(struct request_queue *q)
+static inline void dm_queue_destroy_crypto_profile(struct request_queue *q)
 {
 }
 #endif /* !CONFIG_BLK_INLINE_ENCRYPTION */
@@ -1696,7 +1696,7 @@ static void cleanup_mapped_device(struct mapped_device *md)
 			dm_sysfs_exit(md);
 			del_gendisk(md->disk);
 		}
-		dm_queue_destroy_keyslot_manager(md->queue);
+		dm_queue_destroy_crypto_profile(md->queue);
 		blk_cleanup_disk(md->disk);
 	}
 
diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
index 67557808cada5..fec4fbf16a5b6 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -16,13 +16,13 @@ void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
 	/* Reset might clear all keys, so reprogram all the keys. */
 	if (host->caps2 & MMC_CAP2_CRYPTO)
-		blk_ksm_reprogram_all_keys(&host->ksm);
+		blk_crypto_reprogram_all_keys(&host->crypto_profile);
 }
 
 void mmc_crypto_setup_queue(struct request_queue *q, struct mmc_host *host)
 {
 	if (host->caps2 & MMC_CAP2_CRYPTO)
-		blk_ksm_register(&host->ksm, q);
+		blk_crypto_register(&host->crypto_profile, q);
 }
 EXPORT_SYMBOL_GPL(mmc_crypto_setup_queue);
 
@@ -30,12 +30,15 @@ void mmc_crypto_prepare_req(struct mmc_queue_req *mqrq)
 {
 	struct request *req = mmc_queue_req_to_req(mqrq);
 	struct mmc_request *mrq = &mqrq->brq.mrq;
+	struct blk_crypto_keyslot *keyslot;
 
 	if (!req->crypt_ctx)
 		return;
 
 	mrq->crypto_ctx = req->crypt_ctx;
-	if (req->crypt_keyslot)
-		mrq->crypto_key_slot = blk_ksm_get_slot_idx(req->crypt_keyslot);
+
+	keyslot = req->crypt_keyslot;
+	if (keyslot)
+		mrq->crypto_key_slot = blk_crypto_keyslot_index(keyslot);
 }
 EXPORT_SYMBOL_GPL(mmc_crypto_prepare_req);
diff --git a/drivers/mmc/host/cqhci-crypto.c b/drivers/mmc/host/cqhci-crypto.c
index 628bbfaf83124..d5f4b6972f63e 100644
--- a/drivers/mmc/host/cqhci-crypto.c
+++ b/drivers/mmc/host/cqhci-crypto.c
@@ -23,9 +23,10 @@ static const struct cqhci_crypto_alg_entry {
 };
 
 static inline struct cqhci_host *
-cqhci_host_from_ksm(struct blk_keyslot_manager *ksm)
+cqhci_host_from_crypto_profile(struct blk_crypto_profile *profile)
 {
-	struct mmc_host *mmc = container_of(ksm, struct mmc_host, ksm);
+	struct mmc_host *mmc =
+		container_of(profile, struct mmc_host, crypto_profile);
 
 	return mmc->cqe_private;
 }
@@ -57,12 +58,12 @@ static int cqhci_crypto_program_key(struct cqhci_host *cq_host,
 	return 0;
 }
 
-static int cqhci_crypto_keyslot_program(struct blk_keyslot_manager *ksm,
+static int cqhci_crypto_keyslot_program(struct blk_crypto_profile *profile,
 					const struct blk_crypto_key *key,
 					unsigned int slot)
 
 {
-	struct cqhci_host *cq_host = cqhci_host_from_ksm(ksm);
+	struct cqhci_host *cq_host = cqhci_host_from_crypto_profile(profile);
 	const union cqhci_crypto_cap_entry *ccap_array =
 		cq_host->crypto_cap_array;
 	const struct cqhci_crypto_alg_entry *alg =
@@ -115,11 +116,11 @@ static int cqhci_crypto_clear_keyslot(struct cqhci_host *cq_host, int slot)
 	return cqhci_crypto_program_key(cq_host, &cfg, slot);
 }
 
-static int cqhci_crypto_keyslot_evict(struct blk_keyslot_manager *ksm,
+static int cqhci_crypto_keyslot_evict(struct blk_crypto_profile *profile,
 				      const struct blk_crypto_key *key,
 				      unsigned int slot)
 {
-	struct cqhci_host *cq_host = cqhci_host_from_ksm(ksm);
+	struct cqhci_host *cq_host = cqhci_host_from_crypto_profile(profile);
 
 	return cqhci_crypto_clear_keyslot(cq_host, slot);
 }
@@ -132,7 +133,7 @@ static int cqhci_crypto_keyslot_evict(struct blk_keyslot_manager *ksm,
  * "enabled" when these are called, i.e. CQHCI_ENABLE might not be set in the
  * CQHCI_CFG register.  But the hardware allows that.
  */
-static const struct blk_ksm_ll_ops cqhci_ksm_ops = {
+static const struct blk_crypto_ll_ops cqhci_crypto_ops = {
 	.keyslot_program	= cqhci_crypto_keyslot_program,
 	.keyslot_evict		= cqhci_crypto_keyslot_evict,
 };
@@ -157,8 +158,8 @@ cqhci_find_blk_crypto_mode(union cqhci_crypto_cap_entry cap)
  *
  * If the driver previously set MMC_CAP2_CRYPTO and the CQE declares
  * CQHCI_CAP_CS, initialize the crypto support.  This involves reading the
- * crypto capability registers, initializing the keyslot manager, clearing all
- * keyslots, and enabling 128-bit task descriptors.
+ * crypto capability registers, initializing the blk_crypto_profile, clearing
+ * all keyslots, and enabling 128-bit task descriptors.
  *
  * Return: 0 if crypto was initialized or isn't supported; whether
  *	   MMC_CAP2_CRYPTO remains set indicates which one of those cases it is.
@@ -168,7 +169,7 @@ int cqhci_crypto_init(struct cqhci_host *cq_host)
 {
 	struct mmc_host *mmc = cq_host->mmc;
 	struct device *dev = mmc_dev(mmc);
-	struct blk_keyslot_manager *ksm = &mmc->ksm;
+	struct blk_crypto_profile *profile = &mmc->crypto_profile;
 	unsigned int num_keyslots;
 	unsigned int cap_idx;
 	enum blk_crypto_mode_num blk_mode_num;
@@ -199,15 +200,15 @@ int cqhci_crypto_init(struct cqhci_host *cq_host)
 	 */
 	num_keyslots = cq_host->crypto_capabilities.config_count + 1;
 
-	err = devm_blk_ksm_init(dev, ksm, num_keyslots);
+	err = devm_blk_crypto_profile_init(dev, profile, num_keyslots);
 	if (err)
 		goto out;
 
-	ksm->ksm_ll_ops = cqhci_ksm_ops;
-	ksm->dev = dev;
+	profile->ll_ops = cqhci_crypto_ops;
+	profile->dev = dev;
 
 	/* Unfortunately, CQHCI crypto only supports 32 DUN bits. */
-	ksm->max_dun_bytes_supported = 4;
+	profile->max_dun_bytes_supported = 4;
 
 	/*
 	 * Cache all the crypto capabilities and advertise the supported crypto
@@ -223,7 +224,7 @@ int cqhci_crypto_init(struct cqhci_host *cq_host)
 					cq_host->crypto_cap_array[cap_idx]);
 		if (blk_mode_num == BLK_ENCRYPTION_MODE_INVALID)
 			continue;
-		ksm->crypto_modes_supported[blk_mode_num] |=
+		profile->modes_supported[blk_mode_num] |=
 			cq_host->crypto_cap_array[cap_idx].sdus_mask * 512;
 	}
 
diff --git a/drivers/scsi/ufs/ufshcd-crypto.c b/drivers/scsi/ufs/ufshcd-crypto.c
index d70cdcd35e435..67402baf6faee 100644
--- a/drivers/scsi/ufs/ufshcd-crypto.c
+++ b/drivers/scsi/ufs/ufshcd-crypto.c
@@ -48,11 +48,12 @@ static int ufshcd_program_key(struct ufs_hba *hba,
 	return err;
 }
 
-static int ufshcd_crypto_keyslot_program(struct blk_keyslot_manager *ksm,
+static int ufshcd_crypto_keyslot_program(struct blk_crypto_profile *profile,
 					 const struct blk_crypto_key *key,
 					 unsigned int slot)
 {
-	struct ufs_hba *hba = container_of(ksm, struct ufs_hba, ksm);
+	struct ufs_hba *hba =
+		container_of(profile, struct ufs_hba, crypto_profile);
 	const union ufs_crypto_cap_entry *ccap_array = hba->crypto_cap_array;
 	const struct ufs_crypto_alg_entry *alg =
 			&ufs_crypto_algs[key->crypto_cfg.crypto_mode];
@@ -105,11 +106,12 @@ static int ufshcd_clear_keyslot(struct ufs_hba *hba, int slot)
 	return ufshcd_program_key(hba, &cfg, slot);
 }
 
-static int ufshcd_crypto_keyslot_evict(struct blk_keyslot_manager *ksm,
+static int ufshcd_crypto_keyslot_evict(struct blk_crypto_profile *profile,
 				       const struct blk_crypto_key *key,
 				       unsigned int slot)
 {
-	struct ufs_hba *hba = container_of(ksm, struct ufs_hba, ksm);
+	struct ufs_hba *hba =
+		container_of(profile, struct ufs_hba, crypto_profile);
 
 	return ufshcd_clear_keyslot(hba, slot);
 }
@@ -120,11 +122,11 @@ bool ufshcd_crypto_enable(struct ufs_hba *hba)
 		return false;
 
 	/* Reset might clear all keys, so reprogram all the keys. */
-	blk_ksm_reprogram_all_keys(&hba->ksm);
+	blk_crypto_reprogram_all_keys(&hba->crypto_profile);
 	return true;
 }
 
-static const struct blk_ksm_ll_ops ufshcd_ksm_ops = {
+static const struct blk_crypto_ll_ops ufshcd_crypto_ops = {
 	.keyslot_program	= ufshcd_crypto_keyslot_program,
 	.keyslot_evict		= ufshcd_crypto_keyslot_evict,
 };
@@ -179,15 +181,16 @@ int ufshcd_hba_init_crypto_capabilities(struct ufs_hba *hba)
 	}
 
 	/* The actual number of configurations supported is (CFGC+1) */
-	err = devm_blk_ksm_init(hba->dev, &hba->ksm,
-				hba->crypto_capabilities.config_count + 1);
+	err = devm_blk_crypto_profile_init(
+			hba->dev, &hba->crypto_profile,
+			hba->crypto_capabilities.config_count + 1);
 	if (err)
 		goto out;
 
-	hba->ksm.ksm_ll_ops = ufshcd_ksm_ops;
+	hba->crypto_profile.ll_ops = ufshcd_crypto_ops;
 	/* UFS only supports 8 bytes for any DUN */
-	hba->ksm.max_dun_bytes_supported = 8;
-	hba->ksm.dev = hba->dev;
+	hba->crypto_profile.max_dun_bytes_supported = 8;
+	hba->crypto_profile.dev = hba->dev;
 
 	/*
 	 * Cache all the UFS crypto capabilities and advertise the supported
@@ -202,7 +205,7 @@ int ufshcd_hba_init_crypto_capabilities(struct ufs_hba *hba)
 		blk_mode_num = ufshcd_find_blk_crypto_mode(
 						hba->crypto_cap_array[cap_idx]);
 		if (blk_mode_num != BLK_ENCRYPTION_MODE_INVALID)
-			hba->ksm.crypto_modes_supported[blk_mode_num] |=
+			hba->crypto_profile.modes_supported[blk_mode_num] |=
 				hba->crypto_cap_array[cap_idx].sdus_mask * 512;
 	}
 
@@ -230,9 +233,8 @@ void ufshcd_init_crypto(struct ufs_hba *hba)
 		ufshcd_clear_keyslot(hba, slot);
 }
 
-void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
-					    struct request_queue *q)
+void ufshcd_crypto_register(struct ufs_hba *hba, struct request_queue *q)
 {
 	if (hba->caps & UFSHCD_CAP_CRYPTO)
-		blk_ksm_register(&hba->ksm, q);
+		blk_crypto_register(&hba->crypto_profile, q);
 }
diff --git a/drivers/scsi/ufs/ufshcd-crypto.h b/drivers/scsi/ufs/ufshcd-crypto.h
index 78a58e788dff9..e18c012768732 100644
--- a/drivers/scsi/ufs/ufshcd-crypto.h
+++ b/drivers/scsi/ufs/ufshcd-crypto.h
@@ -18,7 +18,7 @@ static inline void ufshcd_prepare_lrbp_crypto(struct request *rq,
 		return;
 	}
 
-	lrbp->crypto_key_slot = blk_ksm_get_slot_idx(rq->crypt_keyslot);
+	lrbp->crypto_key_slot = blk_crypto_keyslot_index(rq->crypt_keyslot);
 	lrbp->data_unit_num = rq->crypt_ctx->bc_dun[0];
 }
 
@@ -40,8 +40,7 @@ int ufshcd_hba_init_crypto_capabilities(struct ufs_hba *hba);
 
 void ufshcd_init_crypto(struct ufs_hba *hba);
 
-void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
-					    struct request_queue *q);
+void ufshcd_crypto_register(struct ufs_hba *hba, struct request_queue *q);
 
 #else /* CONFIG_SCSI_UFS_CRYPTO */
 
@@ -64,8 +63,8 @@ static inline int ufshcd_hba_init_crypto_capabilities(struct ufs_hba *hba)
 
 static inline void ufshcd_init_crypto(struct ufs_hba *hba) { }
 
-static inline void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
-						struct request_queue *q) { }
+static inline void ufshcd_crypto_register(struct ufs_hba *hba,
+					  struct request_queue *q) { }
 
 #endif /* CONFIG_SCSI_UFS_CRYPTO */
 
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 95be7ecdfe10b..bf81da2ecf98c 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4986,7 +4986,7 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
 	else if (ufshcd_is_rpm_autosuspend_allowed(hba))
 		sdev->rpm_autosuspend = 1;
 
-	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);
+	ufshcd_crypto_register(hba, q);
 
 	return 0;
 }
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 885fcf2e59224..62bdc412d38ac 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -766,7 +766,7 @@ struct ufs_hba_monitor {
  * @crypto_capabilities: Content of crypto capabilities register (0x100)
  * @crypto_cap_array: Array of crypto capabilities
  * @crypto_cfg_register: Start of the crypto cfg array
- * @ksm: the keyslot manager tied to this hba
+ * @crypto_profile: the crypto profile of this hba (if applicable)
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -911,7 +911,7 @@ struct ufs_hba {
 	union ufs_crypto_capabilities crypto_capabilities;
 	union ufs_crypto_cap_entry *crypto_cap_array;
 	u32 crypto_cfg_register;
-	struct blk_keyslot_manager ksm;
+	struct blk_crypto_profile crypto_profile;
 #endif
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_root;
diff --git a/include/linux/blk-crypto-profile.h b/include/linux/blk-crypto-profile.h
index a27605e2f8260..bbab65bd54288 100644
--- a/include/linux/blk-crypto-profile.h
+++ b/include/linux/blk-crypto-profile.h
@@ -3,67 +3,113 @@
  * Copyright 2019 Google LLC
  */
 
-#ifndef __LINUX_KEYSLOT_MANAGER_H
-#define __LINUX_KEYSLOT_MANAGER_H
+#ifndef __LINUX_BLK_CRYPTO_PROFILE_H
+#define __LINUX_BLK_CRYPTO_PROFILE_H
 
 #include <linux/bio.h>
 #include <linux/blk-crypto.h>
 
-struct blk_keyslot_manager;
+struct blk_crypto_profile;
 
 /**
- * struct blk_ksm_ll_ops - functions to manage keyslots in hardware
- * @keyslot_program:	Program the specified key into the specified slot in the
- *			inline encryption hardware.
- * @keyslot_evict:	Evict key from the specified keyslot in the hardware.
- *			The key is provided so that e.g. dm layers can evict
- *			keys from the devices that they map over.
- *			Returns 0 on success, -errno otherwise.
+ * struct blk_crypto_ll_ops - functions to control inline encryption hardware
  *
- * This structure should be provided by storage device drivers when they set up
- * a keyslot manager - this structure holds the function ptrs that the keyslot
- * manager will use to manipulate keyslots in the hardware.
+ * Low-level operations for controlling inline encryption hardware.  This
+ * interface must be implemented by storage drivers that support inline
+ * encryption.  All functions may sleep, are serialized by profile->lock, and
+ * are never called while profile->dev (if set) is runtime-suspended.
  */
-struct blk_ksm_ll_ops {
-	int (*keyslot_program)(struct blk_keyslot_manager *ksm,
+struct blk_crypto_ll_ops {
+
+	/**
+	 * @keyslot_program: Program a key into the inline encryption hardware.
+	 *
+	 * Program @key into the specified @slot in the inline encryption
+	 * hardware, overwriting any key that the keyslot may already contain.
+	 * The keyslot is guaranteed to not be in-use by any I/O.
+	 *
+	 * This is required if the device has keyslots.  Otherwise (i.e. if the
+	 * device is a layered device, or if the device is real hardware that
+	 * simply doesn't have the concept of keyslots) it is never called.
+	 *
+	 * Must return 0 on success, or -errno on failure.
+	 */
+	int (*keyslot_program)(struct blk_crypto_profile *profile,
 			       const struct blk_crypto_key *key,
 			       unsigned int slot);
-	int (*keyslot_evict)(struct blk_keyslot_manager *ksm,
+
+	/**
+	 * @keyslot_evict: Evict a key from the inline encryption hardware.
+	 *
+	 * If the device has keyslots, this function must evict the key from the
+	 * specified @slot.  The slot will contain @key, but there should be no
+	 * need for the @key argument to be used as @slot should be sufficient.
+	 * The keyslot is guaranteed to not be in-use by any I/O.
+	 *
+	 * If the device doesn't have keyslots itself, this function must evict
+	 * @key from any underlying devices.  @slot won't be valid in this case.
+	 *
+	 * If there are no keyslots and no underlying devices, this function
+	 * isn't required.
+	 *
+	 * Must return 0 on success, or -errno on failure.
+	 */
+	int (*keyslot_evict)(struct blk_crypto_profile *profile,
 			     const struct blk_crypto_key *key,
 			     unsigned int slot);
 };
 
-struct blk_keyslot_manager {
-	/*
-	 * The struct blk_ksm_ll_ops that this keyslot manager will use
-	 * to perform operations like programming and evicting keys on the
-	 * device
+/**
+ * struct blk_crypto_profile - inline encryption profile for a device
+ *
+ * This struct contains a storage device's inline encryption capabilities (e.g.
+ * the supported crypto algorithms), driver-provided functions to control the
+ * inline encryption hardware (e.g. programming and evicting keys), and optional
+ * device-independent keyslot management data.
+ */
+struct blk_crypto_profile {
+
+	/* public: Drivers must initialize the following fields. */
+
+	/**
+	 * @ll_ops: Driver-provided functions to control the inline encryption
+	 * hardware, e.g. program and evict keys.
 	 */
-	struct blk_ksm_ll_ops ksm_ll_ops;
+	struct blk_crypto_ll_ops ll_ops;
 
-	/*
-	 * The maximum number of bytes supported for specifying the data unit
-	 * number.
+	/**
+	 * @max_dun_bytes_supported: The maximum number of bytes supported for
+	 * specifying the data unit number (DUN).  Specifically, the range of
+	 * supported DUNs is 0 through (1 << (8 * max_dun_bytes_supported)) - 1.
 	 */
 	unsigned int max_dun_bytes_supported;
 
-	/*
-	 * Array of size BLK_ENCRYPTION_MODE_MAX of bitmasks that represents
-	 * whether a crypto mode and data unit size are supported. The i'th
-	 * bit of crypto_mode_supported[crypto_mode] is set iff a data unit
-	 * size of (1 << i) is supported. We only support data unit sizes
-	 * that are powers of 2.
+	/**
+	 * @modes_supported: Array of bitmasks that specifies whether each
+	 * combination of crypto mode and data unit size is supported.
+	 * Specifically, the i'th bit of modes_supported[crypto_mode] is set if
+	 * crypto_mode can be used with a data unit size of (1 << i).  Note that
+	 * only data unit sizes that are powers of 2 can be supported.
 	 */
-	unsigned int crypto_modes_supported[BLK_ENCRYPTION_MODE_MAX];
+	unsigned int modes_supported[BLK_ENCRYPTION_MODE_MAX];
 
-	/* Device for runtime power management (NULL if none) */
+	/**
+	 * @dev: An optional device for runtime power management.  If the driver
+	 * provides this device, it will be runtime-resumed before any function
+	 * in @ll_ops is called and will remain resumed during the call.
+	 */
 	struct device *dev;
 
-	/* Here onwards are *private* fields for internal keyslot manager use */
+	/* private: The following fields shouldn't be accessed by drivers. */
 
+	/* Number of keyslots, or 0 if not applicable */
 	unsigned int num_slots;
 
-	/* Protects programming and evicting keys from the device */
+	/*
+	 * Serializes all calls to functions in @ll_ops as well as all changes
+	 * to @slot_hashtable.  This can also be taken in read mode to look up
+	 * keyslots while ensuring that they can't be changed concurrently.
+	 */
 	struct rw_semaphore lock;
 
 	/* List of idle slots, with least recently used slot at front */
@@ -80,41 +126,41 @@ struct blk_keyslot_manager {
 	unsigned int log_slot_ht_size;
 
 	/* Per-keyslot data */
-	struct blk_ksm_keyslot *slots;
+	struct blk_crypto_keyslot *slots;
 };
 
-int blk_ksm_init(struct blk_keyslot_manager *ksm, unsigned int num_slots);
-
-int devm_blk_ksm_init(struct device *dev, struct blk_keyslot_manager *ksm,
-		      unsigned int num_slots);
+int blk_crypto_profile_init(struct blk_crypto_profile *profile,
+			    unsigned int num_slots);
 
-blk_status_t blk_ksm_get_slot_for_key(struct blk_keyslot_manager *ksm,
-				      const struct blk_crypto_key *key,
-				      struct blk_ksm_keyslot **slot_ptr);
+int devm_blk_crypto_profile_init(struct device *dev,
+				 struct blk_crypto_profile *profile,
+				 unsigned int num_slots);
 
-unsigned int blk_ksm_get_slot_idx(struct blk_ksm_keyslot *slot);
+unsigned int blk_crypto_keyslot_index(struct blk_crypto_keyslot *slot);
 
-void blk_ksm_put_slot(struct blk_ksm_keyslot *slot);
+blk_status_t blk_crypto_get_keyslot(struct blk_crypto_profile *profile,
+				    const struct blk_crypto_key *key,
+				    struct blk_crypto_keyslot **slot_ptr);
 
-bool blk_ksm_crypto_cfg_supported(struct blk_keyslot_manager *ksm,
-				  const struct blk_crypto_config *cfg);
+void blk_crypto_put_keyslot(struct blk_crypto_keyslot *slot);
 
-int blk_ksm_evict_key(struct blk_keyslot_manager *ksm,
-		      const struct blk_crypto_key *key);
+bool __blk_crypto_cfg_supported(struct blk_crypto_profile *profile,
+				const struct blk_crypto_config *cfg);
 
-void blk_ksm_reprogram_all_keys(struct blk_keyslot_manager *ksm);
+int __blk_crypto_evict_key(struct blk_crypto_profile *profile,
+			   const struct blk_crypto_key *key);
 
-void blk_ksm_destroy(struct blk_keyslot_manager *ksm);
+void blk_crypto_reprogram_all_keys(struct blk_crypto_profile *profile);
 
-void blk_ksm_intersect_modes(struct blk_keyslot_manager *parent,
-			     const struct blk_keyslot_manager *child);
+void blk_crypto_profile_destroy(struct blk_crypto_profile *profile);
 
-void blk_ksm_init_passthrough(struct blk_keyslot_manager *ksm);
+void blk_crypto_intersect_capabilities(struct blk_crypto_profile *parent,
+				       const struct blk_crypto_profile *child);
 
-bool blk_ksm_is_superset(struct blk_keyslot_manager *ksm_superset,
-			 struct blk_keyslot_manager *ksm_subset);
+bool blk_crypto_has_capabilities(const struct blk_crypto_profile *target,
+				 const struct blk_crypto_profile *reference);
 
-void blk_ksm_update_capabilities(struct blk_keyslot_manager *target_ksm,
-				 struct blk_keyslot_manager *reference_ksm);
+void blk_crypto_update_capabilities(struct blk_crypto_profile *dst,
+				    const struct blk_crypto_profile *src);
 
-#endif /* __LINUX_KEYSLOT_MANAGER_H */
+#endif /* __LINUX_BLK_CRYPTO_PROFILE_H */
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 656fe34bdb6cd..12ddc6e44bc37 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -132,7 +132,7 @@ struct request {
 
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
 	struct bio_crypt_ctx *crypt_ctx;
-	struct blk_ksm_keyslot *crypt_keyslot;
+	struct blk_crypto_keyslot *crypt_keyslot;
 #endif
 
 	unsigned short write_hint;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index abe721591e80a..aeb83bcf4e31f 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -30,7 +30,7 @@ struct pr_ops;
 struct rq_qos;
 struct blk_queue_stats;
 struct blk_stat_callback;
-struct blk_keyslot_manager;
+struct blk_crypto_profile;
 
 /* Must be consistent with blk_mq_poll_stats_bkt() */
 #define BLK_MQ_POLL_STATS_BKTS 16
@@ -224,8 +224,7 @@ struct request_queue {
 	unsigned int		dma_alignment;
 
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
-	/* Inline crypto capabilities */
-	struct blk_keyslot_manager *ksm;
+	struct blk_crypto_profile *crypto_profile;
 #endif
 
 	unsigned int		rq_timeout;
@@ -1144,19 +1143,20 @@ int kblockd_mod_delayed_work_on(int cpu, struct delayed_work *dwork, unsigned lo
 
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
 
-bool blk_ksm_register(struct blk_keyslot_manager *ksm, struct request_queue *q);
+bool blk_crypto_register(struct blk_crypto_profile *profile,
+			 struct request_queue *q);
 
-void blk_ksm_unregister(struct request_queue *q);
+void blk_crypto_unregister(struct request_queue *q);
 
 #else /* CONFIG_BLK_INLINE_ENCRYPTION */
 
-static inline bool blk_ksm_register(struct blk_keyslot_manager *ksm,
-				    struct request_queue *q)
+static inline bool blk_crypto_register(struct blk_crypto_profile *profile,
+				       struct request_queue *q)
 {
 	return true;
 }
 
-static inline void blk_ksm_unregister(struct request_queue *q) { }
+static inline void blk_crypto_unregister(struct request_queue *q) { }
 
 #endif /* CONFIG_BLK_INLINE_ENCRYPTION */
 
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 114553b487ef4..a7df155ea49b8 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -576,9 +576,9 @@ struct dm_table *dm_swap_table(struct mapped_device *md,
 			       struct dm_table *t);
 
 /*
- * Table keyslot manager functions
+ * Table blk_crypto_profile functions
  */
-void dm_destroy_keyslot_manager(struct blk_keyslot_manager *ksm);
+void dm_destroy_crypto_profile(struct blk_crypto_profile *profile);
 
 /*-----------------------------------------------------------------
  * Macros.
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 725b1de417673..52eae8c45b8d6 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -492,7 +492,7 @@ struct mmc_host {
 
 	/* Inline encryption support */
 #ifdef CONFIG_MMC_CRYPTO
-	struct blk_keyslot_manager ksm;
+	struct blk_crypto_profile crypto_profile;
 #endif
 
 	/* Host Software Queue support */
-- 
2.33.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

