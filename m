Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A983686133
	for <lists+dm-devel@lfdr.de>; Wed,  1 Feb 2023 09:04:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675238647;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ipE1Prei6GfNmL0wn+VPcCtcDj3tVxP6+XF8IXzD/as=;
	b=A5Aat690j9MZhj5XWAWRgtf8Cdar0dwi+DcqPBCfUduoY0M25EjQDYJiJZSRh6QepzCvuL
	GLCjD7tp0iMsKxFz67Lx1XoFB1hodF/P8/9FBGZ3RW7fEy2fkP0h4leSL9qiHoTFbLD0Qg
	KkAQ4dOekZdLDiojrl+Bu+3ehfQsZh8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-LpzuRZfmNIippg64dPZ87w-1; Wed, 01 Feb 2023 03:04:01 -0500
X-MC-Unique: LpzuRZfmNIippg64dPZ87w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 380C6183B3CA;
	Wed,  1 Feb 2023 08:03:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2189F492B05;
	Wed,  1 Feb 2023 08:03:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2D9119465A2;
	Wed,  1 Feb 2023 08:03:54 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F3C121946587
 for <dm-devel@listman.corp.redhat.com>; Tue, 31 Jan 2023 10:54:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D8969112132D; Tue, 31 Jan 2023 10:54:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0508112132C
 for <dm-devel@redhat.com>; Tue, 31 Jan 2023 10:54:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAAB0100DEA5
 for <dm-devel@redhat.com>; Tue, 31 Jan 2023 10:54:15 +0000 (UTC)
