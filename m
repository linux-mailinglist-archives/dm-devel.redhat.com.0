Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9B337BC82
	for <lists+dm-devel@lfdr.de>; Wed, 12 May 2021 14:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620822562;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J1k8dIf9vCLfdUlrWjmrAWepN9MyHHoJTORc1R3OdNU=;
	b=XDKKuSZZq8l3EcH0PBdZe+sMiQYflhx9YC6k+eLWpCOyysr88cPg+njUnGJsKpLG3KlQvc
	L4TaZCSvrX6PbcQNOYMU/V5od1iSw+jC9MzchoCKNd7Nmw0Gq/Pf9lSR2LjTuAmB2iuTJW
	wQbiBJJeqZYsxzZgyyR9s58SoedI5v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-DoVmruOzOm2Zx9h2blBuxg-1; Wed, 12 May 2021 08:29:20 -0400
X-MC-Unique: DoVmruOzOm2Zx9h2blBuxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15DAA10CE78F;
	Wed, 12 May 2021 12:29:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DFCC6091A;
	Wed, 12 May 2021 12:29:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B4385BBE8;
	Wed, 12 May 2021 12:29:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14CCSqnv024389 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 May 2021 08:28:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33E602B1D0; Wed, 12 May 2021 12:28:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D66A60CC6;
	Wed, 12 May 2021 12:28:45 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 14CCSiTp016260; Wed, 12 May 2021 08:28:44 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 14CCShou016256; Wed, 12 May 2021 08:28:43 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 12 May 2021 08:28:43 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2105120827200.15893@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Melvin Vermeeren <vermeeren@vermwa.re>,
	Milan Broz <mbroz@redhat.com>
Subject: [dm-devel] [PATCH] dm-integrity: revert the discard patch
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

Revert the commit 7a5b96b4784454ba258e83dc7469ddbacd3aaac3 ("dm integrity:
use discard support when recalculating").

There's a bug that when we write some data beyond the current recalculate
boundary, the checksum will be rewritten with the discard filler later.
And the data will no longer have integrity protection.

There's no easy fix for this case, so we revert the whole patch.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c
+++ linux-2.6/drivers/md/dm-integrity.c
@@ -2689,30 +2689,26 @@ next_chunk:
 	if (unlikely(dm_integrity_failed(ic)))
 		goto err;
 
-	if (!ic->discard) {
-		io_req.bi_op = REQ_OP_READ;
-		io_req.bi_op_flags = 0;
-		io_req.mem.type = DM_IO_VMA;
-		io_req.mem.ptr.addr = ic->recalc_buffer;
-		io_req.notify.fn = NULL;
-		io_req.client = ic->io;
-		io_loc.bdev = ic->dev->bdev;
-		io_loc.sector = get_data_sector(ic, area, offset);
-		io_loc.count = n_sectors;
+	io_req.bi_op = REQ_OP_READ;
+	io_req.bi_op_flags = 0;
+	io_req.mem.type = DM_IO_VMA;
+	io_req.mem.ptr.addr = ic->recalc_buffer;
+	io_req.notify.fn = NULL;
+	io_req.client = ic->io;
+	io_loc.bdev = ic->dev->bdev;
+	io_loc.sector = get_data_sector(ic, area, offset);
+	io_loc.count = n_sectors;
 
-		r = dm_io(&io_req, 1, &io_loc, NULL);
-		if (unlikely(r)) {
-			dm_integrity_io_error(ic, "reading data", r);
-			goto err;
-		}
+	r = dm_io(&io_req, 1, &io_loc, NULL);
+	if (unlikely(r)) {
+		dm_integrity_io_error(ic, "reading data", r);
+		goto err;
+	}
 
-		t = ic->recalc_tags;
-		for (i = 0; i < n_sectors; i += ic->sectors_per_block) {
-			integrity_sector_checksum(ic, logical_sector + i, ic->recalc_buffer + (i << SECTOR_SHIFT), t);
-			t += ic->tag_size;
-		}
-	} else {
-		t = ic->recalc_tags + (n_sectors >> ic->sb->log2_sectors_per_block) * ic->tag_size;
+	t = ic->recalc_tags;
+	for (i = 0; i < n_sectors; i += ic->sectors_per_block) {
+		integrity_sector_checksum(ic, logical_sector + i, ic->recalc_buffer + (i << SECTOR_SHIFT), t);
+		t += ic->tag_size;
 	}
 
 	metadata_block = get_metadata_sector_and_offset(ic, area, offset, &metadata_offset);
@@ -4368,13 +4364,11 @@ try_smaller_buffer:
 			goto bad;
 		}
 		INIT_WORK(&ic->recalc_work, integrity_recalc);
-		if (!ic->discard) {
-			ic->recalc_buffer = vmalloc(RECALC_SECTORS << SECTOR_SHIFT);
-			if (!ic->recalc_buffer) {
-				ti->error = "Cannot allocate buffer for recalculating";
-				r = -ENOMEM;
-				goto bad;
-			}
+		ic->recalc_buffer = vmalloc(RECALC_SECTORS << SECTOR_SHIFT);
+		if (!ic->recalc_buffer) {
+			ti->error = "Cannot allocate buffer for recalculating";
+			r = -ENOMEM;
+			goto bad;
 		}
 		ic->recalc_tags = kvmalloc_array(RECALC_SECTORS >> ic->sb->log2_sectors_per_block,
 						 ic->tag_size, GFP_KERNEL);
@@ -4383,9 +4377,6 @@ try_smaller_buffer:
 			r = -ENOMEM;
 			goto bad;
 		}
-		if (ic->discard)
-			memset(ic->recalc_tags, DISCARD_FILLER,
-			       (RECALC_SECTORS >> ic->sb->log2_sectors_per_block) * ic->tag_size);
 	} else {
 		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING)) {
 			ti->error = "Recalculate can only be specified with internal_hash";
@@ -4579,7 +4570,7 @@ static void dm_integrity_dtr(struct dm_t
 
 static struct target_type integrity_target = {
 	.name			= "integrity",
-	.version		= {1, 9, 0},
+	.version		= {1, 8, 0},
 	.module			= THIS_MODULE,
 	.features		= DM_TARGET_SINGLETON | DM_TARGET_INTEGRITY,
 	.ctr			= dm_integrity_ctr,

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

