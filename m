Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDCA4082AC
	for <lists+dm-devel@lfdr.de>; Mon, 13 Sep 2021 03:43:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Cqr4Pcv2MaqfMsSqkASN6A-1; Sun, 12 Sep 2021 21:42:10 -0400
X-MC-Unique: Cqr4Pcv2MaqfMsSqkASN6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D95C343CF;
	Mon, 13 Sep 2021 01:42:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBEE21B472;
	Mon, 13 Sep 2021 01:42:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 520C04EA2A;
	Mon, 13 Sep 2021 01:41:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18D1fdW8003362 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 12 Sep 2021 21:41:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B2E82167D60; Mon, 13 Sep 2021 01:41:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 348002167D6E
	for <dm-devel@redhat.com>; Mon, 13 Sep 2021 01:41:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 070FC8007B1
	for <dm-devel@redhat.com>; Mon, 13 Sep 2021 01:41:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-551--2n_B0zgNl6yspYZS8tTHA-1;
	Sun, 12 Sep 2021 21:41:34 -0400
X-MC-Unique: -2n_B0zgNl6yspYZS8tTHA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A50D6108E;
	Mon, 13 Sep 2021 01:35:27 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: linux-block@vger.kernel.org
Date: Sun, 12 Sep 2021 18:31:33 -0700
Message-Id: <20210913013135.102404-4-ebiggers@kernel.org>
In-Reply-To: <20210913013135.102404-1-ebiggers@kernel.org>
References: <20210913013135.102404-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Satya Tangirala <satyaprateek2357@gmail.com>, dm-devel@redhat.com,
	linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: [dm-devel] [PATCH 3/5] blk-crypto: rename keyslot-manager files to
	blk-crypto-profile
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Eric Biggers <ebiggers@google.com>

In preparation for renaming struct blk_keyslot_manager to struct
blk_crypto_profile, rename the keyslot-manager.h and keyslot-manager.c
source files.  Renaming these files separately before making a lot of
changes to their contents makes it easier for git to understand that
they were renamed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/Makefile                                            | 2 +-
 block/blk-crypto-fallback.c                               | 2 +-
 block/{keyslot-manager.c => blk-crypto-profile.c}         | 2 +-
 block/blk-crypto.c                                        | 2 +-
 drivers/md/dm-core.h                                      | 2 +-
 drivers/md/dm.c                                           | 2 +-
 drivers/mmc/host/cqhci-crypto.c                           | 2 +-
 drivers/scsi/ufs/ufshcd.h                                 | 2 +-
 include/linux/{keyslot-manager.h => blk-crypto-profile.h} | 0
 include/linux/mmc/host.h                                  | 2 +-
 10 files changed, 9 insertions(+), 9 deletions(-)
 rename block/{keyslot-manager.c => blk-crypto-profile.c} (99%)
 rename include/linux/{keyslot-manager.h => blk-crypto-profile.h} (100%)

diff --git a/block/Makefile b/block/Makefile
index 41aa1ba69c900..c245e05b67453 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -36,6 +36,6 @@ obj-$(CONFIG_BLK_DEBUG_FS)	+= blk-mq-debugfs.o
 obj-$(CONFIG_BLK_DEBUG_FS_ZONED)+= blk-mq-debugfs-zoned.o
 obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
-obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o blk-crypto.o
+obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= blk-crypto.o blk-crypto-profile.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
 obj-$(CONFIG_BLOCK_HOLDER_DEPRECATED)	+= holder.o
diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index a4a444c83fb3c..9ffbd169e2601 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -12,9 +12,9 @@
 #include <crypto/skcipher.h>
 #include <linux/blk-cgroup.h>
 #include <linux/blk-crypto.h>
+#include <linux/blk-crypto-profile.h>
 #include <linux/blkdev.h>
 #include <linux/crypto.h>
-#include <linux/keyslot-manager.h>
 #include <linux/mempool.h>
 #include <linux/module.h>
 #include <linux/random.h>
diff --git a/block/keyslot-manager.c b/block/blk-crypto-profile.c
similarity index 99%
rename from block/keyslot-manager.c
rename to block/blk-crypto-profile.c
index 2c4a55bea6ca1..a58daf93c9ba6 100644
--- a/block/keyslot-manager.c
+++ b/block/blk-crypto-profile.c
@@ -28,7 +28,7 @@
 
 #define pr_fmt(fmt) "blk-crypto: " fmt
 
-#include <linux/keyslot-manager.h>
+#include <linux/blk-crypto-profile.h>
 #include <linux/device.h>
 #include <linux/atomic.h>
 #include <linux/mutex.h>
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 103c2e2d50d67..9102803d36232 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -11,7 +11,7 @@
 
 #include <linux/bio.h>
 #include <linux/blkdev.h>
-#include <linux/keyslot-manager.h>
+#include <linux/blk-crypto-profile.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 
diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index 55dccdfbcb22e..841ed87999e79 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -13,7 +13,7 @@
 #include <linux/ktime.h>
 #include <linux/genhd.h>
 #include <linux/blk-mq.h>
-#include <linux/keyslot-manager.h>
+#include <linux/blk-crypto-profile.h>
 
 #include <trace/events/block.h>
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index a011d09cb0fac..249223e20d3d0 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -29,7 +29,7 @@
 #include <linux/refcount.h>
 #include <linux/part_stat.h>
 #include <linux/blk-crypto.h>
-#include <linux/keyslot-manager.h>
+#include <linux/blk-crypto-profile.h>
 
 #define DM_MSG_PREFIX "core"
 
diff --git a/drivers/mmc/host/cqhci-crypto.c b/drivers/mmc/host/cqhci-crypto.c
index 6419cfbb4ab78..628bbfaf83124 100644
--- a/drivers/mmc/host/cqhci-crypto.c
+++ b/drivers/mmc/host/cqhci-crypto.c
@@ -6,7 +6,7 @@
  */
 
 #include <linux/blk-crypto.h>
-#include <linux/keyslot-manager.h>
+#include <linux/blk-crypto-profile.h>
 #include <linux/mmc/host.h>
 
 #include "cqhci-crypto.h"
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 52ea6f350b181..0f9cbe74642fe 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -32,7 +32,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
-#include <linux/keyslot-manager.h>
+#include <linux/blk-crypto-profile.h>
 #include "unipro.h"
 
 #include <asm/irq.h>
diff --git a/include/linux/keyslot-manager.h b/include/linux/blk-crypto-profile.h
similarity index 100%
rename from include/linux/keyslot-manager.h
rename to include/linux/blk-crypto-profile.h
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 0c0c9a0fdf578..725b1de417673 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -15,7 +15,7 @@
 #include <linux/mmc/card.h>
 #include <linux/mmc/pm.h>
 #include <linux/dma-direction.h>
-#include <linux/keyslot-manager.h>
+#include <linux/blk-crypto-profile.h>
 
 struct mmc_ios {
 	unsigned int	clock;			/* clock rate */
-- 
2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

