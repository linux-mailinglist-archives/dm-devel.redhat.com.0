Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE512428C8
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-mjWk6qPvPjGvBMF3YLnKFQ-1; Wed, 12 Aug 2020 07:36:04 -0400
X-MC-Unique: mjWk6qPvPjGvBMF3YLnKFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E7C51007381;
	Wed, 12 Aug 2020 11:35:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4815D6BD;
	Wed, 12 Aug 2020 11:35:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01C38181A06C;
	Wed, 12 Aug 2020 11:35:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBZiXT028814 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:35:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 028452166BA4; Wed, 12 Aug 2020 11:35:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2C2E2166BA3
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA1431033654
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-422-6SvuSzNpPymf6Ju7wv-xHA-1;
	Wed, 12 Aug 2020 07:35:38 -0400
X-MC-Unique: 6SvuSzNpPymf6Ju7wv-xHA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 14E23B70A;
	Wed, 12 Aug 2020 11:35:58 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:10 +0200
Message-Id: <20200812113511.26469-8-mwilck@suse.com>
In-Reply-To: <20200812113511.26469-1-mwilck@suse.com>
References: <20200812113511.26469-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBZiXT028814
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 66/74] libmultipath: update_pathvec_from_dm:
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 libmultipath/structs_vec.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index bd2d13b..e7a8d53 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -123,6 +123,23 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 			goto delete_pg;
 
 		vector_foreach_slot(pgp->paths, pp, j) {
+
+			if (pp->mpp && pp->mpp != mpp) {
+				condlog(0, "BUG: %s: found path %s which is already in %s",
+					mpp->alias, pp->dev, pp->mpp->alias);
+
+				/*
+				 * Either we added this path to the other mpp
+				 * explicitly, or we came by here earlier and
+				 * decided it belonged there. In both cases,
+				 * the path should remain in the other map,
+				 * and be deleted here.
+				 */
+				must_reload = true;
+				dm_fail_path(mpp->alias, pp->dev_t);
+				vector_del_slot(pgp->paths, j--);
+				continue;
+			}
 			pp->mpp = mpp;
 
 			/*
@@ -170,6 +187,22 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 					vector_del_slot(pgp->paths, j--);
 					free_path(pp);
 					must_reload = true;
+				} else if (mpp_has_wwid && pp->wwid[0] != '\0'
+					   && strcmp(mpp->wwid, pp->wwid)) {
+					condlog(0, "%s: path %s WWID %s doesn't match, removing from map",
+						mpp->wwid, pp->dev_t, pp->wwid);
+					/*
+					 * This path exists, but in the wrong map.
+					 * We can't reload the map from here.
+					 * Make sure it isn't used in this map
+					 * any more, and let the checker re-add
+					 * it as it sees fit.
+					 */
+					dm_fail_path(mpp->alias, pp->dev_t);
+					vector_del_slot(pgp->paths, j--);
+					orphan_path(pp, "WWID mismatch");
+					pp->tick = 1;
+					must_reload = true;
 				} else {
 					if (mpp_has_wwid && !strlen(pp->wwid)) {
 						condlog(3, "%s: setting wwid from map: %s",
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

