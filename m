Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B48F952EE20
	for <lists+dm-devel@lfdr.de>; Fri, 20 May 2022 16:26:39 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-9FnPbgDRNee84Ctl8XN3VA-1; Fri, 20 May 2022 10:26:37 -0400
X-MC-Unique: 9FnPbgDRNee84Ctl8XN3VA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A13071C0CE6C;
	Fri, 20 May 2022 14:26:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEDBF1410DD5;
	Fri, 20 May 2022 14:26:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6BEED194704C;
	Fri, 20 May 2022 14:26:29 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 12B95194704C
 for <dm-devel@listman.corp.redhat.com>; Fri, 20 May 2022 14:26:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D1C3A492CA3; Fri, 20 May 2022 14:26:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDF09492CA2
 for <dm-devel@redhat.com>; Fri, 20 May 2022 14:26:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD1FC811E75
 for <dm-devel@redhat.com>; Fri, 20 May 2022 14:26:27 +0000 (UTC)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-kPG50auePQ28ooJrIqPhIw-1; Fri, 20 May 2022 10:26:24 -0400
X-MC-Unique: kPG50auePQ28ooJrIqPhIw-1
X-RZG-AUTH: ":PHkGeUmrW+uCZmxs998QJRUX30nOwJd7nOD9sw/xoauycprg5uef7cgCEpy7sPc="
X-RZG-CLASS-ID: mo00
Received: from USER-PC.fritz.box by smtp.strato.de (RZmta 47.42.2 DYNA|AUTH)
 with ESMTPSA id Y03eaey4KEQEQD5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 20 May 2022 16:26:14 +0200 (CEST)
From: Thore Sommer <public@thson.de>
To: dm-devel@redhat.com, agk@redhat.com, snitzer@redhat.com,
 nramas@linux.microsoft.com
Date: Fri, 20 May 2022 16:26:03 +0200
Message-Id: <20220520142605.270625-2-public@thson.de>
In-Reply-To: <20220520142605.270625-1-public@thson.de>
References: <20220520142605.270625-1-public@thson.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH 1/3] dm ima: allow targets to remeasure their
 table entry
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
Cc: linux-integrity@vger.kernel.org, Thore Sommer <public@thson.de>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The existing device mapper IMA measurements only measure the table content
on target creation. This is fine for targets that do not change their table
during runtime, but some targets like verity use the table to display state
changes. Those changes are not visible through the existing device mapper
integration.

A new DM event "dm_target_update" is introduced for targets to remeasure
their table entry. This event is intended to be used by targets that change
their table entries to indicate potential security relevant information.
This allows for a more complete Remote Attestation of device mapper
targets.

For example a verity target is never marked as corrupted during creation,
because it only happens when a corrupted block is read. Using the new event
the table entry change will be visible in the IMA log.

In the event the dm version, device metadata and target data gets measured.

The hash of the active table is not updated because it would require to
rehash the whole table with all the other targets entries.

Signed-off-by: Thore Sommer <public@thson.de>
---
 - v1: 
    - do not initialize ima_buf with NULL
    - use return value of scnprintf for target_metadata_buf_len
	- rewrite target_index calculation to use less variables
	- remove unnecessary NULL check for ti2 

 drivers/md/dm-ima.c | 70 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/md/dm-ima.h |  2 ++
 2 files changed, 72 insertions(+)

diff --git a/drivers/md/dm-ima.c b/drivers/md/dm-ima.c
index 1842d3a958ef..bac217440853 100644
--- a/drivers/md/dm-ima.c
+++ b/drivers/md/dm-ima.c
@@ -750,3 +750,73 @@ void dm_ima_measure_on_device_rename(struct mapped_device *md)
 	kfree(new_dev_name);
 	kfree(new_dev_uuid);
 }
