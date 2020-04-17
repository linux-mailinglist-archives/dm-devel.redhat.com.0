Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D3CEF1ADD92
	for <lists+dm-devel@lfdr.de>; Fri, 17 Apr 2020 14:48:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587127692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h2wnmjDXP2Xwr0iW3GMqmIXwwB0x5K399FVl9QwtoCI=;
	b=N9BebD51sSECriJ2TACqKe9Jk1ORB8iyat8P/F4Ei8Wgh2Mq91wM7sp9PYGA/Eh+wWqUEB
	Qlj/mtxALPDD9G7KrBanhtc+A4eItB2BybS4KKCoYJcm1ek0XDFXcKt6FGZauEghCaZbL7
	FcHeeu5cDq2VoEWB9dEA1DHUjtP5bRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-fRO-e6kPOeaHj5O1gjNw5A-1; Fri, 17 Apr 2020 08:48:10 -0400
X-MC-Unique: fRO-e6kPOeaHj5O1gjNw5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BAD8107ACC7;
	Fri, 17 Apr 2020 12:48:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6ABE5DA2C;
	Fri, 17 Apr 2020 12:47:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0AD618095FF;
	Fri, 17 Apr 2020 12:47:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HClR3h027757 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 08:47:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF7641001B2B; Fri, 17 Apr 2020 12:47:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D9351001902;
	Fri, 17 Apr 2020 12:47:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 03HClL12002593; Fri, 17 Apr 2020 08:47:21 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 03HClJjh002589; Fri, 17 Apr 2020 08:47:20 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 17 Apr 2020 08:47:19 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Dan Williams <dan.j.williams@intel.com>
In-Reply-To: <CAPcyv4gpe8u=zNrRhvd9ioVNGbOJfRUXzFZuV--be6Hbj0xXtQ@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2004170831530.16047@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2004071029270.8662@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4goJ2jbXNVZbMUKtRUominhuMhuTKrMh=fnhrfvC4jyjw@mail.gmail.com>
	<alpine.LRH.2.02.2004081439080.13932@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4grNHvyYEc4W6PkymhEJvLb17tXbC3JZdqvtFxmMZ8DCQ@mail.gmail.com>
	<alpine.LRH.2.02.2004090612320.27517@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2004160411460.7833@file01.intranet.prod.int.rdu2.redhat.com>
	<CAPcyv4gpe8u=zNrRhvd9ioVNGbOJfRUXzFZuV--be6Hbj0xXtQ@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [dm-devel] [PATCH] x86: introduce memcpy_flushcache_clflushopt
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



On Thu, 16 Apr 2020, Dan Williams wrote:

> On Thu, Apr 16, 2020 at 1:24 AM Mikulas Patocka <mpatocka@redhat.com> wrote:
> >
> >
> >
> > On Thu, 9 Apr 2020, Mikulas Patocka wrote:
> >
> > > With dm-writecache on emulated pmem (with the memmap argument), we get
> > >
> > > With the original kernel:
> > > 8508 - 11378
> > > real    0m4.960s
> > > user    0m0.638s
> > > sys     0m4.312s
> > >
> > > With dm-writecache hacked to use cached writes + clflushopt:
> > > 8505 - 11378
> > > real    0m4.151s
> > > user    0m0.560s
> > > sys     0m3.582s
> >
> > I did some multithreaded tests:
> > http://people.redhat.com/~mpatocka/testcases/pmem/microbenchmarks/pmem-multithreaded.txt
> >
> > And it turns out that for singlethreaded access, write+clwb performs
> > better, while for multithreaded access, non-temporal stores perform
> > better.
> >
> > 1       sequential write-nt 8 bytes             1.3 GB/s
> > 2       sequential write-nt 8 bytes             2.5 GB/s
> > 3       sequential write-nt 8 bytes             2.8 GB/s
> > 4       sequential write-nt 8 bytes             2.8 GB/s
> > 5       sequential write-nt 8 bytes             2.5 GB/s
> >
> > 1       sequential write 8 bytes + clwb         1.6 GB/s
> > 2       sequential write 8 bytes + clwb         2.4 GB/s
> > 3       sequential write 8 bytes + clwb         1.7 GB/s
> > 4       sequential write 8 bytes + clwb         1.2 GB/s
> > 5       sequential write 8 bytes + clwb         0.8 GB/s
> >
> > For one thread, we can see that write-nt 8 bytes has 1.3 GB/s and write
> > 8+clwb has 1.6 GB/s, but for multiple threads, write-nt has better
> > throughput.
> >
> > The dm-writecache target is singlethreaded (all the copying is done while
> > holding the writecache lock), so it benefits from clwb.
> >
> > Should memcpy_flushcache be changed to write+clwb? Or are there some
> > multithreaded users of memcpy_flushcache that would be hurt by this
> > change?
> 
> Maybe this is asking for a specific memcpy_flushcache_inatomic()
> implementation for your use case, but leave nt-writes for the general
> case?

Yes - I have created this patch that adds a new function 
memcpy_flushcache_clflushopt and makes dm-writecache use it.

Mikulas



From: Mikulas Patocka <mpatocka@redhat.com>

Implement the function memcpy_flushcache_clflushopt which flushes cache
just like memcpy_flushcache - except that it uses cached writes and
explicit cache flushing instead of non-temporal stores.

