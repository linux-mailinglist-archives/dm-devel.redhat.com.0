Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B1CEA32A9F9
	for <lists+dm-devel@lfdr.de>; Tue,  2 Mar 2021 20:07:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614712023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q/pPllD4GaqYvoVMe1VOjt5ip+NO90Y4HozX0E/CBVM=;
	b=UiwFjp4kjnsAK9ZED6YxENlZgGaCQV5dPOltvgVctGdpprL6z3VxpglmNrY99P7eiWpyAn
	Z7vRDVuLTK+NWkuVHgQ6St6LoAjxm6+gzqvfr85QZQ5OKLnHnB0B3ppECb4NFH83WsgX1A
	ZxB9zB0+qupophBxltixmbT0UFXmW+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-XzD7FpNCO0OWnoA1o-CXdQ-1; Tue, 02 Mar 2021 14:06:12 -0500
X-MC-Unique: XzD7FpNCO0OWnoA1o-CXdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D678E100CCC0;
	Tue,  2 Mar 2021 19:06:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A032010023BF;
	Tue,  2 Mar 2021 19:06:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 466DD4E58E;
	Tue,  2 Mar 2021 19:06:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 122J61Qu011104 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Mar 2021 14:06:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2235C2C15B; Tue,  2 Mar 2021 19:06:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-116-252.ams2.redhat.com
	[10.36.116.252])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF4DF19C93;
	Tue,  2 Mar 2021 19:05:57 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1lHALD-0003kH-7p; Tue, 02 Mar 2021 20:05:56 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Tue, 02 Mar 2021 20:05:54 +0100
Message-Id: <20210302190553.961608080@debian-a64.vm>
User-Agent: quilt/0.65
Date: Tue, 02 Mar 2021 20:05:16 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>, Mike Snitzer <msnitzer@redhat.com>, 
	Heinz Mauelshagen <heinzm@redhat.com>, axboe@kernel.dk,
	caspar@linux.alibaba.com, io-uring@vger.kernel.org,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, hch@lst.de
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 3/4] dm: use submit_bio_noacct_mq_direct
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline; filename=dm-submit-bio-mq-direct.patch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use submit_bio_noacct_mq_direct and pass the returned cookie through the
device mapper stack. The cookie and queue is stored in the structure
clone_info.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm.c |   42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

Index: linux-2.6/drivers/md/dm.c
===================================================================
--- linux-2.6.orig/drivers/md/dm.c	2021-03-02 19:24:13.000000000 +0100
+++ linux-2.6/drivers/md/dm.c	2021-03-02 19:25:54.000000000 +0100
@@ -72,6 +72,8 @@ struct clone_info {
 	struct dm_io *io;
 	sector_t sector;
 	unsigned sector_count;
+	blk_qc_t poll_cookie;
+	struct request_queue *poll_queue;
 };
 
 /*
@@ -1294,14 +1296,13 @@ static noinline void __set_swap_bios_lim
 	mutex_unlock(&md->swap_bios_lock);
 }
 
-static blk_qc_t __map_bio(struct dm_target_io *tio)
+static void __map_bio(struct clone_info *ci, struct dm_target_io *tio)
 {
 	int r;
 	sector_t sector;
 	struct bio *clone = &tio->clone;
 	struct dm_io *io = tio->io;
 	struct dm_target *ti = tio->ti;
-	blk_qc_t ret = BLK_QC_T_NONE;
 
 	clone->bi_end_io = clone_endio;
 
@@ -1328,7 +1329,14 @@ static blk_qc_t __map_bio(struct dm_targ
 	case DM_MAPIO_REMAPPED:
 		/* the bio has been remapped so dispatch it */
 		trace_block_bio_remap(clone, bio_dev(io->orig_bio), sector);
-		ret = submit_bio_noacct(clone);
+		if (clone->bi_opf & REQ_HIPRI &&
+		    test_bit(QUEUE_FLAG_POLL, &clone->bi_bdev->bd_disk->queue->queue_flags)) {
+			ci->poll_queue = clone->bi_bdev->bd_disk->queue;
+			ci->poll_cookie = submit_bio_noacct_mq_direct(clone);
+		} else {
+			ci->poll_cookie = BLK_QC_T_NONE;
+			submit_bio_noacct(clone);
+		}
 		break;
 	case DM_MAPIO_KILL:
 		if (unlikely(swap_bios_limit(ti, clone))) {
@@ -1350,8 +1358,6 @@ static blk_qc_t __map_bio(struct dm_targ
 		DMWARN("unimplemented target map return value: %d", r);
 		BUG();
 	}
-
-	return ret;
 }
 
 static void bio_setup_sector(struct bio *bio, sector_t sector, unsigned len)
