Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 78A8F21077D
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 11:07:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-354NZ86mMg6aI-Car7VMOw-1; Wed, 01 Jul 2020 05:06:59 -0400
X-MC-Unique: 354NZ86mMg6aI-Car7VMOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D54DF108BD0F;
	Wed,  1 Jul 2020 09:06:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B390D7C1F6;
	Wed,  1 Jul 2020 09:06:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7151D6C9C4;
	Wed,  1 Jul 2020 09:06:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06196Wg3018113 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 05:06:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DAF011796F0; Wed,  1 Jul 2020 09:06:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5D2105CDB6
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 09:06:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0CAC8EF3A4
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 09:06:31 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-211-yFY0dXf_PUCw-C6yjckgcQ-1; Wed, 01 Jul 2020 05:06:29 -0400
X-MC-Unique: yFY0dXf_PUCw-C6yjckgcQ-1
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYhG-0000hm-Tw; Wed, 01 Jul 2020 09:06:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  1 Jul 2020 11:06:20 +0200
Message-Id: <20200701090622.3354860-3-hch@lst.de>
In-Reply-To: <20200701090622.3354860-1-hch@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-mm@kvack.org,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	dm-devel@redhat.com, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH 2/4] writeback: remove {set,clear}_wb_congested
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Just merge them into their only callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/backing-dev-defs.h | 14 ++------------
 mm/backing-dev.c                 | 12 ++++++------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/include/linux/backing-dev-defs.h b/include/linux/backing-dev-defs.h
index 90a7e844a098f3..cc5aa1f32b91f0 100644
--- a/include/linux/backing-dev-defs.h
+++ b/include/linux/backing-dev-defs.h
@@ -232,18 +232,8 @@ enum {
 	BLK_RW_SYNC	= 1,
 };
 
-void clear_wb_congested(struct bdi_writeback_congested *congested, int sync);
-void set_wb_congested(struct bdi_writeback_congested *congested, int sync);
-
-static inline void clear_bdi_congested(struct backing_dev_info *bdi, int sync)
-{
-	clear_wb_congested(bdi->wb.congested, sync);
-}
-
-static inline void set_bdi_congested(struct backing_dev_info *bdi, int sync)
-{
-	set_wb_congested(bdi->wb.congested, sync);
-}
+void clear_bdi_congested(struct backing_dev_info *bdi, int sync);
+void set_bdi_congested(struct backing_dev_info *bdi, int sync);
 
 struct wb_lock_cookie {
 	bool locked;
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index d382272bcc3100..3ebe5144a102f2 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1047,29 +1047,29 @@ static wait_queue_head_t congestion_wqh[2] = {
 	};
 static atomic_t nr_wb_congested[2];
 
-void clear_wb_congested(struct bdi_writeback_congested *congested, int sync)
+void clear_bdi_congested(struct backing_dev_info *bdi, int sync)
 {
 	wait_queue_head_t *wqh = &congestion_wqh[sync];
 	enum wb_congested_state bit;
 
 	bit = sync ? WB_sync_congested : WB_async_congested;
-	if (test_and_clear_bit(bit, &congested->state))
+	if (test_and_clear_bit(bit, &bdi->wb.congested->state))
 		atomic_dec(&nr_wb_congested[sync]);
 	smp_mb__after_atomic();
 	if (waitqueue_active(wqh))
 		wake_up(wqh);
 }
-EXPORT_SYMBOL(clear_wb_congested);
+EXPORT_SYMBOL(clear_bdi_congested);
 
-void set_wb_congested(struct bdi_writeback_congested *congested, int sync)
+void set_bdi_congested(struct backing_dev_info *bdi, int sync)
 {
 	enum wb_congested_state bit;
 
 	bit = sync ? WB_sync_congested : WB_async_congested;
-	if (!test_and_set_bit(bit, &congested->state))
+	if (!test_and_set_bit(bit, &bdi->wb.congested->state))
 		atomic_inc(&nr_wb_congested[sync]);
 }
-EXPORT_SYMBOL(set_wb_congested);
+EXPORT_SYMBOL(set_bdi_congested);
 
 /**
  * congestion_wait - wait for a backing_dev to become uncongested
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

