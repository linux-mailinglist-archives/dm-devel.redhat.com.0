Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 481A9304162
	for <lists+dm-devel@lfdr.de>; Tue, 26 Jan 2021 16:05:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-ivUScI_sNNu-5S7U83E99w-1; Tue, 26 Jan 2021 10:04:04 -0500
X-MC-Unique: ivUScI_sNNu-5S7U83E99w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 430CC100A640;
	Tue, 26 Jan 2021 15:03:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FB6C1964B;
	Tue, 26 Jan 2021 15:03:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9BED4BB7B;
	Tue, 26 Jan 2021 15:03:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QF3r3J012682 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 10:03:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AE409110F75E; Tue, 26 Jan 2021 15:03:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA18F110F72C
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 15:03:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C485805F4E
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 15:03:51 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-xOUlmIIpOymdIWvDpcF0uQ-1; Tue, 26 Jan 2021 10:03:48 -0500
X-MC-Unique: xOUlmIIpOymdIWvDpcF0uQ-1
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4PqP-005mns-Ef; Tue, 26 Jan 2021 15:01:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:35 +0100
Message-Id: <20210126145247.1964410-6-hch@lst.de>
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, Naohiro Aota <naohiro.aota@wdc.com>,
	linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, drbd-dev@tron.linbit.com,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH 05/17] block: use an on-stack bio in
	blkdev_issue_flush
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is no point in allocating memory for a synchronous flush.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-flush.c                 | 17 ++++++-----------
 drivers/md/dm-zoned-metadata.c    |  6 +++---
 drivers/md/raid5-ppl.c            |  2 +-
 drivers/nvme/target/io-cmd-bdev.c |  2 +-
 fs/block_dev.c                    |  2 +-
 fs/exfat/file.c                   |  2 +-
 fs/ext4/fast_commit.c             |  4 ++--
 fs/ext4/fsync.c                   |  2 +-
 fs/ext4/ialloc.c                  |  2 +-
 fs/ext4/super.c                   |  2 +-
 fs/fat/file.c                     |  2 +-
 fs/hfsplus/inode.c                |  2 +-
 fs/hfsplus/super.c                |  2 +-
 fs/jbd2/checkpoint.c              |  2 +-
 fs/jbd2/commit.c                  |  4 ++--
 fs/jbd2/recovery.c                |  2 +-
 fs/libfs.c                        |  2 +-
 fs/nilfs2/the_nilfs.h             |  2 +-
 fs/ocfs2/file.c                   |  2 +-
 fs/reiserfs/file.c                |  2 +-
 fs/xfs/xfs_super.c                |  2 +-
 fs/zonefs/super.c                 |  2 +-
 include/linux/blkdev.h            |  4 ++--
 23 files changed, 33 insertions(+), 38 deletions(-)

diff --git a/block/blk-flush.c b/block/blk-flush.c
index 76c1624cb06c05..7942ca6ed3211c 100644
--- a/block/blk-flush.c
+++ b/block/blk-flush.c
@@ -432,23 +432,18 @@ void blk_insert_flush(struct request *rq)
 /**
  * blkdev_issue_flush - queue a flush
  * @bdev:	blockdev to issue flush for
- * @gfp_mask:	memory allocation flags (for bio_alloc)
  *
  * Description:
  *    Issue a flush for the block device in question.
  */
-int blkdev_issue_flush(struct block_device *bdev, gfp_t gfp_mask)
+int blkdev_issue_flush(struct block_device *bdev)
 {
-	struct bio *bio;
-	int ret = 0;
+	struct bio bio;
 
-	bio = bio_alloc(gfp_mask, 0);
-	bio_set_dev(bio, bdev);
-	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
-
-	ret = submit_bio_wait(bio);
-	bio_put(bio);
-	return ret;
+	bio_init(&bio, NULL, 0);
+	bio_set_dev(&bio, bdev);
+	bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
+	return submit_bio_wait(&bio);
 }
 EXPORT_SYMBOL(blkdev_issue_flush);
 
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index b298fefb022eb9..039d17b2893849 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -819,7 +819,7 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
 	ret = dmz_rdwr_block(dev, REQ_OP_WRITE, zmd->sb[set].block,
 			     mblk->page);
 	if (ret == 0)
-		ret = blkdev_issue_flush(dev->bdev, GFP_NOIO);
+		ret = blkdev_issue_flush(dev->bdev);
 
 	return ret;
 }
