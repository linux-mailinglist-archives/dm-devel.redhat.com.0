Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7493D25BAB2
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:00:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-fEJQO1_TONKb9DTcz4VCKA-1; Thu, 03 Sep 2020 02:00:24 -0400
X-MC-Unique: fEJQO1_TONKb9DTcz4VCKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A009A800471;
	Thu,  3 Sep 2020 06:00:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DAD78118C;
	Thu,  3 Sep 2020 06:00:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3116179DBA;
	Thu,  3 Sep 2020 06:00:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0835xsAv003801 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 01:59:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A18E22166BA3; Thu,  3 Sep 2020 05:59:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D11D2166BA2
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 05:59:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CB8E101A53F
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 05:59:52 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-153-nGwg19-SNnaCQVjficpdiQ-1; Thu, 03 Sep 2020 01:59:50 -0400
X-MC-Unique: nGwg19-SNnaCQVjficpdiQ-1
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhzd-0007OB-Dx; Thu, 03 Sep 2020 05:41:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:40:55 +0200
Message-Id: <20200903054104.228829-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org, drbd-dev@tron.linbit.com
Subject: [dm-devel] clean up is partition checks
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

this series add a new helepr to check if a struct block_device represents
a parition, and removes most direct access to ->bd_contained from
drivers.

Diffstat:
 Documentation/userspace-api/ioctl/hdio.rst |   24 ++++++++++++------------
 block/blk-lib.c                            |    2 +-
 block/genhd.c                              |    2 +-
 block/ioctl.c                              |    4 ++--
 block/scsi_ioctl.c                         |    2 +-
 drivers/block/drbd/drbd_main.c             |    2 --
 drivers/block/drbd/drbd_receiver.c         |    2 +-
 drivers/block/drbd/drbd_worker.c           |    2 +-
 drivers/ide/ide-ioctls.c                   |    4 ++--
 drivers/md/dm-table.c                      |    2 +-
 drivers/md/md.c                            |    9 ++++-----
 drivers/md/md.h                            |    2 +-
 drivers/mmc/core/block.c                   |    2 +-
 drivers/s390/block/dasd_ioctl.c            |    8 ++++----
 drivers/target/target_core_iblock.c        |    5 ++---
 fs/nfsd/blocklayout.c                      |    4 ++--
 include/linux/blkdev.h                     |    9 +++++++--
 kernel/trace/blktrace.c                    |    2 +-
 lib/vsprintf.c                             |    4 ++--
 19 files changed, 46 insertions(+), 45 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

