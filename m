Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6E1504B07
	for <lists+dm-devel@lfdr.de>; Mon, 18 Apr 2022 04:28:05 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-EB28eDHrNh6U-4vS98sbJA-1; Sun, 17 Apr 2022 22:28:02 -0400
X-MC-Unique: EB28eDHrNh6U-4vS98sbJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09BD41857F07;
	Mon, 18 Apr 2022 02:27:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0DB2145D483;
	Mon, 18 Apr 2022 02:27:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9A0321940352;
	Mon, 18 Apr 2022 02:27:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BBA911949762
 for <dm-devel@listman.corp.redhat.com>; Mon, 18 Apr 2022 02:27:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 98DAC41617F; Mon, 18 Apr 2022 02:27:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94524401E9A
 for <dm-devel@redhat.com>; Mon, 18 Apr 2022 02:27:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ABBF1C06905
 for <dm-devel@redhat.com>; Mon, 18 Apr 2022 02:27:56 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-ZK4xqVFFMM2_ms0IVAlZjA-3; Sun, 17 Apr 2022 22:27:55 -0400
X-MC-Unique: ZK4xqVFFMM2_ms0IVAlZjA-3
Received: by mail-qk1-f173.google.com with SMTP id e128so8240604qkd.7
 for <dm-devel@redhat.com>; Sun, 17 Apr 2022 19:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XXZQXoeBtKpzh741x+P5yKAZ2XSNaCFR9P7XFMxzGVc=;
 b=BcK+I8VYi0jpjYhahXJ0VLaz1B8vQEYDvacz0rGNpX+D63nt93m67k5qiCUWfvegaO
 56iqLaErDPYx9jIciCUeHNyRBHGTdGX6/Tqq9uIvAm/vU0kkeSL2wiygx1w3dixVrbgh
 2Bx+GAs1un0AvoX97UnNIh9eIply1vIw5HY3hNOLwCk7cjPtW1BD+n8I0yLq0rV/Mbwu
 B0dNG495xmelk3vThsloimatXn3U/1FzF/s/xI0vkSAmg9ZFVQkhxUe1DDIrtjWhc4s1
 m8cJgAsmgBftun6o67k4oWkezMHGBw2S2xpf0Z3qz/9mhMlh4vRzR6PZAf/vAhZH7qLq
 Zw1Q==
X-Gm-Message-State: AOAM530SfhQKZ6b+hjHqOkDREuS7f3A30Hb/x0k0i0FnGQz4RqNJcR5i
 P9RjJ/IOKx+ssrL70RjuTsg3tQ6s2zdshz1ueA02fciDupcQPJPNcospEHashUSdoXCZrVD4JwK
 b89X3b6BTHPMfLbbrri0/96OqA1Zbll1tT2LQwKyJLUnhyD4jkuwXxZWkLsXrEq43bzw=
X-Google-Smtp-Source: ABdhPJyVKctO1KN7DOy+BXXAefVB6VNGJfsZ+vtfNYZWHeiNc9Bvl+1yoMFwj4zhpr4OITwVzFs0cw==
X-Received: by 2002:a37:a8d0:0:b0:69c:f9f1:d1bd with SMTP id
 r199-20020a37a8d0000000b0069cf9f1d1bdmr5486109qke.373.1650248874473; 
 Sun, 17 Apr 2022 19:27:54 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
 [68.160.176.52]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05622a04c800b002e06d7c1eabsm7009634qtx.16.2022.04.17.19.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 19:27:54 -0700 (PDT)
From: Mike Snitzer <snitzer@kernel.org>
To: dm-devel@redhat.com
Date: Sun, 17 Apr 2022 22:27:28 -0400
Message-Id: <20220418022733.56168-17-snitzer@kernel.org>
In-Reply-To: <20220418022733.56168-1-snitzer@kernel.org>
References: <20220418022733.56168-1-snitzer@kernel.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [dm-devel] [dm-5.19 PATCH 16/21] dm: improve bio splitting and
 associated IO accounting
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
Cc: axboe@kernel.dk, hch@lst.de, ming.lei@redhat.com
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2633377252142291015=="

--===============2633377252142291015==
Content-Type: application/octet-stream; x-default=true

From: Ming Lei <ming.lei@redhat.com>

The current DM code (ab)uses late assignment of dm_io->orig_bio (after
__map_bio() returns and any bio splitting is complete) to indicate the
FS bio has been processed and can be accounted. This results in
awkward waiting until ->orig_bio is set in dm_submit_bio_remap().

