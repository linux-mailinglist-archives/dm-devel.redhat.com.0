Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB693AFF5
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jun 2019 09:51:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 696583082291;
	Mon, 10 Jun 2019 07:51:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BF695C219;
	Mon, 10 Jun 2019 07:51:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9A41206D2;
	Mon, 10 Jun 2019 07:50:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x597lCSg021706 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 9 Jun 2019 03:47:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EFB9100194A; Sun,  9 Jun 2019 07:47:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8385110013D9;
	Sun,  9 Jun 2019 07:47:07 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D13CC04BD44;
	Sun,  9 Jun 2019 07:46:48 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 25822A7F2A6DC3E3714B;
	Sun,  9 Jun 2019 15:46:39 +0800 (CST)
Received: from RH5885H-V3.huawei.com (10.90.53.225) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.439.0; Sun, 9 Jun 2019 15:46:30 +0800
From: ZhangXiaoxu <zhangxiaoxu5@huawei.com>
To: <dm-devel@redhat.com>, <agk@redhat.com>, <snitzer@redhat.com>,
	<zhangxiaoxu5@huawei.com>
Date: Sun, 9 Jun 2019 15:52:00 +0800
Message-ID: <1560066720-94807-1-git-send-email-zhangxiaoxu5@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Sun, 09 Jun 2019 07:47:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sun, 09 Jun 2019 07:47:02 +0000 (UTC) for IP:'45.249.212.190'
	DOMAIN:'szxga04-in.huawei.com' HELO:'huawei.com'
	FROM:'zhangxiaoxu5@huawei.com' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.190 szxga04-in.huawei.com
	45.249.212.190 szxga04-in.huawei.com <zhangxiaoxu5@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Jun 2019 03:48:48 -0400
Subject: [dm-devel] [PATCH V2] dm space map common: remove the redundancy
	check for the sm_find_free's return value
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 10 Jun 2019 07:51:04 +0000 (UTC)

The function sm_find_free just return -ENOSPC and 0.
So, remove the redundancy check.

Signed-off-by: ZhangXiaoxu <zhangxiaoxu5@huawei.com>
---
 drivers/md/persistent-data/dm-space-map-common.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/md/persistent-data/dm-space-map-common.c b/drivers/md/persistent-data/dm-space-map-common.c
index b8a6218..bd68f6f 100644
--- a/drivers/md/persistent-data/dm-space-map-common.c
+++ b/drivers/md/persistent-data/dm-space-map-common.c
@@ -369,10 +369,6 @@ int sm_ll_find_free_block(struct ll_disk *ll, dm_block_t begin,
 			 */
 			dm_tm_unlock(ll->tm, blk);
 			continue;
-
-		} else if (r < 0) {
-			dm_tm_unlock(ll->tm, blk);
-			return r;
 		}
 
 		dm_tm_unlock(ll->tm, blk);
-- 
2.7.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
