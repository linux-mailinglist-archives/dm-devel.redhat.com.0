Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1051926F582
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 07:50:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-Pf3hw4r6PtG0d3h5GS_1YA-1; Fri, 18 Sep 2020 01:50:21 -0400
X-MC-Unique: Pf3hw4r6PtG0d3h5GS_1YA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33B5E1891E81;
	Fri, 18 Sep 2020 05:50:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F746610F3;
	Fri, 18 Sep 2020 05:50:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14F5D183D040;
	Fri, 18 Sep 2020 05:49:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08I5naxx006700 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 01:49:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B26F92026F94; Fri, 18 Sep 2020 05:49:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADB502028DC0
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 05:49:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E3D988FBCE
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 05:49:34 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-566-hpH9_U7zN56Iv74jn0zAGA-1;
	Fri, 18 Sep 2020 01:49:29 -0400
X-MC-Unique: hpH9_U7zN56Iv74jn0zAGA-1
IronPort-SDR: CiMZWyuHBisRVqgMnyQEgO6Pw0p/gFptWEsayhSr6HtDb7juUhU25NixoBu4V8BzmSw1WsM/Hl
	8vqpQhRMAbgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="139365481"
X-IronPort-AV: E=Sophos;i="5.77,273,1596524400"; d="scan'208";a="139365481"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	17 Sep 2020 22:48:23 -0700
IronPort-SDR: GicbUj+0BIsf+0SPSiw/Cz69GqY/w+rt5x1H733jaMHzxCjrfqS0A9V72u8KVzBwj1DyEJSbZO
	L8IrY05x0srw==
X-IronPort-AV: E=Sophos;i="5.77,273,1596524400"; d="scan'208";a="344628508"
Received: from dwillia2-desk3.jf.intel.com (HELO
	dwillia2-desk3.amr.corp.intel.com) ([10.54.39.16])
	by fmsmga003-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2020 22:48:22 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: linux-nvdimm@lists.01.org
Date: Thu, 17 Sep 2020 22:30:03 -0700
Message-ID: <160040692945.25320.13233625491405115889.stgit@dwillia2-desk3.amr.corp.intel.com>
User-Agent: StGit/0.18-3-g996c
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, snitzer@redhat.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, dm-devel@redhat.com,
	Adrian Huang <ahuang12@lenovo.com>, mpatocka@redhat.com,
	ira.weiny@intel.com
Subject: [dm-devel] [PATCH v2] dm: Call proper helper to determine dax
	support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Jan Kara <jack@suse.cz>

DM was calling generic_fsdax_supported() to determine whether a device
referenced in the DM table supports DAX. However this is a helper for "leaf" device drivers so that
they don't have to duplicate common generic checks. High level code
should call dax_supported() helper which that calls into appropriate
helper for the particular device. This problem manifested itself as
kernel messages:

dm-3: error: dax access failed (-95)

when lvm2-testsuite run in cases where a DM device was stacked on top of
another DM device.

Fixes: 7bf7eac8d648 ("dax: Arrange for dax_supported check to span multiple devices")
Cc: <stable@vger.kernel.org>
Tested-by: Adrian Huang <ahuang12@lenovo.com>
Signed-off-by: Jan Kara <jack@suse.cz>
Acked-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
Changes since v1 [1]:
- Add missing dax_read_lock() around dax_supported()

[1]: http://lore.kernel.org/r/20200916151445.450-1-jack@suse.cz

 drivers/dax/super.c   |    4 ++++
 drivers/md/dm-table.c |   10 +++++++---
 include/linux/dax.h   |   11 +++++++++--
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index e5767c83ea23..b6284c5cae0a 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -325,11 +325,15 @@ EXPORT_SYMBOL_GPL(dax_direct_access);
 bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
 		int blocksize, sector_t start, sector_t len)
 {
+	if (!dax_dev)
+		return false;
+
 	if (!dax_alive(dax_dev))
 		return false;
 
 	return dax_dev->ops->dax_supported(dax_dev, bdev, blocksize, start, len);
 }
+EXPORT_SYMBOL_GPL(dax_supported);
 
 size_t dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
 		size_t bytes, struct iov_iter *i)
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 5edc3079e7c1..229f461e7def 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -860,10 +860,14 @@ EXPORT_SYMBOL_GPL(dm_table_set_type);
 int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
 			sector_t start, sector_t len, void *data)
 {
-	int blocksize = *(int *) data;
+	int blocksize = *(int *) data, id;
+	bool rc;
 
-	return generic_fsdax_supported(dev->dax_dev, dev->bdev, blocksize,
-				       start, len);
+	id = dax_read_lock();
+	rc = dax_supported(dev->dax_dev, dev->bdev, blocksize, start, len);
+	dax_read_unlock(id);
+
+	return rc;
 }
 
 /* Check devices support synchronous DAX */
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 6904d4e0b2e0..9f916326814a 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -130,6 +130,8 @@ static inline bool generic_fsdax_supported(struct dax_device *dax_dev,
 	return __generic_fsdax_supported(dax_dev, bdev, blocksize, start,
 			sectors);
 }
+bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
+		int blocksize, sector_t start, sector_t len);
 
 static inline void fs_put_dax(struct dax_device *dax_dev)
 {
@@ -157,6 +159,13 @@ static inline bool generic_fsdax_supported(struct dax_device *dax_dev,
 	return false;
 }
 
+static inline bool dax_supported(struct dax_device *dax_dev,
+		struct block_device *bdev, int blocksize, sector_t start,
+		sector_t len)
+{
+	return false;
+}
+
 static inline void fs_put_dax(struct dax_device *dax_dev)
 {
 }
@@ -195,8 +204,6 @@ bool dax_alive(struct dax_device *dax_dev);
 void *dax_get_private(struct dax_device *dax_dev);
 long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
 		void **kaddr, pfn_t *pfn);
-bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
-		int blocksize, sector_t start, sector_t len);
 size_t dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
 		size_t bytes, struct iov_iter *i);
 size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

