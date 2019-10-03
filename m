Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4DBCA511
	for <lists+dm-devel@lfdr.de>; Thu,  3 Oct 2019 18:34:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2824499C43;
	Thu,  3 Oct 2019 16:34:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 180215C22F;
	Thu,  3 Oct 2019 16:34:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD7961808878;
	Thu,  3 Oct 2019 16:34:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x93GYR9P029587 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Oct 2019 12:34:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B039608A5; Thu,  3 Oct 2019 16:34:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0732E608C2;
	Thu,  3 Oct 2019 16:34:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61EA230860C5;
	Thu,  3 Oct 2019 16:34:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6714B20830;
	Thu,  3 Oct 2019 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570120456;
	bh=VvGjkM71cReN6WoRHeK5WYV1LuRx+NhLHQO/EKPu3xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xk6HIYlwR9YgUwZ1l41VgLnRMUW0necqFEJYuXsMcYosDnHU99b+8m27U74Ym0fdW
	L++bQ/wXgFzrikhKwNl5Y9+fj4wx7a74TtdjGX2chaLDOVRMxYbnob5uCu5zTlGlAO
	JyzCLW1HbamN7ZktPqrkiCf6fNF6CmDTqzzP1qJg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Thu,  3 Oct 2019 17:53:27 +0200
Message-Id: <20191003154555.556015268@linuxfoundation.org>
In-Reply-To: <20191003154533.590915454@linuxfoundation.org>
References: <20191003154533.590915454@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 03 Oct 2019 16:34:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Thu, 03 Oct 2019 16:34:17 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'gregkh@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -5.001  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
	Hannes Reinecke <hare@suse.com>, Bart Van Assche <bvanassche@acm.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Ewan D. Milne" <emilne@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, dm-devel@redhat.com,
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [PATCH 5.2 229/313] blk-mq: add callback of .cleanup_rq
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 03 Oct 2019 16:34:40 +0000 (UTC)

From: Ming Lei <ming.lei@redhat.com>

[ Upstream commit 226b4fc75c78f9c497c5182d939101b260cfb9f3 ]

SCSI maintains its own driver private data hooked off of each SCSI
request, and the pridate data won't be freed after scsi_queue_rq()
returns BLK_STS_RESOURCE or BLK_STS_DEV_RESOURCE. An upper layer driver
(e.g. dm-rq) may need to retry these SCSI requests, before SCSI has
fully dispatched them, due to a lower level SCSI driver's resource
limitation identified in scsi_queue_rq(). Currently SCSI's per-request
private data is leaked when the upper layer driver (dm-rq) frees and
then retries these requests in response to BLK_STS_RESOURCE or
BLK_STS_DEV_RESOURCE returns from scsi_queue_rq().

This usecase is so specialized that it doesn't warrant training an
existing blk-mq interface (e.g. blk_mq_free_request) to allow SCSI to
account for freeing its driver private data -- doing so would add an
extra branch for handling a special case that all other consumers of
SCSI (and blk-mq) won't ever need to worry about.

So the most pragmatic way forward is to delegate freeing SCSI driver
private data to the upper layer driver (dm-rq).  Do so by adding
new .cleanup_rq callback and calling a new blk_mq_cleanup_rq() method
from dm-rq.  A following commit will implement the .cleanup_rq() hook
in scsi_mq_ops.

Cc: Ewan D. Milne <emilne@redhat.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Hannes Reinecke <hare@suse.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Mike Snitzer <snitzer@redhat.com>
Cc: dm-devel@redhat.com
Cc: <stable@vger.kernel.org>
Fixes: 396eaf21ee17 ("blk-mq: improve DM's blk-mq IO merging via blk_insert_cloned_request feedback")
Signed-off-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-rq.c     |  1 +
 include/linux/blk-mq.h | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 5f7063f05ae07..b41ecb451c784 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -408,6 +408,7 @@ static int map_request(struct dm_rq_target_io *tio)
 		ret = dm_dispatch_clone_request(clone, rq);
 		if (ret == BLK_STS_RESOURCE || ret == BLK_STS_DEV_RESOURCE) {
 			blk_rq_unprep_clone(clone);
+			blk_mq_cleanup_rq(clone);
 			tio->ti->type->release_clone_rq(clone, &tio->info);
 			tio->clone = NULL;
 			return DM_MAPIO_REQUEUE;
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 15d1aa53d96c4..a5a99b43f68e8 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -140,6 +140,7 @@ typedef int (poll_fn)(struct blk_mq_hw_ctx *);
 typedef int (map_queues_fn)(struct blk_mq_tag_set *set);
 typedef bool (busy_fn)(struct request_queue *);
 typedef void (complete_fn)(struct request *);
+typedef void (cleanup_rq_fn)(struct request *);
 
 
 struct blk_mq_ops {
@@ -200,6 +201,12 @@ struct blk_mq_ops {
 	/* Called from inside blk_get_request() */
 	void (*initialize_rq_fn)(struct request *rq);
 
+	/*
+	 * Called before freeing one request which isn't completed yet,
+	 * and usually for freeing the driver private data
+	 */
+	cleanup_rq_fn		*cleanup_rq;
+
 	/*
 	 * If set, returns whether or not this queue currently is busy
 	 */
@@ -366,4 +373,10 @@ static inline blk_qc_t request_to_qc_t(struct blk_mq_hw_ctx *hctx,
 			BLK_QC_T_INTERNAL;
 }
 
+static inline void blk_mq_cleanup_rq(struct request *rq)
+{
+	if (rq->q->mq_ops->cleanup_rq)
+		rq->q->mq_ops->cleanup_rq(rq);
+}
+
 #endif
-- 
2.20.1



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
