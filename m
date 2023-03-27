Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1746CA5B8
	for <lists+dm-devel@lfdr.de>; Mon, 27 Mar 2023 15:25:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679923530;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wjIP2DNnWm283FR6/IOKURWAhipH9QnnWFS03ooooEY=;
	b=MNg88BFnJ7IrLmvz7+Rjc9aeWM9nzaNx5wilIGWyAKwvqGhqPy4heP9U3PtGZnEB4AGcFD
	N18ESe3V8Awm2CLzrXHQQ2WwM6PJlLznSQ2/i//rumpHlxk63zCBtGwEPMq7sQHK1b7oiP
	q5jURwA+rtxzZN+gOPQXWfkqEApEdXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-w3RlAuJ6O26jnlmHL64rnw-1; Mon, 27 Mar 2023 09:25:29 -0400
X-MC-Unique: w3RlAuJ6O26jnlmHL64rnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0A518019DF;
	Mon, 27 Mar 2023 13:25:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD3A41121330;
	Mon, 27 Mar 2023 13:25:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 37B8019465B8;
	Mon, 27 Mar 2023 13:25:19 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BE42E194658F
 for <dm-devel@listman.corp.redhat.com>; Mon, 27 Mar 2023 13:25:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A06C5C15BBA; Mon, 27 Mar 2023 13:25:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9876EC15BB8
 for <dm-devel@redhat.com>; Mon, 27 Mar 2023 13:25:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E9A4858F09
 for <dm-devel@redhat.com>; Mon, 27 Mar 2023 13:25:18 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-ivgbzeQOPIGVzPC9zfgB1w-1; Mon,
 27 Mar 2023 09:25:15 -0400
X-MC-Unique: ivgbzeQOPIGVzPC9zfgB1w-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B7FFE21F4A;
 Mon, 27 Mar 2023 13:25:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6869513329;
 Mon, 27 Mar 2023 13:25:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CNDYFzqZIWTobgAAMHmgww
 (envelope-from <mwilck@suse.com>); Mon, 27 Mar 2023 13:25:14 +0000
From: mwilck@suse.com
To: Douglas Gilbert <dgilbert@interlog.com>,
	Hannes Reinecke <hare@suse.de>
Date: Mon, 27 Mar 2023 15:24:59 +0200
Message-Id: <20230327132459.29531-4-mwilck@suse.com>
In-Reply-To: <20230327132459.29531-1-mwilck@suse.com>
References: <20230327132459.29531-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH 3/3] udev: add 00-scsi-sg3_config.rules for user
 configuration
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
Cc: James Bottomley <jejb@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, Franck Bui <fbui@suse.de>,
 dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Add a dedicated early rules file to simplify configuring the behavior
of the SCSI udev rules shipped with sg3_utils.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile.am                       |  1 +
 scripts/00-scsi-sg3_config.rules  | 23 +++++++++++++++++++++++
 scripts/55-scsi-sg3_id.rules      |  6 ++----
 scripts/58-scsi-sg3_symlink.rules |  6 +-----
 4 files changed, 27 insertions(+), 9 deletions(-)
 create mode 100644 scripts/00-scsi-sg3_config.rules

diff --git a/Makefile.am b/Makefile.am
index 240acbe..ce7ee71 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -123,6 +123,7 @@ EXTRA_DIST += \
 	inhex/z_act_query.hex
 
 EXTRA_DIST += \
+	scripts/00-scsi-sg3_config.rules \
 	scripts/40-usb-blacklist.rules \
 	scripts/54-before-scsi-sg3_id.rules \
 	scripts/55-scsi-sg3_id.rules \
