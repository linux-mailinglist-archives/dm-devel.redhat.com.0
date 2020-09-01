Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 866F0258830
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 08:28:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-7xBYT-UQM7-3hC9ile_RXw-1; Tue, 01 Sep 2020 02:27:18 -0400
X-MC-Unique: 7xBYT-UQM7-3hC9ile_RXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BAEE107465D;
	Tue,  1 Sep 2020 06:27:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36C5D1002D57;
	Tue,  1 Sep 2020 06:27:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E09C379A32;
	Tue,  1 Sep 2020 06:27:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0816QV0Z015848 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Sep 2020 02:26:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59D3A2028DC0; Tue,  1 Sep 2020 06:26:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5499A200A4F4
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 06:26:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7028E8008A5
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 06:26:28 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-358-TEngSjLjOkmyZiJ_96Xvbg-1; Tue, 01 Sep 2020 02:26:24 -0400
X-MC-Unique: TEngSjLjOkmyZiJ_96Xvbg-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id C4637D7DA851499A64BA;
	Tue,  1 Sep 2020 14:26:18 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Sep 2020
	14:26:11 +0800
From: Ye Bin <yebin10@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Tue, 1 Sep 2020 14:25:42 +0800
Message-ID: <20200901062544.827277-2-yebin10@huawei.com>
In-Reply-To: <20200901062544.827277-1-yebin10@huawei.com>
References: <20200901062544.827277-1-yebin10@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
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
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0816QV0Z015848
X-loop: dm-devel@redhat.com
Cc: Ye Bin <yebin10@huawei.com>
Subject: [dm-devel] [PATCH v2 1/3] dm cache metadata: Avoid return pmd->bm
	wild pointer when process with error
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

Maybe caller will use PTR_ERR as a pointer, it will lead to some strange things.

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/md/dm-cache-metadata.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-cache-metadata.c b/drivers/md/dm-cache-metadata.c
index 151aa95775be..af6d4f898e4c 100644
--- a/drivers/md/dm-cache-metadata.c
+++ b/drivers/md/dm-cache-metadata.c
@@ -537,12 +537,16 @@ static int __create_persistent_data_objects(struct dm_cache_metadata *cmd,
 					  CACHE_MAX_CONCURRENT_LOCKS);
 	if (IS_ERR(cmd->bm)) {
 		DMERR("could not create block manager");
-		return PTR_ERR(cmd->bm);
+		r = PTR_ERR(cmd->bm);
+		cmd->bm = NULL;
+		return r;
 	}
 
 	r = __open_or_format_metadata(cmd, may_format_device);
-	if (r)
+	if (r) {
 		dm_block_manager_destroy(cmd->bm);
+		cmd->bm = NULL;
+	}
 
 	return r;
 }
-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

