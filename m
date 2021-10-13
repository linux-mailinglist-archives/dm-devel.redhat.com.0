Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CB87742C76B
	for <lists+dm-devel@lfdr.de>; Wed, 13 Oct 2021 19:17:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-lzvswIBxNn6UXfM2c7Io_w-1; Wed, 13 Oct 2021 13:17:05 -0400
X-MC-Unique: lzvswIBxNn6UXfM2c7Io_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11304362FD;
	Wed, 13 Oct 2021 17:17:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E31C670886;
	Wed, 13 Oct 2021 17:16:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DB7B4EA29;
	Wed, 13 Oct 2021 17:16:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19DHFkiT008753 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Oct 2021 13:15:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D10E12166B41; Wed, 13 Oct 2021 17:15:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB5CF2166B2F
	for <dm-devel@redhat.com>; Wed, 13 Oct 2021 17:15:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85F9718812C8
	for <dm-devel@redhat.com>; Wed, 13 Oct 2021 17:15:39 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-437-HRSV44pPOaup1FmU8185Rg-1; Wed, 13 Oct 2021 13:15:37 -0400
X-MC-Unique: HRSV44pPOaup1FmU8185Rg-1
Received: from [2001:4bb8:199:73c5:265:8549:750e:c7f7] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mahpk-007eUb-2S; Wed, 13 Oct 2021 17:14:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Oct 2021 19:12:11 +0200
Message-Id: <20211013171215.1177671-3-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 2/6] dm: open code blk_max_size_offset in
	max_io_len
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

max_io_len always passed in an explicit, non-zero chunk_sectors into
blk_max_size_offset.  That means much of blk_max_size_offset is not needed
and open coding it simplifies the code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index a011d09cb0fac..825ed9d84c9c0 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -944,24 +944,18 @@ static inline sector_t max_io_len_target_boundary(struct dm_target *ti,
 static sector_t max_io_len(struct dm_target *ti, sector_t sector)
 {
 	sector_t target_offset = dm_target_offset(ti, sector);
-	sector_t len = max_io_len_target_boundary(ti, target_offset);
-	sector_t max_len;
+	unsigned int len = max_io_len_target_boundary(ti, target_offset);
 
 	/*
 	 * Does the target need to split IO even further?
 	 * - varied (per target) IO splitting is a tenet of DM; this
 	 *   explains why stacked chunk_sectors based splitting via
-	 *   blk_max_size_offset() isn't possible here. So pass in
-	 *   ti->max_io_len to override stacked chunk_sectors.
+	 *   blk_queue_split() isn't possible here.
 	 */
-	if (ti->max_io_len) {
-		max_len = blk_max_size_offset(ti->table->md->queue,
-					      target_offset, ti->max_io_len);
-		if (len > max_len)
-			len = max_len;
-	}
-
-	return len;
+	if (!ti->max_io_len)
+		return len;
+	return min3(len, ti->table->md->queue->limits.max_sectors,
+		    blk_chunk_sectors_left(target_offset, ti->max_io_len));
 }
 
 int dm_set_target_max_io_len(struct dm_target *ti, sector_t len)
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