diff --git a/scripts/00-scsi-sg3_config.rules b/scripts/00-scsi-sg3_config.rules
new file mode 100644
index 0000000..43d6f16
--- /dev/null
+++ b/scripts/00-scsi-sg3_config.rules
@@ -0,0 +1,23 @@
+# Configuration for SCSI device identification
+
+# To apply changes, copy this file to /etc/udev/rules.d and edit to suit your needs.
+# DO NOT EDIT THIS FILE IN PLACE!
+
+ACTION!="add|change", GOTO="scsi_identify_end"
+SUBSYSTEMS=="scsi", GOTO="scsi_identify"
+GOTO="scsi_identify_end"
+LABEL="scsi_identify"
+
+# Set ID_SCSI_INQUIRY to 0 to force running "sg_inq" for obtaining device IDs
+# from SCSI VPDs, rather than looking them up in sysfs (not recommended).
+ENV{ID_SCSI_INQUIRY}=""
+
+# Set enabled unreliable sources for setting the ID_SERIAL property.
+# See 55-scsi-sg3_id.rules for detailed documentation.
+ENV{.SCSI_ID_SERIAL_SRC}="T"
+
+# Set enabled unreliable sources for creating additional /dev/disk/by-id/scsi* symlinks.
+# See 58-scsi-sg3_symlink.rules for detailed documentation.
+ENV{.SCSI_SYMLINK_SRC}=""
+
+LABEL="scsi_identify_end"
diff --git a/scripts/55-scsi-sg3_id.rules b/scripts/55-scsi-sg3_id.rules
index 33b2ad3..5e9732d 100644
--- a/scripts/55-scsi-sg3_id.rules
+++ b/scripts/55-scsi-sg3_id.rules
@@ -36,7 +36,7 @@ KERNEL!="sd*[!0-9]|sr*", GOTO="sg3_utils_id_end"
 # have scanned for VPD pages, so if the vpd page attribute is not
 # present it is not supported (or deemed unsafe to access).
 # Hence we can skip the call to sg_inq and avoid I/O altogether.
-# Set 'ID_SCSI_INQUIRY=0' in an earlier udev rule if the kernel
+# Set ENV{ID_SCSI_INQUIRY}="0" in 00-scsi-sg3_config.rules if the kernel
 # fails to scan VPD pages correctly; the rules will then fall
 # back to calling sg_vpd directly.
 LABEL="scsi_inquiry"
@@ -119,9 +119,7 @@ ENV{ID_SCSI_SERIAL}!="?*", ENV{SCSI_IDENT_SERIAL}=="?*", ENV{ID_SCSI_SERIAL}="$e
 # Be aware that multipath actually needs unique identifiers, though.
 # Using ambiguous identifiers for ID_SERIAL can cause data corruption with multipath.
 #
-# To configure this, add an early rule (e.g. /etc/udev/rules.d/00-scsi-serial.rules) e.g. like this:
-# ACTION!="remove", KERNEL=="sd*|sr*|st*|nst*|cciss*", ENV{.SCSI_ID_SERIAL_SRC}="TLVS"
-#
+# To configure the behavior, set ENV{.SCSI_ID_SERIAL_SRC} in 00-scsi-sg3_config.rules.
 # By default, only T10 vendor ID is allowed.
 ENV{.SCSI_ID_SERIAL_SRC}!="?*", ENV{.SCSI_ID_SERIAL_SRC}="T"
 
diff --git a/scripts/58-scsi-sg3_symlink.rules b/scripts/58-scsi-sg3_symlink.rules
index 99fdc23..dfe8f77 100644
--- a/scripts/58-scsi-sg3_symlink.rules
+++ b/scripts/58-scsi-sg3_symlink.rules
@@ -23,12 +23,8 @@ ENV{UDEV_DISABLE_PERSISTENT_STORAGE_RULES_FLAG}=="1", GOTO="sg3_utils_symlink_en
 # This only needs to be changed if some subsystem, like dm-crypt or LVM, depends on the
 # additional symlinks being present for device identification.
 #
-# To configure the behavior, add an early rule (e.g. /etc/udev/rules.d/00-scsi-serial.rules)
-# like this:
-# ACTION!="remove", KERNEL=="sd*|sr*|st*|nst*|cciss*", ENV{.SCSI_SYMLINK_SRC}="TS"
-#
+# To configure the behavior, set ENV{.SCSI_SYMLINK_SRC} in 00-scsi-sg3_config.rules.
 # By default, no possibly ambiguous additional symlinks will be created.
-ENV{.SCSI_SYMLINK_SRC}!="?*", ENV{.SCSI_SYMLINK_SRC}=""
 
 # 0: vpd page 0x80 identifier
 ENV{.SCSI_SYMLINK_SRC}=="*S*", ENV{SCSI_IDENT_SERIAL}=="?*", ENV{DEVTYPE}=="disk", \
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

