Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9D57B973D
	for <lists+dm-devel@lfdr.de>; Thu,  5 Oct 2023 00:15:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696457733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WFcij2i0fXGUTtYb+27S+y3XIzSuRQIeQDYJPzsVDgI=;
	b=bPOviuS30IpmEF/iObPlTeQHbmrb96fm44vZ5YX8ZwFvjirMuHuptfXDyEEwp1Bn+yof3e
	HZNsxnnCW56KjRFGFtUu0SVySmBb1PT3ahydgLlgUhdpXOEBoWzvnVU4DoGPTR8zhI+U5/
	1UMEtlv1SiqJ2omogeaJZAgec1rfBm4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-Nx0SPJEpOD-wNObBuJ2JKg-1; Wed, 04 Oct 2023 18:15:28 -0400
X-MC-Unique: Nx0SPJEpOD-wNObBuJ2JKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9487101A53B;
	Wed,  4 Oct 2023 22:15:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FDD540C2015;
	Wed,  4 Oct 2023 22:15:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DD1AA19466EA;
	Wed,  4 Oct 2023 22:15:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 22359194658F
 for <dm-devel@listman.corp.redhat.com>; Wed,  4 Oct 2023 22:15:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 13E402156720; Wed,  4 Oct 2023 22:15:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CB472156711
 for <dm-devel@redhat.com>; Wed,  4 Oct 2023 22:15:13 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF1CD81B15E
 for <dm-devel@redhat.com>; Wed,  4 Oct 2023 22:15:12 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-605-xxIHrTNrMK-r7nFRybModw-1; Wed,
 04 Oct 2023 18:15:09 -0400
X-MC-Unique: xxIHrTNrMK-r7nFRybModw-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 19FFF20B74C5; Wed,  4 Oct 2023 15:09:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 19FFF20B74C5
From: Fan Wu <wufan@linux.microsoft.com>
To: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com,
 snitzer@kernel.org, eparis@redhat.com, paul@paul-moore.com
Date: Wed,  4 Oct 2023 15:09:43 -0700
Message-Id: <1696457386-3010-17-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1696457386-3010-1-git-send-email-wufan@linux.microsoft.com>
References: <1696457386-3010-1-git-send-email-wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [RFC PATCH v11 16/19] ipe: enable support for fs-verity
 as a trust provider
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable IPE policy authors to indicate trust for a singular fsverity
file, identified by the digest information, through "fsverity_digest"
and all files using fsverity's builtin signatures via
"fsverity_signature".

This enables file-level integrity claims to be expressed in IPE,
allowing individual files to be authorized, giving some flexibility
for policy authors. Such file-level claims are important to be expressed
for enforcing the integrity of packages, as well as address some of the
scalability issues in a sole dm-verity based solution (# of loop back
devices, etc).

This solution cannot be done in userspace as the minimum threat that
IPE should mitigate is an attacker downloads malicious payload with
all required dependencies. These dependencies can lack the userspace
check, bypassing the protection entirely. A similar attack succeeds if
the userspace component is replaced with a version that does not
perform the check. As a result, this can only be done in the common
entry point - the kernel.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
---
v1-v6:
  + Not present

v7:
  Introduced

v8:
  * Undo squash of 08/12, 10/12 - separating drivers/md/ from security/
  * Use common-audit function for fsverity_signature.
  + Change fsverity implementation to use fsverity_get_digest
  + prevent unnecessary copy of fs-verity signature data, instead
    just check for presence of signature data.
  + Remove free_inode_security hook, as the digest is now acquired
    at runtime instead of via LSM blob.

v9:
  + Adapt to the new parser

v10:
  + Update the fsverity get digest call

v11:
  + No changes
---
 security/ipe/Kconfig         |  13 +++++
 security/ipe/audit.c         |  23 ++++++++
 security/ipe/eval.c          | 110 +++++++++++++++++++++++++++++++++++
 security/ipe/eval.h          |  10 ++++
 security/ipe/hooks.c         |  30 ++++++++++
 security/ipe/hooks.h         |   7 +++
 security/ipe/ipe.c           |  13 +++++
 security/ipe/ipe.h           |   3 +
 security/ipe/policy.h        |   3 +
 security/ipe/policy_parser.c |   8 +++
 10 files changed, 220 insertions(+)

