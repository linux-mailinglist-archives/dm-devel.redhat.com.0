Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5675E263F54
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 10:08:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-9yDWvOIlOXmJS4YJW3G85g-1; Thu, 10 Sep 2020 04:07:23 -0400
X-MC-Unique: 9yDWvOIlOXmJS4YJW3G85g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A8B11084C9A;
	Thu, 10 Sep 2020 08:07:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D333E27BD8;
	Thu, 10 Sep 2020 08:07:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BABA922EE;
	Thu, 10 Sep 2020 08:07:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 089Niei0011506 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Sep 2020 19:44:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E4B52166BCC; Wed,  9 Sep 2020 23:44:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 485A72166BA3
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 23:44:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86E64811E79
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 23:44:38 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
	[209.85.219.202]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-412-q9vFDj8jOkCxqbWI-JQGAQ-1; Wed, 09 Sep 2020 19:44:33 -0400
X-MC-Unique: q9vFDj8jOkCxqbWI-JQGAQ-1
Received: by mail-yb1-f202.google.com with SMTP id 129so3755339ybn.15
	for <dm-devel@redhat.com>; Wed, 09 Sep 2020 16:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
	:references:subject:from:to:cc;
	bh=Os3da9nFjMt73a4eualiesBSJv78kcIEnxCFYtpLmoI=;
	b=rE6DwMMLOKY+eOLN9eQsH5JhA4GowUdLJ3akra7gTYPICwWEh/pntM3OogYFtbKVjz
	cHM4wkB+iMIZ61J3KS22B/yB8+HhVTmOYelP6qb6rf1+0VCUhIZZIVTtwZAHHEROtOLa
	kL790knFSlFW9KelwLUyVNxmzwNsYl/d5FsAZQwQ0/5xjCwXHSgGBqopaHqO/6MHexa7
	tcYilNiV/Zr3FQQuVivEov9Hajbt2cpmzxgI21B37M0IB86d+ArtWBQtjV/09dBJb1N/
	EP9WigWY/NasujKahgpNE+aSti7Fhl+m/v+8SSleohgk1j6sk739EkCdFoYNX6g6QlXy
	MK9Q==
X-Gm-Message-State: AOAM532oo6WpY4SUkhkDBpqtksycZ9wRrlT6Ry8ubtkTBTkPhiRacEwk
	IP1mTsExc7HsQ26vLUv00SuAaxziF6A=
X-Google-Smtp-Source: ABdhPJyzGBo5AelWEpWhdQPgVuFV2CqaWrUEA117nkxG0YAbUHbSqm3664Mi0AjVSR6WwQ9x/bDsUmp8D6M=
X-Received: from satyaprateek.c.googlers.com
	([fda3:e722:ac3:10:24:72f4:c0a8:2d8e])
	(user=satyat job=sendgmr) by 2002:a5b:bcf:: with SMTP id
	c15mr9992965ybr.277.1599695072984; 
	Wed, 09 Sep 2020 16:44:32 -0700 (PDT)
Date: Wed,  9 Sep 2020 23:44:21 +0000
In-Reply-To: <20200909234422.76194-1-satyat@google.com>
Message-Id: <20200909234422.76194-3-satyat@google.com>
Mime-Version: 1.0
References: <20200909234422.76194-1-satyat@google.com>
From: Satya Tangirala <satyat@google.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Sep 2020 04:06:55 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Satya Tangirala <satyat@google.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Eric Biggers <ebiggers@google.com>
Subject: [dm-devel] [PATCH 2/3] dm: add support for passing through inline
	crypto support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

Update the device-mapper core to support exposing the inline crypto
support of the underlying device(s) through the device-mapper device.

This works by creating a "passthrough keyslot manager" for the dm
device, which declares support for encryption settings which all
underlying devices support.  When a supported setting is used, the bio
cloning code handles cloning the crypto context to the bios for all the
underlying devices.  When an unsupported setting is used, the blk-crypto
fallback is used as usual.

