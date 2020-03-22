Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 1695E18EBFE
	for <lists+dm-devel@lfdr.de>; Sun, 22 Mar 2020 20:45:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584906316;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dlTFGbRZrz6agF5Mn0peGQdGa+yiP+hPwQqko6sz/ZY=;
	b=g8ZDwOnLQR1FY/D3ErMO2J/vutiyBISji3g2hFz6lrKYTpDaSGe/Mj88D0G3WI+S4K0WN4
	5Es5fi90boorR09Qg/wNSvVu6AxrTis7BrTfY0TxB4UFWknytJ90be9aS5mwZCdHM/EPLT
	LrglZzQCLkXsdCclpBfJpOKKSSTqud8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-ccNjoktANXOnDW0Yrteq5A-1; Sun, 22 Mar 2020 15:45:14 -0400
X-MC-Unique: ccNjoktANXOnDW0Yrteq5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DB3D8014CD;
	Sun, 22 Mar 2020 19:45:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13195385;
	Sun, 22 Mar 2020 19:45:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 629C418089D0;
	Sun, 22 Mar 2020 19:45:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02MJiXEQ025851 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 15:44:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADC025C28E; Sun, 22 Mar 2020 19:44:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.192.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAF555C1B2;
	Sun, 22 Mar 2020 19:44:29 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jG6WI-0005y0-OQ; Sun, 22 Mar 2020 20:44:27 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Sun, 22 Mar 2020 20:44:26 +0100
Message-Id: <20200322194426.466600320@debian-a64.vm>
User-Agent: quilt/0.65
Date: Sun, 22 Mar 2020 20:42:26 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 6/7] dm-integrity: support discard
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=dm-integrity-discard.patch

This patch adds an argument allow_discards that enables discard processing
on dm-integrity device. Only devices with internal hash are allowed.

If we discard a block, we fill the integrity tag with bytes 0xf6.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |  175 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 143 insertions(+), 32 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-03-20 17:41:22.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-03-20 17:41:22.000000000 +0100
@@ -39,6 +39,7 @@
 #define RECALC_WRITE_SUPER		16
 #define BITMAP_BLOCK_SIZE		4096	/* don't change it */
 #define BITMAP_FLUSH_INTERVAL		(10 * HZ)
+#define DISCARD_FILLER			0xf6
 
 /*
  * Warning - DEBUG_PRINT prints security-sensitive data to the log,
@@ -257,6 +258,7 @@ struct dm_integrity_c {
 	bool just_formatted;
 	bool recalculate_flag;
 	bool fix_padding;
+	bool discard;
 
 	struct alg_spec internal_hash_alg;
 	struct alg_spec journal_crypt_alg;
@@ -284,7 +286,7 @@ struct dm_integrity_io {
 	struct work_struct work;
 
 	struct dm_integrity_c *ic;
-	bool write;
+	enum req_opf op;
 	bool fua;
 
 	struct dm_integrity_range range;
@@ -1299,6 +1301,11 @@ static bool find_newer_committed_node(st
 static int dm_integrity_rw_tag(struct dm_integrity_c *ic, unsigned char *tag, sector_t *metadata_block,
 			       unsigned *metadata_offset, unsigned total_size, int op)
 {
+#define MAY_BE_FILLER		1
+#define MAY_BE_HASH		2
+	unsigned hash_offset = 0;
+	unsigned may_be = MAY_BE_HASH | (ic->discard ? MAY_BE_FILLER : 0);
+
 	do {
 		unsigned char *data, *dp;
 		struct dm_buffer *b;
@@ -1320,18 +1327,35 @@ static int dm_integrity_rw_tag(struct dm
 		} else if (op == TAG_WRITE) {
 			memcpy(dp, tag, to_copy);
 			dm_bufio_mark_partial_buffer_dirty(b, *metadata_offset, *metadata_offset + to_copy);
-		} else  {
+		} else {
 			/* e.g.: op == TAG_CMP */
