Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F17DF41DCF
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 09:32:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34B72C18B2DD;
	Wed, 12 Jun 2019 07:32:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCB5A17509;
	Wed, 12 Jun 2019 07:32:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E51CD206D1;
	Wed, 12 Jun 2019 07:32:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BGgHp4022180 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 12:42:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D271A4647E; Tue, 11 Jun 2019 16:42:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-60.sin2.redhat.com
	[10.67.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C58AB5D721;
	Tue, 11 Jun 2019 16:41:40 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: dm-devel@redhat.com, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-acpi@vger.kernel.org,
	qemu-devel@nongnu.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org
Date: Tue, 11 Jun 2019 22:08:00 +0530
Message-Id: <20190611163802.25352-6-pagupta@redhat.com>
In-Reply-To: <20190611163802.25352-1-pagupta@redhat.com>
References: <20190611163802.25352-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 12 Jun 2019 03:28:18 -0400
Cc: pagupta@redhat.com, rdunlap@infradead.org, jack@suse.cz, snitzer@redhat.com,
	mst@redhat.com, jasowang@redhat.com, david@fromorbit.com,
	lcapitulino@redhat.com, adilger.kernel@dilger.ca,
	zwisler@kernel.org, aarcange@redhat.com, dave.jiang@intel.com,
	jstaron@google.com, darrick.wong@oracle.com,
	vishal.l.verma@intel.com, david@redhat.com, willy@infradead.org,
	hch@infradead.org, jmoyer@redhat.com, nilal@redhat.com,
	lenb@kernel.org, kilobyte@angband.pl, riel@surriel.com,
	yuval.shaia@oracle.com, stefanha@redhat.com, pbonzini@redhat.com,
	dan.j.williams@intel.com, kwolf@redhat.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, cohuck@redhat.com,
	rjw@rjwysocki.net, imammedo@redhat.com
Subject: [dm-devel] [PATCH v12 5/7] dax: check synchronous mapping is
	supported
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 12 Jun 2019 07:32:21 +0000 (UTC)

This patch introduces 'daxdev_mapping_supported' helper
which checks if 'MAP_SYNC' is supported with filesystem
mapping. It also checks if corresponding dax_device is
synchronous. Virtio pmem device is asynchronous and
does not not support VM_SYNC.

Suggested-by: Jan Kara <jack@suse.cz>
Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 include/linux/dax.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/dax.h b/include/linux/dax.h
index 2b106752b1b8..267251a394fa 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -42,6 +42,18 @@ void dax_write_cache(struct dax_device *dax_dev, bool wc);
 bool dax_write_cache_enabled(struct dax_device *dax_dev);
 bool dax_synchronous(struct dax_device *dax_dev);
 void set_dax_synchronous(struct dax_device *dax_dev);
+/*
+ * Check if given mapping is supported by the file / underlying device.
+ */
+static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
+					    struct dax_device *dax_dev)
+{
+	if (!(vma->vm_flags & VM_SYNC))
+		return true;
+	if (!IS_DAX(file_inode(vma->vm_file)))
+		return false;
+	return dax_synchronous(dax_dev);
+}
 #else
 static inline struct dax_device *dax_get_by_host(const char *host)
 {
@@ -69,6 +81,11 @@ static inline bool dax_write_cache_enabled(struct dax_device *dax_dev)
 {
 	return false;
 }
+static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
+				struct dax_device *dax_dev)
+{
+	return !(vma->vm_flags & VM_SYNC);
+}
 #endif
 
 struct writeback_control;
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