diff --git a/security/ipe/Kconfig b/security/ipe/Kconfig
index 7afb1ce0cb99..9dd5c4769d79 100644
--- a/security/ipe/Kconfig
+++ b/security/ipe/Kconfig
@@ -30,6 +30,19 @@ config IPE_PROP_DM_VERITY
 	  that was mounted with a signed root-hash or the volume's
 	  root hash matches the supplied value in the policy.
 
+	  If unsure, answer Y.
+
+config IPE_PROP_FS_VERITY
+	bool "Enable property for fs-verity files"
+	depends on FS_VERITY && FS_VERITY_BUILTIN_SIGNATURES
+	help
+	  This option enables the usage of properties "fsverity_signature"
+	  and "fsverity_digest". These properties evaluates to TRUE when
+	  a file is fsverity enabled and with a signed digest or its
+	  diegst matches the supplied value in the policy.
+
+	  if unsure, answer Y.
+
 endmenu
 
 endif
diff --git a/security/ipe/audit.c b/security/ipe/audit.c
index b5c58655ac74..e3a8552a76a4 100644
--- a/security/ipe/audit.c
+++ b/security/ipe/audit.c
@@ -46,6 +46,11 @@ static const char *const audit_prop_names[__IPE_PROP_MAX] = {
 	"dmverity_signature=FALSE",
 	"dmverity_signature=TRUE",
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+	"fsverity_digest=",
+	"fsverity_signature=FALSE",
+	"fsverity_signature=TRUE"
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
 };
 
 #ifdef CONFIG_IPE_PROP_DM_VERITY
