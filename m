Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB84A7460E6
	for <lists+dm-devel@lfdr.de>; Mon,  3 Jul 2023 18:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688402457;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DZWPc13xxdmnPfGbBxq3RJ3+3owFGm/KKmZeuf3s7d0=;
	b=G24Q2d3ZYHmCP3g4mhBAhZlMqB1+NnveYQp21nzP/pPMZiid2oVDXER/l7OPVVXk+JRf0Q
	uQWR1Rvacq39n4VHDd1Xo+dkwFgCP3bsoT69ivhUusAPrDbozTQs4G5LM02gN5lNlwrRTj
	p7Q8sT8yFsn5mB6/eAiCaILqBW6+cZM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-m5kbWAphPJKVXReJJ6zNvA-1; Mon, 03 Jul 2023 12:40:55 -0400
X-MC-Unique: m5kbWAphPJKVXReJJ6zNvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE80685A58A;
	Mon,  3 Jul 2023 16:40:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 217BC1121318;
	Mon,  3 Jul 2023 16:40:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1FCA119465B1;
	Mon,  3 Jul 2023 16:40:36 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 37D941946586
 for <dm-devel@listman.corp.redhat.com>; Mon,  3 Jul 2023 16:40:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C4EBB2166B37; Mon,  3 Jul 2023 16:40:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDCAD2166B34
 for <dm-devel@redhat.com>; Mon,  3 Jul 2023 16:40:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0F651C0E0C0
 for <dm-devel@redhat.com>; Mon,  3 Jul 2023 16:40:33 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-oJVvrUzfOAW5FOx8aHbBYg-1; Mon,
 03 Jul 2023 12:40:30 -0400
X-MC-Unique: oJVvrUzfOAW5FOx8aHbBYg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 207AB1FF5C;
 Mon,  3 Jul 2023 16:40:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2DCE13276;
 Mon,  3 Jul 2023 16:40:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id siSHNfz5omQbBwAAMHmgww
 (envelope-from <mwilck@suse.com>); Mon, 03 Jul 2023 16:40:28 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon,  3 Jul 2023 18:40:21 +0200
Message-ID: <20230703164021.24843-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [PATCH v2] libmultipath: ignore nvme devices if nvme
 native multipath is enabled
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
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If the nvme native multipath driver is enabled, blacklist nvme devices
for dm-multipath by default. This is particularly useful with
"find_multipaths greedy".

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/blacklist.c | 35 ++++++++++++++++++++++++++++++++---
 tests/Makefile           |  1 -
 tests/blacklist.c        | 13 +++++++++++--
 3 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index 8d15d2e..75100b2 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -2,6 +2,8 @@
  * Copyright (c) 2004, 2005 Christophe Varoqui
  */
 #include <stdio.h>
+#include <unistd.h>
+#include <fcntl.h>
 #include <libudev.h>
 
 #include "checkers.h"
@@ -191,6 +193,27 @@ find_blacklist_device (const struct _vector *blist, const char *vendor,
 	return 0;
 }
 
+/*
+ * Test if nvme native multipath is enabled. If the sysfs file can't
+ * be accessed, multipath is either disabled at compile time, or no
+ * nvme driver is loaded at all. Thus treat errors as "no".
+ */
+static bool nvme_multipath_enabled(void)
+{
+	static const char fn[] = "/sys/module/nvme_core/parameters/multipath";
+	int fd, len;
+	char buf[2];
+
+	fd = open(fn, O_RDONLY);
+	if (fd == -1)
+		return false;
+
+	len = read(fd, buf, sizeof(buf));
+	close(fd);
+
+	return (len >= 1 && buf[0] == 'Y');
+}
+
 int
 setup_default_blist (struct config * conf)
 {
@@ -198,9 +221,15 @@ setup_default_blist (struct config * conf)
 	struct hwentry *hwe;
 	int i;
 
-	if (store_ble(conf->blist_devnode, "!^(sd[a-z]|dasd[a-z]|nvme[0-9])", ORIGIN_DEFAULT))
-		return 1;
-
+	if (nvme_multipath_enabled()) {
+		if (store_ble(conf->blist_devnode, "!^(sd[a-z]|dasd[a-z])",
+			      ORIGIN_DEFAULT))
+			return 1;
+	} else {
+		if (store_ble(conf->blist_devnode, "!^(sd[a-z]|dasd[a-z]|nvme[0-9])",
+			      ORIGIN_DEFAULT))
+			return 1;
+	}
 	if (store_ble(conf->elist_property, "(SCSI_IDENT_|ID_WWN)", ORIGIN_DEFAULT))
 		return 1;
 
diff --git a/tests/Makefile b/tests/Makefile
index 83edc2f..c777d07 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -48,7 +48,6 @@ hwtable-test_OBJDEPS := $(multipathdir)/discovery.o $(multipathdir)/blacklist.o
 	$(multipathdir)/structs.o $(multipathdir)/propsel.o
 hwtable-test_LIBDEPS := -ludev -lpthread -ldl
 blacklist-test_TESTDEPS := test-log.o
-blacklist-test_OBJDEPS := $(multipathdir)/blacklist.o
 blacklist-test_LIBDEPS := -ludev
 vpd-test_OBJDEPS :=  $(multipathdir)/discovery.o
 vpd-test_LIBDEPS := -ludev -lpthread -ldl
diff --git a/tests/blacklist.c b/tests/blacklist.c
index 882aa3a..ba8dfd0 100644
--- a/tests/blacklist.c
+++ b/tests/blacklist.c
@@ -24,6 +24,8 @@
 #include "test-log.h"
 #include "debug.h"
 
+#include "../libmultipath/blacklist.c"
+
 struct udev_device {
 	const char *sysname;
 	char *property_list[];
@@ -224,8 +226,15 @@ static void test_devnode_default(void **state)
 {
 	assert_int_equal(filter_devnode(blist_devnode_default, NULL, "sdaa"),
 			 MATCH_NOTHING);
-	assert_int_equal(filter_devnode(blist_devnode_default, NULL, "nvme0n1"),
-			 MATCH_NOTHING);
+	if (nvme_multipath_enabled()) {
+		expect_condlog(3, "nvme0n1: device node name blacklisted\n");
+		assert_int_equal(filter_devnode(blist_devnode_default, NULL,
+						"nvme0n1"),
+				 MATCH_DEVNODE_BLIST);
+	} else
+		assert_int_equal(filter_devnode(blist_devnode_default, NULL,
+						"nvme0n1"),
+				 MATCH_NOTHING);
 	assert_int_equal(filter_devnode(blist_devnode_default, NULL, "dasda"),
 			 MATCH_NOTHING);
 	expect_condlog(3, "hda: device node name blacklisted\n");
-- 
2.41.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

