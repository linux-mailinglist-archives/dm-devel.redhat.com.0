Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 047BC627588
	for <lists+dm-devel@lfdr.de>; Mon, 14 Nov 2022 06:24:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668403442;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Uz83g9mUqodLauzf+uMxVY8uRxLjLFTQXi5nidUvUyc=;
	b=X1MTTsTXlV5IzJyRSsJPRQ7xfCLsfj7EgPeuyDwxeEVxuaEI/sPBCFPBT4XdBE7LlkQ6Ou
	nxzV+galows33g5bQqqAUPFFT8Phhhy6AtlFtkXltFHv28+41/IMevQbfHNvb4ZqEVoNm1
	nWffAB+bAQ3ab0zrxVjBnOebvVF3ZSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-e-fDeetNMwScC9i9UsU0GQ-1; Mon, 14 Nov 2022 00:23:34 -0500
X-MC-Unique: e-fDeetNMwScC9i9UsU0GQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 673E585543F;
	Mon, 14 Nov 2022 05:23:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52CF1140EBF5;
	Mon, 14 Nov 2022 05:23:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 137AD19465B7;
	Mon, 14 Nov 2022 05:23:32 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C73581946586
 for <dm-devel@listman.corp.redhat.com>; Mon, 14 Nov 2022 05:23:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9A100492CA5; Mon, 14 Nov 2022 05:23:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9239D49BB60
 for <dm-devel@redhat.com>; Mon, 14 Nov 2022 05:23:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FA9C3C0E457
 for <dm-devel@redhat.com>; Mon, 14 Nov 2022 05:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-gP3_N6WzOi6IMDEIEcMcQw-1; Mon, 14 Nov 2022 00:23:28 -0500
