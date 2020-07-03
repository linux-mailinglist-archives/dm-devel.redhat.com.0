Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 93C34213BCC
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 16:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593786433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FSJSqU4NVxBF14iTNrfu7GpHN2DJEN1hzmfcOjMxTUY=;
	b=gDA3fIX+tqf/FZdMBWm8qlfMMIlPuHpzNNsABrZlclM8VAjezMYh7nv3cSkepV6D1dvCGd
	eiQTKUmiGaqYngf9MFZmqwcxWhPFRkWfid83nAxXKyr4/ncvi4BSvlu2J3+Ev27XKxuopa
	PU5EvnHO6f1H3aZMbZSmU4LPLqBKlJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-nAjMs8zCMK6SzvdTw8nWWA-1; Fri, 03 Jul 2020 10:27:11 -0400
X-MC-Unique: nAjMs8zCMK6SzvdTw8nWWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A062A107ACF3;
	Fri,  3 Jul 2020 14:27:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9847F6FDD1;
	Fri,  3 Jul 2020 14:27:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93A421809547;
	Fri,  3 Jul 2020 14:26:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063EQpHZ012424 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 10:26:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 041501EE; Fri,  3 Jul 2020 14:26:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3E966111F;
	Fri,  3 Jul 2020 14:26:47 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 063EQlOt023499; Fri, 3 Jul 2020 10:26:47 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 063EQkGa023495; Fri, 3 Jul 2020 10:26:46 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 3 Jul 2020 10:26:46 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Dave Chinner <david@fromorbit.com>, Mike Snitzer <msnitzer@redhat.com>
In-Reply-To: <20200629223410.GK2005@dread.disaster.area>
Message-ID: <alpine.LRH.2.02.2007031020150.23220@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200625113122.7540-1-willy@infradead.org>
	<alpine.LRH.2.02.2006261058250.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626230847.GI2005@dread.disaster.area>
	<alpine.LRH.2.02.2006270848540.14350@file01.intranet.prod.int.rdu2.redhat.com>
	<20200629003550.GJ2005@dread.disaster.area>
	<alpine.LRH.2.02.2006290918030.11293@file01.intranet.prod.int.rdu2.redhat.com>
	<20200629223410.GK2005@dread.disaster.area>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-bufio: do cleanup from a workqueue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 30 Jun 2020, Dave Chinner wrote:

> https://lore.kernel.org/linux-fsdevel/20190809215733.GZ7777@dread.disaster.area/
> 
> If you did that when I suggested it, this problem would be solved.
> i.e. The only way to fix this problem once adn for all is to stop
> using the shrinker as a mechanism to issue and wait on IO. If you
> need background writeback of dirty buffers, do it from a
> WQ_MEM_RECLAIM workqueue that isn't directly in the memory reclaim
> path and so can issue writeback and block safely from a GFP_KERNEL
> context. Kick the workqueue from the shrinker context, but get rid
> of the IO submission and waiting from the shrinker and all the
> GFP_NOFS memory reclaim recursion problems go away.
> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com

Hi

This is a patch that moves buffer cleanup to a workqueue. Please review 
it.

Mikulas



From: Mikulas Patocka <mpatocka@redhat.com>

kswapd should not block because it degrades system performance.
So, move reclaim of buffers to a workqueue.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c |   60 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 19 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c	2020-07-03 14:07:43.000000000 +0200
+++ linux-2.6/drivers/md/dm-bufio.c	2020-07-03 15:35:23.000000000 +0200
@@ -108,7 +108,10 @@ struct dm_bufio_client {
 	int async_write_error;
 
 	struct list_head client_list;
+
 	struct shrinker shrinker;
+	struct work_struct shrink_work;
+	atomic_long_t need_shrink;
 };
 
 /*
@@ -1634,8 +1637,7 @@ static unsigned long get_retain_buffers(
 	return retain_bytes;
 }
 
-static unsigned long __scan(struct dm_bufio_client *c, unsigned long nr_to_scan,
-			    gfp_t gfp_mask)
+static void __scan(struct dm_bufio_client *c)
 {
 	int l;
 	struct dm_buffer *b, *tmp;
@@ -1646,42 +1648,58 @@ static unsigned long __scan(struct dm_bu
 
 	for (l = 0; l < LIST_SIZE; l++) {
 		list_for_each_entry_safe_reverse(b, tmp, &c->lru[l], lru_list) {
-			if (__try_evict_buffer(b, gfp_mask))
+			if (count - freed <= retain_target)
+				atomic_long_set(&c->need_shrink, 0);
+			if (!atomic_long_read(&c->need_shrink))
+				return;
+			if (__try_evict_buffer(b, GFP_KERNEL)) {
+				atomic_long_dec(&c->need_shrink);
 				freed++;
-			if (!--nr_to_scan || ((count - freed) <= retain_target))
-				return freed;
+			}
 			cond_resched();
 		}
 	}
-	return freed;
 }
 
-static unsigned long
-dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
+static void shrink_work(struct work_struct *w)
+{
+	struct dm_bufio_client *c = container_of(w, struct dm_bufio_client, shrink_work);
+
+	dm_bufio_lock(c);
+	__scan(c);
+	dm_bufio_unlock(c);
+}
+
+static unsigned long dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 {
 	struct dm_bufio_client *c;
-	unsigned long freed;
 
 	c = container_of(shrink, struct dm_bufio_client, shrinker);
-	if (sc->gfp_mask & __GFP_FS)
-		dm_bufio_lock(c);
-	else if (!dm_bufio_trylock(c))
-		return SHRINK_STOP;
+	atomic_long_add(sc->nr_to_scan, &c->need_shrink);
+	queue_work(dm_bufio_wq, &c->shrink_work);
 
-	freed  = __scan(c, sc->nr_to_scan, sc->gfp_mask);
-	dm_bufio_unlock(c);
-	return freed;
+	return sc->nr_to_scan;
 }
 
-static unsigned long
-dm_bufio_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
+static unsigned long dm_bufio_shrink_count(struct shrinker *shrink, struct shrink_control *sc)
 {
 	struct dm_bufio_client *c = container_of(shrink, struct dm_bufio_client, shrinker);
 	unsigned long count = READ_ONCE(c->n_buffers[LIST_CLEAN]) +
 			      READ_ONCE(c->n_buffers[LIST_DIRTY]);
 	unsigned long retain_target = get_retain_buffers(c);
+	unsigned long queued_for_cleanup = atomic_long_read(&c->need_shrink);
+
+	if (unlikely(count < retain_target))
+		count = 0;
+	else
+		count -= retain_target;
 
-	return (count < retain_target) ? 0 : (count - retain_target);
+	if (unlikely(count < queued_for_cleanup))
+		count = 0;
+	else
+		count -= queued_for_cleanup;
+
+	return count;
 }
 
 /*
@@ -1772,6 +1790,9 @@ struct dm_bufio_client *dm_bufio_client_
 		__free_buffer_wake(b);
 	}
 
+	INIT_WORK(&c->shrink_work, shrink_work);
+	atomic_long_set(&c->need_shrink, 0);
+
 	c->shrinker.count_objects = dm_bufio_shrink_count;
 	c->shrinker.scan_objects = dm_bufio_shrink_scan;
 	c->shrinker.seeks = 1;
@@ -1817,6 +1838,7 @@ void dm_bufio_client_destroy(struct dm_b
 	drop_buffers(c);
 
 	unregister_shrinker(&c->shrinker);
+	flush_work(&c->shrink_work);
 
 	mutex_lock(&dm_bufio_clients_lock);
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

