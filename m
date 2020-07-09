Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 81207219EA4
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 13:04:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-O4J-06H_PXq6Mno2BA4qxQ-1; Thu, 09 Jul 2020 07:04:43 -0400
X-MC-Unique: O4J-06H_PXq6Mno2BA4qxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D1618015F7;
	Thu,  9 Jul 2020 11:04:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAC8D7F8C5;
	Thu,  9 Jul 2020 11:04:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1572B1809554;
	Thu,  9 Jul 2020 11:04:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069B3sFL002058 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 07:03:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 466E35F248; Thu,  9 Jul 2020 11:03:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A9E55F25C
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1304B18056A3
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 11:03:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-198-x0-zOBvvNsa-o1V5uoTtLw-1;
	Thu, 09 Jul 2020 07:03:50 -0400
X-MC-Unique: x0-zOBvvNsa-o1V5uoTtLw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 127AAAEF6;
	Thu,  9 Jul 2020 11:03:48 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 13:03:30 +0200
Message-Id: <20200709110330.9917-7-mwilck@suse.com>
In-Reply-To: <20200709110330.9917-1-mwilck@suse.com>
References: <20200709110330.9917-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069B3sFL002058
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 80/80] libmultipath: select_action(): don't drop
	map if alias clashes
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

If for a given map, if we find that the requested alias is already
used by a map with different WWID, while the map's own WWID is
not used yet, give up the alias and use the WWID instead. This
is safer than trying to destroy the existing map, which is likely
to fail.

This allows us to make use const for the "curmp" parameter.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 13 +++++++------
 libmultipath/configure.h |  3 ++-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index b77c2a8..7931045 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -688,7 +688,8 @@ select_reload_action(struct multipath *mpp, const struct multipath *cmpp,
 		reason);
 }
 
-void select_action (struct multipath *mpp, vector curmp, int force_reload)
+void select_action (struct multipath *mpp, const struct _vector *curmp,
+		    int force_reload)
 {
 	struct multipath * cmpp;
 	struct multipath * cmpp_by_name;
@@ -716,12 +717,12 @@ void select_action (struct multipath *mpp, vector curmp, int force_reload)
 	}
 
 	if (!cmpp) {
-		condlog(2, "%s: remove (wwid changed)", mpp->alias);
-		dm_flush_map(mpp->alias);
-		strlcpy(cmpp_by_name->wwid, mpp->wwid, WWID_SIZE);
-		drop_multipath(curmp, cmpp_by_name->wwid, KEEP_PATHS);
+		condlog(1, "%s: can't use alias \"%s\" used by %s, falling back to WWID",
+			mpp->wwid, mpp->alias, cmpp_by_name->wwid);
+		/* We can do this because wwid wasn't found */
+		strlcpy(mpp->alias, mpp->wwid, sizeof(mpp->alias));
 		mpp->action = ACT_CREATE;
-		condlog(3, "%s: set ACT_CREATE (map wwid change)",
+		condlog(3, "%s: set ACT_CREATE (map does not exist, name changed)",
 			mpp->alias);
 		return;
 	}
diff --git a/libmultipath/configure.h b/libmultipath/configure.h
index 9907775..6b23ccb 100644
--- a/libmultipath/configure.h
+++ b/libmultipath/configure.h
@@ -49,7 +49,8 @@ struct vectors;
 
 int setup_map (struct multipath * mpp, char * params, int params_size,
 	       struct vectors *vecs );
-void select_action (struct multipath *mpp, vector curmp, int force_reload);
+void select_action (struct multipath *mpp, const struct _vector *curmp,
+		    int force_reload);
 int domap (struct multipath * mpp, char * params, int is_daemon);
 int reinstate_paths (struct multipath *mpp);
 int coalesce_paths (struct vectors *vecs, vector curmp, char * refwwid, int force_reload, enum mpath_cmds cmd);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

