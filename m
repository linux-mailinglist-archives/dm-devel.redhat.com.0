Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDC01A00E8
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 00:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586211341;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0EIk5xLECZkv74fK5SrkBmdZPU98Ujoo6M5DsSfol5A=;
	b=iAHqlSXWgy8PvGgbkB1aWeG+NtRXDmCcGFZheF5bCOwgvP85AeKlyPr4qygJUFVpSVU1HV
	fqNhRCBAZ2xRdovxkEI3FrpEeGxJJmJuQegncIMgpvtGjPLNT5a0RhmKvXmeXiiqy+k0oU
	eAmN+79YErAWu9QY0X1GLcJy156u6CA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-CdyRNepXMRKulMfr6gR5sg-1; Mon, 06 Apr 2020 18:15:38 -0400
X-MC-Unique: CdyRNepXMRKulMfr6gR5sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D438F18A8C83;
	Mon,  6 Apr 2020 22:15:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EFCE60BFB;
	Mon,  6 Apr 2020 22:15:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24BCE18089CD;
	Mon,  6 Apr 2020 22:15:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036MEv0V018681 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 18:14:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EFBFF2166B30; Mon,  6 Apr 2020 22:14:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBEB62166B2A
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 22:14:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD6658007D4
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 22:14:56 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-32-7UtGPQVKNOqgtnyYNbRn1g-1;
	Mon, 06 Apr 2020 18:14:51 -0400
X-MC-Unique: 7UtGPQVKNOqgtnyYNbRn1g-1
Received: from dede-linux.corp.microsoft.com (unknown [131.107.147.242])
	by linux.microsoft.com (Postfix) with ESMTPSA id A9A6F207295B;
	Mon,  6 Apr 2020 15:14:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A9A6F207295B
From: deven.desai@linux.microsoft.com
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org
Date: Mon,  6 Apr 2020 15:14:35 -0700
Message-Id: <20200406221439.1469862-9-deven.desai@linux.microsoft.com>
In-Reply-To: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
References: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036MEv0V018681
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, pasha.tatashin@soleen.com, mdsakib@linux.microsoft.com,
	linux-kernel@vger.kernel.org, nramas@linux.microsoft.com,
	tyhicks@linux.microsoft.com, jaskarankhurana@linux.microsoft.com
Subject: [dm-devel] [RFC PATCH v2 08/12] ipe: add property for signed
	dmverity volumes
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Deven Bowers <deven.desai@linux.microsoft.com>

Allow IPE to leverage the stacked security blob infrastructure,
and enlighten IPE to the block_device security blob.

This allows IPE to have a property to express rules around a device-mapper
verity volume whose root-hash has been signed, and the signature has been
verified against the system keyring. This is property is also added in
this patch.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 security/ipe/Kconfig                         |  2 +-
 security/ipe/Makefile                        |  1 +
 security/ipe/ipe-blobs.c                     | 80 +++++++++++++++++++
 security/ipe/ipe-blobs.h                     | 18 +++++
 security/ipe/ipe-engine.c                    |  4 +
 security/ipe/ipe-engine.h                    |  9 +++
 security/ipe/ipe-hooks.c                     |  1 +
 security/ipe/ipe-hooks.h                     | 43 ++++++++++
 security/ipe/ipe.c                           | 18 +++++
 security/ipe/ipe.h                           |  2 +
 security/ipe/properties/Kconfig              | 10 +++
 security/ipe/properties/Makefile             |  1 +
 security/ipe/properties/dmverity-signature.c | 84 ++++++++++++++++++++
 security/ipe/properties/prop-entry.h         |  9 +++
 security/ipe/utility.h                       | 10 +++
 15 files changed, 291 insertions(+), 1 deletion(-)
 create mode 100644 security/ipe/ipe-blobs.c
 create mode 100644 security/ipe/ipe-blobs.h
 create mode 100644 security/ipe/properties/dmverity-signature.c

diff --git a/security/ipe/Kconfig b/security/ipe/Kconfig
index b1d89244da3e..2c3012a6047b 100644
--- a/security/ipe/Kconfig
+++ b/security/ipe/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig SECURITY_IPE
 	bool "Integrity Policy Enforcement (IPE)"