@@ -64,6 +69,22 @@ static void audit_dmv_roothash(struct audit_buffer *ab, const void *rh)
 }
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
 
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+/**
+ * audit_fsv_digest - audit a digest of a fsverity file.
+ * @ab: Supplies a pointer to the audit_buffer to append to.
+ * @d: Supplies a pointer to the digest structure.
+ */
+static void audit_fsv_digest(struct audit_buffer *ab, const void *d)
+{
+	ipe_digest_audit(ab, d);
+}
+#else
+static void audit_fsv_digest(struct audit_buffer *ab, const void *d)
+{
+}
+#endif /* CONFIG_IPE_PROP_DM_VERITY */
+
 /**
  * audit_rule - audit an IPE policy rule approximation.
  * @ab: Supplies a pointer to the audit_buffer to append to.
@@ -79,6 +100,8 @@ static void audit_rule(struct audit_buffer *ab, const struct ipe_rule *r)
 		audit_log_format(ab, "%s", audit_prop_names[ptr->type]);
 		if (ptr->type == IPE_PROP_DMV_ROOTHASH)
 			audit_dmv_roothash(ab, ptr->value);
+		if (ptr->type == IPE_PROP_FSV_DIGEST)
+			audit_fsv_digest(ab, ptr->value);
 
 		audit_log_format(ab, " ");
 	}
diff --git a/security/ipe/eval.c b/security/ipe/eval.c
index 82ad48d7aa3d..f0194b0ca2ff 100644
--- a/security/ipe/eval.c
+++ b/security/ipe/eval.c
@@ -11,6 +11,7 @@
 #include <linux/rcupdate.h>
 #include <linux/spinlock.h>
 #include <linux/moduleparam.h>
+#include <linux/fsverity.h>
 
 #include "ipe.h"
 #include "eval.h"
@@ -78,6 +79,23 @@ static void build_ipe_bdev_ctx(struct ipe_eval_ctx *ctx, const struct inode *con
 }
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
 
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+/**
+ * build_ipe_inode_ctx - Build inode fields of an evaluation context.
+ * @ctx: Supplies a pointer to the context to be populdated.
+ * @ino: Supplies the inode struct of the file triggered IPE event.
+ */
+static void build_ipe_inode_ctx(struct ipe_eval_ctx *ctx, const struct inode *const ino)
+{
+	ctx->ino = ino;
+	ctx->ipe_inode = ipe_inode(ctx->ino);
+}
+#else
+static void build_ipe_inode_ctx(struct ipe_eval_ctx *ctx, const struct inode *const ino)
+{
+}
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
+
 /**
  * build_eval_ctx - Build an evaluation context.
  * @ctx: Supplies a pointer to the context to be populdated.
@@ -100,6 +118,7 @@ void build_eval_ctx(struct ipe_eval_ctx *ctx,
 		ctx->from_init_sb = from_pinned(FILE_SUPERBLOCK(file));
 		ino = d_real_inode(file->f_path.dentry);
 		build_ipe_bdev_ctx(ctx, ino);
+		build_ipe_inode_ctx(ctx, ino);
 	}
 }
 
@@ -172,6 +191,91 @@ static bool evaluate_dmv_sig_true(const struct ipe_eval_ctx *const ctx,
 }
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
 
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+/**
+ * evaluate_fsv_digest - Analyze @ctx against a fsv digest property.
+ * @ctx: Supplies a pointer to the context being evaluated.
+ * @p: Supplies a pointer to the property being evaluated.
+ *
+ * Return:
+ * * true	- The current @ctx match the @p
+ * * false	- The current @ctx doesn't match the @p
+ */
+static bool evaluate_fsv_digest(const struct ipe_eval_ctx *const ctx,
+				struct ipe_prop *p)
+{
+	enum hash_algo alg;
+	u8 digest[FS_VERITY_MAX_DIGEST_SIZE];
+
+	if (!ctx->ino)
+		return false;
+	if (!fsverity_get_digest((struct inode *)ctx->ino,
+				 digest,
+				 NULL,
+				 &alg))
+		return false;
+
+	return ipe_digest_eval(p->value,
+			       digest,
+			       hash_digest_size[alg],
+			       hash_algo_name[alg]);
+}
+
+/**
+ * evaluate_fsv_sig_false - Analyze @ctx against a fsv sig false property.
+ * @ctx: Supplies a pointer to the context being evaluated.
+ * @p: Supplies a pointer to the property being evaluated.
+ *
+ * Return:
+ * * true	- The current @ctx match the @p
+ * * false	- The current @ctx doesn't match the @p
+ */
+static bool evaluate_fsv_sig_false(const struct ipe_eval_ctx *const ctx,
+				   struct ipe_prop *p)
+{
+	return !ctx->ino ||
+	       !IS_VERITY(ctx->ino) ||
+	       !ctx->ipe_inode ||
+	       !ctx->ipe_inode->fs_verity_signed;
+}
+
+/**
+ * evaluate_fsv_sig_true - Analyze @ctx against a fsv sig true property.
+ * @ctx: Supplies a pointer to the context being evaluated.
+ * @p: Supplies a pointer to the property being evaluated.
+ *
+ * Return:
+ * * true - The current @ctx match the @p
+ * * false - The current @ctx doesn't match the @p
+ */
+static bool evaluate_fsv_sig_true(const struct ipe_eval_ctx *const ctx,
+				  struct ipe_prop *p)
+{
+	return ctx->ino &&
+	       IS_VERITY(ctx->ino) &&
+	       ctx->ipe_inode &&
+	       ctx->ipe_inode->fs_verity_signed;
+}
+#else
+static bool evaluate_fsv_digest(const struct ipe_eval_ctx *const ctx,
+				struct ipe_prop *p)
+{
+	return false;
+}
+
+static bool evaluate_fsv_sig_false(const struct ipe_eval_ctx *const ctx,
+				   struct ipe_prop *p)
+{
+	return false;
+}
+
+static bool evaluate_fsv_sig_true(const struct ipe_eval_ctx *const ctx,
+				  struct ipe_prop *p)
+{
+	return false;
+}
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
+
 /**
  * evaluate_property - Analyze @ctx against a property.
  * @ctx: Supplies a pointer to the context to be evaluated.
@@ -195,6 +299,12 @@ static bool evaluate_property(const struct ipe_eval_ctx *const ctx,
 		return evaluate_dmv_sig_false(ctx, p);
 	case IPE_PROP_DMV_SIG_TRUE:
 		return evaluate_dmv_sig_true(ctx, p);
+	case IPE_PROP_FSV_DIGEST:
+		return evaluate_fsv_digest(ctx, p);
+	case IPE_PROP_FSV_SIG_FALSE:
+		return evaluate_fsv_sig_false(ctx, p);
+	case IPE_PROP_FSV_SIG_TRUE:
+		return evaluate_fsv_sig_true(ctx, p);
 	default:
 		return false;
 	}
diff --git a/security/ipe/eval.h b/security/ipe/eval.h
index e575e94804a4..7f5b64c30ffe 100644
--- a/security/ipe/eval.h
+++ b/security/ipe/eval.h
@@ -27,6 +27,12 @@ struct ipe_bdev {
 };
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
 
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+struct ipe_inode {
+	bool fs_verity_signed;
+};
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
+
 struct ipe_eval_ctx {
 	enum ipe_op_type op;
 
@@ -35,6 +41,10 @@ struct ipe_eval_ctx {
 #ifdef CONFIG_IPE_PROP_DM_VERITY
 	const struct ipe_bdev *ipe_bdev;
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+	const struct inode *ino;
+	const struct ipe_inode *ipe_inode;
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
 };
 
 enum ipe_match {
diff --git a/security/ipe/hooks.c b/security/ipe/hooks.c
index 8b8031e66f36..1897d76354d7 100644
--- a/security/ipe/hooks.c
+++ b/security/ipe/hooks.c
@@ -244,3 +244,33 @@ int ipe_bdev_setsecurity(struct block_device *bdev, const char *key,
 	return -EOPNOTSUPP;
 }
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
+
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+/**
+ * ipe_inode_setsecurity - Sets fields of a inode security blob from @key.
+ * @inode: The inode to source the security blob from.
+ * @name: The name representing the information to be stored.
+ * @value: The value to be stored.
+ * @size: The size of @value.
+ * @flags: unused
+ *
+ * Saves fsverity signature & digest into inode security blob
+ *
+ * Return:
+ * * 0	- OK
+ * * !0	- Error
+ */
+int ipe_inode_setsecurity(struct inode *inode, const char *name,
+			  const void *value, size_t size,
+			  int flags)
+{
+	struct ipe_inode *inode_sec = ipe_inode(inode);
+
+	if (!strcmp(name, FS_VERITY_INODE_SEC_NAME)) {
+		inode_sec->fs_verity_signed = size > 0 && value;
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+#endif /* CONFIG_CONFIG_IPE_PROP_FS_VERITY */
diff --git a/security/ipe/hooks.h b/security/ipe/hooks.h
index d8ccb3728813..687d6b9fa869 100644
--- a/security/ipe/hooks.h
+++ b/security/ipe/hooks.h
@@ -9,6 +9,7 @@
 #include <linux/binfmts.h>
 #include <linux/security.h>
 #include <linux/blk_types.h>
+#include <linux/fsverity.h>
 
 int ipe_bprm_check_security(struct linux_binprm *bprm);
 
@@ -32,4 +33,10 @@ int ipe_bdev_setsecurity(struct block_device *bdev, const char *key,
 			 const void *value, size_t len);
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
 
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+int ipe_inode_setsecurity(struct inode *inode, const char *name,
+			  const void *value, size_t size,
+			  int flags);
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
+
 #endif /* _IPE_HOOKS_H */
diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
index c7e8af554d35..e789f1db6f66 100644
--- a/security/ipe/ipe.c
+++ b/security/ipe/ipe.c
@@ -13,6 +13,9 @@ static struct lsm_blob_sizes ipe_blobs __ro_after_init = {
 #ifdef CONFIG_IPE_PROP_DM_VERITY
 	.lbs_bdev = sizeof(struct ipe_bdev),
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+	.lbs_inode = sizeof(struct ipe_inode),
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
 };
 
 #ifdef CONFIG_IPE_PROP_DM_VERITY
@@ -22,6 +25,13 @@ struct ipe_bdev *ipe_bdev(struct block_device *b)
 }
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
 
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+struct ipe_inode *ipe_inode(const struct inode *inode)
+{
+	return inode->i_security + ipe_blobs.lbs_inode;
+}
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
+
 static struct security_hook_list ipe_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(bprm_check_security, ipe_bprm_check_security),
 	LSM_HOOK_INIT(mmap_file, ipe_mmap_file),
@@ -33,6 +43,9 @@ static struct security_hook_list ipe_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(bdev_free_security, ipe_bdev_free_security),
 	LSM_HOOK_INIT(bdev_setsecurity, ipe_bdev_setsecurity),
 #endif
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+	LSM_HOOK_INIT(inode_setsecurity, ipe_inode_setsecurity),
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
 };
 
 /**
diff --git a/security/ipe/ipe.h b/security/ipe/ipe.h
index 4e8d1a440c4b..d32f99350503 100644
--- a/security/ipe/ipe.h
+++ b/security/ipe/ipe.h
@@ -18,5 +18,8 @@ extern bool ipe_enabled;
 #ifdef CONFIG_IPE_PROP_DM_VERITY
 struct ipe_bdev *ipe_bdev(struct block_device *b);
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+struct ipe_inode *ipe_inode(const struct inode *inode);
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
 
 #endif /* _IPE_H */
