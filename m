Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C50853DFE56
	for <lists+dm-devel@lfdr.de>; Wed,  4 Aug 2021 11:47:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-zbTL-ooxPoKa42Q4UoBfgg-1; Wed, 04 Aug 2021 05:47:16 -0400
X-MC-Unique: zbTL-ooxPoKa42Q4UoBfgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D51B94DC2;
	Wed,  4 Aug 2021 09:47:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E73AD78C24;
	Wed,  4 Aug 2021 09:47:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C96A4BB7C;
	Wed,  4 Aug 2021 09:47:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1749l6Ih006312 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Aug 2021 05:47:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8199112D42A; Wed,  4 Aug 2021 09:47:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B69F112D430
	for <dm-devel@redhat.com>; Wed,  4 Aug 2021 09:47:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F28C18A01AB
	for <dm-devel@redhat.com>; Wed,  4 Aug 2021 09:47:02 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-44-VNvTpvsIO5CPXxza7GpAqA-1; Wed, 04 Aug 2021 05:47:00 -0400
X-MC-Unique: VNvTpvsIO5CPXxza7GpAqA-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBDPI-005dwa-Kn; Wed, 04 Aug 2021 09:41:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
Date: Wed,  4 Aug 2021 11:41:39 +0200
Message-Id: <20210804094147.459763-1-hch@lst.de>
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com
Subject: [dm-devel] use regular gendisk registration in device mapper v2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

The device mapper code currently has a somewhat odd gendisk registration
scheme where it calls add_disk early, but uses a special flag to skip the
"queue registration", which is a major part of add_disk.  This series
improves the block layer holder tracking to work on an entirely
unregistered disk and thus allows device mapper to use the normal scheme
of calling add_disk when it is ready to accept I/O.

Note that this leads to a user visible change - the sysfs attributes on
the disk and the dm directory hanging off it are not only visible once
the initial table is loaded.  This did not make a different to my testing
using dmsetup and the lvm2 tools.

Changes since v1:
 - rebased on the lastes for-5.15/block tree
 - improve various commit messages, including commit references

Diffstat:
 block/Kconfig             |    4 +
 block/Makefile            |    1 
 block/elevator.c          |    1 
 block/genhd.c             |   42 +++++------
 block/holder.c            |  167 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/md/Kconfig        |    2 
 drivers/md/bcache/Kconfig |    1 
 drivers/md/dm-ioctl.c     |    4 -
 drivers/md/dm-rq.c        |    1 
 drivers/md/dm.c           |   32 +++-----
 fs/block_dev.c            |  145 ---------------------------------------
 include/linux/blk_types.h |    3 
 include/linux/genhd.h     |   19 ++---
 13 files changed, 219 insertions(+), 203 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

