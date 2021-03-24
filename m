Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EB3A8347852
	for <lists+dm-devel@lfdr.de>; Wed, 24 Mar 2021 13:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616588540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zMxll5BfnZjaq8QVu/mkaXq0RAiSbwtwMX8CrzlHFg8=;
	b=fjmGD4s0mwVIpKrl+2hS+cs7+5BQaeM8mIVYqh3xht/ovsVOFol47BPalzMw+kd+PC745F
	IML3pCikSZ9y05z5dQguYNnfDK64y6MswWaDbnexThHvPJfKQxe5y3uwHLOxPyaNWqjMLQ
	OHN+QoAJE2B2LfkkfEBcJe0tvVN+xmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-8SS_YQjrMwi22KcAOVEMYA-1; Wed, 24 Mar 2021 08:22:16 -0400
X-MC-Unique: 8SS_YQjrMwi22KcAOVEMYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75D307FF36;
	Wed, 24 Mar 2021 12:21:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FD0F5C3E9;
	Wed, 24 Mar 2021 12:21:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AE411809C83;
	Wed, 24 Mar 2021 12:21:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12OCLYna005442 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 08:21:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C0967A38C; Wed, 24 Mar 2021 12:21:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-13-127.pek2.redhat.com [10.72.13.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 577436A90C;
	Wed, 24 Mar 2021 12:20:58 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 24 Mar 2021 20:19:22 +0800
Message-Id: <20210324121927.362525-9-ming.lei@redhat.com>
In-Reply-To: <20210324121927.362525-1-ming.lei@redhat.com>
References: <20210324121927.362525-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH V3 08/13] block: prepare for supporting bio_list
	via other link
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

So far bio list helpers always use .bi_next to traverse the list, we
will support to link bios by other bio field.

Prepare for such support by adding a macro so that users can define
another helpers for linking bios by other bio field.

Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 include/linux/bio.h | 132 +++++++++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 64 deletions(-)

diff --git a/include/linux/bio.h b/include/linux/bio.h
index d0246c92a6e8..619edd26a6c0 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -608,75 +608,11 @@ static inline unsigned bio_list_size(const struct bio_list *bl)
 	return sz;
 }
 
-static inline void bio_list_add(struct bio_list *bl, struct bio *bio)
-{
-	bio->bi_next = NULL;
-
-	if (bl->tail)
-		bl->tail->bi_next = bio;
-	else
-		bl->head = bio;
-
-	bl->tail = bio;
-}
-
-static inline void bio_list_add_head(struct bio_list *bl, struct bio *bio)
-{
-	bio->bi_next = bl->head;
-
-	bl->head = bio;
-
-	if (!bl->tail)
-		bl->tail = bio;
-}
-
-static inline void bio_list_merge(struct bio_list *bl, struct bio_list *bl2)
-{
-	if (!bl2->head)
-		return;
-
-	if (bl->tail)
-		bl->tail->bi_next = bl2->head;
-	else
-		bl->head = bl2->head;
-
-	bl->tail = bl2->tail;
-}
-
-static inline void bio_list_merge_head(struct bio_list *bl,
-				       struct bio_list *bl2)
-{
-	if (!bl2->head)
-		return;
-
-	if (bl->head)
-		bl2->tail->bi_next = bl->head;
-	else
-		bl->tail = bl2->tail;
-
-	bl->head = bl2->head;
-}
-
 static inline struct bio *bio_list_peek(struct bio_list *bl)
 {
 	return bl->head;
 }
 
-static inline struct bio *bio_list_pop(struct bio_list *bl)
-{
-	struct bio *bio = bl->head;
-
-	if (bio) {
-		bl->head = bl->head->bi_next;
-		if (!bl->head)
-			bl->tail = NULL;
-
-		bio->bi_next = NULL;
-	}
-
-	return bio;
-}
-
 static inline struct bio *bio_list_get(struct bio_list *bl)
 {
 	struct bio *bio = bl->head;
@@ -686,6 +622,74 @@ static inline struct bio *bio_list_get(struct bio_list *bl)
 	return bio;
 }
 
+#define BIO_LIST_HELPERS(_pre, link)					\
+									\
+static inline void _pre##_add(struct bio_list *bl, struct bio *bio)	\
+{									\
+	bio->bi_##link = NULL;						\
+									\
+	if (bl->tail)							\
+		bl->tail->bi_##link = bio;				\
+	else								\
+		bl->head = bio;						\
+									\
+	bl->tail = bio;							\
+}									\
+									\
+static inline void _pre##_add_head(struct bio_list *bl, struct bio *bio) \
+{									\
+	bio->bi_##link = bl->head;					\
+									\
+	bl->head = bio;							\
+									\
+	if (!bl->tail)							\
+		bl->tail = bio;						\
+}									\
+									\
+static inline void _pre##_merge(struct bio_list *bl, struct bio_list *bl2) \
+{									\
+	if (!bl2->head)							\
+		return;							\
+									\
+	if (bl->tail)							\
+		bl->tail->bi_##link = bl2->head;			\
+	else								\
+		bl->head = bl2->head;					\
+									\
+	bl->tail = bl2->tail;						\
+}									\
+									\
+static inline void _pre##_merge_head(struct bio_list *bl,		\
+				       struct bio_list *bl2)		\
+{									\
+	if (!bl2->head)							\
+		return;							\
+									\
+	if (bl->head)							\
+		bl2->tail->bi_##link = bl->head;			\
+	else								\
+		bl->tail = bl2->tail;					\
+									\
+	bl->head = bl2->head;						\
+}									\
+									\
+static inline struct bio *_pre##_pop(struct bio_list *bl)		\
+{									\
+	struct bio *bio = bl->head;					\
+									\
+	if (bio) {							\
+		bl->head = bl->head->bi_##link;				\
+		if (!bl->head)						\
+			bl->tail = NULL;				\
+									\
+		bio->bi_##link = NULL;					\
+	}								\
+									\
+	return bio;							\
+}									\
+
+BIO_LIST_HELPERS(bio_list, next);
+
 /*
  * Increment chain count for the bio. Make sure the CHAIN flag update
  * is visible before the raised count.
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

