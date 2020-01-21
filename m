Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C0519144D38
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579681294;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jpDP1WFj/NERBlko78ftwGPUrAycJzbjNIH6b04rkkM=;
	b=JLdK2qBpekGDjwikyjEh8F6B4t9nYciC4jD4lT4+g5l6uwP32sPft7jE22WNij8Gi18mIf
	99VgFdFDyCdddQIA4Cdzj+cJPlmn9ewJklXmaYk3barBx2cu7Er1+jQZ6NjHTFjreZsuc1
	H9Xlvb0G0dNz0ov48qZGBgL8K8UKT54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-JFbejXenOpSuSnmZNFHXBw-1; Wed, 22 Jan 2020 03:21:28 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C4B800D5B;
	Wed, 22 Jan 2020 08:21:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 486BB60C85;
	Wed, 22 Jan 2020 08:21:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF63D18089CD;
	Wed, 22 Jan 2020 08:21:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LAJLht004397 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 05:19:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E62DD93C8; Tue, 21 Jan 2020 10:19:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 784FFD95E2
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 10:19:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87C0E801E90
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 10:19:19 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-47-_0O7hG2eMBCVuSQ3zQQWPw-1;
	Tue, 21 Jan 2020 05:19:14 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104]
	helo=localhost.localdomain) by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1itqcP-00068F-AM; Tue, 21 Jan 2020 13:18:45 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com, bob.liu@oracle.com, axboe@kernel.dk,
	agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
	song@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	Chaitanya.Kulkarni@wdc.com, darrick.wong@oracle.com,
	ming.lei@redhat.com, osandov@fb.com, jthumshirn@suse.de,
	minwoo.im.dev@gmail.com, damien.lemoal@wdc.com,
	andrea.parri@amarulasolutions.com, hare@suse.com, tj@kernel.org,
	ajay.joshi@wdc.com, sagi@grimberg.me, dsterba@suse.com,
	chaitanya.kulkarni@wdc.com, bvanassche@acm.org, dhowells@redhat.com,
	asml.silence@gmail.com, ktkhai@virtuozzo.com
Date: Tue, 21 Jan 2020 13:18:45 +0300
Message-ID: <157960192519.97730.8341845276703499643.stgit@localhost.localdomain>
In-Reply-To: <157960153921.97730.9973412459876396302.stgit@localhost.localdomain>
References: <157960153921.97730.9973412459876396302.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: _0O7hG2eMBCVuSQ3zQQWPw-1
X-MC-Unique: JFbejXenOpSuSnmZNFHXBw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00LAJLht004397
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 03:20:59 -0500
Subject: [dm-devel] [PATCH v3 1/7] block: Add @flags argument to
 bdev_write_zeroes_sectors()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a preparation for next patch, which introduces
a new flag BLKDEV_ZERO_ALLOCATE for calls, which need
only allocation of blocks and don't need actual blocks
zeroing.

Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 block/blk-lib.c                     |    6 +++---
 drivers/md/dm-kcopyd.c              |    2 +-
 drivers/target/target_core_iblock.c |    4 ++--
 include/linux/blkdev.h              |    3 ++-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 5f2c429d4378..3e38c93cfc53 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -224,7 +224,7 @@ static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		return -EPERM;
 
 	/* Ensure that max_write_zeroes_sectors doesn't overflow bi_size */
-	max_write_zeroes_sectors = bdev_write_zeroes_sectors(bdev);
+	max_write_zeroes_sectors = bdev_write_zeroes_sectors(bdev, 0);
 
 	if (max_write_zeroes_sectors == 0)
 		return -EOPNOTSUPP;
@@ -362,7 +362,7 @@ int blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
 	sector_t bs_mask;
 	struct bio *bio;
 	struct blk_plug plug;
-	bool try_write_zeroes = !!bdev_write_zeroes_sectors(bdev);
+	bool try_write_zeroes = !!bdev_write_zeroes_sectors(bdev, 0);
 
 	bs_mask = (bdev_logical_block_size(bdev) >> 9) - 1;
 	if ((sector | nr_sects) & bs_mask)
@@ -391,7 +391,7 @@ int blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
 			try_write_zeroes = false;
 			goto retry;
 		}
-		if (!bdev_write_zeroes_sectors(bdev)) {
+		if (!bdev_write_zeroes_sectors(bdev, 0)) {
 			/*
 			 * Zeroing offload support was indicated, but the
 			 * device reported ILLEGAL REQUEST (for some devices
diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
index 1bbe4a34ef4c..f1b8e7926dd4 100644
--- a/drivers/md/dm-kcopyd.c
+++ b/drivers/md/dm-kcopyd.c
@@ -831,7 +831,7 @@ void dm_kcopyd_copy(struct dm_kcopyd_client *kc, struct dm_io_region *from,
 		 */
 		job->rw = REQ_OP_WRITE_ZEROES;
 		for (i = 0; i < job->num_dests; i++)
-			if (!bdev_write_zeroes_sectors(job->dests[i].bdev)) {
+			if (!bdev_write_zeroes_sectors(job->dests[i].bdev, 0)) {
 				job->rw = WRITE;
 				break;
 			}
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 51ffd5c002de..73a63e197bf5 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -117,7 +117,7 @@ static int iblock_configure_device(struct se_device *dev)
 	 * Enable write same emulation for IBLOCK and use 0xFFFF as
 	 * the smaller WRITE_SAME(10) only has a two-byte block count.
 	 */
-	max_write_zeroes_sectors = bdev_write_zeroes_sectors(bd);
+	max_write_zeroes_sectors = bdev_write_zeroes_sectors(bd, 0);
 	if (max_write_zeroes_sectors)
 		dev->dev_attrib.max_write_same_len = max_write_zeroes_sectors;
 	else
@@ -468,7 +468,7 @@ iblock_execute_write_same(struct se_cmd *cmd)
 		return TCM_INVALID_CDB_FIELD;
 	}
 
-	if (bdev_write_zeroes_sectors(bdev)) {
+	if (bdev_write_zeroes_sectors(bdev, 0)) {
 		if (!iblock_execute_zero_out(bdev, cmd))
 			return 0;
 	}
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 04cfa798a365..0f1127d0b043 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1418,7 +1418,8 @@ static inline unsigned int bdev_write_same(struct block_device *bdev)
 	return 0;
 }
 
-static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
+static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev,
+						     unsigned int flags)
 {
 	struct request_queue *q = bdev_get_queue(bdev);
 



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

