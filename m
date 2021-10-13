Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F132942C76A
	for <lists+dm-devel@lfdr.de>; Wed, 13 Oct 2021 19:17:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-Ig5AwIBNN9iBnTKVvL67gA-1; Wed, 13 Oct 2021 13:17:03 -0400
X-MC-Unique: Ig5AwIBNN9iBnTKVvL67gA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F1AA362FB;
	Wed, 13 Oct 2021 17:16:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E977694B7;
	Wed, 13 Oct 2021 17:16:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30AA61806D03;
	Wed, 13 Oct 2021 17:16:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DHEVAh008603 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 13:14:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B54D140D1B9D; Wed, 13 Oct 2021 17:14:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B137540D1B98
	for <dm-devel@redhat.com>; Wed, 13 Oct 2021 17:14:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A0ED800B36
	for <dm-devel@redhat.com>; Wed, 13 Oct 2021 17:14:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-212-8b-1QBrRO4SmwCO_u_HY_Q-1; Wed, 13 Oct 2021 13:14:29 -0400
X-MC-Unique: 8b-1QBrRO4SmwCO_u_HY_Q-1
Received: from [2001:4bb8:199:73c5:265:8549:750e:c7f7] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mahom-007eNn-An; Wed, 13 Oct 2021 17:13:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Oct 2021 19:12:10 +0200
Message-Id: <20211013171215.1177671-2-hch@lst.de>
In-Reply-To: <20211013171215.1177671-1-hch@lst.de>
References: <20211013171215.1177671-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 1/6] block: factor out a chunk_size_left helper
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

Factor out a helper from blk_max_size_offset so that it can be reused
independently.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/blkdev.h | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 17705c970d7e1..c6ecd996c2d46 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -622,6 +622,18 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
 	return q->limits.max_sectors;
 }
 
+/*
+ * Return how much of the chunk sectors is left to be used for an I/O at the
+ * given offset.
+ */
+static inline unsigned int blk_chunk_sectors_left(sector_t offset,
+		unsigned int chunk_sectors)
+{
+	if (unlikely(!is_power_of_2(chunk_sectors)))
+		return chunk_sectors - sector_div(offset, chunk_sectors);
+	return chunk_sectors - (offset & (chunk_sectors - 1));
+}
+
 /*
  * Return maximum size of a request at given offset. Only valid for
  * file system requests.
@@ -637,12 +649,8 @@ static inline unsigned int blk_max_size_offset(struct request_queue *q,
 			return q->limits.max_sectors;
 	}
 
-	if (likely(is_power_of_2(chunk_sectors)))
-		chunk_sectors -= offset & (chunk_sectors - 1);
-	else
-		chunk_sectors -= sector_div(offset, chunk_sectors);
-
-	return min(q->limits.max_sectors, chunk_sectors);
+	return min(q->limits.max_sectors,
+			blk_chunk_sectors_left(offset, chunk_sectors));
 }
 
 /*
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

