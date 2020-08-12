Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BCC472428C6
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-5BZ-74uMNtukFtNx_5S4xA-1; Wed, 12 Aug 2020 07:36:01 -0400
X-MC-Unique: 5BZ-74uMNtukFtNx_5S4xA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AAEC1006711;
	Wed, 12 Aug 2020 11:35:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4371261982;
	Wed, 12 Aug 2020 11:35:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE2C2A555E;
	Wed, 12 Aug 2020 11:35:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBZfE8028779 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:35:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B455910EE929; Wed, 12 Aug 2020 11:35:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B05E910EE928
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 976F31859164
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-455-NLzCttJLNIKS1CM7SoGdKg-1;
	Wed, 12 Aug 2020 07:35:38 -0400
X-MC-Unique: NLzCttJLNIKS1CM7SoGdKg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 569A7B70C;
	Wed, 12 Aug 2020 11:35:58 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:11 +0200
Message-Id: <20200812113511.26469-9-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBZfE8028779
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 71/74] multipath: use update_pathvec_from_dm()
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

The multipath-specific function update_paths() can now be replaced with
a call to update_pathvec_from_dm().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c |  2 +-
 multipath/main.c           | 68 +++-----------------------------------
 2 files changed, 5 insertions(+), 65 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 07027f5..2d85df9 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -150,7 +150,7 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 			 * we know that the path is in pathvec already.
 			 */
 			if (pp->udev) {
-				if (pathinfo_flags) {
+				if (pathinfo_flags & ~DI_NOIO) {
 					conf = get_multipath_config();
 					pthread_cleanup_push(put_multipath_config,
 							     conf);
diff --git a/multipath/main.c b/multipath/main.c
index a144bc3..9d6b482 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -187,63 +187,6 @@ usage (char * progname)
 
 }
 
-static int
-update_paths (struct multipath * mpp, int quick)
-{
-	int i, j;
-	struct pathgroup * pgp;
-	struct path * pp;
-	struct config *conf;
-
-	if (!mpp->pg)
-		return 0;
-
-	vector_foreach_slot (mpp->pg, pgp, i) {
-		if (!pgp->paths)
-			continue;
-
-		vector_foreach_slot (pgp->paths, pp, j) {
-			if (!strlen(pp->dev)) {
-				if (devt2devname(pp->dev, FILE_NAME_SIZE,
-						 pp->dev_t)) {
-					/*
-					 * path is not in sysfs anymore
-					 */
-					pp->chkrstate = pp->state = PATH_DOWN;
-					pp->offline = 1;
-					continue;
-				}
-				pp->mpp = mpp;
-				if (quick)
-					continue;
-				conf = get_multipath_config();
-				if (pathinfo(pp, conf, DI_ALL))
-					pp->state = PATH_UNCHECKED;
-				put_multipath_config(conf);
-				continue;
-			}
-			pp->mpp = mpp;
-			if (quick)
-				continue;
-			if (pp->state == PATH_UNCHECKED ||
-			    pp->state == PATH_WILD) {
-				conf = get_multipath_config();
-				if (pathinfo(pp, conf, DI_CHECKER))
-					pp->state = PATH_UNCHECKED;
-				put_multipath_config(conf);
-			}
-
-			if (pp->priority == PRIO_UNDEF) {
-				conf = get_multipath_config();
-				if (pathinfo(pp, conf, DI_PRIO))
-					pp->priority = PRIO_UNDEF;
-				put_multipath_config(conf);
-			}
-		}
-	}
-	return 0;
-}
-
 static int
 get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
 {
@@ -273,13 +216,9 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
 		condlog(3, "status = %s", status);
 
 		disassemble_map(pathvec, params, mpp);
-
-		/*
-		 * disassemble_map() can add new paths to pathvec.
-		 * If not in "fast list mode", we need to fetch information
-		 * about them
-		 */
-		update_paths(mpp, (cmd == CMD_LIST_SHORT));
+		update_pathvec_from_dm(pathvec, mpp,
+				       (cmd == CMD_LIST_SHORT ?
+					DI_NOIO : DI_ALL));
 
 		if (cmd == CMD_LIST_LONG)
 			mpp->bestpg = select_path_group(mpp);
@@ -353,6 +292,7 @@ static int check_usable_paths(struct config *conf,
 	dm_get_map(mpp->alias, &mpp->size, params);
 	dm_get_status(mpp->alias, status);
 	disassemble_map(pathvec, params, mpp);
+	update_pathvec_from_dm(pathvec, mpp, 0);
 	disassemble_status(status, mpp);
 
 	vector_foreach_slot (mpp->pg, pg, i) {
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

