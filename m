Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6982C18EBFD
	for <lists+dm-devel@lfdr.de>; Sun, 22 Mar 2020 20:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584906314;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bU1RuE7zneEXPHnZYT9yR23eF2Ld+Sr9n3sNw9xm24E=;
	b=HtK0SpnvXyCwuE0P5B5oDgq5lllyD2u7Dud2FKS1WEILK5FXFMJr2J7nKp89/eUvZmDTLI
	ypNGa7zwSsSkRq4qP/O/pl4jjDEU1RNwKgfw1q3RanHgY0eFDagg3Sk9c192efgR/uUVkc
	44IW7UKWUxcpvxXto6VGat9I8xwdsSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-Fx60aMnPOQqfUdHQTtKpZg-1; Sun, 22 Mar 2020 15:45:09 -0400
X-MC-Unique: Fx60aMnPOQqfUdHQTtKpZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41DDA1084424;
	Sun, 22 Mar 2020 19:45:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0404E5DA81;
	Sun, 22 Mar 2020 19:45:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E25186396;
	Sun, 22 Mar 2020 19:45:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02MJiSAd025808 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 15:44:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0A98171D6; Sun, 22 Mar 2020 19:44:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.192.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38393196AE;
	Sun, 22 Mar 2020 19:44:25 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jG6WD-0005xo-I6; Sun, 22 Mar 2020 20:44:22 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Sun, 22 Mar 2020 20:44:21 +0100
Message-Id: <20200322194421.285724400@debian-a64.vm>
User-Agent: quilt/0.65
Date: Sun, 22 Mar 2020 20:42:22 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 2/7] dm-integrity: remove sector type casts
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=dm-integrity-fix-debug-messages.patch

Since the commit 72deb455b5ec619ff043c30bc90025aa3de3cdda, sector_t is
always defined as unsigned long long. This patch deletes the type casts in
printk and avoids some warnings if DEBUG_PRINT is defined.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-03-20 17:37:36.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-03-20 17:37:36.000000000 +0100
@@ -510,8 +510,8 @@ static bool block_bitmap_op(struct dm_in
 
 	if (unlikely(((sector | n_sectors) & ((1 << ic->sb->log2_sectors_per_block) - 1)) != 0)) {
 		DMCRIT("invalid bitmap access (%llx,%llx,%d,%d,%d)",
-			(unsigned long long)sector,
-			(unsigned long long)n_sectors,
+			sector,
+			n_sectors,
 			ic->sb->log2_sectors_per_block,
 			ic->log2_blocks_per_bitmap_bit,
 			mode);
@@ -1559,7 +1559,7 @@ again:
 			if (unlikely(r)) {
 				if (r > 0) {
 					DMERR_LIMIT("Checksum failed at sector 0x%llx",
-						    (unsigned long long)(sector - ((r + ic->tag_size - 1) / ic->tag_size)));
+						    (sector - ((r + ic->tag_size - 1) / ic->tag_size)));
 					r = -EILSEQ;
 					atomic64_inc(&ic->number_of_mismatches);
 				}
@@ -1643,14 +1643,14 @@ static int dm_integrity_map(struct dm_ta
 	}
 	if (unlikely(dio->range.logical_sector + bio_sectors(bio) > ic->provided_data_sectors)) {
 		DMERR("Too big sector number: 0x%llx + 0x%x > 0x%llx",
-		      (unsigned long long)dio->range.logical_sector, bio_sectors(bio),
-		      (unsigned long long)ic->provided_data_sectors);
+		      dio->range.logical_sector, bio_sectors(bio),
+		      ic->provided_data_sectors);
 		return DM_MAPIO_KILL;
 	}
 	if (unlikely((dio->range.logical_sector | bio_sectors(bio)) & (unsigned)(ic->sectors_per_block - 1))) {
 		DMERR("Bio not aligned on %u sectors: 0x%llx, 0x%x",
 		      ic->sectors_per_block,
-		      (unsigned long long)dio->range.logical_sector, bio_sectors(bio));
+		      dio->range.logical_sector, bio_sectors(bio));
 		return DM_MAPIO_KILL;
 	}
 
@@ -1753,7 +1753,7 @@ retry_kmap:
 					integrity_sector_checksum(ic, logical_sector, mem + bv.bv_offset, checksums_onstack);
 					if (unlikely(memcmp(checksums_onstack, journal_entry_tag(ic, je), ic->tag_size))) {
 						DMERR_LIMIT("Checksum failed when reading from journal, at sector 0x%llx",
-							    (unsigned long long)logical_sector);
+							    logical_sector);
 					}
 				}
 #endif
