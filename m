Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8FCC2597DA
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 18:20:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-ventJkLFMJuQB3xqsTxhbQ-1; Tue, 01 Sep 2020 12:20:15 -0400
X-MC-Unique: ventJkLFMJuQB3xqsTxhbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56D2F10ABDAD;
	Tue,  1 Sep 2020 16:20:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D83167EEA0;
	Tue,  1 Sep 2020 16:20:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC617183D021;
	Tue,  1 Sep 2020 16:20:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 081GJrwU029060 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Sep 2020 12:19:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA1332166BA3; Tue,  1 Sep 2020 16:19:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D57912166BA2
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 16:19:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFE43805C0E
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 16:19:51 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-138-xb4ZQnbzMz2pluja6MRczw-1; Tue, 01 Sep 2020 12:19:49 -0400
X-MC-Unique: xb4ZQnbzMz2pluja6MRczw-1
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8fc-0004RL-8h; Tue, 01 Sep 2020 15:58:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  1 Sep 2020 17:57:47 +0200
Message-Id: <20200901155748.2884-9-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, nbd@other.debian.org,
	virtualization@lists.linux-foundation.org, ceph-devel@vger.kernel.org
Subject: [dm-devel] [PATCH 8/9] nvdimm: simplify revalidate_disk handling
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The nvdimm block driver abuse revalidate_disk in a strange way, and
totally unrelated to what other drivers do.  Simplify this by just
calling nvdimm_revalidate_disk (which seems rather misnamed) from the
probe routines, as the additional bdev size revalidation is pointless
at this point, and remove the revalidate_disk methods given that
it can only be triggered from add_disk, which is right before the
manual calls.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvdimm/blk.c  | 3 +--
 drivers/nvdimm/btt.c  | 3 +--
 drivers/nvdimm/bus.c  | 9 +++------
 drivers/nvdimm/nd.h   | 2 +-
 drivers/nvdimm/pmem.c | 3 +--
 5 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index 1f718381a04553..22e5617b2cea14 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -226,7 +226,6 @@ static int nsblk_rw_bytes(struct nd_namespace_common *ndns,
 static const struct block_device_operations nd_blk_fops = {
 	.owner = THIS_MODULE,
 	.submit_bio =  nd_blk_submit_bio,
-	.revalidate_disk = nvdimm_revalidate_disk,
 };
 
 static void nd_blk_release_queue(void *q)
@@ -284,7 +283,7 @@ static int nsblk_attach_disk(struct nd_namespace_blk *nsblk)
 
 	set_capacity(disk, available_disk_size >> SECTOR_SHIFT);
 	device_add_disk(dev, disk, NULL);
-	revalidate_disk(disk);
+	nvdimm_check_and_set_ro(disk);
 	return 0;
 }
 
diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 0ff610e728ff6f..0d710140bf93be 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1513,7 +1513,6 @@ static const struct block_device_operations btt_fops = {
 	.submit_bio =		btt_submit_bio,
 	.rw_page =		btt_rw_page,
 	.getgeo =		btt_getgeo,
-	.revalidate_disk =	nvdimm_revalidate_disk,
 };
 
 static int btt_blk_init(struct btt *btt)
@@ -1558,7 +1557,7 @@ static int btt_blk_init(struct btt *btt)
 	set_capacity(btt->btt_disk, btt->nlba * btt->sector_size >> 9);
 	device_add_disk(&btt->nd_btt->dev, btt->btt_disk, NULL);
 	btt->nd_btt->size = btt->nlba * (u64)btt->sector_size;
-	revalidate_disk(btt->btt_disk);
+	nvdimm_check_and_set_ro(btt->btt_disk);
 
 	return 0;
 }
diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
index 955265656b96c7..2304c6183822e9 100644
--- a/drivers/nvdimm/bus.c
+++ b/drivers/nvdimm/bus.c
@@ -628,7 +628,7 @@ int __nd_driver_register(struct nd_device_driver *nd_drv, struct module *owner,
 }
 EXPORT_SYMBOL(__nd_driver_register);
 
-int nvdimm_revalidate_disk(struct gendisk *disk)
+void nvdimm_check_and_set_ro(struct gendisk *disk)
 {
 	struct device *dev = disk_to_dev(disk)->parent;
 	struct nd_region *nd_region = to_nd_region(dev->parent);
@@ -639,16 +639,13 @@ int nvdimm_revalidate_disk(struct gendisk *disk)
 	 * read-only if the disk is already read-only.
 	 */
 	if (disk_ro || nd_region->ro == disk_ro)
-		return 0;
+		return;
 
 	dev_info(dev, "%s read-only, marking %s read-only\n",
 			dev_name(&nd_region->dev), disk->disk_name);
 	set_disk_ro(disk, 1);
-
-	return 0;
-
 }
-EXPORT_SYMBOL(nvdimm_revalidate_disk);
+EXPORT_SYMBOL(nvdimm_check_and_set_ro);
 
 static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 		char *buf)
diff --git a/drivers/nvdimm/nd.h b/drivers/nvdimm/nd.h
index 85c1ae813ea318..72740108ba4206 100644
--- a/drivers/nvdimm/nd.h
+++ b/drivers/nvdimm/nd.h
@@ -361,7 +361,7 @@ u64 nd_region_interleave_set_altcookie(struct nd_region *nd_region);
 void nvdimm_bus_lock(struct device *dev);
 void nvdimm_bus_unlock(struct device *dev);
 bool is_nvdimm_bus_locked(struct device *dev);
-int nvdimm_revalidate_disk(struct gendisk *disk);
+void nvdimm_check_and_set_ro(struct gendisk *disk);
 void nvdimm_drvdata_release(struct kref *kref);
 void put_ndd(struct nvdimm_drvdata *ndd);
 int nd_label_reserve_dpa(struct nvdimm_drvdata *ndd);
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index fab29b514372d0..140cf3b9000c60 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -281,7 +281,6 @@ static const struct block_device_operations pmem_fops = {
 	.owner =		THIS_MODULE,
 	.submit_bio =		pmem_submit_bio,
 	.rw_page =		pmem_rw_page,
-	.revalidate_disk =	nvdimm_revalidate_disk,
 };
 
 static int pmem_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
@@ -501,7 +500,7 @@ static int pmem_attach_disk(struct device *dev,
 	if (devm_add_action_or_reset(dev, pmem_release_disk, pmem))
 		return -ENOMEM;
 
-	revalidate_disk(disk);
+	nvdimm_check_and_set_ro(disk);
 
 	pmem->bb_state = sysfs_get_dirent(disk_to_dev(disk)->kobj.sd,
 					  "badblocks");
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