-	depends on SECURITY && AUDIT && SECURITYFS
+	depends on SECURITY && AUDIT && SECURITYFS && BLOCK
 	select SYSTEM_DATA_VERIFICATION
 	help
 	  This option enables the Integrity Policy Enforcement subsystem,
diff --git a/security/ipe/Makefile b/security/ipe/Makefile
index 741914ddc338..615797f4cd38 100644
--- a/security/ipe/Makefile
+++ b/security/ipe/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_SECURITY_IPE) += \
 	ipe-hooks.o \
 	ipe-secfs.o \
 	ipe-sysfs.o \
+	ipe-blobs.o \
 
 clean-files := ipe-bp.c
 
diff --git a/security/ipe/ipe-blobs.c b/security/ipe/ipe-blobs.c
new file mode 100644
index 000000000000..a4ee8df02855
--- /dev/null
+++ b/security/ipe/ipe-blobs.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include "ipe.h"
+#include "ipe-engine.h"
+#include "ipe-blobs.h"
+
+#include <linux/types.h>
+#include <linux/fs.h>
+#include <linux/device-mapper.h>
+
+/**
+ * ipe_bdev_alloc_security: Performs the initialization of IPE's security blob.
+ * @bdev: The block device to source the security blob from.
+ *
+ * The allocation is performed earlier by the LSM infrastructure,
+ * (on behalf of all LSMs) in lsm_alloc_bdev. At the moment, IPE uses
+ * this time to zero out the region of memory reserved for IPE.
+ *
+ * Return:
+ * 0 - OK
+ */
+int ipe_bdev_alloc_security(struct block_device *bdev)
+{
+	struct ipe_bdev_blob *bdev_sec = ipe_bdev(bdev);
+
+	memset(bdev_sec, 0x0, sizeof(*bdev_sec));
+
+	return 0;
+}
+
+/**
+ * ipe_bdev_free_security: Frees all fields of IPE's block dev security blob.
+ * @bdev: The block device to source the security blob from.
+ *
+ * The deallocation of the blob itself is performed later by the LSM
+ * infrastructure, (on behalf of all LSMs) in lsm_free_bdev.
+ *
+ * Pointers allocated by the bdev_setsecurity hook and alloc_security
+ * hook need to be deallocated here.
+ */
+void ipe_bdev_free_security(struct block_device *bdev)
+{
+	struct ipe_bdev_blob *bdev_sec = ipe_bdev(bdev);
+
+	memset(bdev_sec, 0x0, sizeof(*bdev_sec));
+}
+
+/**
+ * ipe_bdev_setsecurity: Sets the a certain field of a block device security
+ *			 blob, based on @key.
+ * @bdev: The block device to source the security blob from.
+ * @key: The key representing the information to be stored.
+ * @value: The value to be stored.
+ * @len: The length of @value.
+ *
+ * As block-devices are a generic implementation across specific stacks,
+ * this allows information to be stored from various stacks.
+ *
+ * Return:
+ * 0 - OK
+ * !0 - Error
+ */
+int ipe_bdev_setsecurity(struct block_device *bdev, const char *key,
+			 const void *value, size_t len)
+{
+	struct ipe_bdev_blob *bdev_sec = ipe_bdev(bdev);
+
+	if (!strcmp(key, DM_VERITY_SIGNATURE_SEC_NAME)) {
+		bdev_sec->dmverity_rh_sig = kmemdup(value, len, GFP_KERNEL);
+		if (!bdev_sec->dmverity_rh_sig)
+			return -ENOMEM;
+
+		bdev_sec->dmv_rh_sig_len = len;
+	}
+
+	return 0;
+}
diff --git a/security/ipe/ipe-blobs.h b/security/ipe/ipe-blobs.h
new file mode 100644
index 000000000000..7561f4cef558
--- /dev/null
+++ b/security/ipe/ipe-blobs.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+#include <linux/types.h>
+#include <linux/fs.h>
+
+#include "ipe.h"
+
+#ifndef IPE_BLOB_H
+#define IPE_BLOB_H
+
+static inline struct ipe_bdev_blob *ipe_bdev(struct block_device *bdev)
+{
+	return bdev->security + ipe_blobs.lbs_bdev;
+}
+
+#endif /* IPE_BLOB_H */
diff --git a/security/ipe/ipe-engine.c b/security/ipe/ipe-engine.c
index 6b1a4ce8c387..5e33fb5cb9ef 100644
--- a/security/ipe/ipe-engine.c
+++ b/security/ipe/ipe-engine.c
@@ -10,6 +10,7 @@
 #include "ipe-engine.h"
 #include "ipe-audit.h"
 #include "ipe-pin.h"
