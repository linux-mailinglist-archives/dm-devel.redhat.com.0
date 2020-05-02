Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5C51C2915
	for <lists+dm-devel@lfdr.de>; Sun,  3 May 2020 01:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588463769;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0dflh5aJINXInLxMTw4zEm+FKqPKygUnyVbnc6Lf/Yk=;
	b=GaphZUjm1K8wYgMvbHI1lyVFWdSDfkSzvDLNn9JPpiMKPjOram8yPoG98UmRPm7L5/oQD7
	k3/CqO6DmAmKP/nfyWghWVUHvN70YeA3pIL5BNwFEezajwumQMLf603aYigjRVNZFKVY6E
	oFnovrUQwg5WtCYFFfpQPGNQG47SPDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-KtwMGuO-PjyZRP0AAUsUmg-1; Sat, 02 May 2020 19:56:06 -0400
X-MC-Unique: KtwMGuO-PjyZRP0AAUsUmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D38107ACCA;
	Sat,  2 May 2020 23:56:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81FF76153D;
	Sat,  2 May 2020 23:55:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7357B4CAA8;
	Sat,  2 May 2020 23:55:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 042NtGFJ021173 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 2 May 2020 19:55:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B543860E1C; Sat,  2 May 2020 23:55:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-17.pek2.redhat.com [10.72.8.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B9D160BE1;
	Sat,  2 May 2020 23:55:07 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun,  3 May 2020 07:54:44 +0800
Message-Id: <20200502235454.1118520-2-ming.lei@redhat.com>
In-Reply-To: <20200502235454.1118520-1-ming.lei@redhat.com>
References: <20200502235454.1118520-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>, Bart Van Assche <bvanassche@acm.org>,
	Mike Snitzer <snitzer@redhat.com>, John Garry <john.garry@huawei.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, "Martin K . Petersen" <martin.petersen@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [PATCH V9 01/11] block: clone nr_integrity_segments and
	write_hint in blk_rq_prep_clone
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

So far blk_rq_prep_clone() is only used for setup one underlying cloned
request from dm-rq request. block intetrity can be enabled for both dm-rq
and the underlying queues, so it is reasonable to clone rq's
nr_integrity_segments. Also write_hint is from bio, it should have been
cloned too.

So clone nr_integrity_segments and write_hint in blk_rq_prep_clone.

Cc: John Garry <john.garry@huawei.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Hannes Reinecke <hare@suse.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Mike Snitzer <snitzer@redhat.com>
Cc: dm-devel@redhat.com
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/blk-core.c b/block/blk-core.c
index 7f11560bfddb..1fe73051fec3 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1630,8 +1630,12 @@ int blk_rq_prep_clone(struct request *rq, struct request *rq_src,
 		rq->rq_flags |= RQF_SPECIAL_PAYLOAD;
 		rq->special_vec = rq_src->special_vec;
 	}
+#ifdef CONFIG_BLK_DEV_INTEGRITY
+	rq->nr_integrity_segments = rq_src->nr_integrity_segments;
+#endif
 	rq->nr_phys_segments = rq_src->nr_phys_segments;
 	rq->ioprio = rq_src->ioprio;
+	rq->write_hint = rq_src->write_hint;
 
 	return 0;
 
-- 
2.25.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

