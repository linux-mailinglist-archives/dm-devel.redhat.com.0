Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 622D01766C5
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 23:21:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583187681;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TGB46RmOzZhO1cPPqEb7V06Ce+Q7r4rbWb5qPmviQe4=;
	b=E35pPlLK9C9GuMRtoCqh7LawVm9Bc8VbcGQzS76I5fv1AMhc4JjlE+kRUvAAN+4tqnyYP0
	SzPJsUO8tQi4V8LYCpNttla8j2Ir+LddXVPsv1aziiX8A/XBCAU1RkP5yPHF0vTXzeIxwE
	F+tRIE0MJlBxygIgrpqT2qn7LSKh5p0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-JNfcZK6OMdqhL_jnCSrxXA-1; Mon, 02 Mar 2020 17:21:18 -0500
X-MC-Unique: JNfcZK6OMdqhL_jnCSrxXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8A3018C8C11;
	Mon,  2 Mar 2020 22:21:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7280A9CA3;
	Mon,  2 Mar 2020 22:21:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E87884499;
	Mon,  2 Mar 2020 22:21:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022MKwqv003565 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 17:20:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D4AA3D95E0; Mon,  2 Mar 2020 22:20:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E6EDBF26
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 719FE800296
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-90-JwfOYvdvP02gP8sN_OLH3w-1;
	Mon, 02 Mar 2020 17:20:55 -0500
X-MC-Unique: JwfOYvdvP02gP8sN_OLH3w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E89DEB33B;
	Mon,  2 Mar 2020 22:20:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon,  2 Mar 2020 23:20:25 +0100
Message-Id: <20200302222025.21022-5-mwilck@suse.com>
In-Reply-To: <20200302222025.21022-1-mwilck@suse.com>
References: <20200302222025.21022-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022MKwqv003565
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 4/4] tests: add README.md
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Add a README explaining how to run the tests, and some of less obvious
stuff in the Makefile.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/README.md | 72 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 tests/README.md

diff --git a/tests/README.md b/tests/README.md
new file mode 100644
index 00000000..6438a828
--- /dev/null
+++ b/tests/README.md
@@ -0,0 +1,72 @@
+# multipath-tools unit tests
+
+Unit tests are built and run by running `make test` in the top directory,
+or simply `make` in the `tests` subdirectory. The test output is saved as
+`<testname>.out`. The test programs are called `<testname>-test`, and can
+be run standalone e.g. for debugging purposes.
+
+## Notes on individual tests
+
+### Tests that require root permissions
+
+The following tests must be run as root, otherwise some test items will be
+skipped because of missing permissions, or the test will fail outright:
+
+ * `dmevents`
+ * `directio` (if `DIO_TEST_DEV` is set, see below)
+
+To run these tests, after building the tests as non-root user, change to the
+`tests` directory and run `make test-clean`; then run `make` again as root.
+
+### directio test
+
+This test includes test items that require a access to a block device. The
+device will be opened in read-only mode; you don't need to worry about data
+loss. However, the user needs to specify a device to be used. Set the
+environment variable `DIO_TEST_DEV` to the path of the device.
+Alternatively, create a file `directio_test_dev` under
+the `tests` directory containting a single line that sets this environment
+variable in Bourne Shell syntax, like this:
+
+    DIO_TEST_DEV=/dev/sdc3
+
+After that, run `make directio.out` as root in the `tests` directory to
+perform the test.
+
+## Adding tests
+
+The unit tests are based on the [cmocka test framework](https://cmocka.org/),
+and make use of cmocka's "mock objects" feature to simulate how the code behaves
+for different input values. cmocka achieves this by modifying the symbol
+lookup at link time, substituting "wrapper functions" for the originally
+called function. The Makefile contains code to make sure that `__wrap_xyz()`
+wrapper functions are automatically passed to the linker with matching
+`-Wl,--wrap` command line arguments, so that tests are correctly rebuilt if
+wrapper functions are added or removed.
+
+### Making sure symbol wrapping works: OBJDEPS
+
+Special care must be taken to wrap function calls inside a library. Suppose you want
+to wrap a function which is both defined in libmultipath and called from other
+functions in libmultipath, such as `checker_check()`. When `libmultipath.so` is
+created, the linker resolves calls to `checker_check()` inside the `.so`
+file. When later the test executable is built by linking the test object file with
+`libmultipath.so`, these calls can't be wrapped any more, because they've
+already been resolved, and wrapping works only for *unresolved* symbols.
+Therefore, object files from libraries that contain calls to functions
+which need to be wrapped must be explicitly listed on the linker command line
+in order to make the wrapping work. To enforce this, add these object files to
+the `xyz-test_OBJDEPS` variable in the Makefile.
+
+### Using wrapper function libraries: TESTDEPS
+
+Some wrapper functions are useful in multiple tests. These are maintained in
+separate input files, such as `test-lib.c` or `test-log.c`. List these files
+in the `xyz-test_TESTDEPS` variable for your test program if you need these
+wrappers.
+
+### Specifying library dependencies: LIBDEPS
+
+In order to keep the tests lean, not all libraries that libmultipath
+normally pulls in are used for every test. Add libraries you need (such as
+`-lpthread`) to the `xyz-test_LIBDEPS` variable.
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

