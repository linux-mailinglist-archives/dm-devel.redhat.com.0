Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 13A312772FC
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:46:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-6KcqO579Pu2mZYTSX1byhQ-1; Thu, 24 Sep 2020 09:46:17 -0400
X-MC-Unique: 6KcqO579Pu2mZYTSX1byhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF4611891E81;
	Thu, 24 Sep 2020 13:46:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C33378831;
	Thu, 24 Sep 2020 13:46:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 494D68C7A5;
	Thu, 24 Sep 2020 13:46:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfl33026858 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E5C72157F24; Thu, 24 Sep 2020 13:41:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89ED62166B27
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 706E5101A540
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-157-VkRZrgWiPxGKZd6KtU-xCw-1;
	Thu, 24 Sep 2020 09:41:42 -0400
X-MC-Unique: VkRZrgWiPxGKZd6KtU-xCw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BEB49B12A;
	Thu, 24 Sep 2020 13:41:39 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:42 +0200
Message-Id: <20200924134054.14632-12-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfl33026858
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 11/23] multipathd: child(): call cleanups in
	failure case, too
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

So far we haven't called any cleanup code if child() failed.
Fix it.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index e742aa5..3c8f893 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3044,6 +3044,7 @@ child (__attribute__((unused)) void *param)
 	char *envp;
 	enum daemon_status state;
 	struct call_rcu_data *crdp;
+	int exit_code = 1;
 
 	mlockall(MCL_CURRENT | MCL_FUTURE);
 	signal_init();
@@ -3207,6 +3208,8 @@ child (__attribute__((unused)) void *param)
 		}
 	}
 
+	exit_code = 0;
+failed:
 	cleanup_threads();
 	cleanup_vecs();
 	cleanup_foreign();
@@ -3229,12 +3232,7 @@ child (__attribute__((unused)) void *param)
 #ifdef _DEBUG_
 	dbg_free_final(NULL);
 #endif
-	exit(sd_notify_exit(0));
-
-failed:
-	if (pid_fd >= 0)
-		close(pid_fd);
-	exit(sd_notify_exit(1));
+	return sd_notify_exit(exit_code);
 }
 
 static int
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