diff --git a/security/ipe/policy.h b/security/ipe/policy.h
index 13e5c40e9204..51a7c21bb8ad 100644
--- a/security/ipe/policy.h
+++ b/security/ipe/policy.h
@@ -36,6 +36,9 @@ enum ipe_prop_type {
 	IPE_PROP_DMV_ROOTHASH,
 	IPE_PROP_DMV_SIG_FALSE,
 	IPE_PROP_DMV_SIG_TRUE,
+	IPE_PROP_FSV_DIGEST,
+	IPE_PROP_FSV_SIG_FALSE,
+	IPE_PROP_FSV_SIG_TRUE,
 	__IPE_PROP_MAX
 };
 
diff --git a/security/ipe/policy_parser.c b/security/ipe/policy_parser.c
index 3acb1d681f65..aacc0c4cf9df 100644
--- a/security/ipe/policy_parser.c
+++ b/security/ipe/policy_parser.c
@@ -275,6 +275,11 @@ static const match_table_t property_tokens = {
 	{IPE_PROP_DMV_SIG_FALSE,	"dmverity_signature=FALSE"},
 	{IPE_PROP_DMV_SIG_TRUE,		"dmverity_signature=TRUE"},
 #endif /* CONFIG_IPE_PROP_DM_VERITY */
+#ifdef CONFIG_IPE_PROP_FS_VERITY
+	{IPE_PROP_FSV_DIGEST,		"fsverity_digest=%s"},
+	{IPE_PROP_FSV_SIG_FALSE,	"fsverity_signature=FALSE"},
+	{IPE_PROP_FSV_SIG_TRUE,		"fsverity_signature=TRUE"},
+#endif /* CONFIG_IPE_PROP_FS_VERITY */
 	{IPE_PROP_INVALID,		NULL}
 };
 
@@ -304,6 +309,7 @@ static int parse_property(char *t, struct ipe_rule *r)
 
 	switch (token) {
 	case IPE_PROP_DMV_ROOTHASH:
+	case IPE_PROP_FSV_DIGEST:
 		dup = match_strdup(&args[0]);
 		if (!dup) {
 			rc = -ENOMEM;
@@ -317,6 +323,8 @@ static int parse_property(char *t, struct ipe_rule *r)
 	case IPE_PROP_BOOT_VERIFIED_TRUE:
 	case IPE_PROP_DMV_SIG_FALSE:
 	case IPE_PROP_DMV_SIG_TRUE:
+	case IPE_PROP_FSV_SIG_FALSE:
+	case IPE_PROP_FSV_SIG_TRUE:
 		p->type = token;
 		break;
 	default:
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

