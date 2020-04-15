Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 60D741AAA73
	for <lists+dm-devel@lfdr.de>; Wed, 15 Apr 2020 16:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586962268;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rse4LblU6tBzux+Ba7Hpc6wsaH2vZdaLAwzagzL/xtQ=;
	b=MrfVl2YBBvfBTCKxHfctjy6uTGwlBpezzifppEKUZoxMgqYmNtFS3VBqaMbPPzIh5Vn8En
	ryxRsyV6CwShVw4E6ZuD16E71Kd3G3FaK7ViJYPD8lKbHrMYzt1tN2ZqVtlmbvQvZu68I+
	/p1SlktmCv44GJ5dcJxB0OB7cxLsVhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-5WSyad4jMjOhPE3O8VpyUg-1; Wed, 15 Apr 2020 10:51:06 -0400
X-MC-Unique: 5WSyad4jMjOhPE3O8VpyUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6149149DA;
	Wed, 15 Apr 2020 14:51:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CE51118DF1;
	Wed, 15 Apr 2020 14:51:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCA8B18089CD;
	Wed, 15 Apr 2020 14:50:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FEorOD007585 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 10:50:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91725A098C; Wed, 15 Apr 2020 14:50:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A450BA1020;
	Wed, 15 Apr 2020 14:50:50 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 03FEoo3B010225; Wed, 15 Apr 2020 10:50:50 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 03FEoo17010221; Wed, 15 Apr 2020 10:50:50 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 15 Apr 2020 10:50:50 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2003310811430.18457@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Teigland <teigland@redhat.com>
Subject: [dm-devel] [PATCH] dm-writecache: use explicit cache flushing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Flushing each cache line explicity has better performance than using 
non-temporal stores (for transfers larger than 512 bytes).

This patch improves throughput of the dm-writecache driver:

block size      512             1024            2048            4096
movnti          496 MB/s        642 MB/s        725 MB/s        744 MB/s
clflushopt      373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s

Note that movnti (used by memcpy_flushcache) has better performance in 
multithreaded access, that's why it may be better to make this change in 
the dm-writecache driver rather than changing memcpy_flushcache.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-writecache.c |   18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c
+++ linux-2.6/drivers/md/dm-writecache.c
@@ -1140,7 +1140,16 @@ static void bio_copy_block(struct dm_wri
 			}
 		} else {
 			flush_dcache_page(bio_page(bio));
-			memcpy_flushcache(data, buf, size);
+#if defined(CONFIG_X86)
+			if (static_cpu_has(X86_FEATURE_CLFLUSHOPT) && likely(size > 512) && likely(boot_cpu_data.x86_clflush_size == 64)) {
+				unsigned long i;
+				for (i = 0; i < size; i += 64) {
+					memcpy(data + i, buf + i, 64);
+					clflushopt(data + i);
+				}
+			} else
+#endif
+				memcpy_flushcache(data, buf, size);
 		}
 
 		bvec_kunmap_irq(buf, &flags);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

