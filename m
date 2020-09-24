Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 475F4277289
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:37:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-uBE2BmD1MXCUL_WPq54PMA-1; Thu, 24 Sep 2020 09:37:31 -0400
X-MC-Unique: uBE2BmD1MXCUL_WPq54PMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 453C01074659;
	Thu, 24 Sep 2020 13:37:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F8A1100238E;
	Thu, 24 Sep 2020 13:37:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8ADD181A884;
	Thu, 24 Sep 2020 13:37:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODbHEu025506 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:37:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C03F82028E91; Thu, 24 Sep 2020 13:37:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9BFF2026F94
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE318582A4
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:12 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-470-1I3WgiEoP02KnpHrWAaAVw-1;
	Thu, 24 Sep 2020 09:37:09 -0400
X-MC-Unique: 1I3WgiEoP02KnpHrWAaAVw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 76F22B127;
	Thu, 24 Sep 2020 13:37:07 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:36:44 +0200
Message-Id: <20200924133644.14034-12-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODbHEu025506
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 11/11] libmpathcmd: add linker version script
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

For completeness, this isn't really necessary.
---
 libmpathcmd/Makefile            |  6 ++++--
 libmpathcmd/libmpathcmd.version | 13 +++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 libmpathcmd/libmpathcmd.version

diff --git a/libmpathcmd/Makefile b/libmpathcmd/Makefile
index 08ccb81..2591019 100644
--- a/libmpathcmd/Makefile
+++ b/libmpathcmd/Makefile
@@ -3,6 +3,7 @@ include ../Makefile.inc
 SONAME = 0
 DEVLIB = libmpathcmd.so
 LIBS = $(DEVLIB).$(SONAME)
+VERSION_SCRIPT := libmpathcmd.version
 
 CFLAGS += $(LIB_CFLAGS)
 
@@ -10,8 +11,9 @@ OBJS = mpath_cmd.o
 
 all:	$(DEVLIB)
 
-$(LIBS): $(OBJS)
-	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ -o $@ $(OBJS) $(LIBDEPS)
+$(LIBS): $(OBJS) $(VERSION_SCRIPT)
+	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -Wl,-soname=$@ \
+		-Wl,--version-script=$(VERSION_SCRIPT) -o $@ $(OBJS) $(LIBDEPS)
 
 $(DEVLIB): $(LIBS)
 	$(LN) $(LIBS) $@
diff --git a/libmpathcmd/libmpathcmd.version b/libmpathcmd/libmpathcmd.version
new file mode 100644
index 0000000..5382a9a
--- /dev/null
+++ b/libmpathcmd/libmpathcmd.version
@@ -0,0 +1,13 @@
+LIBMPATHCMD_0.8.4.0 {
+global:
+	__mpath_connect;
+	mpath_connect;
+	mpath_disconnect;
+	mpath_process_cmd;
+	mpath_recv_reply;
+	mpath_recv_reply_len;
+	mpath_recv_reply_data;
+	mpath_send_cmd;
+local:
+	*;
+};
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

