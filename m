Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9610D153893
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 20:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dqCHVfw9GUjkCtK/3cu32xAbt/vw9mjlJrhd30gF5XM=;
	b=FDA0J9LeIDoy7DUMbXb12t4RmXSWVRIpTRZefniji1AeAmYqQpmXY7B3WkTB3tvlsXqlUA
	WACTfO54E0WG0CbQtn+3ri/kDiXl8Mr3bT3KtmG7d9nw4MClTmlql8DfZhAX3+GAp0eb3H
	aJoysR+D/remUQyEYkSQyZraL1KT854=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-2NI2M9CcNKyb0VkCPIA_tg-1; Wed, 05 Feb 2020 13:59:04 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B022801A08;
	Wed,  5 Feb 2020 18:58:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7D08790C8;
	Wed,  5 Feb 2020 18:58:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72B94866A8;
	Wed,  5 Feb 2020 18:58:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015Iwhfr019522 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2613060C18; Wed,  5 Feb 2020 18:58:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00FA760C05;
	Wed,  5 Feb 2020 18:58:42 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IwfXw000366; 
	Wed, 5 Feb 2020 12:58:42 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015Iwfo6000358;
	Wed, 5 Feb 2020 12:58:41 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:20 -0600
Message-Id: <1580929100-32572-18-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 17/17] tests: make directio tests able to work
	on a real device
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
X-MC-Unique: 2NI2M9CcNKyb0VkCPIA_tg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is now a file in tests called directio_test_dev. If the commented
out test device line is uncommented and set to a device, it can be used
to test the directio checker on that device, instead of faking the
device.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 tests/Makefile          |  16 +++++-
 tests/directio.c        | 114 ++++++++++++++++++++++++++++++++++++++--
 tests/directio_test_dev |   4 ++
 3 files changed, 130 insertions(+), 4 deletions(-)
 create mode 100644 tests/directio_test_dev

diff --git a/tests/Makefile b/tests/Makefile
index 275fdd7d..0003d778 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -9,10 +9,18 @@ TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy \
 .SILENT: $(TESTS:%=%.o)
 .PRECIOUS: $(TESTS:%=%-test)
 
+DIO_TEST_DEV = $(shell sed -n -e 's/^[[:space:]]*DIO_TEST_DEV[[:space:]]*=[[:space:]]*\([^[:space:]\#]\+\).*/\1/p' < directio_test_dev)
+
 all:	$(TESTS:%=%.out)
 
+# test-specific compiler flags
+# XYZ-test_FLAGS: Additional compiler flags for this test
+ifneq ($(DIO_TEST_DEV),)
+directio-test_FLAGS := -DDIO_TEST_DEV=\"$(DIO_TEST_DEV)\"
+endif
+
 # test-specific linker flags
-# XYZ-test-TESTDEPS: test libraries containing __wrap_xyz functions
+# XYZ-test_TESTDEPS: test libraries containing __wrap_xyz functions
 # XYZ-test_OBJDEPS: object files from libraries to link in explicitly
 #    That may be necessary if functions called from the object file are wrapped
 #    (wrapping works only for symbols which are undefined after processing a
@@ -28,6 +36,12 @@ blacklist-test_OBJDEPS := ../libmultipath/blacklist.o
 blacklist-test_LIBDEPS := -ludev
 vpd-test_OBJDEPS :=  ../libmultipath/discovery.o
 vpd-test_LIBDEPS := -ludev -lpthread -ldl
+ifneq ($(DIO_TEST_DEV),)
+directio-test_LIBDEPS := -laio
+endif
+
+%.o: %.c
+	$(CC) $(CFLAGS) $($*-test_FLAGS) -c -o $@ $<
 
 lib/libchecktur.so:
 	mkdir lib
diff --git a/tests/directio.c b/tests/directio.c
index 5f067e24..236c514b 100644
--- a/tests/directio.c
+++ b/tests/directio.c
@@ -35,8 +35,14 @@ int ev_off = 0;
 struct timespec zero_timeout = {0};
 struct timespec full_timeout = { .tv_sec = -1 };
 
+int __real_ioctl(int fd, unsigned long request, void *argp);
+
 int __wrap_ioctl(int fd, unsigned long request, void *argp)
 {
+#ifdef DIO_TEST_DEV
+	mock_type(int);
+	return __real_ioctl(fd, request, argp);
+#else
 	int *blocksize = (int *)argp;
 
 	assert_int_equal(fd, test_fd);
@@ -44,57 +50,115 @@ int __wrap_ioctl(int fd, unsigned long request, void *argp)
 	assert_non_null(blocksize);
 	*blocksize = mock_type(int);
 	return 0;
+#endif
 }
 
