Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C40D522BF70
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jul 2020 09:36:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-19GpZN-uNa2lORpgrgcXvg-1; Fri, 24 Jul 2020 03:35:54 -0400
X-MC-Unique: 19GpZN-uNa2lORpgrgcXvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16AD2E920;
	Fri, 24 Jul 2020 07:35:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC53F5D9D7;
	Fri, 24 Jul 2020 07:35:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7860D730E1;
	Fri, 24 Jul 2020 07:35:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06O7ZNp6032207 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jul 2020 03:35:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D40F611BFA6D; Fri, 24 Jul 2020 07:35:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE7541016755
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 07:35:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7DD7924900
	for <dm-devel@redhat.com>; Fri, 24 Jul 2020 07:35:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-71-Tn32carCNymRljhBWm44Ag-1; Fri, 24 Jul 2020 03:35:17 -0400
X-MC-Unique: Tn32carCNymRljhBWm44Ag-1
Received: from [2001:4bb8:18c:2acc:8dfe:be3c:592c:efc5] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysD0-0006D8-Gr; Fri, 24 Jul 2020 07:33:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 24 Jul 2020 09:33:07 +0200
Message-Id: <20200724073313.138789-9-hch@lst.de>
In-Reply-To: <20200724073313.138789-1-hch@lst.de>
References: <20200724073313.138789-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-mm@kvack.org
Subject: [dm-devel] [PATCH 08/14] block: add helper macros for queue sysfs
	entries
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

Add two helpers macros to avoid boilerplate code for the queue sysfs
entries.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/blk-sysfs.c | 248 +++++++++++-----------------------------------
 1 file changed, 58 insertions(+), 190 deletions(-)

diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index cfbb039da8751f..9bb4e42fb73265 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -551,201 +551,69 @@ static ssize_t queue_dax_show(struct request_queue *q, char *page)
 	return queue_var_show(blk_queue_dax(q), page);
 }
 
-static struct queue_sysfs_entry queue_requests_entry = {
-	.attr = {.name = "nr_requests", .mode = 0644 },
-	.show = queue_requests_show,
-	.store = queue_requests_store,
-};
-
-static struct queue_sysfs_entry queue_ra_entry = {
-	.attr = {.name = "read_ahead_kb", .mode = 0644 },
-	.show = queue_ra_show,
-	.store = queue_ra_store,
-};
-
-static struct queue_sysfs_entry queue_max_sectors_entry = {
-	.attr = {.name = "max_sectors_kb", .mode = 0644 },
-	.show = queue_max_sectors_show,
-	.store = queue_max_sectors_store,
-};
+#define QUEUE_RO_ENTRY(_prefix, _name)			\
+static struct queue_sysfs_entry _prefix##_entry = {	\
+	.attr	= { .name = _name, .mode = 0444 },	\
+	.show	= _prefix##_show,			\
+};
+
+#define QUEUE_RW_ENTRY(_prefix, _name)			\
+static struct queue_sysfs_entry _prefix##_entry = {	\
+	.attr	= { .name = _name, .mode = 0644 },	\
+	.show	= _prefix##_show,			\
+	.store	= _prefix##_store,			\
+};
+
+QUEUE_RW_ENTRY(queue_requests, "nr_requests");
+QUEUE_RW_ENTRY(queue_ra, "read_ahead_kb");
+QUEUE_RW_ENTRY(queue_max_sectors, "max_sectors_kb");
+QUEUE_RO_ENTRY(queue_max_hw_sectors, "max_hw_sectors_kb");
+QUEUE_RO_ENTRY(queue_max_segments, "max_segments");
+QUEUE_RO_ENTRY(queue_max_integrity_segments, "max_integrity_segments");
+QUEUE_RO_ENTRY(queue_max_segment_size, "max_segment_size");
+QUEUE_RW_ENTRY(elv_iosched, "scheduler");
+
+QUEUE_RO_ENTRY(queue_logical_block_size, "logical_block_size");
+QUEUE_RO_ENTRY(queue_physical_block_size, "physical_block_size");
+QUEUE_RO_ENTRY(queue_chunk_sectors, "chunk_sectors");
+QUEUE_RO_ENTRY(queue_io_min, "minimum_io_size");
+QUEUE_RO_ENTRY(queue_io_opt, "optimal_io_size");
+
+QUEUE_RO_ENTRY(queue_max_discard_segments, "max_discard_segments");
+QUEUE_RO_ENTRY(queue_discard_granularity, "discard_granularity");
+QUEUE_RO_ENTRY(queue_discard_max_hw, "discard_max_hw_bytes");
+QUEUE_RW_ENTRY(queue_discard_max, "discard_max_bytes");
+QUEUE_RO_ENTRY(queue_discard_zeroes_data, "discard_zeroes_data");
+
+QUEUE_RO_ENTRY(queue_write_same_max, "write_same_max_bytes");
+QUEUE_RO_ENTRY(queue_write_zeroes_max, "write_zeroes_max_bytes");
+QUEUE_RO_ENTRY(queue_zone_append_max, "zone_append_max_bytes");
+
+QUEUE_RO_ENTRY(queue_zoned, "zoned");
+QUEUE_RO_ENTRY(queue_nr_zones, "nr_zones");
+QUEUE_RO_ENTRY(queue_max_open_zones, "max_open_zones");
+QUEUE_RO_ENTRY(queue_max_active_zones, "max_active_zones");
+
+QUEUE_RW_ENTRY(queue_nomerges, "nomerges");
+QUEUE_RW_ENTRY(queue_rq_affinity, "rq_affinity");
+QUEUE_RW_ENTRY(queue_poll, "io_poll");
+QUEUE_RW_ENTRY(queue_poll_delay, "io_poll_delay");
+QUEUE_RW_ENTRY(queue_wc, "write_cache");
+QUEUE_RO_ENTRY(queue_fua, "fua");
+QUEUE_RO_ENTRY(queue_dax, "dax");
+QUEUE_RW_ENTRY(queue_io_timeout, "io_timeout");
+QUEUE_RW_ENTRY(queue_wb_lat, "wbt_lat_usec");
 
