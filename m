Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0AE25A6AD
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:25:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-qmEPfT6SPxKdM_IKqz7ARA-1; Wed, 02 Sep 2020 03:25:53 -0400
X-MC-Unique: qmEPfT6SPxKdM_IKqz7ARA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D3210059A7;
	Wed,  2 Sep 2020 07:25:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0AD11045EB6;
	Wed,  2 Sep 2020 07:25:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54C3279DAB;
	Wed,  2 Sep 2020 07:25:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827Ph25028145 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:25:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A0482022E00; Wed,  2 Sep 2020 07:25:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95A4A2023438
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:25:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E83118AE948
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:25:41 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-39-5WKf-zPhPhikVxzG443dRA-1; Wed, 02 Sep 2020 03:25:38 -0400
X-MC-Unique: 5WKf-zPhPhikVxzG443dRA-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 0C13FCAD7BED927D3F43;
	Wed,  2 Sep 2020 15:25:35 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Sep 2020
	15:25:28 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
Message-ID: <78021dc0-bede-f376-b450-40dd5522786b@huawei.com>
Date: Wed, 2 Sep 2020 15:25:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 13/14] multipath: use
 update_multipath_table/status in, check_useable_paths
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

The return values of dm_get_map, disassemble_map,dm_get_status
and disassemble_status in check_usable_paths were not checked.
Use update_multipath_table/status to instead of them.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 multipath/main.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index d227e0b3..9e920d89 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -251,7 +251,6 @@ static int check_usable_paths(struct config *conf,
 	struct path *pp;
 	char *mapname;
 	vector pathvec = NULL;
-	char params[PARAMS_SIZE], status[PARAMS_SIZE];
 	dev_t devt;
 	int r = 1, i, j;

@@ -285,11 +284,9 @@ static int check_usable_paths(struct config *conf,
 	if (mpp == NULL)
 		goto free;

-	dm_get_map(mpp->alias, &mpp->size, params);
-	dm_get_status(mpp->alias, status);
-	disassemble_map(pathvec, params, mpp);
-	update_pathvec_from_dm(pathvec, mpp, 0);
-	disassemble_status(status, mpp);
+	if (update_multipath_table(mpp, pathvec, 0) != DMP_OK ||
+		    update_multipath_status(mpp) != DMP_OK)
+		    goto free;

 	vector_foreach_slot (mpp->pg, pg, i) {
 		vector_foreach_slot (pg->paths, pp, j) {
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

