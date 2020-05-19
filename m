Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C45001D9D88
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 19:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589908174;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dbo9sBCLG23y2wlS24QM5oDDZGwR0IlqFKbtooaH3lE=;
	b=g1gDIRTWwjfxMqCunAsHE+Ch5MPDM6pwnsxO3GV2p10FEt3SbAl9enSUhfTmbJFlflpddJ
	hQk/O5EyxVhrUHDuNyr2YaEpvDCWaSLxnazfD/Wlefup7A3zv2Q0MjhtMTXdoQmbG/7geg
	GPcRmWF9PWHYhtLt00lY2WMzmuLIJzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-9kITRsa0NquK-E2E5VC5Bw-1; Tue, 19 May 2020 13:09:32 -0400
X-MC-Unique: 9kITRsa0NquK-E2E5VC5Bw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 406F7872FED;
	Tue, 19 May 2020 17:09:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A47210013D9;
	Tue, 19 May 2020 17:09:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CED524ED88;
	Tue, 19 May 2020 17:09:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JH8pZh011715 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 13:08:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B3B6C100239B; Tue, 19 May 2020 17:08:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D33E110013D9;
	Tue, 19 May 2020 17:08:48 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04JH8lUg007498; 
	Tue, 19 May 2020 12:08:47 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04JH8lDL007497;
	Tue, 19 May 2020 12:08:47 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 19 May 2020 12:08:40 -0500
Message-Id: <1589908125-7456-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1589908125-7456-1-git-send-email-bmarzins@redhat.com>
References: <1589908125-7456-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 1/6] libmultipath: make libmp_dm_init optional
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Reviewed-by: Martin Wilck <mwilck@suse.com>
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

