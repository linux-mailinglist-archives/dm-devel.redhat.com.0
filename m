Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1280D2AB032
	for <lists+dm-devel@lfdr.de>; Mon,  9 Nov 2020 05:32:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-05WoLQzVMAm0NGJEfYFuxw-1; Sun, 08 Nov 2020 23:32:46 -0500
X-MC-Unique: 05WoLQzVMAm0NGJEfYFuxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D62E3800C60;
	Mon,  9 Nov 2020 04:32:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 377A91002C3A;
	Mon,  9 Nov 2020 04:32:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3BBF044A5B;
	Mon,  9 Nov 2020 04:32:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A94WOuB025263 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 8 Nov 2020 23:32:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7BBD747CD9; Mon,  9 Nov 2020 04:32:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 766F747CD2
	for <dm-devel@redhat.com>; Mon,  9 Nov 2020 04:32:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 001738582AA
	for <dm-devel@redhat.com>; Mon,  9 Nov 2020 04:32:22 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com
	[45.249.212.191]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-386-w5VpNyjjNWuofEn4wp9dNg-1; Sun, 08 Nov 2020 23:32:19 -0500
X-MC-Unique: w5VpNyjjNWuofEn4wp9dNg-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CTykr1s1LzLwJL;
	Mon,  9 Nov 2020 12:32:04 +0800 (CST)
Received: from [10.174.177.208] (10.174.177.208) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 9 Nov 2020 12:32:05 +0800
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>,
	dm-devel mailing list <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <5ce8950b-dccb-1083-b17e-f878d2a596f9@huawei.com>
Date: Mon, 9 Nov 2020 12:32:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.177.208]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: "liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>,
	linux-lvm-request@redhat.com
Subject: [dm-devel] [PATCH v4] libmultipath: fix memory leaks in
	coalesce_paths
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When multipath -F are executed first and multipath -v2 or
-d are executed later, asan will warn memory leaks. The
reason is that the mpp allocated in coalesce_paths isn't
freed. Here we use newmp to store mpp. If newmp need not
be copied to mpvec, we free newmp at the end of the func.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 libmultipath/configure.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 6fb477fc..2547e1d5 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1132,7 +1132,7 @@ out:
  * FORCE_RELOAD_WEAK: existing maps are compared to the current conf and only
  * reloaded in DM if there's a difference. This is useful during startup.
  */
-int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
+int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 		    int force_reload, enum mpath_cmds cmd)
 {
 	int ret = CP_FAIL;
@@ -1144,6 +1144,7 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 	struct path * pp2;
 	vector curmp = vecs->mpvec;
 	vector pathvec = vecs->pathvec;
+	vector newmp;
 	struct config *conf;
 	int allow_queueing;
 	struct bitfield *size_mismatch_seen;
@@ -1164,6 +1165,15 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 	if (size_mismatch_seen == NULL)
 		return CP_FAIL;

+	if (mpvec)
+		newmp = mpvec;
+	else
+		newmp = vector_alloc();
+	if (!newmp) {
+		condlog(0, "can not allocate newmp");
+		goto out;
+	}
+
 	vector_foreach_slot (pathvec, pp1, k) {
 		int invalid;
 		/* skip this path for some reason */
@@ -1270,8 +1280,14 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 				goto out;
 			}
 		}
-		if (r == DOMAP_DRY)
+		if (r == DOMAP_DRY) {
+			if (!vector_alloc_slot(newmp)) {
+				remove_map(mpp, vecs->pathvec, vecs->mpvec, KEEP_VEC);
+				goto out;
+			}
+			vector_set_slot(newmp, mpp);
 			continue;
+		}

 		if (r == DOMAP_EXIST && mpp->action == ACT_NOTHING &&
 		    force_reload == FORCE_RELOAD_WEAK)
@@ -1307,22 +1323,22 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 			print_multipath_topology(mpp, verbosity);
 		}

-		if (newmp) {
-			if (mpp->action != ACT_REJECT) {
-				if (!vector_alloc_slot(newmp))
-					goto out;
-				vector_set_slot(newmp, mpp);
+		if (mpp->action != ACT_REJECT) {
+			if (!vector_alloc_slot(newmp)) {
+				remove_map(mpp, vecs->pathvec, vecs->mpvec, KEEP_VEC);
+				goto out;
 			}
-			else
-				remove_map(mpp, vecs->pathvec, vecs->mpvec,
-					   KEEP_VEC);
+			vector_set_slot(newmp, mpp);
 		}
+		else
+			remove_map(mpp, vecs->pathvec, vecs->mpvec,
+				   KEEP_VEC);
 	}
 	/*
 	 * Flush maps with only dead paths (ie not in sysfs)
 	 * Keep maps with only failed paths
 	 */
-	if (newmp) {
+	if (mpvec) {
 		vector_foreach_slot (newmp, mpp, i) {
 			char alias[WWID_SIZE];

@@ -1345,6 +1361,8 @@ int coalesce_paths (struct vectors * vecs, vector newmp, char * refwwid,
 	ret = CP_OK;
 out:
 	free(size_mismatch_seen);
+	if (!mpvec)
+		free_multipathvec(newmp, KEEP_PATHS);
 	return ret;
 }

-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

