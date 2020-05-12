Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8401CFF80
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 22:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589315981;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O/0oULesjlYWn0iNm5H8aqPiqXFhE1J508OFADPFaVY=;
	b=F4v+qcEzTLIfTihfojMJa9IdZMd8q6q98geh4lvY6BheVz0Lmo4aqDcNM79YSTp4r2vaZs
	DjQVMElQRTN4avjnF37Z1LldwcJIZ+rUp16yn80JqtQ6LrGKKzhk0O7nrWZghtg3Et+WGS
	45ECEJsv52d95hafCJnv1nI13pznc4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-OadRl3BBM8aspUqd5v5G8A-1; Tue, 12 May 2020 16:39:38 -0400
X-MC-Unique: OadRl3BBM8aspUqd5v5G8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F191801503;
	Tue, 12 May 2020 20:39:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AA177D8F1;
	Tue, 12 May 2020 20:39:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D9294CAA0;
	Tue, 12 May 2020 20:39:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04CKd0BV018764 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 May 2020 16:39:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD975110E86; Tue, 12 May 2020 20:39:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F1D110E87
	for <dm-devel@redhat.com>; Tue, 12 May 2020 20:38:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B291916106
	for <dm-devel@redhat.com>; Tue, 12 May 2020 20:38:55 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-426-xITpwm3XMMyME_3tMRGa2Q-1;
	Tue, 12 May 2020 16:38:52 -0400
X-MC-Unique: xITpwm3XMMyME_3tMRGa2Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 81450ACFE;
	Tue, 12 May 2020 20:38:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 22:38:21 +0200
Message-Id: <20200512203822.18910-2-mwilck@suse.com>
In-Reply-To: <20200512203822.18910-1-mwilck@suse.com>
References: <20200512203822.18910-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04CKd0BV018764
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 1/2] libmultipath: move libsg into libmultipath
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

sg_read() is called from readsector0 and emc_clariion. Move it
to libmultipath/, where all common code resides.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/Makefile               | 3 ++-
 libmultipath/checkers/Makefile      | 6 +++---
 libmultipath/{checkers => }/libsg.c | 0
 libmultipath/{checkers => }/libsg.h | 0
 libmultipath/prioritizers/Makefile  | 2 +-
 5 files changed, 6 insertions(+), 5 deletions(-)
 rename libmultipath/{checkers => }/libsg.c (100%)
 rename libmultipath/{checkers => }/libsg.h (100%)

diff --git a/libmultipath/Makefile b/libmultipath/Makefile
index ad690a49..f19b7ad2 100644
--- a/libmultipath/Makefile
+++ b/libmultipath/Makefile
@@ -47,7 +47,8 @@ OBJS = memory.o parser.o vector.o devmapper.o callout.o \
 	switchgroup.o uxsock.o print.o alias.o log_pthread.o \
 	log.o configure.o structs_vec.o sysfs.o prio.o checkers.o \
 	lock.o file.o wwids.o prioritizers/alua_rtpg.o prkey.o \
-	io_err_stat.o dm-generic.o generic.o foreign.o nvme-lib.o
+	io_err_stat.o dm-generic.o generic.o foreign.o nvme-lib.o \
+	libsg.o
 
 all: $(LIBS)
 
diff --git a/libmultipath/checkers/Makefile b/libmultipath/checkers/Makefile
index 02caea64..01c04510 100644
--- a/libmultipath/checkers/Makefile
+++ b/libmultipath/checkers/Makefile
@@ -17,10 +17,10 @@ LIBS= \
 
 all: $(LIBS)
 
-libcheckdirectio.so: libsg.o directio.o
+libcheckdirectio.so: directio.o
 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^ -laio
 
-libcheck%.so: libsg.o %.o
+libcheck%.so: %.o
 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
 
 install:
@@ -32,7 +32,7 @@ uninstall:
 clean: dep_clean
 	$(RM) core *.a *.o *.gz *.so
 
-OBJS := $(LIBS:libcheck%.so=%.o) libsg.o directio.o
+OBJS := $(LIBS:libcheck%.so=%.o)
 .SECONDARY: $(OBJS)
 
 include $(wildcard $(OBJS:.o=.d))
diff --git a/libmultipath/checkers/libsg.c b/libmultipath/libsg.c
similarity index 100%
rename from libmultipath/checkers/libsg.c
rename to libmultipath/libsg.c
diff --git a/libmultipath/checkers/libsg.h b/libmultipath/libsg.h
similarity index 100%
rename from libmultipath/checkers/libsg.h
rename to libmultipath/libsg.h
diff --git a/libmultipath/prioritizers/Makefile b/libmultipath/prioritizers/Makefile
index 9d0fe03c..fc6e0e0c 100644
--- a/libmultipath/prioritizers/Makefile
+++ b/libmultipath/prioritizers/Makefile
@@ -28,7 +28,7 @@ endif
 
 all: $(LIBS)
 
-libpriopath_latency.so: path_latency.o  ../checkers/libsg.o
+libpriopath_latency.so: path_latency.o
 	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^ -lm
 
 libprio%.so: %.o
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

