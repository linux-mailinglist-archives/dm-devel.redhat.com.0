Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EDC391E3827
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 07:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590557192;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xY7AV5UdPDd2EKfqxjeRoUdpLsTSdhgh1ObToUdM1BQ=;
	b=egZ7D1OVxMRLIRPNutnF8r4vg7n4uZqFtG9u4SuvhN3NskxR3ysNQ359vT9y/08ZgMiqmM
	soYhiiqChHbmGjm3T0V2gsR9yy60XJ9lLVEvcVQZMtI1P+5sRbpc4KoVdvhywqijhI7L1c
	8poPUZ1DrZYVdKOPR4i08gm2xxKdCU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-OmfIZXWPPuKFevHqMLyn-Q-1; Wed, 27 May 2020 01:26:30 -0400
X-MC-Unique: OmfIZXWPPuKFevHqMLyn-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD730835B42;
	Wed, 27 May 2020 05:26:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9371B5D9C9;
	Wed, 27 May 2020 05:26:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1DA5F1D82;
	Wed, 27 May 2020 05:26:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R5QECp011599 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 01:26:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10F9C2166BA2; Wed, 27 May 2020 05:26:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D84F2157F26
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:26:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9489D1049841
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:26:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-490-rt6DjZE-Nz-hYp9smtxhPQ-1; Wed, 27 May 2020 01:26:09 -0400
X-MC-Unique: rt6DjZE-Nz-hYp9smtxhPQ-1
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoYC-0000mh-7k; Wed, 27 May 2020 05:24:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:04 +0200
Message-Id: <20200527052419.403583-2-hch@lst.de>
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	Nitin Gupta <ngupta@vflare.org>
Subject: [dm-devel] [PATCH 01/16] block: add disk/bio-based accounting
	helpers
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

Add two new helpers to simplify I/O accounting for bio based drivers.
Currently these drivers use the generic_start_io_acct and
generic_end_io_acct helpers which have very cumbersome calling
conventions, don't actually return the time they started accounting,
and try to deal with accounting for partitions, which can't happen
for bio based drivers.  The new helpers will be used to subsequently
replace uses of the old helpers.

The main API is the bio based wrappes in blkdev.h, but for zram
which wants to account rw_page based I/O lower level routines are
provided as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 block/blk-core.c       | 34 ++++++++++++++++++++++++++++++++++
 include/linux/blkdev.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/block/blk-core.c b/block/blk-core.c
index 77e57c2e8d602..8973104f88d90 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1432,6 +1432,40 @@ void blk_account_io_start(struct request *rq, bool new_io)
 	part_stat_unlock();
 }
 
+unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
+		unsigned int op)
+{
+	struct hd_struct *part = &disk->part0;
+	const int sgrp = op_stat_group(op);
+	unsigned long now = READ_ONCE(jiffies);
+
+	part_stat_lock();
+	update_io_ticks(part, now, false);
+	part_stat_inc(part, ios[sgrp]);
+	part_stat_add(part, sectors[sgrp], sectors);
+	part_stat_local_inc(part, in_flight[op_is_write(op)]);
+	part_stat_unlock();
+
+	return now;
+}
+EXPORT_SYMBOL(disk_start_io_acct);
+
+void disk_end_io_acct(struct gendisk *disk, unsigned int op,
+		unsigned long start_time)
+{
+	struct hd_struct *part = &disk->part0;
+	const int sgrp = op_stat_group(op);
+	unsigned long now = READ_ONCE(jiffies);
+	unsigned long duration = now - start_time;
+
+	part_stat_lock();
+	update_io_ticks(part, now, true);
+	part_stat_add(part, nsecs[sgrp], jiffies_to_nsecs(duration));
+	part_stat_local_dec(part, in_flight[op_is_write(op)]);
+	part_stat_unlock();
+}
+EXPORT_SYMBOL(disk_end_io_acct);
+
 /*
  * Steal bios from a request and add them to a bio list.
  * The request must not have been partially completed before.
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 7d10f4e632325..6f7ff0fa8fcf8 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1892,4 +1892,32 @@ static inline void blk_wake_io_task(struct task_struct *waiter)
 		wake_up_process(waiter);
 }
 
+unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
+		unsigned int op);
+void disk_end_io_acct(struct gendisk *disk, unsigned int op,
+		unsigned long start_time);
+
+#ifdef CONFIG_BLOCK
+/**
+ * bio_start_io_acct - start I/O accounting for bio based drivers
+ * @bio:	bio to start account for
+ *
+ * Returns the start time that should be passed back to bio_end_io_acct().
+ */
+static inline unsigned long bio_start_io_acct(struct bio *bio)
+{
+	return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bio));
+}
+
+/**
+ * bio_end_io_acct - end I/O accounting for bio based drivers
+ * @bio:	bio to end account for
+ * @start:	start time returned by bio_start_io_acct()
+ */
+static inline void bio_end_io_acct(struct bio *bio, unsigned long start_time)
+{
+	return disk_end_io_acct(bio->bi_disk, bio_op(bio), start_time);
+}
+#endif /* CONFIG_BLOCK */
+
 #endif
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

