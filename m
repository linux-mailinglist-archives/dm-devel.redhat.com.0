Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 116086825CC
	for <lists+dm-devel@lfdr.de>; Tue, 31 Jan 2023 08:47:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675151249;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MEnT5Vw2ugGCd6X4Yo9AsegnzUrMPK1HqDo2rhovafM=;
	b=gFvkCtOuveGzZ/zmkM4RAdCCXR8q4yfYevBIg+USEs8g7RH84gDjf8v30iaL4337Lf0sft
	NBSJLinSMc6Bj7DGnNTsLe+kphMp/5+xbl7IXCA0dBDSx2qxux3x76SpiZULSB3LIIxO9e
	5gHK+HBSwmameOgqh53x+M9WiDM9VI0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-wNHLIdSOOf6zdNG9l51RvQ-1; Tue, 31 Jan 2023 02:47:28 -0500
X-MC-Unique: wNHLIdSOOf6zdNG9l51RvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 219043815EE0;
	Tue, 31 Jan 2023 07:47:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C23FA2166B34;
	Tue, 31 Jan 2023 07:47:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C4CBF1946A68;
	Tue, 31 Jan 2023 07:47:19 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 474301946587
 for <dm-devel@listman.corp.redhat.com>; Mon, 30 Jan 2023 23:06:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 378D740C2005; Mon, 30 Jan 2023 23:06:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3041F40C2004
 for <dm-devel@redhat.com>; Mon, 30 Jan 2023 23:06:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1154687B2A5
 for <dm-devel@redhat.com>; Mon, 30 Jan 2023 23:06:40 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-232-2HF_eDnkMLCxVGoLTjRj7Q-1; Mon,
 30 Jan 2023 18:06:36 -0500
X-MC-Unique: 2HF_eDnkMLCxVGoLTjRj7Q-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id ACB3E20EA215; Mon, 30 Jan 2023 14:58:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ACB3E20EA215
From: Fan Wu <wufan@linux.microsoft.com>
To: corbet@lwn.net, zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
 tytso@mit.edu, ebiggers@kernel.org, axboe@kernel.dk, agk@redhat.com,
 snitzer@kernel.org, eparis@redhat.com, paul@paul-moore.com
Date: Mon, 30 Jan 2023 14:57:29 -0800
Message-Id: <1675119451-23180-15-git-send-email-wufan@linux.microsoft.com>
In-Reply-To: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 31 Jan 2023 07:47:16 +0000
Subject: [dm-devel] [RFC PATCH v9 14/16] scripts: add boot policy generation
 program
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
Cc: Fan Wu <wufan@linux.microsoft.com>, dm-devel@redhat.com,
 linux-doc@vger.kernel.org, Deven Bowers <deven.desai@linux.microsoft.com>,
 roberto.sassu@huawei.com, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-audit@redhat.com,
 linux-integrity@vger.kernel.org
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Deven Bowers <deven.desai@linux.microsoft.com>

Enables an IPE policy to be enforced from kernel start, enabling access
control based on trust from kernel startup. This is accomplished by
transforming an IPE policy indicated by CONFIG_IPE_BOOT_POLICY into a
c-string literal that is parsed at kernel startup as an unsigned policy.

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
---
v2:
  + No Changes

v3:
  + No Changes

v4:
  + No Changes

v5:
  + No Changes

v6:
  + No Changes

v7:
  + Move from 01/11 to 14/16
  + Don't return errno directly.
  + Make output of script more user-friendly
  + Add escaping for tab and '?'
  + Mark argv pointer const
  + Invert return code check in the boot policy parsing code path.

v8:
  + No significant changes.

v9:
  + no changes
---
 MAINTAINERS                   |   1 +
 scripts/Makefile              |   1 +
 scripts/ipe/Makefile          |   2 +
 scripts/ipe/polgen/.gitignore |   1 +
 scripts/ipe/polgen/Makefile   |   6 ++
 scripts/ipe/polgen/polgen.c   | 145 ++++++++++++++++++++++++++++++++++
 security/ipe/.gitignore       |   1 +
 security/ipe/Kconfig          |  10 +++
 security/ipe/Makefile         |  11 +++
 security/ipe/fs.c             |   8 ++
 security/ipe/ipe.c            |  19 +++++
 11 files changed, 205 insertions(+)
 create mode 100644 scripts/ipe/Makefile
 create mode 100644 scripts/ipe/polgen/.gitignore
 create mode 100644 scripts/ipe/polgen/Makefile
 create mode 100644 scripts/ipe/polgen/polgen.c
 create mode 100644 security/ipe/.gitignore

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e27e84763cc..d5b4a6636b0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10276,6 +10276,7 @@ F:	security/integrity/
 INTEGRITY POLICY ENFORCEMENT (IPE)
 M:	Fan Wu <wufan@linux.microsoft.com>
 S:	Supported