Received: from frasgout13.his.huawei.com (frasgout13.his.huawei.com
 [14.137.139.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-633DgICCMreghJOyMs_OtA-1; Tue, 31 Jan 2023 05:54:12 -0500
X-MC-Unique: 633DgICCMreghJOyMs_OtA-1
Received: from mail02.huawei.com (unknown [172.18.147.229])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4P5hY84r8Dz9v7ZQ;
 Tue, 31 Jan 2023 18:46:04 +0800 (CST)
Received: from roberto-ThinkStation-P620 (unknown [10.204.63.22])
 by APP1 (Coremail) with SMTP id LxC2BwCXHQkw89hjKJDgAA--.10462S2;
 Tue, 31 Jan 2023 11:53:48 +0100 (CET)
Message-ID: <dd7df8bc5b69a6745bdcf030a4e0690e3e067ff2.camel@huaweicloud.com>
From: Roberto Sassu <roberto.sassu@huaweicloud.com>
To: Fan Wu <wufan@linux.microsoft.com>, corbet@lwn.net, zohar@linux.ibm.com,
 jmorris@namei.org, serge@hallyn.com, tytso@mit.edu, ebiggers@kernel.org, 
 axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, eparis@redhat.com, 
 paul@paul-moore.com
Date: Tue, 31 Jan 2023 11:53:27 +0100
In-Reply-To: <1675119451-23180-3-git-send-email-wufan@linux.microsoft.com>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-3-git-send-email-wufan@linux.microsoft.com>
User-Agent: Evolution 3.36.5-0ubuntu1
MIME-Version: 1.0
X-CM-TRANSID: LxC2BwCXHQkw89hjKJDgAA--.10462S2
X-Coremail-Antispam: 1UD129KBjvAXoWfGw4rKw17GFWxGFy5CrW7Arb_yoW8CFykto
 WxJrWYka1rAry7Cw1Fyr47Jry2ga95tw4kJFZ8WrW3u3Z2yayDKw4kXw4UJF4fuF1rKr18
 X3s7W3yfXa1xt3Z3n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYU7kC6x804xWl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK
 8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
 rVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCF04k20xvY
 0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
 6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUo0eHDUUUU
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAgAOBF1jj4RTjwAAsh
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Wed, 01 Feb 2023 08:03:52 +0000
Subject: Re: [dm-devel] [RFC PATCH v9 02/16] ipe: add policy parser
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
 linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-audit@redhat.com, linux-integrity@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2023-01-30 at 14:57 -0800, Fan Wu wrote:
> From: Deven Bowers <deven.desai@linux.microsoft.com>
> 
> IPE's interpretation of the what the user trusts is accomplished through
> its policy. IPE's design is to not provide support for a single trust
> provider, but to support multiple providers to enable the end-user to
> choose the best one to seek their needs.
> 
> This requires the policy to be rather flexible and modular so that
> integrity providers, like fs-verity, dm-verity, dm-integrity, or
> some other system, can plug into the policy with minimal code changes.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> 
> ---
> v2:
>   + Split evaluation loop, access control hooks,
>     and evaluation loop from policy parser and userspace
>     interface to pass mailing list character limit
> 
> v3:
>   + Move policy load and activation audit event to 03/12
>   + Fix a potential panic when a policy failed to load.
>   + use pr_warn for a failure to parse instead of an
>     audit record
>   + Remove comments from headers
>   + Add lockdep assertions to ipe_update_active_policy and
>     ipe_activate_policy
>   + Fix up warnings with checkpatch --strict
>   + Use file_ns_capable for CAP_MAC_ADMIN for securityfs
>     nodes.
>   + Use memdup_user instead of kzalloc+simple_write_to_buffer.
>   + Remove strict_parse command line parameter, as it is added
>     by the sysctl command line.
>   + Prefix extern variables with ipe_
> 
> v4:
>   + Remove securityfs to reverse-dependency
>   + Add SHA1 reverse dependency.
>   + Add versioning scheme for IPE properties, and associated
>     interface to query the versioning scheme.
>   + Cause a parser to always return an error on unknown syntax.
>   + Remove strict_parse option
>   + Change active_policy interface from sysctl, to securityfs,
>     and change scheme.
> 
> v5:
>   + Cause an error if a default action is not defined for each
>     operaiton.
>   + Minor function renames
> 
> v6:
>   + No changes
> 
> v7:
>   + Further split parser and userspace interface into two
>     separate commits, for easier review.
> 
>   + Refactor policy parser to make code cleaner via introducing a
>     more modular design, for easier extension of policy, and
>     easier review.
> 
> v8:
>   + remove unnecessary pr_info emission on parser loading
> 
>   + add explicit newline to the pr_err emitted when a parser
>     fails to load.
> 
> v9:
>   + switch to match table to parse policy
> 
>   + remove quote syntax and KERNEL_READ operation
> ---
>  security/ipe/Makefile        |   2 +
>  security/ipe/policy.c        |  99 +++++++
>  security/ipe/policy.h        |  77 ++++++
>  security/ipe/policy_parser.c | 515 +++++++++++++++++++++++++++++++++++
>  security/ipe/policy_parser.h |  11 +
>  5 files changed, 704 insertions(+)
>  create mode 100644 security/ipe/policy.c
>  create mode 100644 security/ipe/policy.h
>  create mode 100644 security/ipe/policy_parser.c
>  create mode 100644 security/ipe/policy_parser.h
> 
> diff --git a/security/ipe/Makefile b/security/ipe/Makefile
> index 571648579991..16bbe80991f1 100644
> --- a/security/ipe/Makefile
> +++ b/security/ipe/Makefile
> @@ -8,3 +8,5 @@
>  obj-$(CONFIG_SECURITY_IPE) += \
>  	hooks.o \
>  	ipe.o \
> +	policy.o \
> +	policy_parser.o \
> diff --git a/security/ipe/policy.c b/security/ipe/policy.c
> new file mode 100644
> index 000000000000..e446f4b84152
> --- /dev/null
> +++ b/security/ipe/policy.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Microsoft Corporation. All rights reserved.
> + */
> +
> +#include "ipe.h"
> +#include "policy.h"
> +#include "policy_parser.h"
> +#include "digest.h"
> +
> +#include <linux/verification.h>
> +
> +/**
> + * ipe_free_policy - Deallocate a given IPE policy.
> + * @p: Supplies the policy to free.
> + *
> + * Safe to call on IS_ERR/NULL.
> + */
> +void ipe_free_policy(struct ipe_policy *p)
> +{
> +	if (IS_ERR_OR_NULL(p))
> +		return;
> +
> +	free_parsed_policy(p->parsed);
> +	if (!p->pkcs7)
> +		kfree(p->text);
> +	kfree(p->pkcs7);
> +	kfree(p);
> +}
> +
> +static int set_pkcs7_data(void *ctx, const void *data, size_t len,
> +			  size_t asn1hdrlen)
> +{
> +	struct ipe_policy *p = ctx;
> +
> +	p->text = (const char *)data;
> +	p->textlen = len;
> +
> +	return 0;
> +}
> +
> +/**
> + * ipe_new_policy - Allocate and parse an ipe_policy structure.
> + *
> + * @text: Supplies a pointer to the plain-text policy to parse.
> + * @textlen: Supplies the length of @text.
> + * @pkcs7: Supplies a pointer to a pkcs7-signed IPE policy.
> + * @pkcs7len: Supplies the length of @pkcs7.
> + *
> + * @text/@textlen Should be NULL/0 if @pkcs7/@pkcs7len is set.
> + *
> + * The result will still need to be associated with a context via
> + * ipe_add_policy.
> + *
> + * Return:
> + * * !IS_ERR	- Success
> + * * -EBADMSG	- Policy is invalid
> + * * -ENOMEM	- Out of memory
> + */
> +struct ipe_policy *ipe_new_policy(const char *text, size_t textlen,
> +				  const char *pkcs7, size_t pkcs7len)
> +{
> +	int rc = 0;
> +	struct ipe_policy *new = NULL;
> +
> +	new = kzalloc(sizeof(*new), GFP_KERNEL);
> +	if (!new)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (!text) {
> +		new->pkcs7len = pkcs7len;
> +		new->pkcs7 = kmemdup(pkcs7, pkcs7len, GFP_KERNEL);
> +		if (!new->pkcs7) {
> +			rc = -ENOMEM;
> +			goto err;
> +		}

Uhm, memory leak? Also below. I suggest to use kmemleak.

Roberto

> +
> +		rc = verify_pkcs7_signature(NULL, 0, new->pkcs7, pkcs7len, NULL,
> +					    VERIFYING_UNSPECIFIED_SIGNATURE,
> +					    set_pkcs7_data, new);
> +		if (rc)
> +			goto err;
> +	} else {
> +		new->textlen = textlen;
> +		new->text = kstrdup(text, GFP_KERNEL);
> +		if (!new->text) {
> +			rc = -ENOMEM;
> +			goto err;
> +		}
> +	}
> +
> +	rc = parse_policy(new);
> +	if (rc)
> +		goto err;
> +
> +	return new;
> +err:
> +	return ERR_PTR(rc);
> +}
> diff --git a/security/ipe/policy.h b/security/ipe/policy.h
> new file mode 100644
> index 000000000000..6af2d9a811ec
> --- /dev/null
> +++ b/security/ipe/policy.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Microsoft Corporation. All rights reserved.
> + */
> +#ifndef IPE_POLICY_H
> +#define IPE_POLICY_H
> +
> +#include <linux/list.h>
> +#include <linux/types.h>
> +
> +enum ipe_op_type {
> +	ipe_op_exec = 0,
> +	ipe_op_firmware,
> +	ipe_op_kernel_module,
> +	ipe_op_kexec_image,
> +	ipe_op_kexec_initramfs,
> +	ipe_op_ima_policy,
> +	ipe_op_ima_x509,
> +	ipe_op_max
> +};
> +
> +enum ipe_action_type {
> +	ipe_action_allow = 0,
> +	ipe_action_deny,
> +	ipe_action_max
> +};
> +
> +enum ipe_prop_type {
> +	ipe_prop_max
> +};
> +
> +struct ipe_prop {
> +	struct list_head next;
> +	enum ipe_prop_type type;
> +	void *value;
> +};
> +
> +struct ipe_rule {
> +	enum ipe_op_type op;
> +	enum ipe_action_type action;
> +	struct list_head props;
> +	struct list_head next;
> +};
> +
> +struct ipe_op_table {
> +	struct list_head rules;
> +	enum ipe_action_type default_action;
> +};
> +
> +struct ipe_parsed_policy {
> +	const char *name;
> +	struct {
> +		u16 major;
> +		u16 minor;
> +		u16 rev;
> +	} version;
> +
> +	enum ipe_action_type global_default_action;
> +
> +	struct ipe_op_table rules[ipe_op_max];
> +};
> +
> +struct ipe_policy {
> +	const char     *pkcs7;
> +	size_t		pkcs7len;
> +
> +	const char     *text;
> +	size_t		textlen;
> +
> +	struct ipe_parsed_policy *parsed;
> +};
> +
> +struct ipe_policy *ipe_new_policy(const char *text, size_t textlen,
> +				  const char *pkcs7, size_t pkcs7len);
> +void ipe_free_policy(struct ipe_policy *pol);
> +
> +#endif /* IPE_POLICY_H */
> diff --git a/security/ipe/policy_parser.c b/security/ipe/policy_parser.c
> new file mode 100644
> index 000000000000..c7ba0e865366
> --- /dev/null
> +++ b/security/ipe/policy_parser.c
> @@ -0,0 +1,515 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Microsoft Corporation. All rights reserved.
> + */
> +
> +#include "policy.h"
> +#include "policy_parser.h"
> +#include "digest.h"
> +
> +#include <linux/parser.h>
> +
> +#define START_COMMENT	'#'
> +
> +/**
> + * new_parsed_policy - Allocate and initialize a parsed policy.
> + *
> + * Return:
> + * * !IS_ERR	- OK
> + * * -ENOMEM	- Out of memory
> + */
> +static struct ipe_parsed_policy *new_parsed_policy(void)
> +{
> +	size_t i = 0;
> +	struct ipe_parsed_policy *p = NULL;
> +	struct ipe_op_table *t = NULL;
> +
> +	p = kzalloc(sizeof(*p), GFP_KERNEL);
> +	if (!p)
> +		return ERR_PTR(-ENOMEM);
> +
> +	p->global_default_action = ipe_action_max;
> +
> +	for (i = 0; i < ARRAY_SIZE(p->rules); ++i) {
> +		t = &p->rules[i];
> +
> +		t->default_action = ipe_action_max;
> +		INIT_LIST_HEAD(&t->rules);
> +	}
> +
> +	return p;
> +}
> +
> +/**
> + * remove_comment - Truncate all chars following START_COMMENT in a string.
> + *
> + * @line: Supplies a poilcy line string for preprocessing.
> + */
> +static void remove_comment(char *line)
> +{
> +	size_t i, len = 0;
> +
> +	len = strlen(line);
> +	for (i = 0; i < len && line[i] != START_COMMENT; ++i)
> +		;
> +
> +	line[i] = '\0';
> +}
> +
> +/**
> + * remove_trailing_spaces - Truncate all trailing spaces in a string.
> + *
> + * @line: Supplies a poilcy line string for preprocessing.
> + */
> +static void remove_trailing_spaces(char *line)
> +{
> +	size_t i, len = 0;
> +
> +	len = strlen(line);
> +	for (i = len; i > 0 && (line[i - 1] == ' ' || line[i - 1] == '\t'); --i)
> +		;
> +
> +	line[i] = '\0';
> +}
> +
> +/**
> + * parse_version - Parse policy version.
> + * @ver: Supplies a version string to be parsed.
> + * @p: Supplies the partial parsed policy.
> + *
> + * Return:
> + * * 0	- OK
> + * * !0	- Standard errno
> + */
> +static int parse_version(char *ver, struct ipe_parsed_policy *p)
> +{
> +	int rc = 0;
> +	size_t sep_count = 0;
> +	char *token;
> +	u16 *const cv[] = { &p->version.major, &p->version.minor, &p->version.rev };
> +
> +	while ((token = strsep(&ver, ".")) != NULL) {
> +		/* prevent overflow */
> +		if (sep_count >= ARRAY_SIZE(cv)) {
> +			rc = -EBADMSG;
> +			goto err;
> +		}
> +
> +		rc = kstrtou16(token, 10, cv[sep_count]);
> +		if (rc)
> +			goto err;
> +
> +		++sep_count;
> +	}
> +
> +	/* prevent underflow */
> +	if (sep_count != ARRAY_SIZE(cv))
> +		rc = -EBADMSG;
> +
> +err:
> +	return rc;
> +}
> +
> +enum header_opt {
> +	ipe_header_policy_name = 0,
> +	ipe_header_policy_version,
> +	ipe_header_max
> +};
> +
> +static const match_table_t header_tokens = {
> +	{ipe_header_policy_name,	"policy_name=%s"},
> +	{ipe_header_policy_version,	"policy_version=%s"},
> +	{ipe_header_max,		NULL}
> +};
> +
> +/**
> + * parse_header - Parse policy header information.
> + * @line: Supplies header line to be parsed.
> + * @p: Supplies the partial parsed policy.
> + *
> + * Return:
> + * * 0	- OK
> + * * !0	- Standard errno
> + */
> +static int parse_header(char *line, struct ipe_parsed_policy *p)
> +{
> +	int rc = 0;
> +	char *t, *ver = NULL;
> +	substring_t args[MAX_OPT_ARGS];
> +	size_t idx = 0;
> +
> +	while ((t = strsep(&line, " \t")) != NULL) {
> +		int token;
> +
> +		if (*t == '\0')
> +			continue;
> +		if (idx >= ipe_header_max) {
> +			rc = -EBADMSG;
> +			goto err;
> +		}
> +
> +		token = match_token(t, header_tokens, args);
> +		if (token != idx) {
> +			rc = -EBADMSG;
> +			goto err;
> +		}
> +
> +		switch (token) {
> +		case ipe_header_policy_name:
> +			p->name = match_strdup(&args[0]);
> +			if (!p->name)
> +				rc = -ENOMEM;
> +			break;
> +		case ipe_header_policy_version:
> +			ver = match_strdup(&args[0]);
> +			if (!ver) {
> +				rc = -ENOMEM;
> +				break;
> +			}
> +			rc = parse_version(ver, p);
> +			break;
> +		default:
> +			rc = -EBADMSG;
> +		}
> +		if (rc)
> +			goto err;
> +		++idx;
> +	}
> +
> +	if (idx != ipe_header_max) {
> +		rc = -EBADMSG;
> +		goto err;
> +	}
> +	goto out;
> +
> +err:
> +	kfree(p->name);
> +	p->name = NULL;
> +out:
> +	kfree(ver);
> +	return rc;
> +}
> +
> +/**
> + * is_default - Determine if the given token is "DEFAULT".
> + * @token: Supplies the token string to be compared.
> + *
> + * Return:
> + * * 0	- The token is not "DEFAULT"
> + * * !0	- The token is "DEFAULT"
> + */
> +static bool is_default(char *token)
> +{
> +	return !strcmp(token, "DEFAULT");
> +}
> +
> +/**
> + * free_rule - Free the supplied ipe_rule struct.
> + * @r: Supplies the ipe_rule struct to be freed.
> + */
> +static void free_rule(struct ipe_rule *r)
> +{
> +	struct ipe_prop *p, *t;
> +
> +	if (IS_ERR_OR_NULL(r))
> +		return;
> +
> +	list_for_each_entry_safe(p, t, &r->props, next) {
> +		kfree(p);
> +	}
> +
> +	kfree(r);
> +}
> +
> +static const match_table_t operation_tokens = {
> +	{ipe_op_exec,			"op=EXECUTE"},
> +	{ipe_op_firmware,		"op=FIRMWARE"},
> +	{ipe_op_kernel_module,		"op=KMODULE"},
> +	{ipe_op_kexec_image,		"op=KEXEC_IMAGE"},
> +	{ipe_op_kexec_initramfs,	"op=KEXEC_INITRAMFS"},
> +	{ipe_op_ima_policy,		"op=IMA_POLICY"},
> +	{ipe_op_ima_x509,		"op=IMA_X509_CERT"},
> +	{ipe_op_max,			NULL}
> +};
> +
> +/**
> + * parse_operation - Parse the opeartion type given a token string.
> + * @t: Supplies the token string to be parsed.
> + *
> + * Return: The parsed opeartion type.
> + */
> +static enum ipe_op_type parse_operation(char *t)
> +{
> +	substring_t args[MAX_OPT_ARGS];
> +
> +	return match_token(t, operation_tokens, args);
> +}
> +
> +static const match_table_t action_tokens = {
> +	{ipe_action_allow,	"action=ALLOW"},
> +	{ipe_action_deny,	"action=DENY"},
> +	{ipe_action_max,	NULL}
> +};
> +
> +/**
> + * parse_action - Parse the action type given a token string.
> + * @t: Supplies the token string to be parsed.
> + *
> + * Return: The parsed action type.
> + */
> +static enum ipe_action_type parse_action(char *t)
> +{
> +	substring_t args[MAX_OPT_ARGS];
> +
> +	return match_token(t, action_tokens, args);
> +}
> +
> +static const match_table_t property_tokens = {
> +	{ipe_prop_max,					NULL}
> +};
> +
> +/**
> + * parse_property - Parse the property type given a token string.
> + * @t: Supplies the token string to be parsed.
> + * @r: Supplies the ipe_rule the parsed property will be associated with.
> + *
> + * Return:
> + * * !IS_ERR	- OK
> + * * -ENOMEM	- Out of memory
> + * * -EBADMSG	- The supplied token cannot be parsed
> + */
> +int parse_property(char *t, struct ipe_rule *r)
> +{
> +	substring_t args[MAX_OPT_ARGS];
> +	struct ipe_prop *p = NULL;
> +	int rc = 0;
> +	int token;
> +	char *dup = NULL;
> +
> +	p = kzalloc(sizeof(*p), GFP_KERNEL);
> +	if (!p) {
> +		rc = -ENOMEM;
> +		goto err;
> +	}
> +
> +	token = match_token(t, property_tokens, args);
> +
> +	switch (token) {
> +	case ipe_prop_max:
> +	default:
> +		rc = -EBADMSG;
> +		break;
> +	}
> +	list_add_tail(&p->next, &r->props);
> +
> +err:
> +	kfree(dup);
> +	return rc;
> +}
> +
> +/**
> + * parse_rule - parse a policy rule line.
> + * @line: Supplies rule line to be parsed.
> + * @p: Supplies the partial parsed policy.
> + *
> + * Return:
> + * * !IS_ERR	- OK
> + * * -ENOMEM	- Out of memory
> + * * -EBADMSG	- Policy syntax error
> + */
> +static int parse_rule(char *line, struct ipe_parsed_policy *p)
> +{
> +	int rc = 0;
> +	bool first_token = true, is_default_rule = false;
> +	bool op_parsed = false;
> +	enum ipe_op_type op = ipe_op_max;
> +	enum ipe_action_type action = ipe_action_max;
> +	struct ipe_rule *r = NULL;
> +	char *t;
> +
> +	r = kzalloc(sizeof(*r), GFP_KERNEL);
> +	if (!r) {
> +		rc = -ENOMEM;
> +		goto err;
> +	}
> +
> +	INIT_LIST_HEAD(&r->next);
> +	INIT_LIST_HEAD(&r->props);
> +
> +	while (t = strsep(&line, " \t"), line) {
> +		if (*t == '\0')
> +			continue;
> +		if (first_token && is_default(t)) {
> +			is_default_rule = true;
> +		} else {
> +			if (!op_parsed) {
> +				op = parse_operation(t);
> +				if (op == ipe_op_max)
> +					rc = -EBADMSG;
> +				else
> +					op_parsed = true;
> +			} else {
> +				rc = parse_property(t, r);
> +			}
> +		}
> +
> +		if (rc)
> +			goto err;
> +		first_token = false;
> +	}
> +
> +	action = parse_action(t);
> +	if (action == ipe_action_max) {
> +		rc = -EBADMSG;
> +		goto err;
> +	}
> +
> +	if (is_default_rule) {
> +		if (op == ipe_op_max) {
> +			if (p->global_default_action != ipe_action_max)
> +				rc = -EBADMSG;
> +			else
> +				p->global_default_action = action;
> +		} else {
> +			if (p->rules[op].default_action != ipe_action_max)
> +				rc = -EBADMSG;
> +			else
> +				p->rules[op].default_action = action;
> +		}
> +		free_rule(r);
> +	} else if (op != ipe_op_max && action != ipe_action_max) {
> +		r->op = op;
> +		r->action = action;
> +		list_add_tail(&r->next, &p->rules[op].rules);
> +	} else {
> +		rc = -EBADMSG;
> +	}
> +
> +	if (rc)
> +		goto err;
> +
> +	goto out;
> +
> +err:
> +	free_rule(r);
> +out:
> +	return rc;
> +}
> +
> +/**
> + * free_parsed_policy - free a parsed policy structure.
> + * @p: Supplies the parsed policy.
> + */
> +void free_parsed_policy(struct ipe_parsed_policy *p)
> +{
> +	size_t i = 0;
> +	struct ipe_rule *pp, *t;
> +
> +	if (IS_ERR_OR_NULL(p))
> +		return;
> +
> +	for (i = 0; i < ARRAY_SIZE(p->rules); ++i)
> +		list_for_each_entry_safe(pp, t, &p->rules[i].rules, next)
> +			free_rule(pp);
> +
> +	kfree(p);
> +}
> +
> +/**
> + * validate_policy - validate a parsed policy.
> + * @p: Supplies the fully parsed policy.
> + *
> + * Given a policy structure that was just parsed, validate that all
> + * necessary fields are present, initialized correctly, and all lines
> + * parsed are have been consumed.
> + *
> + * A parsed policy can be an invalid state for use (a default was
> + * undefined, a header was undefined) by just parsing the policy.
> + *
> + * Return:
> + * * 0		- OK
> + * * -EBADMSG	- Policy is invalid
> + */
> +static int validate_policy(const struct ipe_parsed_policy *p)
> +{
> +	int i = 0;
> +
> +	if (p->global_default_action != ipe_action_max)
> +		return 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(p->rules); ++i) {
> +		if (p->rules[i].default_action == ipe_action_max)
> +			return -EBADMSG;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * parse_policy - Given a string, parse the string into an IPE policy.
> + * @p: partially filled ipe_policy structure to populate with the result.
> + *     it must have text and textlen set.
> + *
> + * Return:
> + * * 0		- OK
> + * * -EBADMSG	- Policy is invalid
> + * * -ENOMEM	- Out of Memory
> + */
> +int parse_policy(struct ipe_policy *p)
> +{
> +	int rc = 0;
> +	size_t len;
> +	char *policy = NULL, *dup = NULL;
> +	char *line = NULL;
> +	bool header_parsed = false;
> +	struct ipe_parsed_policy *pp = NULL;
> +
> +	if (!p->textlen)
> +		return -EBADMSG;
> +
> +	policy = kmemdup_nul(p->text, p->textlen, GFP_KERNEL);
> +	if (!policy)
> +		return -ENOMEM;
> +	dup = policy;
> +
> +	pp = new_parsed_policy();
> +	if (IS_ERR(pp)) {
> +		rc = PTR_ERR(pp);
> +		goto out;
> +	}
> +
> +	while ((line = strsep(&policy, "\n\r")) != NULL) {
> +		remove_comment(line);
> +		remove_trailing_spaces(line);
> +		len = strlen(line);
> +		if (!len)
> +			continue;
> +
> +		if (!header_parsed) {
> +			rc = parse_header(line, pp);
> +			if (rc)
> +				goto err;
> +			header_parsed = true;
> +			continue;
> +		}
> +
> +		rc = parse_rule(line, pp);
> +		if (rc)
> +			goto err;
> +	}
> +
> +	if (!header_parsed || validate_policy(pp)) {
> +		rc = -EBADMSG;
> +		goto err;
> +	}
> +
> +	p->parsed = pp;
> +
> +	goto out;
> +err:
> +	free_parsed_policy(pp);
> +out:
> +	kfree(dup);
> +
> +	return rc;
> +}
> diff --git a/security/ipe/policy_parser.h b/security/ipe/policy_parser.h
> new file mode 100644
> index 000000000000..699ca58a5a32
> --- /dev/null
> +++ b/security/ipe/policy_parser.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Microsoft Corporation. All rights reserved.
> + */
> +#ifndef IPE_POLICY_PARSER_H
> +#define IPE_POLICY_PARSER_H
> +
> +int parse_policy(struct ipe_policy *p);
> +void free_parsed_policy(struct ipe_parsed_policy *p);
> +
> +#endif /* IPE_POLICY_PARSER */

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

