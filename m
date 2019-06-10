Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 067C83B726
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jun 2019 16:20:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BACF3003E4F;
	Mon, 10 Jun 2019 14:19:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60307196AA;
	Mon, 10 Jun 2019 14:18:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC3624EA6C;
	Mon, 10 Jun 2019 14:18:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5A9B9Tc005535 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Jun 2019 05:11:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B43260C05; Mon, 10 Jun 2019 09:11:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-103.sin2.redhat.com
	[10.67.116.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C3D0160BF1;
	Mon, 10 Jun 2019 09:10:33 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: dm-devel@redhat.com, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-acpi@vger.kernel.org,
	qemu-devel@nongnu.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org
Date: Mon, 10 Jun 2019 14:37:27 +0530
Message-Id: <20190610090730.8589-5-pagupta@redhat.com>
In-Reply-To: <20190610090730.8589-1-pagupta@redhat.com>
References: <20190610090730.8589-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Jun 2019 10:16:23 -0400
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
Subject: [dm-devel] [PATCH v11 4/7] dm: enable synchronous dax
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 10 Jun 2019 14:20:03 +0000 (UTC)

 This patch sets dax device 'DAXDEV_SYNC' flag if all the target
 devices of device mapper support synchrononous DAX. If device
 mapper consists of both synchronous and asynchronous dax devices,
 we don't set 'DAXDEV_SYNC' flag.

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
---
 drivers/md/dm-table.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 350cf0451456..c5160d846fe6 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -890,10 +890,17 @@ static int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
 			start, len);
 }
 
+static int device_synchronous(struct dm_target *ti, struct dm_dev *dev,
+				       sector_t start, sector_t len, void *data)
+{
+	return dax_synchronous(dev->dax_dev);
+}
+
 bool dm_table_supports_dax(struct dm_table *t, int blocksize)
 {
 	struct dm_target *ti;
 	unsigned i;
+	bool dax_sync = true;
 
 	/* Ensure that all targets support DAX. */
 	for (i = 0; i < dm_table_get_num_targets(t); i++) {
@@ -906,7 +913,14 @@ bool dm_table_supports_dax(struct dm_table *t, int blocksize)
 		    !ti->type->iterate_devices(ti, device_supports_dax,
 			    &blocksize))
 			return false;
+
+		/* Check devices support synchronous DAX */
+		if (dax_sync &&
+		    !ti->type->iterate_devices(ti, device_synchronous, NULL))
+			dax_sync = false;
 	}
+	if (dax_sync)
+		set_dax_synchronous(t->md->dax_dev);
 
 	return true;
 }
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
