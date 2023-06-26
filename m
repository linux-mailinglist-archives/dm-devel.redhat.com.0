Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6551173E267
	for <lists+dm-devel@lfdr.de>; Mon, 26 Jun 2023 16:47:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687790878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0PmVWy00Vd1YRM6j2zNlxWoV4PjUelX/FAkbL/bBtvQ=;
	b=i0o9WsxU7srrEnuz+AJVFGDD/+auSgukex52SrEFek7H4Bbk3qrpmh5eXnAFtQIk4j4zsG
	oH9Gizf1nM+ee77pQg3ET9MPryYoy9k3r1cpB7g2fit41x9O4IID8P3hOdZo562qxdWzoZ
	yXSv5rF4SdYBjas5zp20QmOrEvI3QEg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-9Qsc_SmpNaujyyi5qQJgbQ-1; Mon, 26 Jun 2023 10:47:56 -0400
X-MC-Unique: 9Qsc_SmpNaujyyi5qQJgbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4069B858290;
	Mon, 26 Jun 2023 14:47:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8FB140C2071;
	Mon, 26 Jun 2023 14:47:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7DB4E1946A6A;
	Mon, 26 Jun 2023 14:47:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D317B1946587
 for <dm-devel@listman.corp.redhat.com>; Mon, 26 Jun 2023 14:47:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B001840BB4D; Mon, 26 Jun 2023 14:47:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A68D6401061;
 Mon, 26 Jun 2023 14:47:19 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id 7315A30C0457; Mon, 26 Jun 2023 14:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 711CB3F7CF; Mon, 26 Jun 2023 16:46:57 +0200 (CEST)
Date: Mon, 26 Jun 2023 16:46:57 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <a8b465-6ef-2f7e-ac62-d7a92637afb2@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [dm-devel] [PATCH 3/3] dm-integrity: scale down the recalculate
 buffer if memory allocation fails
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If memory allocation fails, try to reduce the size of the recalculate
buffer and continue with the smaller buffer.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c
+++ linux-2.6/drivers/md/dm-integrity.c
@@ -2673,19 +2673,25 @@ static void integrity_recalc(struct work
 	unsigned int i;
 	int r;
 	unsigned int super_counter = 0;
+	unsigned recalc_sectors = RECALC_SECTORS;
 
-	recalc_buffer = __vmalloc(RECALC_SECTORS << SECTOR_SHIFT, GFP_NOIO);
+retry:
+	recalc_buffer = __vmalloc(recalc_sectors << SECTOR_SHIFT, GFP_NOIO);
 	if (!recalc_buffer) {
+oom:
+		recalc_sectors >>= 1;
+		if (recalc_sectors >= 1U << ic->sb->log2_sectors_per_block)
+			goto retry;
 		DMCRIT("out of memory for recalculate buffer - recalculation disabled");
 		goto free_ret;
 	}
-	recalc_tags_size = (RECALC_SECTORS >> ic->sb->log2_sectors_per_block) * ic->tag_size;
+	recalc_tags_size = (recalc_sectors >> ic->sb->log2_sectors_per_block) * ic->tag_size;
 	if (crypto_shash_digestsize(ic->internal_hash) > ic->tag_size)
 		recalc_tags_size += crypto_shash_digestsize(ic->internal_hash) - ic->tag_size;
 	recalc_tags = kvmalloc(recalc_tags_size, GFP_NOIO);
 	if (!recalc_tags) {
-		DMCRIT("out of memory for recalculate buffer - recalculation disabled");
-		goto free_ret;
+		vfree(recalc_buffer);
+		goto oom;
 	}
 
 	DEBUG_print("start recalculation... (position %llx)\n", le64_to_cpu(ic->sb->recalc_sector));
@@ -2708,7 +2714,7 @@ next_chunk:
 	}
 
 	get_area_and_offset(ic, range.logical_sector, &area, &offset);
-	range.n_sectors = min((sector_t)RECALC_SECTORS, ic->provided_data_sectors - range.logical_sector);
+	range.n_sectors = min((sector_t)recalc_sectors, ic->provided_data_sectors - range.logical_sector);
 	if (!ic->meta_dev)
 		range.n_sectors = min(range.n_sectors, ((sector_t)1U << ic->sb->log2_interleave_sectors) - (unsigned int)offset);
 
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