+F:	scripts/ipe/
 F:	security/ipe/
 
 INTEL 810/815 FRAMEBUFFER DRIVER
diff --git a/scripts/Makefile b/scripts/Makefile
index 1575af84d557..5d1def33df82 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -41,6 +41,7 @@ targets += module.lds
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
+subdir-$(CONFIG_SECURITY_IPE) += ipe
 
 # Let clean descend into subdirs
 subdir-	+= basic dtc gdb kconfig mod
diff --git a/scripts/ipe/Makefile b/scripts/ipe/Makefile
new file mode 100644
index 000000000000..e87553fbb8d6
--- /dev/null
+++ b/scripts/ipe/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+subdir-y := polgen
diff --git a/scripts/ipe/polgen/.gitignore b/scripts/ipe/polgen/.gitignore
new file mode 100644
index 000000000000..80f32f25d200
--- /dev/null
+++ b/scripts/ipe/polgen/.gitignore
@@ -0,0 +1 @@
+polgen
diff --git a/scripts/ipe/polgen/Makefile b/scripts/ipe/polgen/Makefile
new file mode 100644
index 000000000000..066060c22b4a
--- /dev/null
+++ b/scripts/ipe/polgen/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+hostprogs-always-y	:= polgen
+HOST_EXTRACFLAGS += \
+	-I$(srctree)/include \
+	-I$(srctree)/include/uapi \
+
diff --git a/scripts/ipe/polgen/polgen.c b/scripts/ipe/polgen/polgen.c
new file mode 100644
index 000000000000..40b6fe07f47b
--- /dev/null
+++ b/scripts/ipe/polgen/polgen.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Microsoft Corporation. All rights reserved.
+ */
+
+#include <stdlib.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <errno.h>
+
+static void usage(const char *const name)
+{
+	printf("Usage: %s OutputFile (PolicyFile)\n", name);
+	exit(EINVAL);
+}
+
+static int policy_to_buffer(const char *pathname, char **buffer, size_t *size)
+{
+	int rc = 0;
+	FILE *fd;
+	char *lbuf;
+	size_t fsize;
+	size_t read;
+
+	fd = fopen(pathname, "r");
+	if (!fd) {
+		rc = errno;
+		goto out;
+	}
+
+	fseek(fd, 0, SEEK_END);
+	fsize = ftell(fd);
+	rewind(fd);
+
+	lbuf = malloc(fsize);
+	if (!lbuf) {
+		rc = ENOMEM;
+		goto out_close;
+	}
+
+	read = fread((void *)lbuf, sizeof(*lbuf), fsize, fd);
+	if (read != fsize) {
+		rc = -1;
+		goto out_free;
+	}
+
+	*buffer = lbuf;
+	*size = fsize;
+	fclose(fd);
+
+	return rc;
+
+out_free:
+	free(lbuf);
+out_close:
+	fclose(fd);
+out:
+	return rc;
+}
+
+static int write_boot_policy(const char *pathname, const char *buf, size_t size)
+{
+	int rc = 0;
+	FILE *fd;
+	size_t i;
+
+	fd = fopen(pathname, "w");
+	if (!fd) {
+		rc = errno;
+		goto err;
+	}
+
+	fprintf(fd, "/* This file is automatically generated.");
+	fprintf(fd, " Do not edit. */\n");
+	fprintf(fd, "#include <linux/stddef.h>\n");
+	fprintf(fd, "\nextern const char *const ipe_boot_policy;\n\n");
+	fprintf(fd, "const char *const ipe_boot_policy =\n");
+
+	if (!buf || size == 0) {
+		fprintf(fd, "\tNULL;\n");
+		fclose(fd);
+		return 0;
+	}
+
+	fprintf(fd, "\t\"");
+
+	for (i = 0; i < size; ++i) {
+		switch (buf[i]) {
+		case '"':
+			fprintf(fd, "\\\"");
+			break;
+		case '\'':
+			fprintf(fd, "'");
+			break;
+		case '\n':
+			fprintf(fd, "\\n\"\n\t\"");
+			break;
+		case '\\':
+			fprintf(fd, "\\\\");
+			break;
+		case '\t':
+			fprintf(fd, "\\t");
+			break;
+		case '\?':
+			fprintf(fd, "\\?");
+			break;
+		default:
+			fprintf(fd, "%c", buf[i]);
+		}
+	}
+	fprintf(fd, "\";\n");
+	fclose(fd);
+
+	return 0;
+
+err:
+	if (fd)
+		fclose(fd);
+	return rc;
+}
+
+int main(int argc, const char *const argv[])
+{
+	int rc = 0;
+	size_t len = 0;
+	char *policy = NULL;
+
+	if (argc < 2)
+		usage(argv[0]);
+
+	if (argc > 2) {
+		rc = policy_to_buffer(argv[2], &policy, &len);
+		if (rc != 0)
+			goto cleanup;
+	}
+
+	rc = write_boot_policy(argv[1], policy, len);
+cleanup:
+	if (policy)
+		free(policy);
+	if (rc != 0)
+		perror("An error occurred during policy conversion: ");
+	return rc;
+}
diff --git a/security/ipe/.gitignore b/security/ipe/.gitignore
new file mode 100644
index 000000000000..eca22ad5ed22
--- /dev/null
+++ b/security/ipe/.gitignore
@@ -0,0 +1 @@
+boot-policy.c
\ No newline at end of file
diff --git a/security/ipe/Kconfig b/security/ipe/Kconfig
index dd9a066dd35a..691fdb9ae60e 100644
--- a/security/ipe/Kconfig
+++ b/security/ipe/Kconfig
@@ -17,6 +17,16 @@ menuconfig SECURITY_IPE
 	  If unsure, answer N.
 
 if SECURITY_IPE
