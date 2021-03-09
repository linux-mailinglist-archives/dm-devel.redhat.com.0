Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9F23325F4
	for <lists+dm-devel@lfdr.de>; Tue,  9 Mar 2021 14:01:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-QTfTfYXZO_SiiFN5pu58tA-1; Tue, 09 Mar 2021 08:01:34 -0500
X-MC-Unique: QTfTfYXZO_SiiFN5pu58tA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89FB91054FA2;
	Tue,  9 Mar 2021 13:01:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B9460C04;
	Tue,  9 Mar 2021 13:01:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A42705FBDA;
	Tue,  9 Mar 2021 13:01:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1299bd1w020884 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Mar 2021 04:37:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 74353345A6; Tue,  9 Mar 2021 09:37:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BC5D345B7
	for <dm-devel@redhat.com>; Tue,  9 Mar 2021 09:37:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE66800B33
	for <dm-devel@redhat.com>; Tue,  9 Mar 2021 09:37:31 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
	(out30-57.freemail.mail.aliyun.com [115.124.30.57]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-564-_jt9T4BuOzatczfYRXJtNA-1;
	Tue, 09 Mar 2021 04:37:27 -0500
X-MC-Unique: _jt9T4BuOzatczfYRXJtNA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R321e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UR4aFol_1615282321
Received: from
	j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
	fp:SMTPD_---0UR4aFol_1615282321) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 09 Mar 2021 17:32:02 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: agk@redhat.com
Date: Tue,  9 Mar 2021 17:32:00 +0800
Message-Id: <1615282320-28246-1-git-send-email-yang.lee@linux.alibaba.com>
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
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:01:10 -0500
Cc: dm-devel@redhat.com, Yang Li <yang.lee@linux.alibaba.com>,
	linux-kernel@vger.kernel.org, snitzer@redhat.com
Subject: [dm-devel] [PATCH] dm: remove unneeded variable 'sz'
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix the following coccicheck warning:
./drivers/md/dm-ps-service-time.c:85:10-12: Unneeded variable: "sz".
Return "0" on line 105

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/md/dm-ps-service-time.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm-ps-service-time.c b/drivers/md/dm-ps-service-time.c
index 9cfda66..12dd5ce 100644
--- a/drivers/md/dm-ps-service-time.c
+++ b/drivers/md/dm-ps-service-time.c
@@ -82,7 +82,6 @@ static void st_destroy(struct path_selector *ps)
 static int st_status(struct path_selector *ps, struct dm_path *path,
 		     status_type_t type, char *result, unsigned maxlen)
 {
-	unsigned sz = 0;
 	struct path_info *pi;
 
 	if (!path)
@@ -102,7 +101,7 @@ static int st_status(struct path_selector *ps, struct dm_path *path,
 		}
 	}
 
-	return sz;
+	return 0;
 }
 
 static int st_add_path(struct path_selector *ps, struct dm_path *path,
-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

