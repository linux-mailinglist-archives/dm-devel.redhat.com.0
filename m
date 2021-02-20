Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DDD9B321256
	for <lists+dm-devel@lfdr.de>; Mon, 22 Feb 2021 09:52:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-4QZNPXZUNl6QKr-2gfGjDw-1; Mon, 22 Feb 2021 03:52:47 -0500
X-MC-Unique: 4QZNPXZUNl6QKr-2gfGjDw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AD18107ACE6;
	Mon, 22 Feb 2021 08:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06F8472FB8;
	Mon, 22 Feb 2021 08:52:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1A7C57DFA;
	Mon, 22 Feb 2021 08:52:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11KB6rFh010462 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Feb 2021 06:06:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 36F33200ACC4; Sat, 20 Feb 2021 11:06:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31680200BFD3
	for <dm-devel@redhat.com>; Sat, 20 Feb 2021 11:06:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D40A8919BA
	for <dm-devel@redhat.com>; Sat, 20 Feb 2021 11:06:53 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-7-gsUVCL7UNUO4GGAsotE2bg-1;
	Sat, 20 Feb 2021 06:06:48 -0500
X-MC-Unique: gsUVCL7UNUO4GGAsotE2bg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
	TI=SMTPD_---0UP1BfWE_1613819203
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UP1BfWE_1613819203) by smtp.aliyun-inc.com(127.0.0.1);
	Sat, 20 Feb 2021 19:06:44 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com, axboe@kernel.dk
Date: Sat, 20 Feb 2021 19:06:31 +0800
Message-Id: <20210220110637.50305-7-jefflexu@linux.alibaba.com>
In-Reply-To: <20210220110637.50305-1-jefflexu@linux.alibaba.com>
References: <20210220110637.50305-1-jefflexu@linux.alibaba.com>
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
X-Mailman-Approved-At: Mon, 22 Feb 2021 03:49:50 -0500
Cc: caspar@linux.alibaba.com, io-uring@vger.kernel.org,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, ming.lei@redhat.com, hch@lst.de
Subject: [dm-devel] [PATCH v4 06/12] blk-mq: add iterator for polling hw
	queues
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 include/linux/blk-mq.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index cf1910c6d5ae..0c511555ec16 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -574,6 +574,13 @@ static inline void *blk_mq_rq_to_pdu(struct request *rq)
 	for ((i) = 0; (i) < (q)->nr_hw_queues &&			\
 	     ({ hctx = (q)->queue_hw_ctx[i]; 1; }); (i)++)
 
+#define queue_for_each_poll_hw_ctx(q, hctx, i)				\
+	for ((i) = 0; ((q)->tag_set->nr_maps > HCTX_TYPE_POLL) &&	\
+	     (i) < (q)->tag_set->map[HCTX_TYPE_POLL].nr_queues &&	\
+	     ({ int __idx = (q)->tag_set->map[HCTX_TYPE_POLL].queue_offset + (i); \
+	     hctx = (q)->queue_hw_ctx[__idx]; 1; }); \
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
https://listman.redhat.com/mailman/listinfo/dm-devel

