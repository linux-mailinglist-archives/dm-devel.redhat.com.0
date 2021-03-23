Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCC5346612
	for <lists+dm-devel@lfdr.de>; Tue, 23 Mar 2021 18:15:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616519706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ljC1p/5NXzZShZode8ibR3UmW/lCm1Mfg5fZRG2D5cE=;
	b=ZPEkFjCR3tGbk8VHrMzupqWndkXsOQnf6y7UC+hPDcXNSWPFwG+uaeZ9Mt2d1Aiy6erm+d
	x2aiw0wvDRRBUAeHPPhBkQv3PfGs0GvgFMs0NCrw7XnpGuoAGSwRheThQxxl+oI2FDC91K
	Lw7uMt0dxbvwlP0w+dr5NjFHVWkhK5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-usX3RFPWMqWIgTjtHmmNBw-1; Tue, 23 Mar 2021 13:15:02 -0400
X-MC-Unique: usX3RFPWMqWIgTjtHmmNBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FAC181624;
	Tue, 23 Mar 2021 17:14:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3B656087C;
	Tue, 23 Mar 2021 17:14:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3FD381809C83;
	Tue, 23 Mar 2021 17:14:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NHET7p027717 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 13:14:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE6CE5FCB3; Tue, 23 Mar 2021 17:14:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0B119F6A;
	Tue, 23 Mar 2021 17:14:26 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 12NHEPeW015356; Tue, 23 Mar 2021 13:14:25 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 12NHEPSl015352; Tue, 23 Mar 2021 13:14:25 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 23 Mar 2021 13:14:25 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Milan Broz <mbroz@redhat.com>
Message-ID: <alpine.LRH.2.02.2103231310580.15014@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH v2] dm-integrity - add the "reset_recalculate"
	flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds a new flag "reset_recalculate" that will restart
recalculating from the beginning of the device. It can be used if we want
to change the hash function. Example:

