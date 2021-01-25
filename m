Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD0F13038B3
	for <lists+dm-devel@lfdr.de>; Tue, 26 Jan 2021 10:10:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-nHFgyiSdNjqoZd54YV-Mwg-1; Tue, 26 Jan 2021 04:10:32 -0500
X-MC-Unique: nHFgyiSdNjqoZd54YV-Mwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94D09107ACE3;
	Tue, 26 Jan 2021 09:10:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB54D7216C;
	Tue, 26 Jan 2021 09:10:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 893284BB40;
	Tue, 26 Jan 2021 09:10:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PCDrMc021880 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 07:13:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22ADD1111A5B; Mon, 25 Jan 2021 12:13:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DD2A111D7B7
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 12:13:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAA1E811E78
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 12:13:50 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
	(out30-132.freemail.mail.aliyun.com [115.124.30.132]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-378-bhE78NbROwmYzf4ugDogkg-1;
	Mon, 25 Jan 2021 07:13:45 -0500
X-MC-Unique: bhE78NbROwmYzf4ugDogkg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R311e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UMqjSkp_1611576821
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UMqjSkp_1611576821) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 25 Jan 2021 20:13:41 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com
Date: Mon, 25 Jan 2021 20:13:36 +0800
Message-Id: <20210125121340.70459-3-jefflexu@linux.alibaba.com>
In-Reply-To: <20210125121340.70459-1-jefflexu@linux.alibaba.com>
References: <20210125121340.70459-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 26 Jan 2021 04:10:04 -0500
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: [dm-devel] [PATCH v2 2/6] block: add queue_to_disk() to get gendisk
	from request_queue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Review-by: Mike Snitzer <snitzer@redhat.com>
---
 include/linux/blkdev.h       | 2 ++
 include/trace/events/kyber.h | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index f94ee3089e01..2a802e011a95 100644
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
https://www.redhat.com/mailman/listinfo/dm-devel

