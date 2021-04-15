Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E62BE360736
	for <lists+dm-devel@lfdr.de>; Thu, 15 Apr 2021 12:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618482861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=io+gtDzgYOFLXoFI5hPrW/QxVjsf+29yNwJStGbDlnw=;
	b=h2AhK02dH5M4pyC1O7mSLdwce4nEjcFaL9Z17gwHi+7osT4LGylRgS3MaEHAPqf0ZRp/4+
	tGD+IF6J42QtuuxGCa4xXJd3894+36GQmC5DcQqercTBO7MVoC7xkDfD4RYIcXr9jy306m
	Ghoy6xvNSA+fXoXWDatMaN4O7CnYWIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-yfzxt3VzPYWGuWl4K1auTg-1; Thu, 15 Apr 2021 06:34:18 -0400
X-MC-Unique: yfzxt3VzPYWGuWl4K1auTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F28C87A82A;
	Thu, 15 Apr 2021 10:34:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EB226064B;
	Thu, 15 Apr 2021 10:34:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17E8A1806D15;
	Thu, 15 Apr 2021 10:34:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13FAY7me032081 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 06:34:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A2745D76F; Thu, 15 Apr 2021 10:34:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-13-200.pek2.redhat.com [10.72.13.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3101262462;
	Thu, 15 Apr 2021 10:33:56 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 15 Apr 2021 18:33:09 +0800
Message-Id: <20210415103310.1513841-2-ming.lei@redhat.com>
In-Reply-To: <20210415103310.1513841-1-ming.lei@redhat.com>
References: <20210415103310.1513841-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
	Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Tejun Heo <tj@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH 1/2] percpu_ref: add
	percpu_ref_tryget_many_live
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

Prepare for support freezing bio based request queues.

Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 include/linux/percpu-refcount.h | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/include/linux/percpu-refcount.h b/include/linux/percpu-refcount.h
index 16c35a728b4c..9061c7e3113d 100644
--- a/include/linux/percpu-refcount.h
+++ b/include/linux/percpu-refcount.h
@@ -267,8 +267,9 @@ static inline bool percpu_ref_tryget(struct percpu_ref *ref)
 }
 
 /**
- * percpu_ref_tryget_live - try to increment a live percpu refcount
+ * percpu_ref_tryget_many_live - try to increment a live percpu refcount
  * @ref: percpu_ref to try-get
+ * @nr: number of references to get
  *
  * Increment a percpu refcount unless it has already been killed.  Returns
  * %true on success; %false on failure.
@@ -281,7 +282,8 @@ static inline bool percpu_ref_tryget(struct percpu_ref *ref)
  *
  * This function is safe to call as long as @ref is between init and exit.
  */
-static inline bool percpu_ref_tryget_live(struct percpu_ref *ref)
+static inline bool percpu_ref_tryget_many_live(struct percpu_ref *ref,
+					       unsigned long nr)
 {
 	unsigned long __percpu *percpu_count;
 	bool ret = false;
@@ -289,10 +291,10 @@ static inline bool percpu_ref_tryget_live(struct percpu_ref *ref)
 	rcu_read_lock();
 
 	if (__ref_is_percpu(ref, &percpu_count)) {
-		this_cpu_inc(*percpu_count);
+		this_cpu_add(*percpu_count, nr);
 		ret = true;
 	} else if (!(ref->percpu_count_ptr & __PERCPU_REF_DEAD)) {
-		ret = atomic_long_inc_not_zero(&ref->data->count);
+		ret = atomic_long_add_unless(&ref->data->count, nr, 0);
 	}
 
 	rcu_read_unlock();
@@ -300,6 +302,26 @@ static inline bool percpu_ref_tryget_live(struct percpu_ref *ref)
 	return ret;
 }
 
+/**
+ * percpu_ref_tryget_live - try to increment a live percpu refcount
+ * @ref: percpu_ref to try-get
+ *
+ * Increment a percpu refcount unless it has already been killed.  Returns
+ * %true on success; %false on failure.
+ *
+ * Completion of percpu_ref_kill() in itself doesn't guarantee that this
+ * function will fail.  For such guarantee, percpu_ref_kill_and_confirm()
+ * should be used.  After the confirm_kill callback is invoked, it's
+ * guaranteed that no new reference will be given out by
+ * percpu_ref_tryget_live().
+ *
+ * This function is safe to call as long as @ref is between init and exit.
+ */
+static inline bool percpu_ref_tryget_live(struct percpu_ref *ref)
+{
+	return percpu_ref_tryget_many_live(ref, 1);
+}
+
 /**
  * percpu_ref_put_many - decrement a percpu refcount
  * @ref: percpu_ref to put
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

