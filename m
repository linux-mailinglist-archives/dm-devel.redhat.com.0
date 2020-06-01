Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4FED21ED0B9
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 15:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591190765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v4uulS3BDtGxDPl/1NK4iDhOeYYgrgsOZya5MNfpX2g=;
	b=aUAjF9JFZVn084rl986tAz+oOuS6GYqfvAorVmsRMhsN9ArOk4iMHLi5anu6SBkMlEMx7w
	ZO6xA+HE++BWWNDwVAi492tagaJmevTz5J1wHcQRBbAuda/X4FzZgl0gCcQRNLpJs0qx2e
	rDgCflPt3dMPt8LgCqTtjoyz4S1J6SI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-bJKYPq3DM8eOtV4vtVicOQ-1; Wed, 03 Jun 2020 09:26:03 -0400
X-MC-Unique: bJKYPq3DM8eOtV4vtVicOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A27EB1005512;
	Wed,  3 Jun 2020 13:25:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2E778FA1;
	Wed,  3 Jun 2020 13:25:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B0761809543;
	Wed,  3 Jun 2020 13:25:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051CbI0O013367 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 08:37:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0282D8A4AE; Mon,  1 Jun 2020 12:37:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF5A88A4C0
	for <dm-devel@redhat.com>; Mon,  1 Jun 2020 12:37:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFE13811E77
	for <dm-devel@redhat.com>; Mon,  1 Jun 2020 12:37:15 +0000 (UTC)
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
	[95.108.205.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-234-QTL2C_pYNsqAwIxdOsgm5A-1; Mon, 01 Jun 2020 08:37:13 -0400
X-MC-Unique: QTL2C_pYNsqAwIxdOsgm5A-1
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::119])
	by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 63A412E146A;
	Mon,  1 Jun 2020 15:37:11 +0300 (MSK)
Received: from myt4-18a966dbd9be.qloud-c.yandex.net
	(myt4-18a966dbd9be.qloud-c.yandex.net
	[2a02:6b8:c00:12ad:0:640:18a9:66db])
	by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
	2BvFuUgSOx-b9fuaNjU; Mon, 01 Jun 2020 15:37:11 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
	[2a02:6b8:b080:6420::1:8])
	by myt4-18a966dbd9be.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA
	id 1wSpJbGMQA-b9Wux0gM; Mon, 01 Jun 2020 15:37:09 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-raid@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Mon, 01 Jun 2020 15:37:09 +0300
Message-ID: <159101502963.180989.6228080995222059011.stgit@buzz>
In-Reply-To: <159101473169.180989.12175693728191972447.stgit@buzz>
References: <159101473169.180989.12175693728191972447.stgit@buzz>
User-Agent: StGit/0.22-39-gd257
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 03 Jun 2020 09:25:45 -0400
Cc: Christoph Hellwig <hch@infradead.org>
Subject: [dm-devel] [PATCH RFC 1/3] block: add flag 'nowait_requests' into
	queue limits
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add flag for marking bio-based queues which support REQ_NOWAIT.
Set for all request based (mq) devices.

Stacking device should set it after blk_set_stacking_limits() if method
make_request() itself doesn't delay requests or handles REQ_NOWAIT.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 block/blk-core.c       |    4 ++--
 block/blk-mq.c         |    3 +++
 block/blk-settings.c   |    3 +++
 include/linux/blkdev.h |    1 +
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index c4b015004796..9139a316e6d4 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -892,9 +892,9 @@ generic_make_request_checks(struct bio *bio)
 
 	/*
 	 * For a REQ_NOWAIT based request, return -EOPNOTSUPP
-	 * if queue is not a request based queue.
+	 * if queue does not support this flag.
 	 */
-	if ((bio->bi_opf & REQ_NOWAIT) && !queue_is_mq(q))
+	if ((bio->bi_opf & REQ_NOWAIT) && !q->limits.nowait_requests)
 		goto not_supported;
 
 	if (should_fail_bio(bio))
diff --git a/block/blk-mq.c b/block/blk-mq.c
index a7785df2c944..0c3daa0cda87 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2952,6 +2952,9 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	 */
 	q->poll_nsec = BLK_MQ_POLL_CLASSIC;
 
+	/* Request based queue always supports REQ_NOWAIT */
+	q->limits.nowait_requests = 1;
+
 	blk_mq_init_cpu_queues(q, set->nr_hw_queues);
 	blk_mq_add_queue_tag_set(set, q);
 	blk_mq_map_swqueue(q);
diff --git a/block/blk-settings.c b/block/blk-settings.c
index 14397b4c4b53..8f96c7324497 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -59,6 +59,7 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->io_opt = 0;
 	lim->misaligned = 0;
 	lim->zoned = BLK_ZONED_NONE;
+	lim->nowait_requests = 0;
 }
 EXPORT_SYMBOL(blk_set_default_limits);
 
@@ -486,6 +487,8 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 	t->max_segment_size = min_not_zero(t->max_segment_size,
 					   b->max_segment_size);
 
+	t->nowait_requests &= b->nowait_requests;
+
 	t->misaligned |= b->misaligned;
 
 	alignment = queue_limit_alignment_offset(b, start);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 32868fbedc9e..5f612dda34c2 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -346,6 +346,7 @@ struct queue_limits {
 	unsigned char		misaligned;
 	unsigned char		discard_misaligned;
 	unsigned char		raid_partial_stripes_expensive;
+	unsigned char		nowait_requests;
 	enum blk_zoned_model	zoned;
 };
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

