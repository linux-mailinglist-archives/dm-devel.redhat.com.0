Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 53CE6219E4A
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-68aXtq-WPb6W6idrp7lmbw-1; Thu, 09 Jul 2020 06:52:39 -0400
X-MC-Unique: 68aXtq-WPb6W6idrp7lmbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C63EC86AAF0;
	Thu,  9 Jul 2020 10:52:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A06DA60F8D;
	Thu,  9 Jul 2020 10:52:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 577BF1809554;
	Thu,  9 Jul 2020 10:52:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqIqx000584 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA9B82026D69; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B43EE208BDDF
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB44C100E7C3
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:16 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-41-orIoChvRPLOnU5U7zY5s3Q-1;
	Thu, 09 Jul 2020 06:52:14 -0400
X-MC-Unique: orIoChvRPLOnU5U7zY5s3Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 57857AE7F;
	Thu,  9 Jul 2020 10:52:12 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:28 +0200
Message-Id: <20200709105145.9211-5-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqIqx000584
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 57/74] libmultipath: update_mpp_paths(): handle
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Since the ancient commit b96dead ("[multipathd] remove the retry login in
uev_remove_path()"), update_mpp_paths() was used to check whether devices
found in disassembled maps were still in the pathvec, and to skip them
while re-assembling the new params string on reload. The reason was to
deal with failed reloads. With the introduction of INIT_REMOVED, we
need to skip paths in that state, too. Moreover, past reloads may have
succeeded in removing REMOVED paths from the map, so check if any
INIT_REMOVED paths can now be deleted for good. This is the right
place to do this check, because update_mpp_paths() is called after
obtaining the current kernel state, and before reloading.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 27d6547..8999552 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -29,6 +29,7 @@ int update_mpp_paths(struct multipath *mpp, vector pathvec)
 	struct pathgroup * pgp;
 	struct path * pp;
 	int i,j;
+	bool store_failure = false;
 
 	if (!mpp || !mpp->pg)
 		return 0;
@@ -39,13 +40,23 @@ int update_mpp_paths(struct multipath *mpp, vector pathvec)
 
 	vector_foreach_slot (mpp->pg, pgp, i) {
 		vector_foreach_slot (pgp->paths, pp, j) {
-			if (!find_path_by_devt(mpp->paths, pp->dev_t) &&
-			    (find_path_by_devt(pathvec, pp->dev_t)) &&
-			    store_path(mpp->paths, pp))
-				return 1;
+			if (!find_path_by_devt(mpp->paths, pp->dev_t)) {
+				struct path *pp1;
+
+				/*
+				 * Avoid adding removed paths to the map again
+				 * when we reload it. Such paths may exist if
+				 * domap fails in ev_remove_path().
+				 */
+				pp1 = find_path_by_devt(pathvec, pp->dev_t);
+				if (pp1 && pp->initialized != INIT_REMOVED &&
+				    store_path(mpp->paths, pp))
+					store_failure = true;
+			}
 		}
 	}
-	return 0;
+
+	return store_failure;
 }
 
 int adopt_paths(vector pathvec, struct multipath *mpp)
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

