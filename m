Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B3CD11CEF2C
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 10:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589272301;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A7VWlUD9pPFq5Hm8AustXNx/IKji67pr6Uhjlc4MBiE=;
	b=DIvQAzxbCIpqeAE5nXI1uFJnob6Aka+h+NmXfrXUZxQrqwk835Cytt3Ff6c5/Gfynr/C0H
	Q/0rMKFXh7A1t/jg2OUD4DA07ewl7IX1Ws3TvfvpDz/ezYwMLzp6pKYyjHuhbaoosJqd3n
	i0mCUlMUk/Jrr9hlEz7oS5Fyokbvs0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-O9iho5ZEPXeoPsY8AVYa6A-1; Tue, 12 May 2020 04:31:36 -0400
X-MC-Unique: O9iho5ZEPXeoPsY8AVYa6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7BEE8018AB;
	Tue, 12 May 2020 08:31:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E36EF5D9E5;
	Tue, 12 May 2020 08:31:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 981AF4CAA7;
	Tue, 12 May 2020 08:31:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BA9qJM011665 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 06:09:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B96A82156A3B; Mon, 11 May 2020 10:09:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4F2C2156A22
	for <dm-devel@redhat.com>; Mon, 11 May 2020 10:09:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4784186E3A1
	for <dm-devel@redhat.com>; Mon, 11 May 2020 10:09:49 +0000 (UTC)
Received: from smtp.gentoo.org (smtp.gentoo.org [140.211.166.183]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-372-a6iJLDKJPgaUbQx-vCL5mQ-1; Mon, 11 May 2020 06:09:46 -0400
X-MC-Unique: a6iJLDKJPgaUbQx-vCL5mQ-1
From: Lars Wendler <polynomial-c@gentoo.org>
To: dm-devel@redhat.com
Date: Mon, 11 May 2020 12:09:12 +0200
Message-Id: <20200511100911.3561-1-polynomial-c@gentoo.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BA9qJM011665
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 12 May 2020 04:31:05 -0400
Cc: Lars Wendler <polynomial-c@gentoo.org>
Subject: [dm-devel] [PATCH] (resent) multipath-tools: Fix parallel make
	issues
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

build is broken like this (tested with -j16):

  x86_64-pc-linux-gnu-gcc -Wl,-O1 -Wl,--hash-style=gnu -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -shared -lpthread -ldevmapper -ldl -L../libmultipath -lmultipath -L../libmpathcmd -lmpathcmd -Wl,-soname=libmpathpersist.so.0 -o libmpathpersist.so.0 mpath_persist.o mpath_updatepr.o mpath_pr_ioctl.o
  building defaults.o because of defaults.c
  ...
  /usr/lib/gcc/x86_64-pc-linux-gnu/9.3.0/../../../../x86_64-pc-linux-gnu/bin/ld: cannot find -lmultipath
  collect2: error: ld returned 1 exit status
  make[1]: *** [Makefile:17: libmpathpersist.so.0] Error 1
  make: *** [Makefile:29: libmpathpersist] Error 2
  make: *** Waiting for unfinished jobs....

install is broken like this:

  install -m 755 libprio*.so /var/tmp/portage/sys-fs/multipath-tools-0.8.4/image/lib64/multipath
  install -m 755 libcheckcciss_tur.so libcheckreadsector0.so libchecktur.so libcheckdirectio.so libcheckemc_clariion.so libcheckhp_sw.so libcheckrdac.so /var/tmp/portage/sys-fs/multipath-tools-0.8.4/image/lib64/multipath
  ...
  /usr/bin/install: target '/var/tmp/portage/sys-fs/multipath-tools-0.8.4/image/lib64/multipath' is not a directory
  /usr/bin/install: target '/var/tmp/portage/sys-fs/multipath-tools-0.8.4/image/lib64/multipath' is not a directory
  make[1]: *** [Makefile:28: install] Error 1
  make[1]: *** [Makefile:38: install] Error 1
---
 Makefile                           | 3 ++-
 libmultipath/checkers/Makefile     | 1 +
 libmultipath/foreign/Makefile      | 1 +
 libmultipath/prioritizers/Makefile | 1 +
 4 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1dee3680..a9ade94f 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,8 @@ $(BUILDDIRS):
 	$(MAKE) -C $@
 
 multipath multipathd mpathpersist: libmultipath
-mpathpersist:  libmpathpersist
+libmpathpersist: libmultipath
+mpathpersist:  libmultipath libmpathpersist
 
 $(BUILDDIRS.clean):
 	$(MAKE) -C ${@:.clean=} clean
diff --git a/libmultipath/checkers/Makefile b/libmultipath/checkers/Makefile
index 02caea64..f201ca4c 100644
--- a/libmultipath/checkers/Makefile
+++ b/libmultipath/checkers/Makefile
@@ -24,6 +24,7 @@ libcheck%.so: libsg.o %.o
 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
 
 install:
+	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(libdir)
 	$(INSTALL_PROGRAM) -m 755 $(LIBS) $(DESTDIR)$(libdir)
 
 uninstall:
diff --git a/libmultipath/foreign/Makefile b/libmultipath/foreign/Makefile
index fae58a0d..567deebd 100644
--- a/libmultipath/foreign/Makefile
+++ b/libmultipath/foreign/Makefile
@@ -14,6 +14,7 @@ libforeign-%.so: %.o
 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
 
 install:
+	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(libdir)
 	$(INSTALL_PROGRAM) -m 755 $(LIBS) $(DESTDIR)$(libdir)
 
 uninstall:
diff --git a/libmultipath/prioritizers/Makefile b/libmultipath/prioritizers/Makefile
index 9d0fe03c..b0b0b522 100644
--- a/libmultipath/prioritizers/Makefile
+++ b/libmultipath/prioritizers/Makefile
@@ -35,6 +35,7 @@ libprio%.so: %.o
 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
 
 install: $(LIBS)
+	$(INSTALL_PROGRAM) -m 755 -d $(DESTDIR)$(libdir)
 	$(INSTALL_PROGRAM) -m 755 libprio*.so $(DESTDIR)$(libdir)
 
 uninstall:
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

