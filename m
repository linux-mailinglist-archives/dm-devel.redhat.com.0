Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 460F115388D
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:59:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dhBNPXajAgxeBUOtgppd4eaJRgQRQLJlxccGzPsdVDQ=;
	b=FVd2xqszBY0rbpXo3HRMmUSdm8CE22EJYSek6ExU+8C71qo57sT8IQu1qrcUg6fKcqp7IY
	rLom5EDbYvDdsS6Mh8w554FJuFlCoEKG/IJLW1550zyk21hGrmchSqeJpz6OITsnj18oMb
	Zj5NWX49FJT8LvKMmUO4eFC3aiIjyBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-Sm-rdZctOheZ1oUcFdcdzQ-1; Wed, 05 Feb 2020 13:59:03 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C95A8010FE;
	Wed,  5 Feb 2020 18:58:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F7CF19C7F;
	Wed,  5 Feb 2020 18:58:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9952C866A7;
	Wed,  5 Feb 2020 18:58:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IwgZ5019511 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0214760C05; Wed,  5 Feb 2020 18:58:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D9460C63;
	Wed,  5 Feb 2020 18:58:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IweNe000351; 
	Wed, 5 Feb 2020 12:58:40 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015IweIV000346;
	Wed, 5 Feb 2020 12:58:40 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:19 -0600
Message-Id: <1580929100-32572-17-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 16/17] tests: add directio unit tests
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Sm-rdZctOheZ1oUcFdcdzQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 tests/Makefile   |   3 +-
 tests/directio.c | 704 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 706 insertions(+), 1 deletion(-)
 create mode 100644 tests/directio.c

diff --git a/tests/Makefile b/tests/Makefile
index a5cdf390..275fdd7d 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -3,7 +3,8 @@ include ../Makefile.inc
 CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir)
 LIBDEPS += -L$(multipathdir) -lmultipath -lcmocka
 
-TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy
+TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy \
+	 directio
 
 .SILENT: $(TESTS:%=%.o)
 .PRECIOUS: $(TESTS:%=%-test)
