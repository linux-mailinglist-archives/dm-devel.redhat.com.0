Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 35B872772FB
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:46:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-cICwLsXZN_21wCGOHQ5Uzg-1; Thu, 24 Sep 2020 09:46:17 -0400
X-MC-Unique: cICwLsXZN_21wCGOHQ5Uzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C849B1091095;
	Thu, 24 Sep 2020 13:46:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0DF260C15;
	Thu, 24 Sep 2020 13:46:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AD421826D2C;
	Thu, 24 Sep 2020 13:46:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODflbd026857 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D20B1006180; Thu, 24 Sep 2020 13:41:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7964E1009BAD
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61EDE811E82
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-566-zM3CflFYM3WJZbG-LjWGyw-1;
	Thu, 24 Sep 2020 09:41:42 -0400
X-MC-Unique: zM3CflFYM3WJZbG-LjWGyw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B00EAB12F;
	Thu, 24 Sep 2020 13:41:40 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:45 +0200
Message-Id: <20200924134054.14632-15-mwilck@suse.com>
In-Reply-To: <20200924134054.14632-1-mwilck@suse.com>
References: <20200924134054.14632-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODflbd026857
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 14/23] libmultipath: add libmp_dm_exit()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This function prepares for calling dm_lib_exit() on program exit.
It undoes changes to libdm internals done by libmultipath.
It doesn't call dm_lib_exit(), as the caller may want to keep
libdm active.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/config.c    |  1 +
 libmultipath/config.h    |  2 ++
 libmultipath/devmapper.c | 10 ++++++++++
 libmultipath/devmapper.h |  1 +
 4 files changed, 14 insertions(+)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index fbb66b3..8097838 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -65,6 +65,7 @@ int libmultipath_init(void)
 static void _libmultipath_exit(void)
 {
 	libmultipath_exit_called = true;
+	libmp_dm_exit();
 	udev_unref(udev);
 }
 
diff --git a/libmultipath/config.h b/libmultipath/config.h
index dac4e8f..fc614f0 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -270,6 +270,8 @@ int libmultipath_init(void);
  *
  * This function un-initializes libmultipath data structures.
  * It is recommended to call this function at program exit.
+ * If the application also calls dm_lib_exit(), it should do so
+ * after libmultipath_exit().
  *
  * Calls to libmultipath_init() after libmultipath_exit() will fail
  * (in other words, libmultipath can't be re-initialized).
diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 2e3ae8a..5a2e1e7 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -333,6 +333,16 @@ void libmp_udev_set_sync_support(int on)
 	libmp_dm_udev_sync = !!on;
 }
 
+void libmp_dm_exit(void)
+{
+	/* switch back to default libdm logging */
+	dm_log_init(NULL);
+#ifdef LIBDM_API_HOLD_CONTROL
+	/* make sure control fd is closed in dm_lib_release() */
+	dm_hold_control_dev(0);
+#endif
+}
+
 static void libmp_dm_init(void)
 {
 	struct config *conf;
diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
index 158057e..ecf2e66 100644
--- a/libmultipath/devmapper.h
+++ b/libmultipath/devmapper.h
@@ -35,6 +35,7 @@ enum {
 
 int dm_prereq(unsigned int *v);
 void skip_libmp_dm_init(void);
+void libmp_dm_exit(void);
 void libmp_udev_set_sync_support(int on);
 struct dm_task *libmp_dm_task_create(int task);
 int dm_simplecmd_flush (int, const char *, uint16_t);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

