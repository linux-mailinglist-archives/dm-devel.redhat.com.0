Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2809C741A8F
	for <lists+dm-devel@lfdr.de>; Wed, 28 Jun 2023 23:19:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687987172;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+P5JDZhVpCmAJQxGBtxe30yUHQLPVGZF8lW/XjmPQG8=;
	b=f40QsjnYSQnhSCbsPKKaAzttkPXtBoVy+bxJT3Nsi6257740GI7nv3hh6+PrPm74oAzukf
	52bdsIM1kRXvjfA7jJ4hbr/AMov0BQIjtvjNcfDePxxIUi8e2trEybvNAgJVy2Vw98Oeff
	ewhTOMFMn61+12anYK/swZ5rYi+VJ9Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-UwPZLcMINyy5zTroMXVMMA-1; Wed, 28 Jun 2023 17:19:26 -0400
X-MC-Unique: UwPZLcMINyy5zTroMXVMMA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65A031C0725B;
	Wed, 28 Jun 2023 21:19:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6692E40D1A4;
	Wed, 28 Jun 2023 21:18:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 561431946A51;
	Wed, 28 Jun 2023 21:18:47 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2B9681946589
 for <dm-devel@listman.corp.redhat.com>; Wed, 28 Jun 2023 21:18:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F38102166B26; Wed, 28 Jun 2023 21:18:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC2252166B25
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 21:18:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0D17185A78F
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 21:18:43 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-124-ywYGwVrFOeKcDKnI2In6yw-1; Wed,
 28 Jun 2023 17:18:41 -0400
X-MC-Unique: ywYGwVrFOeKcDKnI2In6yw-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 9FB0920ABD7E; Wed, 28 Jun 2023 14:09:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9FB0920ABD7E
From: Fan Wu <wufan@linux.microsoft.com>
To: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com,
 snitzer@kernel.org, eparis@redhat.com, paul@paul-moore.com
Date: Wed, 28 Jun 2023 14:09:25 -0700
Message-Id: <1687986571-16823-12-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1687986571-16823-1-git-send-email-wufan@linux.microsoft.com>
References: <1687986571-16823-1-git-send-email-wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [RFC PATCH v10 11/17] dm-verity: consume root hash
 digest and signature data via LSM hook
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
Cc: dm-devel@redhat.com, linux-doc@vger.kernel.org,
 Deven Bowers <deven.desai@linux.microsoft.com>, roberto.sassu@huawei.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, audit@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Fan Wu <wufan@linux.microsoft.com>,
 linux-integrity@vger.kernel.org
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Deven Bowers <deven.desai@linux.microsoft.com>

dm-verity provides a strong guarantee of a block device's integrity. As
a generic way to check the integrity of a block device, it provides
those integrity guarantees to its higher layers, including the filesystem
level.

An LSM that control access to a resource on the system based on the
available integrity claims can use this transitive property of
dm-verity, by querying the underlying block_device of a particular
file.

The digest and signature information need to be stored in the block
device to fulfill the next requirement of authorization via LSM policy.
This will enable the LSM to perform revocation of devices that are still
mounted, prohibiting execution of files that are no longer authorized
by the LSM in question.

This patch added two security hook calls in dm-verity to save the
dm-verity roothash and the roothash signature to LSM blobs.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
---
v2:
  + No Changes

v3:
  + No changes

v4:
  + No changes

v5:
  + No changes

v6:
  + Fix an improper cleanup that can result in
    a leak

v7:
  + Squash patch 08/12, 10/12 to [11/16]
  + Use part0 for block_device, to retrieve the block_device, when
    calling security_bdev_setsecurity