diff --git a/tests/directio.c b/tests/directio.c
new file mode 100644
index 00000000..5f067e24
--- /dev/null
+++ b/tests/directio.c
@@ -0,0 +1,704 @@
+/*
+ * Copyright (c) 2018 Benjamin Marzinski, Redhat
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
+#define UNIT_TESTING /* enable memory testing in directio.c */
+#include <cmocka.h>
+#include "globals.c"
+#include "../libmultipath/checkers/directio.c"
+
+int test_fd = 111;
+int ioctx_count = 0;
+struct io_event mock_events[AIO_GROUP_SIZE]; /* same as the checker max */
+int ev_off = 0;
+struct timespec zero_timeout = {0};
+struct timespec full_timeout = { .tv_sec = -1 };
+
+int __wrap_ioctl(int fd, unsigned long request, void *argp)
+{
+	int *blocksize = (int *)argp;
+
+	assert_int_equal(fd, test_fd);
+	assert_int_equal(request, BLKBSZGET);
+	assert_non_null(blocksize);
+	*blocksize = mock_type(int);
+	return 0;
+}
+
+int __wrap_fcntl(int fd, int cmd, long arg)
+{
+	assert_int_equal(fd, test_fd);
+	assert_int_equal(cmd, F_GETFL);
+	return O_DIRECT;
+}
+
+int __wrap___fxstat(int ver, int fd, struct stat *statbuf)
+{
+	assert_int_equal(fd, test_fd);
+	assert_non_null(statbuf);
+	memset(statbuf, 0, sizeof(struct stat));
+	return 0;
+}
+
+int __wrap_io_setup(int maxevents, io_context_t *ctxp)
+{
+	ioctx_count++;
+	return mock_type(int);
+}
+
+int __wrap_io_destroy(io_context_t ctx)
+{
+	ioctx_count--;
+	return mock_type(int);
+}
+
+int __wrap_io_submit(io_context_t ctx, long nr, struct iocb *ios[])
+{
+	return mock_type(int);
+}
+
+int __wrap_io_cancel(io_context_t ctx, struct iocb *iocb, struct io_event *evt)
+{
+	return mock_type(int);
+}
+
+int __wrap_io_getevents(io_context_t ctx, long min_nr, long nr,
+			struct io_event *events, struct timespec *timeout)
+{
+	int i, nr_evs;
+	struct timespec *sleep_tmo;
+	struct io_event *evs;
+
+	assert_non_null(timeout);
+	nr_evs = mock_type(int);
+	assert_true(nr_evs <= nr);
+	if (!nr_evs)
+		return 0;
+	sleep_tmo = mock_ptr_type(struct timespec *);
+	if (sleep_tmo) {
+		if (sleep_tmo->tv_sec < 0)
+			nanosleep(timeout, NULL);
+		else
+			nanosleep(sleep_tmo, NULL);
+	}
+	if (nr_evs < 0) {
+		errno = -nr_evs;
+		return -1;
+	}
+	evs = mock_ptr_type(struct io_event *);
+	for (i = 0; i < nr_evs; i++)
+		events[i] = evs[i];
+	ev_off -= nr_evs;
+	return nr_evs;
+}
+
+static void return_io_getevents_none(void)
+{
+	will_return(__wrap_io_getevents, 0);
+}
+
+static void return_io_getevents_nr(struct timespec *ts, int nr,
+				   struct async_req **reqs, int *res)
+{
+	int i, off = 0;
+
+	for(i = 0; i < nr; i++) {
+		mock_events[i + ev_off].obj = &reqs[i]->io;
+		if (res[i] == 0)
+			mock_events[i + ev_off].res = reqs[i]->blksize;
+	}
+	while (nr > 0) {
+		will_return(__wrap_io_getevents, (nr > 128)? 128 : nr);
+		will_return(__wrap_io_getevents, ts);
+		will_return(__wrap_io_getevents, &mock_events[off + ev_off]);
+		ts = NULL;
+		off += 128;
+		nr -= 128;
+	}
+	if (nr == 0)
+		will_return(__wrap_io_getevents, 0);
+	ev_off += i;
+}
+
+void do_check_state(struct checker *c, int sync, int timeout, int chk_state)
+{
+	struct directio_context * ct = (struct directio_context *)c->context;
+
+	if (!ct->running)
+		will_return(__wrap_io_submit, 1);
+	assert_int_equal(check_state(test_fd, ct, sync, timeout), chk_state);
+	assert_int_equal(ev_off, 0);
+	memset(mock_events, 0, sizeof(mock_events));
+}
+
+void do_libcheck_unload(int nr_aio_grps)
+{
+	int count = 0;
+	struct aio_group *aio_grp;
+
+	list_for_each_entry(aio_grp, &aio_grp_list, node)
+		count++;
+	assert_int_equal(count, nr_aio_grps);
+	for (count = 0; count < nr_aio_grps; count++)
+		will_return(__wrap_io_destroy, 0);
+	libcheck_unload();
+	assert_true(list_empty(&aio_grp_list));
+	assert_int_equal(ioctx_count, 0);
+}
+
+static void do_libcheck_init(struct checker *c, int blocksize,
+			     struct async_req **req)
+{
+	struct directio_context * ct;
+
+	c->fd = test_fd;
+	will_return(__wrap_ioctl, blocksize);
+	assert_int_equal(libcheck_init(c), 0);
+	ct = (struct directio_context *)c->context;
+	assert_non_null(ct);
+	assert_non_null(ct->aio_grp);
+	assert_non_null(ct->req);
+	if (req)
+		*req = ct->req;
+	assert_int_equal(ct->req->blksize, blocksize);
+}
+
+static int is_checker_running(struct checker *c)
+{
+	struct directio_context * ct = (struct directio_context *)c->context;
+	return ct->running;
+}
+
+static struct aio_group *get_aio_grp(struct checker *c)
+{
+	struct directio_context * ct = (struct directio_context *)c->context;
+
+	assert_non_null(ct);
+	return ct->aio_grp;
+}
+
+static void check_aio_grp(struct aio_group *aio_grp, int holders,
+			  int orphans)
+{
+	int count = 0;
+	struct list_head *item;
+
+	list_for_each(item, &aio_grp->orphans)
+		count++;
+	assert_int_equal(holders, aio_grp->holders);
+	assert_int_equal(orphans, count);
+}
+
+static void do_libcheck_load(void)
+{
+	int count = 0;
+	struct aio_group *aio_grp;
+
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
+	assert_int_equal(libcheck_load(), 0);
+	list_for_each_entry(aio_grp, &aio_grp_list, node) {
+		assert_int_equal(aio_grp->holders, 0);
+		count++;
+	}
+	assert_int_equal(count, 1);
+}
+
+/* simple loading resetting and unloading test */
+static void test_load_reset_unload(void **state)
+{
+	struct list_head *item;
+	do_libcheck_load();
+	item = aio_grp_list.next;
+	assert_int_equal(libcheck_reset(), 0);
+	assert_false(list_empty(&aio_grp_list));
+	assert_true(item == aio_grp_list.next);
+	do_libcheck_unload(1);
+}
+
+/* test initializing and then freeing 4096 checkers */
+static void test_init_free(void **state)
+{
+	int i, count = 0;
+	struct checker c[4096] = {0};
+	struct aio_group *aio_grp;
+
+	do_libcheck_load();
+	aio_grp = list_entry(aio_grp_list.next, typeof(*aio_grp), node);
+	will_return(__wrap_io_setup, 0);
+	will_return(__wrap_io_setup, 0);
+	will_return(__wrap_io_setup, 0);
+	for (i = 0; i < 4096; i++) {
+		struct directio_context * ct;
+
+		if (i % 3 == 0)
+			do_libcheck_init(&c[i], 512, NULL);
+		else if (i % 3 == 1)
+			do_libcheck_init(&c[i], 1024, NULL);
+		else
+			do_libcheck_init(&c[i], 4096, NULL);
+		ct = (struct directio_context *)c[i].context;
+		assert_non_null(ct->aio_grp);
+		if (i && (i & 1023) == 0)
+			aio_grp = ct->aio_grp;
+		else {
+			assert_ptr_equal(ct->aio_grp, aio_grp);
+			assert_int_equal(aio_grp->holders, (i & 1023) + 1);
+		}
+	}
+	count = 0;
+	list_for_each_entry(aio_grp, &aio_grp_list, node)
+		count++;
+	assert_int_equal(count, 4);
+	for (i = 0; i < 4096; i++) {
+		struct directio_context * ct = (struct directio_context *)c[i].context;
+
+		aio_grp = ct->aio_grp;
+		libcheck_free(&c[i]);
+		assert_int_equal(aio_grp->holders, 1023 - (i & 1023));
+	}
+	count = 0;
+	list_for_each_entry(aio_grp, &aio_grp_list, node) {
+		assert_int_equal(aio_grp->holders, 0);
+		count++;
+	}
+	assert_int_equal(count, 4);
+	will_return(__wrap_io_destroy, 0);
+	will_return(__wrap_io_destroy, 0);
+	will_return(__wrap_io_destroy, 0);
+	assert_int_equal(libcheck_reset(), 0);
+	do_libcheck_unload(1);
+}
+
+/* check mixed initializing and freeing 4096 checkers */
+static void test_multi_init_free(void **state)
+{
+	int i, count;
+	struct checker c[4096] = {0};
+	struct aio_group *aio_grp;
+
+	do_libcheck_load();
+	will_return(__wrap_io_setup, 0);
+	will_return(__wrap_io_setup, 0);
+	will_return(__wrap_io_setup, 0);
+	for (count = 0, i = 0; i < 4096; count++) {
+		/* usually init, but occasionally free checkers */
+		if (count == 0 || (count % 5 != 0 && count % 7 != 0)) {
+			do_libcheck_init(&c[i], 4096, NULL);
+			i++;
+		} else {
+			i--;
+			libcheck_free(&c[i]);
+		}
+	}
+	count = 0;
+	list_for_each_entry(aio_grp, &aio_grp_list, node) {
+		assert_int_equal(aio_grp->holders, 1024);
+		count++;
+	}
+	assert_int_equal(count, 4);
+	for (count = 0, i = 4096; i > 0; count++) {
+		/* usually free, but occasionally init checkers */
+		if (count == 0 || (count % 5 != 0 && count % 7 != 0)) {
+			i--;
+			libcheck_free(&c[i]);
+		} else {
+			do_libcheck_init(&c[i], 4096, NULL);
+			i++;
+		}
+	}
+	do_libcheck_unload(4);
+}
+
+/* simple single checker sync test */
+static void test_check_state_simple(void **state)
+{
+	struct checker c = {0};
+	struct async_req *req;
+	int res = 0;
+
+	do_libcheck_load();
+	do_libcheck_init(&c, 4096, &req);
+	return_io_getevents_nr(NULL, 1, &req, &res);
+	do_check_state(&c, 1, 30, PATH_UP);
+	libcheck_free(&c);
+	do_libcheck_unload(1);
+}
+
+/* test sync timeout */
+static void test_check_state_timeout(void **state)
+{
+	struct checker c = {0};
+	struct aio_group *aio_grp;
+
+	do_libcheck_load();
+	do_libcheck_init(&c, 4096, NULL);
+	aio_grp = get_aio_grp(&c);
+	return_io_getevents_none();
+	will_return(__wrap_io_cancel, 0);
+	do_check_state(&c, 1, 30, PATH_DOWN);
+	check_aio_grp(aio_grp, 1, 0);
+	libcheck_free(&c);
+	do_libcheck_unload(1);
+}
+
+/* test async timeout */
+static void test_check_state_async_timeout(void **state)
+{
+	struct checker c = {0};
+	struct aio_group *aio_grp;
+
+	do_libcheck_load();
+	do_libcheck_init(&c, 4096, NULL);
+	aio_grp = get_aio_grp(&c);
+	return_io_getevents_none();
+	do_check_state(&c, 0, 3, PATH_PENDING);
+	return_io_getevents_none();
+	do_check_state(&c, 0, 3, PATH_PENDING);
+	return_io_getevents_none();
+	do_check_state(&c, 0, 3, PATH_PENDING);
+	return_io_getevents_none();
+	will_return(__wrap_io_cancel, 0);
+	do_check_state(&c, 0, 3, PATH_DOWN);
+	check_aio_grp(aio_grp, 1, 0);
+	libcheck_free(&c);
+	do_libcheck_unload(1);
+}
+
+/* test freeing checkers with outstanding requests */
+static void test_free_with_pending(void **state)
+{
+        struct checker c[2] = {0};
+        struct aio_group *aio_grp;
+	struct async_req *req;
+	int res = 0;
+
+        do_libcheck_load();
+        do_libcheck_init(&c[0], 4096, &req);
+	do_libcheck_init(&c[1], 4096, NULL);
+        aio_grp = get_aio_grp(c);
+        return_io_getevents_none();
+        do_check_state(&c[0], 0, 30, PATH_PENDING);
+	return_io_getevents_nr(NULL, 1, &req, &res);
+	return_io_getevents_none();
+	do_check_state(&c[1], 0, 30, PATH_PENDING);
+	assert_true(is_checker_running(&c[0]));
+	assert_true(is_checker_running(&c[1]));
+	check_aio_grp(aio_grp, 2, 0);
+        libcheck_free(&c[0]);
+	check_aio_grp(aio_grp, 1, 0);
+        will_return(__wrap_io_cancel, 0);
+        libcheck_free(&c[1]);
+        check_aio_grp(aio_grp, 0, 0);
+        do_libcheck_unload(1);
+}
+
+/* test removing orpahed aio_group on free */
+static void test_orphaned_aio_group(void **state)
+{
+	struct checker c[AIO_GROUP_SIZE] = {0};
+	struct aio_group *aio_grp, *tmp_grp;
+	int i;
+
+        do_libcheck_load();
+	for (i = 0; i < AIO_GROUP_SIZE; i++) {
+		do_libcheck_init(&c[i], 4096, NULL);
+		return_io_getevents_none();
+		do_check_state(&c[i], 0, 30, PATH_PENDING);
+	}
+	aio_grp = get_aio_grp(c);
+	check_aio_grp(aio_grp, AIO_GROUP_SIZE, 0);
+	i = 0;
+	list_for_each_entry(tmp_grp, &aio_grp_list, node)
+		i++;
+	assert_int_equal(i, 1);
+	for (i = 0; i < AIO_GROUP_SIZE; i++) {
+		assert_true(is_checker_running(&c[i]));
+		will_return(__wrap_io_cancel, -1);
+		if (i == AIO_GROUP_SIZE - 1) {
+			/* remove the orphaned group and create a new one */
+			will_return(__wrap_io_destroy, 0);
+			will_return(__wrap_io_setup, 0);
+		}
+		libcheck_free(&c[i]);
+	}
+	i = 0;
+	list_for_each_entry(tmp_grp, &aio_grp_list, node) {
+		i++;
+		check_aio_grp(aio_grp, 0, 0);
+	}
+	assert_int_equal(i, 1);
+        do_libcheck_unload(1);
+}
+
+/* test sync timeout with failed cancel and cleanup by another
+ * checker */
+static void test_timeout_cancel_failed(void **state)
+{
+	struct checker c[2] = {0};
+	struct aio_group *aio_grp;
+	struct async_req *reqs[2];
+	int res[] = {0,0};
+	int i;
+
+	do_libcheck_load();
+	for (i = 0; i < 2; i++)
+		do_libcheck_init(&c[i], 4096, &reqs[i]);
+	aio_grp = get_aio_grp(c);
+	return_io_getevents_none();
+	will_return(__wrap_io_cancel, -1);
+	do_check_state(&c[0], 1, 30, PATH_DOWN);
+	assert_true(is_checker_running(&c[0]));
+	check_aio_grp(aio_grp, 2, 0);
+	return_io_getevents_none();
+	will_return(__wrap_io_cancel, -1);
+	do_check_state(&c[0], 1, 30, PATH_DOWN);
+	assert_true(is_checker_running(&c[0]));
+	return_io_getevents_nr(NULL, 2, reqs, res);
+	do_check_state(&c[1], 1, 30, PATH_UP);
+	do_check_state(&c[0], 1, 30, PATH_UP);
+	for (i = 0; i < 2; i++) {
+		assert_false(is_checker_running(&c[i]));
+		libcheck_free(&c[i]);
+	}
+	do_libcheck_unload(1);
+}
+
+/* test async timeout with failed cancel and cleanup by another
+ * checker */
+static void test_async_timeout_cancel_failed(void **state)
+{
+	struct checker c[2] = {0};
+	struct async_req *reqs[2];
+	int res[] = {0,0};
+	int i;
+
+	do_libcheck_load();
+	for (i = 0; i < 2; i++)
+		do_libcheck_init(&c[i], 4096, &reqs[i]);
+	return_io_getevents_none();
+	do_check_state(&c[0], 0, 2, PATH_PENDING);
+	return_io_getevents_none();
+	do_check_state(&c[1], 0, 2, PATH_PENDING);
+	return_io_getevents_none();
+	do_check_state(&c[0], 0, 2, PATH_PENDING);
+	return_io_getevents_none();
+	do_check_state(&c[1], 0, 2, PATH_PENDING);
+	return_io_getevents_none();
+	will_return(__wrap_io_cancel, -1);
+	do_check_state(&c[0], 0, 2, PATH_DOWN);
+	return_io_getevents_nr(NULL, 1, &reqs[1], &res[1]);
+	do_check_state(&c[1], 0, 2, PATH_UP);
+	return_io_getevents_none();
+	will_return(__wrap_io_cancel, -1);
+	do_check_state(&c[0], 0, 2, PATH_DOWN);
+	assert_true(is_checker_running(&c[0]));
+	return_io_getevents_nr(NULL, 2, reqs, res);
+	do_check_state(&c[1], 0, 2, PATH_UP);
+	do_check_state(&c[0], 0, 2, PATH_UP);
+	for (i = 0; i < 2; i++) {
+		assert_false(is_checker_running(&c[i]));
+		libcheck_free(&c[i]);
+	}
+	do_libcheck_unload(1);
+}
+
+/* test orphaning a request, and having another checker clean it up */
+static void test_orphan_checker_cleanup(void **state)
+{
+	struct checker c[2] = {0};
+	struct async_req *reqs[2];
+	int res[] = {0,0};
+	struct aio_group *aio_grp;
+	int i;
+
+	do_libcheck_load();
+	for (i = 0; i < 2; i++)
+		do_libcheck_init(&c[i], 4096, &reqs[i]);
+	aio_grp = get_aio_grp(c);
+	return_io_getevents_none();
+	do_check_state(&c[0], 0, 30, PATH_PENDING);
+	will_return(__wrap_io_cancel, -1);
+	check_aio_grp(aio_grp, 2, 0);
+	libcheck_free(&c[0]);
+	check_aio_grp(aio_grp, 2, 1);
+	return_io_getevents_nr(NULL, 2, reqs, res);
+	do_check_state(&c[1], 0, 2, PATH_UP);
+	check_aio_grp(aio_grp, 1, 0);
+	libcheck_free(&c[1]);
+	check_aio_grp(aio_grp, 0, 0);
+	do_libcheck_unload(1);
+}
+
+/* test orphaning a request, and having reset clean it up */
+static void test_orphan_reset_cleanup(void **state)
+{
+	struct checker c;
+	struct aio_group *orphan_aio_grp, *tmp_aio_grp;
+	int found, count;
+
+	do_libcheck_load();
+	do_libcheck_init(&c, 4096, NULL);
+	orphan_aio_grp = get_aio_grp(&c);
+	return_io_getevents_none();
+	do_check_state(&c, 0, 30, PATH_PENDING);
+	will_return(__wrap_io_cancel, -1);
+	check_aio_grp(orphan_aio_grp, 1, 0);
+	libcheck_free(&c);
+	check_aio_grp(orphan_aio_grp, 1, 1);
+	found = count = 0;
+	list_for_each_entry(tmp_aio_grp, &aio_grp_list, node) {
+		count++;
+		if (tmp_aio_grp == orphan_aio_grp)
+			found = 1;
+	}
+	assert_int_equal(count, 1);
+	assert_int_equal(found, 1);
+	will_return(__wrap_io_setup, 0);
+	will_return(__wrap_io_destroy, 0);
+	assert_int_equal(libcheck_reset(), 0);
+	found = count = 0;
+	list_for_each_entry(tmp_aio_grp, &aio_grp_list, node) {
+		count++;
+		check_aio_grp(tmp_aio_grp, 0, 0);
+		if (tmp_aio_grp == orphan_aio_grp)
+			found = 1;
+	}
+	assert_int_equal(count, 1);
+	assert_int_equal(found, 0);
+	do_libcheck_unload(1);
+}
+
+/* test orphaning a request, and having unload clean it up */
+static void test_orphan_unload_cleanup(void **state)
+{
+	struct checker c;
+	struct aio_group *orphan_aio_grp, *tmp_aio_grp;
+	int found, count;
+
+	do_libcheck_load();
+	do_libcheck_init(&c, 4096, NULL);
+	orphan_aio_grp = get_aio_grp(&c);
+	return_io_getevents_none();
+	do_check_state(&c, 0, 30, PATH_PENDING);
+	will_return(__wrap_io_cancel, -1);
+	check_aio_grp(orphan_aio_grp, 1, 0);
+	libcheck_free(&c);
+	check_aio_grp(orphan_aio_grp, 1, 1);
+	found = count = 0;
+	list_for_each_entry(tmp_aio_grp, &aio_grp_list, node) {
+		count++;
+		if (tmp_aio_grp == orphan_aio_grp)
+			found = 1;
+	}
+	assert_int_equal(count, 1);
+	assert_int_equal(found, 1);
+	do_libcheck_unload(1);
+}
+
+/* test checkers with different blocksizes */
+static void test_check_state_blksize(void **state)
+{
+	int i;
+	struct checker c[3] = {0};
+	int blksize[] = {4096, 1024, 512};
+	struct async_req *reqs[3];
+	int res[] = {0,1,0};
+	int chk_state[] = {PATH_UP, PATH_DOWN, PATH_UP};
+
+	do_libcheck_load();
+	for (i = 0; i < 3; i++)
+		do_libcheck_init(&c[i], blksize[i], &reqs[i]);
+	for (i = 0; i < 3; i++) {
+		return_io_getevents_nr(NULL, 1, &reqs[i], &res[i]);
+		do_check_state(&c[i], 1, 30, chk_state[i]);
+	}
+	for (i = 0; i < 3; i++) {
+		assert_false(is_checker_running(&c[i]));
+		libcheck_free(&c[i]);
+	}
+	do_libcheck_unload(1);
+}
+
+/* test async checkers pending and getting resovled by another checker
+ * as well as the loops for getting multiple events */
+static void test_check_state_async(void **state)
+{
+	int i;
+	struct checker c[257] = {0};
+	struct async_req *reqs[257];
+	int res[257] = {0};
+
+	do_libcheck_load();
+	for (i = 0; i < 257; i++)
+		do_libcheck_init(&c[i], 4096, &reqs[i]);
+	for (i = 0; i < 256; i++) {
+		return_io_getevents_none();
+		do_check_state(&c[i], 0, 30, PATH_PENDING);
+		assert_true(is_checker_running(&c[i]));
+	}
+	return_io_getevents_nr(&full_timeout, 256, reqs, res);
+	return_io_getevents_nr(NULL, 1, &reqs[256], &res[256]);
+	do_check_state(&c[256], 0, 30, PATH_UP);
+	assert_false(is_checker_running(&c[256]));
+	libcheck_free(&c[256]);
+	for (i = 0; i < 256; i++) {
+		do_check_state(&c[i], 0, 30, PATH_UP);
+		assert_false(is_checker_running(&c[i]));
+		libcheck_free(&c[i]);
+	}
+	do_libcheck_unload(1);
+}
+
+int test_directio(void)
+{
+	const struct CMUnitTest tests[] = {
+		cmocka_unit_test(test_load_reset_unload),
+		cmocka_unit_test(test_init_free),
+		cmocka_unit_test(test_multi_init_free),
+		cmocka_unit_test(test_check_state_simple),
+		cmocka_unit_test(test_check_state_timeout),
+		cmocka_unit_test(test_check_state_async_timeout),
+		cmocka_unit_test(test_free_with_pending),
+		cmocka_unit_test(test_timeout_cancel_failed),
+		cmocka_unit_test(test_async_timeout_cancel_failed),
+		cmocka_unit_test(test_orphan_checker_cleanup),
+		cmocka_unit_test(test_orphan_reset_cleanup),
+		cmocka_unit_test(test_orphan_unload_cleanup),
+		cmocka_unit_test(test_check_state_blksize),
+		cmocka_unit_test(test_check_state_async),
+		cmocka_unit_test(test_orphaned_aio_group),
+	};
+
+	return cmocka_run_group_tests(tests, NULL, NULL);
+}
+
+int main(void)
+{
+	int ret = 0;
+
+	conf.verbosity = 2;
+	ret += test_directio();
+	return ret;
+}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