Also the bio splitting was implemented using bio_split()+bio_chain()
-- a well-worn pattern but it requires bio cloning purely for the
benefit of more natural IO accounting.  The bio_split() result was
stored in ->orig_bio to represent the mapped part of the original FS
bio.

DM has switched to the bdev based IO accounting interface.  DM's IO
accounting can be implemented in terms of the original FS bio (now
stored early in ->orig_bio) via access to its sectors/bio_op. And
if/when splitting is needed, set a new DM_IO_WAS_SPLIT flag and use
new dm_io fields of .sector_offset & .sectors to allow IO accounting
for split bios _without_ needing to clone a new bio to store in
->orig_bio.

Signed-off-by: Ming Lei <ming.lei@redhat.com>
Co-developed-by: Mike Snitzer <snitzer@kernel.org>
Signed-off-by: Mike Snitzer <snitzer@kernel.org>
---
 drivers/md/dm-core.h |  8 +++++-
 drivers/md/dm.c      | 75 ++++++++++++++++++++++++++++++++++++----------------
 2 files changed, 59 insertions(+), 24 deletions(-)

diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index 8ba99eaa0872..37ddedf61249 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -267,7 +267,12 @@ struct dm_io {
 	blk_status_t status;
 	atomic_t io_count;
 	struct mapped_device *md;
+
+	/* The three fields represent mapped part of original bio */
 	struct bio *orig_bio;
+	unsigned int sector_offset; /* offset to end of orig_bio */
+	unsigned int sectors;
+
 	/* last member of dm_target_io is 'struct bio' */
 	struct dm_target_io tio;
 };
@@ -277,7 +282,8 @@ struct dm_io {
  */
 enum {
 	DM_IO_START_ACCT,
-	DM_IO_ACCOUNTED
+	DM_IO_ACCOUNTED,
+	DM_IO_WAS_SPLIT
 };
 
 static inline bool dm_io_flagged(struct dm_io *io, unsigned int bit)
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index cb41384cd814..860d2aaffd2a 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -516,8 +516,10 @@ static void dm_io_acct(struct dm_io *io, bool end)
 	 */
 	if (bio_is_flush_with_data(bio))
 		sectors = 0;
-	else
+	else if (likely(!(dm_io_flagged(io, DM_IO_WAS_SPLIT))))
 		sectors = bio_sectors(bio);
+	else
+		sectors = io->sectors;
 
 	if (!end)
 		bdev_start_io_acct(bio->bi_bdev, sectors, bio_op(bio),
@@ -526,10 +528,18 @@ static void dm_io_acct(struct dm_io *io, bool end)
 		bdev_end_io_acct(bio->bi_bdev, bio_op(bio), start_time);
 
 	if (static_branch_unlikely(&stats_enabled) &&
-	    unlikely(dm_stats_used(&md->stats)))
+	    unlikely(dm_stats_used(&md->stats))) {
+		sector_t sector;
+
+		if (likely(!dm_io_flagged(io, DM_IO_WAS_SPLIT)))
+			sector = bio->bi_iter.bi_sector;
+		else
+			sector = bio_end_sector(bio) - io->sector_offset;
+
 		dm_stats_account_io(&md->stats, bio_data_dir(bio),
-				    bio->bi_iter.bi_sector, sectors,
+				    sector, sectors,
 				    end, start_time, stats_aux);
+	}
 }
 
 static void __dm_start_io_acct(struct dm_io *io)
@@ -582,7 +592,7 @@ static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
 	io->status = BLK_STS_OK;
 	atomic_set(&io->io_count, 1);
 	this_cpu_inc(*md->pending_io);
-	io->orig_bio = NULL;
+	io->orig_bio = bio;
 	io->md = md;
 	io->map_task = current;
 	spin_lock_init(&io->lock);
@@ -1220,6 +1230,13 @@ void dm_accept_partial_bio(struct bio *bio, unsigned n_sectors)
 
 	*tio->len_ptr -= bio_sectors - n_sectors;
 	bio->bi_iter.bi_size = n_sectors << SECTOR_SHIFT;
+
+	/*
+	 * __split_and_process_bio() may have already saved mapped part
+	 * for accounting but it is being reduced so update accordingly.
+	 */
+	dm_io_set_flag(tio->io, DM_IO_WAS_SPLIT);
+	tio->io->sectors = n_sectors;
 }
 EXPORT_SYMBOL_GPL(dm_accept_partial_bio);
 
