Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 082061510B4
	for <lists+dm-devel@lfdr.de>; Mon,  3 Feb 2020 21:01:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580760087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ehOoYS0vX8Ty43vnAlsaQeWzECW+BVMuSpW0jgahAbM=;
	b=JdfrVeu/XJiIROwGbkqyA3q5+zoUOAtk5N2QIJAjXVqRJQI9/oX3pjD46pVI6TU6ImJsDU
	M3nluehzDjZBxNcHRGLe7xpXIuI3eG4yKTEFcs37cHpuWA+0heWqxYgHeou5yycr0hCqnj
	gFuK2kYzyZkrbBfIgzsvj2AMYasF5Wo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-EcxLygf8M325ayHwozmKYQ-1; Mon, 03 Feb 2020 15:01:25 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79AC4100551C;
	Mon,  3 Feb 2020 20:01:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E98FB5DA88;
	Mon,  3 Feb 2020 20:01:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DB5518089CD;
	Mon,  3 Feb 2020 20:01:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 013K0njX021367 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 15:00:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4DDCE5C1D8; Mon,  3 Feb 2020 20:00:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AC155C1B5;
	Mon,  3 Feb 2020 20:00:46 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 1440022471C; Mon,  3 Feb 2020 15:00:46 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	dan.j.williams@intel.com, hch@infradead.org
Date: Mon,  3 Feb 2020 15:00:27 -0500
Message-Id: <20200203200029.4592-4-vgoyal@redhat.com>
In-Reply-To: <20200203200029.4592-1-vgoyal@redhat.com>
References: <20200203200029.4592-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com, vgoyal@redhat.com
Subject: [dm-devel] [PATCH 3/5] dm,dax: Add dax zero_page_range operation
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
X-MC-Unique: EcxLygf8M325ayHwozmKYQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds support for dax zero_page_range operation to dm targets.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 drivers/md/dm-linear.c        | 18 ++++++++++++++++++
 drivers/md/dm-log-writes.c    | 17 +++++++++++++++++
 drivers/md/dm-stripe.c        | 23 +++++++++++++++++++++++
 drivers/md/dm.c               | 30 ++++++++++++++++++++++++++++++
 include/linux/device-mapper.h |  3 +++
 5 files changed, 91 insertions(+)

diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 8d07fdf63a47..a6db998f0264 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -201,10 +201,27 @@ static size_t linear_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
 	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
 }
 
+static int linear_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
+		unsigned offset, size_t len)
+{
+	int ret;
+	struct linear_c *lc = ti->private;
+	struct block_device *bdev = lc->dev->bdev;
+	struct dax_device *dax_dev = lc->dev->dax_dev;
+	sector_t dev_sector, sector = pgoff * PAGE_SECTORS;
+
+	dev_sector = linear_map_sector(ti, sector);
+	ret = bdev_dax_pgoff(bdev, dev_sector, ALIGN(len, PAGE_SIZE), &pgoff);
+	if (ret)
+		return ret;
+	return dax_zero_page_range(dax_dev, pgoff, offset, len);
+}
+
 #else
 #define linear_dax_direct_access NULL
 #define linear_dax_copy_from_iter NULL
 #define linear_dax_copy_to_iter NULL