X-MC-Unique: gP3_N6WzOi6IMDEIEcMcQw-1
Received: from [2001:4bb8:191:2606:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ouR6T-00FvTk-7b; Mon, 14 Nov 2022 04:29:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 14 Nov 2022 05:29:42 +0100
Message-Id: <20221114042944.1009870-2-hch@lst.de>
In-Reply-To: <20221114042944.1009870-1-hch@lst.de>
References: <20221114042944.1009870-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [dm-devel] [PATCH 1/3] blk-crypto: don't use struct request_queue
 for public interfaces
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-block@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Mike Snitzer <snitzer@kernel.org>, linux-fscrypt@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
 Jaegeuk Kim <jaegeuk@kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch all public blk-crypto interfaces to use struct block_device
arguments to specify the device they operate on instead of th
request_queue, which is a block layer implementation detail.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/block/inline-encryption.rst | 12 ++++++------
 block/blk-crypto.c                        | 24 +++++++++++++----------
 drivers/md/dm-table.c                     |  2 +-
 fs/crypto/inline_crypt.c                  |  8 +++-----
 include/linux/blk-crypto.h                | 11 ++++-------
 5 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/Documentation/block/inline-encryption.rst b/Documentation/block/inline-encryption.rst
index 4d151fbe20583..f9bf18ea65093 100644
--- a/Documentation/block/inline-encryption.rst
+++ b/Documentation/block/inline-encryption.rst
@@ -142,7 +142,7 @@ Therefore, we also introduce *blk-crypto-fallback*, which is an implementation
 of inline encryption using the kernel crypto API.  blk-crypto-fallback is built
 into the block layer, so it works on any block device without any special setup.
 Essentially, when a bio with an encryption context is submitted to a
-request_queue that doesn't support that encryption context, the block layer will
+block_device that doesn't support that encryption context, the block layer will
 handle en/decryption of the bio using blk-crypto-fallback.
 
 For encryption, the data cannot be encrypted in-place, as callers usually rely
@@ -187,7 +187,7 @@ API presented to users of the block layer
 
 ``blk_crypto_config_supported()`` allows users to check ahead of time whether
 inline encryption with particular crypto settings will work on a particular
-request_queue -- either via hardware or via blk-crypto-fallback.  This function
+block_device -- either via hardware or via blk-crypto-fallback.  This function
 takes in a ``struct blk_crypto_config`` which is like blk_crypto_key, but omits
 the actual bytes of the key and instead just contains the algorithm, data unit
 size, etc.  This function can be useful if blk-crypto-fallback is disabled.
@@ -195,7 +195,7 @@ size, etc.  This function can be useful if blk-crypto-fallback is disabled.
 ``blk_crypto_init_key()`` allows users to initialize a blk_crypto_key.
 
 Users must call ``blk_crypto_start_using_key()`` before actually starting to use
-a blk_crypto_key on a request_queue (even if ``blk_crypto_config_supported()``
+a blk_crypto_key on a block_device (even if ``blk_crypto_config_supported()``
 was called earlier).  This is needed to initialize blk-crypto-fallback if it
 will be needed.  This must not be called from the data path, as this may have to
 allocate resources, which may deadlock in that case.
@@ -207,7 +207,7 @@ for en/decryption.  Users don't need to worry about freeing the bio_crypt_ctx
 later, as that happens automatically when the bio is freed or reset.
 
 Finally, when done using inline encryption with a blk_crypto_key on a
-request_queue, users must call ``blk_crypto_evict_key()``.  This ensures that
+block_device, users must call ``blk_crypto_evict_key()``.  This ensures that
 the key is evicted from all keyslots it may be programmed into and unlinked from
 any kernel data structures it may be linked into.
 
@@ -221,9 +221,9 @@ as follows:
 5. ``blk_crypto_evict_key()`` (after all I/O has completed)
 6. Zeroize the blk_crypto_key (this has no dedicated function)
 
-If a blk_crypto_key is being used on multiple request_queues, then
+If a blk_crypto_key is being used on multiple block_devices, then
 ``blk_crypto_config_supported()`` (if used), ``blk_crypto_start_using_key()``,
-and ``blk_crypto_evict_key()`` must be called on each request_queue.
+and ``blk_crypto_evict_key()`` must be called on each block_device.
 
 API presented to device drivers
 ===============================
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index a496aaef85ba4..0047436b63371 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -354,20 +354,21 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
 
 /*
  * Check if bios with @cfg can be en/decrypted by blk-crypto (i.e. either the
- * request queue it's submitted to supports inline crypto, or the
+ * block_device it's submitted to supports inline crypto, or the
  * blk-crypto-fallback is enabled and supports the cfg).
  */
-bool blk_crypto_config_supported(struct request_queue *q,
+bool blk_crypto_config_supported(struct block_device *bdev,
 				 const struct blk_crypto_config *cfg)
 {
 	return IS_ENABLED(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) ||
-	       __blk_crypto_cfg_supported(q->crypto_profile, cfg);
+	       __blk_crypto_cfg_supported(bdev_get_queue(bdev)->crypto_profile,
+					  cfg);
 }
 
 /**
  * blk_crypto_start_using_key() - Start using a blk_crypto_key on a device
+ * @bdev: block device to operate on
  * @key: A key to use on the device
- * @q: the request queue for the device
  *
  * Upper layers must call this function to ensure that either the hardware
  * supports the key's crypto settings, or the crypto API fallback has transforms
@@ -379,10 +380,11 @@ bool blk_crypto_config_supported(struct request_queue *q,
  *	   blk-crypto-fallback is either disabled or the needed algorithm
  *	   is disabled in the crypto API; or another -errno code.
  */
-int blk_crypto_start_using_key(const struct blk_crypto_key *key,
-			       struct request_queue *q)
+int blk_crypto_start_using_key(struct block_device *bdev,
+			       const struct blk_crypto_key *key)
 {
-	if (__blk_crypto_cfg_supported(q->crypto_profile, &key->crypto_cfg))
+	if (__blk_crypto_cfg_supported(bdev_get_queue(bdev)->crypto_profile,
+			&key->crypto_cfg))
 		return 0;
 	return blk_crypto_fallback_start_using_mode(key->crypto_cfg.crypto_mode);
 }
@@ -390,7 +392,7 @@ int blk_crypto_start_using_key(const struct blk_crypto_key *key,
 /**
  * blk_crypto_evict_key() - Evict a key from any inline encryption hardware
  *			    it may have been programmed into
- * @q: The request queue who's associated inline encryption hardware this key
+ * @bdev: The block_device who's associated inline encryption hardware this key
  *     might have been programmed into
  * @key: The key to evict
  *
@@ -400,14 +402,16 @@ int blk_crypto_start_using_key(const struct blk_crypto_key *key,
  *
  * Return: 0 on success or if the key wasn't in any keyslot; -errno on error.
  */
-int blk_crypto_evict_key(struct request_queue *q,
+int blk_crypto_evict_key(struct block_device *bdev,
 			 const struct blk_crypto_key *key)
 {
+	struct request_queue *q = bdev_get_queue(bdev);
+
 	if (__blk_crypto_cfg_supported(q->crypto_profile, &key->crypto_cfg))
 		return __blk_crypto_evict_key(q->crypto_profile, key);
 
 	/*
-	 * If the request_queue didn't support the key, then blk-crypto-fallback
+	 * If the block_device didn't support the key, then blk-crypto-fallback
 	 * may have been used, so try to evict the key from blk-crypto-fallback.
 	 */
 	return blk_crypto_fallback_evict_key(key);
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 078da18bb86d8..8541d5688f3a6 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1215,7 +1215,7 @@ static int dm_keyslot_evict_callback(struct dm_target *ti, struct dm_dev *dev,
 	struct dm_keyslot_evict_args *args = data;
 	int err;
 
-	err = blk_crypto_evict_key(bdev_get_queue(dev->bdev), args->key);
+	err = blk_crypto_evict_key(dev->bdev, args->key);
 	if (!args->err)
 		args->err = err;
 	/* Always try to evict the key from all devices. */
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index cea8b14007e6a..55c4d8c23d30d 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -139,8 +139,7 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 		return PTR_ERR(devs);
 
 	for (i = 0; i < num_devs; i++) {
-		if (!blk_crypto_config_supported(bdev_get_queue(devs[i]),
-						 &crypto_cfg))
+		if (!blk_crypto_config_supported(devs[i], &crypto_cfg))
 			goto out_free_devs;
 	}
 
@@ -184,8 +183,7 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 		goto fail;
 	}
 	for (i = 0; i < num_devs; i++) {
-		err = blk_crypto_start_using_key(blk_key,
-						 bdev_get_queue(devs[i]));
+		err = blk_crypto_start_using_key(devs[i], blk_key);
 		if (err)
 			break;
 	}
@@ -224,7 +222,7 @@ void fscrypt_destroy_inline_crypt_key(struct super_block *sb,
 	devs = fscrypt_get_devices(sb, &num_devs);
 	if (!IS_ERR(devs)) {
 		for (i = 0; i < num_devs; i++)
-			blk_crypto_evict_key(bdev_get_queue(devs[i]), blk_key);
+			blk_crypto_evict_key(devs[i], blk_key);
 		kfree(devs);
 	}
 	kfree_sensitive(blk_key);
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index 69b24fe92cbf1..561ca92e204d5 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -71,9 +71,6 @@ struct bio_crypt_ctx {
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
 
-struct request;
-struct request_queue;
-
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
 
 static inline bool bio_has_crypt_ctx(struct bio *bio)
@@ -94,13 +91,13 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
 			unsigned int dun_bytes,
 			unsigned int data_unit_size);
 
-int blk_crypto_start_using_key(const struct blk_crypto_key *key,
-			       struct request_queue *q);
+int blk_crypto_start_using_key(struct block_device *bdev,
+			       const struct blk_crypto_key *key);
 
-int blk_crypto_evict_key(struct request_queue *q,
+int blk_crypto_evict_key(struct block_device *bdev,
 			 const struct blk_crypto_key *key);
 
-bool blk_crypto_config_supported(struct request_queue *q,
+bool blk_crypto_config_supported(struct block_device *bdev,
 				 const struct blk_crypto_config *cfg);
 
 #else /* CONFIG_BLK_INLINE_ENCRYPTION */
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