-static struct queue_sysfs_entry queue_max_hw_sectors_entry = {
-	.attr = {.name = "max_hw_sectors_kb", .mode = 0444 },
-	.show = queue_max_hw_sectors_show,
-};
-
-static struct queue_sysfs_entry queue_max_segments_entry = {
-	.attr = {.name = "max_segments", .mode = 0444 },
-	.show = queue_max_segments_show,
-};
-
-static struct queue_sysfs_entry queue_max_discard_segments_entry = {
-	.attr = {.name = "max_discard_segments", .mode = 0444 },
-	.show = queue_max_discard_segments_show,
-};
-
-static struct queue_sysfs_entry queue_max_integrity_segments_entry = {
-	.attr = {.name = "max_integrity_segments", .mode = 0444 },
-	.show = queue_max_integrity_segments_show,
-};
-
-static struct queue_sysfs_entry queue_max_segment_size_entry = {
-	.attr = {.name = "max_segment_size", .mode = 0444 },
-	.show = queue_max_segment_size_show,
-};
-
-static struct queue_sysfs_entry queue_iosched_entry = {
-	.attr = {.name = "scheduler", .mode = 0644 },
-	.show = elv_iosched_show,
-	.store = elv_iosched_store,
-};
+#ifdef CONFIG_BLK_DEV_THROTTLING_LOW
+QUEUE_RW_ENTRY(blk_throtl_sample, "throttle_sample_time");
+#endif
 
+/* legacy alias for logical_block_size: */
 static struct queue_sysfs_entry queue_hw_sector_size_entry = {
 	.attr = {.name = "hw_sector_size", .mode = 0444 },
 	.show = queue_logical_block_size_show,
 };
 
