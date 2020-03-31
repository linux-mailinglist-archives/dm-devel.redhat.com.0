Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3951989C0
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 04:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585620094;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BWAhbAIeROYo4vBuhfMZlZ03drrROyYE7BZQi1Zhfjc=;
	b=XKTN96l3dD4Tzq13d7Bkg1dcO5ldV9xMnws6oDgPGHnO6Ph/yKI22hZFOrPP+3XC2/+KIc
	TjfH/bN1Amc6wA+pt4lAkbjd84KQtvOnkZdNi382sJXGJQ7zyrkGL/8973pvKXdeGFb4sP
	x+eYi5hhsD/vPtrMenn+ur+g+UEpB1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-czfe_XWJOvqnMM7o2oQKyQ-1; Mon, 30 Mar 2020 22:01:32 -0400
X-MC-Unique: czfe_XWJOvqnMM7o2oQKyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A34D8017CE;
	Tue, 31 Mar 2020 02:01:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9CBE50C01;
	Tue, 31 Mar 2020 02:01:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7153118089C8;
	Tue, 31 Mar 2020 02:01:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V211HV032317 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 22:01:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6CD2953D6; Tue, 31 Mar 2020 02:01:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 183E794B5F;
	Tue, 31 Mar 2020 02:00:59 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02V20vSw027158; 
	Mon, 30 Mar 2020 21:00:57 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02V20vCk027155;
	Mon, 30 Mar 2020 21:00:57 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 30 Mar 2020 21:00:53 -0500
Message-Id: <1585620055-27112-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
References: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [RFC Patch 1/3] libmultipath: make libmp_dm_init optional
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move dm_initialized out of libmp_dm_task_create(), and add
a function skip_libmp_dm_init() so that users of libmultipath can skip
initializing device-mapper. This is needed for other programs that
use libmultipath (or a library that depends on it) but want to control
how device-mapper is set up.

Also make dm_prereq a global function.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c | 17 +++++++++++++----
 libmultipath/devmapper.h |  3 ++-
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 13a1cf53..7ed494a1 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -33,6 +33,8 @@
 #define MAX_WAIT 5
 #define LOOPS_PER_SEC 5
 
+static pthread_once_t dm_initialized = PTHREAD_ONCE_INIT;
+
 static int dm_conf_verbosity;
 
 #ifdef LIBDM_API_DEFERRED
@@ -229,7 +231,7 @@ dm_tgt_prereq (unsigned int *ver)
 	return 1;
 }
 
-static int dm_prereq(unsigned int *v)
+int dm_prereq(unsigned int *v)
 {
 	if (dm_lib_prereq())
 		return 1;
@@ -243,7 +245,7 @@ void libmp_udev_set_sync_support(int on)
 	libmp_dm_udev_sync = !!on;
 }
 
-void libmp_dm_init(void)
+static void libmp_dm_init(void)
 {
 	struct config *conf;
 	int verbosity;
@@ -262,11 +264,18 @@ void libmp_dm_init(void)
 	dm_udev_set_sync_support(libmp_dm_udev_sync);
 }
 
+static void _do_skip_libmp_dm_init(void)
+{
+}
+
+void skip_libmp_dm_init(void)
+{
+	pthread_once(&dm_initialized, _do_skip_libmp_dm_init);
+}
+
 struct dm_task*
 libmp_dm_task_create(int task)
 {
-	static pthread_once_t dm_initialized = PTHREAD_ONCE_INIT;
-
 	pthread_once(&dm_initialized, libmp_dm_init);
 	return dm_task_create(task);
 }
diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
index 7557a86b..17fc9faf 100644
--- a/libmultipath/devmapper.h
+++ b/libmultipath/devmapper.h
@@ -28,7 +28,8 @@
 #define UUID_PREFIX_LEN (sizeof(UUID_PREFIX) - 1)
 
 void dm_init(int verbosity);
-void libmp_dm_init(void);
+int dm_prereq(unsigned int *v);
+void skip_libmp_dm_init(void);
 void libmp_udev_set_sync_support(int on);
 struct dm_task *libmp_dm_task_create(int task);
 int dm_drv_version (unsigned int * version);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

