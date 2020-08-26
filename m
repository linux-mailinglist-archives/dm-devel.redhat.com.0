Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6C102252AFB
	for <lists+dm-devel@lfdr.de>; Wed, 26 Aug 2020 12:00:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-6toufn2MPYGtUCmhm-sslA-1; Wed, 26 Aug 2020 06:00:33 -0400
X-MC-Unique: 6toufn2MPYGtUCmhm-sslA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C5F481CBF1;
	Wed, 26 Aug 2020 10:00:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 164235C1BB;
	Wed, 26 Aug 2020 10:00:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA379181A06C;
	Wed, 26 Aug 2020 10:00:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QA02X8032504 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 06:00:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 378D41111428; Wed, 26 Aug 2020 10:00:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 301D6114B9BA
	for <dm-devel@redhat.com>; Wed, 26 Aug 2020 09:59:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3762803CBA
	for <dm-devel@redhat.com>; Wed, 26 Aug 2020 09:59:51 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-558-Vnex_UTFNV-u6byMalxiVA-1;
	Wed, 26 Aug 2020 05:59:49 -0400
X-MC-Unique: Vnex_UTFNV-u6byMalxiVA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 17484AC98;
	Wed, 26 Aug 2020 10:00:19 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 26 Aug 2020 11:58:59 +0200
Message-Id: <20200826095907.5576-3-mwilck@suse.com>
In-Reply-To: <20200826095907.5576-1-mwilck@suse.com>
References: <20200826095907.5576-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07QA02X8032504
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 02/10] multipath-tools: Makefile: add
	"valgrind-test" target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The new target "valgrind-test" (or "valgrind" in the tests/
subdirectory) allows running the unit tests under valgrind.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile        |  3 +++
 tests/Makefile  | 13 +++++++++++--
 tests/README.md |  8 ++++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 8bcaba6..4a3491d 100644
--- a/Makefile
+++ b/Makefile
@@ -52,6 +52,9 @@ uninstall: $(BUILDDIRS:=.uninstall)
 test:	all
 	$(MAKE) -C tests
 
+valgrind-test:	all
+	$(MAKE) -C tests valgrind
+
 .PHONY:	TAGS
 TAGS:
 	etags -a libmultipath/*.c
diff --git a/tests/Makefile b/tests/Makefile
index 5f00a3a..502377f 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -19,6 +19,7 @@ TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy \
 .PRECIOUS: $(TESTS:%=%-test)
 
 all:	$(TESTS:%=%.out)
+valgrind:	$(TESTS:%=%.vgr)
 
 # test-specific compiler flags
 # XYZ-test_FLAGS: Additional compiler flags for this test
@@ -68,12 +69,20 @@ lib/libchecktur.so:
 	@echo == running $< ==
 	@LD_LIBRARY_PATH=$(multipathdir):$(mpathcmddir) ./$< >$@
 
+%.vgr:  %-test lib/libchecktur.so
+	@echo == running valgrind for $< ==
+	@LD_LIBRARY_PATH=$(multipathdir):$(mpathcmddir) \
+		valgrind --leak-check=full --error-exitcode=128 ./$< >$@ 2>&1
+
 OBJS = $(TESTS:%=%.o) test-lib.o
 
 test_clean:
-	$(RM) $(TESTS:%=%.out)
+	$(RM) $(TESTS:%=%.out) $(TESTS:%=%.vgr)
+
+valgrind_clean:
+	$(RM) $(TESTS:%=%.vgr)
 
-clean: test_clean dep_clean
+clean: test_clean valgrind_clean dep_clean
 	$(RM) $(TESTS:%=%-test) $(OBJS) *.o.wrap
 	$(RM) -rf lib
 
diff --git a/tests/README.md b/tests/README.md
index 6438a82..6e7ad40 100644
--- a/tests/README.md
+++ b/tests/README.md
@@ -5,6 +5,14 @@ or simply `make` in the `tests` subdirectory. The test output is saved as
 `<testname>.out`. The test programs are called `<testname>-test`, and can
 be run standalone e.g. for debugging purposes.
 
+## Running tests under valgrind
+
+The unit tests can be run under the valgrind debugger with `make valgrind`
+in the `tests` directory, or `make valgrind-test` in the top directory.
+If valgrind detects a bad memory access or leak, the test will fail. The
+output of the test run, including valgrind output, is stored as
+`<testname>.vgr`.
+
 ## Notes on individual tests
 
 ### Tests that require root permissions
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