Crypto support on each underlying device is ignored unless the
corresponding dm target opts into exposing it.  This is needed because
for inline crypto to semantically operate on the original bio, the data
must not be transformed by the dm target.  Thus, targets like dm-linear
can expose crypto support of the underlying device, but targets like
dm-crypt can't.  (dm-crypt could use inline crypto itself, though.)

When a key is evicted from the dm device, it is evicted from all
underlying devices.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/blk-crypto.c              |  1 +
 block/keyslot-manager.c         | 34 ++++++++++++
 drivers/md/dm-core.h            |  4 ++
 drivers/md/dm-table.c           | 52 +++++++++++++++++++
 drivers/md/dm.c                 | 92 ++++++++++++++++++++++++++++++++-
 include/linux/device-mapper.h   |  6 +++
 include/linux/keyslot-manager.h |  7 +++
 7 files changed, 195 insertions(+), 1 deletion(-)

diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 2d5e60023b08..33555cf0e3e7 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -402,3 +402,4 @@ int blk_crypto_evict_key(struct request_queue *q,
 	 */
 	return blk_crypto_fallback_evict_key(key);
 }
+EXPORT_SYMBOL_GPL(blk_crypto_evict_key);
diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
index 60ac406d54b9..e0f776c38d8a 100644
--- a/block/keyslot-manager.c
+++ b/block/keyslot-manager.c
@@ -416,6 +416,40 @@ void blk_ksm_unregister(struct request_queue *q)
 {
 	q->ksm = NULL;
 }
