Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 18102219D71
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-TWqG8XJJMyah3mbKapxpjg-1; Thu, 09 Jul 2020 06:17:35 -0400
X-MC-Unique: TWqG8XJJMyah3mbKapxpjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11A791083E81;
	Thu,  9 Jul 2020 10:17:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E183A2DE66;
	Thu,  9 Jul 2020 10:17:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 863BB93F8E;
	Thu,  9 Jul 2020 10:17:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH0n6029412 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E61F25F244; Thu,  9 Jul 2020 10:16:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E184C5F24E
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B194110B9500
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-330-vaaBWhqZNSiSZc8GihU0Iw-1;
	Thu, 09 Jul 2020 06:16:55 -0400
X-MC-Unique: vaaBWhqZNSiSZc8GihU0Iw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 63F6DB071;
	Thu,  9 Jul 2020 10:16:52 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:51 +0200
Message-Id: <20200709101620.6786-7-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH0n6029412
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 06/35] multipath-tools tests: add test for
	devt2devname
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Two tests skipped because they fail, will be fixed with the following
patch.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile |   3 +-
 tests/devt.c   | 194 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 tests/devt.c

diff --git a/tests/Makefile b/tests/Makefile
index 125553b..5f00a3a 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -13,7 +13,7 @@ CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir) \
 LIBDEPS += -L$(multipathdir) -L$(mpathcmddir) -lmultipath -lmpathcmd -lcmocka
 
 TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy \
-	 alias directio valid
+	 alias directio valid devt
 
 .SILENT: $(TESTS:%=%.o)
 .PRECIOUS: $(TESTS:%=%-test)
@@ -52,6 +52,7 @@ alias-test_TESTDEPS := test-log.o
 alias-test_LIBDEPS := -lpthread -ldl
 valid-test_OBJDEPS := ../libmultipath/valid.o
 valid-test_LIBDEPS := -ludev -lpthread -ldl
+devt-test_LIBDEPS := -ludev
 ifneq ($(DIO_TEST_DEV),)
 directio-test_LIBDEPS := -laio
 endif
