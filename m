Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 43DCE155C00
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 17:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581093779;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j/92pG2BFsNgpNdrGH0kw53ALs1A4KczV5dRsZaa6r8=;
	b=T3c4b5xeUSKlB7ut4+760DEIA1FeH12YpjkpHSBP5PGjDa+3H7FpZlEL2ESKwGBun6mmA/
	kAHm2Lwr5QKWmuM+gZHAdv6plGYE+cOYzGIMGxHiLZ+7FvaKnwcHpHHQ0ooGy6oLsdkS97
	Qp8mHXLRiCOAGNRw7f6O8sHBebTkpTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-AZwZGzfLPS6Qtrx0EiD64Q-1; Fri, 07 Feb 2020 11:42:55 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEFDB8010FD;
	Fri,  7 Feb 2020 16:42:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7F875C548;
	Fri,  7 Feb 2020 16:42:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDFC618089CD;
	Fri,  7 Feb 2020 16:42:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017GgXa8009600 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 11:42:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DBE01863A5; Fri,  7 Feb 2020 16:42:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E5D089A98;
	Fri,  7 Feb 2020 16:42:31 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 017GgUuA000986; Fri, 7 Feb 2020 11:42:30 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 017GgUEj000982; Fri, 7 Feb 2020 11:42:30 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 7 Feb 2020 11:42:30 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
Message-ID: <alpine.LRH.2.02.2002071141140.32552@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-integrity: fix recalculation when moving from
 journal mode to bitmap mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: AZwZGzfLPS6Qtrx0EiD64Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If we resume a device in bitmap mode and the on-disk format is in journal
mode, we must recalculate anything above ic->sb->recalc_sector. Otherwise,
there would be non-recalculated blocks causing I/O errors.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v5.2+
Fixes: 468dfca38b1a ("dm integrity: add a bitmap mode")

---
 drivers/md/dm-integrity.c |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-01-30 18:16:55.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-02-07 17:40:09.000000000 +0100
@@ -2899,17 +2899,20 @@ static void dm_integrity_resume(struct d
 	} else {
 		replay_journal(ic);
 		if (ic->mode == 'B') {
-			int mode;
 			ic->sb->flags |= cpu_to_le32(SB_FLAG_DIRTY_BITMAP);
 			ic->sb->log2_blocks_per_bitmap_bit = ic->log2_blocks_per_bitmap_bit;
 			r = sync_rw_sb(ic, REQ_OP_WRITE, REQ_FUA);
 			if (unlikely(r))
 				dm_integrity_io_error(ic, "writing superblock", r);
 
-			mode = ic->recalculate_flag ? BITMAP_OP_SET : BITMAP_OP_CLEAR;
-			block_bitmap_op(ic, ic->journal, 0, ic->provided_data_sectors, mode);
-			block_bitmap_op(ic, ic->recalc_bitmap, 0, ic->provided_data_sectors, mode);
-			block_bitmap_op(ic, ic->may_write_bitmap, 0, ic->provided_data_sectors, mode);
+			block_bitmap_op(ic, ic->journal, 0, ic->provided_data_sectors, BITMAP_OP_CLEAR);
+			block_bitmap_op(ic, ic->recalc_bitmap, 0, ic->provided_data_sectors, BITMAP_OP_CLEAR);
+			block_bitmap_op(ic, ic->may_write_bitmap, 0, ic->provided_data_sectors, BITMAP_OP_CLEAR);
+			if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING) && le64_to_cpu(ic->sb->recalc_sector) < ic->provided_data_sectors) {
+				block_bitmap_op(ic, ic->journal, le64_to_cpu(ic->sb->recalc_sector), ic->provided_data_sectors - le64_to_cpu(ic->sb->recalc_sector), BITMAP_OP_SET);
+				block_bitmap_op(ic, ic->recalc_bitmap, le64_to_cpu(ic->sb->recalc_sector), ic->provided_data_sectors - le64_to_cpu(ic->sb->recalc_sector), BITMAP_OP_SET);
+				block_bitmap_op(ic, ic->may_write_bitmap, le64_to_cpu(ic->sb->recalc_sector), ic->provided_data_sectors - le64_to_cpu(ic->sb->recalc_sector), BITMAP_OP_SET);
+			}
 			rw_journal_sectors(ic, REQ_OP_WRITE, REQ_FUA | REQ_SYNC, 0,
 					   ic->n_bitmap_blocks * (BITMAP_BLOCK_SIZE >> SECTOR_SHIFT), NULL);
 		}

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

