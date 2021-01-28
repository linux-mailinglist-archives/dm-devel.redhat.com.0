Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 125E9307C2B
	for <lists+dm-devel@lfdr.de>; Thu, 28 Jan 2021 18:23:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-mcngMny8NVCVaE9bTIIxdw-1; Thu, 28 Jan 2021 12:23:55 -0500
X-MC-Unique: mcngMny8NVCVaE9bTIIxdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8E6B80A5C1;
	Thu, 28 Jan 2021 17:23:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A5765D743;
	Thu, 28 Jan 2021 17:23:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAFEC4BB7B;
	Thu, 28 Jan 2021 17:23:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10SHNOWg014655 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 Jan 2021 12:23:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D0E91115D7CF; Thu, 28 Jan 2021 17:23:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA14810439A9
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 17:23:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 645458015A2
	for <dm-devel@redhat.com>; Thu, 28 Jan 2021 17:23:22 +0000 (UTC)
Received: from mx2.veeam.com (mx2.veeam.com [64.129.123.6]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-421-FAQi3TKJMo-nIPr7xPwZWw-1;
	Thu, 28 Jan 2021 12:23:20 -0500
X-MC-Unique: FAQi3TKJMo-nIPr7xPwZWw-1
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.veeam.com (Postfix) with ESMTPS id CBACD41344;
	Thu, 28 Jan 2021 12:12:48 -0500 (EST)
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
	prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.721.2; Thu, 28 Jan 2021 18:12:46 +0100
From: Sergei Shtepa <sergei.shtepa@veeam.com>
To: <hare@suse.de>, <ming.lei@redhat.com>, <agk@redhat.com>,
	<snitzer@redhat.com>, <dm-devel@redhat.com>, <linux-block@vger.kernel.org>
Date: Thu, 28 Jan 2021 20:12:33 +0300
Message-ID: <1611853955-32167-1-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx01.amust.local (172.24.0.171) To prgmbx01.amust.local
	(172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D265677D6B
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
Subject: [dm-devel] [PATCH 0/2] block: blk_interposer v3
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

Hi all,

I`m ready to suggest the blk_interposer again.
blk_interposer allows to intercept bio requests, remap bio to
another devices or add new bios.

This version has support from device mapper.

For the dm-linear device creation command, the `noexcl` parameter
has been added, which allows to open block devices without
FMODE_EXCL mode. It allows to create dm-linear device on a block
device with an already mounted file system.
The new ioctl DM_DEV_REMAP allows to enable and disable bio
interception.

Thus, it is possible to add the dm-device to the block layer stack
without reconfiguring and rebooting.


Sergei Shtepa (2):
  block: blk_interposer
  [dm] blk_interposer for dm-linear

 block/bio.c                   |   2 +
 block/blk-core.c              |  29 +++
 block/blk-mq.c                |  13 ++
 block/genhd.c                 |  82 ++++++++
 drivers/md/dm-core.h          |  46 +++-
 drivers/md/dm-ioctl.c         |  39 ++++
 drivers/md/dm-linear.c        |  17 +-
 drivers/md/dm-table.c         |  12 +-
 drivers/md/dm.c               | 383 ++++++++++++++++++++++++++++++++--
 drivers/md/dm.h               |   2 +-
 include/linux/blk-mq.h        |   1 +
 include/linux/blk_types.h     |   6 +-
 include/linux/device-mapper.h |   7 +
 include/linux/genhd.h         |  19 ++
 include/uapi/linux/dm-ioctl.h |  15 +-
 15 files changed, 643 insertions(+), 30 deletions(-)

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

