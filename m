Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F1C543C6B
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jun 2022 21:07:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-Ph2eTmcuMw-NPFHz1lzlHg-1; Wed, 08 Jun 2022 15:07:43 -0400
X-MC-Unique: Ph2eTmcuMw-NPFHz1lzlHg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42652296A601;
	Wed,  8 Jun 2022 19:07:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 274A9492C3B;
	Wed,  8 Jun 2022 19:07:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0CE96194705F;
	Wed,  8 Jun 2022 19:07:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 731CC1947B9B
 for <dm-devel@listman.corp.redhat.com>; Wed,  8 Jun 2022 19:07:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6410EC44AE6; Wed,  8 Jun 2022 19:07:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F8C3C44AE5
 for <dm-devel@redhat.com>; Wed,  8 Jun 2022 19:07:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 442B23C025B8
 for <dm-devel@redhat.com>; Wed,  8 Jun 2022 19:07:33 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-433-LvHyAr6-N8O8Hloqw3mDvQ-1; Wed,
 08 Jun 2022 15:07:28 -0400
X-MC-Unique: LvHyAr6-N8O8Hloqw3mDvQ-1
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1E8C120BE66A;
 Wed,  8 Jun 2022 12:01:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1E8C120BE66A
From: Deven Bowers <deven.desai@linux.microsoft.com>
To: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com,
 snitzer@kernel.org, eparis@redhat.com, paul@paul-moore.com
Date: Wed,  8 Jun 2022 12:01:15 -0700
Message-Id: <1654714889-26728-4-git-send-email-deven.desai@linux.microsoft.com>
In-Reply-To: <1654714889-26728-1-git-send-email-deven.desai@linux.microsoft.com>
References: <1654714889-26728-1-git-send-email-deven.desai@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [dm-devel] [RFC PATCH v8 03/17] ipe: add evaluation loop
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
Cc: dm-devel@redhat.com, linux-doc@vger.kernel.org, roberto.sassu@huawei.com,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-audit@redhat.com, linux-integrity@vger.kernel.org
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

IPE must have a centralized function to evaluate incoming callers
against IPE's policy. This iteration of the policy for against the rules
for that specific caller is known as the evaluation loop.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>

---
v2:
  + Split evaluation loop, access control hooks,
    and evaluation loop from policy parser and userspace
    interface to pass mailing list character limit

v3:
  + Move ipe_load_properties to patch 04.
  + Remove useless 0-initializations
  + Prefix extern variables with ipe_
  + Remove kernel module parameters, as these are
    exposed through sysctls.
  + Add more prose to the IPE base config option
    help text.
  + Use GFP_KERNEL for audit_log_start.
  + Remove unnecessary caching system.
  + Remove comments from headers
  + Use rcu_access_pointer for rcu-pointer null check
  + Remove usage of reqprot; use prot only.
  + Move policy load and activation audit event to 03/12

v4:
  + Remove sysctls in favor of securityfs nodes
  + Re-add kernel module parameters, as these are now
    exposed through securityfs.
  + Refactor property audit loop to a separate function.

v5:
  + fix minor grammatical errors
  + do not group rule by curly-brace in audit record,
    reconstruct the exact rule.

v6:
  + No changes

v7:
  + Further split lsm creation into a separate commit from the
    evaluation loop and audit system, for easier review.

  + Propogating changes to support the new ipe_context structure in the
    evaluation loop.

Introduced in v8:
  + Remove ipe_hook enumeration; hooks can be correlated via syscall
    record.
---
 security/ipe/Makefile             |   1 +
 security/ipe/ctx.c                |  59 +++++++++++-
 security/ipe/ctx.h                |   6 ++
 security/ipe/eval.c               | 144 ++++++++++++++++++++++++++++++
 security/ipe/eval.h               |  24 +++++
 security/ipe/modules/ipe_module.h |   3 +
 security/ipe/policy.c             |  27 ++++++
 security/ipe/policy.h             |   4 +
 8 files changed, 267 insertions(+), 1 deletion(-)
 create mode 100644 security/ipe/eval.c
 create mode 100644 security/ipe/eval.h

diff --git a/security/ipe/Makefile b/security/ipe/Makefile
index 9a97efd8a190..0db69f13e82a 100644
--- a/security/ipe/Makefile
+++ b/security/ipe/Makefile
@@ -9,6 +9,7 @@ ccflags-y := -I$(srctree)/security/ipe/modules
 
 obj-$(CONFIG_SECURITY_IPE) += \
 	ctx.o \
