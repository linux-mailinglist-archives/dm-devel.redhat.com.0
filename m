Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 94A84244535
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:06:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-B9UDrRehPVeswyzjg4y-6g-1; Fri, 14 Aug 2020 03:06:18 -0400
X-MC-Unique: B9UDrRehPVeswyzjg4y-6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34D5A802B4C;
	Fri, 14 Aug 2020 07:06:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 156A8747A1;
	Fri, 14 Aug 2020 07:06:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB8884EE16;
	Fri, 14 Aug 2020 07:06:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CJb7Re030656 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 15:37:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1FEA111142A; Wed, 12 Aug 2020 19:37:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD01B1111423
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 19:37:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F12778007D7
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 19:36:59 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-473-e3ARMG63ORqzcsc1WlSwqA-1;
	Wed, 12 Aug 2020 15:36:57 -0400
X-MC-Unique: e3ARMG63ORqzcsc1WlSwqA-1
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id AFB8F20B490F;
	Wed, 12 Aug 2020 12:31:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AFB8F20B490F
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, gmazyland@gmail.com
Date: Wed, 12 Aug 2020 12:31:02 -0700
Message-Id: <20200812193102.18636-4-tusharsu@linux.microsoft.com>
In-Reply-To: <20200812193102.18636-1-tusharsu@linux.microsoft.com>
References: <20200812193102.18636-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: [dm-devel] [PATCH 3/3] IMA: define IMA hook to measure critical
	data from kernel components
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, IMA does not provide a generic function to kernel components
to measure their data. A generic function provided by IMA would
enable various parts of the kernel with easier and faster on-boarding to
use IMA infrastructure, would avoid code duplication, and consistent
usage of IMA policy CRITICAL_DATA+data_sources across the kernel.

Define a generic IMA function ima_measure_critical_data() to measure
data from various kernel components. Limit the measurement to the
components that are specified in the IMA policy - 
CRITICAL_DATA+data_sources.
Update process_buffer_measurement() to return the status code of the
operation.

Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
---
 include/linux/ima.h               |  9 ++++++++
 security/integrity/ima/ima.h      |  8 +++----
 security/integrity/ima/ima_main.c | 37 ++++++++++++++++++++++++-------
 3 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/include/linux/ima.h b/include/linux/ima.h
index d15100de6cdd..865332ecedcb 100644
--- a/include/linux/ima.h
+++ b/include/linux/ima.h
@@ -26,6 +26,9 @@ extern int ima_post_read_file(struct file *file, void *buf, loff_t size,
 extern void ima_post_path_mknod(struct dentry *dentry);
 extern int ima_file_hash(struct file *file, char *buf, size_t buf_size);
 extern void ima_kexec_cmdline(int kernel_fd, const void *buf, int size);
+extern int ima_measure_critical_data(const char *event_name,
+				     const char *event_data_source,
+				     const void *buf, int buf_len);
 
 #ifdef CONFIG_IMA_KEXEC
 extern void ima_add_kexec_buffer(struct kimage *image);
@@ -104,6 +107,12 @@ static inline int ima_file_hash(struct file *file, char *buf, size_t buf_size)
 }
 
 static inline void ima_kexec_cmdline(int kernel_fd, const void *buf, int size) {}
+static inline int ima_measure_critical_data(const char *event_name,
+					    const char *event_data_source,
+					    const void *buf, int buf_len)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_IMA */
 
 #ifndef CONFIG_IMA_KEXEC
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 99773dfa2541..e65ab067e700 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -266,10 +266,10 @@ void ima_store_measurement(struct integrity_iint_cache *iint, struct file *file,
 			   struct evm_ima_xattr_data *xattr_value,
 			   int xattr_len, const struct modsig *modsig, int pcr,
 			   struct ima_template_desc *template_desc);
-void process_buffer_measurement(struct inode *inode, const void *buf,
-				int buf_len, const char *eventname,
-				enum ima_hooks func, int pcr,
-				const char *func_data);
+int process_buffer_measurement(struct inode *inode, const void *buf,
+			       int buf_len, const char *eventname,
+			       enum ima_hooks func, int pcr,
+			       const char *func_data);
 void ima_audit_measurement(struct integrity_iint_cache *iint,
 			   const unsigned char *filename);
 int ima_alloc_init_template(struct ima_event_data *event_data,
diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index a8740b7ea417..129bcaaf13e2 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -736,10 +736,11 @@ int ima_load_data(enum kernel_load_data_id id)
  *
  * Based on policy, the buffer is measured into the ima log.
  */
-void process_buffer_measurement(struct inode *inode, const void *buf,
-				int buf_len, const char *eventname,
-				enum ima_hooks func, int pcr,
-				const char *func_data)
+
+int process_buffer_measurement(struct inode *inode, const void *buf,
+			       int buf_len, const char *eventname,
+			       enum ima_hooks func, int pcr,
+			       const char *func_data)
 {
 	int ret = 0;
 	const char *audit_cause = "ENOMEM";
@@ -759,7 +760,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf,
 	u32 secid;
 
 	if (!ima_policy_flag)
-		return;
+		return 0;
 
 	/*
 	 * Both LSM hooks and auxilary based buffer measurements are
@@ -773,7 +774,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf,
 		action = ima_get_action(inode, current_cred(), secid, 0, func,
 					&pcr, &template, func_data);
 		if (!(action & IMA_MEASURE))
-			return;
+			return 0;
 	}
 
 	if (!pcr)
@@ -788,7 +789,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf,
 			pr_err("template %s init failed, result: %d\n",
 			       (strlen(template->name) ?
 				template->name : template->fmt), ret);
-			return;
+			return ret;
 		}
 	}
 
@@ -820,7 +821,7 @@ void process_buffer_measurement(struct inode *inode, const void *buf,
 					func_measure_str(func),
 					audit_cause, ret, 0, ret);
 
-	return;
+	return ret;
 }
 
 /**
@@ -847,6 +848,26 @@ void ima_kexec_cmdline(int kernel_fd, const void *buf, int size)
 	fdput(f);
 }
 
+/**
+ * ima_measure_critical_data - measure critical data
+ * @event_name: name for the given data
+ * @event_data_source: name of the event data source
+ * @buf: pointer to buffer containing data to measure
+ * @size: Number of bytes in buf
+ *
+ * Buffers can only be measured, not appraised.
+ */
+int ima_measure_critical_data(const char *event_name,
+			      const char *event_data_source,
+			      const void *buf, int buf_len)
+{
+	if (!event_name || !event_data_source || !buf || !buf_len)
+		return -EINVAL;
+
+	return process_buffer_measurement(NULL, buf, buf_len, event_name,
+					  CRITICAL_DATA, 0, event_data_source);
+}
+
 static int __init init_ima(void)
 {
 	int error;
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

