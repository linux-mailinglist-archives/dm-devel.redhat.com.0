Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B6B6F2428CD
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-Ns18MQClNNeYgXGeER9cIw-1; Wed, 12 Aug 2020 07:36:18 -0400
X-MC-Unique: Ns18MQClNNeYgXGeER9cIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F21FF8010D9;
	Wed, 12 Aug 2020 11:36:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA48951C4F;
	Wed, 12 Aug 2020 11:36:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D701181A06E;
	Wed, 12 Aug 2020 11:36:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBa5rZ028931 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:36:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 121C12156A3A; Wed, 12 Aug 2020 11:36:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DDF02157F25
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A65648007B3
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-80-E5RrMhtUNtW33X3YmaeChQ-1;
	Wed, 12 Aug 2020 07:35:58 -0400
X-MC-Unique: E5RrMhtUNtW33X3YmaeChQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4C58CB70C;
	Wed, 12 Aug 2020 11:36:18 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:42 +0200
Message-Id: <20200812113543.26576-4-mwilck@suse.com>
In-Reply-To: <20200812113543.26576-1-mwilck@suse.com>
References: <20200812113543.26576-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBa5rZ028931
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 79/80] multipathd: rename update_path_groups()
	-> reload_and_sync_map()
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
X-Mimecast-Spam-Score: 0.003
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

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/cli_handlers.c | 8 ++++----
 multipathd/main.c         | 9 +++++----
 multipathd/main.h         | 4 ++--
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index c60182f..8db3796 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -946,7 +946,7 @@ cli_reload(void *v, char **reply, int *len, void *data)
 		return 1;
 	}
 
-	return update_path_groups(mpp, vecs, 0);
+	return reload_and_sync_map(mpp, vecs, 0);
 }
 
 int resize_map(struct multipath *mpp, unsigned long long size,
@@ -1626,7 +1626,7 @@ int cli_set_marginal(void * v, char ** reply, int * len, void * data)
 	}
 	pp->marginal = 1;
 
-	return update_path_groups(pp->mpp, vecs, 0);
+	return reload_and_sync_map(pp->mpp, vecs, 0);
 }
 
 int cli_unset_marginal(void * v, char ** reply, int * len, void * data)
@@ -1653,7 +1653,7 @@ int cli_unset_marginal(void * v, char ** reply, int * len, void * data)
 	}
 	pp->marginal = 0;
 
-	return update_path_groups(pp->mpp, vecs, 0);
+	return reload_and_sync_map(pp->mpp, vecs, 0);
 }
 
 int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data)
@@ -1690,5 +1690,5 @@ int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data)
 		vector_foreach_slot (pgp->paths, pp, j)
 			pp->marginal = 0;
 
-	return update_path_groups(mpp, vecs, 0);
+	return reload_and_sync_map(mpp, vecs, 0);
 }
diff --git a/multipathd/main.c b/multipathd/main.c
index 720495d..7f95d46 100644
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
@@ -2377,14 +2378,14 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	if (marginal_changed) {
 		condlog(2, "%s: path is %s marginal", pp->dev,
 			(pp->marginal)? "now" : "no longer");
-		update_path_groups(pp->mpp, vecs, 1);
+		reload_and_sync_map(pp->mpp, vecs, 1);
 	}
 	else if (update_prio(pp, new_path_up) &&
 	    (pp->mpp->pgpolicyfn == (pgpolicyfn *)group_by_prio) &&
 	     pp->mpp->pgfailback == -FAILBACK_IMMEDIATE) {
 		condlog(2, "%s: path priorities changed. reloading",
 			pp->mpp->alias);
-		update_path_groups(pp->mpp, vecs, !new_path_up);
+		reload_and_sync_map(pp->mpp, vecs, !new_path_up);
 	} else if (need_switch_pathgroup(pp->mpp, 0)) {
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
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