@@ -862,7 +862,7 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
 
 	/* Flush drive cache (this will also sync data) */
 	if (ret == 0)
-		ret = blkdev_issue_flush(dev->bdev, GFP_NOIO);
+		ret = blkdev_issue_flush(dev->bdev);
 
 	return ret;
 }
@@ -933,7 +933,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
 
 	/* If there are no dirty metadata blocks, just flush the device cache */
 	if (list_empty(&write_list)) {
-		ret = blkdev_issue_flush(dev->bdev, GFP_NOIO);
+		ret = blkdev_issue_flush(dev->bdev);
 		goto err;
 	}
 
diff --git a/drivers/md/raid5-ppl.c b/drivers/md/raid5-ppl.c
index d0f540296fe91e..e8c118e05dfd46 100644
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@ -1037,7 +1037,7 @@ static int ppl_recover(struct ppl_log *log, struct ppl_header *pplhdr,
 	}
 
 	/* flush the disk cache after recovery if necessary */
-	ret = blkdev_issue_flush(rdev->bdev, GFP_KERNEL);
+	ret = blkdev_issue_flush(rdev->bdev);
 out:
 	__free_page(page);
 	return ret;
diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 125dde3f410ee7..bf6e0ac9ad2890 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -333,7 +333,7 @@ static void nvmet_bdev_execute_flush(struct nvmet_req *req)
 
 u16 nvmet_bdev_flush(struct nvmet_req *req)
 {
-	if (blkdev_issue_flush(req->ns->bdev, GFP_KERNEL))
+	if (blkdev_issue_flush(req->ns->bdev))
 		return NVME_SC_INTERNAL | NVME_SC_DNR;
 	return 0;
 }
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 6f5bd9950baf45..bc957ef7cebaae 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -681,7 +681,7 @@ int blkdev_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
 	 * i_mutex and doing so causes performance issues with concurrent
 	 * O_SYNC writers to a block device.
 	 */
-	error = blkdev_issue_flush(bdev, GFP_KERNEL);
+	error = blkdev_issue_flush(bdev);
 	if (error == -EOPNOTSUPP)
 		error = 0;
 
diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index a92478eabfa4e4..183ffdf4d43c5f 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -361,7 +361,7 @@ int exfat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
 	if (err)
 		return err;
 
-	return blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
+	return blkdev_issue_flush(inode->i_sb->s_bdev);
 }
 
 const struct file_operations exfat_file_operations = {
diff --git a/fs/ext4/fast_commit.c b/fs/ext4/fast_commit.c
index 0a14a7c87bf82e..6e8208acfc62ac 100644
--- a/fs/ext4/fast_commit.c
+++ b/fs/ext4/fast_commit.c
@@ -1076,7 +1076,7 @@ static int ext4_fc_perform_commit(journal_t *journal)
 	 * flush before we start writing fast commit blocks.
 	 */
 	if (journal->j_fs_dev != journal->j_dev)
-		blkdev_issue_flush(journal->j_fs_dev, GFP_NOFS);
+		blkdev_issue_flush(journal->j_fs_dev);
 
 	blk_start_plug(&plug);
 	if (sbi->s_fc_bytes == 0) {
@@ -1535,7 +1535,7 @@ static int ext4_fc_replay_inode(struct super_block *sb, struct ext4_fc_tl *tl)
 out:
 	iput(inode);
 	if (!ret)
-		blkdev_issue_flush(sb->s_bdev, GFP_KERNEL);
+		blkdev_issue_flush(sb->s_bdev);
 
 	return 0;
 }
diff --git a/fs/ext4/fsync.c b/fs/ext4/fsync.c
index 113bfb023a4a09..027a7d7037a07b 100644
--- a/fs/ext4/fsync.c
+++ b/fs/ext4/fsync.c
@@ -174,7 +174,7 @@ int ext4_sync_file(struct file *file, loff_t start, loff_t end, int datasync)
 		ret = ext4_fsync_journal(inode, datasync, &needs_barrier);
 
 	if (needs_barrier) {
-		err = blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
+		err = blkdev_issue_flush(inode->i_sb->s_bdev);
 		if (!ret)
 			ret = err;
 	}
diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
index b215c564bc318a..20f2fcb799f55f 100644
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@ -1583,7 +1583,7 @@ int ext4_init_inode_table(struct super_block *sb, ext4_group_t group,
 	if (ret < 0)
 		goto err_out;
 	if (barrier)
-		blkdev_issue_flush(sb->s_bdev, GFP_NOFS);
+		blkdev_issue_flush(sb->s_bdev);
 
 skip_zeroout:
 	ext4_lock_group(sb, group);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 9a6f9875aa3499..fb5985102c1db7 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5709,7 +5709,7 @@ static int ext4_sync_fs(struct super_block *sb, int wait)
 		needs_barrier = true;
 	if (needs_barrier) {
 		int err;
-		err = blkdev_issue_flush(sb->s_bdev, GFP_KERNEL);
+		err = blkdev_issue_flush(sb->s_bdev);
 		if (!ret)
 			ret = err;
 	}
diff --git a/fs/fat/file.c b/fs/fat/file.c
index f9ee27cf4d7c2f..5fee74f1ad611d 100644
--- a/fs/fat/file.c
+++ b/fs/fat/file.c
@@ -195,7 +195,7 @@ int fat_file_fsync(struct file *filp, loff_t start, loff_t end, int datasync)
 	if (err)
 		return err;
 
-	return blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
+	return blkdev_issue_flush(inode->i_sb->s_bdev);
 }
 
 
diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index e3da9e96b83578..ca464328b79cc5 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -340,7 +340,7 @@ int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
 	}
 
 	if (!test_bit(HFSPLUS_SB_NOBARRIER, &sbi->flags))
