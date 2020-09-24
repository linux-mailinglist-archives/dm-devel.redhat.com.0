Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BE4382772E8
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:45:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-q3gzABj7MmWeITN5MeGl0Q-1; Thu, 24 Sep 2020 09:45:22 -0400
X-MC-Unique: q3gzABj7MmWeITN5MeGl0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 452011084D79;
	Thu, 24 Sep 2020 13:45:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7A45578D;
	Thu, 24 Sep 2020 13:45:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE6528C7A6;
	Thu, 24 Sep 2020 13:45:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfmcv026895 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9784F200A7CD; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92AAD2026F94
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 794FD900C67
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-389-M8PPCDbiOzmpmoUtJX6JpQ-1;
	Thu, 24 Sep 2020 09:41:43 -0400
X-MC-Unique: M8PPCDbiOzmpmoUtJX6JpQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3AA08B18D;
	Thu, 24 Sep 2020 13:41:42 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:50 +0200
Message-Id: <20200924134054.14632-20-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfmcv026895
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 19/23] multipathd: move cleanup_{prio, checkers,
	foreign} to libmultipath_exit
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

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_persist.c   | 2 --
 libmultipath/config.c             | 4 ++++
 libmultipath/libmultipath.version | 5 +----
 multipathd/main.c                 | 3 ---
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 873b419..af56a95 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -78,8 +78,6 @@ mpath_lib_init (void)
 
 static void libmpathpersist_cleanup(void)
 {
-	cleanup_prio();
-	cleanup_checkers();
 	libmultipath_exit();
 	dm_lib_exit();
 }
diff --git a/libmultipath/config.c b/libmultipath/config.c
index 8097838..f115ac2 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -26,6 +26,7 @@
 #include "devmapper.h"
 #include "mpath_cmd.h"
 #include "propsel.h"
+#include "foreign.h"
 
 /*
  * We don't support re-initialization after
@@ -65,6 +66,9 @@ int libmultipath_init(void)
 static void _libmultipath_exit(void)
 {
 	libmultipath_exit_called = true;
+	cleanup_foreign();
+	cleanup_checkers();
+	cleanup_prio();
 	libmp_dm_exit();
 	udev_unref(udev);
 }
diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
index 9abdb22..80f1950 100644
--- a/libmultipath/libmultipath.version
+++ b/libmultipath/libmultipath.version
@@ -1,4 +1,4 @@
-LIBMULTIPATH_0.8.4.5 {
+LIBMULTIPATH_0.8.4.6 {
 global:
 	/* symbols referenced by multipath and multipathd */
 	add_foreign;
@@ -18,10 +18,7 @@ global:
 	checker_name;
 	checker_state_name;
 	check_foreign;
-	cleanup_checkers;
-	cleanup_foreign;
 	cleanup_lock;
-	cleanup_prio;
 	close_fd;
 	coalesce_paths;
 	convert_dev;
diff --git a/multipathd/main.c b/multipathd/main.c
index e7b479a..efed56e 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3027,9 +3027,6 @@ static void cleanup_child(void)
 {
 	cleanup_threads();
 	cleanup_vecs();
-	cleanup_foreign();
-	cleanup_checkers();
-	cleanup_prio();
 	if (poll_dmevents)
 		cleanup_dmevent_waiter();
 
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