@@ -2404,7 +2404,7 @@ next_chunk:
 		get_area_and_offset(ic, logical_sector, &area, &offset);
 	}
 
-	DEBUG_print("recalculating: %lx, %lx\n", logical_sector, n_sectors);
+	DEBUG_print("recalculating: %llx, %llx\n", logical_sector, n_sectors);
 
 	if (unlikely(++super_counter == RECALC_WRITE_SUPER)) {
 		recalc_write_super(ic);
@@ -2898,7 +2898,7 @@ static void dm_integrity_resume(struct d
 	DEBUG_print("testing recalc: %x\n", ic->sb->flags);
 	if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)) {
 		__u64 recalc_pos = le64_to_cpu(ic->sb->recalc_sector);
-		DEBUG_print("recalc pos: %lx / %lx\n", (long)recalc_pos, ic->provided_data_sectors);
+		DEBUG_print("recalc pos: %llx / %llx\n", recalc_pos, ic->provided_data_sectors);
 		if (recalc_pos < ic->provided_data_sectors) {
 			queue_work(ic->recalc_wq, &ic->recalc_work);
 		} else if (recalc_pos > ic->provided_data_sectors) {
@@ -2928,10 +2928,10 @@ static void dm_integrity_status(struct d
 	switch (type) {
 	case STATUSTYPE_INFO:
 		DMEMIT("%llu %llu",
-			(unsigned long long)atomic64_read(&ic->number_of_mismatches),
-			(unsigned long long)ic->provided_data_sectors);
+			atomic64_read(&ic->number_of_mismatches),
+			ic->provided_data_sectors);
 		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING))
-			DMEMIT(" %llu", (unsigned long long)le64_to_cpu(ic->sb->recalc_sector));
+			DMEMIT(" %llu", le64_to_cpu(ic->sb->recalc_sector));
 		else
 			DMEMIT(" -");
 		break;
@@ -2952,7 +2952,7 @@ static void dm_integrity_status(struct d
 		arg_count += !!ic->journal_crypt_alg.alg_string;
 		arg_count += !!ic->journal_mac_alg.alg_string;
 		arg_count += (ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_PADDING)) != 0;
-		DMEMIT("%s %llu %u %c %u", ic->dev->name, (unsigned long long)ic->start,
+		DMEMIT("%s %llu %u %c %u", ic->dev->name, ic->start,
 		       ic->tag_size, ic->mode, arg_count);
 		if (ic->meta_dev)
 			DMEMIT(" meta_device:%s", ic->meta_dev->name);
@@ -2968,7 +2968,7 @@ static void dm_integrity_status(struct d
 			DMEMIT(" commit_time:%u", ic->autocommit_msec);
 		}
 		if (ic->mode == 'B') {
-			DMEMIT(" sectors_per_bit:%llu", (unsigned long long)ic->sectors_per_block << ic->log2_blocks_per_bitmap_bit);
+			DMEMIT(" sectors_per_bit:%llu", (sector_t)ic->sectors_per_block << ic->log2_blocks_per_bitmap_bit);
 			DMEMIT(" bitmap_flush_interval:%u", jiffies_to_msecs(ic->bitmap_flush_interval));
 		}
 		if ((ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_PADDING)) != 0)
@@ -3994,10 +3994,9 @@ try_smaller_buffer:
 	DEBUG_print("	initial_sectors 0x%x\n", ic->initial_sectors);
 	DEBUG_print("	metadata_run 0x%x\n", ic->metadata_run);
 	DEBUG_print("	log2_metadata_run %d\n", ic->log2_metadata_run);
-	DEBUG_print("	provided_data_sectors 0x%llx (%llu)\n", (unsigned long long)ic->provided_data_sectors,
-		    (unsigned long long)ic->provided_data_sectors);
+	DEBUG_print("	provided_data_sectors 0x%llx (%llu)\n", ic->provided_data_sectors, ic->provided_data_sectors);
 	DEBUG_print("	log2_buffer_sectors %u\n", ic->log2_buffer_sectors);
-	DEBUG_print("	bits_in_journal %llu\n", (unsigned long long)bits_in_journal);
+	DEBUG_print("	bits_in_journal %llu\n", bits_in_journal);
 
 	if (ic->recalculate_flag && !(ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING))) {
 		ic->sb->flags |= cpu_to_le32(SB_FLAG_RECALCULATING);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

