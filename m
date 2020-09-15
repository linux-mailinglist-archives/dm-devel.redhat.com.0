Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8662D26A8DA
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 17:33:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-O9TUQ9mSOlqBIW7BeNIYXw-1; Tue, 15 Sep 2020 11:33:03 -0400
X-MC-Unique: O9TUQ9mSOlqBIW7BeNIYXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FF5F10FA81C;
	Tue, 15 Sep 2020 15:31:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 211301002D53;
	Tue, 15 Sep 2020 15:31:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8FAF183D021;
	Tue, 15 Sep 2020 15:31:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FFVs1U022045 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 11:31:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 693AF1007A59; Tue, 15 Sep 2020 15:31:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64DAB10087CB
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 15:31:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C3BD80121E
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 15:31:54 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-486-g0s68eXHPqmwo6p8tHW61g-1; Tue, 15 Sep 2020 11:31:46 -0400
X-MC-Unique: g0s68eXHPqmwo6p8tHW61g-1
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICvj-0001kM-3D; Tue, 15 Sep 2020 15:31:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 17:18:22 +0200
Message-Id: <20200915151829.1767176-6-hch@lst.de>
In-Reply-To: <20200915151829.1767176-1-hch@lst.de>
References: <20200915151829.1767176-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>, drbd-dev@tron.linbit.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: [dm-devel] [PATCH 05/12] md: update the optimal I/O size on reshape
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

The raid5 and raid10 drivers currently update the read-ahead size,
but not the optimal I/O size on reshape.  To prepare for deriving the
read-ahead size from the optimal I/O size make sure it is updated
as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Song Liu <song@kernel.org>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/raid10.c | 22 ++++++++++++++--------
 drivers/md/raid5.c  | 10 ++++++++--
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index e8fa327339171c..9956a04ac13bd6 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3703,10 +3703,20 @@ static struct r10conf *setup_conf(struct mddev *mddev)
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
@@ -3742,18 +3752,13 @@ static int raid10_run(struct mddev *mddev)
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
@@ -4727,6 +4732,7 @@ static void end_reshape(struct r10conf *conf)
 		stripe /= conf->geo.near_copies;
 		if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
 			conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+		raid10_set_io_opt(conf);
 	}
 	conf->fullsync = 0;
 }
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 225380efd1e24f..9a7d1250894ef1 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7232,6 +7232,12 @@ static int only_parity(int raid_disk, int algo, int raid_disks, int max_degraded
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
@@ -7521,8 +7527,7 @@ static int raid5_run(struct mddev *mddev)
 
 		chunk_size = mddev->chunk_sectors << 9;
 		blk_queue_io_min(mddev->queue, chunk_size);
-		blk_queue_io_opt(mddev->queue, chunk_size *
-				 (conf->raid_disks - conf->max_degraded));
+		raid5_set_io_opt(conf);
 		mddev->queue->limits.raid_partial_stripes_expensive = 1;
 		/*
 		 * We can only discard a whole stripe. It doesn't make sense to
@@ -8115,6 +8120,7 @@ static void end_reshape(struct r5conf *conf)
 						   / PAGE_SIZE);
 			if (conf->mddev->queue->backing_dev_info->ra_pages < 2 * stripe)
 				conf->mddev->queue->backing_dev_info->ra_pages = 2 * stripe;
+			raid5_set_io_opt(conf);
 		}
 	}
 }
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

