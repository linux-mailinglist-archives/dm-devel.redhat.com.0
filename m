Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E150741A9A
	for <lists+dm-devel@lfdr.de>; Wed, 28 Jun 2023 23:19:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687987176;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GSYCWm8PZeWQWaScCJA9TwrxXPS0r8aH664CqHy91eE=;
	b=dROt/LhonWO4imHhWuRMo0Ved8f6RfmA3zYzVHZDnsuqg/B89ijvje4+cc1djhZ8N3YQXb
	KY1BqsAR5mYMpALxRtsI6bkNXnUuchhF5D2+5PILZbsPe4aaNcUxbzr5xmdDxAsezw3Xao
	d3O57pe2z+BNUP2cdvcEDeC/RHuiFDQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-fjR6OMQQMe-7wlnkEk1FhA-1; Wed, 28 Jun 2023 17:19:33 -0400
X-MC-Unique: fjR6OMQQMe-7wlnkEk1FhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F64A1C0724A;
	Wed, 28 Jun 2023 21:19:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E01B2166B2B;
	Wed, 28 Jun 2023 21:18:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5B1271946A45;
	Wed, 28 Jun 2023 21:18:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26DA21946A45
 for <dm-devel@listman.corp.redhat.com>; Wed, 28 Jun 2023 21:18:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 16379111F3BB; Wed, 28 Jun 2023 21:18:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E990111F3B0
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 21:18:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E20A388D0F7
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 21:18:46 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-454-b9LH-IL3Nk-2mNKDyTr-8g-1; Wed,
 28 Jun 2023 17:18:43 -0400
X-MC-Unique: b9LH-IL3Nk-2mNKDyTr-8g-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 1B74C20C08E7; Wed, 28 Jun 2023 14:09:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1B74C20C08E7
From: Fan Wu <wufan@linux.microsoft.com>
To: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com,
 snitzer@kernel.org, eparis@redhat.com, paul@paul-moore.com
Date: Wed, 28 Jun 2023 14:09:16 -0700
Message-Id: <1687986571-16823-3-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1687986571-16823-1-git-send-email-wufan@linux.microsoft.com>
References: <1687986571-16823-1-git-send-email-wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [RFC PATCH v10 02/17] ipe: add policy parser
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Deven Bowers <deven.desai@linux.microsoft.com>

IPE's interpretation of the what the user trusts is accomplished through
its policy. IPE's design is to not provide support for a single trust
provider, but to support multiple providers to enable the end-user to
choose the best one to seek their needs.

This requires the policy to be rather flexible and modular so that
integrity providers, like fs-verity, dm-verity, dm-integrity, or
some other system, can plug into the policy with minimal code changes.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
Signed-off-by: Fan Wu <wufan@linux.microsoft.com>

---
v2:
  + Split evaluation loop, access control hooks,
    and evaluation loop from policy parser and userspace
    interface to pass mailing list character limit

v3:
  + Move policy load and activation audit event to 03/12
  + Fix a potential panic when a policy failed to load.
  + use pr_warn for a failure to parse instead of an
    audit record
  + Remove comments from headers
  + Add lockdep assertions to ipe_update_active_policy and
    ipe_activate_policy
  + Fix up warnings with checkpatch --strict
  + Use file_ns_capable for CAP_MAC_ADMIN for securityfs
    nodes.
  + Use memdup_user instead of kzalloc+simple_write_to_buffer.
  + Remove strict_parse command line parameter, as it is added
    by the sysctl command line.
  + Prefix extern variables with ipe_

v4:
  + Remove securityfs to reverse-dependency
  + Add SHA1 reverse dependency.
  + Add versioning scheme for IPE properties, and associated
    interface to query the versioning scheme.
  + Cause a parser to always return an error on unknown syntax.
  + Remove strict_parse option
  + Change active_policy interface from sysctl, to securityfs,
    and change scheme.

v5:
  + Cause an error if a default action is not defined for each
    operation.
  + Minor function renames

v6:
  + No changes

v7:
  + Further split parser and userspace interface into two
    separate commits, for easier review.
  + Refactor policy parser to make code cleaner via introducing a
    more modular design, for easier extension of policy, and
    easier review.

v8:
  + remove unnecessary pr_info emission on parser loading
  + add explicit newline to the pr_err emitted when a parser
    fails to load.

