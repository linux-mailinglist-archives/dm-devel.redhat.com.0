Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A281D277292
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:37:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-0rc0_Q_3MMGklTNnnkBjAg-1; Thu, 24 Sep 2020 09:37:43 -0400
X-MC-Unique: 0rc0_Q_3MMGklTNnnkBjAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ACD5107465F;
	Thu, 24 Sep 2020 13:37:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 594AC702E7;
	Thu, 24 Sep 2020 13:37:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F5DE181A88C;
	Thu, 24 Sep 2020 13:37:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODbHn6025501 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:37:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B9C510AF9D3; Thu, 24 Sep 2020 13:37:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93D0B11921BD
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F36B858290
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:12 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-527-Ns9UWfSRM7WSTZN7Yixy9g-1;
	Thu, 24 Sep 2020 09:37:09 -0400
X-MC-Unique: Ns9UWfSRM7WSTZN7Yixy9g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C55E4B126;
	Thu, 24 Sep 2020 13:37:06 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:36:41 +0200
Message-Id: <20200924133644.14034-9-mwilck@suse.com>
In-Reply-To: <20200924133644.14034-1-mwilck@suse.com>
References: <20200924133644.14034-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODbHn6025501
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 08/11] libmultipath: create separate .so for unit
	tests
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The unit tests use a lot of internal symbols that we don't want
to add to the ABI if we don't have to. As long as we don't
have to make incompatible changes to functions, we can work around
that by simply using a non-versioned library for the unit tests.
Therefore we add a seperate rule here. Do this before actually
adding a version script, to avoid breakage during bisection.
---
 libmultipath/Makefile |  7 +++++++
 tests/Makefile        | 10 ++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/libmultipath/Makefile b/libmultipath/Makefile
index af5bb77..cf13561 100644
--- a/libmultipath/Makefile
+++ b/libmultipath/Makefile
@@ -74,6 +74,13 @@ $(LIBS): $(OBJS)
 $(DEVLIB): $(LIBS)
 	$(LN) $(LIBS) $@
 
+../tests/$(LIBS): $(OBJS) $(VERSION_SCRIPT)
+	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=`basename $@` \
+		-o $@ $(OBJS) $(LIBDEPS)
+	$(LN) $@ ${@:.so.0=.so}
+
+test-lib:	../tests/$(LIBS)
+
 install: all
 	$(INSTALL_PROGRAM) -d $(DESTDIR)$(syslibdir)
 	$(INSTALL_PROGRAM) -m 755 $(LIBS) $(DESTDIR)$(syslibdir)/$(LIBS)
diff --git a/tests/Makefile b/tests/Makefile
index 502377f..47e6b86 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -10,7 +10,7 @@ W_MISSING_INITIALIZERS := $(call TEST_MISSING_INITIALIZERS)
 
 CFLAGS += $(BIN_CFLAGS) -I$(multipathdir) -I$(mpathcmddir) \
 	-Wno-unused-parameter $(W_MISSING_INITIALIZERS)
-LIBDEPS += -L$(multipathdir) -L$(mpathcmddir) -lmultipath -lmpathcmd -lcmocka
+LIBDEPS += -L. -L$(mpathcmddir) -lmultipath -lmpathcmd -lcmocka
 
 TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy \
 	 alias directio valid devt
@@ -67,7 +67,7 @@ lib/libchecktur.so:
 
 %.out:	%-test lib/libchecktur.so
 	@echo == running $< ==
-	@LD_LIBRARY_PATH=$(multipathdir):$(mpathcmddir) ./$< >$@
+	@LD_LIBRARY_PATH=.:$(mpathcmddir) ./$< >$@
 
 %.vgr:  %-test lib/libchecktur.so
 	@echo == running valgrind for $< ==
@@ -77,7 +77,7 @@ lib/libchecktur.so:
 OBJS = $(TESTS:%=%.o) test-lib.o
 
 test_clean:
-	$(RM) $(TESTS:%=%.out) $(TESTS:%=%.vgr)
+	$(RM) $(TESTS:%=%.out) $(TESTS:%=%.vgr) *.so.*
 
 valgrind_clean:
 	$(RM) $(TESTS:%=%.vgr)
@@ -97,12 +97,14 @@ dep_clean:
 	@sed -n 's/^.*__wrap_\([a-zA-Z0-9_]*\).*$$/-Wl,--wrap=\1/p' $< | \
 		sort -u | tr '\n' ' ' >$@
 
+libmultipath.so.0:
+	$(MAKE) -C $(multipathdir) test-lib
 
 # COLON will get expanded during second expansion below
 COLON:=:
 .SECONDEXPANSION:
 %-test:	%.o %.o.wrap $$($$@_OBJDEPS) $$($$@_TESTDEPS) $$($$@_TESTDEPS$$(COLON).o=.o.wrap) \
-		$(multipathdir)/libmultipath.so Makefile
+		libmultipath.so.0 Makefile
 	$(CC) $(CFLAGS) -o $@ $(LDFLAGS) $< $($@_TESTDEPS) $($@_OBJDEPS) \
 		$(LIBDEPS) $($@_LIBDEPS) \
 		$(shell cat $<.wrap) $(foreach dep,$($@_TESTDEPS),$(shell cat $(dep).wrap))
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

