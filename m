Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8E445750
	for <lists+dm-devel@lfdr.de>; Fri, 14 Jun 2019 10:18:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF81130821AE;
	Fri, 14 Jun 2019 08:18:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8019A66D31;
	Fri, 14 Jun 2019 08:18:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CA434A460;
	Fri, 14 Jun 2019 08:18:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5D0iEs7018010 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 20:44:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 768487BE93; Thu, 13 Jun 2019 00:44:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA8FC600CC;
	Thu, 13 Jun 2019 00:44:07 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by mx1.redhat.com (Postfix) with ESMTP id 140E030C318C;
	Thu, 13 Jun 2019 00:43:50 +0000 (UTC)
Received: from
	jaskaran-Intel-Server-Board-S1200V3RPS-UEFI-Development-Kit.corp.microsoft.com
	(unknown [131.107.160.238])
	by linux.microsoft.com (Postfix) with ESMTPSA id 53E3C20B719F;
	Wed, 12 Jun 2019 17:43:37 -0700 (PDT)
From: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-fsdevel@vger.kernel.org
Date: Wed, 12 Jun 2019 17:43:28 -0700
Message-Id: <20190613004328.4274-2-jaskarankhurana@linux.microsoft.com>
In-Reply-To: <20190613004328.4274-1-jaskarankhurana@linux.microsoft.com>
References: <20190613004328.4274-1-jaskarankhurana@linux.microsoft.com>
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 13 Jun 2019 00:43:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 13 Jun 2019 00:43:56 +0000 (UTC) for IP:'13.77.154.182'
	DOMAIN:'linux.microsoft.com' HELO:'linux.microsoft.com'
	FROM:'jaskarankhurana@linux.microsoft.com' RCPT:''
X-RedHat-Spam-Score: -8.002  (ENV_AND_HDR_SPF_MATCH, SPF_HELO_PASS, SPF_PASS,
	USER_IN_DEF_SPF_WL) 13.77.154.182 linux.microsoft.com
	13.77.154.182 linux.microsoft.com
	<jaskarankhurana@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Jun 2019 04:15:49 -0400
Cc: scottsh@microsoft.com, snitzer@redhat.com, ebiggers@google.com,
	jmorris@namei.org, dm-devel@redhat.com, mpatocka@redhat.com, agk@redhat.com
Subject: [dm-devel] [RFC PATCH v4 1/1] Add dm verity root hash pkcs7 sig
	validation.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 14 Jun 2019 08:18:37 +0000 (UTC)

The verification is to support cases where the roothash is not secured by
Trusted Boot, UEFI Secureboot or similar technologies.
One of the use cases for this is for dm-verity volumes mounted after boot,
the root hash provided during the creation of the dm-verity volume has to
be secure and thus in-kernel validation implemented here will be used
before we trust the root hash and allow the block device to be created.

The signature being provided for verification must verify the root hash and
must be trusted by the builtin keyring for verification to succeed.

The hash is added as a key of type "user" and the description is passed to
the kernel so it can look it up and use it for verification.

Adds DM_VERITY_VERIFY_ROOTHASH_SIG: roothash verification
against the roothash signature file *if* specified, if signature file is
specified verification must succeed prior to creation of device mapper
block device.

Adds DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE: roothash signature *must* be
specified for all dm verity volumes and verification must succeed prior
to creation of device mapper block device.

Signed-off-by: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
---
 Documentation/device-mapper/verity.txt |   7 ++
 drivers/md/Kconfig                     |  23 +++++
 drivers/md/Makefile                    |   2 +-
 drivers/md/dm-verity-target.c          |  36 ++++++-
 drivers/md/dm-verity-verify-sig.c      | 132 +++++++++++++++++++++++++
 drivers/md/dm-verity-verify-sig.h      |  30 ++++++
 6 files changed, 224 insertions(+), 6 deletions(-)
 create mode 100644 drivers/md/dm-verity-verify-sig.c
 create mode 100644 drivers/md/dm-verity-verify-sig.h

