Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFAC1571FA
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 10:45:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581327913;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mgr0thsxemqa6uICpSKPgahwYasLJYqXzN5kQpC8XvQ=;
	b=KQIUFpznBPfBeLIhTTFInUPYbAQXXLpXbeCH3GvGRIa89Y5vaxOSgSqafJRsOXsLWtgZow
	IcjdcuqDQuura8jCy/g0BWrYzO5xTyyO8guP7feOjEu16z3b3c4tyuvTMUrcfSfCkl+GKF
	y34ufEg2sYfa1s3t9XFyl7G32NN+iJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-V7gZ7qNKOMyN6HhzLM3Tuw-1; Mon, 10 Feb 2020 04:45:10 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90D038010C7;
	Mon, 10 Feb 2020 09:45:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0866E1001B28;
	Mon, 10 Feb 2020 09:45:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D129866D2;
	Mon, 10 Feb 2020 09:44:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01A9YK0D000857 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 04:34:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 530D42166B2C; Mon, 10 Feb 2020 09:34:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ECDB2166B27
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 09:34:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33D01800307
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 09:34:18 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-297-v9cLINqCOvGy8oaNF3YTIA-1;
	Mon, 10 Feb 2020 04:34:15 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104]
	helo=localhost.localdomain) by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1j15Rh-0000JW-3G; Mon, 10 Feb 2020 12:33:37 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: martin.petersen@oracle.com, bob.liu@oracle.com, axboe@kernel.dk
Date: Mon, 10 Feb 2020 12:33:37 +0300
Message-ID: <158132721695.239613.5220696772652540347.stgit@localhost.localdomain>
In-Reply-To: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
References: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: v9cLINqCOvGy8oaNF3YTIA-1
X-MC-Unique: V7gZ7qNKOMyN6HhzLM3Tuw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01A9YK0D000857
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Feb 2020 04:44:34 -0500
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, darrick.wong@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	chaitanya.kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, ktkhai@virtuozzo.com,
	dsterba@suse.com, sagi@grimberg.me, damien.lemoal@wdc.com,
	tytso@mit.edu, linux-kernel@vger.kernel.org, tj@kernel.org,
	asml.silence@gmail.com
Subject: [dm-devel] [PATCH v6 1/6] block: Add @flags argument to
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index 053ea4b51988..1e3c08854b09 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1417,7 +1417,8 @@ static inline unsigned int bdev_write_same(struct block_device *bdev)
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

