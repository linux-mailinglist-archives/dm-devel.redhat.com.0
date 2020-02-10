Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 796F4157DDD
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 15:54:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581346461;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9EYdy6a1Etoe/EuNsuuMevPYyp3xEV1PgnTkkWi/KmA=;
	b=N0OX5RVwxqcLUjz0zRqBKJsumLQeCkJoiM8tbW/tjbu5D1tREYm1ykFN4rghC2UuH8R2Kz
	lT1W1pLklEfCcn0rPJOrUuFy/0Lt/sySp+gDHLTWJBMBiyYnOSAsMRwJ4fzCEaqSznapn7
	0BWw8y+TQZwx82e/IqWM1Nb9x9O9G9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-GRwmjz8LNFmTu3QPYZcc7g-1; Mon, 10 Feb 2020 09:54:19 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94D8F107ACCA;
	Mon, 10 Feb 2020 14:54:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F9D189F1B;
	Mon, 10 Feb 2020 14:54:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2ADCF183269C;
	Mon, 10 Feb 2020 14:54:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AEs7gM019332 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 09:54:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22FA016D20; Mon, 10 Feb 2020 14:54:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (ovpn-117-113.ams2.redhat.com [10.36.117.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6884326FCF;
	Mon, 10 Feb 2020 14:53:58 +0000 (UTC)
From: Heinz Mauelshagen <heinzm@redhat.com>
To: dm-devel@redhat.com
Date: Mon, 10 Feb 2020 15:53:57 +0100
Message-Id: <55d8319f6ca77567a86002c447a614291e185766.1581346359.git.heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: awalsh@redhat.com, corwin@redhat.com, snitzer@redhat.com
Subject: [dm-devel] [PATCH] dm ebs: new block size emulating target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: GRwmjz8LNFmTu3QPYZcc7g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This new target is similar to the linear target except that it emulates
a smaller logical block size on devices with larger ones.  It's main
purpose is to emulate 512 byte sectors on 4K native disks (i.e. 512e).

See Documentaiton/admn-guide/device-mapper/dm-ebs.rst for details.

Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
---
 .../admin-guide/device-mapper/dm-ebs.rst      |  47 ++
 drivers/md/Kconfig                            |   8 +
 drivers/md/Makefile                           |   2 +
 drivers/md/dm-ebs-target.c                    | 411 ++++++++++++++++++
 4 files changed, 468 insertions(+)
 create mode 100644 Documentation/admin-guide/device-mapper/dm-ebs.rst
 create mode 100644 drivers/md/dm-ebs-target.c

diff --git a/Documentation/admin-guide/device-mapper/dm-ebs.rst b/Documentation/admin-guide/device-mapper/dm-ebs.rst
new file mode 100644
index 000000000000..bc79e7860a5d
--- /dev/null
+++ b/Documentation/admin-guide/device-mapper/dm-ebs.rst
@@ -0,0 +1,47 @@
+======
+dm-ebs
+======
+
+This target is similar to the linear target except that it emulates
+smaller logical block size on devices with larger ones.   It's main
+purpose is to emulate 512 byte sectors on 4K native disks (i.e 512e).
+
+Supported emulated logical block sizes 512, 1024, 2048 and 4096.
+
+
+Table parameters
+----------------
+  <dev path> <offset> <emulated sectors> [<underlying sectors>]
+
+Mandatory parameters:
+
+    <dev path>:
+        Full pathname to the underlying block-device,
+        or a "major:minor" device-number.
+    <offset>:
+        Starting sector within the device;
+        has to be a multiple of <emulated sectors>.
+    <emulated sectors>:
+        Number of sectors defining the logical block size to be emulated;
+        1, 2, 4, 8 sectors of 512 bytes supported.
+
+Optional parameter:
+
+    <underyling sectors>:
+        Number of sectors defining the logical block size of <dev path>.
+        1, 2, 4, 8 supported, e.g. 8 = emulate 8 sectors of 512 bytes = 4KiB.
+        If not provided, the logical block size of <dev path> will be used.
+
+
+Examples:
+
+Emulate 1 sector = 512 bytes logical block size on /dev/sda starting at
+offset 1024 sectors with underlying devices block size automatically set:
+
+ebs /dev/sda 1024 1
+
+Emulate 2 sector = 1KiB logical block size on /dev/sda starting at
+offset 128 sectors, enforce 2KiB underlying device block size.
+This presumes 2KiB logical blocksize on /dev/sda or less to work:
+
+ebs /dev/sda 128 2 4
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index d6d5ab23c088..392974a2999d 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -336,6 +336,14 @@ config DM_WRITECACHE
 	   The writecache target doesn't cache reads because reads are supposed
 	   to be cached in standard RAM.
 
+config DM_EBS
+       tristate "Emulated block size target (EXPERIMENTAL)"
+       depends on BLK_DEV_DM
+       default n
+       ---help---
+	 dm-ebs emulates smaller logical block size on backing devices
+	 with larger ones (e.g. 512 byte sectors on 4K native disks).
+
 config DM_ERA
        tristate "Era target (EXPERIMENTAL)"
        depends on BLK_DEV_DM
diff --git a/drivers/md/Makefile b/drivers/md/Makefile
index d91a7edcd2ab..9a2d673f94bc 100644
--- a/drivers/md/Makefile
+++ b/drivers/md/Makefile
@@ -17,6 +17,7 @@ dm-thin-pool-y	+= dm-thin.o dm-thin-metadata.o
 dm-cache-y	+= dm-cache-target.o dm-cache-metadata.o dm-cache-policy.o \
 		    dm-cache-background-tracker.o
 dm-cache-smq-y   += dm-cache-policy-smq.o
+dm-ebs-y	+= dm-ebs-target.o
 dm-era-y	+= dm-era-target.o
 dm-clone-y	+= dm-clone-target.o dm-clone-metadata.o
 dm-verity-y	+= dm-verity-target.o
@@ -65,6 +66,7 @@ obj-$(CONFIG_DM_THIN_PROVISIONING)	+= dm-thin-pool.o
 obj-$(CONFIG_DM_VERITY)		+= dm-verity.o
 obj-$(CONFIG_DM_CACHE)		+= dm-cache.o
 obj-$(CONFIG_DM_CACHE_SMQ)	+= dm-cache-smq.o
+obj-$(CONFIG_DM_EBS)		+= dm-ebs.o
 obj-$(CONFIG_DM_ERA)		+= dm-era.o
 obj-$(CONFIG_DM_CLONE)		+= dm-clone.o
 obj-$(CONFIG_DM_LOG_WRITES)	+= dm-log-writes.o
diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
new file mode 100644
index 000000000000..913c646feea9
--- /dev/null
+++ b/drivers/md/dm-ebs-target.c
@@ -0,0 +1,411 @@
+/*
+ * Copyright (C) 2020 Red Hat GmbH
+ *
+ * This file is released under the GPL.
+ *
+ * Device-mapper target to emulate smaller logical block
+ * size on backing devices exposing (natively) larger ones.
+ *
+ * E.g. 512 byte sector emultaion on 4K native disks.
+ */
+
+#include "dm.h"
+#include <linux/module.h>
+#include <linux/workqueue.h>
+#include <linux/dm-bufio.h>
+
+#define DM_MSG_PREFIX "ebs"
+
+static void ebs_dtr(struct dm_target *ti);
+
+/* Emulated block size context. */
+struct ebs_c {
+	struct dm_dev *dev;
+	struct dm_bufio_client *bufio;
+	struct work_struct ws;
+	struct workqueue_struct *wq;
+	struct bio_list bios_in;
+	spinlock_t lock; /* Guard bios_in list above */
+	sector_t start;
+	unsigned int ebs;
+	unsigned int ubs;
+	unsigned char shift;
+	unsigned short ubs_set:1;
+};
+
+static sector_t __sector_to_block(struct ebs_c *ec, sector_t sector)
+{
+	return sector >> ec->shift;
+}
+
+static sector_t __block_mod(sector_t sector, unsigned int bs)
+{
+	return sector & (bs - 1);
+
+}
+
+/* Return number of blocks for a bio */
+static unsigned int __nr_blocks(struct ebs_c *ec, struct bio *bio)
+{
+	sector_t end_sector = __block_mod(bio->bi_iter.bi_sector, ec->ubs) + bio_sectors(bio);
+
+	return __sector_to_block(ec, end_sector) + __block_mod(end_sector, ec->ubs) ? 1 : 0;
+}
+
+static bool __ebs_check_bs(unsigned int bs)
+{
+	return bs && is_power_of_2(bs) && to_bytes(bs) <= PAGE_SIZE;
+}
+
+/* READ/WRITE bio vector: copy blocks between bufio blocks and bio vector's (partial/overlapping) pages. */
+/* FIXME: use async_memcpy() ? */
+static int __ebs_rw_bvec(struct ebs_c *ec, int rw, struct bio_vec *bv, struct bvec_iter *iter)
+{
+	int r = 0;
+	unsigned char *ba, *pa = page_address(bv->bv_page) + bv->bv_offset;
+	unsigned int cur_len;
+	unsigned int bv_len = bv->bv_len;
+	unsigned int buf_off = to_bytes(__block_mod(iter->bi_sector, ec->ubs));
+	sector_t block = __sector_to_block(ec, iter->bi_sector);
+	struct dm_buffer *b;
+
+	if (!bv->bv_page || !bv_len)
+		return -EIO;
+
+	/* Handle overlapping page <-> blocks */
+	while (bv_len) {
+		cur_len = min(dm_bufio_get_block_size(ec->bufio) - buf_off, bv_len);
+
+		/* Avoid reading for writes in case bio vector's page overwrites block completely. */
+		if (rw == READ || buf_off || bv_len < dm_bufio_get_block_size(ec->bufio))
+			ba = dm_bufio_read(ec->bufio, block, &b);
+		else
+			ba = dm_bufio_new(ec->bufio, block, &b);
+
+		if (unlikely(IS_ERR(ba)))
+			r = PTR_ERR(ba); /* Carry on with next buffer if any but return error. */
+		else {
+			/* Copy data to/from bio to buffer if read/new was successful above. */
+			ba += buf_off;
+			if (rw == READ)
+				memcpy(pa, ba, cur_len);
+			else {
+				memcpy(ba, pa, cur_len);
+				dm_bufio_mark_partial_buffer_dirty(b, buf_off, buf_off + cur_len);
+			}
+
+			dm_bufio_release(b);
+		}
+
+		pa += cur_len;
+		bv_len -= cur_len;
+		buf_off = 0;
+		block++;
+	}
+
+	return r;
+}
+
+/* READ/WRITE: iterate bio vector's copying between (partial) pages and bufio blocks. */
+static int __ebs_rw_bio(struct ebs_c *ec, int rw, struct bio *bio)
+{
+	int r = 0, rr;
+	struct bio_vec bv;
+	struct bvec_iter iter;
+
+	bio_for_each_bvec(bv, bio, iter) {
+		rr = __ebs_rw_bvec(ec, rw, &bv, &iter);
+		if (rr)
+			r = rr;
+	}
+
+	return r;
+}
+
+/* 'Discard' blocks, i.e. release them from the bufio cache. */
+static int __ebs_forget_bio(struct ebs_c *ec, struct bio *bio)
+{
+	sector_t end = bio_end_sector(bio), sector;
+
+	for (sector = bio->bi_iter.bi_sector; sector < end; sector += ec->ubs)
+		dm_bufio_forget(ec->bufio, __sector_to_block(ec, sector));
+
+	return 0;
+}
+
+/* Worker funtion to process incoming bios. */
+static void __ebs_process_bios(struct work_struct *ws)
+{
+	int r;
+	bool write = false;
+	struct ebs_c *ec = container_of(ws, struct ebs_c, ws);
+	struct bio *bio;
+	struct bio_list bios;
+
+	bio_list_init(&bios);
+
+	spin_lock_irq(&ec->lock);
+	bios = ec->bios_in;
+	bio_list_init(&ec->bios_in);
+	spin_unlock_irq(&ec->lock);
+
+	bio_list_for_each(bio, &bios)
+		if (bio_op(bio) == REQ_OP_READ)
+			dm_bufio_prefetch(ec->bufio, __sector_to_block(ec, bio->bi_iter.bi_sector), __nr_blocks(ec, bio));
+
+	bio_list_for_each(bio, &bios) {
+		r = -EIO;
+
+		if (bio_op(bio) == REQ_OP_READ)
+			r = __ebs_rw_bio(ec, READ, bio);
+		else if (bio_op(bio) == REQ_OP_WRITE) {
+			write = true;
+			r = __ebs_rw_bio(ec, WRITE, bio);
+		} else if (bio_op(bio) == REQ_OP_DISCARD)
+			/* FIXME: call dm_bufio_discard_buffers() once upstream. */
+			r = __ebs_forget_bio(ec, bio);
+
+		if (r)
+			bio->bi_status = BLK_STS_IOERR;
+	}
+
+	r = write ? dm_bufio_write_dirty_buffers(ec->bufio) : 0;
+
+	while ((bio = bio_list_pop(&bios))) {
+		/* FIXME: any other request is just endioed for now. */
+		if (unlikely(r && bio_op(bio) == REQ_OP_WRITE))
+			bio_io_error(bio);
+		else
+			bio_endio(bio);
+	}
+}
+
+/*
+ * Construct an emulated block size mapping: <dev_path> <offset> <ebs> [<ubs>]
+ *
+ * <dev_path>: path of the underlying device
+ * <offset>: offset in 512 bytes sectors into <dev_path>
+ * <ebs>: emulated block size in units of 512 bytes exposed to the upper layer
+ * i[<ubs>]: underlying block size in units of 512 bytes imposed on the lower layer;
+ * 	     optional, if not supplied, retrieve logical block size from underlying device
+ */
+static int ebs_ctr(struct dm_target *ti, unsigned int argc, char **argv)
+{
+	int r;
+	unsigned short tmp1;
+	unsigned long long tmp;
+	char dummy;
+	struct ebs_c *ec;
+
+	if (argc < 3 || argc > 4) {
+		ti->error = "Invalid argument count";
+		return -EINVAL;
+	}
+
+	ec = ti->private = kzalloc(sizeof(*ec), GFP_KERNEL);
+	if (!ec) {
+		ti->error = "Cannot allocate ebs context";
+		return -ENOMEM;
+	}
+
+	r = -EINVAL;
+	if (sscanf(argv[1], "%llu%c", &tmp, &dummy) != 1 ||
+		   tmp != (sector_t)tmp ||
+		   (sector_t)tmp >= ti->len) {
+		ti->error = "Invalid device offset sector";
+		goto bad;
+	}
+	ec->start = tmp;
+
+	if (sscanf(argv[2], "%hu%c", &tmp1, &dummy) != 1 || !__ebs_check_bs(tmp1)) {
+		ti->error = "Invalid emulated block size";
+		goto bad;
+	}
+	ec->ebs = tmp1;
+
+	if (argc > 3) {
+		if (sscanf(argv[3], "%hu%c", &tmp1, &dummy) != 1 || !__ebs_check_bs(tmp1)) {
+			ti->error = "Invalid underlying block size";
+			goto bad;
+		}
+		ec->ubs = tmp1;
+		ec->ubs_set = true;
+	} else
+		ec->ubs_set = false;
+
+	r = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table), &ec->dev);
+	if (r) {
+		ti->error = "Device lookup failed";
+		ec->dev = NULL;
+		goto bad;
+	}
+
+	r = -EINVAL;
+	if (!ec->ubs_set) {
+		ec->ubs = to_sector(bdev_logical_block_size(ec->dev->bdev));
+		if (!__ebs_check_bs(ec->ubs)) {
+			ti->error = "Invalid retrieved underlying block size";
+			goto bad;
+		}
+	}
+
+	if (!ec->ubs_set && ec->ebs == ec->ubs)
+		DMERR("Emulation superfluous: emulated equal to underlying block size");
+
+	if (__block_mod(ec->start, ec->ubs)) {
+		ti->error = "Device offset must be multiple of underlying block size";
+		goto bad;
+	}
+
+	ec->bufio = dm_bufio_client_create(ec->dev->bdev, to_bytes(ec->ubs), 1, 0, NULL, NULL);
+	if (IS_ERR(ec->bufio)) {
+		ti->error = "Cannot create dm bufio client";
+		r = PTR_ERR(ec->bufio);
+		ec->bufio = NULL;
+		goto bad;
+	}
+
+	ec->wq = alloc_ordered_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM);
+	if (!ec->wq) {
+		ti->error = "Cannot create dm-" DM_MSG_PREFIX " workqueue";
+		r = -ENOMEM;
+		goto bad;
+	}
+
+	ec->shift = __ffs(ec->ubs);
+	INIT_WORK(&ec->ws, &__ebs_process_bios);
+	bio_list_init(&ec->bios_in);
+	spin_lock_init(&ec->lock);
+
+	ti->num_flush_bios = 1;
+	ti->num_discard_bios = 1;
+	ti->num_secure_erase_bios = 0;
+	ti->num_write_same_bios = 0;
+	ti->num_write_zeroes_bios = 0;
+	return 0;
+bad:
+	ebs_dtr(ti);
+	return r;
+}
+
+static void ebs_dtr(struct dm_target *ti)
+{
+	struct ebs_c *ec = ti->private;
+
+	if (ec->wq)
+		destroy_workqueue(ec->wq);
+	if (ec->bufio)
+		dm_bufio_client_destroy(ec->bufio);
+	if (ec->dev)
+		dm_put_device(ti, ec->dev);
+	kfree(ec);
+}
+
+static int ebs_map(struct dm_target *ti, struct bio *bio)
+{
+	struct ebs_c *ec = ti->private;
+
+	bio_set_dev(bio, ec->dev->bdev);
+	bio->bi_iter.bi_sector = ec->start + dm_target_offset(ti, bio->bi_iter.bi_sector);
+
+	if (unlikely(bio->bi_opf & REQ_OP_FLUSH))
+		return DM_MAPIO_REMAPPED;
+
+	/* Only queue for bufio processing in case of partial or overlapping buffers -or- REMOVEME: superfluos emulation with ebs == ubs. */
+	if (likely(__block_mod(bio->bi_iter.bi_sector, ec->ubs) || __block_mod(bio_end_sector(bio), ec->ubs) || ec->ebs == ec->ubs)) {
+		spin_lock_irq(&ec->lock);
+		bio_list_add(&ec->bios_in, bio);
+		spin_unlock_irq(&ec->lock);
+
+		queue_work(ec->wq, &ec->ws);
+
+		return DM_MAPIO_SUBMITTED;
+	}
+
+	/* Forget any buffer content relative to this direct backing device I/O. */
+	__ebs_forget_bio(ec, bio);
+
+	return DM_MAPIO_REMAPPED;
+}
+
+static void ebs_status(struct dm_target *ti, status_type_t type,
+			  unsigned status_flags, char *result, unsigned maxlen)
+{
+	struct ebs_c *ec = (struct ebs_c *) ti->private;
+
+	switch (type) {
+	case STATUSTYPE_INFO:
+		*result = '\0';
+		break;
+	case STATUSTYPE_TABLE:
+		snprintf(result, maxlen, ec->ubs_set ? "%s %llu %u %u" : "%s %llu %u",
+			 ec->dev->name, (unsigned long long)ec->start, ec->ebs, ec->ubs);
+		break;
+	}
+}
+
+static int ebs_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
+{
+	struct ebs_c *ec = (struct ebs_c *) ti->private;
+	struct dm_dev *dev = ec->dev;
+
+	/*
+	 * Only pass ioctls through if the device sizes match exactly.
+	 */
+	*bdev = dev->bdev;
+	return !!(ec->start || ti->len != i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT);
+}
+
+static void ebs_io_hints(struct dm_target *ti, struct queue_limits *limits)
+{
+	struct ebs_c *ec = ti->private;
+
+	limits->logical_block_size = to_bytes(ec->ebs);
+	limits->physical_block_size = to_bytes(ec->ubs);
+	limits->alignment_offset = limits->physical_block_size;
+	blk_limits_io_min(limits, limits->logical_block_size);
+}
+
+static int ebs_iterate_devices(struct dm_target *ti,
+				  iterate_devices_callout_fn fn, void *data)
+{
+	struct ebs_c *ec = ti->private;
+
+	return fn(ti, ec->dev, ec->start, ti->len, data);
+}
+
+static struct target_type ebs_target = {
+	.name   = "ebs",
+	.version = {1, 0, 0},
+	.features = DM_TARGET_PASSES_INTEGRITY,
+	.module = THIS_MODULE,
+	.ctr    = ebs_ctr,
+	.dtr    = ebs_dtr,
+	.map    = ebs_map,
+	.status = ebs_status,
+	.io_hints = ebs_io_hints,
+	.prepare_ioctl = ebs_prepare_ioctl,
+	.iterate_devices = ebs_iterate_devices,
+};
+
+int __init dm_ebs_init(void)
+{
+	int r = dm_register_target(&ebs_target);
+
+	if (r < 0)
+		DMERR("register failed %d", r);
+
+	return r;
+}
+
+void dm_ebs_exit(void)
+{
+	dm_unregister_target(&ebs_target);
+}
+
+module_init(dm_ebs_init);
+module_exit(dm_ebs_exit);
+
+MODULE_AUTHOR("Heinz Mauelshagen <dm-devel@redhat.com>");
+MODULE_DESCRIPTION(DM_NAME " emmulated block size target");
+MODULE_LICENSE("GPL");
-- 
2.24.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

