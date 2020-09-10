Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3D44A264866
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 16:52:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-I7UZlI-COc2fpdOfZKQh9g-1; Thu, 10 Sep 2020 10:52:20 -0400
X-MC-Unique: I7UZlI-COc2fpdOfZKQh9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B491F1007382;
	Thu, 10 Sep 2020 14:52:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9256660C05;
	Thu, 10 Sep 2020 14:52:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FD33922F2;
	Thu, 10 Sep 2020 14:52:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AEq3bj024432 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 10:52:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 668EB1006192; Thu, 10 Sep 2020 14:52:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 626BB10064EC
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 14:52:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 496F2811E79
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 14:52:03 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-476-uPjNBQ6hOd-NcvSdaFKrrg-1; Thu, 10 Sep 2020 10:51:59 -0400
X-MC-Unique: uPjNBQ6hOd-NcvSdaFKrrg-1
Received: from [2001:4bb8:184:af1:3ecc:ac5b:136f:434a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGNsH-0006vT-Ul; Thu, 10 Sep 2020 14:48:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 10 Sep 2020 16:48:20 +0200
Message-Id: <20200910144833.742260-1-hch@lst.de>
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
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: [dm-devel] bdi cleanups v4
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jens,

this series contains a bunch of different BDI cleanups.  The biggest item
is to isolate block drivers from the BDI in preparation of changing the
lifetime of the block device BDI in a follow up series.


Changes since v3:
 - rebased on the lasted block tree, which has some of the prep
   changes merged
 - extend the ->ra_pages changes to ->io_pages
 - move initializing ->ra_pages and ->io_pages for block devices to
   blk_register_queue

Changes since v2:
 - fix a rw_page return value check
 - fix up various changelogs

Changes since v1:
 - rebased to the for-5.9/block-merge branch
 - explicitly set the readahead to 0 for ubifs, vboxsf and mtd
 - split the zram block_device operations
 - let rw_page users fall back to bios in swap_readpage


Diffstat:
 block/blk-core.c              |    3 -
 block/blk-integrity.c         |    4 +-
 block/blk-mq-debugfs.c        |    1 
 block/blk-settings.c          |    5 +-
 block/blk-sysfs.c             |    4 +-
 block/genhd.c                 |   13 +++++--
 drivers/block/aoe/aoeblk.c    |    2 -
 drivers/block/brd.c           |    1 
 drivers/block/drbd/drbd_nl.c  |   18 ---------
 drivers/block/drbd/drbd_req.c |    4 --
 drivers/block/rbd.c           |    2 -
 drivers/block/zram/zram_drv.c |   19 +++++++---
 drivers/md/bcache/super.c     |    4 --
 drivers/md/dm-table.c         |    9 +---
 drivers/md/raid0.c            |   16 --------
 drivers/md/raid10.c           |   46 ++++++++----------------
 drivers/md/raid5.c            |   31 +++++++---------
 drivers/mmc/core/queue.c      |    3 -
 drivers/mtd/mtdcore.c         |    2 +
 drivers/nvdimm/btt.c          |    2 -
 drivers/nvdimm/pmem.c         |    1 
 drivers/nvme/host/core.c      |    3 -
 drivers/nvme/host/multipath.c |   10 +----
 drivers/scsi/iscsi_tcp.c      |    4 +-
 fs/9p/vfs_file.c              |    2 -
 fs/9p/vfs_super.c             |    6 ++-
 fs/afs/super.c                |    1 
 fs/btrfs/disk-io.c            |    2 -
 fs/fs-writeback.c             |    7 ++-
 fs/fuse/inode.c               |    4 +-
 fs/namei.c                    |    4 +-
 fs/nfs/super.c                |    9 ----
 fs/super.c                    |    2 +
 fs/ubifs/super.c              |    2 +
 fs/vboxsf/super.c             |    2 +
 include/linux/backing-dev.h   |   78 +++++++-----------------------------------
 include/linux/blkdev.h        |    3 +
 include/linux/drbd.h          |    1 
 include/linux/fs.h            |    2 -
 mm/backing-dev.c              |   13 +++----
 mm/filemap.c                  |    4 +-
 mm/memcontrol.c               |    2 -
 mm/memory-failure.c           |    2 -
 mm/migrate.c                  |    2 -
 mm/mmap.c                     |    2 -
 mm/page-writeback.c           |   18 ++++-----
 mm/page_io.c                  |   18 +++++----
 mm/swapfile.c                 |    4 +-
 48 files changed, 144 insertions(+), 253 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