v9:
  + switch to match table to parse policy
  + remove quote syntax and KERNEL_READ operation

v10:
  + Fix memory leaks in parser
  + Fix typos and change code styles
---
 security/ipe/Makefile        |   2 +
 security/ipe/policy.c        |  97 +++++++
 security/ipe/policy.h        |  83 ++++++
 security/ipe/policy_parser.c | 488 +++++++++++++++++++++++++++++++++++
 security/ipe/policy_parser.h |  11 +
 5 files changed, 681 insertions(+)
 create mode 100644 security/ipe/policy.c
 create mode 100644 security/ipe/policy.h
 create mode 100644 security/ipe/policy_parser.c
 create mode 100644 security/ipe/policy_parser.h

diff --git a/security/ipe/Makefile b/security/ipe/Makefile
index 571648579991..16bbe80991f1 100644
--- a/security/ipe/Makefile
+++ b/security/ipe/Makefile
@@ -8,3 +8,5 @@
 obj-$(CONFIG_SECURITY_IPE) += \
 	hooks.o \
 	ipe.o \
+	policy.o \
+	policy_parser.o \
diff --git a/security/ipe/policy.c b/security/ipe/policy.c
new file mode 100644
index 000000000000..4069ff075093
--- /dev/null
+++ b/security/ipe/policy.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include <linux/errno.h>
+#include <linux/verification.h>
+
+#include "ipe.h"
+#include "policy.h"
+#include "policy_parser.h"
+
+/**
+ * ipe_free_policy - Deallocate a given IPE policy.
+ * @p: Supplies the policy to free.
+ *
+ * Safe to call on IS_ERR/NULL.
+ */
+void ipe_free_policy(struct ipe_policy *p)
+{
+	if (IS_ERR_OR_NULL(p))
+		return;
+
+	free_parsed_policy(p->parsed);
+	if (!p->pkcs7)
+		kfree(p->text);
+	kfree(p->pkcs7);
+	kfree(p);
+}
+
+static int set_pkcs7_data(void *ctx, const void *data, size_t len,
+			  size_t asn1hdrlen)
+{
+	struct ipe_policy *p = ctx;
+
+	p->text = (const char *)data;
+	p->textlen = len;
+
+	return 0;
+}
+
+/**
+ * ipe_new_policy - Allocate and parse an ipe_policy structure.
+ *
+ * @text: Supplies a pointer to the plain-text policy to parse.
+ * @textlen: Supplies the length of @text.
+ * @pkcs7: Supplies a pointer to a pkcs7-signed IPE policy.
+ * @pkcs7len: Supplies the length of @pkcs7.
+ *
+ * @text/@textlen Should be NULL/0 if @pkcs7/@pkcs7len is set.
+ *
+ * Return:
+ * * !IS_ERR	- Success
+ * * -EBADMSG	- Policy is invalid
+ * * -ENOMEM	- Out of memory
+ */
+struct ipe_policy *ipe_new_policy(const char *text, size_t textlen,
+				  const char *pkcs7, size_t pkcs7len)
+{
+	int rc = 0;
+	struct ipe_policy *new = NULL;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return ERR_PTR(-ENOMEM);
+
+	if (!text) {
+		new->pkcs7len = pkcs7len;
+		new->pkcs7 = kmemdup(pkcs7, pkcs7len, GFP_KERNEL);
+		if (!new->pkcs7) {
+			rc = -ENOMEM;
+			goto err;
+		}
+
+		rc = verify_pkcs7_signature(NULL, 0, new->pkcs7, pkcs7len, NULL,
+					    VERIFYING_UNSPECIFIED_SIGNATURE,
+					    set_pkcs7_data, new);
+		if (rc)
+			goto err;
+	} else {
+		new->textlen = textlen;
+		new->text = kstrdup(text, GFP_KERNEL);
+		if (!new->text) {
+			rc = -ENOMEM;
+			goto err;
+		}
+	}
+
+	rc = parse_policy(new);
+	if (rc)
+		goto err;
+
+	return new;
+err:
+	ipe_free_policy(new);
+	return ERR_PTR(rc);
+}
diff --git a/security/ipe/policy.h b/security/ipe/policy.h
new file mode 100644
index 000000000000..113a037f0d71
--- /dev/null
+++ b/security/ipe/policy.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+#ifndef _IPE_POLICY_H
+#define _IPE_POLICY_H
+
+#include <linux/list.h>
+#include <linux/types.h>
+
+enum ipe_op_type {
+	__IPE_OP_EXEC = 0,
+	__IPE_OP_FIRMWARE,
+	__IPE_OP_KERNEL_MODULE,
+	__IPE_OP_KEXEC_IMAGE,
+	__IPE_OP_KEXEC_INITRAMFS,
+	__IPE_OP_IMA_POLICY,
+	__IPE_OP_IMA_X509,
+	__IPE_OP_MAX
+};
+
+#define __IPE_OP_INVALID __IPE_OP_MAX
+
+enum ipe_action_type {
+	__IPE_ACTION_ALLOW = 0,
+	__IPE_ACTION_DENY,
+	__IPE_ACTION_MAX
+};
+
+#define __IPE_ACTION_INVALID __IPE_ACTION_MAX
+
+enum ipe_prop_type {
+	__IPE_PROP_MAX
+};
+
+#define __IPE_PROP_INVALID __IPE_PROP_MAX
+
+struct ipe_prop {
+	struct list_head next;
+	enum ipe_prop_type type;
+	void *value;
+};
+
+struct ipe_rule {
+	enum ipe_op_type op;
+	enum ipe_action_type action;
+	struct list_head props;
+	struct list_head next;
+};
+
+struct ipe_op_table {
+	struct list_head rules;
+	enum ipe_action_type default_action;
+};
+
+struct ipe_parsed_policy {
+	const char *name;
+	struct {
+		u16 major;
+		u16 minor;
+		u16 rev;
+	} version;
+
+	enum ipe_action_type global_default_action;
+
+	struct ipe_op_table rules[__IPE_OP_MAX];
+};
+
+struct ipe_policy {
+	const char *pkcs7;
+	size_t pkcs7len;
+
+	const char *text;
+	size_t textlen;
+
+	struct ipe_parsed_policy *parsed;
+};
+
+struct ipe_policy *ipe_new_policy(const char *text, size_t textlen,
+				  const char *pkcs7, size_t pkcs7len);
+void ipe_free_policy(struct ipe_policy *pol);
+
+#endif /* _IPE_POLICY_H */
diff --git a/security/ipe/policy_parser.c b/security/ipe/policy_parser.c
new file mode 100644
index 000000000000..27e5767480b0
--- /dev/null
+++ b/security/ipe/policy_parser.c
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include <linux/types.h>
+#include <linux/parser.h>
+
+#include "policy.h"
+#include "policy_parser.h"
+
+#define START_COMMENT	'#'
+
+/**
+ * new_parsed_policy - Allocate and initialize a parsed policy.
+ *
+ * Return:
+ * * !IS_ERR	- OK
+ * * -ENOMEM	- Out of memory
+ */
+static struct ipe_parsed_policy *new_parsed_policy(void)
+{
+	size_t i = 0;
+	struct ipe_parsed_policy *p = NULL;
+	struct ipe_op_table *t = NULL;
+
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return ERR_PTR(-ENOMEM);
+
+	p->global_default_action = __IPE_ACTION_INVALID;
+
+	for (i = 0; i < ARRAY_SIZE(p->rules); ++i) {
+		t = &p->rules[i];
+
+		t->default_action = __IPE_ACTION_INVALID;
+		INIT_LIST_HEAD(&t->rules);
+	}
+
+	return p;
+}
+
+/**
+ * remove_comment - Truncate all chars following START_COMMENT in a string.
+ *
+ * @line: Supplies a poilcy line string for preprocessing.
+ */
+static void remove_comment(char *line)
+{
+	line = strchr(line, START_COMMENT);
+
+	if (line)
+		*line = '\0';
+}
+
+/**
+ * remove_trailing_spaces - Truncate all trailing spaces in a string.
+ *
+ * @line: Supplies a poilcy line string for preprocessing.
+ *
+ * Return: The length of truncated string.
+ */
+static size_t remove_trailing_spaces(char *line)
+{
+	size_t i = 0;
+
+	for (i = strlen(line); i > 0 && (line[i - 1] == ' ' || line[i - 1] == '\t'); --i)
+		;
+
+	line[i] = '\0';
+
+	return i;
+}
+
+/**
+ * parse_version - Parse policy version.
+ * @ver: Supplies a version string to be parsed.
+ * @p: Supplies the partial parsed policy.
+ *
+ * Return:
+ * * 0	- OK
+ * * !0	- Standard errno
+ */
+static int parse_version(char *ver, struct ipe_parsed_policy *p)
+{
+	int rc = 0;
+	size_t sep_count = 0;
+	char *token;
+	u16 *const cv[] = { &p->version.major, &p->version.minor, &p->version.rev };
+
+	while ((token = strsep(&ver, ".")) != NULL) {
+		/* prevent overflow */
+		if (sep_count >= ARRAY_SIZE(cv))
+			return -EBADMSG;
+
+		rc = kstrtou16(token, 10, cv[sep_count]);
+		if (rc)
+			return rc;
+
+		++sep_count;
+	}
+
+	/* prevent underflow */
+	if (sep_count != ARRAY_SIZE(cv))
+		rc = -EBADMSG;
+
+	return rc;
+}
+
+enum header_opt {
+	__IPE_HEADER_POLICY_NAME = 0,
+	__IPE_HEADER_POLICY_VERSION,
+	__IPE_HEADER_MAX
+};
+
+static const match_table_t header_tokens = {
+	{__IPE_HEADER_POLICY_NAME,	"policy_name=%s"},
+	{__IPE_HEADER_POLICY_VERSION,	"policy_version=%s"},
+	{__IPE_HEADER_MAX,		NULL}
+};
+
+/**
+ * parse_header - Parse policy header information.
+ * @line: Supplies header line to be parsed.
+ * @p: Supplies the partial parsed policy.
+ *
+ * Return:
+ * * 0	- OK
+ * * !0	- Standard errno
+ */
+static int parse_header(char *line, struct ipe_parsed_policy *p)
+{
+	int rc = 0;
+	char *t, *ver = NULL;
+	substring_t args[MAX_OPT_ARGS];
+	size_t idx = 0;
+
+	while ((t = strsep(&line, " \t")) != NULL) {
+		int token;
+
+		if (*t == '\0')
+			continue;
+		if (idx >= __IPE_HEADER_MAX) {
+			rc = -EBADMSG;
+			goto err;
+		}
+
+		token = match_token(t, header_tokens, args);
+		if (token != idx) {
+			rc = -EBADMSG;
+			goto err;
+		}
+
+		switch (token) {
+		case __IPE_HEADER_POLICY_NAME:
+			p->name = match_strdup(&args[0]);
+			if (!p->name)
+				rc = -ENOMEM;
+			break;
+		case __IPE_HEADER_POLICY_VERSION:
+			ver = match_strdup(&args[0]);
+			if (!ver) {
+				rc = -ENOMEM;
+				break;
+			}
+			rc = parse_version(ver, p);
+			break;
+		default:
+			rc = -EBADMSG;
+		}
+		if (rc)
+			goto err;
+		++idx;
+	}
+
+	if (idx != __IPE_HEADER_MAX) {
+		rc = -EBADMSG;
+		goto err;
+	}
+
+out:
+	kfree(ver);
+	return rc;
+err:
+	kfree(p->name);
+	p->name = NULL;
+	goto out;
+}
+
+/**
+ * token_default - Determine if the given token is "DEFAULT".
+ * @token: Supplies the token string to be compared.
+ *
+ * Return:
+ * * 0	- The token is not "DEFAULT"
+ * * !0	- The token is "DEFAULT"
+ */
+static bool token_default(char *token)
+{
+	return !strcmp(token, "DEFAULT");
+}
+
+/**
+ * free_rule - Free the supplied ipe_rule struct.
+ * @r: Supplies the ipe_rule struct to be freed.
+ *
+ * Free a ipe_rule struct @r. Note @r must be removed from any lists before
+ * calling this function.
+ */
+static void free_rule(struct ipe_rule *r)
+{
+	struct ipe_prop *p, *t;
+
+	if (IS_ERR_OR_NULL(r))
+		return;
+
+	list_for_each_entry_safe(p, t, &r->props, next) {
+		list_del(&p->next);
+		kfree(p);
+	}
+
+	kfree(r);
+}
+
+static const match_table_t operation_tokens = {
+	{__IPE_OP_EXEC,			"op=EXECUTE"},
+	{__IPE_OP_FIRMWARE,		"op=FIRMWARE"},
+	{__IPE_OP_KERNEL_MODULE,	"op=KMODULE"},
+	{__IPE_OP_KEXEC_IMAGE,		"op=KEXEC_IMAGE"},
+	{__IPE_OP_KEXEC_INITRAMFS,	"op=KEXEC_INITRAMFS"},
+	{__IPE_OP_IMA_POLICY,		"op=IMA_POLICY"},
+	{__IPE_OP_IMA_X509,		"op=IMA_X509_CERT"},
+	{__IPE_OP_INVALID,		NULL}
+};
+
+/**
+ * parse_operation - Parse the operation type given a token string.
+ * @t: Supplies the token string to be parsed.
+ *
+ * Return: The parsed operation type.
+ */
+static enum ipe_op_type parse_operation(char *t)
+{
+	substring_t args[MAX_OPT_ARGS];
+
+	return match_token(t, operation_tokens, args);
+}
+
+static const match_table_t action_tokens = {
+	{__IPE_ACTION_ALLOW,	"action=ALLOW"},
+	{__IPE_ACTION_DENY,	"action=DENY"},
+	{__IPE_ACTION_INVALID,	NULL}
+};
+
+/**
+ * parse_action - Parse the action type given a token string.
+ * @t: Supplies the token string to be parsed.
+ *
+ * Return: The parsed action type.
+ */
+static enum ipe_action_type parse_action(char *t)
+{
+	substring_t args[MAX_OPT_ARGS];
+
+	return match_token(t, action_tokens, args);
+}
+
+/**
+ * parse_property - Parse the property type given a token string.
+ * @t: Supplies the token string to be parsed.
+ * @r: Supplies the ipe_rule the parsed property will be associated with.
+ *
+ * Return:
+ * * !IS_ERR	- OK
+ * * -ENOMEM	- Out of memory
+ * * -EBADMSG	- The supplied token cannot be parsed
+ */
+static int parse_property(char *t, struct ipe_rule *r)
+{
+	return -EBADMSG;
+}
+
+/**
+ * parse_rule - parse a policy rule line.
+ * @line: Supplies rule line to be parsed.
+ * @p: Supplies the partial parsed policy.
+ *
+ * Return:
+ * * !IS_ERR	- OK
+ * * -ENOMEM	- Out of memory
+ * * -EBADMSG	- Policy syntax error
+ */
+static int parse_rule(char *line, struct ipe_parsed_policy *p)
+{
+	int rc = 0;
+	bool first_token = true, is_default_rule = false;
+	bool op_parsed = false;
+	enum ipe_op_type op = __IPE_OP_INVALID;
+	enum ipe_action_type action = __IPE_ACTION_INVALID;
+	struct ipe_rule *r = NULL;
+	char *t;
+
+	r = kzalloc(sizeof(*r), GFP_KERNEL);
+	if (!r)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&r->next);
+	INIT_LIST_HEAD(&r->props);
+
+	while (t = strsep(&line, " \t"), line) {
+		if (*t == '\0')
+			continue;
+		if (first_token && token_default(t)) {
+			is_default_rule = true;
+		} else {
+			if (!op_parsed) {
+				op = parse_operation(t);
+				if (op == __IPE_OP_INVALID)
+					rc = -EBADMSG;
+				else
+					op_parsed = true;
+			} else {
+				rc = parse_property(t, r);
+			}
+		}
+
+		if (rc)
+			goto err;
+		first_token = false;
+	}
+
+	action = parse_action(t);
+	if (action == __IPE_ACTION_INVALID) {
+		rc = -EBADMSG;
+		goto err;
+	}
+
+	if (is_default_rule) {
+		if (!list_empty(&r->props)) {
+			rc = -EBADMSG;
+		} else if (op == __IPE_OP_INVALID) {
+			if (p->global_default_action != __IPE_ACTION_INVALID)
+				rc = -EBADMSG;
+			else
+				p->global_default_action = action;
+		} else {
+			if (p->rules[op].default_action != __IPE_ACTION_INVALID)
+				rc = -EBADMSG;
+			else
+				p->rules[op].default_action = action;
+		}
+	} else if (op != __IPE_OP_INVALID && action != __IPE_ACTION_INVALID) {
+		r->op = op;
+		r->action = action;
+	} else {
+		rc = -EBADMSG;
+	}
+
+	if (rc)
+		goto err;
+	if (!is_default_rule)
+		list_add_tail(&r->next, &p->rules[op].rules);
+	else
+		free_rule(r);
+
+out:
+	return rc;
+err:
+	free_rule(r);
+	goto out;
+}
+
+/**
+ * free_parsed_policy - free a parsed policy structure.
+ * @p: Supplies the parsed policy.
+ */
+void free_parsed_policy(struct ipe_parsed_policy *p)
+{
+	size_t i = 0;
+	struct ipe_rule *pp, *t;
+
+	if (IS_ERR_OR_NULL(p))
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(p->rules); ++i)
+		list_for_each_entry_safe(pp, t, &p->rules[i].rules, next) {
+			list_del(&pp->next);
+			free_rule(pp);
+		}
+
+	kfree(p->name);
+	kfree(p);
+}
+
+/**
+ * validate_policy - validate a parsed policy.
+ * @p: Supplies the fully parsed policy.
+ *
+ * Given a policy structure that was just parsed, validate that all
+ * necessary fields are present, initialized correctly.
+ *
+ * A parsed policy can be in an invalid state for use (a default was
+ * undefined) by just parsing the policy.
+ *
+ * Return:
+ * * 0		- OK
+ * * -EBADMSG	- Policy is invalid
+ */
+static int validate_policy(const struct ipe_parsed_policy *p)
+{
+	int i = 0;
+
+	if (p->global_default_action != __IPE_ACTION_INVALID)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(p->rules); ++i) {
+		if (p->rules[i].default_action == __IPE_ACTION_INVALID)
+			return -EBADMSG;
+	}
+
+	return 0;
+}
+
+/**
+ * parse_policy - Given a string, parse the string into an IPE policy.
+ * @p: partially filled ipe_policy structure to populate with the result.
+ *     it must have text and textlen set.
+ *
+ * Return:
+ * * 0		- OK
+ * * -EBADMSG	- Policy is invalid
+ * * -ENOMEM	- Out of Memory
+ */
+int parse_policy(struct ipe_policy *p)
+{
+	int rc = 0;
+	size_t len;
+	char *policy = NULL, *dup = NULL;
+	char *line = NULL;
+	bool header_parsed = false;
+	struct ipe_parsed_policy *pp = NULL;
+
+	if (!p->textlen)
+		return -EBADMSG;
+
+	policy = kmemdup_nul(p->text, p->textlen, GFP_KERNEL);
+	if (!policy)
+		return -ENOMEM;
+	dup = policy;
+
+	pp = new_parsed_policy();
+	if (IS_ERR(pp)) {
+		rc = PTR_ERR(pp);
+		goto out;
+	}
+
+	while ((line = strsep(&policy, "\n\r")) != NULL) {
+		remove_comment(line);
+		len = remove_trailing_spaces(line);
+		if (!len)
+			continue;
+
+		if (!header_parsed) {
+			rc = parse_header(line, pp);
+			if (rc)
+				goto err;
+			header_parsed = true;
+		} else {
+			rc = parse_rule(line, pp);
+			if (rc)
+				goto err;
+		}
+	}
+
+	if (!header_parsed || validate_policy(pp)) {
+		rc = -EBADMSG;
+		goto err;
+	}
+
+	p->parsed = pp;
+
+out:
+	kfree(dup);
+	return rc;
+err:
+	free_parsed_policy(pp);
+	goto out;
+}
diff --git a/security/ipe/policy_parser.h b/security/ipe/policy_parser.h
new file mode 100644
index 000000000000..2b744103d06a
--- /dev/null
+++ b/security/ipe/policy_parser.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+#ifndef _IPE_POLICY_PARSER_H
+#define _IPE_POLICY_PARSER_H
+
+int parse_policy(struct ipe_policy *p);
+void free_parsed_policy(struct ipe_parsed_policy *p);
+
+#endif /* _IPE_POLICY_PARSER_H */
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