+int __real_fcntl(int fd, int cmd, long arg);
+
 int __wrap_fcntl(int fd, int cmd, long arg)
 {
+#ifdef DIO_TEST_DEV
+	return __real_fcntl(fd, cmd, arg);
+#else
 	assert_int_equal(fd, test_fd);
 	assert_int_equal(cmd, F_GETFL);
 	return O_DIRECT;
+#endif
 }
 
+int __real___fxstat(int ver, int fd, struct stat *statbuf);
+
 int __wrap___fxstat(int ver, int fd, struct stat *statbuf)
 {
+#ifdef DIO_TEST_DEV
+	return __real___fxstat(ver, fd, statbuf);
+#else
 	assert_int_equal(fd, test_fd);
 	assert_non_null(statbuf);
 	memset(statbuf, 0, sizeof(struct stat));
 	return 0;
+#endif
 }
 
+int __real_io_setup(int maxevents, io_context_t *ctxp);
+
 int __wrap_io_setup(int maxevents, io_context_t *ctxp)
 {
 	ioctx_count++;
+#ifdef DIO_TEST_DEV
+	int ret = mock_type(int);
+	assert_int_equal(ret, __real_io_setup(maxevents, ctxp));
+	return ret;
+#else
 	return mock_type(int);
+#endif
 }
 
+int __real_io_destroy(io_context_t ctx);
+
 int __wrap_io_destroy(io_context_t ctx)
 {
 	ioctx_count--;
+#ifdef DIO_TEST_DEV
+	int ret = mock_type(int);
+	assert_int_equal(ret, __real_io_destroy(ctx));
+	return ret;
+#else
 	return mock_type(int);
+#endif
 }
 
+int __real_io_submit(io_context_t ctx, long nr, struct iocb *ios[]);
+
 int __wrap_io_submit(io_context_t ctx, long nr, struct iocb *ios[])
 {
+#ifdef DIO_TEST_DEV
+	struct timespec dev_delay = { .tv_nsec = 100000 };
+	int ret = mock_type(int);
+	assert_int_equal(ret, __real_io_submit(ctx, nr, ios));
+	nanosleep(&dev_delay, NULL);
+	return ret;
+#else
 	return mock_type(int);
+#endif
 }
 
+int __real_io_cancel(io_context_t ctx, struct iocb *iocb, struct io_event *evt);
+
 int __wrap_io_cancel(io_context_t ctx, struct iocb *iocb, struct io_event *evt)
 {
+#ifdef DIO_TEST_DEV
+	mock_type(int);
+	return __real_io_cancel(ctx, iocb, evt);
+#else
 	return mock_type(int);
+#endif
 }
 
+int __real_io_getevents(io_context_t ctx, long min_nr, long nr,
+			struct io_event *events, struct timespec *timeout);
+
 int __wrap_io_getevents(io_context_t ctx, long min_nr, long nr,
 			struct io_event *events, struct timespec *timeout)
 {
-	int i, nr_evs;
+	int nr_evs;
+#ifndef DIO_TEST_DEV
 	struct timespec *sleep_tmo;
+	int i;
 	struct io_event *evs;
+#endif
 
 	assert_non_null(timeout);
 	nr_evs = mock_type(int);
 	assert_true(nr_evs <= nr);
 	if (!nr_evs)
 		return 0;
+#ifdef DIO_TEST_DEV
+	mock_ptr_type(struct timespec *);
+	mock_ptr_type(struct io_event *);
+	assert_int_equal(nr_evs, __real_io_getevents(ctx, min_nr, nr_evs,
+						     events, timeout));
+#else
 	sleep_tmo = mock_ptr_type(struct timespec *);
 	if (sleep_tmo) {
 		if (sleep_tmo->tv_sec < 0)
@@ -109,6 +173,7 @@ int __wrap_io_getevents(io_context_t ctx, long min_nr, long nr,
 	evs = mock_ptr_type(struct io_event *);
 	for (i = 0; i < nr_evs; i++)
 		events[i] = evs[i];
+#endif
 	ev_off -= nr_evs;
 	return nr_evs;
 }
@@ -181,7 +246,10 @@ static void do_libcheck_init(struct checker *c, int blocksize,
 	assert_non_null(ct->req);
 	if (req)
 		*req = ct->req;
+#ifndef DIO_TEST_DEV
+	/* don't check fake blocksize on real devices */
 	assert_int_equal(ct->req->blksize, blocksize);
+#endif
 }
 
 static int is_checker_running(struct checker *c)
@@ -359,6 +427,11 @@ static void test_check_state_timeout(void **state)
 	will_return(__wrap_io_cancel, 0);
 	do_check_state(&c, 1, 30, PATH_DOWN);
 	check_aio_grp(aio_grp, 1, 0);
+#ifdef DIO_TEST_DEV
+	/* io_cancel will return negative value on timeout, so it happens again
+	 * when freeing the checker */
+	will_return(__wrap_io_cancel, 0);
+#endif
 	libcheck_free(&c);
 	do_libcheck_unload(1);
 }
@@ -382,6 +455,9 @@ static void test_check_state_async_timeout(void **state)
 	will_return(__wrap_io_cancel, 0);
 	do_check_state(&c, 0, 3, PATH_DOWN);
 	check_aio_grp(aio_grp, 1, 0);
+#ifdef DIO_TEST_DEV
+	will_return(__wrap_io_cancel, 0);
+#endif
 	libcheck_free(&c);
 	do_libcheck_unload(1);
 }
