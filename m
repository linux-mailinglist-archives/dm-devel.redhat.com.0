Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1603B5BBC
	for <lists+dm-devel@lfdr.de>; Mon, 28 Jun 2021 11:53:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-Ml00ZaSsMx62PGWlyQGU-Q-1; Mon, 28 Jun 2021 05:53:06 -0400
X-MC-Unique: Ml00ZaSsMx62PGWlyQGU-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93EF6100C674;
	Mon, 28 Jun 2021 09:53:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A48453B;
	Mon, 28 Jun 2021 09:53:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1818B1806D0F;
	Mon, 28 Jun 2021 09:53:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15S9qlaR009210 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 05:52:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4CE851111C87; Mon, 28 Jun 2021 09:52:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48E631111C84
	for <dm-devel@redhat.com>; Mon, 28 Jun 2021 09:52:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5EC7800B35
	for <dm-devel@redhat.com>; Mon, 28 Jun 2021 09:52:43 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-99-How7ay5ROIqemamUEpgrAA-1; Mon, 28 Jun 2021 05:52:36 -0400
X-MC-Unique: How7ay5ROIqemamUEpgrAA-1
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCE3620251;
	Mon, 28 Jun 2021 09:52:33 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
	by imap.suse.de (Postfix) with ESMTP id 4B7AB11906;
	Mon, 28 Jun 2021 09:52:33 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
	id mOu7EOGb2WAqagAALh3uQQ
	(envelope-from <mwilck@suse.com>); Mon, 28 Jun 2021 09:52:33 +0000
From: mwilck@suse.com
To: Mike Snitzer <snitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Bart Van Assche <Bart.VanAssche@sandisk.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, dm-devel@redhat.com,
	Hannes Reinecke <hare@suse.de>
Date: Mon, 28 Jun 2021 11:52:10 +0200
Message-Id: <20210628095210.26249-4-mwilck@suse.com>
In-Reply-To: <20210628095210.26249-1-mwilck@suse.com>
References: <20210628095210.26249-1-mwilck@suse.com>
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
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15S9qlaR009210
X-loop: dm-devel@redhat.com
Cc: Daniel Wagner <dwagner@suse.de>, emilne@redhat.com,
	Martin Wilck <mwilck@suse.com>, linux-block@vger.kernel.org,
	nkoenig@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [PATCH v4 3/3] dm mpath: add CONFIG_DM_MULTIPATH_SG_IO -
	failover for SG_IO
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

In virtual deployments, SCSI passthrough over dm-multipath devices is a
common setup. The qemu "pr-helper" was specifically invented for it. I
believe that this is the most important real-world scenario for sending
SG_IO ioctls to device-mapper devices.

In this configuration, guests send SCSI IO to the hypervisor in the form of
SG_IO ioctls issued by qemu. But on the device-mapper level, these SCSI
ioctls aren't treated like regular IO. Until commit 2361ae595352 ("dm mpath:
switch paths in dm_blk_ioctl() code path"), no path switching was done at
all. Worse though, if an SG_IO call fails because of a path error,
dm-multipath doesn't retry the IO on a another path; rather, the failure is
passed back to the guest, and paths are not marked as faulty.  This is in
stark contrast with regular block IO of guests on dm-multipath devices, and
certainly comes as a surprise to users who switch to SCSI passthrough in
qemu. In general, users of dm-multipath devices would probably expect failover
to work at least in a basic way.

This patch fixes this by taking a special code path for SG_IO on dm-multipath
targets if CONFIG_DM_MULTIPATH_SG_IO is set.  Rather then just choosing a
single path, sending the IO to it, and failing to the caller if the IO on the
path failed, it retries the same IO on another path for certain error codes,
using blk_path_error() to determine if a retry would make sense for the given
error code. Moreover, it fails the path on which the path error occurred,
like regular block IO would.