#!/bin/sh
dmsetup remove_all
rmmod brd
set -e
modprobe brd rd_size=1048576
dmsetup create in --table '0 2000000 integrity /dev/ram0 0 16 J 2 internal_hash:sha256 recalculate'
sleep 10
dmsetup status
dmsetup remove in
dmsetup create in --table '0 2000000 integrity /dev/ram0 0 16 J 2 internal_hash:sha3-256 reset_recalculate'

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c
+++ linux-2.6/drivers/md/dm-integrity.c
@@ -262,6 +262,7 @@ struct dm_integrity_c {
 	bool journal_uptodate;
 	bool just_formatted;
 	bool recalculate_flag;
+	bool reset_recalculate_flag;
 	bool discard;
 	bool fix_padding;
 	bool fix_hmac;
@@ -2526,7 +2527,8 @@ static void do_journal_write(struct dm_i
 #ifndef INTERNAL_VERIFY
 				    unlikely(from_replay) &&
 #endif
-				    ic->internal_hash) {
+				    ic->internal_hash &&
+				    !ic->reset_recalculate_flag) {
 					char test_tag[max_t(size_t, HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
 
 					integrity_sector_checksum(ic, sec + ((l - j) << ic->sb->log2_sectors_per_block),
@@ -3134,7 +3136,8 @@ static void dm_integrity_resume(struct d
 		rw_journal_sectors(ic, REQ_OP_READ, 0, 0,
 				   ic->n_bitmap_blocks * (BITMAP_BLOCK_SIZE >> SECTOR_SHIFT), NULL);
 		if (ic->mode == 'B') {
-			if (ic->sb->log2_blocks_per_bitmap_bit == ic->log2_blocks_per_bitmap_bit) {
+			if (ic->sb->log2_blocks_per_bitmap_bit == ic->log2_blocks_per_bitmap_bit &&
+			    !ic->reset_recalculate_flag) {
 				block_bitmap_copy(ic, ic->recalc_bitmap, ic->journal);
 				block_bitmap_copy(ic, ic->may_write_bitmap, ic->journal);
 				if (!block_bitmap_op(ic, ic->journal, 0, ic->provided_data_sectors,
@@ -3156,7 +3159,8 @@ static void dm_integrity_resume(struct d
 			}
 		} else {
 			if (!(ic->sb->log2_blocks_per_bitmap_bit == ic->log2_blocks_per_bitmap_bit &&
-			      block_bitmap_op(ic, ic->journal, 0, ic->provided_data_sectors, BITMAP_OP_TEST_ALL_CLEAR))) {
+			      block_bitmap_op(ic, ic->journal, 0, ic->provided_data_sectors, BITMAP_OP_TEST_ALL_CLEAR)) ||
+			    ic->reset_recalculate_flag) {
 				ic->sb->flags |= cpu_to_le32(SB_FLAG_RECALCULATING);
 				ic->sb->recalc_sector = cpu_to_le64(0);
 			}
@@ -3169,6 +3173,10 @@ static void dm_integrity_resume(struct d
 			dm_integrity_io_error(ic, "writing superblock", r);
 	} else {
 		replay_journal(ic);
+		if (ic->reset_recalculate_flag) {
+			ic->sb->flags |= cpu_to_le32(SB_FLAG_RECALCULATING);
+			ic->sb->recalc_sector = cpu_to_le64(0);
+		}
 		if (ic->mode == 'B') {
 			ic->sb->flags |= cpu_to_le32(SB_FLAG_DIRTY_BITMAP);
 			ic->sb->log2_blocks_per_bitmap_bit = ic->log2_blocks_per_bitmap_bit;
@@ -3242,6 +3250,7 @@ static void dm_integrity_status(struct d
 		arg_count += !!ic->meta_dev;
 		arg_count += ic->sectors_per_block != 1;
 		arg_count += !!(ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING));
+		arg_count += ic->reset_recalculate_flag;
 		arg_count += ic->discard;
 		arg_count += ic->mode == 'J';
 		arg_count += ic->mode == 'J';
@@ -3261,6 +3270,8 @@ static void dm_integrity_status(struct d
 			DMEMIT(" block_size:%u", ic->sectors_per_block << SECTOR_SHIFT);
 		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING))
 			DMEMIT(" recalculate");
+		if (ic->reset_recalculate_flag)
+			DMEMIT(" reset_recalculate");
 		if (ic->discard)
 			DMEMIT(" allow_discards");
 		DMEMIT(" journal_sectors:%u", ic->initial_sectors - SB_SECTORS);
@@ -3914,7 +3925,7 @@ static int dm_integrity_ctr(struct dm_ta
 	unsigned extra_args;
 	struct dm_arg_set as;
 	static const struct dm_arg _args[] = {
-		{0, 17, "Invalid number of feature args"},
+		{0, 18, "Invalid number of feature args"},
 	};
 	unsigned journal_sectors, interleave_sectors, buffer_sectors, journal_watermark, sync_msec;
 	bool should_write_sb;
@@ -4058,6 +4069,9 @@ static int dm_integrity_ctr(struct dm_ta
 				goto bad;
 		} else if (!strcmp(opt_string, "recalculate")) {
 			ic->recalculate_flag = true;
+		} else if (!strcmp(opt_string, "reset_recalculate")) {
+			ic->recalculate_flag = true;
+			ic->reset_recalculate_flag = true;
 		} else if (!strcmp(opt_string, "allow_discards")) {
 			ic->discard = true;
 		} else if (!strcmp(opt_string, "fix_padding")) {
@@ -4554,7 +4568,7 @@ static void dm_integrity_dtr(struct dm_t
 
 static struct target_type integrity_target = {
 	.name			= "integrity",
-	.version		= {1, 7, 0},
+	.version		= {1, 8, 0},
 	.module			= THIS_MODULE,
 	.features		= DM_TARGET_SINGLETON | DM_TARGET_INTEGRITY,
 	.ctr			= dm_integrity_ctr,

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

