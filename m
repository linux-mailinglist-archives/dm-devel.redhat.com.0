Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F9477756C
	for <lists+dm-devel@lfdr.de>; Thu, 10 Aug 2023 12:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691662127;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z2a/NVbURatZzjQLlx5PHuTaVTqs3VlKc/ShrKSXEjg=;
	b=gcduIM7BjmTACms8DoHvAvWUi5kDQqHv/OAjhsx/HPyRUDZFrMONeA4mnghguvYhv4afW5
	ruVuuuqPeNvow8GFjsF9yNspMnBy4ycuaUTGx9lEd1VhvPfPgEKvlEy/eKclVYlE7PuKmQ
	anScGORHBhfqd7aTDQ8uQcvnwbwhV7s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-loA5Yr_dNN-hZcNu53z49g-1; Thu, 10 Aug 2023 06:08:44 -0400
X-MC-Unique: loA5Yr_dNN-hZcNu53z49g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD0DC101B42B;
	Thu, 10 Aug 2023 10:08:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 404D840BC71C;
	Thu, 10 Aug 2023 10:08:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8449C19465A4;
	Thu, 10 Aug 2023 10:08:41 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F09781946588
 for <dm-devel@listman.corp.redhat.com>; Thu, 10 Aug 2023 10:08:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BEE3E40C6F53; Thu, 10 Aug 2023 10:08:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B020940C6F4E;
 Thu, 10 Aug 2023 10:08:40 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id C53AC30B9C07; Thu, 10 Aug 2023 10:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 BABF33F7CF; Thu, 10 Aug 2023 12:08:39 +0200 (CEST)
Date: Thu, 10 Aug 2023 12:08:39 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2dacc73-854-e71c-1746-99b017401c9a@redhat.com>
Message-ID: <ee59ce87-9e5-c725-8040-80c5e0fd48f@redhat.com>
References: <2dacc73-854-e71c-1746-99b017401c9a@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH v3 1/4] brd: use a switch statement in
 brd_submit_bio
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
Cc: linux-block@vger.kernel.org, Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Li Nan <linan666@huaweicloud.com>,
 dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use a switch statement in brd_submit_bio, so that the code will look
better when we add support for more bio operations.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/block/brd.c |   43 ++++++++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

Index: linux-2.6/drivers/block/brd.c
===================================================================
--- linux-2.6.orig/drivers/block/brd.c
+++ linux-2.6/drivers/block/brd.c
@@ -243,29 +243,38 @@ out:
 static void brd_submit_bio(struct bio *bio)
 {
 	struct brd_device *brd = bio->bi_bdev->bd_disk->private_data;
-	sector_t sector = bio->bi_iter.bi_sector;
+	sector_t sector;
 	struct bio_vec bvec;
 	struct bvec_iter iter;
 
-	bio_for_each_segment(bvec, bio, iter) {
-		unsigned int len = bvec.bv_len;
-		int err;
+	switch (bio_op(bio)) {
+		case REQ_OP_READ:
+		case REQ_OP_WRITE:
+			sector = bio->bi_iter.bi_sector;
+			bio_for_each_segment(bvec, bio, iter) {
+				unsigned int len = bvec.bv_len;
+				int err;
 
-		/* Don't support un-aligned buffer */
-		WARN_ON_ONCE((bvec.bv_offset & (SECTOR_SIZE - 1)) ||
-				(len & (SECTOR_SIZE - 1)));
+				/* Don't support un-aligned buffer */
+				WARN_ON_ONCE((bvec.bv_offset & (SECTOR_SIZE - 1)) ||
+						(len & (SECTOR_SIZE - 1)));
 
-		err = brd_do_bvec(brd, bvec.bv_page, len, bvec.bv_offset,
-				  bio->bi_opf, sector);
-		if (err) {
-			if (err == -ENOMEM && bio->bi_opf & REQ_NOWAIT) {
-				bio_wouldblock_error(bio);
-				return;
+				err = brd_do_bvec(brd, bvec.bv_page, len, bvec.bv_offset,
+						  bio->bi_opf, sector);
+				if (err) {
+					if (err == -ENOMEM && bio->bi_opf & REQ_NOWAIT) {
+						bio_wouldblock_error(bio);
+						return;
+					}
+					bio_io_error(bio);
+					return;
+				}
+				sector += len >> SECTOR_SHIFT;
 			}
-			bio_io_error(bio);
-			return;
-		}
-		sector += len >> SECTOR_SHIFT;
+			break;
+		default:
+			bio->bi_status = BLK_STS_NOTSUPP;
+			break;
 	}
 
 	bio_endio(bio);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

