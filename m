Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11101652C7B
	for <lists+dm-devel@lfdr.de>; Wed, 21 Dec 2022 06:44:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671601483;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hk8cpYwKyfYGNaMhpSNJk9sb32DRQkarhsPDK8rjchU=;
	b=aVwRMSlpIbu8bxi/ADWY7ns/vdVLSKU9nB03ILcDvEgtNWgGFKQYQy8lhl7uWx8iycV/5d
	MRSJwM/xZQiRDTOXLanixK8EGU8XU2HSLyjUagxA1Msgspz19YnC4NpCc5DOEdWOlQelgj
	bMA7yJTtMy8BVzts0Ajc895arrQ5XKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-BKakA_YdOOGvJE_G1yxjxQ-1; Wed, 21 Dec 2022 00:44:38 -0500
X-MC-Unique: BKakA_YdOOGvJE_G1yxjxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 799AF101A55E;
	Wed, 21 Dec 2022 05:44:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3579D40C2064;
	Wed, 21 Dec 2022 05:44:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E388219465B8;
	Wed, 21 Dec 2022 05:44:30 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D962319465A4
 for <dm-devel@listman.corp.redhat.com>; Wed, 21 Dec 2022 05:44:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6AD41492C18; Wed, 21 Dec 2022 05:44:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62974492C14
 for <dm-devel@redhat.com>; Wed, 21 Dec 2022 05:44:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42364857F40
 for <dm-devel@redhat.com>; Wed, 21 Dec 2022 05:44:29 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-4QRFP8kFODOr1fXY1we57A-1; Wed, 21 Dec 2022 00:44:26 -0500
X-MC-Unique: 4QRFP8kFODOr1fXY1we57A-1
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BL0ic2a026008; Wed, 21 Dec 2022 04:05:11 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mh6tp7tr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Dec 2022 04:05:11 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BL1BDLx003525; Wed, 21 Dec 2022 04:05:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3mh476294c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Dec 2022 04:05:10 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BL459MA023735;
 Wed, 21 Dec 2022 04:05:09 GMT
Received: from bm-iostat-test-2.osdevelopmeniad.oraclevcn.com
 (bm-iostat-test-2.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.255.177])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3mh4762924-1; Wed, 21 Dec 2022 04:05:09 +0000
From: Gulam Mohamed <gulam.mohamed@oracle.com>
To: linux-block@vger.kernel.org
Date: Wed, 21 Dec 2022 04:05:05 +0000
Message-Id: <20221221040506.1174644-1-gulam.mohamed@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_01,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210027
X-Proofpoint-GUID: wDgeMj7pcM-YvdFbu7xUMiWUgEUFWRds
X-Proofpoint-ORIG-GUID: wDgeMj7pcM-YvdFbu7xUMiWUgEUFWRds
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [dm-devel] [PATCH for-6.2/block V3 1/2] block: Data type conversion
 for IO accounting
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: nvdimm@lists.linux.dev, shminderjit.singh@oracle.com,
 linux-kernel@vger.kernel.org, song@kernel.org, dm-devel@redhat.com,
 ira.weiny@intel.com, agk@redhat.com, drbd-dev@lists.linbit.com,
 dave.jiang@intel.com, christoph.boehmwalder@linbit.com,
 vishal.l.verma@intel.com, konrad.wilk@oracle.com, joe.jin@oracle.com,
 kent.overstreet@gmail.com, ngupta@vflare.org, kch@nvidia.com,
 senozhatsky@chromium.org, gulam.mohamed@oracle.com, snitzer@kernel.org,
 colyli@suse.de, linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 dan.j.williams@intel.com, axboe@kernel.dk, martin.petersen@oracle.com,
 rajesh.sivaramasubramaniom@oracle.com, philipp.reisner@linbit.com,
 junxiao.bi@oracle.com, minchan@kernel.org, lars.ellenberg@linbit.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the data type of start and end time IO accounting variables in,
block layer, from "unsigned long" to "u64". This is to enable nano-seconds
granularity, in next commit, for the devices whose latency is less than
milliseconds.

Changes from V2 to V3
=====================
1. Changed all the required variables data-type to u64 as part of this
   first patch
2. Create a new setting '2' for iostats in sysfs in next patch
3. Change the code to get the ktime values when iostat=2 in next patch

