Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 989CF2644BA
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 12:54:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-NL_SRjHzMRuG1BZAizjWGg-1; Thu, 10 Sep 2020 06:54:07 -0400
X-MC-Unique: NL_SRjHzMRuG1BZAizjWGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B7938018A1;
	Thu, 10 Sep 2020 10:54:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDAB981F45;
	Thu, 10 Sep 2020 10:54:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6FF63922E8;
	Thu, 10 Sep 2020 10:54:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AAruXa023733 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 06:53:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B8E6C115D7A2; Thu, 10 Sep 2020 10:53:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4AA2115D7A1
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:53:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B965E801181
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:53:52 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-10-FkyjeRA9N2qLZX-smw9njw-1; Thu, 10 Sep 2020 06:53:48 -0400
X-MC-Unique: FkyjeRA9N2qLZX-smw9njw-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 8B5299AA68D606D25859;
	Thu, 10 Sep 2020 18:53:45 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.208) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 10 Sep 2020 18:53:39 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
Message-ID: <29dcdbb2-8154-cb13-a48e-1379200a6814@huawei.com>
Date: Thu, 10 Sep 2020 18:53:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
X-Originating-IP: [10.174.178.208]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH V4 12/14] libmultipathpersist: use
 update_multipath_table/status, in get_mpvec
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

The return values of dm_get_map, disassemble_map in get_mpvec
were not checked. Use update_multipath_table/status to instead
of them. If these function fail, call remove_map

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 libmpathpersist/mpath_persist.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index e7256049..1f9817ed 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -323,7 +323,6 @@ get_mpvec (vector curmp, vector pathvec, char * refwwid)
 {
 	int i;
 	struct multipath *mpp;
-	char params[PARAMS_SIZE], status[PARAMS_SIZE];

 	vector_foreach_slot (curmp, mpp, i){
 		/*
@@ -341,14 +340,12 @@ get_mpvec (vector curmp, vector pathvec, char * refwwid)
 		if (refwwid && strncmp (mpp->alias, refwwid, WWID_SIZE - 1))
 			continue;

-		dm_get_map(mpp->alias, &mpp->size, params);
-		condlog(3, "params = %s", params);
-		dm_get_status(mpp->alias, status);
-		condlog(3, "status = %s", status);
-		disassemble_map (pathvec, params, mpp);
-		update_pathvec_from_dm(pathvec, mpp, DI_CHECKER);
-		disassemble_status (status, mpp);
-
+		if (update_multipath_table(mpp, pathvec, DI_CHECKER) != DMP_OK ||
+		    update_multipath_status(mpp) != DMP_OK) {
+			condlog(1, "error parsing map %s", mpp->wwid);
+			remove_map(mpp, pathvec, curmp, PURGE_VEC);
+			i--;
+		}
 	}
 	return MPATH_PR_SUCCESS ;
 }
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

