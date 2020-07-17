Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 66A672246EA
	for <lists+dm-devel@lfdr.de>; Sat, 18 Jul 2020 01:21:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-NmO7MR26MBGiRpgNhMXyIA-1; Fri, 17 Jul 2020 19:21:09 -0400
X-MC-Unique: NmO7MR26MBGiRpgNhMXyIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B1D8106B248;
	Fri, 17 Jul 2020 23:21:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBD9810013C0;
	Fri, 17 Jul 2020 23:21:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A782796255;
	Fri, 17 Jul 2020 23:21:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06HNGnIU002260 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jul 2020 19:16:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0769A115152; Fri, 17 Jul 2020 23:16:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02CAF115165
	for <dm-devel@redhat.com>; Fri, 17 Jul 2020 23:16:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE307185A797
	for <dm-devel@redhat.com>; Fri, 17 Jul 2020 23:16:48 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-303-4fAe1ySlNNu0aDsoe0cEmg-1;
	Fri, 17 Jul 2020 19:16:44 -0400
X-MC-Unique: 4fAe1ySlNNu0aDsoe0cEmg-1
Received: from dede-linux-virt.corp.microsoft.com (unknown [131.107.160.54])
	by linux.microsoft.com (Postfix) with ESMTPSA id EC2F320B4917;
	Fri, 17 Jul 2020 16:09:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EC2F320B4917
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, viro@zeniv.linux.org.uk,
	paul@paul-moore.com, eparis@redhat.com, jannh@google.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-audit@redhat.com
Date: Fri, 17 Jul 2020 16:09:39 -0700
Message-Id: <20200717230941.1190744-11-deven.desai@linux.microsoft.com>
In-Reply-To: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
References: <20200717230941.1190744-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06HNGnIU002260
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, mdsakib@microsoft.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org, pasha.tatshin@soleen.com,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	jaskarankhurana@linux.microsoft.com
Subject: [dm-devel] [RFC PATCH v4 10/12] ipe: add property for dmverity
	roothash
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a property to allow IPE policy to express rules around a specific
root-hash of a dm-verity volume.

This can be used for revocation, (when combined with the previous dm-verity
property) or the authorization of a single dm-verity volume.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 security/ipe/ipe-blobs.c                    |   9 ++
 security/ipe/ipe-engine.h                   |   3 +
 security/ipe/ipe.c                          |   4 +
 security/ipe/properties/Kconfig             |  13 +-
 security/ipe/properties/Makefile            |   1 +
 security/ipe/properties/dmverity-roothash.c | 153 ++++++++++++++++++++
 security/ipe/properties/prop-entry.h        |   9 ++
 7 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 security/ipe/properties/dmverity-roothash.c

diff --git a/security/ipe/ipe-blobs.c b/security/ipe/ipe-blobs.c
index 03e916d13ac1..d2cdd120d5ed 100644
--- a/security/ipe/ipe-blobs.c
+++ b/security/ipe/ipe-blobs.c
@@ -46,6 +46,7 @@ void ipe_bdev_free_security(struct block_device *bdev)
 	struct ipe_bdev_blob *bdev_sec = ipe_bdev(bdev);
 
 	kfree(bdev_sec->dmverity_rh_sig);
+	kfree(bdev_sec->dmverity_rh);
 
 	memset(bdev_sec, 0x0, sizeof(*bdev_sec));
 }
@@ -78,5 +79,13 @@ int ipe_bdev_setsecurity(struct block_device *bdev, const char *key,
 		bdev_sec->dmv_rh_sig_len = len;
 	}
 
+	if (!strcmp(key, DM_VERITY_ROOTHASH_SEC_NAME)) {
+		bdev_sec->dmverity_rh = kmemdup(value, len, GFP_KERNEL);
+		if (!bdev_sec->dmverity_rh)
+			return -ENOMEM;
+
+		bdev_sec->rh_size = len;
+	}
+
 	return 0;
 }
diff --git a/security/ipe/ipe-engine.h b/security/ipe/ipe-engine.h
index 038c39a8973e..696baaa423ff 100644
--- a/security/ipe/ipe-engine.h
+++ b/security/ipe/ipe-engine.h
@@ -18,6 +18,9 @@
 struct ipe_bdev_blob {
 	u8	*dmverity_rh_sig;
 	size_t	dmv_rh_sig_len;
+
+	u8 *dmverity_rh;
+	size_t rh_size;
 };
 
 struct ipe_engine_ctx {
diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
index b7d112fce62f..35653fd8155d 100644
--- a/security/ipe/ipe.c
+++ b/security/ipe/ipe.c
@@ -48,6 +48,10 @@ static int __init ipe_load_properties(void)
 	if (rc != 0)
 		return rc;
 
+	rc = ipe_init_dm_verity_rh();
+	if (rc != 0)
+		return rc;
+
 	return rc;
 }
 
diff --git a/security/ipe/properties/Kconfig b/security/ipe/properties/Kconfig
index 4046f7e5eaef..4f09092522d9 100644
--- a/security/ipe/properties/Kconfig
+++ b/security/ipe/properties/Kconfig
@@ -14,8 +14,19 @@ config IPE_BOOT_PROP
 
 	  if unsure, answer N.
 
+config IPE_DM_VERITY_ROOTHASH
+	bool "Enable property for authorizing dm-verity volumes via root-hash"
+	depends on DM_VERITY
+	help
+	  This option enables IPE's integration with Device-Mapper Verity.
+	  This enables the usage of the property "dmverity_roothash" in IPE's
+	  policy. This property allows authorization or revocation via a
+	  a hex-string representing the roothash of a dmverity volume.
+
+	  if unsure, answer Y.
+
 config IPE_DM_VERITY_SIGNATURE
