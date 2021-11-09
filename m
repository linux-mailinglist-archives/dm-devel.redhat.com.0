Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC044A9E3
	for <lists+dm-devel@lfdr.de>; Tue,  9 Nov 2021 10:00:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-NsrMA7GKOuaj9rZ3ypLnHA-1; Tue, 09 Nov 2021 04:00:44 -0500
X-MC-Unique: NsrMA7GKOuaj9rZ3ypLnHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0196C101799C;
	Tue,  9 Nov 2021 09:00:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5157108C9;
	Tue,  9 Nov 2021 09:00:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F7D01832DD4;
	Tue,  9 Nov 2021 09:00:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A98xXdw017424 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Nov 2021 03:59:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 92B134047279; Tue,  9 Nov 2021 08:59:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E8144047272
	for <dm-devel@redhat.com>; Tue,  9 Nov 2021 08:59:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 777B5811E76
	for <dm-devel@redhat.com>; Tue,  9 Nov 2021 08:59:33 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-502-bfNzBeeTOZSS6sz5G9sEmw-1; Tue, 09 Nov 2021 03:59:30 -0500
X-MC-Unique: bfNzBeeTOZSS6sz5G9sEmw-1
Received: from [2001:4bb8:19a:7ee7:fb46:2fe1:8652:d9d4] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMZD-000ryI-IK; Tue, 09 Nov 2021 08:33:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Date: Tue,  9 Nov 2021 09:32:43 +0100
Message-Id: <20211109083309.584081-4-hch@lst.de>
In-Reply-To: <20211109083309.584081-1-hch@lst.de>
References: <20211109083309.584081-1-hch@lst.de>
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
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
	linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>
Subject: [dm-devel] [PATCH 03/29] dax: remove CONFIG_DAX_DRIVER
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

CONFIG_DAX_DRIVER only selects CONFIG_DAX now, so remove it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/dax/Kconfig        | 4 ----
 drivers/nvdimm/Kconfig     | 2 +-
 drivers/s390/block/Kconfig | 2 +-
 fs/fuse/Kconfig            | 2 +-
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/dax/Kconfig b/drivers/dax/Kconfig
index d2834c2cfa10d..954ab14ba7778 100644
--- a/drivers/dax/Kconfig
+++ b/drivers/dax/Kconfig
@@ -1,8 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config DAX_DRIVER
-	select DAX
-	bool
-
 menuconfig DAX
 	tristate "DAX: direct access to differentiated memory"
 	select SRCU
diff --git a/drivers/nvdimm/Kconfig b/drivers/nvdimm/Kconfig
index b7d1eb38b27d4..347fe7afa5830 100644
--- a/drivers/nvdimm/Kconfig
+++ b/drivers/nvdimm/Kconfig
@@ -22,7 +22,7 @@ if LIBNVDIMM
 config BLK_DEV_PMEM
 	tristate "PMEM: Persistent memory block device support"
 	default LIBNVDIMM
-	select DAX_DRIVER
+	select DAX
 	select ND_BTT if BTT
 	select ND_PFN if NVDIMM_PFN
 	help
diff --git a/drivers/s390/block/Kconfig b/drivers/s390/block/Kconfig
index d0416dbd0cd81..e3710a762abae 100644
--- a/drivers/s390/block/Kconfig
+++ b/drivers/s390/block/Kconfig
@@ -5,7 +5,7 @@ comment "S/390 block device drivers"
 config DCSSBLK
 	def_tristate m
 	select FS_DAX_LIMITED
-	select DAX_DRIVER
+	select DAX
 	prompt "DCSSBLK support"
 	depends on S390 && BLOCK
 	help
diff --git a/fs/fuse/Kconfig b/fs/fuse/Kconfig
index 40ce9a1c12e5d..038ed0b9aaa5d 100644
--- a/fs/fuse/Kconfig
+++ b/fs/fuse/Kconfig
@@ -45,7 +45,7 @@ config FUSE_DAX
 	select INTERVAL_TREE
 	depends on VIRTIO_FS
 	depends on FS_DAX
-	depends on DAX_DRIVER
+	depends on DAX
 	help
 	  This allows bypassing guest page cache and allows mapping host page
 	  cache directly in guest address space.
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

