Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 939952738A0
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 04:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600742048;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OBbHF5XhJKW0i2l7rLyOxhu6CJeNRLbzlGrTeOH2yYw=;
	b=WvZU/FmYTVl15IE5JzOdc12v5X7+udaunph1tx/LF+hhUubWPRqMSDfwLhDMmmUWKxSsBp
	JaV3W95AAak/XYFkLiBpFN9JRIRsSUsV53571VXBoZcar0eA7Bbhmxlz565IJ7hgU+eo43
	G9KFx+RSA1Ie6OEIY70Boye3NxQ88aE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-rq4EnOG8OLCFnJnBSindqw-1; Mon, 21 Sep 2020 22:33:24 -0400
X-MC-Unique: rq4EnOG8OLCFnJnBSindqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A92518B9F0A;
	Tue, 22 Sep 2020 02:33:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 424BB27BB5;
	Tue, 22 Sep 2020 02:33:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F39FD1888B4D;
	Tue, 22 Sep 2020 02:33:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M2X2b9017666 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 22:33:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76FE42157F49; Tue, 22 Sep 2020 02:33:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 721CF2157F23
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:32:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEFAD186E120
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:32:57 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-541-9FpuDhcvNG-PIrabq6ia-A-1; Mon, 21 Sep 2020 22:32:55 -0400
X-MC-Unique: 9FpuDhcvNG-PIrabq6ia-A-1
Received: by mail-qv1-f68.google.com with SMTP id cv8so8709414qvb.12;
	Mon, 21 Sep 2020 19:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=JYQbtbils7OGh5uP6Fpkr+447ZcftT0pb1EE6IEMw9o=;
	b=Uy2Hh2TVzSY/o/jPCrxFCYas/0JbYM2YxJHXLWckoVaby+JI2cpGwVsme6WTNgu9k6
	TOrkkJLJFi4mIwOZ+5SUqLZx9Nv9jnCMUdXwhZ18c06WnksU7qJ9g718zK9Gmn9mmc4u
	/7Y6NF34pmQZVFWr+MrNjqP8vQ3cquLC8QOAFMZI9xRcQiQg9bp642por2ZOJxumDk9p
	6vE5CF2E1ck99KkzY12ww2T9whHjbnjQhpBGiYJ6oJbRdDos7VWIaFPbL+ZMflY4lQiA
	YiEdem6tx1Tnhde16/3TBHDcB5IuzsbLppWNK7vJu5/B+IcPNfDJtxD+uYlP0N3gfRAJ
	wAfw==
X-Gm-Message-State: AOAM532pAoAUJTSjKFzV3bfvEn12z78lhc6paKBLSUtAYVq4kKBDQ/tU
	HClbnRcBWCtu9jAQgACk/tHUSugQUDwafw==
X-Google-Smtp-Source: ABdhPJyoXtCEfYkk40FJYctRlI58zYdrRSpqflZViwb6wpJ8jBCqLGDhFf4TjNMvg6lfMx80mAgojQ==
X-Received: by 2002:a0c:c492:: with SMTP id u18mr3606404qvi.18.1600741974844; 
	Mon, 21 Sep 2020 19:32:54 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	n1sm11622494qte.91.2020.09.21.19.32.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Sep 2020 19:32:54 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 21 Sep 2020 22:32:46 -0400
Message-Id: <20200922023251.47712-2-snitzer@redhat.com>
In-Reply-To: <20200922023251.47712-1-snitzer@redhat.com>
References: <20200922023251.47712-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v3 1/6] dm: fix bio splitting and its bio
	completion order for regular IO
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm_queue_split() is removed because __split_and_process_bio() _must_
handle splitting bios to ensure proper bio submission and completion
ordering as a bio is split.

Otherwise, multiple recursive calls to ->submit_bio will cause multiple
split bios to be allocated from the same ->bio_split mempool at the same
time. This would result in deadlock in low memory conditions because no
progress could be made (only one bio is available in ->bio_split
mempool).

This fix has been verified to still fix the loss of performance, due
to excess splitting, that commit 120c9257f5f1 provided.

Fixes: 120c9257f5f1 ("Revert "dm: always call blk_queue_split() in dm_process_bio()"")
Cc: stable@vger.kernel.org # 5.0+, requires custom backport due to 5.9 changes
Reported-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 4a40df8af7d3..d948cd522431 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1724,23 +1724,6 @@ static blk_qc_t __process_bio(struct mapped_device *md, struct dm_table *map,
 	return ret;
 }
 
-static void dm_queue_split(struct mapped_device *md, struct dm_target *ti, struct bio **bio)
-{
-	unsigned len, sector_count;
-
-	sector_count = bio_sectors(*bio);
-	len = min_t(sector_t, max_io_len((*bio)->bi_iter.bi_sector, ti), sector_count);
-
-	if (sector_count > len) {
-		struct bio *split = bio_split(*bio, len, GFP_NOIO, &md->queue->bio_split);
-
-		bio_chain(split, *bio);
-		trace_block_split(md->queue, split, (*bio)->bi_iter.bi_sector);
-		submit_bio_noacct(*bio);
-		*bio = split;
-	}
-}
-
 static blk_qc_t dm_process_bio(struct mapped_device *md,
 			       struct dm_table *map, struct bio *bio)
 {
@@ -1768,14 +1751,12 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
 	if (current->bio_list) {
 		if (is_abnormal_io(bio))
 			blk_queue_split(&bio);
-		else
-			dm_queue_split(md, ti, &bio);
+		/* regular IO is split by __split_and_process_bio */
 	}
 
 	if (dm_get_md_type(md) == DM_TYPE_NVME_BIO_BASED)
 		return __process_bio(md, map, bio, ti);
-	else
-		return __split_and_process_bio(md, map, bio);
+	return __split_and_process_bio(md, map, bio);
 }
 
 static blk_qc_t dm_submit_bio(struct bio *bio)
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

