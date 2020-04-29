Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 92AF71BE3E3
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 18:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588177850;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B6JBccUz/eLVTQ1q9xw6sn2CD7rwmLfPkTEQelM2QwQ=;
	b=BVBR9FXkDdmSKEk0oooMC61QtWxpExFAB2DyoyOC7nmdBPDl/rgwkuZoVqbx/z4ope//Sp
	Kt0m/5HpHemiwimSbw7Lk2oU2nLBGNHn/VgrLq/P+xQmzVPlBZ13sQBR54qI4QCoyVcu7A
	6VsCGTbCKYd9ItQaQgH0Y2vPPg1D/bE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-KxyJuiLCO2GhlAgzZDd-XQ-1; Wed, 29 Apr 2020 12:30:48 -0400
X-MC-Unique: KxyJuiLCO2GhlAgzZDd-XQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11577EC1A0;
	Wed, 29 Apr 2020 16:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEA065D744;
	Wed, 29 Apr 2020 16:30:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F5721809542;
	Wed, 29 Apr 2020 16:30:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TGUAnM021856 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 12:30:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B3C35D790; Wed, 29 Apr 2020 16:30:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B55B5EDE7;
	Wed, 29 Apr 2020 16:30:04 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 03TGU3Oi004731; Wed, 29 Apr 2020 12:30:03 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 03TGU35B004727; Wed, 29 Apr 2020 12:30:03 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 29 Apr 2020 12:30:03 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2004291225140.3914@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-writecache: improve performance on
 Optane-based persistent memory
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

This is the clflushopt patch for the next merge window.

Mikulas


From: Mikulas Patocka <mpatocka@redhat.com>

When testing the dm-writecache target on a real Optane-based persistent
memory, it turned out that explicit cache flushing using the clflushopt
instruction performs better than non-temporal stores for block sizes 1k,
2k and 4k.

This patch adds a new function memcpy_flushcache_optimized that tests if
clflushopt is present - and if it is, we use it instead of
memcpy_flushcache.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-writecache.c |   29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-04-29 18:09:53.599999000 +0200
+++ linux-2.6/drivers/md/dm-writecache.c	2020-04-29 18:22:36.139999000 +0200
@@ -1137,6 +1137,33 @@ static int writecache_message(struct dm_
 	return r;
 }
 
+static void memcpy_flushcache_optimized(void *dest, void *source, size_t size)
+{
+	/*
+	 * clufhsopt performs better with block size 1024, 2048, 4096
+	 * non-temporal stores perform better with block size 512
+	 *
+	 * block size   512             1024            2048            4096
+	 * movnti       496 MB/s        642 MB/s        725 MB/s        744 MB/s
+	 * clflushopt   373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s
+	 */
+#ifdef CONFIG_X86
+	if (static_cpu_has(X86_FEATURE_CLFLUSHOPT) &&
+	    likely(boot_cpu_data.x86_clflush_size == 64) &&
+	    likely(size >= 768)) {
+		do {
+			memcpy((void *)dest, (void *)source, 64);
+			clflushopt((void *)dest);
+			dest += 64;
+			source += 64;
+			size -= 64;
+		} while (size >= 64);
+		return;
+	}
+#endif
+	memcpy_flushcache(dest, source, size);
+}
+
 static void bio_copy_block(struct dm_writecache *wc, struct bio *bio, void *data)
 {
 	void *buf;
@@ -1162,7 +1189,7 @@ static void bio_copy_block(struct dm_wri
 			}
 		} else {
 			flush_dcache_page(bio_page(bio));
-			memcpy_flushcache(data, buf, size);
+			memcpy_flushcache_optimized(data, buf, size);
 		}
 
 		bvec_kunmap_irq(buf, &flags);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

