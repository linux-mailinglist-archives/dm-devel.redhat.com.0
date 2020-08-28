Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CFC002574CD
	for <lists+dm-devel@lfdr.de>; Mon, 31 Aug 2020 09:57:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-fL2ntxNvPpiN2jHhL6VMPw-1; Mon, 31 Aug 2020 03:57:22 -0400
X-MC-Unique: fL2ntxNvPpiN2jHhL6VMPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25CC418A2252;
	Mon, 31 Aug 2020 07:57:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64DE35C22B;
	Mon, 31 Aug 2020 07:57:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF5287A31B;
	Mon, 31 Aug 2020 07:57:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07SKRIss008890 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Aug 2020 16:27:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DFAD2024508; Fri, 28 Aug 2020 20:27:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69643200A7DC
	for <dm-devel@redhat.com>; Fri, 28 Aug 2020 20:27:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17C6A102F1E0
	for <dm-devel@redhat.com>; Fri, 28 Aug 2020 20:27:16 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-459-0aw4zTLeMpi8kIRsBmBMLQ-1;
	Fri, 28 Aug 2020 16:27:13 -0400
X-MC-Unique: 0aw4zTLeMpi8kIRsBmBMLQ-1
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 65DB32056D2B;
	Fri, 28 Aug 2020 13:27:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 65DB32056D2B
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
Date: Fri, 28 Aug 2020 13:27:00 -0700
Message-Id: <20200828202700.23086-3-tusharsu@linux.microsoft.com>
In-Reply-To: <20200828202700.23086-1-tusharsu@linux.microsoft.com>
References: <20200828202700.23086-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 31 Aug 2020 03:56:57 -0400
Cc: sashal@kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, dm-devel@redhat.com,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: [dm-devel] [PATCH v3 2/2] dm-crypt: collect data and submit to DM
	to measure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, dm-crypt does not take advantage of IMA measuring
capabilities, and ultimately the benefits of remote attestation.

Measure various dm-crypt constructs by calling various device-mapper
functions - dm_ima_*() that use IMA measuring capabilities. Implement
ima_measure_dm_crypt_data() to measure various dm-crypt constructs.

Ensure that ima_measure_dm_crypt_data() is non intrusive, i.e. failures
in this function and the call-stack below should not affect the core
functionality of dm-crypt.

Register dm-crypt as supported data source for IMA measurement in ima.h.

A demonstrative usage of above functionality on a system:

If the IMA policy contains the following rule:

    measure func=CRITICAL_DATA critical_kernel_data_sources=dm-crypt template=ima-buf

and, the following commands are used to setup a crypt target:

 #key="faf453b4ee938cff2f0d2c869a0b743f59125c0a37f5bcd8f1dbbd911a78abaa"
 #arg="'0 1953125 crypt aes-xts-plain64 "
 #arg="$arg $key 0 "
 #arg="$arg /dev/loop0 0 1 allow_discards'"
 #tgt_name="test-crypt"
 #cmd="dmsetup create $tgt_name --table $arg"
 #eval $cmd

then, the IMA log at
/sys/kernel/security/integrity/ima/ascii_runtime_measurements should
contain the dm-crypt measurements. And, the following IMA log entry
should be added in the IMA log,

 ima-buf sha1:039d8ff71918608d585adca3e5aab2e3f41f84d6 
 1598637500:520585536:dm-crypt:add_target 
 74695f6e756d5f646973636172645f62696f733d313b7065725f62696f5f646
 174615f73697a653d3834383b646d7265715f73746172743d3136383b74666d
 735f636f756e743d313b6f6e5f6469736b5f7461675f73697a653d303b696e7
 46567726974795f69765f73697a653d303b696e746567726974795f7461675f
 73697a653d303b69765f73697a653d31363b69765f6f66667365743d303b736
 563746f725f73686966743d303b736563746f725f73697a653d3531323b666c
 6167733d323b6369706865725f666c6167733d303b73746172743d303b6b657
 95f6d61635f73697a653d303b6b65795f65787472615f73697a653d303b6b65
 795f70617274733d313b6b65795f73697a653d33323b6369706865725f73747
 2696e673d6165732d7874732d706c61696e36343b6465766963655f6e616d65
 3d3235333a303b

where, the ascii representation of the above data is:

 ti_num_discard_bios=1;per_bio_data_size=848;dmreq_start=168;
 tfms_count=1;on_disk_tag_size=0;integrity_iv_size=0;
 integrity_tag_size=0;iv_size=16;iv_offset=0;sector_shift=0;
 sector_size=512;flags=2;cipher_flags=0;start=0;key_mac_size=0;
 key_extra_size=0;key_parts=1;key_size=32;
 cipher_string=aes-xts-plain64;device_name=253:0;

Some of the above values can be verified using:

 #dmsetup table --showkeys

where, the output of the command should be similar to:

 test-crypt: 0 1953125 crypt aes-xts-plain64
 faf453b4ee938cff2f0d2c869a0b743f59125c0a37f5bcd8f1dbbd911a78abaa
 0 7:0 0 1 allow_discards

Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
---
 drivers/md/dm-crypt.c          | 171 +++++++++++++++++++++++++++++++++
 security/integrity/ima/Kconfig |   3 +-
 security/integrity/ima/ima.h   |   1 +
 3 files changed, 173 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 148960721254..47fb2ce15211 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2529,6 +2529,8 @@ static void crypt_dtr(struct dm_target *ti)
 
 	ti->private = NULL;
 
+	dm_ima_exit_measurements(ti->type);
+
 	if (!cc)
 		return;
 
