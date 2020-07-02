Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C4BF82134E9
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 09:26:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-avji7Q04PV-jnIq2eKQgSg-1; Fri, 03 Jul 2020 03:26:45 -0400
X-MC-Unique: avji7Q04PV-jnIq2eKQgSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E7B1107ACF5;
	Fri,  3 Jul 2020 07:26:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F41A35DC1E;
	Fri,  3 Jul 2020 07:26:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B879C6C9C7;
	Fri,  3 Jul 2020 07:26:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062F1uVM014817 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 11:01:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0929C11796F3; Thu,  2 Jul 2020 15:01:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04BC211796F0
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:01:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4ECC8EF3AF
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:01:53 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-215-BT4USspcOGWUYwHvojzL9A-1; Thu, 02 Jul 2020 11:01:51 -0400
X-MC-Unique: BT4USspcOGWUYwHvojzL9A-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 6EEEFAEEB2DD48F10D2E;
	Thu,  2 Jul 2020 23:01:33 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 2 Jul 2020 23:01:26 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, Alasdair Kergon <agk@redhat.com>, "Mike
	Snitzer" <snitzer@redhat.com>, Hannes Reinecke <hare@suse.de>
Date: Thu, 2 Jul 2020 23:11:40 +0800
Message-ID: <20200702151140.5466-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 03 Jul 2020 03:26:16 -0400
Cc: dm-devel@redhat.com, Wei Yongjun <weiyongjun1@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH -next] dm zoned: fix unused but set variable
	warnings
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix unused but set variable warnings:

drivers/md/dm-zoned-reclaim.c:504:42: warning:
 variable nr_rnd set but not used [-Wunused-but-set-variable]
  504 |  unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
      |                                          ^~~~~~
drivers/md/dm-zoned-reclaim.c:504:24: warning:
 variable nr_unmap_rnd set but not used [-Wunused-but-set-variable]
  504 |  unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
      |                        ^~~~~~~~~~~~

Fixes: f97809aec589 ("dm zoned: per-device reclaim")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/md/dm-zoned-reclaim.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index dd1eebf6e50f..7e0cc2d732cf 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -501,7 +501,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 {
 	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
 	struct dmz_metadata *zmd = zrc->metadata;
-	unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
+	unsigned int p_unmap;
 	int ret;
 
 	if (dmz_dev_is_dying(zmd))
@@ -527,9 +527,6 @@ static void dmz_reclaim_work(struct work_struct *work)
 		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
 	}
 
-	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
-	nr_rnd = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
-
 	DMDEBUG("(%s/%u): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
 		dmz_metadata_label(zmd), zrc->dev_idx,
 		zrc->kc_throttle.throttle,

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