-			if (unlikely(memcmp(dp, tag, to_copy))) {
-				unsigned i;
 
-				for (i = 0; i < to_copy; i++) {
-					if (dp[i] != tag[i])
-						break;
-					total_size--;
+			if (likely(is_power_of_2(ic->tag_size))) {
+				if (unlikely(memcmp(dp, tag, to_copy)))
+					if (unlikely(!ic->discard) ||
+					    unlikely(!memchr_inv(dp, DISCARD_FILLER, to_copy))) {
+						goto thorough_test;
+				}
+			} else {
+				unsigned i, ts;
+thorough_test:
+				ts = total_size;
+
+				for (i = 0; i < to_copy; i++, ts--) {
+					if (unlikely(dp[i] != tag[i]))
+						may_be &= ~MAY_BE_HASH;
+					if (likely(dp[i] != DISCARD_FILLER))
+						may_be &= ~MAY_BE_FILLER;
+					hash_offset++;
+					if (unlikely(hash_offset == ic->tag_size)) {
+						if (unlikely(!may_be)) {
+							dm_bufio_release(b);
+							return ts;
+						}
+						hash_offset = 0;
+						may_be = MAY_BE_HASH | (ic->discard ? MAY_BE_FILLER : 0);
+					}
 				}
-				dm_bufio_release(b);
-				return total_size;
 			}
 		}
 		dm_bufio_release(b);
@@ -1342,10 +1366,17 @@ static int dm_integrity_rw_tag(struct dm
 			(*metadata_block)++;
 			*metadata_offset = 0;
 		}
+
+		if (unlikely(!is_power_of_2(ic->tag_size))) {
+			hash_offset = (hash_offset + to_copy) % ic->tag_size;
+		}
+
 		total_size -= to_copy;
 	} while (unlikely(total_size));
 
 	return 0;
+#undef MAY_BE_FILLER
+#undef MAY_BE_HASH
 }
 
 static void dm_integrity_flush_buffers(struct dm_integrity_c *ic)
