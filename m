Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 071FE276C03
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 10:33:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-_JXS7p4VP6Kreb92yp2ucg-1; Thu, 24 Sep 2020 04:33:17 -0400
X-MC-Unique: _JXS7p4VP6Kreb92yp2ucg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39D6481CAFB;
	Thu, 24 Sep 2020 08:33:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13F94100238E;
	Thu, 24 Sep 2020 08:33:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D81B181A271;
	Thu, 24 Sep 2020 08:33:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NJKPu8024845 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 15:20:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DC092B4D37; Wed, 23 Sep 2020 19:20:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07B2BCF624
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 19:20:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A042E811E80
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 19:20:24 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-508-Ccgdx1EzMVutxRwMAGgGng-1;
	Wed, 23 Sep 2020 15:20:22 -0400
X-MC-Unique: Ccgdx1EzMVutxRwMAGgGng-1
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id C73252089E58;
	Wed, 23 Sep 2020 12:20:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C73252089E58
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
Date: Wed, 23 Sep 2020 12:20:09 -0700
Message-Id: <20200923192011.5293-5-tusharsu@linux.microsoft.com>
In-Reply-To: <20200923192011.5293-1-tusharsu@linux.microsoft.com>
References: <20200923192011.5293-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 24 Sep 2020 04:31:06 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: [dm-devel] [PATCH v4 4/6] IMA: add policy to measure critical data
	from kernel components
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There would be several candidate kernel components suitable for IMA
measurement. Not all of them would have support for IMA measurement.
Also, system administrators may not want to measure data for all of
them, even when they support IMA measurement. An IMA policy option 
specific to various kernel components is needed to measure their
respective critical data.

This policy option needs to be constrained to measure data for
specific kernel components that are specified as input values to the
policy option.

Add a new IMA policy option - "data_sources:=" to allow measuring
various critical kernel components. This policy option would enable the
system administrators to limit the measurement to the components
listed in "data_sources:=", if the components support IMA measurement.

The new policy option "data_sources:=" is different from the existing
policy option "keyrings:=". 

In case of "keyrings:=", a policy may measure all keyrings (when
"keyrings:=" option is not provided for func KEY_CHECK), or may
constrain which keyrings need to be measured (when "keyrings:=" option
is provided for func KEY_CHECK).

But unlike "keyrings:=", the entries in "data_sources:=" would have
different data format. Further, the components listed in
"data_sources:=" need to be modified to call IMA to measure their
data. Therefore, unlike "keyrings:=", IMA shouldn't measure all of the
components by default, when "data_sources:=" is not specified. Because
measuring non-vetted components just by specifying them as a policy
option value may impact the overall reliability of the system.

To address this, "data_sources:=" should be a mandatory policy option
for func=CRITICAL_DATA. This func is introduced in the 5th patch in this
series). And the compile-time vetting functionality described above is
introduced in the 6th patch in this series.

Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
---
 Documentation/ABI/testing/ima_policy |  3 +++
 security/integrity/ima/ima_policy.c  | 29 +++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/ima_policy b/Documentation/ABI/testing/ima_policy
index cd572912c593..a81cf79fb255 100644
--- a/Documentation/ABI/testing/ima_policy
+++ b/Documentation/ABI/testing/ima_policy
@@ -48,6 +48,9 @@ Description:
 			template:= name of a defined IMA template type
 			(eg, ima-ng). Only valid when action is "measure".
 			pcr:= decimal value
+			data_sources:= list of kernel components
+			(eg, selinux|apparmor|dm-crypt) that contain data critical
+			to the security of the kernel.
 
 		default policy:
 			# PROC_SUPER_MAGIC
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index 8866e84d0062..89452245f54a 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -33,6 +33,7 @@
 #define IMA_PCR		0x0100
 #define IMA_FSNAME	0x0200
 #define IMA_KEYRINGS	0x0400
+#define IMA_DATA_SOURCES	0x0800
 
 #define UNKNOWN		0
 #define MEASURE		0x0001	/* same as IMA_MEASURE */
@@ -84,6 +85,7 @@ struct ima_rule_entry {
 	} lsm[MAX_LSM_RULES];
 	char *fsname;
 	struct ima_rule_opt_list *keyrings; /* Measure keys added to these keyrings */
+	struct ima_rule_opt_list *data_sources; /* Measure data from these sources */
 	struct ima_template_desc *template;
 };
 
@@ -911,7 +913,7 @@ enum {
 	Opt_uid_lt, Opt_euid_lt, Opt_fowner_lt,
 	Opt_appraise_type, Opt_appraise_flag,
 	Opt_permit_directio, Opt_pcr, Opt_template, Opt_keyrings,
-	Opt_err
+	Opt_data_sources, Opt_err
 };
 
 static const match_table_t policy_tokens = {
@@ -948,6 +950,7 @@ static const match_table_t policy_tokens = {
 	{Opt_pcr, "pcr=%s"},
 	{Opt_template, "template=%s"},
 	{Opt_keyrings, "keyrings=%s"},
+	{Opt_data_sources, "data_sources=%s"},
 	{Opt_err, NULL}
 };
 
@@ -1312,6 +1315,24 @@ static int ima_parse_rule(char *rule, struct ima_rule_entry *entry)
 
 			entry->flags |= IMA_KEYRINGS;
 			break;
+		case Opt_data_sources:
+			ima_log_string(ab, "data_sources",
+				       args[0].from);
+
+			if (entry->data_sources) {
+				result = -EINVAL;
+				break;
+			}
+
+			entry->data_sources = ima_alloc_rule_opt_list(args);
+			if (IS_ERR(entry->data_sources)) {
+				result = PTR_ERR(entry->data_sources);
+				entry->data_sources = NULL;
+				break;
+			}
+
+			entry->flags |= IMA_DATA_SOURCES;
+			break;
 		case Opt_fsuuid:
 			ima_log_string(ab, "fsuuid", args[0].from);
 
@@ -1692,6 +1713,12 @@ int ima_policy_show(struct seq_file *m, void *v)
 		seq_puts(m, " ");
 	}
 
+	if (entry->flags & IMA_DATA_SOURCES) {
+		seq_puts(m, "data_sources=");
+		ima_show_rule_opt_list(m, entry->data_sources);
+		seq_puts(m, " ");
+	}
+
 	if (entry->flags & IMA_PCR) {
 		snprintf(tbuf, sizeof(tbuf), "%d", entry->pcr);
 		seq_printf(m, pt(Opt_pcr), tbuf);
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

