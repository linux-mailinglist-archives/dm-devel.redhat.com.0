Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D879824D6AE
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 15:55:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-415W1pTDPPmYTLqCFkT3ew-1; Fri, 21 Aug 2020 09:55:30 -0400
X-MC-Unique: 415W1pTDPPmYTLqCFkT3ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93BF7107465C;
	Fri, 21 Aug 2020 13:55:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51780756DC;
	Fri, 21 Aug 2020 13:55:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DFE2183D021;
	Fri, 21 Aug 2020 13:55:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LDtFvj002987 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 09:55:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DC0F1009BA1; Fri, 21 Aug 2020 13:55:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 695241009A05
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 13:55:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B70590184F
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 13:55:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-298-sdMeBhBJMYG_vfJ026gC0g-1;
	Fri, 21 Aug 2020 09:55:08 -0400
X-MC-Unique: sdMeBhBJMYG_vfJ026gC0g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3869AB170;
	Fri, 21 Aug 2020 13:55:35 +0000 (UTC)
From: mwilck@suse.com
To: lixiaokeng@huawei.com
Date: Fri, 21 Aug 2020 15:54:18 +0200
Message-Id: <20200821135418.28138-4-mwilck@suse.com>
In-Reply-To: <20200821135418.28138-1-mwilck@suse.com>
References: <20200821135418.28138-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07LDtFvj002987
X-loop: dm-devel@redhat.com
Cc: Martin Wilck <mwilck@suse.com>, dm-devel@redhat.com,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 3/3] multipath: get_dm_mpvec: discard broken maps
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Use the same logic as map_discovery() to discard maps that
couldn't be parsed successfully. If map parsing fails,
certain vital fields of the mpp, like features or hwhandler,
will not be set, which might cause multipath to crash later on.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 80bc4b5..2d7ec74 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -193,7 +193,7 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
 {
 	int i;
 	struct multipath * mpp;
-	char params[PARAMS_SIZE], status[PARAMS_SIZE];
+	int flags = (cmd == CMD_LIST_SHORT ? DI_NOIO : DI_ALL);
 
 	if (dm_get_maps(curmp))
 		return 1;
@@ -205,27 +205,22 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
 		if (refwwid && strlen(refwwid) &&
 		    strncmp(mpp->wwid, refwwid, WWID_SIZE)) {
 			condlog(3, "skip map %s: out of scope", mpp->alias);
-			free_multipath(mpp, KEEP_PATHS);
-			vector_del_slot(curmp, i);
+			remove_map(mpp, pathvec, curmp, PURGE_VEC);
 			i--;
 			continue;
 		}
 
-		dm_get_map(mpp->alias, &mpp->size, params);
-		condlog(3, "params = %s", params);
-		dm_get_status(mpp->alias, status);
-		condlog(3, "status = %s", status);
-
-		disassemble_map(pathvec, params, mpp);
-		update_pathvec_from_dm(pathvec, mpp,
-				       (cmd == CMD_LIST_SHORT ?
-					DI_NOIO : DI_ALL));
+		if (update_multipath_table(mpp, pathvec, flags) != DMP_OK ||
+		    update_multipath_status(mpp) != DMP_OK) {
+			condlog(1, "error parsing map %s", mpp->wwid);
+			remove_map(mpp, pathvec, curmp, PURGE_VEC);
+			i--;
+			continue;
+		}
 
 		if (cmd == CMD_LIST_LONG)
 			mpp->bestpg = select_path_group(mpp);
 
-		disassemble_status(status, mpp);
-
 		if (cmd == CMD_LIST_SHORT ||
 		    cmd == CMD_LIST_LONG) {
 			struct config *conf = get_multipath_config();
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

