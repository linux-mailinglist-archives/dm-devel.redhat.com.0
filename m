Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C6359219EA7
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 13:04:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-WdyKrcH1Og-UdUHLAcPvFQ-1; Thu, 09 Jul 2020 07:04:47 -0400
X-MC-Unique: WdyKrcH1Og-UdUHLAcPvFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1B0C8015FB;
	Thu,  9 Jul 2020 11:04:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B9FA61981;
	Thu,  9 Jul 2020 11:04:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32F831809557;
	Thu,  9 Jul 2020 11:04:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069B3v53002092 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 07:03:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C5902114B302; Thu,  9 Jul 2020 11:03:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D36A114B2F8
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 866BF856A59
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-395-n7icU9VUNhefSThNip8pJQ-1;
	Thu, 09 Jul 2020 07:03:50 -0400
X-MC-Unique: n7icU9VUNhefSThNip8pJQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CC477AEFA;
	Thu,  9 Jul 2020 11:03:47 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 13:03:29 +0200
Message-Id: <20200709110330.9917-6-mwilck@suse.com>
In-Reply-To: <20200709110330.9917-1-mwilck@suse.com>
References: <20200709110330.9917-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069B3v53002092
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 79/80] multipathd: rename update_path_groups() ->
	reload_and_sync_map()
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

This function doesn't just update the path groups. It completely
rebuilds the multipath, reloads the kernel map, and syncs path
states. That should be reflected in the function name, which should
use the term "map", like all other functions that modify kernel state.

Todo: there's a large functional overlap between this function
and update_map(). Perhaps we should unify the two.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/cli_handlers.c | 8 ++++----
 multipathd/main.c         | 9 +++++----
 multipathd/main.h         | 4 ++--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 679fd57..d76fe90 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -941,7 +941,7 @@ cli_reload(void *v, char **reply, int *len, void *data)
 		return 1;
 	}
 
-	return update_path_groups(mpp, vecs, 0);
+	return reload_and_sync_map(mpp, vecs, 0);
 }
 
 int resize_map(struct multipath *mpp, unsigned long long size,
@@ -1621,7 +1621,7 @@ int cli_set_marginal(void * v, char ** reply, int * len, void * data)
 	}
 	pp->marginal = 1;
 
-	return update_path_groups(pp->mpp, vecs, 0);
+	return reload_and_sync_map(pp->mpp, vecs, 0);
 }
 
 int cli_unset_marginal(void * v, char ** reply, int * len, void * data)
@@ -1648,7 +1648,7 @@ int cli_unset_marginal(void * v, char ** reply, int * len, void * data)
 	}
 	pp->marginal = 0;
 
-	return update_path_groups(pp->mpp, vecs, 0);
+	return reload_and_sync_map(pp->mpp, vecs, 0);
 }
 
 int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data)
@@ -1685,5 +1685,5 @@ int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data)
 		vector_foreach_slot (pgp->paths, pp, j)
 			pp->marginal = 0;
 
-	return update_path_groups(mpp, vecs, 0);
+	return reload_and_sync_map(mpp, vecs, 0);
 }
diff --git a/multipathd/main.c b/multipathd/main.c
index aa08807..e6d4652 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1327,7 +1327,7 @@ uev_update_path (struct uevent *uev, struct vectors * vecs)
 			else {
 				if (ro == 1)
 					pp->mpp->force_readonly = 1;
-				retval = update_path_groups(mpp, vecs, 0);
+				retval = reload_and_sync_map(mpp, vecs, 0);
 				if (retval == 2)
 					condlog(2, "%s: map removed during reload", pp->dev);
 				else {
@@ -1946,7 +1946,8 @@ static int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh,
 	return 0;
 }
 
-int update_path_groups(struct multipath *mpp, struct vectors *vecs, int refresh)
+int reload_and_sync_map(struct multipath *mpp,
+			struct vectors *vecs, int refresh)
 {
 	if (reload_map(vecs, mpp, refresh, 1))
 		return 1;
@@ -2379,11 +2380,11 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	condlog(4, "path prio refresh");
 
 	if (marginal_changed)
-		update_path_groups(pp->mpp, vecs, 1);
+		reload_and_sync_map(pp->mpp, vecs, 1);
 	else if (update_prio(pp, new_path_up) &&
 	    (pp->mpp->pgpolicyfn == (pgpolicyfn *)group_by_prio) &&
 	     pp->mpp->pgfailback == -FAILBACK_IMMEDIATE)
-		update_path_groups(pp->mpp, vecs, !new_path_up);
+		reload_and_sync_map(pp->mpp, vecs, !new_path_up);
 	else if (need_switch_pathgroup(pp->mpp, 0)) {
 		if (pp->mpp->pgfailback > 0 &&
 		    (new_path_up || pp->mpp->failback_tick <= 0))
diff --git a/multipathd/main.h b/multipathd/main.h
index 5dff17e..9aa2a0f 100644
--- a/multipathd/main.h
+++ b/multipathd/main.h
@@ -46,7 +46,7 @@ int __setup_multipath (struct vectors * vecs, struct multipath * mpp,
 		       int reset);
 #define setup_multipath(vecs, mpp) __setup_multipath(vecs, mpp, 1)
 int update_multipath (struct vectors *vecs, char *mapname, int reset);
-int update_path_groups(struct multipath *mpp, struct vectors *vecs,
-		       int refresh);
+int reload_and_sync_map(struct multipath *mpp, struct vectors *vecs,
+			int refresh);
 
 #endif /* MAIN_H */
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