diff --git a/tests/devt.c b/tests/devt.c
new file mode 100644
index 0000000..4be6d75
--- /dev/null
+++ b/tests/devt.c
@@ -0,0 +1,194 @@
+/*
+ * Copyright (c) 2020 Martin Wilck, SUSE
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <stdbool.h>
+#include <stdarg.h>
+#include <stddef.h>
+#include <setjmp.h>
+#include <stdlib.h>
+#include <cmocka.h>
+#include <libudev.h>
+#include <sys/sysmacros.h>
+#include "util.h"
+#include "debug.h"
+
+#include "globals.c"
+
+static int get_one_devt(char *devt, size_t len)
+{
+	struct udev_enumerate *enm;
+	int r, ret = -1;
+	struct udev_list_entry *first;
+	struct udev_device *u_dev;
+	const char *path;
+	dev_t devnum;
+
+	enm = udev_enumerate_new(udev);
+	if (!enm)
+		return -1;
+	r = udev_enumerate_add_match_subsystem(enm, "block");
+	r = udev_enumerate_scan_devices(enm);
+	if (r < 0)
+		goto out;
+	first = udev_enumerate_get_list_entry(enm);
+	if (!first)
+		goto out;
+	path = udev_list_entry_get_name(first);
+	u_dev = udev_device_new_from_syspath(udev, path);
+	if (!u_dev)
+		goto out;
+	devnum = udev_device_get_devnum(u_dev);
+	snprintf(devt, len, "%d:%d",
+		 major(devnum), minor(devnum));
+	udev_device_unref(u_dev);
+	condlog(3, "found block device: %s", devt);
+	ret = 0;
+out:
+	udev_enumerate_unref(enm);
+	return ret;
+}
+
+int setup(void **state)
+{
+	static char dev_t[BLK_DEV_SIZE];
+
+	udev = udev_new();
+	if (udev == NULL)
+		return -1;
+	*state = dev_t;
+	return get_one_devt(dev_t, sizeof(dev_t));
+}
+
+int teardown(void **state)
+{
+	udev_unref(udev);
+	return 0;
+}
+
+static void test_devt2devname_devt_good(void **state)
+{
+	char dummy[BLK_DEV_SIZE];
+
+	assert_int_equal(devt2devname(dummy, sizeof(dummy), *state), 0);
+}
+
+static void test_devt2devname_devname_null(void **state)
+{
+	assert_int_equal(devt2devname(NULL, 0, ""), 1);
+}
+
+/* buffer length 0 */
+static void test_devt2devname_length_0(void **state)
+{
+	char dummy[] = "";
+
+	assert_int_equal(devt2devname(dummy, 0, ""), 1);
+}
+
+/* buffer too small */
+static void test_devt2devname_length_1(void **state)
+{
+	char dummy[] = "";
+
+	skip();
+	assert_int_equal(devt2devname(dummy, sizeof(dummy), *state), 1);
+}
+
+static void test_devt2devname_devt_null(void **state)
+{
+	char dummy[32];
+
+	skip();
+	assert_int_equal(devt2devname(dummy, sizeof(dummy), NULL), 1);
+}
+
+static void test_devt2devname_devt_empty(void **state)
+{
+	char dummy[32];
+
+	assert_int_equal(devt2devname(dummy, sizeof(dummy), ""), 1);
+}
+
+static void test_devt2devname_devt_invalid_1(void **state)
+{
+	char dummy[32];
+
+	assert_int_equal(devt2devname(dummy, sizeof(dummy), "foo"), 1);
+}
+
+static void test_devt2devname_devt_invalid_2(void **state)
+{
+	char dummy[32];
+
+	assert_int_equal(devt2devname(dummy, sizeof(dummy), "1234"), 1);
+}
+
+static void test_devt2devname_devt_invalid_3(void **state)
+{
+	char dummy[32];
+
+	assert_int_equal(devt2devname(dummy, sizeof(dummy), "0:0"), 1);
+}
+
+static void test_devt2devname_real(void **state)
+{
+	struct udev_enumerate *enm;
+	int r;
+	struct udev_list_entry *first, *item;
+	unsigned int i = 0;
+
+	enm = udev_enumerate_new(udev);
+	assert_non_null(enm);
+	r = udev_enumerate_add_match_subsystem(enm, "block");
+	assert_in_range(r, 0, INT_MAX);
+	r = udev_enumerate_scan_devices(enm);
+	first = udev_enumerate_get_list_entry(enm);
+	udev_list_entry_foreach(item, first) {
+		const char *path = udev_list_entry_get_name(item);
+		struct udev_device *u_dev;
+		dev_t devnum;
+		char devt[BLK_DEV_SIZE];
+		char devname[FILE_NAME_SIZE];
+
+		u_dev = udev_device_new_from_syspath(udev, path);
+		assert_non_null(u_dev);
+		devnum = udev_device_get_devnum(u_dev);
+		snprintf(devt, sizeof(devt), "%d:%d",
+			 major(devnum), minor(devnum));
+		r = devt2devname(devname, sizeof(devname), devt);
+		assert_int_equal(r, 0);
+		assert_string_equal(devname, udev_device_get_sysname(u_dev));
+		i++;
+		udev_device_unref(u_dev);
+	}
+	udev_enumerate_unref(enm);
+	condlog(2, "devt2devname test passed for %u block devices", i);
+}
+
+static int devt2devname_tests(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(test_devt2devname_devt_good),
+		cmocka_unit_test(test_devt2devname_devname_null),
+		cmocka_unit_test(test_devt2devname_length_0),
+		cmocka_unit_test(test_devt2devname_length_1),
+		cmocka_unit_test(test_devt2devname_devt_null),
+		cmocka_unit_test(test_devt2devname_devt_empty),
+		cmocka_unit_test(test_devt2devname_devt_invalid_1),
+		cmocka_unit_test(test_devt2devname_devt_invalid_2),
+		cmocka_unit_test(test_devt2devname_devt_invalid_3),
+		cmocka_unit_test(test_devt2devname_real),
+	};
+
+	return cmocka_run_group_tests(tests, setup, teardown);
+}
+
+int main(void)
+{
+	int ret = 0;
+
+	ret += devt2devname_tests();
+	return ret;
+}
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

