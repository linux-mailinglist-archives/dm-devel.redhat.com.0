Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5E724DB57
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 18:38:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-My1X0b2lPj6mTGBWqWmYVg-1; Fri, 21 Aug 2020 12:38:19 -0400
X-MC-Unique: My1X0b2lPj6mTGBWqWmYVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21CB21084C9D;
	Fri, 21 Aug 2020 16:38:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F12631014186;
	Fri, 21 Aug 2020 16:38:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC48A662C3;
	Fri, 21 Aug 2020 16:38:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07L9hRTi003754 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 05:43:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92EA1F559F; Fri, 21 Aug 2020 09:43:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EDECF51AD
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 09:43:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 887B48EDF0A
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 09:43:24 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-457-PTEgR-XVPq-vu8NNtafiGA-1; Fri, 21 Aug 2020 05:43:22 -0400
X-MC-Unique: PTEgR-XVPq-vu8NNtafiGA-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 64ED8E3C59C40406725E;
	Fri, 21 Aug 2020 17:27:19 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Fri, 21 Aug 2020
	17:27:08 +0800
From: Ye Bin <yebin10@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Fri, 21 Aug 2020 17:26:48 +0800
Message-ID: <20200821092651.1587859-2-yebin10@huawei.com>
In-Reply-To: <20200821092651.1587859-1-yebin10@huawei.com>
References: <20200821092651.1587859-1-yebin10@huawei.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07L9hRTi003754
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 21 Aug 2020 12:37:46 -0400
Cc: yebin10@huawei.com
Subject: [dm-devel] [PATCH 1/4] dm thin metadata: Avoid return pmd->bm wild
	pointer when process with error
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

Maybe caller will use PTR_ERR as a pointer, it will lead to some strange
things.

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/md/dm-thin-metadata.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index 76b6b323bf4b..ddb7f1f0bc48 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -739,12 +739,16 @@ static int __create_persistent_data_objects(struct dm_pool_metadata *pmd, bool f
 					  THIN_MAX_CONCURRENT_LOCKS);
 	if (IS_ERR(pmd->bm)) {
 		DMERR("could not create block manager");
-		return PTR_ERR(pmd->bm);
+		r = PTR_ERR(pmd->bm);
+		pmd->bm = NULL;
+		return r;
 	}
 
 	r = __open_or_format_metadata(pmd, format_device);
-	if (r)
+	if (r) {
 		dm_block_manager_destroy(pmd->bm);
+		pmd->bm = NULL;
+	}
 
 	return r;
 }
-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