-		blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
+		blkdev_issue_flush(inode->i_sb->s_bdev);
 
 	inode_unlock(inode);
 
diff --git a/fs/hfsplus/super.c b/fs/hfsplus/super.c
index 807119ae5adf73..b9e3db3f855f96 100644
--- a/fs/hfsplus/super.c
+++ b/fs/hfsplus/super.c
@@ -239,7 +239,7 @@ static int hfsplus_sync_fs(struct super_block *sb, int wait)
 	mutex_unlock(&sbi->vh_mutex);
 
 	if (!test_bit(HFSPLUS_SB_NOBARRIER, &sbi->flags))
-		blkdev_issue_flush(sb->s_bdev, GFP_KERNEL);
+		blkdev_issue_flush(sb->s_bdev);
 
 	return error;
 }
diff --git a/fs/jbd2/checkpoint.c b/fs/jbd2/checkpoint.c
index 472932b9e6bca9..63b526d44886d0 100644
--- a/fs/jbd2/checkpoint.c
+++ b/fs/jbd2/checkpoint.c
@@ -416,7 +416,7 @@ int jbd2_cleanup_journal_tail(journal_t *journal)
 	 * jbd2_cleanup_journal_tail() doesn't get called all that often.
 	 */
 	if (journal->j_flags & JBD2_BARRIER)
-		blkdev_issue_flush(journal->j_fs_dev, GFP_NOFS);
+		blkdev_issue_flush(journal->j_fs_dev);
 
 	return __jbd2_update_log_tail(journal, first_tid, blocknr);
 }
diff --git a/fs/jbd2/commit.c b/fs/jbd2/commit.c
index b121d7d434c675..3cc4ab2ba7f4f2 100644
--- a/fs/jbd2/commit.c
+++ b/fs/jbd2/commit.c
@@ -825,7 +825,7 @@ void jbd2_journal_commit_transaction(journal_t *journal)
 	if (commit_transaction->t_need_data_flush &&
 	    (journal->j_fs_dev != journal->j_dev) &&
 	    (journal->j_flags & JBD2_BARRIER))
