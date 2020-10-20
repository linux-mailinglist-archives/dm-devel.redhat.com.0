Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E5BD02936AF
	for <lists+dm-devel@lfdr.de>; Tue, 20 Oct 2020 10:22:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-D9p7_QSwO3WfzzrPL5cgYQ-1; Tue, 20 Oct 2020 04:22:54 -0400
X-MC-Unique: D9p7_QSwO3WfzzrPL5cgYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45B8F1087D62;
	Tue, 20 Oct 2020 08:22:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA6C46198C;
	Tue, 20 Oct 2020 08:22:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5004181A050;
	Tue, 20 Oct 2020 08:22:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09K6sUMx002596 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 02:54:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C543E110E994; Tue, 20 Oct 2020 06:54:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1377110E992
	for <dm-devel@redhat.com>; Tue, 20 Oct 2020 06:54:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3C8D800883
	for <dm-devel@redhat.com>; Tue, 20 Oct 2020 06:54:28 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-253-sixT6VW7P6S2jkvoyt0r5Q-1;
	Tue, 20 Oct 2020 02:54:25 -0400
X-MC-Unique: sixT6VW7P6S2jkvoyt0r5Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R451e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
	TI=SMTPD_---0UCd5jTl_1603176860
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UCd5jTl_1603176860) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 20 Oct 2020 14:54:21 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com, axboe@kernel.dk
Date: Tue, 20 Oct 2020 14:54:18 +0800
Message-Id: <20201020065420.124885-2-jefflexu@linux.alibaba.com>
In-Reply-To: <20201020065420.124885-1-jefflexu@linux.alibaba.com>
References: <20201020065420.124885-1-jefflexu@linux.alibaba.com>
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
X-Mailman-Approved-At: Tue, 20 Oct 2020 04:22:10 -0400
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, haoxu@linux.alibaba.com,
	xiaoguang.wang@linux.alibaba.com
Subject: [dm-devel] [RFC 1/3] block/mq: add iterator for polling hw queues
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add one helper function for iterating all hardware queues in polling
mode.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 include/linux/blk-mq.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index b23eeca4d677..81c70ce97715 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -571,6 +571,12 @@ static inline void *blk_mq_rq_to_pdu(struct request *rq)
 	for ((i) = 0; (i) < (q)->nr_hw_queues &&			\
 	     ({ hctx = (q)->queue_hw_ctx[i]; 1; }); (i)++)
 
+#define queue_for_each_poll_hw_ctx(q, hctx, i)				\
+	for ((i) = 0; ((q)->tag_set->nr_maps > HCTX_TYPE_POLL) &&	\
+	     (i) < (q)->tag_set->map[HCTX_TYPE_POLL].nr_queues &&	\
+	     ({ hctx = (q)->queue_hw_ctx[((q)->tag_set->map[HCTX_TYPE_POLL].queue_offset + (i))]; 1; }); \
+	     (i)++)
+
 #define hctx_for_each_ctx(hctx, ctx, i)					\
 	for ((i) = 0; (i) < (hctx)->nr_ctx &&				\
 	     ({ ctx = (hctx)->ctxs[(i)]; 1; }); (i)++)
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