+EXPORT_SYMBOL_GPL(blk_ksm_unregister);
+
+/**
+ * blk_ksm_intersect_modes() - restrict supported modes by child device
+ * @parent: The keyslot manager for parent device
+ * @child: The keyslot manager for child device, or NULL
+ *
+ * Clear any crypto mode support bits in @parent that aren't set in @child.
+ * If @child is NULL, then all parent bits are cleared.
+ *
+ * Only use this when setting up the keyslot manager for a layered device,
+ * before it's been exposed yet.
+ */
+void blk_ksm_intersect_modes(struct blk_keyslot_manager *parent,
+			     const struct blk_keyslot_manager *child)
+{
+	if (child) {
+		unsigned int i;
+
+		parent->max_dun_bytes_supported =
+			min(parent->max_dun_bytes_supported,
+			    child->max_dun_bytes_supported);
+		for (i = 0; i < ARRAY_SIZE(child->crypto_modes_supported);
+		     i++) {
+			parent->crypto_modes_supported[i] &=
+				child->crypto_modes_supported[i];
+		}
+	} else {
+		parent->max_dun_bytes_supported = 0;
+		memset(parent->crypto_modes_supported, 0,
+		       sizeof(parent->crypto_modes_supported));
+	}
+}
+EXPORT_SYMBOL_GPL(blk_ksm_intersect_modes);
 
 /**
  * blk_ksm_init_passthrough() - Init a passthrough keyslot manager
diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index c4ef1fceead6..4542050eebfc 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -12,6 +12,7 @@
 #include <linux/kthread.h>
 #include <linux/ktime.h>
 #include <linux/blk-mq.h>
+#include <linux/keyslot-manager.h>
 
 #include <trace/events/block.h>
 
@@ -49,6 +50,9 @@ struct mapped_device {
 
 	int numa_node_id;
 	struct request_queue *queue;
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+	struct blk_keyslot_manager ksm;
+#endif
 
 	atomic_t holders;
 	atomic_t open_count;
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 5edc3079e7c1..09ad65e582a8 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -21,6 +21,8 @@
 #include <linux/blk-mq.h>
 #include <linux/mount.h>
 #include <linux/dax.h>
+#include <linux/bio.h>
+#include <linux/keyslot-manager.h>
 
 #define DM_MSG_PREFIX "table"
 
@@ -1579,6 +1581,54 @@ static void dm_table_verify_integrity(struct dm_table *t)
 	}
 }
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+static int device_intersect_crypto_modes(struct dm_target *ti,
+					 struct dm_dev *dev, sector_t start,
+					 sector_t len, void *data)
+{
+	struct blk_keyslot_manager *parent = data;
+	struct blk_keyslot_manager *child = bdev_get_queue(dev->bdev)->ksm;
+
+	blk_ksm_intersect_modes(parent, child);
+	return 0;
+}
+
+/*
+ * Update the inline crypto modes supported by 'q->ksm' to be the intersection
+ * of the modes supported by all targets in the table.
+ *
+ * For any mode to be supported at all, all targets must have explicitly
+ * declared that they can pass through inline crypto support.  For a particular
+ * mode to be supported, all underlying devices must also support it.
+ *
+ * Assume that 'q->ksm' initially declares all modes to be supported.
+ */
+static void dm_calculate_supported_crypto_modes(struct dm_table *t,
+						struct request_queue *q)
+{
+	struct dm_target *ti;
+	unsigned int i;
+
+	for (i = 0; i < dm_table_get_num_targets(t); i++) {
+		ti = dm_table_get_target(t, i);
+
+		if (!ti->may_passthrough_inline_crypto) {
+			blk_ksm_intersect_modes(q->ksm, NULL);
+			return;
+		}
+		if (!ti->type->iterate_devices)
+			continue;
+		ti->type->iterate_devices(ti, device_intersect_crypto_modes,
+					  q->ksm);
+	}
+}
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
+static inline void dm_calculate_supported_crypto_modes(struct dm_table *t,
+						       struct request_queue *q)
+{
+}
+#endif /* !CONFIG_BLK_INLINE_ENCRYPTION */
+
 static int device_flush_capable(struct dm_target *ti, struct dm_dev *dev,
 				sector_t start, sector_t len, void *data)
 {
@@ -1895,6 +1945,8 @@ void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 
 	dm_table_verify_integrity(t);
 
+	dm_calculate_supported_crypto_modes(t, q);
+
 	/*
 	 * Some devices don't use blk_integrity but still want stable pages
 	 * because they do their own checksumming.
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index fb0255d25e4b..9cfc2b63323d 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -28,6 +28,7 @@
 #include <linux/refcount.h>
 #include <linux/part_stat.h>
 #include <linux/blk-crypto.h>
+#include <linux/keyslot-manager.h>
 
 #define DM_MSG_PREFIX "core"
 
@@ -1869,6 +1870,8 @@ static const struct dax_operations dm_dax_ops;
 
 static void dm_wq_work(struct work_struct *work);
 
+static void dm_destroy_inline_encryption(struct request_queue *q);
+
 static void cleanup_mapped_device(struct mapped_device *md)
 {
 	if (md->wq)
@@ -1890,8 +1893,10 @@ static void cleanup_mapped_device(struct mapped_device *md)
 		put_disk(md->disk);
 	}
 
-	if (md->queue)
+	if (md->queue) {
+		dm_destroy_inline_encryption(md->queue);
 		blk_cleanup_queue(md->queue);
+	}
 
 	cleanup_srcu_struct(&md->io_barrier);
 
@@ -2253,6 +2258,88 @@ struct queue_limits *dm_get_queue_limits(struct mapped_device *md)
 }
 EXPORT_SYMBOL_GPL(dm_get_queue_limits);
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+struct dm_keyslot_evict_args {
+	const struct blk_crypto_key *key;
+	int err;
+};
+
+static int dm_keyslot_evict_callback(struct dm_target *ti, struct dm_dev *dev,
+				     sector_t start, sector_t len, void *data)
+{
+	struct dm_keyslot_evict_args *args = data;
+	int err;
+
+	err = blk_crypto_evict_key(bdev_get_queue(dev->bdev), args->key);
+	if (!args->err)
+		args->err = err;
+	/* Always try to evict the key from all devices. */
+	return 0;
+}
+
+/*
+ * When an inline encryption key is evicted from a device-mapper device, evict
+ * it from all the underlying devices.
+ */
+static int dm_keyslot_evict(struct blk_keyslot_manager *ksm,
+			    const struct blk_crypto_key *key, unsigned int slot)
+{
+	struct mapped_device *md = container_of(ksm, struct mapped_device, ksm);
+	struct dm_keyslot_evict_args args = { key };
+	struct dm_table *t;
+	int srcu_idx;
+	int i;
+	struct dm_target *ti;
+
+	t = dm_get_live_table(md, &srcu_idx);
+	if (!t)
+		return 0;
+	for (i = 0; i < dm_table_get_num_targets(t); i++) {
+		ti = dm_table_get_target(t, i);
+		if (!ti->type->iterate_devices)
+			continue;
+		ti->type->iterate_devices(ti, dm_keyslot_evict_callback, &args);
+	}
+	dm_put_live_table(md, srcu_idx);
+	return args.err;
+}
+
+static struct blk_ksm_ll_ops dm_ksm_ll_ops = {
+	.keyslot_evict = dm_keyslot_evict,
+};
+
+static void dm_init_inline_encryption(struct mapped_device *md)
+{
+	blk_ksm_init_passthrough(&md->ksm);
+	md->ksm.ksm_ll_ops = dm_ksm_ll_ops;
+
+	/*
+	 * Initially declare support for all crypto settings. Anything
+	 * unsupported by a child device will be removed later when calculating
+	 * the device restrictions.
+	 */
+	md->ksm.max_dun_bytes_supported = UINT_MAX;
+	memset(md->ksm.crypto_modes_supported, 0xFF,
+	       sizeof(md->ksm.crypto_modes_supported));
+
+	blk_ksm_register(&md->ksm, md->queue);
+}
+
+static void dm_destroy_inline_encryption(struct request_queue *q)
+{
+	blk_ksm_destroy(q->ksm);
+	blk_ksm_unregister(q);
+}
+#else /* CONFIG_BLK_INLINE_ENCRYPTION */
+static inline void dm_init_inline_encryption(struct mapped_device *md)
+{
+}
+
+static inline void dm_destroy_inline_encryption(struct request_queue *q)
+{
+}
+#endif /* !CONFIG_BLK_INLINE_ENCRYPTION */
+
 /*
  * Setup the DM device's queue based on md's type
  */