+#define linear_dax_zero_page_range NULL
 #endif
 
 static struct target_type linear_target = {
@@ -226,6 +243,7 @@ static struct target_type linear_target = {
 	.direct_access = linear_dax_direct_access,
 	.dax_copy_from_iter = linear_dax_copy_from_iter,
 	.dax_copy_to_iter = linear_dax_copy_to_iter,
+	.dax_zero_page_range = linear_dax_zero_page_range,
 };
 
 int __init dm_linear_init(void)
diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index 99721c76225d..be20605f7544 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -994,10 +994,26 @@ static size_t log_writes_dax_copy_to_iter(struct dm_target *ti,
 	return dax_copy_to_iter(lc->dev->dax_dev, pgoff, addr, bytes, i);
 }
 
+static int log_writes_dax_zero_page_range(struct dm_target *ti,
+					  pgoff_t pgoff, unsigned offset,
+					  size_t len)
+{
+	int ret;
+	struct log_writes_c *lc = ti->private;
+	sector_t sector = pgoff * PAGE_SECTORS;
+
+	ret = bdev_dax_pgoff(lc->dev->bdev, sector, ALIGN(len, PAGE_SIZE),
+			     &pgoff);
+	if (ret)
+		return ret;
+	return dax_zero_page_range(lc->dev->dax_dev, pgoff, offset, len);
+}
+
 #else
 #define log_writes_dax_direct_access NULL
 #define log_writes_dax_copy_from_iter NULL
 #define log_writes_dax_copy_to_iter NULL
+#define log_writes_dax_zero_page_range NULL
 #endif
 
 static struct target_type log_writes_target = {
@@ -1016,6 +1032,7 @@ static struct target_type log_writes_target = {
 	.direct_access = log_writes_dax_direct_access,
 	.dax_copy_from_iter = log_writes_dax_copy_from_iter,
 	.dax_copy_to_iter = log_writes_dax_copy_to_iter,
+	.dax_zero_page_range = log_writes_dax_zero_page_range,
 };
 
 static int __init dm_log_writes_init(void)
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index 63bbcc20f49a..8ad3c956efbf 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -360,10 +360,32 @@ static size_t stripe_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
 	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
 }
 
+static int stripe_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
+				      unsigned offset, size_t len)
+{
+	int ret;
+	sector_t dev_sector, sector = pgoff * PAGE_SECTORS;
+	struct stripe_c *sc = ti->private;
+	struct dax_device *dax_dev;
+	struct block_device *bdev;
+	uint32_t stripe;
+
+	stripe_map_sector(sc, sector, &stripe, &dev_sector);
+	dev_sector += sc->stripe[stripe].physical_start;
+	dax_dev = sc->stripe[stripe].dev->dax_dev;
+	bdev = sc->stripe[stripe].dev->bdev;
+
+	ret = bdev_dax_pgoff(bdev, dev_sector, ALIGN(len, PAGE_SIZE), &pgoff);
+	if (ret)
+		return ret;
+	return dax_zero_page_range(dax_dev, pgoff, offset, len);
+}
+
 #else
 #define stripe_dax_direct_access NULL
 #define stripe_dax_copy_from_iter NULL
 #define stripe_dax_copy_to_iter NULL
+#define stripe_dax_zero_page_range NULL
 #endif
 
 /*
@@ -486,6 +508,7 @@ static struct target_type stripe_target = {
 	.direct_access = stripe_dax_direct_access,
 	.dax_copy_from_iter = stripe_dax_copy_from_iter,
 	.dax_copy_to_iter = stripe_dax_copy_to_iter,
+	.dax_zero_page_range = stripe_dax_zero_page_range,
 };
 
 int __init dm_stripe_init(void)
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index e8f9661a10a1..4605d30dad60 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1198,6 +1198,35 @@ static size_t dm_dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff,
 	return ret;
 }
 
+static int dm_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
+				  unsigned offset, size_t len)
+{
+	struct mapped_device *md = dax_get_private(dax_dev);
+	sector_t sector = pgoff * PAGE_SECTORS;
+	struct dm_target *ti;
+	int ret = -EIO;
+	int srcu_idx;
+
+	ti = dm_dax_get_live_target(md, sector, &srcu_idx);
+
+	if (!ti)
+		goto out;
+	if (WARN_ON(!ti->type->dax_zero_page_range)) {
+		/*
+		 * ->zero_page_range() is mandatory dax operation. If we are
+		 *  here, something is wrong.
+		 */
+		dm_put_live_table(md, srcu_idx);
+		goto out;
+	}
+	ret = ti->type->dax_zero_page_range(ti, pgoff, offset, len);
+
+ out:
+	dm_put_live_table(md, srcu_idx);
+
+	return ret;
+}
+
 /*
  * A target may call dm_accept_partial_bio only from the map routine.  It is
  * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_RESET,
@@ -3194,6 +3223,7 @@ static const struct dax_operations dm_dax_ops = {
 	.dax_supported = dm_dax_supported,
 	.copy_from_iter = dm_dax_copy_from_iter,
 	.copy_to_iter = dm_dax_copy_to_iter,
+	.zero_page_range = dm_dax_zero_page_range,
 };
 
 /*
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 475668c69dbc..04009accf819 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -141,6 +141,8 @@ typedef long (*dm_dax_direct_access_fn) (struct dm_target *ti, pgoff_t pgoff,
 		long nr_pages, void **kaddr, pfn_t *pfn);
 typedef size_t (*dm_dax_copy_iter_fn)(struct dm_target *ti, pgoff_t pgoff,
 		void *addr, size_t bytes, struct iov_iter *i);
+typedef int (*dm_dax_zero_page_range_fn)(struct dm_target *ti, pgoff_t pgoff,
+		unsigned, size_t len);
 #define PAGE_SECTORS (PAGE_SIZE / 512)
 
 void dm_error(const char *message);
@@ -195,6 +197,7 @@ struct target_type {
 	dm_dax_direct_access_fn direct_access;
 	dm_dax_copy_iter_fn dax_copy_from_iter;
 	dm_dax_copy_iter_fn dax_copy_to_iter;
+	dm_dax_zero_page_range_fn dax_zero_page_range;
 
 	/* For internal device-mapper use. */
 	struct list_head list;
-- 
2.18.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