+	eval.o \
 	hooks.o \
 	ipe.o \
 	modules.o \
diff --git a/security/ipe/ctx.c b/security/ipe/ctx.c
index d51fe2e13ad9..97305ddc2ff7 100644
--- a/security/ipe/ctx.c
+++ b/security/ipe/ctx.c
@@ -5,6 +5,7 @@
 
 #include "ipe.h"
 #include "ctx.h"
+#include "policy.h"
 
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -60,10 +61,25 @@ struct ipe_context *ipe_get_ctx_rcu(struct ipe_context __rcu *ctx)
  */
 static void free_ctx_work(struct work_struct *const work)
 {
+	struct ipe_policy *p = NULL;
 	struct ipe_context *ctx = NULL;
 
 	ctx = container_of(work, struct ipe_context, free_work);
 
+	/* Make p->ctx no longer have any references */
+	spin_lock(&ctx->lock);
+	list_for_each_entry(p, &ctx->policies, next)
+		rcu_assign_pointer(p->ctx, NULL);
+	spin_unlock(&ctx->lock);
+	synchronize_rcu();
+
+	/*
+	 * locking no longer necessary - nothing can get a reference to ctx,
+	 * so list is guaranteed stable.
+	 */
+	list_for_each_entry(p, &ctx->policies, next)
+		ipe_put_policy(p);
+
 	kfree(ctx);
 }
 
@@ -88,6 +104,7 @@ static struct ipe_context *create_ctx(void)
 	}
 
 	INIT_WORK(&ctx->free_work, free_ctx_work);
+	INIT_LIST_HEAD(&ctx->policies);
 	refcount_set(&ctx->refcount, 1);
 	spin_lock_init(&ctx->lock);
 
@@ -98,9 +115,49 @@ static struct ipe_context *create_ctx(void)
 	return ERR_PTR(rc);
 }
 
+/**
+ * remove_policy: Remove a policy from its context
+ * @p: Supplies a pointer to a policy that will be removed from its context
+ *
+ * Decrements @p's reference by 1.
+ */
+void ipe_remove_policy(struct ipe_policy *p)
+{
+	struct ipe_context *ctx;
+
+	ctx = ipe_get_ctx_rcu(p->ctx);
+	if (!ctx)
+		return;
+
+	spin_lock(&ctx->lock);
+	list_del_init(&p->next);
+	rcu_assign_pointer(p->ctx, NULL);
+	spin_unlock(&ctx->lock);
+	synchronize_rcu();
+
+	ipe_put_ctx(ctx);
+	/* drop the reference representing the list */
+	ipe_put_policy(p);
+}
+
+/**
+ * ipe_add_policy: Associate @p with @ctx
+ * @ctx: Supplies a pointer to the ipe_context structure to associate @p with.
+ * @p: Supplies a pointer to the ipe_policy structure to associate.
+ */
+void ipe_add_policy(struct ipe_context *ctx, struct ipe_policy *p)
+{
+	spin_lock(&ctx->lock);
+	rcu_assign_pointer(p->ctx, ctx);
+	list_add_tail(&p->next, &ctx->policies);
+	refcount_inc(&p->refcount);
+	spin_unlock(&ctx->lock);
+	synchronize_rcu();
+}
+
 /**
  * ipe_put_ctx: Decrement the reference of an ipe_context structure,
- *	       scheduling a free as necessary.
+ *	       scheduling a free as necessary.s
  * @ctx: Structure to free
  *
  * This function no-ops on error and null values for @ctx, and the
diff --git a/security/ipe/ctx.h b/security/ipe/ctx.h
index 69a2c92c0a8c..a0da92da818c 100644
--- a/security/ipe/ctx.h
+++ b/security/ipe/ctx.h
@@ -12,10 +12,14 @@
 #include <linux/workqueue.h>
 
 struct ipe_context {
+	struct ipe_policy __rcu *active_policy;
+
 	refcount_t refcount;
 	/* Protects concurrent writers */
 	spinlock_t lock;
 
+	struct list_head policies; /* type: ipe_policy */
+
 	struct work_struct free_work;
 };
 
