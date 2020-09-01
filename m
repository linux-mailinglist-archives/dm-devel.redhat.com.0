Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B843D2597E2
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 18:20:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-RaaBo3DNN6ikTixDaUFuMQ-1; Tue, 01 Sep 2020 12:20:21 -0400
X-MC-Unique: RaaBo3DNN6ikTixDaUFuMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C178030BA;
	Tue,  1 Sep 2020 16:20:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7F3F7EB7D;
	Tue,  1 Sep 2020 16:20:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96CD4183D024;
	Tue,  1 Sep 2020 16:20:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 081GK9Rb029165 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Sep 2020 12:20:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E43CD1112856; Tue,  1 Sep 2020 16:20:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF4CF1112853
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 16:20:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C623A811E79
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 16:20:08 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-506-jNL60V3-OlKpWFY3PxpKAw-1; Tue, 01 Sep 2020 12:20:05 -0400
X-MC-Unique: jNL60V3-OlKpWFY3PxpKAw-1
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8fe-0004S0-Bi; Tue, 01 Sep 2020 15:58:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  1 Sep 2020 17:57:48 +0200
Message-Id: <20200901155748.2884-10-hch@lst.de>
In-Reply-To: <20200901155748.2884-1-hch@lst.de>
References: <20200901155748.2884-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, nbd@other.debian.org,
	virtualization@lists.linux-foundation.org, ceph-devel@vger.kernel.org
Subject: [dm-devel] [PATCH 9/9] block: remove revalidate_disk()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove the now unused helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.h       |  2 +-
 fs/block_dev.c        | 19 -------------------
 include/linux/genhd.h |  1 -
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/md/md.h b/drivers/md/md.h
index d9c4e6b7e9398d..f9e2ccdd22c478 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -397,7 +397,7 @@ struct mddev {
 	 * These locks are separate due to conflicting interactions
 	 * with bdev->bd_mutex.
 	 * Lock ordering is:
-	 *  reconfig_mutex -> bd_mutex : e.g. do_md_run -> revalidate_disk
+	 *  reconfig_mutex -> bd_mutex
 	 *  bd_mutex -> open_mutex:  e.g. __blkdev_get -> md_open
 	 */
 	struct mutex			open_mutex;
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 85f013315d48b3..0771836d0220bd 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1339,25 +1339,6 @@ void revalidate_disk_size(struct gendisk *disk, bool verbose)
 }
 EXPORT_SYMBOL(revalidate_disk_size);
 
-/**
- * revalidate_disk - wrapper for lower-level driver's revalidate_disk call-back
- * @disk: struct gendisk to be revalidated
- *
- * This routine is a wrapper for lower-level driver's revalidate_disk
- * call-backs.  It is used to do common pre and post operations needed
- * for all revalidate_disk operations.
- */
-int revalidate_disk(struct gendisk *disk)
-{
-	int ret = 0;
-
-	if (disk->fops->revalidate_disk)
-		ret = disk->fops->revalidate_disk(disk);
-	revalidate_disk_size(disk, ret == 0);
-	return ret;
-}
-EXPORT_SYMBOL(revalidate_disk);
-
 /*
  * This routine checks whether a removable media has been changed,
  * and invalidates all buffer-cache-entries in that case. This
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index c340b392452ce6..2cdc41a3fb6a57 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -372,7 +372,6 @@ extern void blk_unregister_region(dev_t devt, unsigned long range);
 int register_blkdev(unsigned int major, const char *name);
 void unregister_blkdev(unsigned int major, const char *name);
 
-int revalidate_disk(struct gendisk *disk);
 void revalidate_disk_size(struct gendisk *disk, bool verbose);
 int check_disk_change(struct block_device *bdev);
 int __invalidate_device(struct block_device *bdev, bool kill_dirty);
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

