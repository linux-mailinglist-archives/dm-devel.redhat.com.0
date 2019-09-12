Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC16B0A91
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 10:46:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E925A3084025;
	Thu, 12 Sep 2019 08:46:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0A615D9E5;
	Thu, 12 Sep 2019 08:46:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59841180085A;
	Thu, 12 Sep 2019 08:46:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8C8jumo027302 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 04:45:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 406D2601A5; Thu, 12 Sep 2019 08:45:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6D860167;
	Thu, 12 Sep 2019 08:45:53 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1i8Kje-00035b-Rp; Thu, 12 Sep 2019 10:45:51 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Thu, 12 Sep 2019 10:45:46 +0200
Message-Id: <20190912084546.557435880@debian-a64.vm>
User-Agent: quilt/0.65
Date: Thu, 12 Sep 2019 10:44:45 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Martijn Coenen <maco@android.com>, Mike Snitzer <msnitzer@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline;
	filename=dm-bufio-refactor-adjust_total_allocated.patch
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dariofreni@google.com, jiyong@google.com, dm-devel@redhat.com,
	maco@google.com, Mikulas Patocka <mpatocka@redhat.com>,
	kernel-team@android.com
Subject: [dm-devel] [PATCH 2/5] dm-bufio: refactor adjust_total_allocated
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 12 Sep 2019 08:46:48 +0000 (UTC)

Refactor adjust_total_allocated, so that it takes a bool argument
indicating if it should add or subtract the buffer size.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2019-09-10 16:38:03.000000000 +0200
+++ linux-2.6/drivers/md/dm-bufio.c	2019-09-10 16:38:41.000000000 +0200
@@ -286,14 +286,22 @@ static void __remove(struct dm_bufio_cli
 
 /*----------------------------------------------------------------*/
 
-static void adjust_total_allocated(unsigned char data_mode, long diff)
+static void adjust_total_allocated(struct dm_buffer *b, bool unlink)
 {
+	unsigned char data_mode;
+	long diff;
+
 	static unsigned long * const class_ptr[DATA_MODE_LIMIT] = {
 		&dm_bufio_allocated_kmem_cache,
 		&dm_bufio_allocated_get_free_pages,
 		&dm_bufio_allocated_vmalloc,
 	};
 
+	data_mode = b->data_mode;
+	diff = (long)b->c->block_size;
+	if (unlink)
+		diff = -diff;
+
 	spin_lock(&param_spinlock);
 
 	*class_ptr[data_mode] += diff;
@@ -463,7 +471,7 @@ static void __link_buffer(struct dm_buff
 	__insert(b->c, b);
 	b->last_accessed = jiffies;
 
-	adjust_total_allocated(b->data_mode, (long)c->block_size);
+	adjust_total_allocated(b, false);
 }
 
 /*
@@ -479,7 +487,7 @@ static void __unlink_buffer(struct dm_bu
 	__remove(b->c, b);
 	list_del(&b->lru_list);
 
-	adjust_total_allocated(b->data_mode, -(long)c->block_size);
+	adjust_total_allocated(b, true);
 }
 
 /*

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
