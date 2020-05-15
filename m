Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E65901D4352
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 04:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589508002;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jGOBiijl8PMaM9BUiYqa1Z4j5wgrDuVAz4nTwzPwUZ0=;
	b=GEh0u19lLE4tJrbzjhK9etvy8oU6uJDXOBNUhS5azjFeEDqoo+fZYS92w3IRaGW1gncPAN
	Ai58oappuk/3fiLJcYqRHPWDvpv0T+XK0Fx0uF/hB6kuGz9FhzWuHB30ndpZ4v77rp9mc1
	qn1em6OMBZCraFBb6zRDNWmUYb5KoCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-pkbPZ9pbPDKQnPNDcbEy6w-1; Thu, 14 May 2020 21:59:46 -0400
X-MC-Unique: pkbPZ9pbPDKQnPNDcbEy6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B1E218FE867;
	Fri, 15 May 2020 01:59:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D18A60650;
	Fri, 15 May 2020 01:59:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 140AE4E9B8;
	Fri, 15 May 2020 01:59:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F1xY0B003835 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 21:59:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 355D55C1D3; Fri, 15 May 2020 01:59:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 852BF5C1D6;
	Fri, 15 May 2020 01:59:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04F1xSta006949; 
	Thu, 14 May 2020 20:59:29 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04F1xS4S006948;
	Thu, 14 May 2020 20:59:28 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 14 May 2020 20:59:20 -0500
Message-Id: <1589507962-6895-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1589507962-6895-1-git-send-email-bmarzins@redhat.com>
References: <1589507962-6895-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 4/6] Unit tests for is_path_valid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 tests/Makefile |   4 +-
 tests/valid.c  | 424 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 427 insertions(+), 1 deletion(-)
 create mode 100644 tests/valid.c

diff --git a/tests/Makefile b/tests/Makefile
index 1b8706a7..125553b8 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -13,7 +13,7 @@ CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir) \
 LIBDEPS += -L$(multipathdir) -L$(mpathcmddir) -lmultipath -lmpathcmd -lcmocka
 
 TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy \
-	 alias directio
+	 alias directio valid
 
 .SILENT: $(TESTS:%=%.o)
 .PRECIOUS: $(TESTS:%=%-test)
@@ -50,6 +50,8 @@ vpd-test_OBJDEPS :=  ../libmultipath/discovery.o
 vpd-test_LIBDEPS := -ludev -lpthread -ldl
 alias-test_TESTDEPS := test-log.o
 alias-test_LIBDEPS := -lpthread -ldl
+valid-test_OBJDEPS := ../libmultipath/valid.o
+valid-test_LIBDEPS := -ludev -lpthread -ldl
 ifneq ($(DIO_TEST_DEV),)
 directio-test_LIBDEPS := -laio
 endif
