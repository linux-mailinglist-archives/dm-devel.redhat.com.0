Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0084927728E
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:37:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-k10lzuigOSa_uPxRiskjrw-1; Thu, 24 Sep 2020 09:37:36 -0400
X-MC-Unique: k10lzuigOSa_uPxRiskjrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E66F186DD42;
	Thu, 24 Sep 2020 13:37:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC47960C04;
	Thu, 24 Sep 2020 13:37:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91A6C181A87F;
	Thu, 24 Sep 2020 13:37:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODbJ25025545 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:37:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C7E31140EA; Thu, 24 Sep 2020 13:37:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 758A31140F6
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 162778582A5
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:37:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-419-WgrV8R4EP1elwSlvGo2IUg-1;
	Thu, 24 Sep 2020 09:37:09 -0400
X-MC-Unique: WgrV8R4EP1elwSlvGo2IUg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 54BF8B122;
	Thu, 24 Sep 2020 13:37:06 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:36:39 +0200
Message-Id: <20200924133644.14034-7-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODbJ25025545
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 06/11] libmultipath: checkers/prio: allow
	non-lazy .so loading
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

If compiled with -DLOAD_ALL_SHARED_LIBS, all known prioritizers
and checkers will be loaded immediately on startup. This is useful
for determining symbol usage (start executables with LD_BIND_NOW=1).
---
 libmultipath/checkers.c | 17 +++++++++++++++++
 libmultipath/prio.c     | 22 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
index f7ddd53..18b1f5e 100644
--- a/libmultipath/checkers.c
+++ b/libmultipath/checkers.c
@@ -7,6 +7,7 @@
 #include "debug.h"
 #include "checkers.h"
 #include "vector.h"
+#include "util.h"
 
 struct checker_class {
 	struct list_head node;
@@ -375,7 +376,23 @@ void checker_get(const char *multipath_dir, struct checker *dst,
 
 int init_checkers(const char *multipath_dir)
 {
+#ifdef LOAD_ALL_SHARED_LIBS
+	static const char *const all_checkers[] = {
+		DIRECTIO,
+		TUR,
+		HP_SW,
+		RDAC,
+		EMC_CLARIION,
+		READSECTOR0,
+		CCISS_TUR,
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(all_checkers); i++)
+		add_checker_class(multipath_dir, all_checkers[i]);
+#else
 	if (!add_checker_class(multipath_dir, DEFAULT_CHECKER))
 		return 1;
+#endif
 	return 0;
 }
diff --git a/libmultipath/prio.c b/libmultipath/prio.c
index 3a718ba..c92bde7 100644
--- a/libmultipath/prio.c
+++ b/libmultipath/prio.c
@@ -20,8 +20,30 @@ unsigned int get_prio_timeout(unsigned int timeout_ms,
 
 int init_prio (const char *multipath_dir)
 {
+#ifdef LOAD_ALL_SHARED_LIBS
+	static const char *const all_prios[] = {
+		PRIO_ALUA,
+		PRIO_CONST,
+		PRIO_DATACORE,
+		PRIO_EMC,
+		PRIO_HDS,
+		PRIO_HP_SW,
+		PRIO_ONTAP,
+		PRIO_RANDOM,
+		PRIO_RDAC,
+		PRIO_WEIGHTED_PATH,
+		PRIO_SYSFS,
+		PRIO_PATH_LATENCY,
+		PRIO_ANA,
+	};
+	unsigned int i;
+
+	for  (i = 0; i < ARRAY_SIZE(all_prios); i++)
+		add_prio(multipath_dir, all_prios[i]);
+#else
 	if (!add_prio(multipath_dir, DEFAULT_PRIO))
 		return 1;
+#endif
 	return 0;
 }
 
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