@@ -24,5 +28,7 @@ struct ipe_context __rcu **ipe_tsk_ctx(struct task_struct *tsk);
 struct ipe_context *ipe_current_ctx(void);
 struct ipe_context *ipe_get_ctx_rcu(struct ipe_context __rcu *ctx);
 void ipe_put_ctx(struct ipe_context *ctx);
+void ipe_add_policy(struct ipe_context *ctx, struct ipe_policy *p);
+void ipe_remove_policy(struct ipe_policy *p);
 
 #endif /* IPE_CONTEXT_H */
diff --git a/security/ipe/eval.c b/security/ipe/eval.c
new file mode 100644
index 000000000000..b3e4277fe6bd
--- /dev/null
+++ b/security/ipe/eval.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include "ipe.h"
+#include "ctx.h"
+#include "eval.h"
+#include "hooks.h"
+#include "policy.h"
+#include "modules/ipe_module.h"
+
+#include <linux/slab.h>
+#include <linux/file.h>
+#include <linux/sched.h>
+#include <linux/rcupdate.h>
+
+/**
+ * build_ctx: Build an evaluation context.
+ * @file: Supplies a pointer to the file to associated with the evaluation
+ * @op: Supplies the IPE policy operation associated with the evaluation
+ * @hook: Supplies the LSM hook associated with the evaluation.
+ *
+ * The current IPE Context will have a reference count increased by one until
+ * this is deallocated.
+ *
+ * Return:
+ * !IS_ERR - OK
+ */
+static struct ipe_eval_ctx *build_ctx(const struct file *file,
+				      enum ipe_operation op)
+{
+	struct ipe_eval_ctx *ctx = NULL;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->file = file;
+	ctx->op = op;
+	ctx->ci_ctx = ipe_current_ctx();
+
+	return ctx;
+}
+
+/**
+ * free_ctx: Deallocate a previously-allocated ipe_eval_ctx
+ * @ctx: Supplies a pointer to the evaluation context to free.
+ */
+static void free_ctx(struct ipe_eval_ctx *ctx)
+{
+	if (IS_ERR_OR_NULL(ctx))
+		return;
+
+	ipe_put_ctx(ctx->ci_ctx);
+	kfree(ctx);
+}
+
+/**
+ * evaluate: Analyze @ctx against the active policy and return the result.
+ * @ctx: Supplies a pointer to the context being evaluated.
+ *
+ * This is the loop where all policy evaluation happens against IPE policy.
+ *
+ * Return:
+ * 0 - OK
+ * -EACCES - @ctx did not pass evaluation.
+ * !0 - Error
+ */
+static int evaluate(const struct ipe_eval_ctx *const ctx)
+{
+	int rc = 0;
+	bool match = false;
+	enum ipe_action action;
+	struct ipe_policy *pol = NULL;
+	const struct ipe_rule *rule = NULL;
+	const struct ipe_policy_mod *module = NULL;
+	const struct ipe_operation_table *rules = NULL;
+
+	pol = ipe_get_policy_rcu(ctx->ci_ctx->active_policy);
+	if (!pol)
+		goto out;
+
+	if (ctx->op == ipe_operation_max) {
+		action = pol->parsed->global_default;
+		goto eval;
+	}
+
+	rules = &pol->parsed->rules[ctx->op];
+
+	list_for_each_entry(rule, &rules->rules, next) {
+		match = true;
+
+		list_for_each_entry(module, &rule->modules, next)
+			match = match && module->mod->eval(ctx, module->mod_value);
+
+		if (match)
+			break;
+	}
+
+	if (match) {
+		action = rule->action;
+	} else if (rules->default_action != ipe_action_max) {
+		action = rules->default_action;
+	} else {
+		action = pol->parsed->global_default;
+	}
+
+eval:
+	if (action == ipe_action_deny)
+		rc = -EACCES;
+
+out:
+	ipe_put_policy(pol);
+	return rc;
+}
+
+/**
+ * ipe_process_event: Submit @file for verification against IPE's policy
+ * @file: Supplies an optional pointer to the file being submitted.
+ * @op: IPE Policy Operation to associate with @file
+ *
+ * @file can be NULL and will be submitted for evaluation like a non-NULL
+ * file.
+ *
+ * Return:
+ * 0 - OK
+ * -EACCES - @file did not pass verification
+ * !0 - Error
+ */
+int ipe_process_event(const struct file *file, enum ipe_operation op)
+{
+	int rc = 0;
+	struct ipe_eval_ctx *ctx = NULL;
+
+	ctx = build_ctx(file, op);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	rc = evaluate(ctx);
+
+	free_ctx(ctx);
+	return rc;
+}
diff --git a/security/ipe/eval.h b/security/ipe/eval.h
new file mode 100644
index 000000000000..bc3a5da3badc
--- /dev/null
+++ b/security/ipe/eval.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#ifndef IPE_EVAL_H
+#define IPE_EVAL_H
+
+#include <linux/file.h>
+
+#include "ctx.h"
+#include "hooks.h"
+#include "policy.h"
+
+struct ipe_eval_ctx {
+	enum ipe_operation op;
+
+	const struct file *file;
+	struct ipe_context *ci_ctx;
+};
+
+int ipe_process_event(const struct file *file, enum ipe_operation op);
+
+#endif /* IPE_EVAL_H */
diff --git a/security/ipe/modules/ipe_module.h b/security/ipe/modules/ipe_module.h
index c4e98b548df3..1157c5363048 100644
--- a/security/ipe/modules/ipe_module.h
+++ b/security/ipe/modules/ipe_module.h
@@ -6,6 +6,7 @@
 #define IPE_MODULE_H
 
 #include <linux/types.h>
