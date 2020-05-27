Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D41A01E3845
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 07:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590557603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tQoZej9LJfp3sYles5d3x0L1mBlrzEbNPObKiSpPqeE=;
	b=RFO1UTCOxJsz4wZYjCYGyd5+8DuaWHMO2ZzfOf7KJHsDfwhDdZtkj+V7x6bZcMDx3/w5Pt
	y5dyuG4fmK3B3jzx1MZfE8LPmUhpXJH+rGWKfs89hnuYPu8NrF32DquzWcKbZG04+QRVhW
	rG0UtFzYCTc/imJK8vkZ3i5siK6lSCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-QBLC3cEkOXen5WpyrKbDjQ-1; Wed, 27 May 2020 01:33:20 -0400
X-MC-Unique: QBLC3cEkOXen5WpyrKbDjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E960464;
	Wed, 27 May 2020 05:33:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19C4A5D9E7;
	Wed, 27 May 2020 05:33:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC95E1809547;
	Wed, 27 May 2020 05:33:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R5XCiT012169 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 01:33:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 187EFAB580; Wed, 27 May 2020 05:33:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14ED0951D7
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:33:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF7C1828822
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:33:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-305-TCoq8yLMNb-0PJS5d9m8lA-1; Wed, 27 May 2020 01:33:09 -0400
X-MC-Unique: TCoq8yLMNb-0PJS5d9m8lA-1
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoYQ-0000oi-QS; Wed, 27 May 2020 05:24:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:09 +0200
Message-Id: <20200527052419.403583-7-hch@lst.de>
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	Nitin Gupta <ngupta@vflare.org>
Subject: [dm-devel] [PATCH 06/16] dm: use bio_{start,end}_io_acct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch dm to use the nicer bio accounting helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 drivers/md/dm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index f215b86664484..3f39fa1ac756e 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -681,11 +681,7 @@ static void start_io_acct(struct dm_io *io)
 	struct mapped_device *md = io->md;
 	struct bio *bio = io->orig_bio;
 
-	io->start_time = jiffies;
-
-	generic_start_io_acct(md->queue, bio_op(bio), bio_sectors(bio),
-			      &dm_disk(md)->part0);
-
+	io->start_time = bio_start_io_acct(bio);
 	if (unlikely(dm_stats_used(&md->stats)))
 		dm_stats_account_io(&md->stats, bio_data_dir(bio),
 				    bio->bi_iter.bi_sector, bio_sectors(bio),
@@ -698,8 +694,7 @@ static void end_io_acct(struct dm_io *io)
 	struct bio *bio = io->orig_bio;
 	unsigned long duration = jiffies - io->start_time;
 
-	generic_end_io_acct(md->queue, bio_op(bio), &dm_disk(md)->part0,
-			    io->start_time);
+	bio_end_io_acct(bio, io->start_time);
 
 	if (unlikely(dm_stats_used(&md->stats)))
 		dm_stats_account_io(&md->stats, bio_data_dir(bio),
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