-		blkdev_issue_flush(journal->j_fs_dev, GFP_NOFS);
+		blkdev_issue_flush(journal->j_fs_dev);
 
 	/* Done it all: now write the commit record asynchronously. */
 	if (jbd2_has_feature_async_commit(journal)) {
@@ -932,7 +932,7 @@ void jbd2_journal_commit_transaction(journal_t *journal)
 	stats.run.rs_blocks_logged++;
 	if (jbd2_has_feature_async_commit(journal) &&
 	    journal->j_flags & JBD2_BARRIER) {
-		blkdev_issue_flush(journal->j_dev, GFP_NOFS);
+		blkdev_issue_flush(journal->j_dev);
 	}
 
 	if (err)
diff --git a/fs/jbd2/recovery.c b/fs/jbd2/recovery.c
index dc0694fcfcd123..69f18fe2092369 100644
--- a/fs/jbd2/recovery.c
+++ b/fs/jbd2/recovery.c
@@ -326,7 +326,7 @@ int jbd2_journal_recover(journal_t *journal)
 		err = err2;
 	/* Make sure all replayed data is on permanent storage */
 	if (journal->j_flags & JBD2_BARRIER) {
-		err2 = blkdev_issue_flush(journal->j_fs_dev, GFP_KERNEL);
+		err2 = blkdev_issue_flush(journal->j_fs_dev);
 		if (!err)
 			err = err2;
 	}
diff --git a/fs/libfs.c b/fs/libfs.c
index d1c3bade9f30dd..8398a0efb401c6 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1117,7 +1117,7 @@ int generic_file_fsync(struct file *file, loff_t start, loff_t end,
 	err = __generic_file_fsync(file, start, end, datasync);
 	if (err)
 		return err;
-	return blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
+	return blkdev_issue_flush(inode->i_sb->s_bdev);
 }
 EXPORT_SYMBOL(generic_file_fsync);
 
diff --git a/fs/nilfs2/the_nilfs.h b/fs/nilfs2/the_nilfs.h
index b55cdeb4d16991..987c8ab02aeee6 100644
--- a/fs/nilfs2/the_nilfs.h
+++ b/fs/nilfs2/the_nilfs.h
@@ -375,7 +375,7 @@ static inline int nilfs_flush_device(struct the_nilfs *nilfs)
 	 */
 	smp_wmb();
 
-	err = blkdev_issue_flush(nilfs->ns_bdev, GFP_KERNEL);
+	err = blkdev_issue_flush(nilfs->ns_bdev);
 	if (err != -EIO)
 		err = 0;
 	return err;
diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index 85979e2214b39d..df6d709d2ae3b6 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -194,7 +194,7 @@ static int ocfs2_sync_file(struct file *file, loff_t start, loff_t end,
 		needs_barrier = true;
 	err = jbd2_complete_transaction(journal, commit_tid);
 	if (needs_barrier) {
-		ret = blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
+		ret = blkdev_issue_flush(inode->i_sb->s_bdev);
 		if (!err)
 			err = ret;
 	}
diff --git a/fs/reiserfs/file.c b/fs/reiserfs/file.c
index 0b641ae694f123..1db0254bc38b26 100644
--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -159,7 +159,7 @@ static int reiserfs_sync_file(struct file *filp, loff_t start, loff_t end,
 	barrier_done = reiserfs_commit_for_inode(inode);
 	reiserfs_write_unlock(inode->i_sb);
 	if (barrier_done != 1 && reiserfs_barrier_flush(inode->i_sb))
-		blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
+		blkdev_issue_flush(inode->i_sb->s_bdev);
 	inode_unlock(inode);
 	if (barrier_done < 0)
 		return barrier_done;
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 813be879a5e51d..c3e32789829f90 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -342,7 +342,7 @@ void
 xfs_blkdev_issue_flush(
 	xfs_buftarg_t		*buftarg)
 {
-	blkdev_issue_flush(buftarg->bt_bdev, GFP_NOFS);
+	blkdev_issue_flush(buftarg->bt_bdev);
 }
 
 STATIC void
diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index faea2ed34b4a37..ab68e27bb322e0 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -541,7 +541,7 @@ static int zonefs_file_fsync(struct file *file, loff_t start, loff_t end,
 	if (ZONEFS_I(inode)->i_ztype == ZONEFS_ZTYPE_CNV)
 		ret = file_write_and_wait_range(file, start, end);
 	if (!ret)
-		ret = blkdev_issue_flush(inode->i_sb->s_bdev, GFP_KERNEL);
+		ret = blkdev_issue_flush(inode->i_sb->s_bdev);
 
 	if (ret)
 		zonefs_io_error(inode, true);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 20f3706b6b2e68..09f7ac5507d146 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1288,7 +1288,7 @@ static inline bool blk_needs_flush_plug(struct task_struct *tsk)
 		 !list_empty(&plug->cb_list));
 }
 
-int blkdev_issue_flush(struct block_device *, gfp_t);
+int blkdev_issue_flush(struct block_device *bdev);
 long nr_blockdev_pages(void);
 #else /* CONFIG_BLOCK */
 struct blk_plug {
@@ -1316,7 +1316,7 @@ static inline bool blk_needs_flush_plug(struct task_struct *tsk)
 	return false;
 }
 
-static inline int blkdev_issue_flush(struct block_device *bdev, gfp_t gfp_mask)
+static inline int blkdev_issue_flush(struct block_device *bdev)
 {
 	return 0;
 }
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