v8:
  + Undo squash of 08/12, 10/12 - separating drivers/md/ from
    security/ & block/
  + Use common-audit function for dmverity_signature.
  + Change implementation for storing the dm-verity digest to use the
    newly introduced dm_verity_digest structure introduced in patch
    14/20.
  + Create new structure, dm_verity_digest, containing digest algorithm,
    size, and digest itself to pass to the LSM layer. V7 was missing the
    algorithm.
  + Create an associated public header containing this new structure and
    the key values for the LSM hook, specific to dm-verity.
  + Additional information added to commit, discussing the layering of
    the changes and how the information passed will be used.

v9:
  + No changes

v10:
  + No changes
---
 drivers/md/dm-verity-target.c     | 25 +++++++++++++++++++++++--
 drivers/md/dm-verity-verify-sig.c | 16 +++++++++++++---
 drivers/md/dm-verity-verify-sig.h | 10 ++++++----
 include/linux/dm-verity.h         | 19 +++++++++++++++++++
 4 files changed, 61 insertions(+), 9 deletions(-)
 create mode 100644 include/linux/dm-verity.h

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 26adcfea0302..54d46b2f2723 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -13,6 +13,7 @@
  * access behavior.
  */
 
+#include "dm-core.h"
 #include "dm-verity.h"
 #include "dm-verity-fec.h"
 #include "dm-verity-verify-sig.h"
@@ -22,6 +23,9 @@
 #include <linux/scatterlist.h>
 #include <linux/string.h>
 #include <linux/jump_label.h>
+#include <linux/security.h>
+#include <linux/dm-verity.h>
+#include <crypto/hash_info.h>
 
 #define DM_MSG_PREFIX			"verity"
 
@@ -1183,6 +1187,8 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	sector_t hash_position;
 	char dummy;
 	char *root_hash_digest_to_validate;
