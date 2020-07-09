Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 70AE3219DF2
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:35:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-XCfbjdUAMiaKNI9A3iwYGw-1; Thu, 09 Jul 2020 06:35:51 -0400
X-MC-Unique: XCfbjdUAMiaKNI9A3iwYGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3D1A107ACF7;
	Thu,  9 Jul 2020 10:35:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEC9290E64;
	Thu,  9 Jul 2020 10:35:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CD4193F81;
	Thu,  9 Jul 2020 10:35:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AZY7C031450 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:35:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDDF61004026; Thu,  9 Jul 2020 10:35:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D820B114B2FE
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:35:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA1AA8007B1
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:35:30 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-509-7jSj2_x5NmuxGsiPCGgVmA-1;
	Thu, 09 Jul 2020 06:35:28 -0400
X-MC-Unique: 7jSj2_x5NmuxGsiPCGgVmA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 79D07AE44;
	Thu,  9 Jul 2020 10:35:26 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:35:11 +0200
Message-Id: <20200709103513.8142-2-mwilck@suse.com>
In-Reply-To: <20200709103513.8142-1-mwilck@suse.com>
References: <20200709103513.8142-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AZY7C031450
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 40/42] libmultipath: refuse creating map with
	duplicate alias
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If for some reason (e.g. user configuration error) the same alias
is used for different WWIDs, multipathd starts behaving very weirdly.
Sooner or later it "fixes" pp->wwid of some paths to match those of
the other WWID, and may eventually coalesce paths with different WWIDs
into one map, causing data corruption.

Fix this by refusing to add a map with an already existing alias.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c   |  5 +++++
 libmultipath/structs_vec.c | 13 +++++++++++++
 libmultipath/structs_vec.h |  1 +
 multipathd/main.c          |  6 +++++-
 4 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 315eb6a..c62807e 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1187,6 +1187,11 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 		}
 		verify_paths(mpp, vecs);
 
+		if (does_alias_exist(newmp, mpp)) {
+			remove_map(mpp, vecs, PURGE_VEC);
+			continue;
+		}
+
 		params[0] = '\0';
 		if (setup_map(mpp, params, PARAMS_SIZE, vecs)) {
 			remove_map(mpp, vecs, 0);
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 8137ea2..c7dffb7 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -424,6 +424,19 @@ find_existing_alias (struct multipath * mpp,
 		}
 }
 
+bool does_alias_exist(const struct _vector *mpvec, const struct multipath *mpp)
+{
+	const struct multipath *other;
+
+	other = find_mp_by_alias(mpvec, mpp->alias);
+	if (other == NULL || !strcmp(other->wwid, mpp->wwid))
+		return false;
+	condlog(0, "%s: alias \"%s\" already present with WWID %s, skipping",
+		mpp->wwid, mpp->alias, other->wwid);
+	condlog(0, "please check alias settings in config and bindings file");
+	return true;
+}
+
 struct multipath *add_map_with_path(struct vectors *vecs, struct path *pp,
 				    int add_vec)
 {
diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
index 2a5e3d6..4b3b8b7 100644
--- a/libmultipath/structs_vec.h
+++ b/libmultipath/structs_vec.h
@@ -33,6 +33,7 @@ void remove_map_by_alias(const char *alias, struct vectors * vecs,
 void remove_maps (struct vectors * vecs);
 
 void sync_map_state (struct multipath *);
+bool does_alias_exist(const struct _vector *mpvec, const struct multipath *mpp);
 struct multipath * add_map_with_path (struct vectors * vecs,
 				struct path * pp, int add_vec);
 void update_queue_mode_del_path(struct multipath *mpp);
diff --git a/multipathd/main.c b/multipathd/main.c
index 40c050b..cd0e29b 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -966,8 +966,12 @@ rescan:
 			orphan_path(pp, "only one path");
 			return 0;
 		}
-		condlog(4,"%s: creating new map", pp->dev);
 		if ((mpp = add_map_with_path(vecs, pp, 1))) {
+			if (does_alias_exist(vecs->mpvec, mpp)) {
+				remove_map(mpp, vecs, PURGE_VEC);
+				return 0;
+			}
+			condlog(4,"%s: creating new map", pp->dev);
 			mpp->action = ACT_CREATE;
 			/*
 			 * We don't depend on ACT_CREATE, as domap will
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

