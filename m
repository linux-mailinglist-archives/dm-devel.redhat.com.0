Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC2C2EEC27
	for <lists+dm-devel@lfdr.de>; Fri,  8 Jan 2021 05:08:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-estnXUkUNO6TBdJTQZm0ZA-1; Thu, 07 Jan 2021 23:08:03 -0500
X-MC-Unique: estnXUkUNO6TBdJTQZm0ZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C89781034B21;
	Fri,  8 Jan 2021 04:07:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F7C709B0;
	Fri,  8 Jan 2021 04:07:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 638F95002E;
	Fri,  8 Jan 2021 04:07:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10847WiB008599 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Jan 2021 23:07:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3F023114B9B1; Fri,  8 Jan 2021 04:07:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B09E114B9AC
	for <dm-devel@redhat.com>; Fri,  8 Jan 2021 04:07:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24D55185A794
	for <dm-devel@redhat.com>; Fri,  8 Jan 2021 04:07:32 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-109-IhyNMv5gN0aU-f9O_G4uFQ-3;
	Thu, 07 Jan 2021 23:07:27 -0500
X-MC-Unique: IhyNMv5gN0aU-f9O_G4uFQ-3
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id B16DC20B6C47;
	Thu,  7 Jan 2021 20:07:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B16DC20B6C47
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com, paul@paul-moore.com
Date: Thu,  7 Jan 2021 20:07:08 -0800
Message-Id: <20210108040708.8389-9-tusharsu@linux.microsoft.com>
In-Reply-To: <20210108040708.8389-1-tusharsu@linux.microsoft.com>
References: <20210108040708.8389-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: [dm-devel] [PATCH v10 8/8] selinux: include a consumer of the new
	IMA critical data hook
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

SELinux stores the active policy in memory, so the changes to this data
at runtime would have an impact on the security guarantees provided
by SELinux.  Measuring in-memory SELinux policy through IMA subsystem
provides a secure way for the attestation service to remotely validate
the policy contents at runtime.

Measure the hash of the loaded policy by calling the IMA hook
ima_measure_critical_data().  Since the size of the loaded policy
can be large (several MB), measure the hash of the policy instead of
the entire policy to avoid bloating the IMA log entry.

To enable SELinux data measurement, the following steps are required:

1, Add "ima_policy=critical_data" to the kernel command line arguments
   to enable measuring SELinux data at boot time.
For example,
  BOOT_IMAGE=/boot/vmlinuz-5.10.0-rc1+ root=UUID=fd643309-a5d2-4ed3-b10d-3c579a5fab2f ro nomodeset security=selinux ima_policy=critical_data

2, Add the following rule to /etc/ima/ima-policy
   measure func=CRITICAL_DATA label=selinux

Sample measurement of the hash of SELinux policy:

To verify the measured data with the current SELinux policy run
the following commands and verify the output hash values match.

  sha256sum /sys/fs/selinux/policy | cut -d' ' -f 1

  grep "selinux-policy-hash" /sys/kernel/security/integrity/ima/ascii_runtime_measurements | tail -1 | cut -d' ' -f 6

Note that the actual verification of SELinux policy would require loading
the expected policy into an identical kernel on a pristine/known-safe
system and run the sha256sum /sys/kernel/selinux/policy there to get
the expected hash.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>
---
 Documentation/ABI/testing/ima_policy |  3 +-
 security/selinux/Makefile            |  2 +
 security/selinux/ima.c               | 64 ++++++++++++++++++++++++++++
 security/selinux/include/ima.h       | 24 +++++++++++
 security/selinux/include/security.h  |  3 +-
 security/selinux/ss/services.c       | 64 ++++++++++++++++++++++++----
 6 files changed, 149 insertions(+), 11 deletions(-)
 create mode 100644 security/selinux/ima.c
 create mode 100644 security/selinux/include/ima.h

diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
index 54fe1c15ed50..8365596cb42b 100644
--- a/Documentation/ABI/testing/ima_policy
+++ b/Documentation/ABI/testing/ima_policy
@@ -52,8 +52,9 @@ Description:
 			template:= name of a defined IMA template type
 			(eg, ima-ng). Only valid when action is "measure".
 			pcr:= decimal value
-			label:= [data_label]
+			label:= [selinux]|[data_label]
 			data_label:= a unique string used for grouping and limiting critical data.
+			For example, "selinux" to measure critical data for SELinux.
 
 		  default policy:
 			# PROC_SUPER_MAGIC
diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index 4d8e0e8adf0b..776162444882 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -16,6 +16,8 @@ selinux-$(CONFIG_NETLABEL) += netlabel.o
 
 selinux-$(CONFIG_SECURITY_INFINIBAND) += ibpkey.o
 
+selinux-$(CONFIG_IMA) += ima.o
+
 ccflags-y := -I$(srctree)/security/selinux -I$(srctree)/security/selinux/include
 
 $(addprefix $(obj)/,$(selinux-y)): $(obj)/flask.h
diff --git a/security/selinux/ima.c b/security/selinux/ima.c
new file mode 100644
index 000000000000..0b835bdc3aa9
--- /dev/null
+++ b/security/selinux/ima.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2021 Microsoft Corporation
+ *
+ * Author: Lakshmi Ramasubramanian (nramas@linux.microsoft.com)
+ *
+ * Measure critical data structures maintainted by SELinux
+ * using IMA subsystem.
+ */
+#include <linux/vmalloc.h>
+#include <linux/ktime.h>
+#include <linux/ima.h>
+#include "security.h"
+#include "ima.h"
+
+/*
+ * selinux_ima_measure_state - Measure hash of the SELinux policy
+ *
+ * @state: selinux state struct
+ *
+ * NOTE: This function must be called with policy_mutex held.
+ */
+void selinux_ima_measure_state(struct selinux_state *state)
+{
+	struct timespec64 cur_time;
+	void *policy = NULL;
+	char *policy_event_name = NULL;
+	size_t policy_len;
+	int rc = 0;
+
+	/*
+	 * Measure SELinux policy only after initialization is completed.
+	 */
+	if (!selinux_initialized(state))
+		return;
+
+	/*
+	 * Pass a unique "event_name" to the IMA hook so that IMA subsystem
+	 * will always measure the given data.
+	 */
+	ktime_get_real_ts64(&cur_time);
+	policy_event_name = kasprintf(GFP_KERNEL, "%s-%lld:%09ld",
+				      "selinux-policy-hash",
+				      cur_time.tv_sec, cur_time.tv_nsec);
+	if (!policy_event_name) {
+		pr_err("SELinux: %s: event name for policy not allocated.\n",
+		       __func__);
+		goto out;
+	}
+
+	rc = security_read_state_kernel(state, &policy, &policy_len);
+	if (rc) {
+		pr_err("SELinux: %s: failed to read policy %d.\n", __func__, rc);
+		goto out;
+	}
+
+	ima_measure_critical_data("selinux", policy_event_name,
+				  policy, policy_len, true);
+
+	vfree(policy);
+
+out:
+	kfree(policy_event_name);
+}
diff --git a/security/selinux/include/ima.h b/security/selinux/include/ima.h
new file mode 100644
index 000000000000..d69c36611423
--- /dev/null
+++ b/security/selinux/include/ima.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2021 Microsoft Corporation
+ *
+ * Author: Lakshmi Ramasubramanian (nramas@linux.microsoft.com)
+ *
+ * Measure critical data structures maintainted by SELinux
+ * using IMA subsystem.
+ */
+
+#ifndef _SELINUX_IMA_H_
+#define _SELINUX_IMA_H_
+
+#include "security.h"
+
+#ifdef CONFIG_IMA
+extern void selinux_ima_measure_state(struct selinux_state *selinux_state);
+#else
+static inline void selinux_ima_measure_state(struct selinux_state *selinux_state)
+{
+}
+#endif
+
+#endif	/* _SELINUX_IMA_H_ */
diff --git a/security/selinux/include/security.h b/security/selinux/include/security.h
index 3cc8bab31ea8..29cae32d3fc5 100644
--- a/security/selinux/include/security.h
+++ b/security/selinux/include/security.h
@@ -229,7 +229,8 @@ void selinux_policy_cancel(struct selinux_state *state,
 			struct selinux_policy *policy);
 int security_read_policy(struct selinux_state *state,
 			 void **data, size_t *len);
