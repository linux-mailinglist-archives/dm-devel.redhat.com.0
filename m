Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E65A6C33E4
	for <lists+dm-devel@lfdr.de>; Tue, 21 Mar 2023 15:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679408306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SMjD6iuupMqQwBjv1/tYi4W1wkHEJtfsqo4aCT0spvI=;
	b=V60dyU0PT1ZUj8Tat2y9TFGGPx7DGTuCXRX1m9Ng+tl+IU0XPf1XjK1dzw4sM7KFwCsz6o
	ktZ8ZiQAq1JJXuBX0BgUxuJcOhaLGJdkaoSTL2Y5L8LrejEzEisGQBPfWK9rdUoMDnTEzk
	YcKwPDDLsj+xmvHtQthxtQsf2QoGWQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-YgoCNrjHM-GGn53RWg0vLw-1; Tue, 21 Mar 2023 10:18:22 -0400
X-MC-Unique: YgoCNrjHM-GGn53RWg0vLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40D7180C8C4;
	Tue, 21 Mar 2023 14:18:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A96D72027144;
	Tue, 21 Mar 2023 14:18:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B8A8419465BB;
	Tue, 21 Mar 2023 14:18:11 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6228F1946594
 for <dm-devel@listman.corp.redhat.com>; Tue, 21 Mar 2023 14:18:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3FDC7483EC4; Tue, 21 Mar 2023 14:18:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24DFE463E02;
 Tue, 21 Mar 2023 14:18:10 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 32LEIAWV007609; Tue, 21 Mar 2023 10:18:10 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 32LEIACZ007605; Tue, 21 Mar 2023 10:18:10 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 21 Mar 2023 10:18:10 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Joe Thornber <thornber@redhat.com>
Message-ID: <alpine.LRH.2.21.2303211017110.7557@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [dm-devel] [PATCH] dm-bufio: use multi-page bio vector
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The kernel supports multi page bio vector entries, so we can use them in
dm-bufio as an optimization.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c |   24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c
+++ linux-2.6/drivers/md/dm-bufio.c
@@ -639,19 +639,14 @@ static void use_bio(struct dm_buffer *b,
 {
 	struct bio *bio;
 	char *ptr;
-	unsigned int vec_size, len;
+	unsigned int len;
 
-	vec_size = b->c->block_size >> PAGE_SHIFT;
-	if (unlikely(b->c->sectors_per_block_bits < PAGE_SHIFT - SECTOR_SHIFT))
-		vec_size += 2;
-
-	bio = bio_kmalloc(vec_size, GFP_NOWAIT | __GFP_NORETRY | __GFP_NOWARN);
+	bio = bio_kmalloc(1, GFP_NOWAIT | __GFP_NORETRY | __GFP_NOWARN);
 	if (!bio) {
-dmio:
 		use_dmio(b, op, sector, n_sectors, offset);
 		return;
 	}
-	bio_init(bio, b->c->bdev, bio->bi_inline_vecs, vec_size, op);
+	bio_init(bio, b->c->bdev, bio->bi_inline_vecs, 1, op);
 	bio->bi_iter.bi_sector = sector;
 	bio->bi_end_io = bio_complete;
 	bio->bi_private = b;
@@ -659,18 +654,7 @@ dmio:
 	ptr = (char *)b->data + offset;
 	len = n_sectors << SECTOR_SHIFT;
 
-	do {
-		unsigned int this_step = min((unsigned int)(PAGE_SIZE - offset_in_page(ptr)), len);
-
-		if (!bio_add_page(bio, virt_to_page(ptr), this_step,
-				  offset_in_page(ptr))) {
-			bio_put(bio);
-			goto dmio;
-		}
-
-		len -= this_step;
-		ptr += this_step;
-	} while (len > 0);
+	__bio_add_page(bio, virt_to_page(ptr), len, offset_in_page(ptr));
 
 	submit_bio(bio);
 }
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