If all paths in a multipath map are failed, the behavior depends on the
queue_if_no_path setting of the map. If it is off, multipath_prepare_ioctl()
fails with -EIO, and the search for a valid paths is stopped. If it is on,
the caller will block until either queuing is disabled (in which case IO will
error out) or at least one path is reinstated (in which case IO will resume).
This is as close to regular READ/WRITE as it gets.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 block/scsi_ioctl.c            |   5 +-
 drivers/md/Kconfig            |  11 ++++
 drivers/md/dm-core.h          |   5 ++
 drivers/md/dm-mpath.c         | 105 ++++++++++++++++++++++++++++++++++
 drivers/md/dm.c               |  26 ++++++++-
 include/linux/blkdev.h        |   2 +
 include/linux/device-mapper.h |   8 ++-
 7 files changed, 156 insertions(+), 6 deletions(-)

diff --git a/block/scsi_ioctl.c b/block/scsi_ioctl.c
index f226cac02e88..267de7cda82f 100644
--- a/block/scsi_ioctl.c
+++ b/block/scsi_ioctl.c
@@ -281,8 +281,8 @@ static int blk_complete_sghdr_rq(struct request *rq, struct sg_io_hdr *hdr,
 	return ret;
 }
 
-static int sg_io(struct request_queue *q, struct gendisk *bd_disk,
-		struct sg_io_hdr *hdr, fmode_t mode)
+int sg_io(struct request_queue *q, struct gendisk *bd_disk,
+	  struct sg_io_hdr *hdr, fmode_t mode)
 {
 	unsigned long start_time;
 	ssize_t ret = 0;
@@ -367,6 +367,7 @@ static int sg_io(struct request_queue *q, struct gendisk *bd_disk,
 	blk_put_request(rq);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(sg_io);
 
 /**
  * sg_scsi_ioctl  --  handle deprecated SCSI_IOCTL_SEND_COMMAND ioctl
diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index f2014385d48b..f28f29e3bd11 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -473,6 +473,17 @@ config DM_MULTIPATH_IOA
 
 	  If unsure, say N.
 
+config DM_MULTIPATH_SG_IO
+       bool "Retry SCSI generic I/O on multipath devices"
+       depends on DM_MULTIPATH && BLK_SCSI_REQUEST
+       help
+	 With this option, SCSI generic (SG) requests issued on multipath
+	 devices will behave similar to regular block I/O: upon failure,
+	 they are repeated on a different path, and the erroring device
+	 is marked as failed.
+
+	 If unsure, say N.
+
 config DM_DELAY
 	tristate "I/O delaying target"
 	depends on BLK_DEV_DM
diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index 5953ff2bd260..8bd8a8e3916e 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -189,4 +189,9 @@ extern atomic_t dm_global_event_nr;
 extern wait_queue_head_t dm_global_eventq;
 void dm_issue_global_event(void);
 
+int __dm_prepare_ioctl(struct mapped_device *md, int *srcu_idx,
+		       struct block_device **bdev,
+		       struct dm_target **target);
+void dm_unprepare_ioctl(struct mapped_device *md, int srcu_idx);
+
 #endif
diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index bced42f082b0..86518aec32b4 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -11,6 +11,7 @@
 #include "dm-bio-record.h"
 #include "dm-path-selector.h"
 #include "dm-uevent.h"
+#include "dm-core.h"
 
 #include <linux/blkdev.h>
 #include <linux/ctype.h>
@@ -26,6 +27,7 @@
 #include <scsi/scsi_dh.h>
 #include <linux/atomic.h>
 #include <linux/blk-mq.h>
+#include <scsi/sg.h>
 
 #define DM_MSG_PREFIX "multipath"
 #define DM_PG_INIT_DELAY_MSECS 2000
@@ -2129,6 +2131,106 @@ static int multipath_busy(struct dm_target *ti)
 	return busy;
 }
 
+#ifdef CONFIG_DM_MULTIPATH_SG_IO
+static int pgpath_sg_io_ioctl(struct block_device *bdev,
+			    struct sg_io_hdr *hdr, struct multipath *m,
+			    fmode_t mode)
+{
+	int rc;
+	blk_status_t sts;
+	struct priority_group *pg;
+	struct pgpath *pgpath;
+	char path_name[BDEVNAME_SIZE];
+
+	rc = sg_io(bdev->bd_disk->queue, bdev->bd_disk, hdr, mode);
+	DMDEBUG("SG_IO via %s: rc = %d D%02xH%02xM%02xS%02x",
+		bdevname(bdev, path_name), rc,
+		hdr->driver_status, hdr->host_status,
+		hdr->msg_status, hdr->status);
+
+	/*
+	 * Errors resulting from invalid parameters shouldn't be retried
+	 * on another path.
+	 */
+	switch (rc) {
+	case -ENOIOCTLCMD:
+	case -EFAULT:
+	case -EINVAL:
+	case -EPERM:
+		return rc;
+	default:
+		break;
+	}
+
+	sts = sg_io_to_blk_status(hdr);
+	if (sts == BLK_STS_OK)
+		return 0;
+	else if (!blk_path_error(sts))
+		return blk_status_to_errno(sts);
+
+	/* path error - fail the path */
+	list_for_each_entry(pg, &m->priority_groups, list) {
+		list_for_each_entry(pgpath, &pg->pgpaths, list) {
+			if (pgpath->path.dev->bdev == bdev)
+				fail_path(pgpath);
+		}
+	}
+
+	return -EAGAIN;
+}
+
+static int multipath_sg_io_ioctl(struct block_device *bdev, fmode_t mode,
+				 unsigned int cmd, unsigned long uarg)
+{
+	struct mapped_device *md = bdev->bd_disk->private_data;
+	void __user *arg = (void __user *)uarg;
+	struct sg_io_hdr hdr;
+	int rc;
+	bool suspended;
+	int retries = 5;
+
+	if (copy_from_user(&hdr, arg, sizeof(hdr)))
+		return -EFAULT;
+
+	if (hdr.interface_id != 'S')
+		return -EINVAL;
+
+	if (hdr.dxfer_len > (queue_max_hw_sectors(bdev->bd_disk->queue) << 9))
+		return -EIO;
+
+	do {
+		struct block_device *path_dev;
+		struct dm_target *tgt;
+		struct sg_io_hdr rhdr;
+		int srcu_idx;
+
+		suspended = false;
+		/* This will fail and break the loop if no valid paths found */
+		rc = __dm_prepare_ioctl(md, &srcu_idx, &path_dev, &tgt);
+		if (rc == -EAGAIN)
+			suspended = true;
+		else if (rc < 0)
+			DMERR("%s: failed to get path: %d", __func__, rc);
+		else {
+			/* Need to copy the sg_io_hdr, it may be modified */
+			rhdr = hdr;
+			rc = pgpath_sg_io_ioctl(path_dev, &rhdr,
+						tgt->private, mode);
+			if (rc == 0 && copy_to_user(arg, &rhdr, sizeof(rhdr)))
+				rc = -EFAULT;
+		}
+		dm_unprepare_ioctl(md, srcu_idx);
+		if (suspended) {
+			DMDEBUG("%s: suspended, retries = %d\n",
+				__func__, retries);
+			msleep(20);
+		}
+	} while (rc == -EAGAIN && (!suspended || retries-- > 0));
+
+	return rc;
+}
+#endif
+
 /*-----------------------------------------------------------------
  * Module setup
  *---------------------------------------------------------------*/
@@ -2153,6 +2255,9 @@ static struct target_type multipath_target = {
 	.prepare_ioctl = multipath_prepare_ioctl,
 	.iterate_devices = multipath_iterate_devices,
 	.busy = multipath_busy,
+#ifdef CONFIG_DM_MULTIPATH_SG_IO
+	.sg_io_ioctl = multipath_sg_io_ioctl,
+#endif
 };
 
 static int __init dm_multipath_init(void)
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index ca2aedd8ee7d..af15d2c132ce 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -29,6 +29,7 @@
 #include <linux/part_stat.h>
 #include <linux/blk-crypto.h>
 #include <linux/keyslot-manager.h>
+#include <scsi/sg.h>
 
 #define DM_MSG_PREFIX "core"
 
@@ -522,8 +523,9 @@ static int dm_blk_report_zones(struct gendisk *disk, sector_t sector,
 #define dm_blk_report_zones		NULL
 #endif /* CONFIG_BLK_DEV_ZONED */
 
-static int dm_prepare_ioctl(struct mapped_device *md, int *srcu_idx,
-			    struct block_device **bdev)
+int __dm_prepare_ioctl(struct mapped_device *md, int *srcu_idx,
+		       struct block_device **bdev,
+		       struct dm_target **target)
 {
 	struct dm_target *tgt;
 	struct dm_table *map;
@@ -553,13 +555,24 @@ static int dm_prepare_ioctl(struct mapped_device *md, int *srcu_idx,
 		goto retry;
 	}
 
+	if (r >= 0 && target)
+		*target = tgt;
+
 	return r;
 }
+EXPORT_SYMBOL_GPL(__dm_prepare_ioctl);
 
-static void dm_unprepare_ioctl(struct mapped_device *md, int srcu_idx)
+static int dm_prepare_ioctl(struct mapped_device *md, int *srcu_idx,
+			    struct block_device **bdev)
+{
+	return __dm_prepare_ioctl(md, srcu_idx, bdev, NULL);
+}
+
+void dm_unprepare_ioctl(struct mapped_device *md, int srcu_idx)
 {
 	dm_put_live_table(md, srcu_idx);
 }
+EXPORT_SYMBOL_GPL(dm_unprepare_ioctl);
 
 static int dm_blk_ioctl(struct block_device *bdev, fmode_t mode,
 			unsigned int cmd, unsigned long arg)
@@ -567,6 +580,13 @@ static int dm_blk_ioctl(struct block_device *bdev, fmode_t mode,
 	struct mapped_device *md = bdev->bd_disk->private_data;
 	int r, srcu_idx;
 
+#ifdef CONFIG_DM_MULTIPATH_SG_IO
+	if (cmd == SG_IO && md->immutable_target &&
+	    md->immutable_target->type->sg_io_ioctl)
+		return md->immutable_target->type->sg_io_ioctl(bdev, mode,
+							       cmd, arg);
+#endif
+
 	r = dm_prepare_ioctl(md, &srcu_idx, &bdev);
 	if (r < 0)
 		goto out;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 5da03edf125c..96eaf1edd7b0 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -923,6 +923,8 @@ extern int scsi_cmd_ioctl(struct request_queue *, struct gendisk *, fmode_t,
 			  unsigned int, void __user *);
 extern int sg_scsi_ioctl(struct request_queue *, struct gendisk *, fmode_t,
 			 struct scsi_ioctl_command __user *);
+extern int sg_io(struct request_queue *q, struct gendisk *gd,
+		 struct sg_io_hdr *hdr, fmode_t mode);
 extern int get_sg_io_hdr(struct sg_io_hdr *hdr, const void __user *argp);
 extern int put_sg_io_hdr(const struct sg_io_hdr *hdr, void __user *argp);
 
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index ff700fb6ce1d..c94ae6ee81b8 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -151,6 +151,10 @@ typedef size_t (*dm_dax_copy_iter_fn)(struct dm_target *ti, pgoff_t pgoff,
 		void *addr, size_t bytes, struct iov_iter *i);
 typedef int (*dm_dax_zero_page_range_fn)(struct dm_target *ti, pgoff_t pgoff,
 		size_t nr_pages);
+
+typedef int (*dm_sg_io_ioctl_fn)(struct block_device *bdev, fmode_t mode,
+				 unsigned int cmd, unsigned long uarg);
+
 #define PAGE_SECTORS (PAGE_SIZE / 512)
 
 void dm_error(const char *message);
@@ -204,7 +208,9 @@ struct target_type {
 	dm_dax_copy_iter_fn dax_copy_from_iter;
 	dm_dax_copy_iter_fn dax_copy_to_iter;
 	dm_dax_zero_page_range_fn dax_zero_page_range;
-
+#ifdef CONFIG_DM_MULTIPATH_SG_IO
+	dm_sg_io_ioctl_fn sg_io_ioctl;
+#endif
 	/* For internal device-mapper use. */
 	struct list_head list;
 };
-- 
2.32.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

