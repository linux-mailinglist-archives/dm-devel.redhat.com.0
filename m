Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B850E5B3DA
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 07:11:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BA7D308213C;
	Mon,  1 Jul 2019 05:11:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55F657E318;
	Mon,  1 Jul 2019 05:11:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 588C43D87;
	Mon,  1 Jul 2019 05:11:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x615Ajlh004465 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 01:10:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70C407E322; Mon,  1 Jul 2019 05:10:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2847A7E312;
	Mon,  1 Jul 2019 05:10:40 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C51137F43;
	Mon,  1 Jul 2019 05:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561957826; x=1593493826;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=eKp5BWbm2czEOH0r/etBmUeYCDH36g7dJVTVIL5yAqs=;
	b=ZucCGH/xGXogK7/G+JmyorX30ou08wlwImSGDCQM4BV8mwUVKQjQXC4g
	mo2fljMvedTfh8tfitv9Me9OLDlrGQ8dXSQ2jOKDSBsPmKp6BpXLs0BNy
	Yuu71aY5bJJpI2euBV5EIiPXbVMfrT1yLl2GIcWy4+PWzTy2YLpUT9tGU
	VkFQFWFT1zrDc6aXGhKUVjiySgRW6nlkIEGckORSIa5lgxpyOFOz97dKQ
	EzdfNNgaGqwojLHmM1oXHIAyC6Eew3HX2GYttpG8699lXubSguELtT4kH
	+5IgYG4/V9IkOIQzn9QxVzvZb/K58aOqcfLMLcxTDHrgbFcl6x5IUPI3L Q==;
X-IronPort-AV: E=Sophos;i="5.63,437,1557158400"; d="scan'208";a="113544725"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2019 13:09:22 +0800
IronPort-SDR: xJPIX2AipvSX8oEAU3vIh7lTV66Gozqun9KYEZSOvAQyzgLBxuLXnDQQBgkD3sSLSFhwC490PG
	ErXi1C9fI0sGnQx67yNPWowaO6g0Q7yxSkjDD/s34P1BevMYuqg7R+80ONRb/GxyWZIsJoXg/e
	eEOlOazBEvnIIsWqeqXesLkqNH3ZiDTQEYfYKxkzUiSQhGjfURGzgAPdaQR9vR5N08iDsr1d12
	twU0q7qFMhrhROJ5Erlxe43kkh7CuRvpoJ6OCV1S+wrwR+fLes2Ktdlw+1+sDtccAlckXvBBc1
	BqvkoDy3s7pidhpcsCsrTWze
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP; 30 Jun 2019 22:08:23 -0700
IronPort-SDR: d3MFX2II8ZNJ3WoQ6jf1YRJkftAnMXltUI6f3zNTDR7smaUTcGCaiVMXkff/WYVUpF5UXvSQ9E
	a/Xx9pkPY8Jll6aM0CCdWyyGcpxCah3A3NHprd3rphkQd1CVLYFz3SJ4VZlHfz3GmRoipQ3kO+
	oc120j1L4eJ7aNYk3dvXqJHvKObKVAvUZclqkYqVqKLlhx3GUQQyj+6qnhsAy5uUrMsHbJqLOI
	voUuUVTHXJ+yJm+BqQVdNBq7PlvJ67HHN91n+aWBuLnVH8Xk791uWDw+5cl2pfqQAVtZhqfX6r
	t2w=
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip02.wdc.com with ESMTP; 30 Jun 2019 22:09:21 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon,  1 Jul 2019 14:09:15 +0900
Message-Id: <20190701050918.27511-2-damien.lemoal@wdc.com>
In-Reply-To: <20190701050918.27511-1-damien.lemoal@wdc.com>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Mon, 01 Jul 2019 05:10:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 01 Jul 2019 05:10:25 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=078492c59=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: [dm-devel] [PATCH V6 1/4] block: Allow mapping of vmalloc-ed buffers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 01 Jul 2019 05:11:54 +0000 (UTC)

To allow the SCSI subsystem scsi_execute_req() function to issue
requests using large buffers that are better allocated with vmalloc()
rather than kmalloc(), modify bio_map_kern() to allow passing a buffer
allocated with vmalloc().

To do so, detect vmalloc-ed buffers using is_vmalloc_addr(). For
vmalloc-ed buffers, flush the buffer using flush_kernel_vmap_range(),
use vmalloc_to_page() instead of virt_to_page() to obtain the pages of
the buffer, and invalidate the buffer addresses with
invalidate_kernel_vmap_range() on completion of read BIOs. This last
point is executed using the function bio_invalidate_vmalloc_pages()
which is defined only if the architecture defines
ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE, that is, if the architecture
actually needs the invalidation done.

Fixes: 515ce6061312 ("scsi: sd_zbc: Fix sd_zbc_report_zones() buffer allocation")
Fixes: e76239a3748c ("block: add a report_zones method")
Cc: stable@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 block/bio.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/block/bio.c b/block/bio.c
index 2050bb4aacb5..3b6e35f73fd7 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -16,6 +16,7 @@
 #include <linux/workqueue.h>
 #include <linux/cgroup.h>
 #include <linux/blk-cgroup.h>
+#include <linux/highmem.h>
 
 #include <trace/events/block.h>
 #include "blk.h"
@@ -1479,8 +1480,22 @@ void bio_unmap_user(struct bio *bio)
 	bio_put(bio);
 }
 
+static void bio_invalidate_vmalloc_pages(struct bio *bio)
+{
+#ifdef ARCH_HAS_FLUSH_KERNEL_DCACHE_PAGE
+	if (bio->bi_private && !op_is_write(bio_op(bio))) {
+		unsigned long i, len = 0;
+
+		for (i = 0; i < bio->bi_vcnt; i++)
+			len += bio->bi_io_vec[i].bv_len;
+		invalidate_kernel_vmap_range(bio->bi_private, len);
+	}
+#endif
+}
+
 static void bio_map_kern_endio(struct bio *bio)
 {
+	bio_invalidate_vmalloc_pages(bio);
 	bio_put(bio);
 }
 
@@ -1501,6 +1516,8 @@ struct bio *bio_map_kern(struct request_queue *q, void *data, unsigned int len,
 	unsigned long end = (kaddr + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	unsigned long start = kaddr >> PAGE_SHIFT;
 	const int nr_pages = end - start;
+	bool is_vmalloc = is_vmalloc_addr(data);
+	struct page *page;
 	int offset, i;
 	struct bio *bio;
 
@@ -1508,6 +1525,11 @@ struct bio *bio_map_kern(struct request_queue *q, void *data, unsigned int len,
 	if (!bio)
 		return ERR_PTR(-ENOMEM);
 
+	if (is_vmalloc) {
+		flush_kernel_vmap_range(data, len);
+		bio->bi_private = data;
+	}
+
 	offset = offset_in_page(kaddr);
 	for (i = 0; i < nr_pages; i++) {
 		unsigned int bytes = PAGE_SIZE - offset;
@@ -1518,7 +1540,11 @@ struct bio *bio_map_kern(struct request_queue *q, void *data, unsigned int len,
 		if (bytes > len)
 			bytes = len;
 
-		if (bio_add_pc_page(q, bio, virt_to_page(data), bytes,
+		if (!is_vmalloc)
+			page = virt_to_page(data);
+		else
+			page = vmalloc_to_page(data);
+		if (bio_add_pc_page(q, bio, page, bytes,
 				    offset) < bytes) {
 			/* we don't support partial mappings */
 			bio_put(bio);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
