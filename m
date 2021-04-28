Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 265E536E0A5
	for <lists+dm-devel@lfdr.de>; Wed, 28 Apr 2021 23:02:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619643722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RZyuU6vBVlKXO5hZctT98VSSLP5wYLnklf0BepnIfUk=;
	b=P+ikYP8eBEHEXo/gVXbhkyhJpWErP1iP2/D88Td41LesssvvAbcg8Xv9xieAEefFjWMMSz
	kUlCSyoxkXHWKL12snZR/HFq3FvU87kAU5drLsWxlIOxXJ0FJ2uhGvgeab7gdOm9fHUWiO
	AO3NUxJZc4Z9LPog7npeW5d8WZ6IGD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-jLpWmr_2MV2K7vwZx5WkOA-1; Wed, 28 Apr 2021 17:01:58 -0400
X-MC-Unique: jLpWmr_2MV2K7vwZx5WkOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E13A98049D1;
	Wed, 28 Apr 2021 21:01:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 238365D9C6;
	Wed, 28 Apr 2021 21:01:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9BB61809C82;
	Wed, 28 Apr 2021 21:01:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13SL0PmK005492 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 28 Apr 2021 17:00:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17240104C412; Wed, 28 Apr 2021 21:00:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCE621037E8A;
	Wed, 28 Apr 2021 21:00:23 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 13SL0NNH010489; Wed, 28 Apr 2021 17:00:23 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 13SL0N1V010485; Wed, 28 Apr 2021 17:00:23 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 28 Apr 2021 17:00:23 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Milan Broz <mbroz@redhat.com>
Message-ID: <alpine.LRH.2.02.2104281658430.9959@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Melvin Vermeeren <vermeeren@vermwa.re>
Subject: [dm-devel] [PATCH v2] dm-integrity: if we have discard support,
 use it when recalculating
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

Here I'm sending version 2 of the patch - it increases version number of 
the target, so that userspace can test if this feature is present.

Mikulas



From: Mikulas Patocka <mpatocka@redhat.com>

If we have discard support, we don't have to recalculate hash - we can
just fill the metadata with the discard pattern.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c
+++ linux-2.6/drivers/md/dm-integrity.c
@@ -2690,26 +2690,30 @@ next_chunk:
 	if (unlikely(dm_integrity_failed(ic)))
 		goto err;
 
-	io_req.bi_op = REQ_OP_READ;
-	io_req.bi_op_flags = 0;
-	io_req.mem.type = DM_IO_VMA;
-	io_req.mem.ptr.addr = ic->recalc_buffer;
-	io_req.notify.fn = NULL;
-	io_req.client = ic->io;
-	io_loc.bdev = ic->dev->bdev;
-	io_loc.sector = get_data_sector(ic, area, offset);
-	io_loc.count = n_sectors;
+	if (!ic->discard) {
+		io_req.bi_op = REQ_OP_READ;
+		io_req.bi_op_flags = 0;
+		io_req.mem.type = DM_IO_VMA;
+		io_req.mem.ptr.addr = ic->recalc_buffer;
+		io_req.notify.fn = NULL;
+		io_req.client = ic->io;
+		io_loc.bdev = ic->dev->bdev;
+		io_loc.sector = get_data_sector(ic, area, offset);
+		io_loc.count = n_sectors;
 
-	r = dm_io(&io_req, 1, &io_loc, NULL);
-	if (unlikely(r)) {
-		dm_integrity_io_error(ic, "reading data", r);
-		goto err;
-	}
+		r = dm_io(&io_req, 1, &io_loc, NULL);
+		if (unlikely(r)) {
+			dm_integrity_io_error(ic, "reading data", r);
+			goto err;
+		}
 
-	t = ic->recalc_tags;
-	for (i = 0; i < n_sectors; i += ic->sectors_per_block) {
-		integrity_sector_checksum(ic, logical_sector + i, ic->recalc_buffer + (i << SECTOR_SHIFT), t);
-		t += ic->tag_size;
+		t = ic->recalc_tags;
+		for (i = 0; i < n_sectors; i += ic->sectors_per_block) {
+			integrity_sector_checksum(ic, logical_sector + i, ic->recalc_buffer + (i << SECTOR_SHIFT), t);
+			t += ic->tag_size;
+		}
+	} else {
+		t = ic->recalc_tags + (n_sectors >> ic->sb->log2_sectors_per_block) * ic->tag_size;
 	}
 
 	metadata_block = get_metadata_sector_and_offset(ic, area, offset, &metadata_offset);
@@ -4364,11 +4368,13 @@ try_smaller_buffer:
 			goto bad;
 		}
 		INIT_WORK(&ic->recalc_work, integrity_recalc);
-		ic->recalc_buffer = vmalloc(RECALC_SECTORS << SECTOR_SHIFT);
-		if (!ic->recalc_buffer) {
-			ti->error = "Cannot allocate buffer for recalculating";
-			r = -ENOMEM;
-			goto bad;
+		if (!ic->discard) {
+			ic->recalc_buffer = vmalloc(RECALC_SECTORS << SECTOR_SHIFT);
+			if (!ic->recalc_buffer) {
+				ti->error = "Cannot allocate buffer for recalculating";
+				r = -ENOMEM;
+				goto bad;
+			}
 		}
 		ic->recalc_tags = kvmalloc_array(RECALC_SECTORS >> ic->sb->log2_sectors_per_block,
 						 ic->tag_size, GFP_KERNEL);
@@ -4377,6 +4383,8 @@ try_smaller_buffer:
 			r = -ENOMEM;
 			goto bad;
 		}
+		if (ic->discard)
+			memset(ic->recalc_tags, DISCARD_FILLER, (RECALC_SECTORS >> ic->sb->log2_sectors_per_block) * ic->tag_size);
 	} else {
 		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)) {
 			ti->error = "Recalculate can only be specified with internal_hash";
@@ -4570,7 +4578,7 @@ static void dm_integrity_dtr(struct dm_t
 
 static struct target_type integrity_target = {
 	.name			= "integrity",
-	.version		= {1, 8, 0},
+	.version		= {1, 9, 0},
 	.module			= THIS_MODULE,
 	.features		= DM_TARGET_SINGLETON | DM_TARGET_INTEGRITY,
 	.ctr			= dm_integrity_ctr,

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

