Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0063919703A
	for <lists+dm-devel@lfdr.de>; Sun, 29 Mar 2020 22:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585513738;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vEnPs3oxxPzccbCJDubtyTIdoXa4IeKAQQolSvzJEu4=;
	b=A8E71BOQxmKO4ywENq78ht4iXduywarRp8uQtkIchLvb1xIhMf/pE6X87OrIhN3ZHSpfES
	5YDXAIq11lMAZ8SMACbK7LjFvJIA5MobLi01bdUZ53Le9FT7F61fA1fLOXR6PA5uVRG/9N
	YqtxbZdGV4sZ6bZ2apQh1Z7ckhy3sr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-cbrVmg4lMYGMZDS4WynnOw-1; Sun, 29 Mar 2020 16:28:56 -0400
X-MC-Unique: cbrVmg4lMYGMZDS4WynnOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C04C1005512;
	Sun, 29 Mar 2020 20:28:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0508597B04;
	Sun, 29 Mar 2020 20:28:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F294944BD;
	Sun, 29 Mar 2020 20:28:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02TKSeg9024874 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 29 Mar 2020 16:28:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0BE1219756; Sun, 29 Mar 2020 20:28:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EBFC19925;
	Sun, 29 Mar 2020 20:28:37 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 02TKSawd032317; Sun, 29 Mar 2020 16:28:36 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 02TKSarG032314; Sun, 29 Mar 2020 16:28:36 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sun, 29 Mar 2020 16:28:36 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2003291625590.32108@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: [dm-devel] [PATCH] memcpy_flushcache: use cache flusing for larger
	lengths
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I tested dm-writecache performance on a machine with Optane nvdimm and it
turned out that for larger writes, cached stores + cache flushing perform
better than non-temporal stores. This is the throughput of dm-writecache
measured with this command:
dd if=/dev/zero of=/dev/mapper/wc bs=64 oflag=direct

block size	512		1024		2048		4096
movnti		496 MB/s	642 MB/s	725 MB/s	744 MB/s
clflushopt	373 MB/s	688 MB/s	1.1 GB/s	1.2 GB/s

We can see that for smaller block, movnti performs better, but for larger
blocks, clflushopt has better performance.

This patch changes the function __memcpy_flushcache accordingly, so that
with size >= 768 it performs cached stores and cache flushing. Note that
we must not use the new branch if the CPU doesn't have clflushopt - in
that case, the kernel would use inefficient "clflush" instruction that has
very bad performance.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 arch/x86/lib/usercopy_64.c |   36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

Index: linux-2.6/arch/x86/lib/usercopy_64.c
===================================================================
--- linux-2.6.orig/arch/x86/lib/usercopy_64.c	2020-03-24 15:15:36.644945091 -0400
+++ linux-2.6/arch/x86/lib/usercopy_64.c	2020-03-29 13:16:49.937011736 -0400
@@ -152,6 +152,42 @@ void __memcpy_flushcache(void *_dst, con
 			return;
 	}
 
+	if (static_cpu_has(X86_FEATURE_CLFLUSHOPT) && size >= 768) {
+		while (!IS_ALIGNED(dest, 64)) {
+			asm("movq    (%0), %%r8\n"
+			    "movnti  %%r8,   (%1)\n"
+			    :: "r" (source), "r" (dest)
+			    : "memory", "r8");
+			dest += 8;
+			source += 8;
+			size -= 8;
+		}
+		do {
+			asm("movq    (%0), %%r8\n"
+			    "movq   8(%0), %%r9\n"
+			    "movq  16(%0), %%r10\n"
+			    "movq  24(%0), %%r11\n"
+			    "movq    %%r8,   (%1)\n"
+			    "movq    %%r9,  8(%1)\n"
+			    "movq   %%r10, 16(%1)\n"
+			    "movq   %%r11, 24(%1)\n"
+			    "movq  32(%0), %%r8\n"
+			    "movq  40(%0), %%r9\n"
+			    "movq  48(%0), %%r10\n"
+			    "movq  56(%0), %%r11\n"
+			    "movq    %%r8, 32(%1)\n"
+			    "movq    %%r9, 40(%1)\n"
+			    "movq   %%r10, 48(%1)\n"
+			    "movq   %%r11, 56(%1)\n"
+			    :: "r" (source), "r" (dest)
+			    : "memory", "r8", "r9", "r10", "r11");
+			clflushopt((void *)dest);
+			dest += 64;
+			source += 64;
+			size -= 64;
+		} while (size >= 64);
+	}
+
 	/* 4x8 movnti loop */
 	while (size >= 32) {
 		asm("movq    (%0), %%r8\n"

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

