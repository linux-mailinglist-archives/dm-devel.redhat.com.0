Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E27CD32D586
	for <lists+dm-devel@lfdr.de>; Thu,  4 Mar 2021 15:42:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-4IvqKJMtMUWh8KmNeoXTSQ-1; Thu, 04 Mar 2021 09:42:14 -0500
X-MC-Unique: 4IvqKJMtMUWh8KmNeoXTSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4007DCC640;
	Thu,  4 Mar 2021 14:42:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18A53614EF;
	Thu,  4 Mar 2021 14:42:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C354AC596;
	Thu,  4 Mar 2021 14:42:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 123Bw4dl003395 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Mar 2021 06:58:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E6BF12167D61; Wed,  3 Mar 2021 11:58:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E18392167D63
	for <dm-devel@redhat.com>; Wed,  3 Mar 2021 11:58:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8359111B958
	for <dm-devel@redhat.com>; Wed,  3 Mar 2021 11:58:03 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-205-Ou8ic6paNGiYv2w3sdODkg-1;
	Wed, 03 Mar 2021 06:57:54 -0500
X-MC-Unique: Ou8ic6paNGiYv2w3sdODkg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
	TI=SMTPD_---0UQFn1HQ_1614772662
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UQFn1HQ_1614772662) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 03 Mar 2021 19:57:43 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: msnitzer@redhat.com, axboe@kernel.dk
Date: Wed,  3 Mar 2021 19:57:30 +0800
Message-Id: <20210303115740.127001-3-jefflexu@linux.alibaba.com>
In-Reply-To: <20210303115740.127001-1-jefflexu@linux.alibaba.com>
References: <20210303115740.127001-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
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
X-Mailman-Approved-At: Thu, 04 Mar 2021 09:41:43 -0500
Cc: caspar@linux.alibaba.com, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com,
	mpatocka@redhat.com, io-uring@vger.kernel.org
Subject: [dm-devel] [PATCH v5 02/12] block: add queue_to_disk() to get
	gendisk from request_queue
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

Sometimes we need to get the corresponding gendisk from request_queue.

It is preferred that block drivers store private data in
gendisk->private_data rather than request_queue->queuedata, e.g. see:
commit c4a59c4e5db3 ("dm: stop using ->queuedata").

So if only request_queue is given, we need to get its corresponding
gendisk to get the private data stored in that gendisk.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
Reviewed-by: Mike Snitzer <snitzer@redhat.com>
---
 include/linux/blkdev.h       | 2 ++
 include/trace/events/kyber.h | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index c032cfe133c7..b81a9fe015ab 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -687,6 +687,8 @@ static inline bool blk_account_rq(struct request *rq)
 	dma_map_page_attrs(dev, (bv)->bv_page, (bv)->bv_offset, (bv)->bv_len, \
 	(dir), (attrs))
 
+#define queue_to_disk(q)	(dev_to_disk(kobj_to_dev((q)->kobj.parent)))
+
 static inline bool queue_is_mq(struct request_queue *q)
 {
 	return q->mq_ops;
diff --git a/include/trace/events/kyber.h b/include/trace/events/kyber.h
index c0e7d24ca256..f9802562edf6 100644
--- a/include/trace/events/kyber.h
+++ b/include/trace/events/kyber.h
@@ -30,7 +30,7 @@ TRACE_EVENT(kyber_latency,
 	),
 
 	TP_fast_assign(
-		__entry->dev		= disk_devt(dev_to_disk(kobj_to_dev(q->kobj.parent)));
+		__entry->dev		= disk_devt(queue_to_disk(q));
 		strlcpy(__entry->domain, domain, sizeof(__entry->domain));
 		strlcpy(__entry->type, type, sizeof(__entry->type));
 		__entry->percentile	= percentile;
@@ -59,7 +59,7 @@ TRACE_EVENT(kyber_adjust,
 	),
 
 	TP_fast_assign(
-		__entry->dev		= disk_devt(dev_to_disk(kobj_to_dev(q->kobj.parent)));
+		__entry->dev		= disk_devt(queue_to_disk(q));
 		strlcpy(__entry->domain, domain, sizeof(__entry->domain));
 		__entry->depth		= depth;
 	),
@@ -81,7 +81,7 @@ TRACE_EVENT(kyber_throttled,
 	),
 
 	TP_fast_assign(
-		__entry->dev		= disk_devt(dev_to_disk(kobj_to_dev(q->kobj.parent)));
+		__entry->dev		= disk_devt(queue_to_disk(q));
 		strlcpy(__entry->domain, domain, sizeof(__entry->domain));
 	),
 
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