+	struct block_device *bdev;
+	struct dm_verity_digest root_digest;
 
 	v = kzalloc(sizeof(struct dm_verity), GFP_KERNEL);
 	if (!v) {
@@ -1225,6 +1231,13 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 	v->version = num;
 
+	bdev = dm_table_get_md(ti->table)->disk->part0;
+	if (!bdev) {
+		ti->error = "Mapped device lookup failed";
+		r = -ENOMEM;
+		goto bad;
+	}
+
 	r = dm_get_device(ti, argv[1], BLK_OPEN_READ, &v->data_dev);
 	if (r) {
 		ti->error = "Data device lookup failed";
@@ -1357,7 +1370,7 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 
 	/* Root hash signature is  a optional parameter*/
-	r = verity_verify_root_hash(root_hash_digest_to_validate,
+	r = verity_verify_root_hash(bdev, root_hash_digest_to_validate,
 				    strlen(root_hash_digest_to_validate),
 				    verify_args.sig,
 				    verify_args.sig_size);
@@ -1440,6 +1453,15 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	ti->per_io_data_size = roundup(ti->per_io_data_size,
 				       __alignof__(struct dm_verity_io));
 
+	root_digest.digest = v->root_digest;
+	root_digest.digest_len = v->digest_size;
+	root_digest.algo = v->alg_name;
+
+	r = security_bdev_setsecurity(bdev, DM_VERITY_ROOTHASH_SEC_NAME, &root_digest,
+				      sizeof(root_digest));
+	if (r)
+		goto bad;
+
 	verity_verify_sig_opts_cleanup(&verify_args);
 
 	dm_audit_log_ctr(DM_MSG_PREFIX, ti, 1);
@@ -1447,7 +1469,6 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	return 0;
 
 bad:
-
 	verity_verify_sig_opts_cleanup(&verify_args);
 	dm_audit_log_ctr(DM_MSG_PREFIX, ti, 0);
 	verity_dtr(ti);
diff --git a/drivers/md/dm-verity-verify-sig.c b/drivers/md/dm-verity-verify-sig.c
index 4836508ea50c..33165dd7470f 100644
--- a/drivers/md/dm-verity-verify-sig.c
+++ b/drivers/md/dm-verity-verify-sig.c
@@ -9,6 +9,9 @@
 #include <linux/verification.h>
 #include <keys/user-type.h>
 #include <linux/module.h>
+#include <linux/security.h>
+#include <linux/dm-verity.h>
+#include "dm-core.h"
 #include "dm-verity.h"
 #include "dm-verity-verify-sig.h"
 
@@ -97,14 +100,17 @@ int verity_verify_sig_parse_opt_args(struct dm_arg_set *as,
  * verify_verify_roothash - Verify the root hash of the verity hash device
  *			     using builtin trusted keys.
  *
+ * @bdev: block_device representing the device-mapper created block device.
+ *	  Used by the security hook, to set information about the block_device.
  * @root_hash: For verity, the roothash/data to be verified.
  * @root_hash_len: Size of the roothash/data to be verified.
  * @sig_data: The trusted signature that verifies the roothash/data.
  * @sig_len: Size of the signature.
  *
  */
-int verity_verify_root_hash(const void *root_hash, size_t root_hash_len,
-			    const void *sig_data, size_t sig_len)
+int verity_verify_root_hash(struct block_device *bdev, const void *root_hash,
+			    size_t root_hash_len, const void *sig_data,
+			    size_t sig_len)
 {
 	int ret;
 
@@ -126,8 +132,12 @@ int verity_verify_root_hash(const void *root_hash, size_t root_hash_len,
 				NULL,
 #endif
 				VERIFYING_UNSPECIFIED_SIGNATURE, NULL, NULL);
+	if (ret)
+		return ret;
 
-	return ret;
+	return security_bdev_setsecurity(bdev,
+					 DM_VERITY_SIGNATURE_SEC_NAME,
+					 sig_data, sig_len);
 }
 
 void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts)
diff --git a/drivers/md/dm-verity-verify-sig.h b/drivers/md/dm-verity-verify-sig.h
index f36ea92127bf..5c6023fac97b 100644
--- a/drivers/md/dm-verity-verify-sig.h
+++ b/drivers/md/dm-verity-verify-sig.h
@@ -20,8 +20,9 @@ struct dm_verity_sig_opts {
 
 #define DM_VERITY_ROOT_HASH_VERIFICATION_OPTS 2
 
-int verity_verify_root_hash(const void *data, size_t data_len,
-			    const void *sig_data, size_t sig_len);
+int verity_verify_root_hash(struct block_device *bdev, const void *data,
+			    size_t data_len, const void *sig_data,
+			    size_t sig_len);
 bool verity_verify_is_sig_opt_arg(const char *arg_name);
 
 int verity_verify_sig_parse_opt_args(struct dm_arg_set *as, struct dm_verity *v,
@@ -34,8 +35,9 @@ void verity_verify_sig_opts_cleanup(struct dm_verity_sig_opts *sig_opts);
 
 #define DM_VERITY_ROOT_HASH_VERIFICATION_OPTS 0
 
-static inline int verity_verify_root_hash(const void *data, size_t data_len,
-					  const void *sig_data, size_t sig_len)
+int verity_verify_root_hash(struct block_device *bdev, const void *data,
+			    size_t data_len, const void *sig_data,
+			    size_t sig_len)
 {
 	return 0;
 }
diff --git a/include/linux/dm-verity.h b/include/linux/dm-verity.h
new file mode 100644
index 000000000000..bb0413d55d72
--- /dev/null
+++ b/include/linux/dm-verity.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_DM_VERITY_H
+#define _LINUX_DM_VERITY_H
+
+#include <linux/types.h>
+#include <crypto/hash_info.h>
+#include <linux/device-mapper.h>
+
+struct dm_verity_digest {
+	const char *algo;
+	const u8 *digest;
+	size_t digest_len;
+};
+
+#define DM_VERITY_SIGNATURE_SEC_NAME DM_NAME	".verity-signature"
+#define DM_VERITY_ROOTHASH_SEC_NAME  DM_NAME	".verity-roothash"
+
+#endif /* _LINUX_DM_VERITY_H */
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

