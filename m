Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9D9315194
	for <lists+dm-devel@lfdr.de>; Tue,  9 Feb 2021 15:31:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-2-dS9tx_NUisIO03WL-nLg-1; Tue, 09 Feb 2021 09:31:21 -0500
X-MC-Unique: 2-dS9tx_NUisIO03WL-nLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FFC5108C310;
	Tue,  9 Feb 2021 14:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFFD819C59;
	Tue,  9 Feb 2021 14:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 009E918095CE;
	Tue,  9 Feb 2021 14:31:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119EV1LP029007 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 09:31:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D27A112C278; Tue,  9 Feb 2021 14:31:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 285891019258
	for <dm-devel@redhat.com>; Tue,  9 Feb 2021 14:30:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2E3A811760
	for <dm-devel@redhat.com>; Tue,  9 Feb 2021 14:30:58 +0000 (UTC)
Received: from mx2.veeam.com (mx2.veeam.com [64.129.123.6]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-260-8qJ-j4wOMcGnbzE8dcfugQ-1;
	Tue, 09 Feb 2021 09:30:56 -0500
X-MC-Unique: 8qJ-j4wOMcGnbzE8dcfugQ-1
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.veeam.com (Postfix) with ESMTPS id DEBBD415DC;
	Tue,  9 Feb 2021 09:30:52 -0500 (EST)
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
	prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.721.2; Tue, 9 Feb 2021 15:30:45 +0100
From: Sergei Shtepa <sergei.shtepa@veeam.com>
To: <Damien.LeMoal@wdc.com>, <snitzer@redhat.com>, <hare@suse.de>,
	<ming.lei@redhat.com>, <agk@redhat.com>, <corbet@lwn.net>,
	<axboe@kernel.dk>, <jack@suse.cz>, <johannes.thumshirn@wdc.com>,
	<gregkh@linuxfoundation.org>, <koct9i@gmail.com>, <steve@sk2.org>,
	<dm-devel@redhat.com>, <linux-block@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 9 Feb 2021 17:30:22 +0300
Message-ID: <1612881028-7878-1-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx02.amust.local (172.24.0.172) To prgmbx01.amust.local
	(172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D265617465
X-Veeam-MMEX: True
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
Cc: pavel.tide@veeam.com, sergei.shtepa@veeam.com
Subject: [dm-devel] [PATCH v5 0/6] block-layer interposer
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

Hi all.

I'm joyful to suggest the block-layer interposer (blk_interposer) v5.
blk_interposer allows to intercept bio requests, remap bio to another
devices or add new bios.

This patch series adds support blk_interposer for dm-linear.

In the first patch, I suggest the remap_and_filter.rst file.
Yes, Mike, it's probably too early for documentation, but maybe it will be
interesting for someone. In the documentation I tried to explain
the purpose of blk_interposer and what prospects it opens up.

The second patch adds the function blk_mq_is_queue_frozen(). It allows to
assert a queue state.

The third patch is dedicated to blk_interposer itself, which provides
the ability to intercept bio.

The fourth one adds support for blk_interposer from the device mapper.
Added ioctl DM_DEV_REMAP_CMD.

In the fifth - added the 'noexcl' option for dm-linear, which allows
to open the underlying block-device without the FMODE_EXCL mode.
This allows to create a dm device to which can redirect bio requests
using DM_DEV_REMAP_CMD.

The latest patch changes linear.rst with the description of the 'noexcl'
option that is added for dm-linear.

A little history of changes:

v5 - current patch set
Changes:
 * rebase for v5.11-rc7;
 * patch set organization;
 * fix defects in documentation;
 * add some comments;
 * change mutex names for better code readability;
 * remove calling bd_unlink_disk_holder() for targets with non-exclusive
   flag;
 * change type for struct dm_remap_param from uint8_t to __u8.

v4 - https://patchwork.kernel.org/project/linux-block/cover/1612367638-3794-1-git-send-email-sergei.shtepa@veeam.com/
Mostly changes were made, due to Damien's comments:
 * on the design of the code;
 * by the patch set organization;
 * bug with passing a wrong parameter to dm_get_device();
 * description of the 'noexcl' parameter in the linear.rst.
Also added remap_and_filter.rst.

v3 - https://patchwork.kernel.org/project/linux-block/cover/1611853955-32167-1-git-send-email-sergei.shtepa@veeam.com/
In this version, I already suggested blk_interposer to apply to dm-linear.
Problems were solved:
 * Interception of bio requests from a specific device on the disk, not
   from the entire disk. To do this, we added the dm_interposed_dev
   structure and an interval tree to store these structures.
 * Implemented ioctl DM_DEV_REMAP_CMD. A patch with changes in the lvm2
   project was sent to the team lvm-devel@redhat.com.
 * Added the 'noexcl' option for dm-linear, which allows you to open
   the underlying block-device without FMODE_EXCL mode.

v2 - https://patchwork.kernel.org/project/linux-block/cover/1607518911-30692-1-git-send-email-sergei.shtepa@veeam.com/
I tried to suggest blk_interposer without using it in device mapper,
but with the addition of a sample of its use. It was then that I learned
about the maintainers' attitudes towards the samples directory :).

v1 - https://lwn.net/ml/linux-block/20201119164924.74401-1-hare@suse.de/
This Hannes's patch can be considered as a starting point, since this is
where the interception mechanism and the term blk_interposer itself
appeared. It became clear that blk_interposer can be useful for
device mapper.

before v1 - https://patchwork.kernel.org/project/linux-block/cover/1603271049-20681-1-git-send-email-sergei.shtepa@veeam.com/
I tried to offer a rather cumbersome blk-filter and a monster-like
blk-snap module for creating snapshots.

Thank you to everyone who was able to take the time to review
the previous versions.
I hope that this time I achieved the required quality.

Thanks,
Sergei.

Sergei Shtepa (6):
  docs: device-mapper: add remap_and_filter
  block: add blk_mq_is_queue_frozen()
  block: add blk_interposer
  dm: new ioctl DM_DEV_REMAP_CMD
  dm: add 'noexcl' option for dm-linear
  docs: device-mapper: 'noexcl' option for dm-linear

 .../admin-guide/device-mapper/index.rst       |   1 +
 .../admin-guide/device-mapper/linear.rst      |  26 +-
 .../device-mapper/remap_and_filter.rst        | 132 ++++++
 block/bio.c                                   |   2 +
 block/blk-core.c                              |  35 ++
 block/blk-mq.c                                |  13 +
 block/genhd.c                                 |  86 ++++
 drivers/md/dm-core.h                          |  20 +
 drivers/md/dm-ioctl.c                         |  35 ++
 drivers/md/dm-linear.c                        |  14 +-
 drivers/md/dm-table.c                         |  14 +-
 drivers/md/dm.c                               | 401 +++++++++++++++++-
 drivers/md/dm.h                               |   2 +-
 include/linux/blk-mq.h                        |   1 +
 include/linux/blk_types.h                     |   6 +-
 include/linux/device-mapper.h                 |   7 +
 include/linux/genhd.h                         |  18 +
 include/uapi/linux/dm-ioctl.h                 |  15 +-
 18 files changed, 796 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/admin-guide/device-mapper/remap_and_filter.rst

--
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