Signed-off-by: Gulam Mohamed <gulam.mohamed@oracle.com>
---
 block/blk-core.c              | 24 ++++++++++++------------
 block/blk.h                   |  2 +-
 drivers/block/drbd/drbd_int.h |  2 +-
 drivers/block/zram/zram_drv.c |  4 ++--
 drivers/md/bcache/request.c   | 10 +++++-----
 drivers/md/dm-core.h          |  2 +-
 drivers/md/dm.c               |  2 +-
 drivers/md/md.h               |  2 +-
 drivers/md/raid1.h            |  2 +-
 drivers/md/raid10.h           |  2 +-
 drivers/md/raid5.c            |  2 +-
 drivers/nvdimm/btt.c          |  2 +-
 drivers/nvdimm/pmem.c         |  2 +-
 include/linux/blk_types.h     |  2 +-
 include/linux/blkdev.h        | 12 ++++++------
 include/linux/part_stat.h     |  2 +-
 16 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 8ab21dd01cd1..5670032fe932 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -927,13 +927,13 @@ int iocb_bio_iopoll(struct kiocb *kiocb, struct io_comp_batch *iob,
 }
 EXPORT_SYMBOL_GPL(iocb_bio_iopoll);
 
-void update_io_ticks(struct block_device *part, unsigned long now, bool end)
+void update_io_ticks(struct block_device *part, u64 now, bool end)
 {
-	unsigned long stamp;
+	u64 stamp;
 again:
 	stamp = READ_ONCE(part->bd_stamp);
-	if (unlikely(time_after(now, stamp))) {
-		if (likely(try_cmpxchg(&part->bd_stamp, &stamp, now)))
+	if (unlikely(time_after64(now, stamp))) {
+		if (likely(try_cmpxchg64(&part->bd_stamp, &stamp, now)))
 			__part_stat_add(part, io_ticks, end ? now - stamp : 1);
 	}
 	if (part->bd_partno) {
@@ -942,9 +942,9 @@ void update_io_ticks(struct block_device *part, unsigned long now, bool end)
 	}
 }
 
-unsigned long bdev_start_io_acct(struct block_device *bdev,
-				 unsigned int sectors, enum req_op op,
-				 unsigned long start_time)
+u64 bdev_start_io_acct(struct block_device *bdev,
+			unsigned int sectors, enum req_op op,
+			u64 start_time)
 {
 	const int sgrp = op_stat_group(op);
 
@@ -965,7 +965,7 @@ EXPORT_SYMBOL(bdev_start_io_acct);
  *
  * Returns the start time that should be passed back to bio_end_io_acct().
  */
-unsigned long bio_start_io_acct(struct bio *bio)
+u64 bio_start_io_acct(struct bio *bio)
 {
 	return bdev_start_io_acct(bio->bi_bdev, bio_sectors(bio),
 				  bio_op(bio), jiffies);
@@ -973,11 +973,11 @@ unsigned long bio_start_io_acct(struct bio *bio)
 EXPORT_SYMBOL_GPL(bio_start_io_acct);
 
 void bdev_end_io_acct(struct block_device *bdev, enum req_op op,
-		      unsigned long start_time)
+		      u64 start_time)
 {
 	const int sgrp = op_stat_group(op);
-	unsigned long now = READ_ONCE(jiffies);
-	unsigned long duration = now - start_time;
+	u64 now = READ_ONCE(jiffies);
+	u64 duration = (unsigned long)now -(unsigned long) start_time;
 
 	part_stat_lock();
 	update_io_ticks(bdev, now, true);
@@ -987,7 +987,7 @@ void bdev_end_io_acct(struct block_device *bdev, enum req_op op,
 }
 EXPORT_SYMBOL(bdev_end_io_acct);
 
-void bio_end_io_acct_remapped(struct bio *bio, unsigned long start_time,
+void bio_end_io_acct_remapped(struct bio *bio, u64 start_time,
 			      struct block_device *orig_bdev)
 {
 	bdev_end_io_acct(orig_bdev, bio_op(bio), start_time);
diff --git a/block/blk.h b/block/blk.h
index 8900001946c7..8997435ad4a0 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -341,7 +341,7 @@ static inline bool blk_do_io_stat(struct request *rq)
 	return (rq->rq_flags & RQF_IO_STAT) && !blk_rq_is_passthrough(rq);
 }
 
-void update_io_ticks(struct block_device *part, unsigned long now, bool end);
+void update_io_ticks(struct block_device *part, u64 now, bool end);
 
 static inline void req_set_nomerge(struct request_queue *q, struct request *req)
 {
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index ae713338aa46..8e4d3b2eb99d 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -236,7 +236,7 @@ struct drbd_request {
 	struct list_head req_pending_local;
 
 	/* for generic IO accounting */
-	unsigned long start_jif;
+	u64 start_jif;
 
 	/* for DRBD internal statistics */
 
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 966aab902d19..da28eb83e6ed 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1581,7 +1581,7 @@ static void __zram_make_request(struct zram *zram, struct bio *bio)
 	u32 index;
 	struct bio_vec bvec;
 	struct bvec_iter iter;
-	unsigned long start_time;
+	u64 start_time;
 
 	index = bio->bi_iter.bi_sector >> SECTORS_PER_PAGE_SHIFT;
 	offset = (bio->bi_iter.bi_sector &
@@ -1662,7 +1662,7 @@ static int zram_rw_page(struct block_device *bdev, sector_t sector,
 	u32 index;
 	struct zram *zram;
 	struct bio_vec bv;
-	unsigned long start_time;
+	u64 start_time;
 
 	if (PageTransHuge(page))
 		return -ENOTSUPP;
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index 39c7b607f8aa..1f9bd20dcdcf 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -476,7 +476,7 @@ struct search {
 	unsigned int		cache_missed:1;
 
 	struct block_device	*orig_bdev;
-	unsigned long		start_time;
+	u64			start_time;
 
 	struct btree_op		op;
 	struct data_insert_op	iop;
@@ -714,7 +714,7 @@ static void search_free(struct closure *cl)
 
 static inline struct search *search_alloc(struct bio *bio,
 		struct bcache_device *d, struct block_device *orig_bdev,
-		unsigned long start_time)
+		u64 start_time)
 {
 	struct search *s;
 
@@ -1065,7 +1065,7 @@ static void cached_dev_nodata(struct closure *cl)
 
 struct detached_dev_io_private {
 	struct bcache_device	*d;
-	unsigned long		start_time;
+	u64			start_time;
 	bio_end_io_t		*bi_end_io;
 	void			*bi_private;
 	struct block_device	*orig_bdev;
@@ -1094,7 +1094,7 @@ static void detached_dev_end_io(struct bio *bio)
 }
 
 static void detached_dev_do_request(struct bcache_device *d, struct bio *bio,
-		struct block_device *orig_bdev, unsigned long start_time)
+		struct block_device *orig_bdev, u64 start_time)
 {
 	struct detached_dev_io_private *ddip;
 	struct cached_dev *dc = container_of(d, struct cached_dev, disk);
@@ -1173,7 +1173,7 @@ void cached_dev_submit_bio(struct bio *bio)
 	struct block_device *orig_bdev = bio->bi_bdev;
 	struct bcache_device *d = orig_bdev->bd_disk->private_data;
 	struct cached_dev *dc = container_of(d, struct cached_dev, disk);
-	unsigned long start_time;
+	u64    start_time;
 	int rw = bio_data_dir(bio);
 
 	if (unlikely((d->c && test_bit(CACHE_SET_IO_DISABLE, &d->c->flags)) ||
diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index 6c6bd24774f2..e620fd878b08 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -284,7 +284,7 @@ struct dm_io {
 	unsigned short magic;
 	blk_short_t flags;
 	spinlock_t lock;
-	unsigned long start_time;
+	u64 start_time;
 	void *data;
 	struct dm_io *next;
 	struct dm_stats_aux stats_aux;
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index e1ea3a7bd9d9..011a85ea40da 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -494,7 +494,7 @@ static bool bio_is_flush_with_data(struct bio *bio)
 static void dm_io_acct(struct dm_io *io, bool end)
 {
 	struct dm_stats_aux *stats_aux = &io->stats_aux;
-	unsigned long start_time = io->start_time;
+	u64 start_time = io->start_time;
 	struct mapped_device *md = io->md;
 	struct bio *bio = io->orig_bio;
 	unsigned int sectors;
diff --git a/drivers/md/md.h b/drivers/md/md.h
index 554a9026669a..df73c1d1d960 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -711,7 +711,7 @@ struct md_thread {
 
 struct md_io_acct {
 	struct bio *orig_bio;
-	unsigned long start_time;
+	u64 start_time;
 	struct bio bio_clone;
 };
 
diff --git a/drivers/md/raid1.h b/drivers/md/raid1.h
index ebb6788820e7..0fb5a1148745 100644
--- a/drivers/md/raid1.h
+++ b/drivers/md/raid1.h
@@ -157,7 +157,7 @@ struct r1bio {
 	sector_t		sector;
 	int			sectors;
 	unsigned long		state;
-	unsigned long		start_time;
+	u64			start_time;
 	struct mddev		*mddev;
 	/*
 	 * original bio going to /dev/mdx
diff --git a/drivers/md/raid10.h b/drivers/md/raid10.h
index 8c072ce0bc54..4cf3eec89bf3 100644
--- a/drivers/md/raid10.h
+++ b/drivers/md/raid10.h
@@ -123,7 +123,7 @@ struct r10bio {
 	sector_t		sector;	/* virtual sector number */
 	int			sectors;
 	unsigned long		state;
-	unsigned long		start_time;
+	u64			start_time;
 	struct mddev		*mddev;
 	/*
 	 * original bio going to /dev/mdx
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 7b820b81d8c2..8f4364f4bda0 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -5474,7 +5474,7 @@ static void raid5_align_endio(struct bio *bi)
 	struct r5conf *conf;
 	struct md_rdev *rdev;
 	blk_status_t error = bi->bi_status;
-	unsigned long start_time = md_io_acct->start_time;
+	u64 start_time = md_io_acct->start_time;
 
 	bio_put(bi);
 
diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 0297b7882e33..8fc1d5da747c 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1442,7 +1442,7 @@ static void btt_submit_bio(struct bio *bio)
 	struct bio_integrity_payload *bip = bio_integrity(bio);
 	struct btt *btt = bio->bi_bdev->bd_disk->private_data;
 	struct bvec_iter iter;
-	unsigned long start;
+	u64 start;
 	struct bio_vec bvec;
 	int err = 0;
 	bool do_acct;
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 96e6e9a5f235..b5b7a709e1ab 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -202,7 +202,7 @@ static void pmem_submit_bio(struct bio *bio)
 	int ret = 0;
 	blk_status_t rc = 0;
 	bool do_acct;
-	unsigned long start;
+	u64 start;
 	struct bio_vec bvec;
 	struct bvec_iter iter;
 	struct pmem_device *pmem = bio->bi_bdev->bd_disk->private_data;
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 99be590f952f..d3386ac3b470 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -41,7 +41,7 @@ struct block_device {
 	sector_t		bd_start_sect;
 	sector_t		bd_nr_sectors;
 	struct disk_stats __percpu *bd_stats;
-	unsigned long		bd_stamp;
+	u64			bd_stamp;
 	bool			bd_read_only;	/* read-only policy */
 	dev_t			bd_dev;
 	atomic_t		bd_openers;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 2db2ad72af0f..ca94d690d292 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1433,14 +1433,14 @@ static inline void blk_wake_io_task(struct task_struct *waiter)
 		wake_up_process(waiter);
 }
 
-unsigned long bdev_start_io_acct(struct block_device *bdev,
+u64 bdev_start_io_acct(struct block_device *bdev,
 				 unsigned int sectors, enum req_op op,
-				 unsigned long start_time);
+				 u64 start_time);
 void bdev_end_io_acct(struct block_device *bdev, enum req_op op,
-		unsigned long start_time);
+		u64 start_time);
 
-unsigned long bio_start_io_acct(struct bio *bio);
-void bio_end_io_acct_remapped(struct bio *bio, unsigned long start_time,
+u64 bio_start_io_acct(struct bio *bio);
+void bio_end_io_acct_remapped(struct bio *bio, u64 start_time,
 		struct block_device *orig_bdev);
 
 /**
@@ -1448,7 +1448,7 @@ void bio_end_io_acct_remapped(struct bio *bio, unsigned long start_time,
  * @bio:	bio to end account for
  * @start_time:	start time returned by bio_start_io_acct()
  */
-static inline void bio_end_io_acct(struct bio *bio, unsigned long start_time)
+static inline void bio_end_io_acct(struct bio *bio, u64 start_time)
 {
 	return bio_end_io_acct_remapped(bio, start_time, bio->bi_bdev);
 }
diff --git a/include/linux/part_stat.h b/include/linux/part_stat.h
index abeba356bc3f..85c50235693c 100644
--- a/include/linux/part_stat.h
+++ b/include/linux/part_stat.h
@@ -10,7 +10,7 @@ struct disk_stats {
 	unsigned long sectors[NR_STAT_GROUPS];
 	unsigned long ios[NR_STAT_GROUPS];
 	unsigned long merges[NR_STAT_GROUPS];
-	unsigned long io_ticks;
+	u64 io_ticks;
 	local_t in_flight[2];
 };
 
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

