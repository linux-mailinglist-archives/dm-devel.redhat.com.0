Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1E95E38850E
	for <lists+dm-devel@lfdr.de>; Wed, 19 May 2021 04:58:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-8KaP5h_CNsqLOIChy9AM0g-1; Tue, 18 May 2021 22:58:44 -0400
X-MC-Unique: 8KaP5h_CNsqLOIChy9AM0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0428A8042A8;
	Wed, 19 May 2021 02:58:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D519C5C230;
	Wed, 19 May 2021 02:58:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8832F3F64B;
	Wed, 19 May 2021 02:58:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14J2tjdv029528 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 May 2021 22:55:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF59F1033C63; Wed, 19 May 2021 02:55:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB27B112D177
	for <dm-devel@redhat.com>; Wed, 19 May 2021 02:55:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B38DD9124DC
	for <dm-devel@redhat.com>; Wed, 19 May 2021 02:55:45 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-437-szAR9m2bN7uliwZ8SnhcUg-1; Tue, 18 May 2021 22:55:41 -0400
X-MC-Unique: szAR9m2bN7uliwZ8SnhcUg-1
IronPort-SDR: 6qHk+A7F9RtsGJ6C1hIZtMwGxF28YG0lgAqAVZ/ms4NiVe/8CkqzBXEEq7WEQ5BvKg83O71Qgn
	zs0Dfh7C9rZ5JMATESInU3JLJIdA91cxnVCM7r6wqldRYyZT4rLcvjnXx/wOkbXY8AkN5P4dtT
	S6nM/ayUjGP3J4c47LUF02AdFGf5ReGQe/dH+hmi4NGVWia30Eqx5Ot6My/GWQ20xk7sQiwTJ3
	Wnvx+ZvQXF0/osuNKS0MpTcE13KfXPjSMeMuOoMHbplnVh+mHFmBkcU0VhyPKXYFthbVF/IX3u
	Fhc=
X-IronPort-AV: E=Sophos;i="5.82,311,1613404800"; d="scan'208";a="169197449"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 May 2021 10:55:40 +0800
IronPort-SDR: QIoIBPZWDv7R8puw/7UusoiBPyeLbrHzufrFHojrJXynSfsi3CP8qpdpoYSxz0/nktaun3Tqf8
	K4vCDfONrAr1jDsH3dZtCZ9icHM0wQk/wL/okmhnOdSPNCqN9j5FDBRHJ0CJMpGJyrNQKn70vD
	0u7TINpQS0gZnUKfGakzDkH6kKu8oRVztr8sJVlZv8ChucSzgHsY3ybGkL1/S7NAyhzdp1ITYU
	zPP5br+pvCbh2tXEOKhKmAUGo/jCCRVbUwuuNfGvv046qPeFUxT/JKoxSSr/c4cBO6IZ2HFOOc
	+OczEy+uUdddDX0ysLzyUX48
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 May 2021 19:34:05 -0700
IronPort-SDR: 0UQ9iEcznzJkmRbe6Dx9LCZmmKO+7yOsDQUuKOKkqT20CEV5wEZPPUsDVrxFeXOO2ebZ91cOCO
	DcHmTJ+wcDsycyCT+uXtBliqH67u+4kfcsZoImNk6fvRIvM7cLuAlGoTcy7TFEq0QsnZ3onsBM
	LUCly5uk0JTsZL8WR9RTNts+rJoVPzxudC0rw7+tVaR+1LYo/Psy1ySnt1IOeRuYRc4ftzghtN
	CHt0xw5keSWBjEywpASgnoraT5Era2tCO+MULVMQvIbyT+oyBiVJ12B0FugekZ8ftl6f2hCCjy
	Ims=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 May 2021 19:55:39 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Date: Wed, 19 May 2021 11:55:26 +0900
Message-Id: <20210519025529.707897-9-damien.lemoal@wdc.com>
In-Reply-To: <20210519025529.707897-1-damien.lemoal@wdc.com>
References: <20210519025529.707897-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 08/11] dm: Forbid requeue of writes to zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A target map method requesting the requeue of a bio with
DM_MAPIO_REQUEUE or completing it with DM_ENDIO_REQUEUE can cause
unaligned write errors if the bio is a write operation targeting a
sequential zone. If a zoned target request such a requeue, warn about
it and kill the IO.

