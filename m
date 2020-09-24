Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C19952772AB
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:39:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-Ynqe5TKgNiulnA_0d9tgmw-1; Thu, 24 Sep 2020 09:39:51 -0400
X-MC-Unique: Ynqe5TKgNiulnA_0d9tgmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 880BF807341;
	Thu, 24 Sep 2020 13:39:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6598B5C1C7;
	Thu, 24 Sep 2020 13:39:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15859181A88C;
	Thu, 24 Sep 2020 13:39:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODdW8o026040 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:39:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2442E202450A; Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 204D92024508
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07026900C67
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:39:32 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-370-ciKdyxv_PJS5qwtdAmx2GQ-1;
	Thu, 24 Sep 2020 09:39:27 -0400
X-MC-Unique: ciKdyxv_PJS5qwtdAmx2GQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D819EB126;
	Thu, 24 Sep 2020 13:39:24 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:37:04 +0200
Message-Id: <20200924133716.14120-10-mwilck@suse.com>
In-Reply-To: <20200924133716.14120-1-mwilck@suse.com>
References: <20200924133716.14120-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODdW8o026040
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 09/21] multipath-tools: don't call
	dm_lib_release() any more
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The purpose of dm_lib_release() is to release stacked device node
operations in libdevmapper. This is functionality we don't need and
use any more, as we rely on udev to set up device nodes and symlinks.

We always set DM_UDEV_DISABLE_LIBRARY_FALLBACK when we run dm tasks.
In the standard CREATE and REMOVE cases, libdevmapper doesn't
stack any operations if this flag is set. The only exceptions are

 a) RESUME operations with DM_ADD_NODE_ON_RESUME set. This happens
implicity when we create new maps
 b) RENAME operations

In both cases, we call dm_udev_wait() after the libdm operation, which
calls update_devs() and thus has the same effect as dm_lib_release(),
cleaning out stacked operations.

OTOH, dm_lib_releases() accesses static variables in libdevmapper, so
calling it might be racy.

Drop the calls to dm_lib_release().

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/kpartx.c                 |  1 -
 libmpathpersist/mpath_persist.c |  1 -
 multipath/main.c                |  1 -
 multipathd/cli_handlers.c       |  2 --
 multipathd/main.c               | 15 ++-------------
 5 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/kpartx/kpartx.c b/kpartx/kpartx.c
index 4a0aae9..6a7933f 100644
--- a/kpartx/kpartx.c
+++ b/kpartx/kpartx.c
@@ -681,7 +681,6 @@ main(int argc, char **argv){
 	}
 
 end:
-	dm_lib_release();
 	dm_lib_exit();
 
 	return r;
diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 1f9817e..39055ed 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -56,7 +56,6 @@ mpath_lib_init (void)
 int
 mpath_lib_exit (struct config *conf)
 {
-	dm_lib_release();
 	dm_lib_exit();
 	cleanup_prio();
 	cleanup_checkers();
diff --git a/multipath/main.c b/multipath/main.c
index 9e920d8..dc4974b 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -1063,7 +1063,6 @@ main (int argc, char *argv[])
 		condlog(3, "restart multipath configuration process");
 
 out:
-	dm_lib_release();
 	dm_lib_exit();
 
 	cleanup_foreign();
diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 235e2a2..5463573 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -860,7 +860,6 @@ cli_add_map (void * v, char ** reply, int * len, void * data)
 				    != CP_OK)
 					condlog(2, "%s: coalesce_paths failed",
 									param);
-				dm_lib_release();
 				FREE(refwwid);
 			}
 		} /*we attempt to create device only once*/
@@ -1032,7 +1031,6 @@ cli_resize(void *v, char **reply, int *len, void *data)
 	if (resize_map(mpp, size, vecs) != 0)
 		return 1;
 
-	dm_lib_release();
 	if (setup_multipath(vecs, mpp) != 0)
 		return 1;
 	sync_map_state(mpp);
diff --git a/multipathd/main.c b/multipathd/main.c
index d1f8cc1..5cc3435 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -510,7 +510,6 @@ retry:
 		sleep(1);
 		goto retry;
 	}
-	dm_lib_release();
 
 fail:
 	if (new_map && (retries < 0 || wait_for_events(mpp, vecs))) {
@@ -611,10 +610,8 @@ coalesce_maps(struct vectors *vecs, vector nmpv)
 				vector_del_slot(ompv, i);
 				i--;
 			}
-			else {
-				dm_lib_release();
+			else
 				condlog(2, "%s devmap removed", ompp->alias);
-			}
 		} else if (reassign_maps) {
 			condlog(3, "%s: Reassign existing device-mapper"
 				" devices", ompp->alias);
@@ -660,10 +657,8 @@ flush_map(struct multipath * mpp, struct vectors * vecs, int nopaths)
 		}
 		return r;
 	}
-	else {
-		dm_lib_release();
+	else
 		condlog(2, "%s: map flushed", mpp->alias);
-	}
 
 	orphan_paths(vecs->pathvec, mpp, "map flushed");
 	remove_map_and_stop_waiter(mpp, vecs);
@@ -1080,7 +1075,6 @@ rescan:
 		else
 			goto fail_map;
 	}
-	dm_lib_release();
 
 	if ((mpp->action == ACT_CREATE ||
 	     (mpp->action == ACT_NOTHING && start_waiter && !mpp->waiter)) &&
@@ -1947,8 +1941,6 @@ int reload_and_sync_map(struct multipath *mpp,
 {
 	if (reload_map(vecs, mpp, refresh, 1))
 		return 1;
-
-	dm_lib_release();
 	if (setup_multipath(vecs, mpp) != 0)
 		return 2;
 	sync_map_state(mpp);
@@ -2631,8 +2623,6 @@ configure (struct vectors * vecs)
 		goto fail;
 	}
 
-	dm_lib_release();
-
 	if (should_exit())
 		goto fail;
 
@@ -3115,7 +3105,6 @@ child (__attribute__((unused)) void *param)
 	if (poll_dmevents)
 		cleanup_dmevent_waiter();
 
-	dm_lib_release();
 	dm_lib_exit();
 
 	/* We're done here */
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

