Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E6915264492
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 12:49:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-eCmH1KeUO5a9wWjS7LW5XQ-1; Thu, 10 Sep 2020 06:49:08 -0400
X-MC-Unique: eCmH1KeUO5a9wWjS7LW5XQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EF1D8030DD;
	Thu, 10 Sep 2020 10:49:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFB9B27BD0;
	Thu, 10 Sep 2020 10:49:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6AA49181A270;
	Thu, 10 Sep 2020 10:49:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AAmxsB023224 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 06:48:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 093A12023438; Thu, 10 Sep 2020 10:48:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6EC2023598
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:48:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6883811E7A
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:48:54 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-535-VZEvfNZeNxWe87MNc1J3Hw-1; Thu, 10 Sep 2020 06:48:52 -0400
X-MC-Unique: VZEvfNZeNxWe87MNc1J3Hw-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id E71412E258F5D5F3465E;
	Thu, 10 Sep 2020 18:48:46 +0800 (CST)
Received: from [127.0.0.1] (10.174.178.208) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 10 Sep 2020 18:48:36 +0800
From: lixiaokeng <lixiaokeng@huawei.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, "dm-devel
	mailing list" <dm-devel@redhat.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
Message-ID: <c1041522-f3e6-7d1f-3fd0-34c356230b5a@huawei.com>
Date: Thu, 10 Sep 2020 18:48:35 +0800
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH V4 04/14] multipathd: check MALLOC return value
 in mpath_pr_event_handler_fn
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

In  mpath_pr_event_handler_fn, we use MALLOC instead of malloc, and check
the return value of MALLOC. And we delete seting ret when jump to out

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 multipathd/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 67e9af11..f1264459 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3365,7 +3365,6 @@ void *  mpath_pr_event_handler_fn (void * pathp )
 	if (resp->prin_descriptor.prin_readkeys.additional_length == 0 )
 	{
 		condlog(1, "%s: No key found. Device may not be registered.", pp->dev);
-		ret = MPATH_PR_SUCCESS;
 		goto out;
 	}
 	condlog(2, "Multipath  reservation_key: 0x%" PRIx64 " ",
@@ -3387,12 +3386,13 @@ void *  mpath_pr_event_handler_fn (void * pathp )
 	{
 		condlog(0, "%s: Either device not registered or ", pp->dev);
 		condlog(0, "host is not authorised for registration. Skip path");
-		ret = MPATH_PR_OTHER;
 		goto out;
 	}

-	param= malloc(sizeof(struct prout_param_descriptor));
-	memset(param, 0 , sizeof(struct prout_param_descriptor));
+	param = (struct prout_param_descriptor *)MALLOC(sizeof(struct prout_param_descriptor));
+	if (!param)
+		goto out;
+
 	param->sa_flags = mpp->sa_flags;
 	memcpy(param->sa_key, &mpp->reservation_key, 8);
 	param->num_transportid = 0;
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

