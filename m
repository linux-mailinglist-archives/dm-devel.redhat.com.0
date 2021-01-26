Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 01B8C304164
	for <lists+dm-devel@lfdr.de>; Tue, 26 Jan 2021 16:05:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-LmHkYT0qP5SK60JKOgcNHA-1; Tue, 26 Jan 2021 10:05:22 -0500
X-MC-Unique: LmHkYT0qP5SK60JKOgcNHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4882D1007460;
	Tue, 26 Jan 2021 15:05:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90DB919D6C;
	Tue, 26 Jan 2021 15:05:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E1785002C;
	Tue, 26 Jan 2021 15:05:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QF5At5012927 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 10:05:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6789A110F0AF; Tue, 26 Jan 2021 15:05:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6026E110F75E
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 15:05:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9292811E97
	for <dm-devel@redhat.com>; Tue, 26 Jan 2021 15:05:07 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-352-qxb7YbayMEmdmFoM_z1UkQ-1; Tue, 26 Jan 2021 10:05:06 -0500
X-MC-Unique: qxb7YbayMEmdmFoM_z1UkQ-1
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4Pi4-005luv-Pc; Tue, 26 Jan 2021 14:53:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:30 +0100
Message-Id: <20210126145247.1964410-1-hch@lst.de>
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
Subject: [dm-devel] misc bio allocation cleanups
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jens,

this series contains various cleanups for how bios are allocated or
initialized plus related fallout.

Diffstat:
 Documentation/filesystems/f2fs.rst |    1 
 block/bio.c                        |  167 ++++++++++++++++++-------------------
 block/blk-crypto-fallback.c        |    2 
 block/blk-flush.c                  |   17 +--
 drivers/block/drbd/drbd_actlog.c   |    2 
 drivers/block/drbd/drbd_bitmap.c   |    2 
 drivers/block/drbd/drbd_int.h      |    2 
 drivers/block/drbd/drbd_main.c     |   13 --
 drivers/block/drbd/drbd_req.c      |    5 -
 drivers/block/drbd/drbd_req.h      |   12 --
 drivers/block/drbd/drbd_worker.c   |    5 -
 drivers/md/dm-clone-target.c       |   14 ---
 drivers/md/dm-zoned-metadata.c     |    6 -
 drivers/md/md.c                    |   48 +++-------
 drivers/md/md.h                    |    2 
 drivers/md/raid1.c                 |    2 
 drivers/md/raid10.c                |    2 
 drivers/md/raid5-ppl.c             |    2 
 drivers/md/raid5.c                 |  108 +++++++++--------------
 drivers/nvme/target/io-cmd-bdev.c  |    2 
 fs/block_dev.c                     |    2 
 fs/btrfs/volumes.c                 |    2 
 fs/exfat/file.c                    |    2 
 fs/ext4/fast_commit.c              |    4 
 fs/ext4/fsync.c                    |    2 
 fs/ext4/ialloc.c                   |    2 
 fs/ext4/super.c                    |    2 
 fs/f2fs/data.c                     |   28 ------
 fs/f2fs/f2fs.h                     |    2 
 fs/f2fs/segment.c                  |   12 --
 fs/f2fs/super.c                    |    1 
 fs/fat/file.c                      |    2 
 fs/hfsplus/inode.c                 |    2 
 fs/hfsplus/super.c                 |    2 
 fs/jbd2/checkpoint.c               |    2 
 fs/jbd2/commit.c                   |    4 
 fs/jbd2/recovery.c                 |    2 
 fs/libfs.c                         |    2 
 fs/nfs/blocklayout/blocklayout.c   |    5 -
 fs/nilfs2/segbuf.c                 |    4 
 fs/nilfs2/the_nilfs.h              |    2 
 fs/ocfs2/file.c                    |    2 
 fs/reiserfs/file.c                 |    2 
 fs/xfs/xfs_super.c                 |    2 
 fs/zonefs/super.c                  |    4 
 include/linux/bio.h                |    6 -
 include/linux/blkdev.h             |    4 
 include/linux/swap.h               |    1 
 mm/page_io.c                       |   45 ++-------
 mm/swapfile.c                      |   10 --
 50 files changed, 213 insertions(+), 363 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