@@ -410,7 +486,11 @@ static void test_free_with_pending(void **state)
 	check_aio_grp(aio_grp, 1, 0);
         will_return(__wrap_io_cancel, 0);
         libcheck_free(&c[1]);
+#ifdef DIO_TEST_DEV
+	check_aio_grp(aio_grp, 1, 1); /* real cancel doesn't remove request */
+#else
         check_aio_grp(aio_grp, 0, 0);
+#endif
         do_libcheck_unload(1);
 }
 
@@ -475,7 +555,8 @@ static void test_timeout_cancel_failed(void **state)
 	will_return(__wrap_io_cancel, -1);
 	do_check_state(&c[0], 1, 30, PATH_DOWN);
 	assert_true(is_checker_running(&c[0]));
-	return_io_getevents_nr(NULL, 2, reqs, res);
+	return_io_getevents_nr(NULL, 1, &reqs[0], &res[0]);
+	return_io_getevents_nr(NULL, 1, &reqs[1], &res[1]);
 	do_check_state(&c[1], 1, 30, PATH_UP);
 	do_check_state(&c[0], 1, 30, PATH_UP);
 	for (i = 0; i < 2; i++) {
@@ -508,8 +589,11 @@ static void test_async_timeout_cancel_failed(void **state)
 	return_io_getevents_none();
 	will_return(__wrap_io_cancel, -1);
 	do_check_state(&c[0], 0, 2, PATH_DOWN);
+#ifndef DIO_TEST_DEV
+	/* can't pick which even gets returned on real devices */
 	return_io_getevents_nr(NULL, 1, &reqs[1], &res[1]);
 	do_check_state(&c[1], 0, 2, PATH_UP);
+#endif
 	return_io_getevents_none();
 	will_return(__wrap_io_cancel, -1);
 	do_check_state(&c[0], 0, 2, PATH_DOWN);
@@ -625,7 +709,12 @@ static void test_check_state_blksize(void **state)
 	int blksize[] = {4096, 1024, 512};
 	struct async_req *reqs[3];
 	int res[] = {0,1,0};
+#ifdef DIO_TEST_DEV
+	/* can't pick event return state on real devices */
+	int chk_state[] = {PATH_UP, PATH_UP, PATH_UP};
+#else
 	int chk_state[] = {PATH_UP, PATH_DOWN, PATH_UP};
+#endif
 
 	do_libcheck_load();
 	for (i = 0; i < 3; i++)
@@ -671,6 +760,25 @@ static void test_check_state_async(void **state)
 	do_libcheck_unload(1);
 }
 
+static int setup(void **state)
+{
+#ifdef DIO_TEST_DEV
+	test_fd = open(DIO_TEST_DEV, O_RDONLY);
+	if (test_fd < 0)
+		fail_msg("cannot open %s: %m", DIO_TEST_DEV);
+#endif
+	return 0;
+}
+
+static int teardown(void **state)
+{
+#ifdef DIO_TEST_DEV
+	assert_true(test_fd > 0);
+	assert_int_equal(close(test_fd), 0);
+#endif
+	return 0;
+}
+
 int test_directio(void)
 {
 	const struct CMUnitTest tests[] = {
@@ -691,7 +799,7 @@ int test_directio(void)
 		cmocka_unit_test(test_orphaned_aio_group),
 	};
 
-	return cmocka_run_group_tests(tests, NULL, NULL);
+	return cmocka_run_group_tests(tests, setup, teardown);
 }
 
 int main(void)
diff --git a/tests/directio_test_dev b/tests/directio_test_dev
new file mode 100644
index 00000000..d64e6238
--- /dev/null
+++ b/tests/directio_test_dev
@@ -0,0 +1,4 @@
+# To run the directio tests on an actual block device, uncomment the line
+# starting with DIO_TES_DEV, and set it to the appropriate device
+
+# DIO_TEST_DEV=/dev/sdb
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