@@ -2991,6 +2993,167 @@ static int crypt_report_zones(struct dm_target *ti,
 
 #endif
 
+#ifdef CONFIG_IMA
+/*
+ * append integer values to dm-crypt specific data
+ * to be measured through IMA
+ */
+static int ima_append_num_values(struct dm_target *ti,
+				 const char *key,
+				 long long num_val)
+{
+	char *num_str = NULL;
+	int length = 0;
+	int r = 0;
+
+	if (!ti || !key) {
+		r = -EINVAL;
+		goto error;
+	}
+
+	length = snprintf(NULL, 0, "%lld", num_val);
+	num_str = kzalloc(length + 1, GFP_KERNEL);
+	if (!num_str) {
+		r = -ENOMEM;
+		goto error;
+	}
+	snprintf(num_str, length + 1, "%lld", num_val);
+	dm_ima_append_measurement_list(ti->type,
+				       key,
+				       (const void *)num_str,
+				       length);
+	kzfree(num_str);
+	return r;
+error:
+	DMERR("appending num values to IMA measurement list failed %d", r);
+	return r;
+}
+/*
+ * Measure dm-crypt specific data through IMA.
+ * It appends all the needed data to the list as a key-val pair using
+ * dm_ima_append_measurement_list() and internal ima_append_num_values(),
+ * and finally measures the list using dm_ima_finalize_and_measure().
+ */
+static void ima_measure_dm_crypt_data(struct dm_target *ti, const char *desc)
+{
+	int r = 0;
+	struct crypt_config *cc = NULL;
+	const char *devname = dm_table_device_name(ti->table);
+
+	if (!ti) {
+		r = -EINVAL;
+		goto out;
+	}
+
+	cc = ti->private;
+
+	if (devname) {
+		dm_ima_append_measurement_list(ti->type,
+					       "device_name",
+					       (const void *)devname,
+					       strlen(devname));
+	}
+
+	if (cc->cipher_string) {
+		dm_ima_append_measurement_list(ti->type,
+					       "cipher_string",
+					       (const void *)cc->cipher_string,
+					       strlen(cc->cipher_string));
+	}
+
+	if (cc->cipher_auth) {
+		dm_ima_append_measurement_list(ti->type,
+					       "cipher_auth",
+					       (const void *)cc->cipher_auth,
+					       strlen(cc->cipher_auth));
+	}
+
+	r = ima_append_num_values(ti, "key_size", cc->key_size);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "key_parts", cc->key_parts);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "key_extra_size", cc->key_extra_size);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "key_mac_size", cc->key_mac_size);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "start", cc->start);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "cipher_flags", cc->cipher_flags);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "flags", cc->flags);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "sector_size", cc->sector_size);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "sector_shift", cc->sector_shift);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "iv_offset", cc->iv_offset);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "iv_size", cc->iv_size);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "integrity_tag_size", cc->integrity_tag_size);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "integrity_iv_size", cc->integrity_iv_size);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "on_disk_tag_size", cc->on_disk_tag_size);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "tfms_count", cc->tfms_count);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "dmreq_start", cc->dmreq_start);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "per_bio_data_size", cc->per_bio_data_size);
+	if (r)
+		goto out;
+
+	r = ima_append_num_values(ti, "ti_num_discard_bios",
+			      ti->num_discard_bios);
+	if (r)
+		goto out;
+
+	dm_ima_finalize_and_measure(ti->type, desc, false);
+	return;
+
+out:
+	DMERR("IMA measurement of dm-crypt data failed %d", r);
+
+}
+#else
+static inline void ima_measure_dm_crypt_data(struct dm_target *ti,
+					     const char *desc) {}
+#endif /* CONFIG_IMA */
+
+
 /*
  * Construct an encryption mapping:
  * <cipher> [<key>|:<key_size>:<user|logon>:<key_description>] <iv_offset> <dev_path> <start>
@@ -3186,6 +3349,10 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	ti->num_flush_bios = 1;
 
+	dm_ima_init_measurements(ti->type);
+
+	ima_measure_dm_crypt_data(ti, "add_target");
+
 	return 0;
 
 bad:
@@ -3324,6 +3491,8 @@ static void crypt_postsuspend(struct dm_target *ti)
 	struct crypt_config *cc = ti->private;
 
 	set_bit(DM_CRYPT_SUSPENDED, &cc->flags);
+
+	ima_measure_dm_crypt_data(ti, "post_suspend");
 }
 
 static int crypt_preresume(struct dm_target *ti)
@@ -3343,6 +3512,8 @@ static void crypt_resume(struct dm_target *ti)
 	struct crypt_config *cc = ti->private;
 
 	clear_bit(DM_CRYPT_SUSPENDED, &cc->flags);
+
+	ima_measure_dm_crypt_data(ti, "resume");
 }
 
 /* Message interface
diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index 953314d145bb..ad643cc5aad4 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -324,8 +324,7 @@ config IMA_MEASURE_ASYMMETRIC_KEYS
 
 config IMA_QUEUE_EARLY_BOOT_DATA
 	bool
-	depends on IMA_MEASURE_ASYMMETRIC_KEYS
-	depends on SYSTEM_TRUSTED_KEYRING
+        depends on (IMA_MEASURE_ASYMMETRIC_KEYS && SYSTEM_TRUSTED_KEYRING) || DM_CRYPT
 	default y
 
 config IMA_SECURE_AND_OR_TRUSTED_BOOT
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 422fe833037d..bc922aa2ff92 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -230,6 +230,7 @@ struct modsig;
 
 #define __ima_supported_kernel_data_sources(source)	\
 	source(MIN_SOURCE, min_source)			\
+	source(DM_CRYPT, dm-crypt)			\
 	source(MAX_SOURCE, max_source)
 
 #define __ima_enum_stringify(ENUM, str) (#str),
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