diff --git a/Documentation/device-mapper/verity.txt b/Documentation/device-mapper/verity.txt
index b3d2e4a42255..df7ef1d553cc 100644
--- a/Documentation/device-mapper/verity.txt
+++ b/Documentation/device-mapper/verity.txt
@@ -121,6 +121,13 @@ check_at_most_once
     blocks, and a hash block will not be verified any more after all the data
     blocks it covers have been verified anyway.
 
+root_hash_sig_key_desc <key_description>
+    This is the description of the USER_KEY that the kernel will lookup to get
+    the pkcs7 signature of the roothash. The pkcs7 signature is used to validate
+    the root hash during the creation of the device mapper block device.
+    Verification of roothash depends on the config DM_VERITY_VERIFY_ROOTHASH_SIG
+    being set in the kernel.
+
 Theory of operation
 ===================
 
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index db269a348b20..da4115753f25 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -489,6 +489,29 @@ config DM_VERITY
 
 	  If unsure, say N.
 
+config DM_VERITY_VERIFY_ROOTHASH_SIG
+	def_bool n
+	bool "Verity data device root hash signature verification support"
+	depends on DM_VERITY
+	select SYSTEM_DATA_VERIFICATION
+	  help
+	  The device mapper target created by DM-VERITY can be validated if the
+	  pre-generated tree of cryptographic checksums passed has a pkcs#7
+	  signature file that can validate the roothash of the tree.
+
+	  If unsure, say N.
+
+config DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE
+	def_bool n
+	bool "Forces all dm verity data device root hash should be signed"
+	depends on DM_VERITY_VERIFY_ROOTHASH_SIG
+	  help
+	  The device mapper target created by DM-VERITY will succeed only if the
+	  pre-generated tree of cryptographic checksums passed also has a pkcs#7
+	  signature file that can validate the roothash of the tree.
+
+	  If unsure, say N.
+
 config DM_VERITY_FEC
 	bool "Verity forward error correction support"
 	depends on DM_VERITY
diff --git a/drivers/md/Makefile b/drivers/md/Makefile
index be7a6eb92abc..8a8c142bcfe1 100644
--- a/drivers/md/Makefile
+++ b/drivers/md/Makefile
@@ -61,7 +61,7 @@ obj-$(CONFIG_DM_LOG_USERSPACE)	+= dm-log-userspace.o
 obj-$(CONFIG_DM_ZERO)		+= dm-zero.o
 obj-$(CONFIG_DM_RAID)	+= dm-raid.o
 obj-$(CONFIG_DM_THIN_PROVISIONING)	+= dm-thin-pool.o
-obj-$(CONFIG_DM_VERITY)		+= dm-verity.o
+obj-$(CONFIG_DM_VERITY)		+= dm-verity.o dm-verity-verify-sig.o
 obj-$(CONFIG_DM_CACHE)		+= dm-cache.o
 obj-$(CONFIG_DM_CACHE_SMQ)	+= dm-cache-smq.o
 obj-$(CONFIG_DM_ERA)		+= dm-era.o
diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index f4c31ffaa88e..adf7f376be7d 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -16,7 +16,7 @@
 
 #include "dm-verity.h"
 #include "dm-verity-fec.h"
-
+#include "dm-verity-verify-sig.h"
 #include <linux/module.h>
 #include <linux/reboot.h>
 
@@ -34,7 +34,8 @@
 #define DM_VERITY_OPT_IGN_ZEROES	"ignore_zero_blocks"
 #define DM_VERITY_OPT_AT_MOST_ONCE	"check_at_most_once"
 
-#define DM_VERITY_OPTS_MAX		(2 + DM_VERITY_OPTS_FEC)
+#define DM_VERITY_OPTS_MAX		(2 + DM_VERITY_OPTS_FEC + \
+					 DM_VERITY_ROOT_HASH_VERIFICATION_OPTS)
 
 static unsigned dm_verity_prefetch_cluster = DM_VERITY_DEFAULT_PREFETCH_SIZE;
 
@@ -855,7 +856,8 @@ static int verity_alloc_zero_digest(struct dm_verity *v)
 	return r;
 }
 
-static int verity_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v)
+static int verity_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
+				 struct dm_verity_sig_opts *verify_args)
 {
 	int r;
 	unsigned argc;
@@ -904,6 +906,14 @@ static int verity_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v)
 			if (r)
 				return r;
 			continue;