@@ -1438,8 +1444,8 @@ static void alloc_multiple_bios(struct b
 	}
 }
 
-static blk_qc_t __clone_and_map_simple_bio(struct clone_info *ci,
-					   struct dm_target_io *tio, unsigned *len)
+static void __clone_and_map_simple_bio(struct clone_info *ci,
+				       struct dm_target_io *tio, unsigned *len)
 {
 	struct bio *clone = &tio->clone;
 
@@ -1449,7 +1455,7 @@ static blk_qc_t __clone_and_map_simple_b
 	if (len)
 		bio_setup_sector(clone, ci->sector, *len);
 
-	return __map_bio(tio);
+	__map_bio(ci, tio);
 }
 
 static void __send_duplicate_bios(struct clone_info *ci, struct dm_target *ti,
@@ -1463,7 +1469,7 @@ static void __send_duplicate_bios(struct
 
 	while ((bio = bio_list_pop(&blist))) {
 		tio = container_of(bio, struct dm_target_io, clone);
-		(void) __clone_and_map_simple_bio(ci, tio, len);
+		__clone_and_map_simple_bio(ci, tio, len);
 	}
 }
 
@@ -1507,7 +1513,7 @@ static int __clone_and_map_data_bio(stru
 		free_tio(tio);
 		return r;
 	}
-	(void) __map_bio(tio);
+	__map_bio(ci, tio);
 
 	return 0;
 }
@@ -1614,6 +1620,7 @@ static void init_clone_info(struct clone
 	ci->map = map;
 	ci->io = alloc_io(md, bio);
 	ci->sector = bio->bi_iter.bi_sector;
+	ci->poll_cookie = BLK_QC_T_NONE;
 }
 
 #define __dm_part_stat_sub(part, field, subnd)	\
@@ -1622,11 +1629,10 @@ static void init_clone_info(struct clone
 /*
  * Entry point to split a bio into clones and submit them to the targets.
  */
-static blk_qc_t __split_and_process_bio(struct mapped_device *md,
-					struct dm_table *map, struct bio *bio)
+static void __split_and_process_bio(struct mapped_device *md,
+				    struct dm_table *map, struct bio *bio)
 {
 	struct clone_info ci;
-	blk_qc_t ret = BLK_QC_T_NONE;
 	int error = 0;
 
 	init_clone_info(&ci, md, map, bio);
@@ -1643,7 +1649,7 @@ static blk_qc_t __split_and_process_bio(
 		ci.sector_count = bio_sectors(bio);
 		while (ci.sector_count && !error) {
 			error = __split_and_process_non_flush(&ci);
-			if (ci.sector_count && !error) {
+			if (ci.sector_count && !error && ci.poll_cookie == BLK_QC_T_NONE) {
 				/*
 				 * Remainder must be passed to submit_bio_noacct()
 				 * so that it gets handled *after* bios already submitted
@@ -1670,7 +1676,7 @@ static blk_qc_t __split_and_process_bio(
 
 				bio_chain(b, bio);
 				trace_block_split(b, bio->bi_iter.bi_sector);
-				ret = submit_bio_noacct(bio);
+				submit_bio_noacct(bio);
 				break;
 			}
 		}
@@ -1678,13 +1684,11 @@ static blk_qc_t __split_and_process_bio(
 
 	/* drop the extra reference count */
 	dec_pending(ci.io, errno_to_blk_status(error));
-	return ret;
 }
 
 static blk_qc_t dm_submit_bio(struct bio *bio)
 {
 	struct mapped_device *md = bio->bi_bdev->bd_disk->private_data;
-	blk_qc_t ret = BLK_QC_T_NONE;
 	int srcu_idx;
 	struct dm_table *map;
 
@@ -1714,10 +1718,10 @@ static blk_qc_t dm_submit_bio(struct bio
 	if (is_abnormal_io(bio))
 		blk_queue_split(&bio);
 
-	ret = __split_and_process_bio(md, map, bio);
+	__split_and_process_bio(md, map, bio);
 out:
 	dm_put_live_table(md, srcu_idx);
-	return ret;
+	return BLK_QC_T_NONE;
 }
 
 /*-----------------------------------------------------------------

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

