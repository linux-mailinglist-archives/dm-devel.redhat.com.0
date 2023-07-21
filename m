Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1869A75C832
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jul 2023 15:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689947389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8d9wODn5kqvHcOnXUkfFDcVW+UE/9QDcRff5t6Hdsds=;
	b=MpOxDqL3GjHINqpmpOHlbeFLPYbfqdj6KsZCfm8eHagFrzxKo+EJIm0JlPgyTn03YoJXXM
	E5ajVYFxGA4i2s4JNYPrIBPa9Qo9bM9uz96/mYguymLzCwWWFhO+47gYJOhA9EkDr3Bwuf
	1mrMWggi8UqFQLD+MLyM17y3tt1UnWg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-dVGHasx9OISx2G-JL_yMBA-1; Fri, 21 Jul 2023 09:49:47 -0400
X-MC-Unique: dVGHasx9OISx2G-JL_yMBA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1BE580C4FF;
	Fri, 21 Jul 2023 13:49:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99B8F492B02;
	Fri, 21 Jul 2023 13:49:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5A64E1946A72;
	Fri, 21 Jul 2023 13:49:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1A2241946586
 for <dm-devel@listman.corp.redhat.com>; Fri, 21 Jul 2023 13:49:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9FD9C5796A; Fri, 21 Jul 2023 13:49:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9E98C57969;
 Fri, 21 Jul 2023 13:49:29 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id D4EE830C0457; Fri, 21 Jul 2023 13:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 D3CE73FB76; Fri, 21 Jul 2023 15:49:29 +0200 (CEST)
Date: Fri, 21 Jul 2023 15:49:29 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <7d99fa-9c13-ab2a-acde-1f8bbc63bf3@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH v2 1/3] brd: extend the rcu regions to cover read
 and write
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-block@vger.kernel.org, Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, Li Nan <linan666@huaweicloud.com>,
 dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch extends the rcu regions, so that lookup followed by a read or
write of a page is done inside rcu read lock. This is needed for the
following patch that enables discard.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/block/brd.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: linux-2.6/drivers/block/brd.c
===================================================================
--- linux-2.6.orig/drivers/block/brd.c
+++ linux-2.6/drivers/block/brd.c
@@ -150,23 +150,27 @@ static void copy_to_brd(struct brd_devic
 	size_t copy;
 
 	copy = min_t(size_t, n, PAGE_SIZE - offset);
+	rcu_read_lock();
 	page = brd_lookup_page(brd, sector);
 	BUG_ON(!page);
 
 	dst = kmap_atomic(page);
 	memcpy(dst + offset, src, copy);
 	kunmap_atomic(dst);
+	rcu_read_unlock();
 
 	if (copy < n) {
 		src += copy;
 		sector += copy >> SECTOR_SHIFT;
 		copy = n - copy;
+		rcu_read_lock();
 		page = brd_lookup_page(brd, sector);
 		BUG_ON(!page);
 
 		dst = kmap_atomic(page);
 		memcpy(dst, src, copy);
 		kunmap_atomic(dst);
+		rcu_read_unlock();
 	}
 }
 
@@ -182,6 +186,7 @@ static void copy_from_brd(void *dst, str
 	size_t copy;
 
 	copy = min_t(size_t, n, PAGE_SIZE - offset);
+	rcu_read_lock();
 	page = brd_lookup_page(brd, sector);
 	if (page) {
 		src = kmap_atomic(page);
@@ -189,11 +194,13 @@ static void copy_from_brd(void *dst, str
 		kunmap_atomic(src);
 	} else
 		memset(dst, 0, copy);
+	rcu_read_unlock();
 
 	if (copy < n) {
 		dst += copy;
 		sector += copy >> SECTOR_SHIFT;
 		copy = n - copy;
+		rcu_read_lock();
 		page = brd_lookup_page(brd, sector);
 		if (page) {
 			src = kmap_atomic(page);
@@ -201,6 +208,7 @@ static void copy_from_brd(void *dst, str
 			kunmap_atomic(src);
 		} else
 			memset(dst, 0, copy);
+		rcu_read_unlock();
 	}
 }
 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