+		} else if (verity_verify_is_sig_opt_arg(arg_name)) {
+			r = verity_verify_sig_parse_opt_args(as, v,
+							     verify_args,
+							     &argc, arg_name);
+			if (r)
+				return r;
+			continue;
+
 		}
 
 		ti->error = "Unrecognized verity feature request";
@@ -930,6 +940,7 @@ static int verity_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v)
 static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 {
 	struct dm_verity *v;
+	struct dm_verity_sig_opts verify_args = {0};
 	struct dm_arg_set as;
 	unsigned int num;
 	unsigned long long num_ll;
@@ -937,6 +948,7 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	int i;
 	sector_t hash_position;
 	char dummy;
+	char *root_hash_digest_to_validate;
 
 	v = kzalloc(sizeof(struct dm_verity), GFP_KERNEL);
 	if (!v) {
@@ -1070,6 +1082,7 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		r = -EINVAL;
 		goto bad;
 	}
+	root_hash_digest_to_validate = argv[8];
 
 	if (strcmp(argv[9], "-")) {
 		v->salt_size = strlen(argv[9]) / 2;
@@ -1095,11 +1108,20 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		as.argc = argc;
 		as.argv = argv;
 
-		r = verity_parse_opt_args(&as, v);
+		r = verity_parse_opt_args(&as, v, &verify_args);
 		if (r < 0)
 			goto bad;
 	}
 
+	/* Root hash signature is  a optional parameter*/
+	r = verity_verify_root_hash(root_hash_digest_to_validate,
+				    strlen(root_hash_digest_to_validate),
+				    verify_args.sig,
+				    verify_args.sig_size);
+	if (r < 0) {
+		ti->error = "Root hash verification failed";
+		goto bad;
+	}
 	v->hash_per_block_bits =
 		__fls((1 << v->hash_dev_block_bits) / v->digest_size);
 
@@ -1165,9 +1187,13 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	ti->per_io_data_size = roundup(ti->per_io_data_size,
 				       __alignof__(struct dm_verity_io));
 
+	verity_verify_sig_opts_cleanup(&verify_args);
+
 	return 0;
 
 bad:
+
+	verity_verify_sig_opts_cleanup(&verify_args);
 	verity_dtr(ti);
 
 	return r;
@@ -1175,7 +1201,7 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 
 static struct target_type verity_target = {
 	.name		= "verity",
-	.version	= {1, 4, 0},
+	.version	= {1, 5, 0},
 	.module		= THIS_MODULE,
 	.ctr		= verity_ctr,
 	.dtr		= verity_dtr,
diff --git a/drivers/md/dm-verity-verify-sig.c b/drivers/md/dm-verity-verify-sig.c
new file mode 100644
index 000000000000..1a889be76ede
--- /dev/null
+++ b/drivers/md/dm-verity-verify-sig.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Microsoft Corporation.
+ *
+ * Author:  Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
+ *
+ */
+#include <linux/device-mapper.h>
+#include <linux/verification.h>
+#include <keys/user-type.h>
+#include "dm-verity.h"
+#include "dm-verity-verify-sig.h"
+
+#define DM_VERITY_VERIFY_ERR(s) DM_VERITY_ROOT_HASH_VERIFICATION " " s
+
+
+bool verity_verify_is_sig_opt_arg(const char *arg_name)
+{
+	return (!strcasecmp(arg_name,
+			    DM_VERITY_ROOT_HASH_VERIFICATION_OPT_SIG_KEY));
+}
+
+static int verity_verify_get_sig_from_key(const char *key_desc,
+					struct dm_verity_sig_opts *sig_opts)
+{
+	struct key *key;
+	const struct user_key_payload *ukp;
+	int ret = 0;
+
+	if (!IS_ENABLED(CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG))
+		return 0;
+
+	key = request_key(&key_type_user,
+			key_desc, NULL);
+	if (IS_ERR(key))
+		return PTR_ERR(key);
+
+	down_read(&key->sem);
+
+	ukp = user_key_payload_locked(key);
+	if (!ukp) {
+		ret = -EKEYREVOKED;
+		goto end;
+	}
+
+	sig_opts->sig = kmalloc(ukp->datalen, GFP_KERNEL);
+	if (!sig_opts->sig) {
+		ret = -ENOMEM;
+		goto end;
+	}
+	sig_opts->sig_size = ukp->datalen;
+
+	memcpy(sig_opts->sig, ukp->data, sig_opts->sig_size);
+
+end:
+	up_read(&key->sem);
+	key_put(key);
+
+	return ret;
+}
+
+int verity_verify_sig_parse_opt_args(struct dm_arg_set *as,
+				     struct dm_verity *v,
+				     struct dm_verity_sig_opts *sig_opts,
+				     unsigned int *argc,
+				     const char *arg_name)
+{
+	struct dm_target *ti = v->ti;
+	int ret = 0;
+	const char *sig_key = NULL;
+
+	if (!*argc) {
+		ti->error = DM_VERITY_VERIFY_ERR("Signature key not specified");
+		return -EINVAL;
+	}
+
+	sig_key = dm_shift_arg(as);
+	(*argc)--;
+
+	ret = verity_verify_get_sig_from_key(sig_key, sig_opts);
+	if (ret < 0)
+		ti->error = DM_VERITY_VERIFY_ERR("Invalid key specified");
+
+	return ret;
+}
+
+#ifdef CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG
+/*
+ * verify_verify_roothash - Verify the root hash of the verity hash device
+ *			     using builtin trusted keys.
+ *
+ * @root_hash: For verity, the roothash/data to be verified.
+ * @root_hash_len: Size of the roothash/data to be verified.
+ * @sig_data: The trusted signature that verifies the roothash/data.
+ * @sig_len: Size of the signature.
+ *
+ */
+int verity_verify_root_hash(const void *root_hash, size_t root_hash_len,
+			    const void *sig_data, size_t sig_len)
+{
+	int ret;
+
+	if (!root_hash || root_hash_len == 0)
+		return -EINVAL;
+
+	if (!sig_data  || sig_len == 0) {
+		if (IS_ENABLED(CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG_FORCE))
+			return -ENOKEY;
+		else
+			return 0;
+	}
+
+	ret = verify_pkcs7_signature(root_hash, root_hash_len, sig_data,
+				sig_len, NULL, VERIFYING_UNSPECIFIED_SIGNATURE,
+				NULL, NULL);
+
+	return ret;
+}
+#else
+int verity_verify_root_hash(const void *root_hash, size_t root_hash_len,
+			    const void *sig_data, size_t sig_len)
+{
+	return 0;
+}
+#endif
+
+void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts)
+{
+	kfree(sig_opts->sig);
+	sig_opts->sig = NULL;
+	sig_opts->sig_size = 0;
+}
diff --git a/drivers/md/dm-verity-verify-sig.h b/drivers/md/dm-verity-verify-sig.h
new file mode 100644
index 000000000000..339818e6b527
--- /dev/null
+++ b/drivers/md/dm-verity-verify-sig.h
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019 Microsoft Corporation.
+ *
+ * Author:  Jaskaran Singh Khurana <jaskarankhurana@linux.microsoft.com>
+ *
+ */
+#ifndef DM_VERITY_SIG_VERIFICATION_H
+#define DM_VERITY_SIG_VERIFICATION_H
+
+#define DM_VERITY_ROOT_HASH_VERIFICATION "DM Verity Sig Verification"
+#define DM_VERITY_ROOT_HASH_VERIFICATION_OPT_SIG_KEY "root_hash_sig_key_desc"
+#define DM_VERITY_ROOT_HASH_VERIFICATION_OPTS 2
+
+struct dm_verity_sig_opts {
+	unsigned int sig_size;
+	u8 *sig;
+};
+int verity_verify_root_hash(const void *data, size_t data_len,
+			    const void *sig_data, size_t sig_len);
+
+bool verity_verify_is_sig_opt_arg(const char *arg_name);
+
+int verity_verify_sig_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
+				    struct dm_verity_sig_opts *sig_opts,
+				    unsigned int *argc, const char *arg_name);
+
+void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts);
+
+#endif /* DM_VERITY_SIG_VERIFICATION_H */
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
