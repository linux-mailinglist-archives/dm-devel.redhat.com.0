Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F1DDE290376
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:46:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-AaKSZgHCPIOLBtPvgc8D1Q-1; Fri, 16 Oct 2020 06:45:35 -0400
X-MC-Unique: AaKSZgHCPIOLBtPvgc8D1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B6381084D81;
	Fri, 16 Oct 2020 10:45:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AE7A1000232;
	Fri, 16 Oct 2020 10:45:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B78751826D3C;
	Fri, 16 Oct 2020 10:45:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAjKQX020735 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:45:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8468116C2DD; Fri, 16 Oct 2020 10:45:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FA0A12D8B8
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59EE18726C9
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-228-Zz-uTotLORWCq-GZyRjnFQ-1;
	Fri, 16 Oct 2020 06:45:15 -0400
X-MC-Unique: Zz-uTotLORWCq-GZyRjnFQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5743DB2AE;
	Fri, 16 Oct 2020 10:45:13 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:44:43 +0200
Message-Id: <20201016104501.8700-12-mwilck@suse.com>
In-Reply-To: <20201016104501.8700-1-mwilck@suse.com>
References: <20201016104501.8700-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAjKQX020735
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 11/29] multipathd: child(): call cleanups in
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

So far we haven't called any cleanup code if child() failed.
Fix it.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 9080a15..be6d3cd 100644
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
@@ -3227,12 +3230,7 @@ child (__attribute__((unused)) void *param)
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

