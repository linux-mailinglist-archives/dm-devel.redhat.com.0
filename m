Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD46B0A90
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 10:46:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FECD59465;
	Thu, 12 Sep 2019 08:46:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FFF5600C4;
	Thu, 12 Sep 2019 08:46:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8E4425540;
	Thu, 12 Sep 2019 08:46:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8C8jtd7027297 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 04:45:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F31073DED; Thu, 12 Sep 2019 08:45:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 071E2194B9;
	Thu, 12 Sep 2019 08:45:52 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1i8Kjd-00035V-Ir; Thu, 12 Sep 2019 10:45:50 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Thu, 12 Sep 2019 10:45:45 +0200
Message-Id: <20190912084545.276409400@debian-a64.vm>
User-Agent: quilt/0.65
Date: Thu, 12 Sep 2019 10:44:44 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Martijn Coenen <maco@android.com>, Mike Snitzer <msnitzer@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline;
	filename=dm-bufio-call-adjust_total_allocated-from-__link_buffer-and-__unlink_buffer.patch
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dariofreni@google.com, jiyong@google.com, dm-devel@redhat.com,
	maco@google.com, Mikulas Patocka <mpatocka@redhat.com>,
	kernel-team@android.com
Subject: [dm-devel] [PATCH 1/5] dm-bufio: call adjust_total_allocated from
	__link_buffer and __unlink_buffer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 12 Sep 2019 08:46:30 +0000 (UTC)

Move the call to adjust_total_allocated to __link_buffer and
__unlink_buffer, so that only used buffers are counted. Reserved buffers
are not.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2019-09-10 09:35:40.000000000 +0200
+++ linux-2.6/drivers/md/dm-bufio.c	2019-09-10 16:36:06.000000000 +0200
@@ -432,8 +432,6 @@ static struct dm_buffer *alloc_buffer(st
 		return NULL;
 	}
 
-	adjust_total_allocated(b->data_mode, (long)c->block_size);
-
 #ifdef CONFIG_DM_DEBUG_BLOCK_STACK_TRACING
 	b->stack_len = 0;
 #endif
@@ -447,8 +445,6 @@ static void free_buffer(struct dm_buffer
 {
 	struct dm_bufio_client *c = b->c;
 
-	adjust_total_allocated(b->data_mode, -(long)c->block_size);
-
 	free_buffer_data(c, b->data, b->data_mode);
 	kmem_cache_free(c->slab_buffer, b);
 }
@@ -466,6 +462,8 @@ static void __link_buffer(struct dm_buff
 	list_add(&b->lru_list, &c->lru[dirty]);
 	__insert(b->c, b);
 	b->last_accessed = jiffies;
+
+	adjust_total_allocated(b->data_mode, (long)c->block_size);
 }
 
 /*
@@ -480,6 +478,8 @@ static void __unlink_buffer(struct dm_bu
 	c->n_buffers[b->list_mode]--;
 	__remove(b->c, b);
 	list_del(&b->lru_list);
+
+	adjust_total_allocated(b->data_mode, -(long)c->block_size);
 }
 
 /*

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