-static struct queue_sysfs_entry queue_logical_block_size_entry = {
-	.attr = {.name = "logical_block_size", .mode = 0444 },
-	.show = queue_logical_block_size_show,
-};
-
-static struct queue_sysfs_entry queue_physical_block_size_entry = {
-	.attr = {.name = "physical_block_size", .mode = 0444 },
-	.show = queue_physical_block_size_show,
-};
-
-static struct queue_sysfs_entry queue_chunk_sectors_entry = {
-	.attr = {.name = "chunk_sectors", .mode = 0444 },
-	.show = queue_chunk_sectors_show,
-};
-
-static struct queue_sysfs_entry queue_io_min_entry = {
-	.attr = {.name = "minimum_io_size", .mode = 0444 },
-	.show = queue_io_min_show,
-};
-
-static struct queue_sysfs_entry queue_io_opt_entry = {
-	.attr = {.name = "optimal_io_size", .mode = 0444 },
-	.show = queue_io_opt_show,
-};
-
-static struct queue_sysfs_entry queue_discard_granularity_entry = {
-	.attr = {.name = "discard_granularity", .mode = 0444 },
-	.show = queue_discard_granularity_show,
-};
-
-static struct queue_sysfs_entry queue_discard_max_hw_entry = {
-	.attr = {.name = "discard_max_hw_bytes", .mode = 0444 },
-	.show = queue_discard_max_hw_show,
-};
-
-static struct queue_sysfs_entry queue_discard_max_entry = {
-	.attr = {.name = "discard_max_bytes", .mode = 0644 },
-	.show = queue_discard_max_show,
-	.store = queue_discard_max_store,
-};
-
-static struct queue_sysfs_entry queue_discard_zeroes_data_entry = {
-	.attr = {.name = "discard_zeroes_data", .mode = 0444 },
-	.show = queue_discard_zeroes_data_show,
-};
-
-static struct queue_sysfs_entry queue_write_same_max_entry = {
-	.attr = {.name = "write_same_max_bytes", .mode = 0444 },
-	.show = queue_write_same_max_show,
-};
-
-static struct queue_sysfs_entry queue_write_zeroes_max_entry = {
-	.attr = {.name = "write_zeroes_max_bytes", .mode = 0444 },
-	.show = queue_write_zeroes_max_show,
-};
-
-static struct queue_sysfs_entry queue_zone_append_max_entry = {
-	.attr = {.name = "zone_append_max_bytes", .mode = 0444 },
-	.show = queue_zone_append_max_show,
-};
-
-static struct queue_sysfs_entry queue_zoned_entry = {
-	.attr = {.name = "zoned", .mode = 0444 },
-	.show = queue_zoned_show,
-};
-
-static struct queue_sysfs_entry queue_nr_zones_entry = {
-	.attr = {.name = "nr_zones", .mode = 0444 },
-	.show = queue_nr_zones_show,
-};
-
-static struct queue_sysfs_entry queue_max_open_zones_entry = {
-	.attr = {.name = "max_open_zones", .mode = 0444 },
-	.show = queue_max_open_zones_show,
-};
-
-static struct queue_sysfs_entry queue_max_active_zones_entry = {
-	.attr = {.name = "max_active_zones", .mode = 0444 },
-	.show = queue_max_active_zones_show,
-};
-
-static struct queue_sysfs_entry queue_nomerges_entry = {
-	.attr = {.name = "nomerges", .mode = 0644 },
-	.show = queue_nomerges_show,
-	.store = queue_nomerges_store,
-};
-
-static struct queue_sysfs_entry queue_rq_affinity_entry = {
-	.attr = {.name = "rq_affinity", .mode = 0644 },
-	.show = queue_rq_affinity_show,
-	.store = queue_rq_affinity_store,
-};
-
-static struct queue_sysfs_entry queue_poll_entry = {
-	.attr = {.name = "io_poll", .mode = 0644 },
-	.show = queue_poll_show,
-	.store = queue_poll_store,
-};
-
-static struct queue_sysfs_entry queue_poll_delay_entry = {
-	.attr = {.name = "io_poll_delay", .mode = 0644 },
-	.show = queue_poll_delay_show,
-	.store = queue_poll_delay_store,
-};
-
-static struct queue_sysfs_entry queue_wc_entry = {
-	.attr = {.name = "write_cache", .mode = 0644 },
-	.show = queue_wc_show,
-	.store = queue_wc_store,
-};
-
-static struct queue_sysfs_entry queue_fua_entry = {
-	.attr = {.name = "fua", .mode = 0444 },
-	.show = queue_fua_show,
-};
-
-static struct queue_sysfs_entry queue_dax_entry = {
-	.attr = {.name = "dax", .mode = 0444 },
-	.show = queue_dax_show,
-};
-
-static struct queue_sysfs_entry queue_io_timeout_entry = {
-	.attr = {.name = "io_timeout", .mode = 0644 },
-	.show = queue_io_timeout_show,
-	.store = queue_io_timeout_store,
-};
-
-static struct queue_sysfs_entry queue_wb_lat_entry = {
-	.attr = {.name = "wbt_lat_usec", .mode = 0644 },
-	.show = queue_wb_lat_show,
-	.store = queue_wb_lat_store,
-};
-
-#ifdef CONFIG_BLK_DEV_THROTTLING_LOW
-static struct queue_sysfs_entry throtl_sample_time_entry = {
-	.attr = {.name = "throttle_sample_time", .mode = 0644 },
-	.show = blk_throtl_sample_time_show,
-	.store = blk_throtl_sample_time_store,
-};
-#endif
-
 static struct attribute *queue_attrs[] = {
 	&queue_requests_entry.attr,
 	&queue_ra_entry.attr,
@@ -755,7 +623,7 @@ static struct attribute *queue_attrs[] = {
 	&queue_max_discard_segments_entry.attr,
 	&queue_max_integrity_segments_entry.attr,
 	&queue_max_segment_size_entry.attr,
-	&queue_iosched_entry.attr,
+	&elv_iosched_entry.attr,
 	&queue_hw_sector_size_entry.attr,
 	&queue_logical_block_size_entry.attr,
 	&queue_physical_block_size_entry.attr,
@@ -786,7 +654,7 @@ static struct attribute *queue_attrs[] = {
 	&queue_poll_delay_entry.attr,
 	&queue_io_timeout_entry.attr,
 #ifdef CONFIG_BLK_DEV_THROTTLING_LOW
-	&throtl_sample_time_entry.attr,
+	&blk_throtl_sample_time_entry.attr,
 #endif
 	NULL,
 };
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