The function dm_is_zone_write() is introduced to detect write operations
to zoned targets.

This change does not affect the target drivers supporting zoned devices
and exposing a zoned device, namely dm-crypt, dm-linear and dm-flakey as
none of these targets ever request a requeue.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zone.c | 17 +++++++++++++++++
 drivers/md/dm.c      | 18 +++++++++++++++---
 drivers/md/dm.h      |  5 +++++
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-zone.c b/drivers/md/dm-zone.c
index b42474043249..edc3bbb45637 100644
--- a/drivers/md/dm-zone.c
+++ b/drivers/md/dm-zone.c
@@ -104,6 +104,23 @@ int dm_report_zones(struct block_device *bdev, sector_t start, sector_t sector,
 }
 EXPORT_SYMBOL_GPL(dm_report_zones);
 
+bool dm_is_zone_write(struct mapped_device *md, struct bio *bio)
+{
+	struct request_queue *q = md->queue;
+
+	if (!blk_queue_is_zoned(q))
+		return false;
+
+	switch (bio_op(bio)) {
+	case REQ_OP_WRITE_ZEROES:
+	case REQ_OP_WRITE_SAME:
+	case REQ_OP_WRITE:
+		return !op_is_flush(bio->bi_opf) && bio_sectors(bio);
+	default:
+		return false;
+	}
+}
+
 void dm_set_zones_restrictions(struct dm_table *t, struct request_queue *q)
 {
 	if (!blk_queue_is_zoned(q))
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 45d2dc2ee844..4426019a89cc 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -846,11 +846,15 @@ static void dec_pending(struct dm_io *io, blk_status_t error)
 			 * Target requested pushing back the I/O.
 			 */
 			spin_lock_irqsave(&md->deferred_lock, flags);
-			if (__noflush_suspending(md))
+			if (__noflush_suspending(md) &&
+			    !WARN_ON_ONCE(dm_is_zone_write(md, bio)))
 				/* NOTE early return due to BLK_STS_DM_REQUEUE below */
 				bio_list_add_head(&md->deferred, io->orig_bio);
 			else
-				/* noflush suspend was interrupted. */
+				/*
+				 * noflush suspend was interrupted or this is
+				 * a write to a zoned target.
+				 */
 				io->status = BLK_STS_IOERR;
 			spin_unlock_irqrestore(&md->deferred_lock, flags);
 		}
@@ -947,7 +951,15 @@ static void clone_endio(struct bio *bio)
 		int r = endio(tio->ti, bio, &error);
 		switch (r) {
 		case DM_ENDIO_REQUEUE:
-			error = BLK_STS_DM_REQUEUE;
+			/*
+			 * Requeuing writes to a sequential zone of a zoned
+			 * target will break the sequential write pattern:
+			 * fail such IO.
+			 */
+			if (WARN_ON_ONCE(dm_is_zone_write(md, bio)))
+				error = BLK_STS_IOERR;
+			else
+				error = BLK_STS_DM_REQUEUE;
 			fallthrough;
 		case DM_ENDIO_DONE:
 			break;
diff --git a/drivers/md/dm.h b/drivers/md/dm.h
index fdf1536a4b62..39c243258e24 100644
--- a/drivers/md/dm.h
+++ b/drivers/md/dm.h
@@ -107,8 +107,13 @@ void dm_set_zones_restrictions(struct dm_table *t, struct request_queue *q);
 #ifdef CONFIG_BLK_DEV_ZONED
 int dm_blk_report_zones(struct gendisk *disk, sector_t sector,
 			unsigned int nr_zones, report_zones_cb cb, void *data);
+bool dm_is_zone_write(struct mapped_device *md, struct bio *bio);
 #else
 #define dm_blk_report_zones	NULL
+static inline bool dm_is_zone_write(struct mapped_device *md, struct bio *bio)
+{
+	return false;
+}
 #endif
 
 /*-----------------------------------------------------------------
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

