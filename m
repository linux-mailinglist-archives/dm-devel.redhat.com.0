Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0490E2597EF
	for <lists+dm-devel@lfdr.de>; Tue,  1 Sep 2020 18:21:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-wkPrPjx5P5OEdbjlF-GbDw-1; Tue, 01 Sep 2020 12:20:18 -0400
X-MC-Unique: wkPrPjx5P5OEdbjlF-GbDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA41F8030A9;
	Tue,  1 Sep 2020 16:20:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B58D278B40;
	Tue,  1 Sep 2020 16:20:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEB9B183D021;
	Tue,  1 Sep 2020 16:20:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 081GK2R2029118 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Sep 2020 12:20:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 588E41112856; Tue,  1 Sep 2020 16:20:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54BB91112853
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 16:20:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A947803DCC
	for <dm-devel@redhat.com>; Tue,  1 Sep 2020 16:20:02 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-529-wRom3M7gORCAh31aNRdI5Q-1; Tue, 01 Sep 2020 12:20:00 -0400
X-MC-Unique: wRom3M7gORCAh31aNRdI5Q-1
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8fN-0004OS-MU; Tue, 01 Sep 2020 15:57:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  1 Sep 2020 17:57:39 +0200
Message-Id: <20200901155748.2884-1-hch@lst.de>
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
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, nbd@other.debian.org,
	virtualization@lists.linux-foundation.org, ceph-devel@vger.kernel.org
Subject: [dm-devel] remove revalidate_disk()
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jens,

this series removes the revalidate_disk() function, which has been a
really odd duck in the last years.  The prime reason why most people
use it is because it propagates a size change from the gendisk to
the block_device structure.  But it also calls into the rather ill
defined ->revalidate_disk method which is rather useless for the
callers.  So this adds a new helper to just propagate the size, and
cleans up all kinds of mess around this area.  Follow on patches
will eventuall kill of ->revalidate_disk entirely, but ther are a lot
more patches needed for that.

Diffstat:
 Documentation/filesystems/locking.rst |    3 --
 block/genhd.c                         |    9 ++----
 drivers/block/nbd.c                   |    8 ++---
 drivers/block/rbd.c                   |    2 -
 drivers/block/rnbd/rnbd-clt.c         |   10 +------
 drivers/block/virtio_blk.c            |    2 -
 drivers/block/zram/zram_drv.c         |    4 +-
 drivers/md/dm-raid.c                  |    2 -
 drivers/md/md-cluster.c               |    6 ++--
 drivers/md/md-linear.c                |    2 -
 drivers/md/md.c                       |   10 +++----
 drivers/md/md.h                       |    2 -
 drivers/nvdimm/blk.c                  |    3 --
 drivers/nvdimm/btt.c                  |    3 --
 drivers/nvdimm/bus.c                  |    9 ++----
 drivers/nvdimm/nd.h                   |    2 -
 drivers/nvdimm/pmem.c                 |    3 --
 drivers/nvme/host/core.c              |   16 +++++++----
 drivers/scsi/sd.c                     |    6 ++--
 fs/block_dev.c                        |   46 ++++++++++++++++------------------
 include/linux/blk_types.h             |    4 ++
 include/linux/genhd.h                 |    6 ++--
 22 files changed, 74 insertions(+), 84 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