+config IPE_BOOT_POLICY
+	string "Integrity policy to apply on system startup"
+	help
+	  This option specifies a filepath to a IPE policy that is compiled
+	  into the kernel. This policy will be enforced until a policy update
+	  is deployed via the $securityfs/ipe/policies/$policy_name/active
+	  interface.
+
+	  If unsure, leave blank.
+
 menu "IPE Trust Providers"
 
 config IPE_PROP_DM_VERITY
diff --git a/security/ipe/Makefile b/security/ipe/Makefile
index 90203daf0dbb..e6d5176bc20b 100644
--- a/security/ipe/Makefile
+++ b/security/ipe/Makefile
@@ -5,7 +5,16 @@
 # Makefile for building the IPE module as part of the kernel tree.
 #
 
+quiet_cmd_polgen = IPE_POL $(2)
+      cmd_polgen = scripts/ipe/polgen/polgen security/ipe/boot-policy.c $(2)
+
+targets += boot-policy.c
+
+$(obj)/boot-policy.c: scripts/ipe/polgen/polgen $(CONFIG_IPE_BOOT_POLICY) FORCE
+	$(call if_changed,polgen,$(CONFIG_IPE_BOOT_POLICY))
+
 obj-$(CONFIG_SECURITY_IPE) += \
+	boot-policy.o \
 	digest.o \
 	eval.o \
 	fs.o \
@@ -16,3 +25,5 @@ obj-$(CONFIG_SECURITY_IPE) += \
 	policy_parser.o \
 	digest.o \
 	audit.o \
+
+clean-files := boot-policy.c \
diff --git a/security/ipe/fs.c b/security/ipe/fs.c
index bbee17b59b1b..0a371c785e3b 100644
--- a/security/ipe/fs.c
+++ b/security/ipe/fs.c
@@ -185,6 +185,7 @@ static const struct file_operations enforce_fops = {
 static int __init ipe_init_securityfs(void)
 {
 	int rc = 0;
+	struct ipe_policy *p = NULL;
 
 	if (!ipe_enabled)
 		return -EOPNOTSUPP;
@@ -221,6 +222,13 @@ static int __init ipe_init_securityfs(void)
 		goto err;
 	}
 
+	p = ipe_get_policy_rcu(ipe_active_policy);
+	if (p) {
+		rc = ipe_new_policyfs_node(p);
+		if (rc)
+			goto err;
+	}
+
 	return 0;
 err:
 	securityfs_remove(np);
diff --git a/security/ipe/ipe.c b/security/ipe/ipe.c
index 705ce9a003de..458f7a542c66 100644
--- a/security/ipe/ipe.c
+++ b/security/ipe/ipe.c
@@ -7,6 +7,7 @@
 #include "hooks.h"
 #include "eval.h"
 
+extern const char *const ipe_boot_policy;
 bool ipe_enabled;
 
 static struct lsm_blob_sizes ipe_blobs __lsm_ro_after_init = {
@@ -64,10 +65,28 @@ static struct security_hook_list ipe_hooks[] __lsm_ro_after_init = {
 static int __init ipe_init(void)
 {
 	int rc = 0;
+	struct ipe_policy *p = NULL;
 
 	security_add_hooks(ipe_hooks, ARRAY_SIZE(ipe_hooks), "ipe");
 	ipe_enabled = true;
 
+	if (ipe_boot_policy) {
+		p = ipe_new_policy(ipe_boot_policy, strlen(ipe_boot_policy),
+				   NULL, 0);
+		if (IS_ERR(p)) {
+			rc = PTR_ERR(p);
+			goto err;
+		}
+
+		rc = ipe_set_active_pol(p);
+		if (rc)
+			goto err;
+	}
+
+	goto out;
+err:
+	ipe_free_policy(p);
+out:
 	return rc;
 }
 
-- 
2.39.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

