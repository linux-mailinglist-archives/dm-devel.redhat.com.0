Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A309E3D6F43
	for <lists+dm-devel@lfdr.de>; Tue, 27 Jul 2021 08:21:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-ReUGENkqOsect-7p4H0Qpg-1; Tue, 27 Jul 2021 02:21:12 -0400
X-MC-Unique: ReUGENkqOsect-7p4H0Qpg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70445190D36B;
	Tue, 27 Jul 2021 06:21:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5218C9C8C9;
	Tue, 27 Jul 2021 06:21:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF82D4BB7C;
	Tue, 27 Jul 2021 06:21:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16R6L3jb012062 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 02:21:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 02CE42033953; Tue, 27 Jul 2021 06:21:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B222031A5C
	for <dm-devel@redhat.com>; Tue, 27 Jul 2021 06:21:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09964800882
	for <dm-devel@redhat.com>; Tue, 27 Jul 2021 06:21:00 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-14-JcLErSmFPsiWvzpmH14XOQ-1; Tue, 27 Jul 2021 02:20:55 -0400
X-MC-Unique: JcLErSmFPsiWvzpmH14XOQ-1
Received: from [2001:4bb8:184:87c5:b7fb:1299:a9e5:ff56] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8GP5-00EjY8-Up; Tue, 27 Jul 2021 06:18:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 27 Jul 2021 07:56:44 +0200
Message-Id: <20210727055646.118787-14-hch@lst.de>
In-Reply-To: <20210727055646.118787-1-hch@lst.de>
References: <20210727055646.118787-1-hch@lst.de>
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
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	linux-mips@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-kernel@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	dm-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	Ira Weiny <ira.weiny@intel.com>, Ilya Dryomov <idryomov@gmail.com>
Subject: [dm-devel] [PATCH 13/15] block: use memcpy_from_bvec in
	__blk_queue_bounce
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rewrite the actual bounce buffering loop in __blk_queue_bounce to that
the memcpy_to_bvec helper can be used to perform the data copies.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 block/bounce.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/block/bounce.c b/block/bounce.c
index 7e9e666c04dc..05fc7148489d 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -239,24 +239,19 @@ void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig)
 	 * because the 'bio' is single-page bvec.
 	 */
 	for (i = 0, to = bio->bi_io_vec; i < bio->bi_vcnt; to++, i++) {
-		struct page *page = to->bv_page;
+		struct page *bounce_page;
 
-		if (!PageHighMem(page))
+		if (!PageHighMem(to->bv_page))
 			continue;
 
-		to->bv_page = mempool_alloc(&page_pool, GFP_NOIO);
-		inc_zone_page_state(to->bv_page, NR_BOUNCE);
+		bounce_page = mempool_alloc(&page_pool, GFP_NOIO);
+		inc_zone_page_state(bounce_page, NR_BOUNCE);
 
 		if (rw == WRITE) {
-			char *vto, *vfrom;
-
-			flush_dcache_page(page);
-
-			vto = page_address(to->bv_page) + to->bv_offset;
-			vfrom = kmap_atomic(page) + to->bv_offset;
-			memcpy(vto, vfrom, to->bv_len);
-			kunmap_atomic(vfrom);
+			flush_dcache_page(to->bv_page);
+			memcpy_from_bvec(page_address(bounce_page), to);
 		}
+		to->bv_page = bounce_page;
 	}
 
 	trace_block_bio_bounce(*bio_orig);
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