@@ -1428,7 +1459,7 @@ static void dec_in_flight(struct dm_inte
 
 		remove_range(ic, &dio->range);
 
-		if (unlikely(dio->write))
+		if (dio->op == REQ_OP_WRITE || unlikely(dio->op == REQ_OP_DISCARD))
 			schedule_autocommit(ic);
 
 		bio = dm_bio_from_per_bio_data(dio, sizeof(struct dm_integrity_io));
@@ -1520,14 +1551,19 @@ static void integrity_metadata(struct wo
 		char *checksums;
 		unsigned extra_space = unlikely(digest_size > ic->tag_size) ? digest_size - ic->tag_size : 0;
 		char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
-		unsigned sectors_to_process = dio->range.n_sectors;
-		sector_t sector = dio->range.logical_sector;
+		sector_t sector;
+		unsigned sectors_to_process;
+		sector_t save_metadata_block;
+		unsigned save_metadata_offset;
 
 		if (unlikely(ic->mode == 'R'))
 			goto skip_io;
 
-		checksums = kmalloc((PAGE_SIZE >> SECTOR_SHIFT >> ic->sb->log2_sectors_per_block) * ic->tag_size + extra_space,
-				    GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
+		if (likely(dio->op != REQ_OP_DISCARD))
+			checksums = kmalloc((PAGE_SIZE >> SECTOR_SHIFT >> ic->sb->log2_sectors_per_block) * ic->tag_size + extra_space,
+					    GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
+		else
+			checksums = kmalloc(PAGE_SIZE, GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
 		if (!checksums) {
 			checksums = checksums_onstack;
 			if (WARN_ON(extra_space &&
@@ -1537,6 +1573,42 @@ static void integrity_metadata(struct wo
 			}
 		}
 
+		if (unlikely(dio->op == REQ_OP_DISCARD)) {
+			sector_t bi_sector = dio->bio_details.bi_iter.bi_sector;
+			unsigned bi_size = dio->bio_details.bi_iter.bi_size;
+			unsigned max_size = likely(checksums != checksums_onstack) ? PAGE_SIZE : HASH_MAX_DIGESTSIZE;
+			unsigned max_blocks = max_size / ic->tag_size;
+			memset(checksums, DISCARD_FILLER, max_size);
+
+			while (bi_size) {
+				unsigned this_step_blocks = bi_size >> (SECTOR_SHIFT + ic->sb->log2_sectors_per_block);
+				this_step_blocks = min(this_step_blocks, max_blocks);
+				r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset, this_step_blocks * ic->tag_size, TAG_WRITE);
+				if (unlikely(r)) {
+					if (likely(checksums != checksums_onstack))
+						kfree(checksums);
+					goto error;
+				}
+
+				/*if (bi_size < this_step_blocks << (SECTOR_SHIFT + ic->sb->log2_sectors_per_block)) {
+					printk("BUGG: bi_sector: %llx, bi_size: %u\n", bi_sector, bi_size);
+					printk("BUGG: this_step_blocks: %u\n", this_step_blocks);
+					BUG();
+				}*/
+				bi_size -= this_step_blocks << (SECTOR_SHIFT + ic->sb->log2_sectors_per_block);
+				bi_sector += this_step_blocks << ic->sb->log2_sectors_per_block;
+			}
+
+			if (likely(checksums != checksums_onstack))
+				kfree(checksums);
+			goto skip_io;
+		}
+
+		save_metadata_block = dio->metadata_block;
+		save_metadata_offset = dio->metadata_offset;
+		sector = dio->range.logical_sector;
+		sectors_to_process = dio->range.n_sectors;
+
 		__bio_for_each_segment(bv, bio, iter, dio->bio_details.bi_iter) {
 			unsigned pos;
 			char *mem, *checksums_ptr;
@@ -1555,7 +1627,7 @@ again:
 			kunmap_atomic(mem);
 
 			r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
-						checksums_ptr - checksums, !dio->write ? TAG_CMP : TAG_WRITE);
+						checksums_ptr - checksums, dio->op == REQ_OP_READ ? TAG_CMP : TAG_WRITE);
 			if (unlikely(r)) {
 				if (r > 0) {
 					DMERR_LIMIT("Checksum failed at sector 0x%llx",
@@ -1598,7 +1670,7 @@ again:
 				tag = lowmem_page_address(biv.bv_page) + biv.bv_offset;
 				this_len = min(biv.bv_len, data_to_process);
 				r = dm_integrity_rw_tag(ic, tag, &dio->metadata_block, &dio->metadata_offset,
-							this_len, !dio->write ? TAG_READ : TAG_WRITE);
+							this_len, dio->op == REQ_OP_READ ? TAG_READ : TAG_WRITE);
 				if (unlikely(r))
 					goto error;
 				data_to_process -= this_len;
@@ -1625,6 +1697,20 @@ static int dm_integrity_map(struct dm_ta
 
 	dio->ic = ic;
 	dio->bi_status = 0;
+	dio->op = bio_op(bio);
+
+	if (unlikely(dio->op == REQ_OP_DISCARD)) {
+		if (ti->max_io_len) {
+			sector_t sec = dm_target_offset(ti, bio->bi_iter.bi_sector);
+			unsigned log2_max_io_len = __fls(ti->max_io_len);
+			sector_t start_boundary = sec >> log2_max_io_len;
+			sector_t end_boundary = (sec + bio_sectors(bio) - 1) >> log2_max_io_len;
+			if (start_boundary < end_boundary) {
+				sector_t len = ti->max_io_len - (sec & (ti->max_io_len - 1));
+				dm_accept_partial_bio(bio, len);
+			}
+		}
+	}
 
 	if (unlikely(bio->bi_opf & REQ_PREFLUSH)) {
 		submit_flush_bio(ic, dio);
@@ -1632,8 +1718,7 @@ static int dm_integrity_map(struct dm_ta
 	}
 
 	dio->range.logical_sector = dm_target_offset(ti, bio->bi_iter.bi_sector);
-	dio->write = bio_op(bio) == REQ_OP_WRITE;
-	dio->fua = dio->write && bio->bi_opf & REQ_FUA;
+	dio->fua = dio->op == REQ_OP_WRITE && bio->bi_opf & REQ_FUA;
 	if (unlikely(dio->fua)) {
 		/*
 		 * Don't pass down the FUA flag because we have to flush
@@ -1654,7 +1739,7 @@ static int dm_integrity_map(struct dm_ta
 		return DM_MAPIO_KILL;
 	}
 
-	if (ic->sectors_per_block > 1) {
+	if (ic->sectors_per_block > 1 && likely(dio->op != REQ_OP_DISCARD)) {
 		struct bvec_iter iter;
 		struct bio_vec bv;
 		bio_for_each_segment(bv, bio, iter) {
@@ -1687,7 +1772,7 @@ static int dm_integrity_map(struct dm_ta
 		}
 	}
 
-	if (unlikely(ic->mode == 'R') && unlikely(dio->write))
+	if (unlikely(ic->mode == 'R') && unlikely(dio->op != REQ_OP_READ))
 		return DM_MAPIO_KILL;
 
 	get_area_and_offset(ic, dio->range.logical_sector, &area, &offset);
@@ -1717,13 +1802,13 @@ static bool __journal_read_write(struct
 		bio_advance_iter(bio, &bio->bi_iter, bv.bv_len);
 retry_kmap:
 		mem = kmap_atomic(bv.bv_page);
-		if (likely(dio->write))
+		if (likely(dio->op == REQ_OP_WRITE))
 			flush_dcache_page(bv.bv_page);
 
 		do {
 			struct journal_entry *je = access_journal_entry(ic, journal_section, journal_entry);
 
-			if (unlikely(!dio->write)) {
+			if (unlikely(dio->op == REQ_OP_READ)) {
 				struct journal_sector *js;
 				char *mem_ptr;
 				unsigned s;
@@ -1770,7 +1855,7 @@ retry_kmap:
 					char *tag_addr;
 					BUG_ON(PageHighMem(biv.bv_page));
 					tag_addr = lowmem_page_address(biv.bv_page) + biv.bv_offset;
-					if (likely(dio->write))
+					if (likely(dio->op == REQ_OP_WRITE))
 						memcpy(tag_ptr, tag_addr, tag_now);
 					else
 						memcpy(tag_addr, tag_ptr, tag_now);
@@ -1778,12 +1863,12 @@ retry_kmap:
 					tag_ptr += tag_now;
 					tag_todo -= tag_now;
 				} while (unlikely(tag_todo)); else {
-					if (likely(dio->write))
+					if (likely(dio->op == REQ_OP_WRITE))
 						memset(tag_ptr, 0, tag_todo);
 				}
 			}
 
-			if (likely(dio->write)) {
+			if (likely(dio->op == REQ_OP_WRITE)) {
 				struct journal_sector *js;
 				unsigned s;
 
@@ -1819,12 +1904,12 @@ retry_kmap:
 			bv.bv_offset += ic->sectors_per_block << SECTOR_SHIFT;
 		} while (bv.bv_len -= ic->sectors_per_block << SECTOR_SHIFT);
 
-		if (unlikely(!dio->write))
+		if (unlikely(dio->op == REQ_OP_READ))
 			flush_dcache_page(bv.bv_page);
 		kunmap_atomic(mem);
 	} while (n_sectors);
 
-	if (likely(dio->write)) {
+	if (likely(dio->op == REQ_OP_WRITE)) {
 		smp_mb();
 		if (unlikely(waitqueue_active(&ic->copy_to_journal_wait)))
 			wake_up(&ic->copy_to_journal_wait);
@@ -1856,7 +1941,9 @@ static void dm_integrity_map_continue(st
 	unsigned journal_section, journal_entry;
 	unsigned journal_read_pos;
 	struct completion read_comp;
-	bool need_sync_io = ic->internal_hash && !dio->write;
+	bool need_sync_io = ic->internal_hash && dio->op == REQ_OP_READ;
+	if (unlikely(dio->op == REQ_OP_DISCARD) && ic->mode != 'D')
+		need_sync_io = true;
 
 	if (need_sync_io && from_map) {
 		INIT_WORK(&dio->work, integrity_bio_wait);
@@ -1874,8 +1961,8 @@ retry:
 	}
 	dio->range.n_sectors = bio_sectors(bio);
 	journal_read_pos = NOT_FOUND;
-	if (likely(ic->mode == 'J')) {
-		if (dio->write) {
+	if (ic->mode == 'J' && likely(dio->op != REQ_OP_DISCARD)) {
+		if (dio->op == REQ_OP_WRITE) {
 			unsigned next_entry, i, pos;
 			unsigned ws, we, range_sectors;
 
@@ -1978,7 +2065,7 @@ offload_to_thread:
 		goto journal_read_write;
 	}
 
-	if (ic->mode == 'B' && dio->write) {
+	if (ic->mode == 'B' && (dio->op == REQ_OP_WRITE || unlikely(dio->op == REQ_OP_DISCARD))) {
 		if (!block_bitmap_op(ic, ic->may_write_bitmap, dio->range.logical_sector,
 				     dio->range.n_sectors, BITMAP_OP_TEST_ALL_SET)) {
 			struct bitmap_block_status *bbs;
@@ -2007,6 +2094,18 @@ offload_to_thread:
 	bio->bi_end_io = integrity_end_io;
 	bio->bi_iter.bi_size = dio->range.n_sectors << SECTOR_SHIFT;
 
+	if (unlikely(dio->op == REQ_OP_DISCARD) && likely(ic->mode != 'D')) {
+		integrity_metadata(&dio->work);
+		dm_integrity_flush_buffers(ic);
+
+		dio->in_flight = (atomic_t)ATOMIC_INIT(1);
+		dio->completion = NULL;
+
+		generic_make_request(bio);
+
+		return;
+	}
+
 	generic_make_request(bio);
 
 	if (need_sync_io) {
@@ -2966,6 +3065,7 @@ static void dm_integrity_status(struct d
 		arg_count += !!ic->meta_dev;
 		arg_count += ic->sectors_per_block != 1;
 		arg_count += !!(ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING));
+		arg_count += ic->discard;
 		arg_count += ic->mode == 'J';
 		arg_count += ic->mode == 'J';
 		arg_count += ic->mode == 'B';
@@ -2982,6 +3082,8 @@ static void dm_integrity_status(struct d
 			DMEMIT(" block_size:%u", ic->sectors_per_block << SECTOR_SHIFT);
 		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING))
 			DMEMIT(" recalculate");
+		if (ic->discard)
+			DMEMIT(" allow_discards");
 		DMEMIT(" journal_sectors:%u", ic->initial_sectors - SB_SECTORS);
 		DMEMIT(" interleave_sectors:%u", 1U << ic->sb->log2_interleave_sectors);
 		DMEMIT(" buffer_sectors:%u", 1U << ic->log2_buffer_sectors);
@@ -3768,6 +3870,8 @@ static int dm_integrity_ctr(struct dm_ta
 				goto bad;
 		} else if (!strcmp(opt_string, "recalculate")) {
 			ic->recalculate_flag = true;
+		} else if (!strcmp(opt_string, "allow_discards")) {
+			ic->discard = true;
 		} else if (!strcmp(opt_string, "fix_padding")) {
 			ic->fix_padding = true;
 		} else {
@@ -3826,6 +3930,12 @@ static int dm_integrity_ctr(struct dm_ta
 		goto bad;
 	}
 
+	if (ic->discard && !ic->internal_hash) {
+		r = -EINVAL;
+		ti->error = "Discard can be only used with internal hash";
+		goto bad;
+	}
+
 	ic->autocommit_jiffies = msecs_to_jiffies(sync_msec);
 	ic->autocommit_msec = sync_msec;
 	timer_setup(&ic->autocommit_timer, autocommit_fn, 0);
@@ -4155,6 +4265,7 @@ try_smaller_buffer:
 
 	ti->num_flush_bios = 1;
 	ti->flush_supported = true;
+	ti->num_discard_bios = ic->discard;
 
 	return 0;
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