-	bool "Enable property for signature verified dm-verity volumes"
+	bool "Enable property for verified dm-verity volumes"
 	depends on DM_VERITY_VERIFY_ROOTHASH_SIG
 	help
 	  This option enables IPE's integration with Device-Mapper Verity's
diff --git a/security/ipe/properties/Makefile b/security/ipe/properties/Makefile
index 6b67cbe36e31..d9a3807797f4 100644
--- a/security/ipe/properties/Makefile
+++ b/security/ipe/properties/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_SECURITY_IPE) += properties.o
 
 properties-$(CONFIG_IPE_BOOT_PROP) += boot-verified.o
 properties-$(CONFIG_IPE_DM_VERITY_SIGNATURE) += dmverity-signature.o
+properties-$(CONFIG_IPE_DM_VERITY_ROOTHASH) += dmverity-roothash.o
diff --git a/security/ipe/properties/dmverity-roothash.c b/security/ipe/properties/dmverity-roothash.c
new file mode 100644
index 000000000000..09112e1af753
--- /dev/null
+++ b/security/ipe/properties/dmverity-roothash.c
@@ -0,0 +1,153 @@
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
+#include <linux/mount.h>
+#include <linux/audit.h>
+#include <linux/kernel.h>
+
+#define PROPERTY_NAME "dmverity_roothash"
+
+struct counted_array {
+	u8 *arr;
+	size_t len;
+};
+
+static void audit(struct audit_buffer *ab, const void *value)
+{
+	const struct counted_array *a = (const struct counted_array *)value;
+
+	if (!a || a->len == 0)
+		audit_log_format(ab, "NULL");
+	else
+		audit_log_n_hex(ab, a->arr, a->len);
+}
+
+static inline void audit_rule_value(struct audit_buffer *ab,
+				    const void *value)
+{
+	audit(ab, value);
+}
+
+static inline void audit_ctx(struct audit_buffer *ab,
+			     const struct ipe_engine_ctx *ctx)
+{
+	struct counted_array a;
+
+	if (!has_bdev(ctx->file))
+		return audit(ab, NULL);
+
+	a.arr = ctx->sec_bdev->dmverity_rh;
+	a.len = ctx->sec_bdev->rh_size;
+
+	return audit(ab, &a);
+}
+
+static bool evaluate(const struct ipe_engine_ctx *ctx,
+		     const void *value)
+{
+	const struct counted_array *a = (const struct counted_array *)value;
+
+	if (!has_bdev(ctx->file))
+		return false;
+
+	if (a->len != ctx->sec_bdev->rh_size)
+		return false;
+
+	return memcmp(a->arr, ctx->sec_bdev->dmverity_rh, a->len) == 0;
+}
+
+static int parse(const char *val_str, void **value)
+{
+	struct counted_array *arr = NULL;
+	int rv = 0;
+
+	arr = kzalloc(sizeof(*arr), GFP_KERNEL);
+	if (!arr) {
+		rv = -ENOMEM;
+		goto err;
+	}
+
+	arr->len = strlen(val_str) / 2;
+
+	arr->arr = kzalloc(arr->len, GFP_KERNEL);
+	if (!arr->arr) {
+		rv = -ENOMEM;
+		goto err;
+	}
+
+	rv = hex2bin(arr->arr, val_str, arr->len);
+	if (rv != 0)
+		goto err;
+
+	*value = arr;
+	return rv;
+err:
+	if (arr)
+		kfree(arr->arr);
+	kfree(arr);
+	return rv;
+}
+
+static int duplicate(const void *src, void **dest)
+{
+	struct counted_array *arr = NULL;
+	const struct counted_array *src_arr = src;
+	int rv = 0;
+
+	arr = kmemdup(src_arr, sizeof(*arr), GFP_KERNEL);
+	if (!arr) {
+		rv = -ENOMEM;
+		goto err;
+	}
+
+	arr->arr = kmemdup(src_arr->arr, src_arr->len, GFP_KERNEL);
+	if (!arr->arr) {
+		rv = -ENOMEM;
+		goto err;
+	}
+
+	*dest = arr;
+	return rv;
+err:
+	if (arr)
+		kfree(arr->arr);
+	kfree(arr);
+
+	return rv;
+}
+
+static void free_val(void **value)
+{
+	struct counted_array *a = (struct counted_array *)*value;
+
+	if (a)
+		kfree(a->arr);
+	kfree(a);
+	*value = NULL;
+}
+
+static const struct ipe_property dmv_roothash = {
+	.property_name = PROPERTY_NAME,
+	.version = 1,
+	.eval = evaluate,
+	.parse = parse,
+	.rule_audit = audit_rule_value,
+	.ctx_audit = audit_ctx,
+	.dup = duplicate,
+	.free_val = free_val,
+};
+
+int ipe_init_dm_verity_rh(void)
+{
+	return ipe_register_property(&dmv_roothash);
+}
diff --git a/security/ipe/properties/prop-entry.h b/security/ipe/properties/prop-entry.h
index 85366366ff0d..86a360570f3b 100644
--- a/security/ipe/properties/prop-entry.h
+++ b/security/ipe/properties/prop-entry.h
@@ -26,4 +26,13 @@ static inline int __init ipe_init_dm_verity_signature(void)
 int __init ipe_init_dm_verity_signature(void);
 #endif /* CONFIG_IPE_DM_VERITY_SIGNATURE */
 
+#ifndef CONFIG_IPE_DM_VERITY_ROOTHASH
+static inline int __init ipe_init_dm_verity_rh(void)
+{
+	return 0;
+}
+#else
+int __init ipe_init_dm_verity_rh(void);
+#endif /* CONFIG_IPE_DM_VERITY_ROOTHASH */
+
 #endif /* IPE_PROP_ENTRY_H */
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

