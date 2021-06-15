Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 40EE73A7FE2
	for <lists+dm-devel@lfdr.de>; Tue, 15 Jun 2021 15:31:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-xx1L7kP0NnKRscLPkRBZgA-1; Tue, 15 Jun 2021 09:31:18 -0400
X-MC-Unique: xx1L7kP0NnKRscLPkRBZgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2123100690F;
	Tue, 15 Jun 2021 13:30:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 934E3620DE;
	Tue, 15 Jun 2021 13:30:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E358546F59;
	Tue, 15 Jun 2021 13:30:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15FDUnWv004960 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Jun 2021 09:30:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93A98208AB80; Tue, 15 Jun 2021 13:30:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F79F2087A56
	for <dm-devel@redhat.com>; Tue, 15 Jun 2021 13:30:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E751690DE3B
	for <dm-devel@redhat.com>; Tue, 15 Jun 2021 13:30:46 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-106-Oh0bijC8MqeMviGghqlIMw-1; Tue, 15 Jun 2021 09:30:44 -0400
X-MC-Unique: Oh0bijC8MqeMviGghqlIMw-1
Received: from [2001:4bb8:19b:fdce:9045:1e63:20f0:ca9] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lt98X-006oIn-SA; Tue, 15 Jun 2021 13:29:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 15 Jun 2021 15:24:50 +0200
Message-Id: <20210615132456.753241-13-hch@lst.de>
In-Reply-To: <20210615132456.753241-1-hch@lst.de>
References: <20210615132456.753241-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-arch@vger.kernel.org, linux-block@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	dm-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org
Subject: [dm-devel] [PATCH 12/18] block: remove bvec_kmap_irq and
	bvec_kunmap_irq
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These two helpers are entirely unused now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/bio.h | 42 ------------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/include/linux/bio.h b/include/linux/bio.h
index d2b98efb5cc5..8070f3f77c14 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -5,7 +5,6 @@
 #ifndef __LINUX_BIO_H
 #define __LINUX_BIO_H
 
-#include <linux/highmem.h>
 #include <linux/mempool.h>
 #include <linux/ioprio.h>
 /* struct bio, bio_vec and BIO_* flags are defined in blk_types.h */
@@ -519,47 +518,6 @@ static inline void bio_clone_blkg_association(struct bio *dst,
 					      struct bio *src) { }
 #endif	/* CONFIG_BLK_CGROUP */
 
-#ifdef CONFIG_HIGHMEM
-/*
- * remember never ever reenable interrupts between a bvec_kmap_irq and
- * bvec_kunmap_irq!
- */
-static inline char *bvec_kmap_irq(struct bio_vec *bvec, unsigned long *flags)
-{
-	unsigned long addr;
-
-	/*
-	 * might not be a highmem page, but the preempt/irq count
-	 * balancing is a lot nicer this way
-	 */
-	local_irq_save(*flags);
-	addr = (unsigned long) kmap_atomic(bvec->bv_page);
-
-	BUG_ON(addr & ~PAGE_MASK);
-
-	return (char *) addr + bvec->bv_offset;
-}
-
-static inline void bvec_kunmap_irq(char *buffer, unsigned long *flags)
-{
-	unsigned long ptr = (unsigned long) buffer & PAGE_MASK;
-
-	kunmap_atomic((void *) ptr);
-	local_irq_restore(*flags);
-}
-
-#else
-static inline char *bvec_kmap_irq(struct bio_vec *bvec, unsigned long *flags)
-{
-	return page_address(bvec->bv_page) + bvec->bv_offset;
-}
-
-static inline void bvec_kunmap_irq(char *buffer, unsigned long *flags)
-{
-	*flags = 0;
-}
-#endif
-
 /*
  * BIO list management for use by remapping drivers (e.g. DM or MD) and loop.
  *
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

