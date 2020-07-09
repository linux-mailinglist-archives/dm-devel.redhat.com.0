Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2E038219E48
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-PCLdWkOtPWiacsgWXwrIhQ-1; Thu, 09 Jul 2020 06:52:38 -0400
X-MC-Unique: PCLdWkOtPWiacsgWXwrIhQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E8761092;
	Thu,  9 Jul 2020 10:52:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFEB85C1D3;
	Thu,  9 Jul 2020 10:52:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 948C21809554;
	Thu,  9 Jul 2020 10:52:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqKal000610 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1090D2166B28; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C8382157F25
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25F818007C8
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-99-Ib8YN3HuNHyj4b6Hu3RtEw-1;
	Thu, 09 Jul 2020 06:52:13 -0400
X-MC-Unique: Ib8YN3HuNHyj4b6Hu3RtEw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 26790AE78;
	Thu,  9 Jul 2020 10:52:12 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:27 +0200
Message-Id: <20200709105145.9211-4-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqKal000610
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 56/74] multipath-tools: introduce INIT_REMOVED
	state
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

Introduce a new state for pp->initialized, INIT_REMOVED. This state
means that the path is about to be removed, either by a remove uevent
or by the operator. It will normally be a very short-lived state, because
the path will be deleted from pathvec quickly after setting this state.
Only if the path is member of a multipath map, and reloading the map
fails, this state will persist until a later map reload or flush eventually
cancels the membership in the map.

Paths in INIT_REMOVED state are treated as if they didn't exist.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c   |  4 ++++
 libmultipath/structs.h     |  5 +++++
 libmultipath/structs_vec.c | 17 +++++++++++++++++
 libmultipath/structs_vec.h |  1 +
 multipathd/main.c          |  5 +++--
 5 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index c202d58..efcef67 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -2078,6 +2078,10 @@ int pathinfo(struct path *pp, struct config *conf, int mask)
 	if (!pp || !conf)
 		return PATHINFO_FAILED;
 
+	/* Treat removed paths as if they didn't exist */
+	if (pp->initialized == INIT_REMOVED)
+		return PATHINFO_FAILED;
+
 	/*
 	 * For behavior backward-compatibility with multipathd,
 	 * the blacklisting by filter_property|devnode() is not
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 894099d..1f0a78a 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -193,6 +193,11 @@ enum initialized_states {
 	INIT_MISSING_UDEV,
 	INIT_REQUESTED_UDEV,
 	INIT_OK,
+	/*
+	 * INIT_REMOVED: supposed to be removed from pathvec, but still
+	 * mapped by some multipath map because of map reload failure.
+	 */
+	INIT_REMOVED,
 };
 
 enum prkey_sources {
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 05c8626..27d6547 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -113,6 +113,23 @@ void orphan_paths(vector pathvec, struct multipath *mpp, const char *reason)
 	}
 }
 
+void set_path_removed(struct path *pp)
+{
+	struct multipath *mpp = pp->mpp;
+
+	orphan_path(pp, "removed");
+	/*
+	 * Keep link to mpp. It will be removed when the path
+	 * is successfully removed from the map.
+	 */
+	if (!mpp) {
+		condlog(0, "%s: internal error: mpp == NULL", pp->dev);
+		return;
+	}
+	pp->mpp = mpp;
+	pp->initialized = INIT_REMOVED;
+}
+
 void
 remove_map(struct multipath * mpp, struct vectors * vecs, int purge_vec)
 {
diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
index 4b3b8b7..cf7d569 100644
--- a/libmultipath/structs_vec.h
+++ b/libmultipath/structs_vec.h
@@ -18,6 +18,7 @@ int adopt_paths (vector pathvec, struct multipath * mpp);
 void orphan_paths(vector pathvec, struct multipath *mpp,
 		  const char *reason);
 void orphan_path (struct path * pp, const char *reason);
+void set_path_removed(struct path *pp);
 
 int verify_paths(struct multipath * mpp, struct vectors * vecs);
 int update_mpp_paths(struct multipath * mpp, vector pathvec);
diff --git a/multipathd/main.c b/multipathd/main.c
index cd0e29b..4a5aa17 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1962,8 +1962,9 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	int marginal_pathgroups, marginal_changed = 0;
 	int ret;
 
-	if ((pp->initialized == INIT_OK ||
-	     pp->initialized == INIT_REQUESTED_UDEV) && !pp->mpp)
+	if (((pp->initialized == INIT_OK ||
+	      pp->initialized == INIT_REQUESTED_UDEV) && !pp->mpp) ||
+	    pp->initialized == INIT_REMOVED)
 		return 0;
 
 	if (pp->tick)
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

