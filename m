Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7854F25A646
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 09:18:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-CI16oeeJPmi_-Kk13T85ew-1; Wed, 02 Sep 2020 03:18:24 -0400
X-MC-Unique: CI16oeeJPmi_-Kk13T85ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2E321005E66;
	Wed,  2 Sep 2020 07:18:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92CA37EEB9;
	Wed,  2 Sep 2020 07:18:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E24C79A3D;
	Wed,  2 Sep 2020 07:18:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0827IFtA027129 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 03:18:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 272BCB552E; Wed,  2 Sep 2020 07:18:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22B95B5523
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:18:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBAE4811E76
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 07:18:12 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-557-ADKhZHQpPu2xpiNEJ3PbDw-1; Wed, 02 Sep 2020 03:18:08 -0400
X-MC-Unique: ADKhZHQpPu2xpiNEJ3PbDw-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 9570B40D9EA7C18806C5;
	Wed,  2 Sep 2020 15:18:03 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Sep 2020
	15:17:57 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
Message-ID: <8b45a04b-c851-94ba-fcba-676c03b060e7@huawei.com>
Date: Wed, 2 Sep 2020 15:17:56 +0800
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 04/14] multipathd: check MALLOC return value in,
 mpath_pr_event_handler_fn
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

In  mpath_pr_event_handler_fn, we use MALLOC instead of malloc, and check
the return value of MALLOC.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 multipathd/main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 67e9af11..7180d3c1 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3391,8 +3391,12 @@ void *  mpath_pr_event_handler_fn (void * pathp )
 		goto out;
 	}

-	param= malloc(sizeof(struct prout_param_descriptor));
-	memset(param, 0 , sizeof(struct prout_param_descriptor));
+	param = (struct prout_param_descriptor *)MALLOC(sizeof(struct prout_param_descriptor));
+	if (!param) {
+		ret = MPATH_PR_OTHER;
+		goto out;
+	}
+
 	param->sa_flags = mpp->sa_flags;
 	memcpy(param->sa_key, &mpp->reservation_key, 8);
 	param->num_transportid = 0;
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