@@ -1258,13 +1275,6 @@ void dm_submit_bio_remap(struct bio *clone, struct bio *tgt_clone)
 		/* Still in target's map function */
 		dm_io_set_flag(io, DM_IO_START_ACCT);
 	} else {
-		/*
-		 * Called by another thread, managed by DM target,
-		 * wait for dm_split_and_process_bio() to store
-		 * io->orig_bio
-		 */
-		while (unlikely(!smp_load_acquire(&io->orig_bio)))
-			msleep(1);
 		dm_start_io_acct(io, clone);
 	}
 
@@ -1358,6 +1368,31 @@ static void __map_bio(struct bio *clone)
 	}
 }
 
+static void setup_split_accounting(struct clone_info *ci, unsigned len)
+{
+	struct dm_io *io = ci->io;
+
+	if (ci->sector_count > len) {
+		/*
+		 * Split needed, save the mapped part for accounting.
+		 * NOTE: dm_accept_partial_bio() will update accordingly.
+		 */
+		dm_io_set_flag(io, DM_IO_WAS_SPLIT);
+		io->sectors = len;
+	}
+
+	if (static_branch_unlikely(&stats_enabled) &&
+	    unlikely(dm_stats_used(&io->md->stats))) {
+		/*
+		 * Save bi_sector in terms of its offset from end of
+		 * original bio, only needed for DM-stats' benefit.
+		 * - saved regardless of whether split needed so that
+		 *   dm_accept_partial_bio() doesn't need to.
+		 */
+		io->sector_offset = bio_end_sector(ci->bio) - ci->sector;
+	}
+}
+
 static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
 				struct dm_target *ti, unsigned num_bios)
 {
@@ -1397,6 +1432,8 @@ static void __send_duplicate_bios(struct clone_info *ci, struct dm_target *ti,
 	case 0:
 		break;
 	case 1:
+		if (len)
+			setup_split_accounting(ci, *len);
 		clone = alloc_tio(ci, ti, 0, len, GFP_NOIO);
 		__map_bio(clone);
 		break;
@@ -1560,6 +1597,7 @@ static blk_status_t __split_and_process_bio(struct clone_info *ci)
 	ci->submit_as_polled = ci->bio->bi_opf & REQ_POLLED;
 
 	len = min_t(sector_t, max_io_len(ti, ci->sector), ci->sector_count);
+	setup_split_accounting(ci, len);
 	clone = alloc_tio(ci, ti, 0, &len, GFP_NOIO);
 	__map_bio(clone);
 
@@ -1593,7 +1631,6 @@ static void dm_split_and_process_bio(struct mapped_device *md,
 {
 	struct clone_info ci;
 	struct dm_io *io;
-	struct bio *orig_bio = NULL;
 	blk_status_t error = BLK_STS_OK;
 
 	init_clone_info(&ci, md, map, bio);
@@ -1609,23 +1646,15 @@ static void dm_split_and_process_bio(struct mapped_device *md,
 	io->map_task = NULL;
 	if (error || !ci.sector_count)
 		goto out;
-
 	/*
 	 * Remainder must be passed to submit_bio_noacct() so it gets handled
 	 * *after* bios already submitted have been completely processed.
-	 * We take a clone of the original to store in io->orig_bio to be
-	 * used by dm_end_io_acct() and for dm_io_complete() to use for
-	 * completion handling.
 	 */
-	orig_bio = bio_split(bio, bio_sectors(bio) - ci.sector_count,
-			     GFP_NOIO, &md->queue->bio_split);
-	bio_chain(orig_bio, bio);
-	trace_block_split(orig_bio, bio->bi_iter.bi_sector);
+	bio_trim(bio, io->sectors, ci.sector_count);
+	trace_block_split(bio, bio->bi_iter.bi_sector);
+	bio_inc_remaining(bio);
 	submit_bio_noacct(bio);
 out:
-	if (!orig_bio)
-		orig_bio = bio;
-	smp_store_release(&io->orig_bio, orig_bio);
 	if (dm_io_flagged(io, DM_IO_START_ACCT))
 		dm_start_io_acct(io, NULL);
 
-- 
2.15.0


--===============2633377252142291015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============2633377252142291015==--

