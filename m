Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE3A39FCC9
	for <lists+dm-devel@lfdr.de>; Tue,  8 Jun 2021 18:48:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-yYcimKzYPg6I57TpTtRZTQ-1; Tue, 08 Jun 2021 12:48:02 -0400
X-MC-Unique: yYcimKzYPg6I57TpTtRZTQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E4C188E3CB;
	Tue,  8 Jun 2021 16:47:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 325755D764;
	Tue,  8 Jun 2021 16:47:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C70301800BB4;
	Tue,  8 Jun 2021 16:47:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 158GlhCl023737 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Jun 2021 12:47:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4096F2014F84; Tue,  8 Jun 2021 16:47:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C142208DD88
	for <dm-devel@redhat.com>; Tue,  8 Jun 2021 16:47:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA47A802A5E
	for <dm-devel@redhat.com>; Tue,  8 Jun 2021 16:47:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-560-pqL9gpC2M2ugGcIWoFIRcQ-1; Tue, 08 Jun 2021 12:47:39 -0400
X-MC-Unique: pqL9gpC2M2ugGcIWoFIRcQ-1
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqeFQ-009Rge-Pv; Tue, 08 Jun 2021 16:06:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  8 Jun 2021 18:05:56 +0200
Message-Id: <20210608160603.1535935-10-hch@lst.de>
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org
Subject: [dm-devel] [PATCH 09/16] ps3disk: use memcpy_{from,to}_bvec
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the bvec helpers instead of open coding the copy.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/ps3disk.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index ba3ece56cbb3..f2eb0225814f 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -84,26 +84,13 @@ static void ps3disk_scatter_gather(struct ps3_storage_device *dev,
 	unsigned int offset = 0;
 	struct req_iterator iter;
 	struct bio_vec bvec;
-	unsigned int i = 0;
-	size_t size;
-	void *buf;
 
 	rq_for_each_segment(bvec, req, iter) {
-		unsigned long flags;
-		dev_dbg(&dev->sbd.core, "%s:%u: bio %u: %u sectors from %llu\n",
-			__func__, __LINE__, i, bio_sectors(iter.bio),
-			iter.bio->bi_iter.bi_sector);
-
-		size = bvec.bv_len;
-		buf = bvec_kmap_irq(&bvec, &flags);
 		if (gather)
-			memcpy(dev->bounce_buf+offset, buf, size);
+			memcpy_from_bvec(dev->bounce_buf + offset, &bvec);
 		else
-			memcpy(buf, dev->bounce_buf+offset, size);
-		offset += size;
-		flush_kernel_dcache_page(bvec.bv_page);
-		bvec_kunmap_irq(buf, &flags);
-		i++;
+			memcpy_to_bvec(&bvec, dev->bounce_buf + offset);
+		offset += bvec.bv_len;
 	}
 }
 
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