diff --git a/tests/valid.c b/tests/valid.c
new file mode 100644
index 00000000..b128b029
--- /dev/null
+++ b/tests/valid.c
@@ -0,0 +1,424 @@
+/*
+ * Copyright (c) 2020 Benjamin Marzinski, Redhat
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ *
+ */
+
+#define _GNU_SOURCE
+#include <stdint.h>
+#include <stdbool.h>
+#include <stdarg.h>
+#include <stddef.h>
+#include <setjmp.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <cmocka.h>
+#include "globals.c"
+#include "util.h"
+#include "discovery.h"
+#include "wwids.h"
+#include "valid.h"
+
+int test_fd;
+struct udev_device {
+	int unused;
+} test_udev;
+
+bool __wrap_sysfs_is_multipathed(struct path *pp, bool set_wwid)
+{
+	bool is_multipathed = mock_type(bool);
+	assert_non_null(pp);
+	assert_int_not_equal(strlen(pp->dev), 0);
+	if (is_multipathed && set_wwid)
+		strlcpy(pp->wwid, mock_ptr_type(char *), WWID_SIZE);
+	return is_multipathed;
+}
+
+int __wrap___mpath_connect(int nonblocking)
+{
+	bool connected = mock_type(bool);
+	assert_int_equal(nonblocking, 1);
+	if (connected)
+		return test_fd;
+	errno = mock_type(int);
+	return -1;
+}
+
+int __wrap_systemd_service_enabled(const char *dev)
+{
+	return (int)mock_type(bool);
+}
+
+/* There's no point in checking the return value here */
+int __wrap_mpath_disconnect(int fd)
+{
+	assert_int_equal(fd, test_fd);
+	return 0;
+}
+
+struct udev_device *__wrap_udev_device_new_from_subsystem_sysname(struct udev *udev, const char *subsystem, const char *sysname)
+{
+	bool passed = mock_type(bool);
+	assert_string_equal(sysname, mock_ptr_type(char *));
+	if (passed)
+		return &test_udev;
+	return NULL;
+}
+
+int __wrap_pathinfo(struct path *pp, struct config *conf, int mask)
+{
+	int ret = mock_type(int);
+	assert_string_equal(pp->dev, mock_ptr_type(char *));
+	assert_int_equal(mask, DI_SYSFS | DI_WWID | DI_BLACKLIST);
+	if (ret == PATHINFO_OK)
+		strlcpy(pp->wwid, mock_ptr_type(char *), WWID_SIZE);
+	else
+		memset(pp->wwid, 0, WWID_SIZE);
+	return ret;
+}
+
+int __wrap_is_failed_wwid(const char *wwid)
+{
+	int ret = mock_type(int);
+	assert_string_equal(wwid, mock_ptr_type(char *));
+	return ret;
+}
+
+int __wrap_check_wwids_file(char *wwid, int write_wwid)
+{
+	bool passed = mock_type(bool);
+	assert_int_equal(write_wwid, 0);
+	assert_string_equal(wwid, mock_ptr_type(char *));
+	if (passed)
+		return 0;
+	else
+		return -1;
+}
+
+int __wrap_dm_map_present_by_uuid(const char *uuid)
+{
+	int ret = mock_type(int);
+	assert_string_equal(uuid, mock_ptr_type(char *));
+	return ret;
+}
+
+enum {
+	STAGE_IS_MULTIPATHED,
+	STAGE_CHECK_MULTIPATHD,
+	STAGE_GET_UDEV_DEVICE,
+	STAGE_PATHINFO,
+	STAGE_IS_FAILED,
+	STAGE_CHECK_WWIDS,
+	STAGE_UUID_PRESENT,
+};
+
+/* setup the test to continue past the given stage in is_path_valid() */
+static void setup_passing(char *name, char *wwid, bool check_multipathd,
+			  unsigned int stage)
+{
+	will_return(__wrap_sysfs_is_multipathed, false);
+	if (stage == STAGE_IS_MULTIPATHED)
+		return;
+	if (check_multipathd)
+		will_return(__wrap___mpath_connect, true);
+	if (stage == STAGE_CHECK_MULTIPATHD)
+		return;
+	will_return(__wrap_udev_device_new_from_subsystem_sysname, true);
+	will_return(__wrap_udev_device_new_from_subsystem_sysname,
+		    name);
+	if (stage == STAGE_GET_UDEV_DEVICE)
+		return;
+	will_return(__wrap_pathinfo, PATHINFO_OK);
+	will_return(__wrap_pathinfo, name);
+	will_return(__wrap_pathinfo, wwid);
+	if (stage == STAGE_PATHINFO)
+		return;
+	will_return(__wrap_is_failed_wwid, WWID_IS_NOT_FAILED);
+	will_return(__wrap_is_failed_wwid, wwid);
+	if (stage == STAGE_IS_FAILED)
+		return;
+	will_return(__wrap_check_wwids_file, false);
+	will_return(__wrap_check_wwids_file, wwid);
+	if (stage == STAGE_CHECK_WWIDS)
+		return;
+	will_return(__wrap_dm_map_present_by_uuid, 0);
+	will_return(__wrap_dm_map_present_by_uuid, wwid);
+}
+
+static void test_bad_arguments(void **state)
+{
+	struct path pp;
+	char too_long[FILE_NAME_SIZE + 1];
+
+	memset(&pp, 0, sizeof(pp));
+	/* test NULL pointers */
+	assert_int_equal(is_path_valid("test", &conf, NULL, true),
+			 PATH_IS_ERROR);
+	assert_int_equal(is_path_valid("test", NULL, &pp, true),
+			 PATH_IS_ERROR);
+	assert_int_equal(is_path_valid(NULL, &conf, &pp, true),
+			 PATH_IS_ERROR);
+	/* test undefined find_mutlipaths */
+	conf.find_multipaths = FIND_MULTIPATHS_UNDEF;
+	assert_int_equal(is_path_valid("test", &conf, &pp, true),
+			 PATH_IS_ERROR);
+	/* test name too long */
+	memset(too_long, 'x', sizeof(too_long));
+	too_long[sizeof(too_long) - 1] = '\0';
+	conf.find_multipaths = FIND_MULTIPATHS_STRICT;
+	assert_int_equal(is_path_valid(too_long, &conf, &pp, true),
+			 PATH_IS_ERROR);
+}
+
+static void test_sysfs_is_multipathed(void **state)
+{
+	struct path pp;
+	char *name = "test";
+	char *wwid = "test_wwid";
+
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_STRICT;
+	/* test for already existing multiapthed device */
+	will_return(__wrap_sysfs_is_multipathed, true);
+	will_return(__wrap_sysfs_is_multipathed, wwid);
+	assert_int_equal(is_path_valid(name, &conf, &pp, true),
+			 PATH_IS_VALID_NO_CHECK);
+	assert_string_equal(pp.dev, name);
+	assert_string_equal(pp.wwid, wwid);
+	/* test for wwid device with empty wwid */
+	will_return(__wrap_sysfs_is_multipathed, true);
+	will_return(__wrap_sysfs_is_multipathed, "");
+	assert_int_equal(is_path_valid(name, &conf, &pp, true),
+			 PATH_IS_ERROR);
+}
+
+static void test_check_multipathd(void **state)
+{
+	struct path pp;
+	char *name = "test";
+
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_STRICT;
+	/* test failed check to see if multipathd is active */
+	will_return(__wrap_sysfs_is_multipathed, false);
+	will_return(__wrap___mpath_connect, false);
+	will_return(__wrap___mpath_connect, ECONNREFUSED);
+	will_return(__wrap_systemd_service_enabled, false);
+	assert_int_equal(is_path_valid(name, &conf, &pp, true),
+			 PATH_IS_NOT_VALID);
+	assert_string_equal(pp.dev, name);
+	/* test pass because service is enabled. fail getting udev */
+	memset(&pp, 0, sizeof(pp));
+	will_return(__wrap_sysfs_is_multipathed, false);
+	will_return(__wrap___mpath_connect, false);
+	will_return(__wrap___mpath_connect, ECONNREFUSED);
+	will_return(__wrap_systemd_service_enabled, true);
+	will_return(__wrap_udev_device_new_from_subsystem_sysname, false);
+	will_return(__wrap_udev_device_new_from_subsystem_sysname,
+		    name);
+	assert_int_equal(is_path_valid(name, &conf, &pp, true),
+			 PATH_IS_ERROR);
+	assert_string_equal(pp.dev, name);
+	/* test pass because connect returned EAGAIN. fail getting udev */
+	will_return(__wrap_sysfs_is_multipathed, false);
+	will_return(__wrap___mpath_connect, false);
+	will_return(__wrap___mpath_connect, EAGAIN);
+	will_return(__wrap_udev_device_new_from_subsystem_sysname, false);
+	will_return(__wrap_udev_device_new_from_subsystem_sysname,
+		    name);
+	assert_int_equal(is_path_valid(name, &conf, &pp, true),
+			 PATH_IS_ERROR);
+	/* test pass because connect succeeded. fail getting udev */
+	memset(&pp, 0, sizeof(pp));
+	will_return(__wrap_sysfs_is_multipathed, false);
+	will_return(__wrap___mpath_connect, true);
+	will_return(__wrap_udev_device_new_from_subsystem_sysname, false);
+	will_return(__wrap_udev_device_new_from_subsystem_sysname,
+		    name);
+	assert_int_equal(is_path_valid(name, &conf, &pp, true),
+			 PATH_IS_ERROR);
+	assert_string_equal(pp.dev, name);
+}
+
+static void test_pathinfo(void **state)
+{
+	struct path pp;
+	char *name = "test";
+
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_STRICT;
+	/* Test pathinfo blacklisting device */
+	setup_passing(name, NULL, false, STAGE_GET_UDEV_DEVICE);
+	will_return(__wrap_pathinfo, PATHINFO_SKIPPED);
+	will_return(__wrap_pathinfo, name);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_NOT_VALID);
+	assert_string_equal(pp.dev, name);
+	assert_ptr_equal(pp.udev, &test_udev);
+	/* Test pathinfo failing */
+	memset(&pp, 0, sizeof(pp));
+	setup_passing(name, NULL, false, STAGE_GET_UDEV_DEVICE);
+	will_return(__wrap_pathinfo, PATHINFO_FAILED);
+	will_return(__wrap_pathinfo, name);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_ERROR);
+	/* Test blank wwid */
+	memset(&pp, 0, sizeof(pp));
+	setup_passing(name, NULL, false, STAGE_GET_UDEV_DEVICE);
+	will_return(__wrap_pathinfo, PATHINFO_OK);
+	will_return(__wrap_pathinfo, name);
+	will_return(__wrap_pathinfo, "");
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_NOT_VALID);
+}
+
+static void test_is_failed_wwid(void **state)
+{
+	struct path pp;
+	char *name = "test";
+	char *wwid = "test-wwid";
+
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_STRICT;
+	/* Test wwid failed */
+	setup_passing(name, wwid, false, STAGE_PATHINFO);
+	will_return(__wrap_is_failed_wwid, WWID_IS_FAILED);
+	will_return(__wrap_is_failed_wwid, wwid);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_NOT_VALID);
+	assert_string_equal(pp.dev, name);
+	assert_ptr_equal(pp.udev, &test_udev);
+	assert_string_equal(pp.wwid, wwid);
+	/* test is_failed_wwid error */
+	setup_passing(name, wwid, false, STAGE_PATHINFO);
+	will_return(__wrap_is_failed_wwid, WWID_FAILED_ERROR);
+	will_return(__wrap_is_failed_wwid, wwid);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_ERROR);
+}
+
+static void test_greedy(void **state)
+{
+	struct path pp;
+	char *name = "test";
+	char *wwid = "test-wwid";
+
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_GREEDY;
+	setup_passing(name, wwid, false, STAGE_IS_FAILED);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_VALID);
+	assert_string_equal(pp.dev, name);
+	assert_ptr_equal(pp.udev, &test_udev);
+	assert_string_equal(pp.wwid, wwid);
+}
+
+static void test_check_wwids(void **state)
+{
+	struct path pp;
+	char *name = "test";
+	char *wwid = "test-wwid";
+
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_STRICT;
+	setup_passing(name, wwid, false, STAGE_IS_FAILED);
+	will_return(__wrap_check_wwids_file, true);
+	will_return(__wrap_check_wwids_file, wwid);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_VALID_NO_CHECK);
+	assert_string_equal(pp.dev, name);
+	assert_ptr_equal(pp.udev, &test_udev);
+	assert_string_equal(pp.wwid, wwid);
+}
+
+static void test_check_uuid_present(void **state)
+{
+	struct path pp;
+	char *name = "test";
+	char *wwid = "test-wwid";
+
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_STRICT;
+	setup_passing(name, wwid, false, STAGE_CHECK_WWIDS);
+	will_return(__wrap_dm_map_present_by_uuid, 1);
+	will_return(__wrap_dm_map_present_by_uuid, wwid);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_VALID);
+	assert_string_equal(pp.dev, name);
+	assert_ptr_equal(pp.udev, &test_udev);
+	assert_string_equal(pp.wwid, wwid);
+}
+
+
+static void test_find_multipaths(void **state)
+{
+	struct path pp;
+	char *name = "test";
+	char *wwid = "test-wwid";
+
+	/* test find_multipaths = FIND_MULTIPATHS_STRICT */
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_STRICT;
+	setup_passing(name, wwid, false, STAGE_UUID_PRESENT);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_NOT_VALID);
+	assert_string_equal(pp.dev, name);
+	assert_ptr_equal(pp.udev, &test_udev);
+	assert_string_equal(pp.wwid, wwid);
+	/* test find_multipaths = FIND_MULTIPATHS_OFF */
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_OFF;
+	setup_passing(name, wwid, false, STAGE_UUID_PRESENT);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_NOT_VALID);
+	/* test find_multipaths = FIND_MULTIPATHS_ON */
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_ON;
+	setup_passing(name, wwid, false, STAGE_UUID_PRESENT);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_NOT_VALID);
+	/* test find_multipaths = FIND_MULTIPATHS_SMART */
+	memset(&pp, 0, sizeof(pp));
+	conf.find_multipaths = FIND_MULTIPATHS_SMART;
+	setup_passing(name, wwid, false, STAGE_UUID_PRESENT);
+	assert_int_equal(is_path_valid(name, &conf, &pp, false),
+			 PATH_IS_MAYBE_VALID);
+	assert_string_equal(pp.dev, name);
+	assert_ptr_equal(pp.udev, &test_udev);
+	assert_string_equal(pp.wwid, wwid);
+}
+
+int test_valid(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(test_bad_arguments),
+		cmocka_unit_test(test_sysfs_is_multipathed),
+		cmocka_unit_test(test_check_multipathd),
+		cmocka_unit_test(test_pathinfo),
+		cmocka_unit_test(test_is_failed_wwid),
+		cmocka_unit_test(test_greedy),
+		cmocka_unit_test(test_check_wwids),
+		cmocka_unit_test(test_check_uuid_present),
+		cmocka_unit_test(test_find_multipaths),
+	};
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
+int main(void)
+{
+	int ret = 0;
+	ret += test_valid();
+	return ret;
+}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