+
+/*
+ * Give the option for targets to remeasure on state change.
+ */
+void dm_ima_measure_on_target_update(struct dm_target *ti)
+{
+	char *ima_buf, *target_metadata_buf = NULL, *target_data_buf = NULL;
+	struct dm_target *ti2;
+	size_t target_metadata_buf_len, target_data_buf_len;
+	unsigned int num_targets, target_index;
+	struct dm_table *table = ti->table;
+	struct mapped_device *md = table->md;
+	bool noio = true;
+	int l = 0;
+
+	ima_buf = dm_ima_alloc(DM_IMA_MEASUREMENT_BUF_LEN, GFP_KERNEL, noio);
+	if (!ima_buf)
+		return;
+
+	target_metadata_buf = dm_ima_alloc(DM_IMA_TARGET_METADATA_BUF_LEN, GFP_KERNEL, noio);
+	if (!target_metadata_buf)
+		goto exit;
+
+	target_data_buf = dm_ima_alloc(DM_IMA_TARGET_DATA_BUF_LEN, GFP_KERNEL, noio);
+	if (!target_data_buf)
+		goto exit;
+
+	/*
+	 * Get the index of the target in the table.
+	 */
+	num_targets = dm_table_get_num_targets(table);
+	for (target_index = 0; target_index < num_targets; target_index++) {
+		ti2 = dm_table_get_target(table, target_index);
+		if (ti == ti2)
+			break;
+	}
+	if (target_index == num_targets)
+		goto exit;
+
+	target_metadata_buf_len = scnprintf(target_metadata_buf, DM_IMA_TARGET_METADATA_BUF_LEN,
+			  "target_index=%d,target_begin=%llu,target_len=%llu,",
+			  target_index, ti->begin, ti->len);
+
+	if (ti->type->status)
+		ti->type->status(ti, STATUSTYPE_IMA, STATUSTYPE_IMA, target_data_buf,
+					DM_IMA_TARGET_DATA_BUF_LEN);
+	else
+		target_data_buf[0] = '\0';
+	target_data_buf_len = strlen(target_data_buf);
+
+	memcpy(ima_buf + l, DM_IMA_VERSION_STR, md->ima.dm_version_str_len);
+	l += md->ima.dm_version_str_len;
+
+	memcpy(ima_buf + l, md->ima.active_table.device_metadata,
+	       md->ima.active_table.device_metadata_len);
+	l += md->ima.active_table.device_metadata_len;
+
+	memcpy(ima_buf + l, target_metadata_buf, target_metadata_buf_len);
+	l += target_metadata_buf_len;
+
+	memcpy(ima_buf + l, target_data_buf, target_data_buf_len);
+
+	dm_ima_measure_data("dm_target_update", ima_buf, strlen(ima_buf), noio);
+
+exit:
+	kfree(ima_buf);
+	kfree(target_data_buf);
+	kfree(target_metadata_buf);
+}
+EXPORT_SYMBOL_GPL(dm_ima_measure_on_target_update);
diff --git a/drivers/md/dm-ima.h b/drivers/md/dm-ima.h
index b8c3b614670b..281a8b65f8a9 100644
--- a/drivers/md/dm-ima.h
+++ b/drivers/md/dm-ima.h
@@ -63,6 +63,7 @@ void dm_ima_measure_on_device_resume(struct mapped_device *md, bool swap);
 void dm_ima_measure_on_device_remove(struct mapped_device *md, bool remove_all);
 void dm_ima_measure_on_table_clear(struct mapped_device *md, bool new_map);
 void dm_ima_measure_on_device_rename(struct mapped_device *md);
+void dm_ima_measure_on_target_update(struct dm_target *ti);
 
 #else
 
@@ -72,6 +73,7 @@ static inline void dm_ima_measure_on_device_resume(struct mapped_device *md, boo
 static inline void dm_ima_measure_on_device_remove(struct mapped_device *md, bool remove_all) {}
 static inline void dm_ima_measure_on_table_clear(struct mapped_device *md, bool new_map) {}
 static inline void dm_ima_measure_on_device_rename(struct mapped_device *md) {}
+static inline void dm_ima_measure_on_target_update(struct dm_target *ti) {}
 
 #endif /* CONFIG_IMA */
 
-- 
2.36.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

