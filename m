Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE835BA8CD
	for <lists+dm-devel@lfdr.de>; Fri, 16 Sep 2022 11:00:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663318815;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/CHQ8t886RvgF3BmCzQffliJgdZEXMnZtMPi2L8BsmE=;
	b=Jpzw3q799NiWAV8ovoyACCQAud0pW9WLI1ZiayK5d0BX7A9kp/b8GkU/CFYjMT/fCOcLUQ
	SAgwwVCknOxD6rSIGVf00WEWuJUOqaCGKp2ibfT0epDeFCiyCmmQ57RVbMGXX2P9eRSgOa
	CIpHIXIMAFAe9sfJf9T6BtHY1tmJREU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-aAItx7x7OFiRpQBvSqV5Yw-1; Fri, 16 Sep 2022 04:59:48 -0400
X-MC-Unique: aAItx7x7OFiRpQBvSqV5Yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E67B101CC92;
	Fri, 16 Sep 2022 08:59:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 789AA40CF8E8;
	Fri, 16 Sep 2022 08:59:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 16FBC19465A0;
	Fri, 16 Sep 2022 08:59:45 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BFB801946586
 for <dm-devel@listman.corp.redhat.com>; Fri, 16 Sep 2022 08:59:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9DC441121319; Fri, 16 Sep 2022 08:59:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C3031121314;
 Fri, 16 Sep 2022 08:59:43 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 28G8xhof000662; Fri, 16 Sep 2022 04:59:43 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 28G8xhFV000659; Fri, 16 Sep 2022 04:59:43 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Fri, 16 Sep 2022 04:59:43 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Jens Axboe <axboe@kernel.dk>, Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <alpine.LRH.2.02.2209151604410.13231@file01.intranet.prod.int.rdu2.redhat.com>
Message-ID: <alpine.LRH.2.02.2209160459250.543@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2209151604410.13231@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH 2/4] brd: extend the rcu regions to cover read
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch extends the rcu regions, so that lookup followed by a read or
write of a page is done inside rcu read lock. This si be needed for the
following patch that enables discard.

Note that we also replace "BUG_ON(!page);" with "if (page) ..." in
copy_to_brd - the page may be NULL if write races with discard. In this
situation, the result is undefined, so we can actually skip the write
operation at all.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/block/brd.c |   50 +++++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

Index: linux-2.6/drivers/block/brd.c
===================================================================
--- linux-2.6.orig/drivers/block/brd.c
+++ linux-2.6/drivers/block/brd.c
@@ -50,29 +50,15 @@ struct brd_device {
 
 /*
  * Look up and return a brd's page for a given sector.
+ * This must be called with the rcu lock held.
  */
 static struct page *brd_lookup_page(struct brd_device *brd, sector_t sector)
 {
 	pgoff_t idx;
 	struct page *page;
 
-	/*
-	 * The page lifetime is protected by the fact that we have opened the
-	 * device node -- brd pages will never be deleted under us, so we
-	 * don't need any further locking or refcounting.
-	 *
-	 * This is strictly true for the radix-tree nodes as well (ie. we
-	 * don't actually need the rcu_read_lock()), however that is not a
-	 * documented feature of the radix-tree API so it is better to be
-	 * safe here (we don't have total exclusion from radix tree updates
-	 * here, only deletes).
-	 */
-	rcu_read_lock();
 	idx = sector >> PAGE_SECTORS_SHIFT; /* sector to page index */
 	page = radix_tree_lookup(&brd->brd_pages, idx);
-	rcu_read_unlock();
-
-	BUG_ON(page && page->index != idx);
 
 	return page;
 }
@@ -88,7 +74,9 @@ static bool brd_insert_page(struct brd_d
 	struct page *page;
 	gfp_t gfp_flags;
 
+	rcu_read_lock();
 	page = brd_lookup_page(brd, sector);
+	rcu_read_unlock();
 	if (page)
 		return true;
 
@@ -198,23 +186,29 @@ static void copy_to_brd(struct brd_devic
 	size_t copy;
 
 	copy = min_t(size_t, n, PAGE_SIZE - offset);
-	page = brd_lookup_page(brd, sector);
-	BUG_ON(!page);
 
-	dst = kmap_atomic(page);
-	memcpy(dst + offset, src, copy);
-	kunmap_atomic(dst);
+	rcu_read_lock();
+	page = brd_lookup_page(brd, sector);
+	if (page) {
+		dst = kmap_atomic(page);
+		memcpy(dst + offset, src, copy);
+		kunmap_atomic(dst);
+	}
+	rcu_read_unlock();
 
 	if (copy < n) {
 		src += copy;
 		sector += copy >> SECTOR_SHIFT;
 		copy = n - copy;
-		page = brd_lookup_page(brd, sector);
-		BUG_ON(!page);
 
-		dst = kmap_atomic(page);
-		memcpy(dst, src, copy);
-		kunmap_atomic(dst);
+		rcu_read_lock();
+		page = brd_lookup_page(brd, sector);
+		if (page) {
+			dst = kmap_atomic(page);
+			memcpy(dst, src, copy);
+			kunmap_atomic(dst);
+		}
+		rcu_read_unlock();
 	}
 }
 
@@ -230,6 +224,8 @@ static void copy_from_brd(void *dst, str
 	size_t copy;
 
 	copy = min_t(size_t, n, PAGE_SIZE - offset);
+
+	rcu_read_lock();
 	page = brd_lookup_page(brd, sector);
 	if (page) {
 		src = kmap_atomic(page);
@@ -237,11 +233,14 @@ static void copy_from_brd(void *dst, str
 		kunmap_atomic(src);
 	} else
 		memset(dst, 0, copy);
+	rcu_read_unlock();
 
 	if (copy < n) {
 		dst += copy;
 		sector += copy >> SECTOR_SHIFT;
 		copy = n - copy;
+
+		rcu_read_lock();
 		page = brd_lookup_page(brd, sector);
 		if (page) {
 			src = kmap_atomic(page);
@@ -249,6 +248,7 @@ static void copy_from_brd(void *dst, str
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

