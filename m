Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4F98D219E4B
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-TOTgZOlfMWKYcP87h-FJQA-1; Thu, 09 Jul 2020 06:52:39 -0400
X-MC-Unique: TOTgZOlfMWKYcP87h-FJQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BAF51093;
	Thu,  9 Jul 2020 10:52:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A63790E61;
	Thu,  9 Jul 2020 10:52:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE6101809557;
	Thu,  9 Jul 2020 10:52:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqKQq000636 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A81B5F258; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8591E5F253
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DBE4188498C
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-488-f-3NBJEnO_C1VqMnlWzU1g-1;
	Thu, 09 Jul 2020 06:52:18 -0400
X-MC-Unique: f-3NBJEnO_C1VqMnlWzU1g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9F7C0AF01;
	Thu,  9 Jul 2020 10:52:15 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:43 +0200
Message-Id: <20200709105145.9211-20-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqKQq000636
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 72/74] libmpathpersist: use
	update_pathvec_from_dm()
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

The libmpathpersist-specific function updatepaths() can be replaced
with the generic function.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmpathpersist/mpath_persist.c | 54 +--------------------------------
 1 file changed, 1 insertion(+), 53 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index cb3182f..0c66ff3 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -65,52 +65,6 @@ mpath_lib_exit (struct config *conf)
 	return 0;
 }
 
-static int
-updatepaths (struct multipath * mpp)
-{
-	int i, j;
-	struct pathgroup * pgp;
-	struct path * pp;
-	struct config *conf;
-
-	if (!mpp->pg)
-		return 0;
-
-	vector_foreach_slot (mpp->pg, pgp, i){
-		if (!pgp->paths)
-			continue;
-
-		vector_foreach_slot (pgp->paths, pp, j){
-			if (!strlen(pp->dev)){
-				/*
-				 * path is not in sysfs anymore
-				 */
-				pp->state = PATH_DOWN;
-				continue;
-			}
-			pp->mpp = mpp;
-			if (pp->udev == NULL) {
-				pp->udev = get_udev_device(pp->dev_t, DEV_DEVT);
-				if (pp->udev == NULL) {
-					pp->state = PATH_DOWN;
-					continue;
-				}
-				conf = get_multipath_config();
-				pathinfo(pp, conf, DI_SYSFS|DI_CHECKER);
-				put_multipath_config(conf);
-				continue;
-			}
-			if (pp->state == PATH_UNCHECKED ||
-					pp->state == PATH_WILD) {
-				conf = get_multipath_config();
-				pathinfo(pp, conf, DI_CHECKER);
-				put_multipath_config(conf);
-			}
-		}
-	}
-	return 0;
-}
-
 int
 mpath_prin_activepath (struct multipath *mpp, int rq_servact,
 	struct prin_resp * resp, int noisy)
@@ -392,13 +346,7 @@ get_mpvec (vector curmp, vector pathvec, char * refwwid)
 		dm_get_status(mpp->alias, status);
 		condlog(3, "status = %s", status);
 		disassemble_map (pathvec, params, mpp);
-
-		/*
-		 * disassemble_map() can add new paths to pathvec.
-		 * If not in "fast list mode", we need to fetch information
-		 * about them
-		 */
-		updatepaths(mpp);
+		update_pathvec_from_dm(pathvec, mpp, DI_CHECKER);
 		disassemble_status (status, mpp);
 
 	}
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

