Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E65431455
	for <lists+dm-devel@lfdr.de>; Mon, 18 Oct 2021 12:12:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-A_eNnI2GPZmBDDjXhmE49A-1; Mon, 18 Oct 2021 06:12:17 -0400
X-MC-Unique: A_eNnI2GPZmBDDjXhmE49A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 310E21926DAD;
	Mon, 18 Oct 2021 10:12:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07E8B709AE;
	Mon, 18 Oct 2021 10:12:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43FE01818480;
	Mon, 18 Oct 2021 10:12:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19IABsE4032265 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 18 Oct 2021 06:11:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B6B440CFD0B; Mon, 18 Oct 2021 10:11:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36D8440CFD04
	for <dm-devel@redhat.com>; Mon, 18 Oct 2021 10:11:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F575811E80
	for <dm-devel@redhat.com>; Mon, 18 Oct 2021 10:11:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-447-6KPZfqPpM7eunHGtDWXfYQ-1; Mon, 18 Oct 2021 06:11:52 -0400
X-MC-Unique: 6KPZfqPpM7eunHGtDWXfYQ-1
Received: from [2001:4bb8:199:73c5:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcPcT-00Eu4B-82; Mon, 18 Oct 2021 10:11:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 18 Oct 2021 12:11:06 +0200
Message-Id: <20211018101130.1838532-7-hch@lst.de>
In-Reply-To: <20211018101130.1838532-1-hch@lst.de>
References: <20211018101130.1838532-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH 06/30] md: use bdev_nr_sectors instead of open
	coding it
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the proper helper to read the block device size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Song Liu <song@kernel.org>
---
 drivers/md/md.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index ec09083ff0eff..0c75ba047ef60 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -890,8 +890,7 @@ static struct md_personality *find_pers(int level, char *clevel)
 /* return the offset of the super block in 512byte sectors */
 static inline sector_t calc_dev_sboffset(struct md_rdev *rdev)
 {
-	sector_t num_sectors = i_size_read(rdev->bdev->bd_inode) / 512;
-	return MD_NEW_SIZE_SECTORS(num_sectors);
+	return MD_NEW_SIZE_SECTORS(bdev_nr_sectors(rdev->bdev));
 }
 
 static int alloc_disk_sb(struct md_rdev *rdev)
@@ -1633,8 +1632,7 @@ static int super_1_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor_
 	 */
 	switch(minor_version) {
 	case 0:
-		sb_start = i_size_read(rdev->bdev->bd_inode) >> 9;
-		sb_start -= 8*2;
+		sb_start = bdev_nr_sectors(rdev->bdev) - 8 * 2;
 		sb_start &= ~(sector_t)(4*2-1);
 		break;
 	case 1:
@@ -1789,10 +1787,9 @@ static int super_1_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor_
 		else
 			ret = 0;
 	}
-	if (minor_version) {
-		sectors = (i_size_read(rdev->bdev->bd_inode) >> 9);
-		sectors -= rdev->data_offset;
-	} else
+	if (minor_version)
+		sectors = bdev_nr_sectors(rdev->bdev) - rdev->data_offset;
+	else
 		sectors = rdev->sb_start;
 	if (sectors < le64_to_cpu(sb->data_size))
 		return -EINVAL;
@@ -2170,8 +2167,7 @@ super_1_rdev_size_change(struct md_rdev *rdev, sector_t num_sectors)
 		return 0; /* too confusing */
 	if (rdev->sb_start < rdev->data_offset) {
 		/* minor versions 1 and 2; superblock before data */
-		max_sectors = i_size_read(rdev->bdev->bd_inode) >> 9;
-		max_sectors -= rdev->data_offset;
+		max_sectors = bdev_nr_sectors(rdev->bdev) - rdev->data_offset;
 		if (!num_sectors || num_sectors > max_sectors)
 			num_sectors = max_sectors;
 	} else if (rdev->mddev->bitmap_info.offset) {
@@ -2180,7 +2176,7 @@ super_1_rdev_size_change(struct md_rdev *rdev, sector_t num_sectors)
 	} else {
 		/* minor version 0; superblock after data */
 		sector_t sb_start, bm_space;
-		sector_t dev_size = i_size_read(rdev->bdev->bd_inode) >> 9;
+		sector_t dev_size = bdev_nr_sectors(rdev->bdev);
 
 		/* 8K is for superblock */
 		sb_start = dev_size - 8*2;
@@ -3384,7 +3380,7 @@ rdev_size_store(struct md_rdev *rdev, const char *buf, size_t len)
 			if (!sectors)
 				return -EBUSY;
 		} else if (!sectors)
-			sectors = (i_size_read(rdev->bdev->bd_inode) >> 9) -
+			sectors = bdev_nr_sectors(rdev->bdev) -
 				rdev->data_offset;
 		if (!my_mddev->pers->resize)
 			/* Cannot change size for RAID0 or Linear etc */
@@ -3711,7 +3707,7 @@ static struct md_rdev *md_import_device(dev_t newdev, int super_format, int supe
 
 	kobject_init(&rdev->kobj, &rdev_ktype);
 
-	size = i_size_read(rdev->bdev->bd_inode) >> BLOCK_SIZE_BITS;
+	size = bdev_nr_bytes(rdev->bdev) >> BLOCK_SIZE_BITS;
 	if (!size) {
 		pr_warn("md: %s has zero or unknown size, marking faulty!\n",
 			bdevname(rdev->bdev,b));
@@ -6882,7 +6878,7 @@ int md_add_new_disk(struct mddev *mddev, struct mdu_disk_info_s *info)
 
 		if (!mddev->persistent) {
 			pr_debug("md: nonpersistent superblock ...\n");
-			rdev->sb_start = i_size_read(rdev->bdev->bd_inode) / 512;
+			rdev->sb_start = bdev_nr_sectors(rdev->bdev);
 		} else
 			rdev->sb_start = calc_dev_sboffset(rdev);
 		rdev->sectors = rdev->sb_start;
@@ -6969,7 +6965,7 @@ static int hot_add_disk(struct mddev *mddev, dev_t dev)
 	if (mddev->persistent)
 		rdev->sb_start = calc_dev_sboffset(rdev);
 	else
-		rdev->sb_start = i_size_read(rdev->bdev->bd_inode) / 512;
+		rdev->sb_start = bdev_nr_sectors(rdev->bdev);
 
 	rdev->sectors = rdev->sb_start;
 
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

