Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157EBAFC3
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 10:39:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACE6818C8933;
	Mon, 23 Sep 2019 08:39:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36EDC5C1B5;
	Mon, 23 Sep 2019 08:39:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4335F180085A;
	Mon, 23 Sep 2019 08:38:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8N6BYRX013168 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Sep 2019 02:11:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CDD060C80; Mon, 23 Sep 2019 06:11:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A95B60BF7;
	Mon, 23 Sep 2019 06:11:28 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41EE1315C02A;
	Mon, 23 Sep 2019 06:11:27 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id F1D232EEFC1EE13C5623;
	Mon, 23 Sep 2019 14:11:24 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
	(10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Sep 2019
	14:11:18 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>,
	<ntsironis@arrikto.com>, <iliastsi@arrikto.com>
Date: Mon, 23 Sep 2019 14:11:11 +0800
Message-ID: <20190923061111.39956-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Mon, 23 Sep 2019 06:11:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Mon, 23 Sep 2019 06:11:28 +0000 (UTC) for IP:'45.249.212.35'
	DOMAIN:'szxga07-in.huawei.com' HELO:'huawei.com'
	FROM:'yuehaibing@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.35 szxga07-in.huawei.com
	45.249.212.35 szxga07-in.huawei.com <yuehaibing@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Sep 2019 04:38:28 -0400
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH -next] dm clone: Make __hash_find static
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Mon, 23 Sep 2019 08:39:07 +0000 (UTC)

drivers/md/dm-clone-target.c:594:34: warning:
 symbol '__hash_find' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/md/dm-clone-target.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index cd6f9e9..0f99b68 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -591,8 +591,9 @@ static struct hash_table_bucket *get_hash_table_bucket(struct clone *clone,
  *
  * NOTE: Must be called with the bucket lock held
  */
-struct dm_clone_region_hydration *__hash_find(struct hash_table_bucket *bucket,
-					      unsigned long region_nr)
+static struct
+dm_clone_region_hydration *__hash_find(struct hash_table_bucket *bucket,
+				       unsigned long region_nr)
 {
 	struct dm_clone_region_hydration *hd;
 
-- 
2.7.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
