Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTP id 680E1431009
	for <lists+dm-devel@lfdr.de>; Mon, 18 Oct 2021 07:57:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-1yyaw5KqOFil3qN1-rsysQ-1; Mon, 18 Oct 2021 01:57:34 -0400
X-MC-Unique: 1yyaw5KqOFil3qN1-rsysQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E1FD79EE1;
	Mon, 18 Oct 2021 05:57:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C7405DA60;
	Mon, 18 Oct 2021 05:57:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 386914EA39;
	Mon, 18 Oct 2021 05:57:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19I5vPbC008107 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 01:57:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7741D4010FFE; Mon, 18 Oct 2021 05:57:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72857400DAFD
	for <dm-devel@redhat.com>; Mon, 18 Oct 2021 05:57:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 557CB8038E3
	for <dm-devel@redhat.com>; Mon, 18 Oct 2021 05:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-39-GDO1iB3NO0Cy4q09DaFjYA-1; Mon, 18 Oct 2021 01:57:23 -0400
X-MC-Unique: GDO1iB3NO0Cy4q09DaFjYA-1
Received: from 089144211028.atnat0020.highway.a1.net ([89.144.211.28]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcKSk-00E3QG-MP; Mon, 18 Oct 2021 04:41:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: 
Date: Mon, 18 Oct 2021 06:40:52 +0200
Message-Id: <20211018044054.1779424-10-hch@lst.de>
In-Reply-To: <20211018044054.1779424-1-hch@lst.de>
References: <20211018044054.1779424-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
	linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
	linux-ext4@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>
Subject: [dm-devel] [PATCH 09/11] dm-log-writes: add a log_writes_dax_pgoff
	helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a helper to perform the entire remapping for DAX accesses.  This
helper open codes bdev_dax_pgoff given that the alignment checks have
already been done by the submitting file system and don't need to be
repeated.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-log-writes.c | 42 +++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index 6d694526881d0..5aac60c1b774c 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -949,17 +949,21 @@ static int log_dax(struct log_writes_c *lc, sector_t sector, size_t bytes,
 	return 0;
 }
 
+static struct dax_device *log_writes_dax_pgoff(struct dm_target *ti,
+		pgoff_t *pgoff)
+{
+	struct log_writes_c *lc = ti->private;
+
+	*pgoff += (get_start_sect(lc->dev->bdev) >> PAGE_SECTORS_SHIFT);
+	return lc->dev->dax_dev;
+}
+
 static long log_writes_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
 					 long nr_pages, void **kaddr, pfn_t *pfn)
 {
-	struct log_writes_c *lc = ti->private;
-	sector_t sector = pgoff * PAGE_SECTORS;
-	int ret;
+	struct dax_device *dax_dev = log_writes_dax_pgoff(ti, &pgoff);
 
-	ret = bdev_dax_pgoff(lc->dev->bdev, sector, nr_pages * PAGE_SIZE, &pgoff);
-	if (ret)
-		return ret;
-	return dax_direct_access(lc->dev->dax_dev, pgoff, nr_pages, kaddr, pfn);
+	return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
 }
 
 static size_t log_writes_dax_copy_from_iter(struct dm_target *ti,
@@ -968,11 +972,9 @@ static size_t log_writes_dax_copy_from_iter(struct dm_target *ti,
 {
 	struct log_writes_c *lc = ti->private;
 	sector_t sector = pgoff * PAGE_SECTORS;
+	struct dax_device *dax_dev = log_writes_dax_pgoff(ti, &pgoff);
 	int err;
 
-	if (bdev_dax_pgoff(lc->dev->bdev, sector, ALIGN(bytes, PAGE_SIZE), &pgoff))
-		return 0;
-
 	/* Don't bother doing anything if logging has been disabled */
 	if (!lc->logging_enabled)
 		goto dax_copy;
@@ -983,34 +985,24 @@ static size_t log_writes_dax_copy_from_iter(struct dm_target *ti,
 		return 0;
 	}
 dax_copy:
-	return dax_copy_from_iter(lc->dev->dax_dev, pgoff, addr, bytes, i);
+	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
 }
 
 static size_t log_writes_dax_copy_to_iter(struct dm_target *ti,
 					  pgoff_t pgoff, void *addr, size_t bytes,
 					  struct iov_iter *i)
 {
-	struct log_writes_c *lc = ti->private;
-	sector_t sector = pgoff * PAGE_SECTORS;
+	struct dax_device *dax_dev = log_writes_dax_pgoff(ti, &pgoff);
 
-	if (bdev_dax_pgoff(lc->dev->bdev, sector, ALIGN(bytes, PAGE_SIZE), &pgoff))
-		return 0;
-	return dax_copy_to_iter(lc->dev->dax_dev, pgoff, addr, bytes, i);
+	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
 }
 
 static int log_writes_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
 					  size_t nr_pages)
 {
-	int ret;
-	struct log_writes_c *lc = ti->private;
-	sector_t sector = pgoff * PAGE_SECTORS;
+	struct dax_device *dax_dev = log_writes_dax_pgoff(ti, &pgoff);
 
-	ret = bdev_dax_pgoff(lc->dev->bdev, sector, nr_pages << PAGE_SHIFT,
-			     &pgoff);
-	if (ret)
-		return ret;
-	return dax_zero_page_range(lc->dev->dax_dev, pgoff,
-				   nr_pages << PAGE_SHIFT);
+	return dax_zero_page_range(dax_dev, pgoff, nr_pages << PAGE_SHIFT);
 }
 
 #else
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