+#include "ipe-blobs.h"
 #include "utility.h"
 
 #include <linux/types.h>
@@ -124,6 +125,9 @@ static struct ipe_engine_ctx *build_ctx(const struct file *file,
 	local->op = op;
 	local->hook = hook;
 
+	if (has_bdev(file))
+		local->sec_bdev = ipe_bdev(bdev(file));
+
 	return local;
 }
 
diff --git a/security/ipe/ipe-engine.h b/security/ipe/ipe-engine.h
index 3f7c471929e2..be17115861cb 100644
--- a/security/ipe/ipe-engine.h
+++ b/security/ipe/ipe-engine.h
@@ -3,20 +3,29 @@
  * Copyright (C) Microsoft Corporation. All rights reserved.
  */
 
+#include "ipe.h"
 #include "ipe-hooks.h"
 
 #include <linux/types.h>
 #include <linux/rbtree.h>
 #include <linux/fs.h>
 
+#include <crypto/pkcs7.h>
+
 #ifndef IPE_ENGINE_H
 #define IPE_ENGINE_H
 
+struct ipe_bdev_blob {
+	u8	*dmverity_rh_sig;
+	size_t	dmv_rh_sig_len;
+};
+
 struct ipe_engine_ctx {
 	enum ipe_op op;
 	enum ipe_hook hook;
 	const struct file *file;
 	const char *audit_pathname;
+	const struct ipe_bdev_blob *sec_bdev;
 };
 
 struct ipe_prop_cache {
diff --git a/security/ipe/ipe-hooks.c b/security/ipe/ipe-hooks.c
index 43182ba25cc5..f9728c96d73c 100644
--- a/security/ipe/ipe-hooks.c
+++ b/security/ipe/ipe-hooks.c
@@ -15,6 +15,7 @@
 #include <linux/mman.h>
 #include <linux/mm.h>
 #include <linux/security.h>
+#include <linux/device-mapper.h>
 
 #define HAS_EXEC(_p, _rp) (((_rp) & PROT_EXEC) || ((_p) & PROT_EXEC))
 
diff --git a/security/ipe/ipe-hooks.h b/security/ipe/ipe-hooks.h
index 55e417c72425..35a7a681b4c6 100644
--- a/security/ipe/ipe-hooks.h
+++ b/security/ipe/ipe-hooks.h
@@ -113,4 +113,47 @@ int ipe_on_kernel_load_data(enum kernel_load_data_id id);
 
 void ipe_sb_free_security(struct super_block *mnt_sb);
 
+/**
+ * ipe_bdev_alloc_security: Performs the initialization of IPE's security blob.
+ * @bdev: The block device to source the security blob from.
+ *
+ * The allocation is performed earlier by the LSM infrastructure,
+ * (on behalf of all LSMs) in lsm_alloc_bdev. At the moment, IPE uses
+ * this time to zero out the region of memory reserved for IPE.
+ *
+ * Return:
+ * 0 - OK
+ */
+int ipe_bdev_alloc_security(struct block_device *bdev);
+
+/**
+ * ipe_bdev_free_security: Frees all fields of IPE's block dev security blob.
+ * @bdev: The block device to source the security blob from.
+ *
+ * The deallocation of the blob itself is performed later by the LSM
+ * infrastructure, (on behalf of all LSMs) in lsm_free_bdev.
+ *
+ * Pointers allocated by the bdev_setsecurity hook and alloc_security
+ * hook need to be deallocated here.
+ */
+void ipe_bdev_free_security(struct block_device *bdev);
+
+/**
+ * ipe_bdev_setsecurity: Sets the a certain field of a block device security
+ *			 blob, based on @key.
+ * @bdev: The block device to source the security blob from.
+ * @key: The key representing the information to be stored.
+ * @value: The value to be stored.
+ * @len: The length of @value.
+ *
+ * As block-devices are a generic implementation across specific stacks,
+ * this allows information to be stored from various stacks.
+ *
+ * Return:
+ * 0 - OK
+ * !0 - Error
+ */
+int ipe_bdev_setsecurity(struct block_device *bdev, const char *key,
+			 const void *value, size_t len);
+
 #endif /* IPE_HOOK_H */
diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
index 971c50ecadaf..924f535c3d32 100644
--- a/security/ipe/ipe.c
+++ b/security/ipe/ipe.c
@@ -25,6 +25,9 @@ static struct security_hook_list ipe_hooks[] __lsm_ro_after_init = {
 	LSM_HOOK_INIT(kernel_load_data, ipe_on_kernel_load_data),
 	LSM_HOOK_INIT(file_mprotect, ipe_on_mprotect),
 	LSM_HOOK_INIT(sb_free_security, ipe_sb_free_security),
+	LSM_HOOK_INIT(bdev_alloc_security, ipe_bdev_alloc_security),
+	LSM_HOOK_INIT(bdev_free_security, ipe_bdev_free_security),
+	LSM_HOOK_INIT(bdev_setsecurity, ipe_bdev_setsecurity),
 };
 
 /**
@@ -42,6 +45,10 @@ static int __init ipe_load_properties(void)
 	if (rc != 0)
 		return rc;
 
+	rc = ipe_init_dm_verity_signature();
+	if (rc != 0)
+		return rc;
+
 	return rc;
 }
 
@@ -80,9 +87,20 @@ static int __init ipe_init(void)
 	return rc;
 }
 
+struct lsm_blob_sizes ipe_blobs = {
+	.lbs_cred = 0,
+	.lbs_file = 0,
+	.lbs_inode = 0,
+	.lbs_ipc = 0,
+	.lbs_msg_msg = 0,
+	.lbs_task = 0,
+	.lbs_bdev = sizeof(struct ipe_bdev_blob),
+};
+
 DEFINE_LSM(ipe) = {
 	.name = "ipe",
 	.init = ipe_init,
+	.blobs = &ipe_blobs,
 };
 
 int enforce = 1;
diff --git a/security/ipe/ipe.h b/security/ipe/ipe.h
index c016b57aa70b..117ee549861c 100644
--- a/security/ipe/ipe.h
+++ b/security/ipe/ipe.h
@@ -10,10 +10,12 @@
 
 #include <linux/types.h>
 #include <linux/fs.h>
+#include <linux/lsm_hooks.h>
 
 #define IPE_MODE_ENFORCE	"enforce"
 #define IPE_MODE_PERMISSIVE	"permissive"
 
+extern struct lsm_blob_sizes ipe_blobs;
 extern int enforce;
 extern int success_audit;
 extern int strict_parse;
diff --git a/security/ipe/properties/Kconfig b/security/ipe/properties/Kconfig
index 9dc0db8817b2..2d8866ee456e 100644
--- a/security/ipe/properties/Kconfig
+++ b/security/ipe/properties/Kconfig
@@ -12,3 +12,13 @@ config IPE_BOOT_PROP
 	  being evaluated originates from the initial superblock.
 
 	  if unsure, answer N.
+
+config IPE_DM_VERITY_SIGNATURE
+	bool "Enable property for signature verified dm-verity volumes"
+	depends on DM_VERITY_VERIFY_ROOTHASH_SIG
+	help
+	  This option enables IPE's integration with Device-Mapper Verity's
+	  signed root-hashes. This enables the usage of the property,
+	  "dmverity_signature" in IPE's policy.
+
+	  if unsure, answer Y.
diff --git a/security/ipe/properties/Makefile b/security/ipe/properties/Makefile
index e3e7fe17cf58..6b67cbe36e31 100644
--- a/security/ipe/properties/Makefile
+++ b/security/ipe/properties/Makefile
@@ -9,3 +9,4 @@
 obj-$(CONFIG_SECURITY_IPE) += properties.o
 
 properties-$(CONFIG_IPE_BOOT_PROP) += boot-verified.o
+properties-$(CONFIG_IPE_DM_VERITY_SIGNATURE) += dmverity-signature.o
diff --git a/security/ipe/properties/dmverity-signature.c b/security/ipe/properties/dmverity-signature.c
new file mode 100644
index 000000000000..448e3b8fd43e
--- /dev/null
+++ b/security/ipe/properties/dmverity-signature.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include "../ipe.h"
+#include "../ipe-pin.h"
+#include "../ipe-property.h"
+#include "../utility.h"
+
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/audit.h>
+#include <linux/mount.h>
+
+#define PROPERTY_NAME "dmverity_signature"
+
+static void audit(struct audit_buffer *ab, bool value)
+{
+	audit_log_format(ab, "%s", (value) ? "TRUE" : "FALSE");
+}
+
+static inline void audit_rule_value(struct audit_buffer *ab,
+				    const void *value)
+{
+	audit(ab, (bool)value);
+}
+
+static inline void audit_ctx(struct audit_buffer *ab,
+			     const struct ipe_engine_ctx *ctx,
+			     const void *storage)
+{
+	bool b = has_bdev(ctx->file) && ctx->sec_bdev->dmverity_rh_sig;
+
+	audit(ab, b);
+}
+
+static bool evaluate(const struct ipe_engine_ctx *ctx,
+		     const void *value, void **storage)
+{
+	bool expect = (bool)value;
+
+	if (!has_bdev(ctx->file))
+		return false;
+
+	return ((bool)ctx->sec_bdev->dmverity_rh_sig) == expect;
+}
+
+static int parse(const char *val_str, void **value)
+{
+	if (strcmp("TRUE", val_str) == 0)
+		*value = (void *)true;
+	else if (strcmp("FALSE", val_str) == 0)
+		*value = (void *)false;
+	else
+		return -EBADMSG;
+
+	return 0;
+}
+
+static inline int duplicate(const void *src, void **dest)
+{
+	*dest = (void *)(bool)src;
+
+	return 0;
+}
+
+static const struct ipe_property dmv_signature = {
+	.property_name = PROPERTY_NAME,
+	.eval = evaluate,
+	.parse = parse,
+	.rule_audit = audit_rule_value,
+	.ctx_audit = audit_ctx,
+	.dup = duplicate,
+	.prealloc = NULL,
+	.free_val = NULL,
+	.free_storage = NULL,
+};
+
+int ipe_init_dm_verity_signature(void)
+{
+	return ipe_register_property(&dmv_signature);
+}
diff --git a/security/ipe/properties/prop-entry.h b/security/ipe/properties/prop-entry.h
index f598dd9608b9..85366366ff0d 100644
--- a/security/ipe/properties/prop-entry.h
+++ b/security/ipe/properties/prop-entry.h
@@ -17,4 +17,13 @@ static inline int __init ipe_init_bootv(void)
 int __init ipe_init_bootv(void);
 #endif /* CONFIG_IPE_BOOT_PROP */
 
+#ifndef CONFIG_IPE_DM_VERITY_SIGNATURE
+static inline int __init ipe_init_dm_verity_signature(void)
+{
+	return 0;
+}
+#else
+int __init ipe_init_dm_verity_signature(void);
+#endif /* CONFIG_IPE_DM_VERITY_SIGNATURE */
+
 #endif /* IPE_PROP_ENTRY_H */
diff --git a/security/ipe/utility.h b/security/ipe/utility.h
index a13089bb0d8f..7580f17274a3 100644
--- a/security/ipe/utility.h
+++ b/security/ipe/utility.h
@@ -19,4 +19,14 @@ static inline bool has_sb(const struct file *file)
 	return has_mount(file) && file->f_path.mnt->mnt_sb;
 }
 
+static inline bool has_bdev(const struct file *file)
+{
+	return has_sb(file) && file->f_path.mnt->mnt_sb->s_bdev;
+}
+
+static inline struct block_device *bdev(const struct file *file)
+{
+	return file->f_path.mnt->mnt_sb->s_bdev;
+}
+
 #endif /* IPE_UTILITY_H */
-- 
2.26.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

