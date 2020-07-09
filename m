Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6352F219E53
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-JG8iKAoQPe-xFaoXZgePkA-1; Thu, 09 Jul 2020 06:52:47 -0400
X-MC-Unique: JG8iKAoQPe-xFaoXZgePkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F1C280BCB7;
	Thu,  9 Jul 2020 10:52:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A0192B6DE;
	Thu,  9 Jul 2020 10:52:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16D4593F8E;
	Thu,  9 Jul 2020 10:52:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqKou000637 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DE1C2166BA4; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1162166B28
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 710D4858EE9
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-346-V5HyOTgQM8iWCjzyHgJz2g-1;
	Thu, 09 Jul 2020 06:52:15 -0400
X-MC-Unique: V5HyOTgQM8iWCjzyHgJz2g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6E46DAEE9;
	Thu,  9 Jul 2020 10:52:13 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:33 +0200
Message-Id: <20200709105145.9211-10-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqKou000637
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 62/74] multipathd: ev_remove_path(): use
	INIT_REMOVED
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Set paths belonging to a map to INIT_REMOVED state before attempting
to reload or flush the map. If the map association is successfully removed,
the path will be actually deleted, either via flush_map() -> orphan_paths(),
or in the update_multipath_strings()->sync_paths() code path.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 402e179..545eb6d 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1102,6 +1102,18 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 			goto fail;
 		}
 
+		/*
+		 * Mark the path as removed. In case of success, we
+		 * will delete it for good. Otherwise, it will be deleted
+		 * later, unless all attempts to reload this map fail.
+		 * Note: we have to explicitly remove pp from mpp->paths,
+		 * update_mpp_paths() doesn't do that.
+		 */
+		set_path_removed(pp);
+		i = find_slot(mpp->paths, pp);
+		if (i != -1)
+			vector_del_slot(mpp->paths, i);
+
 		/*
 		 * Make sure mpp->hwe doesn't point to freed memory
 		 * We call extract_hwe_from_path() below to restore mpp->hwe
@@ -1109,9 +1121,6 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 		if (mpp->hwe == pp->hwe)
 			mpp->hwe = NULL;
 
-		if ((i = find_slot(mpp->paths, (void *)pp)) != -1)
-			vector_del_slot(mpp->paths, i);
-
 		/*
 		 * remove the map IF removing the last path
 		 */
@@ -1135,6 +1144,7 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 					" removing all paths",
 					alias);
 				retval = 0;
+				/* flush_map() has freed the path */
 				goto out;
 			}
 			/*
@@ -1171,21 +1181,27 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 			/*
 			 * update our state from kernel
 			 */
+			char devt[BLK_DEV_SIZE];
+
+			strlcpy(devt, pp->dev_t, sizeof(devt));
 			if (setup_multipath(vecs, mpp))
 				return 1;
+			/*
+			 * Successful map reload without this path:
+			 * sync_map_state() will free it.
+			 */
 			sync_map_state(mpp);
 
-			condlog(2, "%s [%s]: path removed from map %s",
-				pp->dev, pp->dev_t, mpp->alias);
+			condlog(2, "%s: path removed from map %s",
+				devt, mpp->alias);
 		}
+	} else {
+		/* mpp == NULL */
+		if ((i = find_slot(vecs->pathvec, (void *)pp)) != -1)
+			vector_del_slot(vecs->pathvec, i);
+		free_path(pp);
 	}
-
 out:
-	if ((i = find_slot(vecs->pathvec, (void *)pp)) != -1)
-		vector_del_slot(vecs->pathvec, i);
-
-	free_path(pp);
-
 	return retval;
 
 fail:
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

