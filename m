Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7F87F277290
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:37:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-OEq5R3_RN_yKYrPuRFJ9BA-1; Thu, 24 Sep 2020 09:37:38 -0400
X-MC-Unique: OEq5R3_RN_yKYrPuRFJ9BA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97CA881F02E;
	Thu, 24 Sep 2020 13:37:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74C4A55788;
	Thu, 24 Sep 2020 13:37:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E3B4181A884;
	Thu, 24 Sep 2020 13:37:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODbEnW025473 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:37:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0A2A2166BB3; Thu, 24 Sep 2020 13:37:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B5C52166B27
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8296E1021F84
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:14 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-216-6JqQ5eCBNFOlcFJE88aSlA-1;
	Thu, 24 Sep 2020 09:37:09 -0400
X-MC-Unique: 6JqQ5eCBNFOlcFJE88aSlA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 438ECB118;
	Thu, 24 Sep 2020 13:37:07 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:36:43 +0200
Message-Id: <20200924133644.14034-11-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODbEnW025473
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 10/11] libmpathpersist: add linker version script
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This defines the ABI of libmpathpersist in the current state.
---
 libmpathpersist/Makefile                |  6 ++++--
 libmpathpersist/libmpathpersist.version | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 libmpathpersist/libmpathpersist.version

diff --git a/libmpathpersist/Makefile b/libmpathpersist/Makefile
index 9e869fd..456ce4c 100644
--- a/libmpathpersist/Makefile
+++ b/libmpathpersist/Makefile
@@ -3,6 +3,7 @@ include ../Makefile.inc
 SONAME = 0
 DEVLIB = libmpathpersist.so
 LIBS = $(DEVLIB).$(SONAME)
+VERSION_SCRIPT := libmpathpersist.version
 
 CFLAGS += $(LIB_CFLAGS) -I$(multipathdir) -I$(mpathpersistdir) -I$(mpathcmddir)
 
@@ -13,8 +14,9 @@ OBJS = mpath_persist.o mpath_updatepr.o mpath_pr_ioctl.o
 
 all: $(DEVLIB) man
 
-$(LIBS): $(OBJS)
-	$(CC) $(LDFLAGS) $(SHARED_FLAGS) $(LIBDEPS) -Wl,-soname=$@ -o $@ $(OBJS)
+$(LIBS): $(OBJS) $(VERSION_SCRIPT)
+	$(CC) $(LDFLAGS) $(SHARED_FLAGS) $(LIBDEPS) -Wl,-soname=$@ \
+		-Wl,--version-script=$(VERSION_SCRIPT) -o $@ $(OBJS)
 
 $(DEVLIB): $(LIBS)
 	$(LN) $(LIBS) $@
diff --git a/libmpathpersist/libmpathpersist.version b/libmpathpersist/libmpathpersist.version
new file mode 100644
index 0000000..1bb8212
--- /dev/null
+++ b/libmpathpersist/libmpathpersist.version
@@ -0,0 +1,20 @@
+LIBMPATHPERSIST_0.8.4.0 {
+global:
+
+	__mpath_persistent_reserve_in;
+	__mpath_persistent_reserve_out;
+	dumpHex;
+	mpath_alloc_prin_response;
+	mpath_lib_exit;
+	mpath_lib_init;
+	mpath_mx_alloc_len;
+	mpath_persistent_reserve_in;
+	mpath_persistent_reserve_init_vecs;
+	mpath_persistent_reserve_out;
+	mpath_persistent_reserve_free_vecs;
+	prin_do_scsi_ioctl;
+	prout_do_scsi_ioctl;
+	update_map_pr;
+
+local: *;
+};
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

