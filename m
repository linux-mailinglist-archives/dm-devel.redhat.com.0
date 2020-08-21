Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E417224D6AF
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 15:55:35 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-9Cwk3AFSNYCmsUB1K3Z-Iw-1; Fri, 21 Aug 2020 09:55:32 -0400
X-MC-Unique: 9Cwk3AFSNYCmsUB1K3Z-Iw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDED1107465F;
	Fri, 21 Aug 2020 13:55:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD2FC5F706;
	Fri, 21 Aug 2020 13:55:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F8D860348;
	Fri, 21 Aug 2020 13:55:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LDtFhp002988 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 09:55:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DD151009BA3; Fri, 21 Aug 2020 13:55:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 695741009B95
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 13:55:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3286090184D
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 13:55:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-349-DiUyXeXPPx2RScWx6mCHcw-1;
	Fri, 21 Aug 2020 09:55:08 -0400
X-MC-Unique: DiUyXeXPPx2RScWx6mCHcw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B4DB1B592;
	Fri, 21 Aug 2020 13:55:34 +0000 (UTC)
From: mwilck@suse.com
To: lixiaokeng@huawei.com
Date: Fri, 21 Aug 2020 15:54:16 +0200
Message-Id: <20200821135418.28138-2-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07LDtFhp002988
X-loop: dm-devel@redhat.com
Cc: Martin Wilck <mwilck@suse.com>, dm-devel@redhat.com,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 1/3] libmultipath: update_multipath_table(): add
	flags argument
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

... to be passed to update_pathvec_from_dm().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 6 +++---
 libmultipath/structs_vec.h | 2 +-
 multipathd/main.c          | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index cc2dafa..3d4f855 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -406,7 +406,7 @@ extract_hwe_from_path(struct multipath * mpp)
 }
 
 int
-update_multipath_table (struct multipath *mpp, vector pathvec)
+update_multipath_table (struct multipath *mpp, vector pathvec, int flags)
 {
 	int r = DMP_ERR;
 	char params[PARAMS_SIZE] = {0};
@@ -426,7 +426,7 @@ update_multipath_table (struct multipath *mpp, vector pathvec)
 	}
 
 	/* FIXME: we should deal with the return value here */
-	update_pathvec_from_dm(pathvec, mpp, 0);
+	update_pathvec_from_dm(pathvec, mpp, flags);
 
 	return DMP_OK;
 }
@@ -532,7 +532,7 @@ update_multipath_strings(struct multipath *mpp, vector pathvec)
 	free_pgvec(mpp->pg, KEEP_PATHS);
 	mpp->pg = NULL;
 
-	r = update_multipath_table(mpp, pathvec);
+	r = update_multipath_table(mpp, pathvec, 0);
 	if (r != DMP_OK)
 		return r;
 	sync_paths(mpp, pathvec);
diff --git a/libmultipath/structs_vec.h b/libmultipath/structs_vec.h
index 39cb074..478168f 100644
--- a/libmultipath/structs_vec.h
+++ b/libmultipath/structs_vec.h
@@ -39,7 +39,7 @@ struct multipath * add_map_with_path (struct vectors * vecs,
 				struct path * pp, int add_vec);
 void update_queue_mode_del_path(struct multipath *mpp);
 void update_queue_mode_add_path(struct multipath *mpp);
-int update_multipath_table (struct multipath *mpp, vector pathvec);
+int update_multipath_table (struct multipath *mpp, vector pathvec, int flags);
 int update_multipath_status (struct multipath *mpp);
 vector get_used_hwes(const struct _vector *pathvec);
 
diff --git a/multipathd/main.c b/multipathd/main.c
index 9f12a57..b8019ec 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -552,7 +552,7 @@ add_map_without_path (struct vectors *vecs, const char *alias)
 	mpp->mpe = find_mpe(conf->mptable, mpp->wwid);
 	put_multipath_config(conf);
 
-	if (update_multipath_table(mpp, vecs->pathvec) != DMP_OK)
+	if (update_multipath_table(mpp, vecs->pathvec, 0) != DMP_OK)
 		goto out;
 	if (update_multipath_status(mpp) != DMP_OK)
 		goto out;
@@ -1412,7 +1412,7 @@ map_discovery (struct vectors * vecs)
 		return 1;
 
 	vector_foreach_slot (vecs->mpvec, mpp, i)
-		if (update_multipath_table(mpp, vecs->pathvec) != DMP_OK ||
+		if (update_multipath_table(mpp, vecs->pathvec, 0) != DMP_OK ||
 		    update_multipath_status(mpp) != DMP_OK) {
 			remove_map(mpp, vecs, 1);
 			i--;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

