Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B27008A3
	for <lists+dm-devel@lfdr.de>; Fri, 12 May 2023 15:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683897071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=felptdMXLnkxOQpf8MLcAAOwkfgnFxxJxc0KFrbYAaM=;
	b=UyuR+wd49Zq2fJYAMFK5bCZiRNhm3VQ9LK7nqQz6AmQ77C7DnXOvob+wO5zKcFjSBvjIdC
	h1JU8wNb+YVoQPSc9F5//NlK13skhTp3PfyvXYe8iRZ6bzahVEEAJL1la6QHS9bxVmfxtU
	mpqyUI9METNIS6RePxCzyfc5/HELnuo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-gquFLm-7N-GkQk-nub2yug-1; Fri, 12 May 2023 09:11:09 -0400
X-MC-Unique: gquFLm-7N-GkQk-nub2yug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7D4385A588;
	Fri, 12 May 2023 13:11:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02A3BC15BA0;
	Fri, 12 May 2023 13:11:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1D80619451EB;
	Fri, 12 May 2023 13:10:51 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D93519451E3
 for <dm-devel@listman.corp.redhat.com>; Fri, 12 May 2023 08:08:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 717471121315; Fri, 12 May 2023 08:08:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6972E1121314
 for <dm-devel@redhat.com>; Fri, 12 May 2023 08:08:29 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47B46867942
 for <dm-devel@redhat.com>; Fri, 12 May 2023 08:08:29 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-QmA1I5GhMBS7LF04e9hrYw-1; Fri, 12 May 2023 04:08:27 -0400
