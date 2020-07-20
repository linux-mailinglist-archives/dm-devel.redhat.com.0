Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E80BE225911
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 09:52:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-5_i_5zuwM3e0J93hTiRfSQ-1; Mon, 20 Jul 2020 03:52:31 -0400
X-MC-Unique: 5_i_5zuwM3e0J93hTiRfSQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1DB6107ACCA;
	Mon, 20 Jul 2020 07:52:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 736905BAD5;
	Mon, 20 Jul 2020 07:52:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F67F1809561;
	Mon, 20 Jul 2020 07:52:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K7q7WK011204 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 Jul 2020 03:52:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12B83C54AC; Mon, 20 Jul 2020 07:52:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E9A8AFD4A
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 07:52:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70E1383B7F8
	for <dm-devel@redhat.com>; Mon, 20 Jul 2020 07:52:05 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-192-o_kXPoIfMPyVsb2Vj_RoAg-1; Mon, 20 Jul 2020 03:52:02 -0400
X-MC-Unique: o_kXPoIfMPyVsb2Vj_RoAg-1
Received: from [2001:4bb8:105:4a81:5185:88fc:94bb:f8bf] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxQac-00040e-HF; Mon, 20 Jul 2020 07:51:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 20 Jul 2020 09:51:39 +0200
Message-Id: <20200720075148.172156-6-hch@lst.de>
In-Reply-To: <20200720075148.172156-1-hch@lst.de>
References: <20200720075148.172156-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: [dm-devel] [PATCH 05/14] md: update the optimal I/O size on reshape
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The raid5 and raid10 drivers currently update the read-ahead size,
but not the optimal I/O size on reshape.  To prepare for deriving the
read-ahead size from the optimal I/O size make sure it is updated
as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/raid10.c | 22 ++++++++++++++--------
 drivers/md/raid5.c  | 10 ++++++++--
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 353288bc4cb706..552ee0058c118d 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3695,10 +3695,20 @@ static struct r10conf *setup_conf(struct mddev *mddev)
 	return ERR_PTR(err);
 }
 
+static void raid10_set_io_opt(struct r10conf *conf)
+{
+	int raid_disks = conf->geo.raid_disks;
+
+	if (!(conf->geo.raid_disks % conf->geo.near_copies))
+		raid_disks /= conf->geo.near_copies;
+	blk_queue_io_opt(conf->mddev->queue, (conf->mddev->chunk_sectors << 9) *
+			 raid_disks);
+}
+
 static int raid10_run(struct mddev *mddev)
 {
 	struct r10conf *conf;
-	int i, disk_idx, chunk_size;
+	int i, disk_idx;
 	struct raid10_info *disk;
 	struct md_rdev *rdev;
 	sector_t size;
@@ -3734,18 +3744,13 @@ static int raid10_run(struct mddev *mddev)
 	mddev->thread = conf->thread;
 	conf->thread = NULL;
 
-	chunk_size = mddev->chunk_sectors << 9;
 	if (mddev->queue) {
 		blk_queue_max_discard_sectors(mddev->queue,
 					      mddev->chunk_sectors);
 		blk_queue_max_write_same_sectors(mddev->queue, 0);
 		blk_queue_max_write_zeroes_sectors(mddev->queue, 0);
-		blk_queue_io_min(mddev->queue, chunk_size);
-		if (conf->geo.raid_disks % conf->geo.near_copies)
-			blk_queue_io_opt(mddev->queue, chunk_size * conf->geo.raid_disks);
-		else
-			blk_queue_io_opt(mddev->queue, chunk_size *
-					 (conf->geo.raid_disks / conf->geo.near_copies));
+		blk_queue_io_min(mddev->queue, mddev->chunk_sectors << 9);
+		raid10_set_io_opt(conf);
 	}
 
 	rdev_for_each(rdev, mddev) {
@@ -4719,6 +4724,7 @@ static void end_reshape(struct r10conf *conf)
 		stripe /= conf->geo.near_copies;
 		if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
 			conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+		raid10_set_io_opt(conf);
 	}
 	conf->fullsync = 0;
 }
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 774ea893d47e21..f571b0eb5ec824 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7123,6 +7123,12 @@ static int only_parity(int raid_disk, int algo, int raid_disks, int max_degraded
 	return 0;
 }
 
+static void raid5_set_io_opt(struct r5conf *conf)
+{
+	blk_queue_io_opt(conf->mddev->queue, (conf->chunk_sectors << 9) *
+			 (conf->raid_disks - conf->max_degraded));
+}
+
 static int raid5_run(struct mddev *mddev)
 {
 	struct r5conf *conf;
@@ -7412,8 +7418,7 @@ static int raid5_run(struct mddev *mddev)
 
 		chunk_size = mddev->chunk_sectors << 9;
 		blk_queue_io_min(mddev->queue, chunk_size);
-		blk_queue_io_opt(mddev->queue, chunk_size *
-				 (conf->raid_disks - conf->max_degraded));
+		raid5_set_io_opt(conf);
 		mddev->queue->limits.raid_partial_stripes_expensive = 1;
 		/*
 		 * We can only discard a whole stripe. It doesn't make sense to
@@ -8006,6 +8011,7 @@ static void end_reshape(struct r5conf *conf)
 						   / PAGE_SIZE);
 			if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
 				conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+			raid5_set_io_opt(conf);
 		}
 	}
 }
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