Explicit cache flushing performs better in some cases (i.e. the
dm-writecache target with block size greater than 512), non-temporal
stores perform better in other cases (mostly multithreaded workloads) - so
we provide these two functions and the user should select which one is
faster for his particular workload.

dm-writecache througput (on real Optane-based persistent memory):
block size	512		1024		2048		4096
movnti		496 MB/s	642 MB/s	725 MB/s	744 MB/s
clflushopt	373 MB/s	688 MB/s	1.1 GB/s	1.2 GB/s

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 arch/x86/include/asm/string_64.h |   10 ++++++++++
 arch/x86/lib/usercopy_64.c       |   32 ++++++++++++++++++++++++++++++++
 drivers/md/dm-writecache.c       |    5 ++++-
 include/linux/string.h           |    6 ++++++
 4 files changed, 52 insertions(+), 1 deletion(-)

Index: linux-2.6/arch/x86/include/asm/string_64.h
===================================================================
--- linux-2.6.orig/arch/x86/include/asm/string_64.h	2020-04-17 14:06:35.139999000 +0200
+++ linux-2.6/arch/x86/include/asm/string_64.h	2020-04-17 14:06:35.129999000 +0200
@@ -114,6 +114,14 @@ memcpy_mcsafe(void *dst, const void *src
 	return 0;
 }
 
+/*
+ * In some cases (mostly single-threaded workload), clflushopt is faster
+ * than non-temporal stores. In other situations, non-temporal stores are
+ * faster. So, we provide two functions:
+ *	memcpy_flushcache using non-temporal stores
+ *	memcpy_flushcache_clflushopt using clflushopt
+ * The caller should test which one is faster for the particular workload.
+ */
 #ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
 #define __HAVE_ARCH_MEMCPY_FLUSHCACHE 1
 void __memcpy_flushcache(void *dst, const void *src, size_t cnt);
@@ -135,6 +143,8 @@ static __always_inline void memcpy_flush
 	}
 	__memcpy_flushcache(dst, src, cnt);
 }
+#define __HAVE_ARCH_MEMCPY_FLUSHCACHE_CLFLUSHOPT 1
+void memcpy_flushcache_clflushopt(void *dst, const void *src, size_t cnt);
 #endif
 
 #endif /* __KERNEL__ */
Index: linux-2.6/include/linux/string.h
===================================================================
--- linux-2.6.orig/include/linux/string.h	2020-04-17 14:06:35.139999000 +0200
+++ linux-2.6/include/linux/string.h	2020-04-17 14:06:35.129999000 +0200
@@ -175,6 +175,12 @@ static inline void memcpy_flushcache(voi
 	memcpy(dst, src, cnt);
 }
 #endif
+#ifndef __HAVE_ARCH_MEMCPY_FLUSHCACHE_CLFLUSHOPT
+static inline void memcpy_flushcache_clflushopt(void *dst, const void *src, size_t cnt)
+{
+	memcpy_flushcache(dst, src, cnt);
+}
+#endif
 void *memchr_inv(const void *s, int c, size_t n);
 char *strreplace(char *s, char old, char new);
 
Index: linux-2.6/arch/x86/lib/usercopy_64.c
===================================================================
--- linux-2.6.orig/arch/x86/lib/usercopy_64.c	2020-04-17 14:06:35.139999000 +0200
+++ linux-2.6/arch/x86/lib/usercopy_64.c	2020-04-17 14:25:18.569999000 +0200
@@ -199,6 +199,38 @@ void __memcpy_flushcache(void *_dst, con
 }
 EXPORT_SYMBOL_GPL(__memcpy_flushcache);
 
+void memcpy_flushcache_clflushopt(void *_dst, const void *_src, size_t size)
+{
+	unsigned long dest = (unsigned long) _dst;
+	unsigned long source = (unsigned long) _src;
+
+	if (static_cpu_has(X86_FEATURE_CLFLUSHOPT) && likely(boot_cpu_data.x86_clflush_size == 64)) {
+		if (unlikely(!IS_ALIGNED(dest, 64))) {
+			size_t len = min_t(size_t, size, ALIGN(dest, 64) - dest);
+
+			memcpy((void *) dest, (void *) source, len);
+			clflushopt((void *)dest);
+			dest += len;
+			source += len;
+			size -= len;
+		}
+		while (size >= 64) {
+			memcpy((void *)dest, (void *)source, 64);
+			clflushopt((void *)dest);
+			dest += 64;
+			source += 64;
+			size -= 64;
+		}
+		if (unlikely(size != 0)) {
+			memcpy((void *)dest, (void *)source, size);
+			clflushopt((void *)dest);
+		}
+		return;
+	}
+	memcpy_flushcache((void *)dest, (void *)source, size);
+}
+EXPORT_SYMBOL_GPL(memcpy_flushcache_clflushopt);
+
 void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
 		size_t len)
 {
Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-04-17 14:06:35.139999000 +0200
+++ linux-2.6/drivers/md/dm-writecache.c	2020-04-17 14:06:35.129999000 +0200
@@ -1166,7 +1166,10 @@ static void bio_copy_block(struct dm_wri
 			}
 		} else {
 			flush_dcache_page(bio_page(bio));
-			memcpy_flushcache(data, buf, size);
+			if (likely(size > 512))
+				memcpy_flushcache_clflushopt(data, buf, size);
+			else
+				memcpy_flushcache(data, buf, size);
 		}
 
 		bvec_kunmap_irq(buf, &flags);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

