Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 80F9D2C277F
	for <lists+dm-devel@lfdr.de>; Tue, 24 Nov 2020 14:29:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-v3Ml41flOLa9mgi7ZINPog-1; Tue, 24 Nov 2020 08:29:51 -0500
X-MC-Unique: v3Ml41flOLa9mgi7ZINPog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC760879524;
	Tue, 24 Nov 2020 13:29:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB49A5D71D;
	Tue, 24 Nov 2020 13:29:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63A951809CA3;
	Tue, 24 Nov 2020 13:29:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AODTGp8018182 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 08:29:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BC5022166B33; Tue, 24 Nov 2020 13:29:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B03F92166B2C
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 13:29:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FB10811E76
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 13:29:14 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-64-MG8yLXwoMRidRLix0e2fBg-1; Tue, 24 Nov 2020 08:29:10 -0500
X-MC-Unique: MG8yLXwoMRidRLix0e2fBg-1
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYNU-0006i4-0Y; Tue, 24 Nov 2020 13:29:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 24 Nov 2020 14:27:47 +0100
Message-Id: <20201124132751.3747337-42-hch@lst.de>
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [dm-devel] [PATCH 41/45] block: pass a block_device to
	invalidate_partition
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pass the block_device actually needed instead of looking it up using
bdget_disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 498c816e90df64..2985740eab084b 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -790,14 +790,8 @@ void device_add_disk_no_queue_reg(struct device *parent, struct gendisk *disk)
 }
 EXPORT_SYMBOL(device_add_disk_no_queue_reg);
 
-static void invalidate_partition(struct gendisk *disk, int partno)
+static void invalidate_partition(struct block_device *bdev)
 {
-	struct block_device *bdev;
-
-	bdev = bdget_disk(disk, partno);
-	if (!bdev)
-		return;
-
 	fsync_bdev(bdev);
 	__invalidate_device(bdev, true);
 
@@ -806,7 +800,6 @@ static void invalidate_partition(struct gendisk *disk, int partno)
 	 * as last inode reference is dropped.
 	 */
 	remove_inode_hash(bdev->bd_inode);
-	bdput(bdev);
 }
 
 /**
@@ -847,12 +840,12 @@ void del_gendisk(struct gendisk *disk)
 	disk_part_iter_init(&piter, disk,
 			     DISK_PITER_INCL_EMPTY | DISK_PITER_REVERSE);
 	while ((part = disk_part_iter_next(&piter))) {
-		invalidate_partition(disk, part->bdev->bd_partno);
+		invalidate_partition(part->bdev);
 		delete_partition(part);
 	}
 	disk_part_iter_exit(&piter);
 
-	invalidate_partition(disk, 0);
+	invalidate_partition(disk->part0);
 	set_capacity(disk, 0);
 
 	if (!(disk->flags & GENHD_FL_HIDDEN)) {
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

