Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEE834B156
	for <lists+dm-devel@lfdr.de>; Fri, 26 Mar 2021 22:30:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-20rJayaSMiGkoFgg11tGGw-1; Fri, 26 Mar 2021 17:30:34 -0400
X-MC-Unique: 20rJayaSMiGkoFgg11tGGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8F001084D6F;
	Fri, 26 Mar 2021 21:30:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F9876A039;
	Fri, 26 Mar 2021 21:30:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 414001809C84;
	Fri, 26 Mar 2021 21:30:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12QLU7UT001661 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 17:30:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B59B710545E4; Fri, 26 Mar 2021 21:30:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B146010545CF
	for <dm-devel@redhat.com>; Fri, 26 Mar 2021 21:30:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A9FA805B3B
	for <dm-devel@redhat.com>; Fri, 26 Mar 2021 21:30:05 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-450-szL3bEwVN2WBbSfGSmncPA-1;
	Fri, 26 Mar 2021 17:30:00 -0400
X-MC-Unique: szL3bEwVN2WBbSfGSmncPA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 52975ADD7;
	Fri, 26 Mar 2021 21:29:59 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 26 Mar 2021 22:29:39 +0100
Message-Id: <20210326212944.3136-3-mwilck@suse.com>
In-Reply-To: <20210326212944.3136-1-mwilck@suse.com>
References: <20210326212944.3136-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12QLU7UT001661
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 2/7] multipath-tools Makefiles: allow building
	test programs only
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

"make test" builds and runs test programs. For multiarch / cross-compilation
environments, it's useful to be able to separate these steps.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile       | 7 +++++--
 tests/Makefile | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index bddb2bf..c5bedcf 100644
--- a/Makefile
+++ b/Makefile
@@ -51,8 +51,11 @@ clean: $(BUILDDIRS.clean)
 install: $(BUILDDIRS:=.install)
 uninstall: $(BUILDDIRS:=.uninstall)
 
-test:	all
-	$(MAKE) -C tests
+test-progs:	all
+	$(MAKE) -C tests progs
+
+test:	test-progs
+	$(MAKE) -C tests all
 
 valgrind-test:	all
 	$(MAKE) -C tests valgrind
diff --git a/tests/Makefile b/tests/Makefile
index 11ca1be..e70c8ed 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -20,6 +20,7 @@ HELPERS := test-lib.o test-log.o
 .PRECIOUS: $(TESTS:%=%-test)
 
 all:	$(TESTS:%=%.out)
+progs:	$(TESTS:%=%-test) lib/libchecktur.so
 valgrind:	$(TESTS:%=%.vgr)
 
 # test-specific compiler flags
-- 
2.30.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

