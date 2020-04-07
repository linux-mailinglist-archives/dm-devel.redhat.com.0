Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2141A0FD2
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 17:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586271725;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lDn1esv8P7lyoS+yrdlFDqH9hBOV8xA01VgcsE1eiJ8=;
	b=bNKtp44B0yIYfrFJ3VL+ad8n6T6ng9LbWNXFC6pZq1YViI/cFbcjs6DTbeslyGTxp9sEby
	n1eQKX7vtD4NlmX7p5CAVcQJL6hfzMU5UkSkYFG6vY6PyYNiCrKxU3sTBNIuMEjDONhCcj
	lmrw6UMKUz5qK72iJdyKri9yj1OXYFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-gheds2W6PDqOLt9O65NNrw-1; Tue, 07 Apr 2020 11:02:03 -0400
X-MC-Unique: gheds2W6PDqOLt9O65NNrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF1E7107ACCA;
	Tue,  7 Apr 2020 15:01:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DF9297AF5;
	Tue,  7 Apr 2020 15:01:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C0C193A86;
	Tue,  7 Apr 2020 15:01:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 037F1dwW022852 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 11:01:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91B3F1001938; Tue,  7 Apr 2020 15:01:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C36A910027A4;
	Tue,  7 Apr 2020 15:01:36 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 037F1auk029412; Tue, 7 Apr 2020 11:01:36 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 037F1XBj029408; Tue, 7 Apr 2020 11:01:33 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 7 Apr 2020 11:01:33 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Message-ID: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Dan Williams <dan.j.williams@intel.com>, x86@kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dm-devel@redhat.com
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

[ resending this to x86 maintainers ]

Hi

I tested performance of various methods how to write to optane-based 
persistent memory, and found out that non-temporal stores achieve 
throughput 1.3 GB/s. 8 cached stores immediatelly followed by clflushopt 
or clwb achieve throughput 1.6 GB/s.

memcpy_flushcache uses non-temporal stores, I modified it to use cached 
stores + clflushopt and it improved performance of the dm-writecache 
target significantly:

dm-writecache throughput:
(dd if=/dev/zero of=/dev/mapper/wc bs=64k oflag=direct)
writecache block size   512             1024            2048            4096
movnti                  496 MB/s        642 MB/s        725 MB/s        744 MB/s
clflushopt              373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s

For block size 512, movnti works better, for larger block sizes, 
clflushopt is better.

I was also testing the novafs filesystem, it is not upstream, but it 
benefitted from similar change in __memcpy_flushcache and 
__copy_user_nocache:
write throughput on big files - movnti: 662 MB/s, clwb: 1323 MB/s
write throughput on small files - movnti: 621 MB/s, clwb: 1013 MB/s


I submit this patch for __memcpy_flushcache that improves dm-writecache 
performance.

Other ideas - should we introduce memcpy_to_pmem instead of modifying 
memcpy_flushcache and move this logic there? Or should I modify the 
dm-writecache target directly to use clflushopt with no change to the 
architecture-specific code?

Mikulas




From: Mikulas Patocka <mpatocka@redhat.com>

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
+++ linux-2.6/arch/x86/lib/usercopy_64.c	2020-03-30 07:17:51.450290007 -0400
@@ -152,6 +152,42 @@ void __memcpy_flushcache(void *_dst, con
 			return;
 	}
 
+	if (static_cpu_has(X86_FEATURE_CLFLUSHOPT) && size >= 768 && likely(boot_cpu_data.x86_clflush_size == 64)) {
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

