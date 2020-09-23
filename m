Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 892122761A9
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 22:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600891657;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XNwICGgF6So4MQIRFSOS7C8ooePcseBh1Z1YEOlsPkM=;
	b=W3AyYRvY5TXYdiscliaSy5ep9u4y/VlFqt6FYlJdmIoqL/wZzPEivkqaz/2GA/YPc8eJRF
	b1wWO5AN0KV2ODcQExGQpAp/tDi5dvjJRdFCsDQ5/8U0a+UsLjV83+lPDhWgnJLsPkvzIx
	4xfmzf9QH4JKJNNITUw/T4oeboMJaT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-aelOtQ3ZNBW1jAt3OOJfoQ-1; Wed, 23 Sep 2020 16:07:33 -0400
X-MC-Unique: aelOtQ3ZNBW1jAt3OOJfoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 837F210082EB;
	Wed, 23 Sep 2020 20:07:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CAE873682;
	Wed, 23 Sep 2020 20:07:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 141E6183D040;
	Wed, 23 Sep 2020 20:07:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NK6x0W027857 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 16:06:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EEF80108BCE; Wed, 23 Sep 2020 20:06:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA37910769D
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 20:06:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1F9C101A570
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 20:06:58 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-570-vUkw2jx7NPWkW9Xm788kEA-1; Wed, 23 Sep 2020 16:06:55 -0400
X-MC-Unique: vUkw2jx7NPWkW9Xm788kEA-1
Received: by mail-qt1-f193.google.com with SMTP id a4so1054835qth.0
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 13:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=b1GPedUmV+xHqE19AdEGe3J9hxHKj4JY/Mf9HBzo3AU=;
	b=rPTQ5ltBY/ZvIiI6WWxFvuZnH1DMbl336rZSRcgBZy+8qmyXalHC2HPz7vUC68Uolg
	U9j8QkcXi+fTBj58M/p5LCHZmoih24TNrHO6Sr3a0rs/ci1ieeNUV1h5zNAnpNA4e8AC
	eVLkLD5gjocitH0+KnIm/OMw0QLXZ9zbviz5xYHsLCxuOLdzMR3lrc51H2SQ+l70/EmD
	wx7fLt5szQT52j7LsS123bkdyqEgF7V21ZvpJpuGp0+FvDYg0udA9gx+G6qLQy3Ez9Wk
	JLjDyyEhlOaI9+JLuqe3tZUJOZP7CtYSYMQEbBqQM2XhrMgmETUk57/fMvjiuY3eLxGx
	yUZQ==
X-Gm-Message-State: AOAM530akEDdYKcSDCjG+AdQlTuuNUap0PQHdnZ0B8pnAvanHH914PZQ
	Z3ay/CXszKa3FN/WZ9tAIiY=
X-Google-Smtp-Source: ABdhPJx41LGmclf/EGpONy2i3LwRl11CPMFga4MSTkS3RvRRLQ+Bctmu411+4a3NuZUU9uiBmckN9A==
X-Received: by 2002:aed:2646:: with SMTP id z64mr1896675qtc.194.1600891615205; 
	Wed, 23 Sep 2020 13:06:55 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id a52sm620796qtc.22.2020.09.23.13.06.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Sep 2020 13:06:54 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 23 Sep 2020 16:06:51 -0400
Message-Id: <20200923200652.11082-2-snitzer@redhat.com>
In-Reply-To: <20200923200652.11082-1-snitzer@redhat.com>
References: <20200923200652.11082-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-block@vger.kernel.org, dm-devel@redhat.com, hch@lst.de
Subject: [dm-devel] [PATCH 1/2] block: add QUEUE_FLAG_NOWAIT
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add QUEUE_FLAG_NOWAIT to allow a block device to advertise support for
REQ_NOWAIT. Bio-based devices may set QUEUE_FLAG_NOWAIT where
applicable.

Update QUEUE_FLAG_MQ_DEFAULT to include QUEUE_FLAG_NOWAIT.  Also
update submit_bio_checks() to verify it is set for REQ_NOWAIT bios.

Reported-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 block/blk-core.c       | 4 ++--
 include/linux/blkdev.h | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index ca3f0f00c943..e3adfa135a20 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -817,9 +817,9 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 
 	/*
 	 * For a REQ_NOWAIT based request, return -EOPNOTSUPP
-	 * if queue is not a request based queue.
+	 * if queue does not support NOWAIT.
 	 */
-	if ((bio->bi_opf & REQ_NOWAIT) && !queue_is_mq(q))
+	if ((bio->bi_opf & REQ_NOWAIT) && !blk_queue_nowait(q))
 		goto not_supported;
 
 	if (should_fail_bio(bio))
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index be5ef6f4ba19..9723b497d435 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -618,10 +618,12 @@ struct request_queue {
 #define QUEUE_FLAG_PCI_P2PDMA	25	/* device supports PCI p2p requests */
 #define QUEUE_FLAG_ZONE_RESETALL 26	/* supports Zone Reset All */
 #define QUEUE_FLAG_RQ_ALLOC_TIME 27	/* record rq->alloc_time_ns */
-#define QUEUE_FLAG_HCTX_ACTIVE 28	/* at least one blk-mq hctx is active */
+#define QUEUE_FLAG_HCTX_ACTIVE	28	/* at least one blk-mq hctx is active */
+#define QUEUE_FLAG_NOWAIT       29	/* device supports NOWAIT */
 
 #define QUEUE_FLAG_MQ_DEFAULT	((1 << QUEUE_FLAG_IO_STAT) |		\
-				 (1 << QUEUE_FLAG_SAME_COMP))
+				 (1 << QUEUE_FLAG_SAME_COMP) |		\
+				 (1 << QUEUE_FLAG_NOWAIT))
 
 void blk_queue_flag_set(unsigned int flag, struct request_queue *q);
 void blk_queue_flag_clear(unsigned int flag, struct request_queue *q);
@@ -661,6 +663,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_pm_only(q)	atomic_read(&(q)->pm_only)
 #define blk_queue_fua(q)	test_bit(QUEUE_FLAG_FUA, &(q)->queue_flags)
 #define blk_queue_registered(q)	test_bit(QUEUE_FLAG_REGISTERED, &(q)->queue_flags)
+#define blk_queue_nowait(q)	test_bit(QUEUE_FLAG_NOWAIT, &(q)->queue_flags)
 
 extern void blk_set_pm_only(struct request_queue *q);
 extern void blk_clear_pm_only(struct request_queue *q);
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