@@ -2284,6 +2371,9 @@ int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t)
 		DMERR("Cannot calculate initial queue limits");
 		return r;
 	}
+
+	dm_init_inline_encryption(md);
+
 	dm_table_set_restrictions(t, md->queue, &limits);
 	blk_register_queue(md->disk);
 
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 93096e524e43..104f364866f9 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -320,6 +320,12 @@ struct dm_target {
 	 * whether or not its underlying devices have support.
 	 */
 	bool discards_supported:1;
+
+	/*
+	 * Set if inline crypto capabilities from this target's underlying
+	 * device(s) can be exposed via the device-mapper device.
+	 */
+	bool may_passthrough_inline_crypto:1;
 };
 
 void *dm_per_bio_data(struct bio *bio, size_t data_size);
diff --git a/include/linux/keyslot-manager.h b/include/linux/keyslot-manager.h
index 323e15dd6fa7..bfe7f35da4a8 100644
--- a/include/linux/keyslot-manager.h
+++ b/include/linux/keyslot-manager.h
@@ -9,6 +9,8 @@
 #include <linux/bio.h>
 #include <linux/blk-crypto.h>
 
+#ifdef CONFIG_BLK_INLINE_ENCRYPTION
+
 struct blk_keyslot_manager;
 
 /**
@@ -103,6 +105,11 @@ void blk_ksm_reprogram_all_keys(struct blk_keyslot_manager *ksm);
 
 void blk_ksm_destroy(struct blk_keyslot_manager *ksm);
 
+void blk_ksm_intersect_modes(struct blk_keyslot_manager *parent,
+			     const struct blk_keyslot_manager *child);
+
 void blk_ksm_init_passthrough(struct blk_keyslot_manager *ksm);
 
+#endif /* CONFIG_BLK_INLINE_ENCRYPTION */
+
 #endif /* __LINUX_KEYSLOT_MANAGER_H */
-- 
2.28.0.618.gf4bc123cb7-goog

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