X-MC-Unique: QmA1I5GhMBS7LF04e9hrYw-1
Received: from BN9PR03CA0427.namprd03.prod.outlook.com (2603:10b6:408:113::12)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Fri, 12 May
 2023 08:08:25 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::32) by BN9PR03CA0427.outlook.office365.com
 (2603:10b6:408:113::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.25 via Frontend
 Transport; Fri, 12 May 2023 08:08:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.24 via Frontend Transport; Fri, 12 May 2023 08:08:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 12 May 2023
 01:08:13 -0700
Received: from dev.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 12 May
 2023 01:08:12 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <linux-block@vger.kernel.org>, <linux-bcache@vger.kernel.org>,
 <linux-raid@vger.kernel.org>, <linux-nvme@lists.infradead.org>,
 <linux-scsi@vger.kernel.org>, <target-devel@vger.kernel.org>
Date: Fri, 12 May 2023 01:07:57 -0700
Message-ID: <20230512080757.387523-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT038:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f4c5b9-c067-4230-9145-08db52c00fb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: tGr7I95rCI7umabVb/j9/7l3jrhXJyPIOk2/fYjACFX0msZcOHs47HpuscArmNecGBfG78CWJIpHhtqWA0+aPK3rO7TC79zw0Lt5xKmFJwmcMid4QOsRsdN9DijvlDmP3BgrWWqYzzR1YgQb303j4tbnBCNkFi9lll65NF4rfeKirXaBiOrR7o6qW6eXKH8m0m5/VfM47E6fjBig4XetgAYNGY5M30MuDsDe0FyhXVHH5JTRkwLaqQ5AL055kCNwAN+stgYFnJlp7CB612EPHRjBVXLx0Gfkw+l9EL87tpEgy1JCtVnXw7MRz+3IJlImEopxbgeT0lH7ib1wzYxB9tanSGMKjtSniOiFAJum9M8AutwhZwLuWlG65HHp4xcLUQMXqunRckNsVsjVExX9p95N623oR1R7d603yvoSLPKr+f6y5H04Y+/wfsplNfiXTd6uo9EhdNz0DJVFY7aapsA4PAmYOJG6JMRlu4Lel805oRHmi0GhgiKORuqk9EEtpj+oMq0JOGknziP6ectxJ0Evkh12hhcNY6GxBOPjSuWdSP/XERk5pNzVVa2Ydh8FA7kHu4ucGX7W3N6GzRYagDMR1u3nk5a5En0r9xbQbfKS0mBAFF2kIzX1VC7s+DgcEw3iVbQ2SQQc8NuSDAuuUCVaP0tKSd+WzSriltq3iVd+YPcSuVy616ivBKkwnz8So+X/busG9d70bdq/EvCdcNPBsRKbLY5liSFN664yUXfwvYfllHWW22/MLgbZPDgHlCqlzqyuc3A/YGIqevPdPJOTainzo5L9hOf1UMTbhHA=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(70586007)(82310400005)(2906002)(7416002)(8936002)(5660300002)(8676002)(316002)(478600001)(41300700001)(70206006)(4326008)(110136005)(47076005)(54906003)(40460700003)(7696005)(966005)(6666004)(1076003)(26005)(356005)(7636003)(82740400003)(186003)(16526019)(336012)(426003)(2616005)(36756003)(40480700001)(83380400001)(36860700001)(2101003);
 DIR:OUT; SFP:1101
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 08:08:25.2134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f4c5b9-c067-4230-9145-08db52c00fb8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Fri, 12 May 2023 13:10:50 +0000
Subject: [dm-devel] [RFC PATCH] block: add meaningful macro for flush op
 flags
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
Cc: axboe@kernel.dk, kch@nvidia.com, sagi@grimberg.me,
 martin.petersen@oracle.com, snitzer@kernel.org, colyli@suse.de,
 song@kernel.org, dm-devel@redhat.com, hch@lst.de, kent.overstreet@gmail.com,
 agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Flush requests are implemented as REQ_OP_WRITE + REQ_OP_PREFLUSH
combination and not REQ_OP_FLUSH + REQ_PREFLUSH combination.

This unclear nature has lead to the confusion and bugs in the code for
block drivers causing more work for testing, reviews and fixes :-

1. https://lore.kernel.org/all/ZFHgefWofVt24tRl@infradead.org/
2. https://marc.info/?l=linux-block&m=168386364026498&w=2

Add a macro (name can me more meaningful) with a meaningful comment
clearing the confusion and replace the REQ_OP_WRITE | REQ_PREFLUSH with
the new macro name that also saves code repetation.

Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 block/blk-flush.c                   | 2 +-
 drivers/md/bcache/request.c         | 3 +--
 drivers/md/dm-bufio.c               | 2 +-
 drivers/md/dm-integrity.c           | 2 +-
 drivers/md/dm-log.c                 | 2 +-
 drivers/md/dm-raid1.c               | 2 +-
 drivers/md/dm-snap-persistent.c     | 5 ++---
 drivers/md/dm-writecache.c          | 2 +-
 drivers/md/dm.c                     | 2 +-
 drivers/md/md.c                     | 3 +--
 drivers/md/raid5-cache.c            | 3 +--
 drivers/md/raid5-ppl.c              | 3 +--
 drivers/nvme/target/io-cmd-bdev.c   | 2 +-
 drivers/target/target_core_iblock.c | 3 +--
 include/linux/blk_types.h           | 7 +++++++
 15 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/block/blk-flush.c b/block/blk-flush.c
index 04698ed9bcd4..376f00257100 100644
--- a/block/blk-flush.c
+++ b/block/blk-flush.c
@@ -460,7 +460,7 @@ int blkdev_issue_flush(struct block_device *bdev)
 {
 	struct bio bio;
 
-	bio_init(&bio, bdev, NULL, 0, REQ_OP_WRITE | REQ_PREFLUSH);
+	bio_init(&bio, bdev, NULL, 0, REQ_FLUSH_OPF);
 	return submit_bio_wait(&bio);
 }
 EXPORT_SYMBOL(blkdev_issue_flush);
diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index 67a2e29e0b40..ab89897a36a2 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -1023,8 +1023,7 @@ static void cached_dev_write(struct cached_dev *dc, struct search *s)
 			 */
 			struct bio *flush;
 
-			flush = bio_alloc_bioset(bio->bi_bdev, 0,
-						 REQ_OP_WRITE | REQ_PREFLUSH,
+			flush = bio_alloc_bioset(bio->bi_bdev, 0, REQ_FLUSH_OPF,
 						 GFP_NOIO, &dc->disk.bio_split);
 			if (!flush) {
 				s->iop.status = BLK_STS_RESOURCE;
diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index eea977662e81..da815325842b 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -2133,7 +2133,7 @@ EXPORT_SYMBOL_GPL(dm_bufio_write_dirty_buffers);
 int dm_bufio_issue_flush(struct dm_bufio_client *c)
 {
 	struct dm_io_request io_req = {
-		.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC,
+		.bi_opf = REQ_FLUSH_OPF | REQ_SYNC,
 		.mem.type = DM_IO_KMEM,
 		.mem.ptr.addr = NULL,
 		.client = c->dm_io,
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 31838b13ea54..2d90f8ad1ae5 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -1533,7 +1533,7 @@ static void dm_integrity_flush_buffers(struct dm_integrity_c *ic, bool flush_dat
 	if (!ic->meta_dev)
 		flush_data = false;
 	if (flush_data) {
-		fr.io_req.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC,
+		fr.io_req.bi_opf = REQ_FLUSH_OPF | REQ_SYNC,
 		fr.io_req.mem.type = DM_IO_KMEM,
 		fr.io_req.mem.ptr.addr = NULL,
 		fr.io_req.notify.fn = flush_notify,
diff --git a/drivers/md/dm-log.c b/drivers/md/dm-log.c
index f9f84236dfcd..2c40f865ef16 100644
--- a/drivers/md/dm-log.c
+++ b/drivers/md/dm-log.c
@@ -311,7 +311,7 @@ static int flush_header(struct log_c *lc)
 		.count = 0,
 	};
 
-	lc->io_req.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
+	lc->io_req.bi_opf = REQ_FLUSH_OPF;
 
 	return dm_io(&lc->io_req, 1, &null_location, NULL);
 }
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index ddcb2bc4a617..7acb9a390b38 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -265,7 +265,7 @@ static int mirror_flush(struct dm_target *ti)
 	struct dm_io_region io[MAX_NR_MIRRORS];
 	struct mirror *m;
 	struct dm_io_request io_req = {
-		.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC,
+		.bi_opf = REQ_FLUSH_OPF | REQ_SYNC,
 		.mem.type = DM_IO_KMEM,
 		.mem.ptr.addr = NULL,
 		.client = ms->io_client,
diff --git a/drivers/md/dm-snap-persistent.c b/drivers/md/dm-snap-persistent.c
index 15649921f2a9..cfb7f1b92c5e 100644
--- a/drivers/md/dm-snap-persistent.c
+++ b/drivers/md/dm-snap-persistent.c
@@ -739,8 +739,7 @@ static void persistent_commit_exception(struct dm_exception_store *store,
 	/*
 	 * Commit exceptions to disk.
 	 */
-	if (ps->valid && area_io(ps, REQ_OP_WRITE | REQ_PREFLUSH | REQ_FUA |
-				 REQ_SYNC))
+	if (ps->valid && area_io(ps, REQ_FLUSH_OPF | REQ_FUA | REQ_SYNC))
 		ps->valid = 0;
 
 	/*
@@ -817,7 +816,7 @@ static int persistent_commit_merge(struct dm_exception_store *store,
 	for (i = 0; i < nr_merged; i++)
 		clear_exception(ps, ps->current_committed - 1 - i);
 
-	r = area_io(ps, REQ_OP_WRITE | REQ_PREFLUSH | REQ_FUA);
+	r = area_io(ps, REQ_FLUSH_OPF | REQ_FUA);
 	if (r < 0)
 		return r;
 
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 074cb785eafc..538f74114d13 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -590,7 +590,7 @@ static void writecache_disk_flush(struct dm_writecache *wc, struct dm_dev *dev)
 	region.bdev = dev->bdev;
 	region.sector = 0;
 	region.count = 0;
-	req.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
+	req.bi_opf = REQ_FLUSH_OPF;
 	req.mem.type = DM_IO_KMEM;
 	req.mem.ptr.addr = NULL;
 	req.client = wc->dm_io;
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 3b694ba3a106..a570024a747d 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1555,7 +1555,7 @@ static void __send_empty_flush(struct clone_info *ci)
 	 * the basis for the clone(s).
 	 */
 	bio_init(&flush_bio, ci->io->md->disk->part0, NULL, 0,
-		 REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC);
+		 REQ_FLUSH_OPF | REQ_SYNC);
 
 	ci->bio = &flush_bio;
 	ci->sector_count = 0;
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 8e344b4b3444..5f72a693dc1c 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -533,8 +533,7 @@ static void submit_flushes(struct work_struct *ws)
 			atomic_inc(&rdev->nr_pending);
 			atomic_inc(&rdev->nr_pending);
 			rcu_read_unlock();
-			bi = bio_alloc_bioset(rdev->bdev, 0,
-					      REQ_OP_WRITE | REQ_PREFLUSH,
+			bi = bio_alloc_bioset(rdev->bdev, 0, REQ_FLUSH_OPF,
 					      GFP_NOIO, &mddev->bio_set);
 			bi->bi_end_io = md_end_flush;
 			bi->bi_private = rdev;
diff --git a/drivers/md/raid5-cache.c b/drivers/md/raid5-cache.c
index 46182b955aef..692c3ed33b1f 100644
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@ -1303,8 +1303,7 @@ void r5l_flush_stripe_to_raid(struct r5l_log *log)
 
 	if (!do_flush)
 		return;
-	bio_init(&log->flush_bio, log->rdev->bdev, NULL, 0,
-		  REQ_OP_WRITE | REQ_PREFLUSH);
+	bio_init(&log->flush_bio, log->rdev->bdev, NULL, 0, REQ_FLUSH_OPF);
 	log->flush_bio.bi_end_io = r5l_log_flush_endio;
 	submit_bio(&log->flush_bio);
 }
diff --git a/drivers/md/raid5-ppl.c b/drivers/md/raid5-ppl.c
index e495939bb3e0..da2012744b0d 100644
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@ -629,8 +629,7 @@ static void ppl_do_flush(struct ppl_io_unit *io)
 		if (bdev) {
 			struct bio *bio;
 
-			bio = bio_alloc_bioset(bdev, 0,
-					       REQ_OP_WRITE | REQ_PREFLUSH,
+			bio = bio_alloc_bioset(bdev, 0, REQ_FLUSH_OPF,
 					       GFP_NOIO, &ppl_conf->flush_bs);
 			bio->bi_private = io;
 			bio->bi_end_io = ppl_flush_endio;
diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index c2d6cea0236b..2717b64cb02f 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -342,7 +342,7 @@ static void nvmet_bdev_execute_flush(struct nvmet_req *req)
 		return;
 
 	bio_init(bio, req->ns->bdev, req->inline_bvec,
-		 ARRAY_SIZE(req->inline_bvec), REQ_OP_WRITE | REQ_PREFLUSH);
+		 ARRAY_SIZE(req->inline_bvec), REQ_FLUSH_OPF);
 	bio->bi_private = req;
 	bio->bi_end_io = nvmet_bio_done;
 
diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index cc838ffd1294..01984d07ff9c 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -419,8 +419,7 @@ iblock_execute_sync_cache(struct se_cmd *cmd)
 	if (immed)
 		target_complete_cmd(cmd, SAM_STAT_GOOD);
 
-	bio = bio_alloc(ib_dev->ibd_bd, 0, REQ_OP_WRITE | REQ_PREFLUSH,
-			GFP_KERNEL);
+	bio = bio_alloc(ib_dev->ibd_bd, 0, REQ_FLUSH_OPF, GFP_KERNEL);
 	bio->bi_end_io = iblock_end_io_flush;
 	if (!immed)
 		bio->bi_private = cmd;
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 740afe80f297..f3afdbb3f239 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -455,6 +455,13 @@ enum req_flag_bits {
 #define REQ_NOMERGE_FLAGS \
 	(REQ_NOMERGE | REQ_PREFLUSH | REQ_FUA)
 
+/*
+ * Flush requests are implemented as REQ_OP_WRITE + REQ_OP_PREFLUSH combination
+ * and not REQ_OP_FLUSH + REQ_PREFLUSH combination.
+ */
+
+#define REQ_FLUSH_OPF (REQ_OP_WRITE | REQ_PREFLUSH)
+
 enum stat_group {
 	STAT_READ,
 	STAT_WRITE,
-- 
2.40.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