-
+int security_read_state_kernel(struct selinux_state *state,
+			       void **data, size_t *len);
 int security_policycap_supported(struct selinux_state *state,
 				 unsigned int req_cap);
 
diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 9704c8a32303..cc8dbc4ed8db 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -65,6 +65,7 @@
 #include "ebitmap.h"
 #include "audit.h"
 #include "policycap_names.h"
+#include "ima.h"
 
 /* Forward declaration. */
 static int context_struct_to_string(struct policydb *policydb,
@@ -2180,6 +2181,7 @@ static void selinux_notify_policy_change(struct selinux_state *state,
 	selinux_status_update_policyload(state, seqno);
 	selinux_netlbl_cache_invalidate();
 	selinux_xfrm_notify_policyload();
+	selinux_ima_measure_state(state);
 }
 
 void selinux_policy_commit(struct selinux_state *state,
@@ -3875,8 +3877,33 @@ int security_netlbl_sid_to_secattr(struct selinux_state *state,
 }
 #endif /* CONFIG_NETLABEL */
 
+/**
+ * __security_read_policy - read the policy.
+ * @policy: SELinux policy
+ * @data: binary policy data
+ * @len: length of data in bytes
+ *
+ */
+static int __security_read_policy(struct selinux_policy *policy,
+				  void *data, size_t *len)
+{
+	int rc;
+	struct policy_file fp;
+
+	fp.data = data;
+	fp.len = *len;
+
+	rc = policydb_write(&policy->policydb, &fp);
+	if (rc)
+		return rc;
+
+	*len = (unsigned long)fp.data - (unsigned long)data;
+	return 0;
+}
+
 /**
  * security_read_policy - read the policy.
+ * @state: selinux_state
  * @data: binary policy data
  * @len: length of data in bytes
  *
@@ -3885,8 +3912,6 @@ int security_read_policy(struct selinux_state *state,
 			 void **data, size_t *len)
 {
 	struct selinux_policy *policy;
-	int rc;
-	struct policy_file fp;
 
 	policy = rcu_dereference_protected(
 			state->policy, lockdep_is_held(&state->policy_mutex));
@@ -3898,14 +3923,35 @@ int security_read_policy(struct selinux_state *state,
 	if (!*data)
 		return -ENOMEM;
 
-	fp.data = *data;
-	fp.len = *len;
+	return __security_read_policy(policy, *data, len);
+}
 
-	rc = policydb_write(&policy->policydb, &fp);
-	if (rc)
-		return rc;
+/**
+ * security_read_state_kernel - read the policy.
+ * @state: selinux_state
+ * @data: binary policy data
+ * @len: length of data in bytes
+ *
+ * Allocates kernel memory for reading SELinux policy.
+ * This function is for internal use only and should not
+ * be used for returning data to user space.
+ *
+ * This function must be called with policy_mutex held.
+ */
+int security_read_state_kernel(struct selinux_state *state,
+			       void **data, size_t *len)
+{
+	struct selinux_policy *policy;
 
-	*len = (unsigned long)fp.data - (unsigned long)*data;
-	return 0;
+	policy = rcu_dereference_protected(
+			state->policy, lockdep_is_held(&state->policy_mutex));
+	if (!policy)
+		return -EINVAL;
+
+	*len = policy->policydb.len;
+	*data = vmalloc(*len);
+	if (!*data)
+		return -ENOMEM;
 
+	return __security_read_policy(policy, *data, len);
 }
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

