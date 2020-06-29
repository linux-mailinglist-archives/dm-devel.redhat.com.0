Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE0420D5C3
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 21:44:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-9SClUO1ZObWKED-AQ8wAaw-1; Mon, 29 Jun 2020 15:43:59 -0400
X-MC-Unique: 9SClUO1ZObWKED-AQ8wAaw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D027E804006;
	Mon, 29 Jun 2020 19:43:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE15474199;
	Mon, 29 Jun 2020 19:43:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D6F710491A;
	Mon, 29 Jun 2020 19:43:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TJhlIb024192 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 15:43:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8100B2157F25; Mon, 29 Jun 2020 19:43:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D4212166BA3
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 19:43:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54169800260
	for <dm-devel@redhat.com>; Mon, 29 Jun 2020 19:43:47 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-fPjdUOl2OmStIvddYc7oMA-1; Mon, 29 Jun 2020 15:43:43 -0400
X-MC-Unique: fPjdUOl2OmStIvddYc7oMA-1
Received: from [2001:4bb8:184:76e3:fcca:c8dc:a4bf:12fa] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpzd6-0004EQ-9J; Mon, 29 Jun 2020 19:39:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 29 Jun 2020 21:39:27 +0200
Message-Id: <20200629193947.2705954-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [dm-devel] rename ->make_request_fn and move it to the
	block_device_operations
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jens,

this series moves the make_request_fn method into block_device_operations
with the much more descriptive ->submit_bio name.  It then also gives
generic_make_request a more descriptive name, and further optimize the
path to issue to blk-mq, removing the need for the direct_make_request
bypass.

Diffstat:
 Documentation/block/biodoc.rst                    |    2 
 Documentation/block/writeback_cache_control.rst   |    2 
 Documentation/fault-injection/fault-injection.rst |    2 
 Documentation/trace/ftrace.rst                    |    4 
 arch/m68k/emu/nfblock.c                           |    8 
 arch/xtensa/platforms/iss/simdisk.c               |    9 
 block/bio.c                                       |   14 -
 block/blk-cgroup.c                                |    2 
 block/blk-core.c                                  |  255 +++++++++-------------
 block/blk-crypto-fallback.c                       |    2 
 block/blk-crypto.c                                |    2 
 block/blk-merge.c                                 |   23 -
 block/blk-mq.c                                    |   12 -
 block/blk-throttle.c                              |    4 
 block/blk.h                                       |    5 
 block/bounce.c                                    |    2 
 drivers/block/brd.c                               |    5 
 drivers/block/drbd/drbd_int.h                     |    8 
 drivers/block/drbd/drbd_main.c                    |   12 -
 drivers/block/drbd/drbd_receiver.c                |    2 
 drivers/block/drbd/drbd_req.c                     |    8 
 drivers/block/drbd/drbd_worker.c                  |    2 
 drivers/block/null_blk_main.c                     |   19 +
 drivers/block/pktcdvd.c                           |   15 -
 drivers/block/ps3vram.c                           |   20 -
 drivers/block/rsxx/dev.c                          |   14 -
 drivers/block/umem.c                              |   11 
 drivers/block/zram/zram_drv.c                     |   14 -
 drivers/lightnvm/core.c                           |    8 
 drivers/lightnvm/pblk-init.c                      |   16 -
 drivers/lightnvm/pblk-read.c                      |    2 
 drivers/md/bcache/bcache.h                        |    2 
 drivers/md/bcache/btree.c                         |    2 
 drivers/md/bcache/request.c                       |   11 
 drivers/md/bcache/request.h                       |    4 
 drivers/md/bcache/super.c                         |   24 +-
 drivers/md/dm-cache-target.c                      |    6 
 drivers/md/dm-clone-target.c                      |   10 
 drivers/md/dm-crypt.c                             |    6 
 drivers/md/dm-delay.c                             |    2 
 drivers/md/dm-era-target.c                        |    2 
 drivers/md/dm-integrity.c                         |    4 
 drivers/md/dm-mpath.c                             |    2 
 drivers/md/dm-raid1.c                             |    2 
 drivers/md/dm-snap-persistent.c                   |    2 
 drivers/md/dm-snap.c                              |    6 
 drivers/md/dm-thin.c                              |    4 
 drivers/md/dm-verity-target.c                     |    2 
 drivers/md/dm-writecache.c                        |    2 
 drivers/md/dm-zoned-target.c                      |    2 
 drivers/md/dm.c                                   |   41 +--
 drivers/md/md-faulty.c                            |    4 
 drivers/md/md-linear.c                            |    4 
 drivers/md/md-multipath.c                         |    4 
 drivers/md/md.c                                   |    7 
 drivers/md/raid0.c                                |    8 
 drivers/md/raid1.c                                |   14 -
 drivers/md/raid10.c                               |   28 +-
 drivers/md/raid5.c                                |   10 
 drivers/nvdimm/blk.c                              |    5 
 drivers/nvdimm/btt.c                              |    5 
 drivers/nvdimm/pmem.c                             |    5 
 drivers/nvme/host/core.c                          |    1 
 drivers/nvme/host/multipath.c                     |   18 -
 drivers/nvme/host/nvme.h                          |    1 
 drivers/s390/block/dcssblk.c                      |   11 
 drivers/s390/block/xpram.c                        |    8 
 fs/buffer.c                                       |    5 
 include/linux/blk-mq.h                            |    2 
 include/linux/blkdev.h                            |   12 -
 include/linux/lightnvm.h                          |    3 
 71 files changed, 387 insertions(+), 408 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

