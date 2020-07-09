Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE60219E54
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-pR86T8rcOZaAxHBWy-Gc4A-1; Thu, 09 Jul 2020 06:52:48 -0400
X-MC-Unique: pR86T8rcOZaAxHBWy-Gc4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27B4D86AAF4;
	Thu,  9 Jul 2020 10:52:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 029262B6DE;
	Thu,  9 Jul 2020 10:52:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFC82180043B;
	Thu,  9 Jul 2020 10:52:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqKF9000661 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1AC95F252; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD8955F25E
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6562185A797
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-262-08CR1jWtMr2AQlxsGwzrRw-1;
	Thu, 09 Jul 2020 06:52:16 -0400
X-MC-Unique: 08CR1jWtMr2AQlxsGwzrRw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4E944AE44;
	Thu,  9 Jul 2020 10:52:14 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:37 +0200
Message-Id: <20200709105145.9211-14-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqKF9000661
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 66/74] libmultipath: update_pathvec_from_dm:
	handle pp->mpp mismatch
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

Treat this like a WWID mismatch.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 5dd37d5..8651b98 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -118,6 +118,12 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 			goto delete_pg;
 
 		vector_foreach_slot(pgp->paths, pp, j) {
+
+			if (pp->mpp && pp->mpp != mpp) {
+				condlog(0, "BUG: %s: found path %s which is already in %s",
+					mpp->alias, pp->dev, pp->mpp->alias);
+				goto bad_path;
+			}
 			pp->mpp = mpp;
 
 			if (pp->udev) {
@@ -163,25 +169,28 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 
 					condlog(0, "%s: path %s WWID %s doesn't match, removing from map",
 						mpp->wwid, pp->dev_t, pp->wwid);
-					/*
-					 * This path exists, but in the wong map.
-					 * We can't reload the map from here.
-					 * Instead, treat this path like "missing udev",
-					 * which it probably is.
-					 * check_path() will trigger an uevent
-					 * and reset pp->tick.
-					 */
-					must_reload = true;
-					pp->mpp = NULL;
-					dm_fail_path(mpp->alias, pp->dev_t);
-					vector_del_slot(pgp->paths, j--);
-					pp->initialized = INIT_MISSING_UDEV;
-					pp->tick = 1;
+					goto bad_path;
 				}
 				condlog(2, "%s: adding new path %s",
 					mpp->alias, pp->dev);
 				store_path(pathvec, pp);
+
 			}
+			continue;
+
+		bad_path:
+			/*
+			 * This path exists, but in the wrong map.
+			 * We can't reload the map from here.
+			 * Instead, treat this path like "missing udev".
+			 * check_path() will trigger an uevent and reset pp->tick.
+			 */
+			must_reload = true;
+			pp->mpp = NULL;
+			dm_fail_path(mpp->alias, pp->dev_t);
+			vector_del_slot(pgp->paths, j--);
+			pp->initialized = INIT_MISSING_UDEV;
+			pp->tick = 1;
 		}
 		if (VECTOR_SIZE(pgp->paths) != 0)
 			continue;
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

