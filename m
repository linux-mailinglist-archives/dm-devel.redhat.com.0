Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9FA2134E8
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 09:26:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-1sd5z-U8Nh6u5vmv4J8NIg-1; Fri, 03 Jul 2020 03:26:44 -0400
X-MC-Unique: 1sd5z-U8Nh6u5vmv4J8NIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6AE0EC1A1;
	Fri,  3 Jul 2020 07:26:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C151A7AC6F;
	Fri,  3 Jul 2020 07:26:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A094180954D;
	Fri,  3 Jul 2020 07:26:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062Ajg6e005723 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 06:45:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CECEF200BD64; Thu,  2 Jul 2020 10:45:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB26A2156A3B
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 10:45:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B394D18ABF80
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 10:45:40 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-89-E9Svcn7HOSiUVZYsANVzNw-1; Thu, 02 Jul 2020 06:45:36 -0400
X-MC-Unique: E9Svcn7HOSiUVZYsANVzNw-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 3E1E4EFFA93159E03A4A;
	Thu,  2 Jul 2020 18:29:26 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 2 Jul 2020 18:29:15 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, Alasdair Kergon <agk@redhat.com>, "Mike
	Snitzer" <snitzer@redhat.com>, Christoph Hellwig <hch@lst.de>
Date: Thu, 2 Jul 2020 18:39:28 +0800
Message-ID: <20200702103928.67693-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 03 Jul 2020 03:26:16 -0400
Cc: dm-devel@redhat.com, Wei Yongjun <weiyongjun1@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH -next] dm: remove unused variable 'md'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After commit 5a6c35f9af41 ("block: remove direct_make_request"),
'md' is never used and gcc report build warning:

drivers/md/dm.c:1296:24: warning: unused variable 'md' [-Wunused-variable]
 1296 |  struct mapped_device *md = io->md;
      |                        ^~

Removing it to avoid build warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/md/dm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index a8d83d76fa9f..a02842afe358 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1293,7 +1293,6 @@ static blk_qc_t __map_bio(struct dm_target_io *tio)
 	sector_t sector;
 	struct bio *clone = &tio->clone;
 	struct dm_io *io = tio->io;
-	struct mapped_device *md = io->md;
 	struct dm_target *ti = tio->ti;
 	blk_qc_t ret = BLK_QC_T_NONE;
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

