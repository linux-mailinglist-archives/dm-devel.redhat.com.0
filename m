Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7956E50A9
	for <lists+dm-devel@lfdr.de>; Mon, 17 Apr 2023 21:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681758741;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZgQE/yqA0OHBGJc906uYLqYBS3UrN5PNWQl7gtjKAoU=;
	b=dWaqtgAFwX2s8s2+JjZcSiMLizfHy+UOEO2OAAtaB4bGyYTKd3gJuxWMCdvh5FioZA62Y7
	uTutyDiJrr908mpBpYZM9dLFLsvrKLqb36k1nED8UrinOGHu79/eOvN2y+H/yJjeg+1SYL
	vwsIrC+9YoyAYz0JSGAFJ8rapw9xpDE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-ylAJ23eYNbmPEL938SSHcA-1; Mon, 17 Apr 2023 15:12:17 -0400
X-MC-Unique: ylAJ23eYNbmPEL938SSHcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AB3985A5A3;
	Mon, 17 Apr 2023 19:12:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FF00C16028;
	Mon, 17 Apr 2023 19:12:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6392A19465A4;
	Mon, 17 Apr 2023 19:11:59 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B2D41946587
 for <dm-devel@listman.corp.redhat.com>; Mon, 17 Apr 2023 19:11:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5BAD9492B0D; Mon, 17 Apr 2023 19:11:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B7C1492B0C;
 Mon, 17 Apr 2023 19:11:58 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 33HJBwvl020263; Mon, 17 Apr 2023 15:11:58 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 33HJBvCi020259; Mon, 17 Apr 2023 15:11:57 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 17 Apr 2023 15:11:57 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <alpine.LRH.2.21.2304171433370.17217@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [dm-devel] [PATCH] block: fix a crash when bio_for_each_folio_all
 iterates over an empty bio
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
Cc: linux-block@vger.kernel.org, Mike Snitzer <msnitzer@redhat.com>,
 dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If we use bio_for_each_folio_all on an empty bio, it will access the first
bio vector unconditionally (it is uninitialized) and it may crash
depending on the uninitialized data.

This patch fixes it by checking the parameter "i" against "bio->bi_vcnt"
and returning NULL fi->folio if it is out of range.

The patch also drops the test "if (fi->_i + 1 < bio->bi_vcnt)" from
bio_next_folio because the same condition is already being checked in
bio_first_folio.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 include/linux/bio.h |   24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

Index: linux-2.6/include/linux/bio.h
===================================================================
--- linux-2.6.orig/include/linux/bio.h
+++ linux-2.6/include/linux/bio.h
@@ -279,15 +279,19 @@ struct folio_iter {
 static inline void bio_first_folio(struct folio_iter *fi, struct bio *bio,
 				   int i)
 {
-	struct bio_vec *bvec = bio_first_bvec_all(bio) + i;
+	if (i < bio->bi_vcnt) {
+		struct bio_vec *bvec = bio_first_bvec_all(bio) + i;
 
-	fi->folio = page_folio(bvec->bv_page);
-	fi->offset = bvec->bv_offset +
-			PAGE_SIZE * (bvec->bv_page - &fi->folio->page);
-	fi->_seg_count = bvec->bv_len;
-	fi->length = min(folio_size(fi->folio) - fi->offset, fi->_seg_count);
-	fi->_next = folio_next(fi->folio);
-	fi->_i = i;
+		fi->folio = page_folio(bvec->bv_page);
+		fi->offset = bvec->bv_offset +
+				PAGE_SIZE * (bvec->bv_page - &fi->folio->page);
+		fi->_seg_count = bvec->bv_len;
+		fi->length = min(folio_size(fi->folio) - fi->offset, fi->_seg_count);
+		fi->_next = folio_next(fi->folio);
+		fi->_i = i;
+	} else {
+		fi->folio = NULL;
+	}
 }
 
 static inline void bio_next_folio(struct folio_iter *fi, struct bio *bio)
@@ -298,10 +302,8 @@ static inline void bio_next_folio(struct
 		fi->offset = 0;
 		fi->length = min(folio_size(fi->folio), fi->_seg_count);
 		fi->_next = folio_next(fi->folio);
-	} else if (fi->_i + 1 < bio->bi_vcnt) {
-		bio_first_folio(fi, bio, fi->_i + 1);
 	} else {
-		fi->folio = NULL;
+		bio_first_folio(fi, bio, fi->_i + 1);
 	}
 }
 
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

