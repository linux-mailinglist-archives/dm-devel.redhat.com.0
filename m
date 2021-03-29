Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB4534D3C6
	for <lists+dm-devel@lfdr.de>; Mon, 29 Mar 2021 17:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617031679;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mirgJqIbPFX+53RwTQq89Siuhfn9m76Zffmktu6KSuU=;
	b=MqNd1Y1dOQIlPypRNutG7muEDozmLDkaPsbrF99ovUpl1fQcq8+jU6LH3nKeVoXHPHRY3g
	ja9znBueOZ7RTSUFHozAdNGSLwxL0Ro76kh2Sssdgp85bTC0p11Of5yYuJcnhCE4L5OzSl
	jJ78pOd1KCUKnjaCWjmOw/V0PjaB/zE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-EVJ0ZGdHOSezvnGiylwXCA-1; Mon, 29 Mar 2021 11:27:56 -0400
X-MC-Unique: EVJ0ZGdHOSezvnGiylwXCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 226BB107B7C9;
	Mon, 29 Mar 2021 15:27:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB0BDBA6F;
	Mon, 29 Mar 2021 15:27:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89A364BB7C;
	Mon, 29 Mar 2021 15:27:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12TFRigB019437 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Mar 2021 11:27:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55FB218219; Mon, 29 Mar 2021 15:27:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-50.pek2.redhat.com [10.72.12.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5ADCD5C5DF;
	Mon, 29 Mar 2021 15:27:43 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 29 Mar 2021 23:26:15 +0800
Message-Id: <20210329152622.173035-6-ming.lei@redhat.com>
In-Reply-To: <20210329152622.173035-1-ming.lei@redhat.com>
References: <20210329152622.173035-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: [dm-devel] [PATCH V4 05/12] block: add new field into 'struct
	bvec_iter'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a hole at the end of 'struct bvec_iter', so put a new field
here and we can save cookie returned from submit_bio() here for
supporting bio based polling.

This way can avoid to extend bio unnecessarily.

Meantime add two helpers to get/set this field.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 block/blk.h          | 10 ++++++++++
 include/linux/bvec.h |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/block/blk.h b/block/blk.h
index 35901cee709d..c1d8456656df 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -395,4 +395,14 @@ static inline void blk_create_io_poll_context(struct request_queue *q)
 		bio_poll_ctx_alloc(ioc);
 }
 
+static inline unsigned int bio_get_private_data(struct bio *bio)
+{
+	return bio->bi_iter.bi_private_data;
+}
+
+static inline void bio_set_private_data(struct bio *bio, unsigned int data)
+{
+	bio->bi_iter.bi_private_data = data;
+}
+
 #endif /* BLK_INTERNAL_H */
diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index ff832e698efb..547ad7526960 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -43,6 +43,14 @@ struct bvec_iter {
 
 	unsigned int            bi_bvec_done;	/* number of bytes completed in
 						   current bvec */
+
+	/*
+	 * There is a hole at the end of bvec_iter, add one new field to hold
+	 * something which isn't related with 'bvec_iter', so that we can
+	 * avoid extending bio. So far this new field is used for bio based
+	 * polling, we will store returning value of submit_bio() here.
+	 */
+	unsigned int		bi_private_data;
 };
 
 struct bvec_iter_all {
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

