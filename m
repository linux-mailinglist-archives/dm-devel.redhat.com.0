Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D514615AE29
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 18:08:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581527292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j6fYQP34rVHPIzuQcWjNnELC6MElr+eBCrivsbt6/C0=;
	b=ZdHKX6fFIEMURhnGeo2p2zfCN4ivW0lmuDIsM7jK445LTg3Bn6YWn8/XlcUYksvaG8S8Ww
	ksEeU8xET7WR8y4+oNUygFnMWfNVtFaIqhYH5jyCk2svfRPZgjbUS1KNJuaI6O54blWL63
	2MxwoN1KPn90GGXtKbEnK6ZYTa+ezY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-QlxRRuFkOvKg3HF0PICHzQ-1; Wed, 12 Feb 2020 12:08:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BE97107B277;
	Wed, 12 Feb 2020 17:08:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D71690084;
	Wed, 12 Feb 2020 17:08:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E79F71803C33;
	Wed, 12 Feb 2020 17:08:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CH7oX7001118 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 12:07:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 04EB360BF4; Wed, 12 Feb 2020 17:07:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3098E60BF1;
	Wed, 12 Feb 2020 17:07:47 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id BB6FD2257D6; Wed, 12 Feb 2020 12:07:46 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	dan.j.williams@intel.com, hch@infradead.org
Date: Wed, 12 Feb 2020 12:07:31 -0500
Message-Id: <20200212170733.8092-5-vgoyal@redhat.com>
In-Reply-To: <20200212170733.8092-1-vgoyal@redhat.com>
References: <20200212170733.8092-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, jack@suse.cz, vgoyal@redhat.com
Subject: [dm-devel] [PATCH 4/6] dax,
	dm/md: Use dax_pgoff() instead of bdev_dax_pgoff()
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
X-MC-Unique: QlxRRuFkOvKg3HF0PICHzQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace usage of bdev_dax_pgoff() with dax_pgoff().

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 drivers/md/dm-linear.c     | 9 ++++++---
 drivers/md/dm-log-writes.c | 9 ++++++---
 drivers/md/dm-stripe.c     | 8 +++++---
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 8d07fdf63a47..05f654044185 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -167,7 +167,8 @@ static long linear_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
 	sector_t dev_sector, sector = pgoff * PAGE_SECTORS;
 
 	dev_sector = linear_map_sector(ti, sector);
-	ret = bdev_dax_pgoff(bdev, dev_sector, nr_pages * PAGE_SIZE, &pgoff);
+	ret = dax_pgoff(get_start_sect(bdev), dev_sector, nr_pages * PAGE_SIZE,
+			&pgoff);
 	if (ret)
 		return ret;
 	return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
@@ -182,7 +183,8 @@ static size_t linear_dax_copy_from_iter(struct dm_target *ti, pgoff_t pgoff,
 	sector_t dev_sector, sector = pgoff * PAGE_SECTORS;
 
 	dev_sector = linear_map_sector(ti, sector);
-	if (bdev_dax_pgoff(bdev, dev_sector, ALIGN(bytes, PAGE_SIZE), &pgoff))
+	if (dax_pgoff(get_start_sect(bdev), dev_sector, ALIGN(bytes, PAGE_SIZE),
+		      &pgoff))
 		return 0;
 	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
 }
@@ -196,7 +198,8 @@ static size_t linear_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
 	sector_t dev_sector, sector = pgoff * PAGE_SECTORS;
 
 	dev_sector = linear_map_sector(ti, sector);
-	if (bdev_dax_pgoff(bdev, dev_sector, ALIGN(bytes, PAGE_SIZE), &pgoff))
+	if (dax_pgoff(get_start_sect(bdev), dev_sector, ALIGN(bytes, PAGE_SIZE),
+		      &pgoff))
 		return 0;
 	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
 }
diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index 99721c76225d..204fbceeb97e 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -952,7 +952,8 @@ static long log_writes_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
 	sector_t sector = pgoff * PAGE_SECTORS;
 	int ret;
 
-	ret = bdev_dax_pgoff(lc->dev->bdev, sector, nr_pages * PAGE_SIZE, &pgoff);
+	ret = dax_pgoff(get_start_sect(lc->dev->bdev), sector,
+			nr_pages * PAGE_SIZE, &pgoff);
 	if (ret)
 		return ret;
 	return dax_direct_access(lc->dev->dax_dev, pgoff, nr_pages, kaddr, pfn);
@@ -966,7 +967,8 @@ static size_t log_writes_dax_copy_from_iter(struct dm_target *ti,
 	sector_t sector = pgoff * PAGE_SECTORS;
 	int err;
 
-	if (bdev_dax_pgoff(lc->dev->bdev, sector, ALIGN(bytes, PAGE_SIZE), &pgoff))
+	if (dax_pgoff(get_start_sect(lc->dev->bdev), sector,
+		      ALIGN(bytes, PAGE_SIZE), &pgoff))
 		return 0;
 
 	/* Don't bother doing anything if logging has been disabled */
@@ -989,7 +991,8 @@ static size_t log_writes_dax_copy_to_iter(struct dm_target *ti,
 	struct log_writes_c *lc = ti->private;
 	sector_t sector = pgoff * PAGE_SECTORS;
 
-	if (bdev_dax_pgoff(lc->dev->bdev, sector, ALIGN(bytes, PAGE_SIZE), &pgoff))
+	if (dax_pgoff(get_start_sect(lc->dev->bdev), sector,
+		      ALIGN(bytes, PAGE_SIZE), &pgoff))
 		return 0;
 	return dax_copy_to_iter(lc->dev->dax_dev, pgoff, addr, bytes, i);
 }
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index 63bbcc20f49a..337cdc6e0951 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -316,7 +316,8 @@ static long stripe_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
 	dax_dev = sc->stripe[stripe].dev->dax_dev;
 	bdev = sc->stripe[stripe].dev->bdev;
 
-	ret = bdev_dax_pgoff(bdev, dev_sector, nr_pages * PAGE_SIZE, &pgoff);
+	ret = dax_pgoff(get_start_sect(bdev), dev_sector, nr_pages * PAGE_SIZE,
+			&pgoff);
 	if (ret)
 		return ret;
 	return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
@@ -336,7 +337,7 @@ static size_t stripe_dax_copy_from_iter(struct dm_target *ti, pgoff_t pgoff,
 	dax_dev = sc->stripe[stripe].dev->dax_dev;
 	bdev = sc->stripe[stripe].dev->bdev;
 
-	if (bdev_dax_pgoff(bdev, dev_sector, ALIGN(bytes, PAGE_SIZE), &pgoff))
+	if (dax_pgoff(get_start_sect(bdev), dev_sector, ALIGN(bytes, PAGE_SIZE),		      &pgoff))
 		return 0;
 	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
 }
@@ -355,7 +356,8 @@ static size_t stripe_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
 	dax_dev = sc->stripe[stripe].dev->dax_dev;
 	bdev = sc->stripe[stripe].dev->bdev;
 
-	if (bdev_dax_pgoff(bdev, dev_sector, ALIGN(bytes, PAGE_SIZE), &pgoff))
+	if (dax_pgoff(get_start_sect(bdev), dev_sector, ALIGN(bytes, PAGE_SIZE),
+		      &pgoff))
 		return 0;
 	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
 }
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