+#include "../eval.h"
 
 /**
  * ipe_module: definition of an extensible module for IPE properties.
@@ -23,6 +24,8 @@ struct ipe_module {
 	u16				version;	/* required */
 	int (*parse)(const char *valstr, void **value);	/* required */
 	void (*free)(void **value);			/* optional */
+	bool (*eval)(const struct ipe_eval_ctx *ctx,	/* required */
+		     const void *val);
 };
 
 #define IPE_MODULE(parser)				\
diff --git a/security/ipe/policy.c b/security/ipe/policy.c
index 6381fa7c2ec6..d68f9bf72f72 100644
--- a/security/ipe/policy.c
+++ b/security/ipe/policy.c
@@ -874,6 +874,32 @@ void ipe_put_policy(struct ipe_policy *p)
 	kfree(p);
 }
 
+/**
+ * ipe_get_policy_rcu: Dereference rcu-protected @p and increase the reference
+ *		       count.
+ * @p: rcu-protected pointer to dereference
+ *
+ * Not safe to call on IS_ERR.
+ *
+ * Return:
+ * !NULL - reference count of @p was valid, and increased by one.
+ * NULL - reference count of @p is not valid.
+ */
+struct ipe_policy *ipe_get_policy_rcu(struct ipe_policy __rcu *p)
+{
+	struct ipe_policy *rv = NULL;
+
+	rcu_read_lock();
+
+	rv = rcu_dereference(p);
+	if (!rv || !refcount_inc_not_zero(&rv->refcount))
+		rv = NULL;
+
+	rcu_read_unlock();
+
+	return rv;
+}
+
 static int set_pkcs7_data(void *ctx, const void *data, size_t len,
 			  size_t asn1hdrlen)
 {
@@ -912,6 +938,7 @@ struct ipe_policy *ipe_new_policy(const char *text, size_t textlen,
 		return ERR_PTR(-ENOMEM);
 
 	refcount_set(&new->refcount, 1);
+	INIT_LIST_HEAD(&new->next);
 
 	if (!text) {
 		new->pkcs7len = pkcs7len;
diff --git a/security/ipe/policy.h b/security/ipe/policy.h
index d78788db238c..2b5041c5a75a 100644
--- a/security/ipe/policy.h
+++ b/security/ipe/policy.h
@@ -87,11 +87,15 @@ struct ipe_policy {
 	struct ipe_parsed_policy *parsed;
 
 	refcount_t	refcount;
+
+	struct list_head next;		/* type: ipe_policy */
+	struct ipe_context __rcu *ctx;
 };
 
 struct ipe_policy *ipe_new_policy(const char *text, size_t textlen,
 				  const char *pkcs7, size_t pkcs7len);
 void ipe_put_policy(struct ipe_policy *pol);
 bool ipe_is_op_alias(int op, const enum ipe_operation **map, size_t *size);
+struct ipe_policy *ipe_get_policy_rcu(struct ipe_policy __rcu *p);
 
 #endif /* IPE_POLICY_H */
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

