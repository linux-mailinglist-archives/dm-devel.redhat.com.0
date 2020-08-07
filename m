Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7C623F071
	for <lists+dm-devel@lfdr.de>; Fri,  7 Aug 2020 18:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596816321;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7A/dAVamGTPmQKv0ayKfRuuaaqU2KBV5NupPX3V+Mak=;
	b=NI54dUc+dCP0KL6bK2sZN4TPkYREfQeWx2DXYSDNsfrwMY5qt+lbwgQ+rlAq2cIGbDJ0rb
	38jjrBQW85lwk5o8vZ38eb38volUe3DyfTnOwkeJodNh2tbaHYAt3Tby5tC37mkygQ7Yb6
	kVBxjCr8jfldQ41BvF2e82wv01H5w6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-iTXLRqZKM22dYTql6EtKgA-1; Fri, 07 Aug 2020 12:04:02 -0400
X-MC-Unique: iTXLRqZKM22dYTql6EtKgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 109AA8017FB;
	Fri,  7 Aug 2020 16:03:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D32B760BE2;
	Fri,  7 Aug 2020 16:03:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB1E99A0EF;
	Fri,  7 Aug 2020 16:03:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 077G3SkA000836 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Aug 2020 12:03:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0DA05D9FC; Fri,  7 Aug 2020 16:03:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E8BC5D9D5;
	Fri,  7 Aug 2020 16:03:28 +0000 (UTC)
Date: Fri, 7 Aug 2020 12:03:27 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200807160327.GA977@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: JeongHyeon Lee <jhs2.lee@samsung.com>,
	Damien Le Moal <damien.lemoal@wdc.com>, John Dorminy <jdorminy@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	yangerkun <yangerkun@huawei.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper changes for 5.9
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

The following changes since commit 11ba468877bb23f28956a35e896356252d63c983:

  Linux 5.8-rc5 (2020-07-12 16:34:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.9/dm-changes

for you to fetch changes up to a9cb9f4148ef6bb8fabbdaa85c42b2171fbd5a0d:

  dm: don't call report zones for more than the user requested (2020-08-04 16:31:12 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- DM multipath locking fixes around m->flags tests and improvements to
  bio-based code so that it follows patterns established by
  request-based code.

- Request-based DM core improvement to eliminate unnecessary call to
  blk_mq_queue_stopped().

- Add "panic_on_corruption" error handling mode to DM verity target.

- DM bufio fix to to perform buffer cleanup from a workqueue rather
  than wait for IO in reclaim context from shrinker.

- DM crypt improvement to optionally avoid async processing via
  workqueues for reads and/or writes -- via "no_read_workqueue" and
  "no_write_workqueue" features.  This more direct IO processing
  improves latency and throughput with faster storage.  Avoiding
  workqueue IO submission for writes (DM_CRYPT_NO_WRITE_WORKQUEUE) is
  a requirement for adding zoned block device support to DM crypt.

- Add zoned block device support to DM crypt.  Makes use of
  DM_CRYPT_NO_WRITE_WORKQUEUE and a new optional feature
  (DM_CRYPT_WRITE_INLINE) that allows write completion to wait for
  encryption to complete.  This allows write ordering to be preserved,
  which is needed for zoned block devices.

- Fix DM ebs target's check for REQ_OP_FLUSH.

- Fix DM core's report zones support to not report more zones than
  were requested.

- A few small compiler warning fixes.

- DM dust improvements to return output directly to the user rather
  than require they scrape the system log for output.

----------------------------------------------------------------
Damien Le Moal (5):
      dm crypt: Enable zoned block device support
      dm verity: Fix compilation warning
      dm raid: Remove empty if statement
      dm ioctl: Fix compilation warning
      dm init: Set file local variable static

Ignat Korchagin (1):
      dm crypt: add flags to optionally bypass kcryptd workqueues

JeongHyeon Lee (1):
      dm verity: add "panic_on_corruption" error handling mode

Johannes Thumshirn (1):
      dm: don't call report zones for more than the user requested

John Dorminy (1):
      dm ebs: Fix incorrect checking for REQ_OP_FLUSH

Mike Snitzer (7):
      dm mpath: changes from initial m->flags locking audit
      dm mpath: take m->lock spinlock when testing QUEUE_IF_NO_PATH
      dm mpath: push locking down to must_push_back_rq()
      dm mpath: factor out multipath_queue_bio
      dm mpath: rework __map_bio()
      dm mpath: rename current_pgpath to pgpath in multipath_prepare_ioctl
      dm mpath: use double checked locking in fast path

Mikulas Patocka (1):
      dm bufio: do buffer cleanup from a workqueue

Ming Lei (1):
      dm rq: don't call blk_mq_queue_stopped() in dm_stop_queue()

yangerkun (2):
      dm dust: report some message results directly back to user
      dm dust: add interface to list all badblocks

 .../admin-guide/device-mapper/dm-dust.rst          |  32 ++++-
 Documentation/admin-guide/device-mapper/verity.rst |   4 +
 drivers/md/dm-bufio.c                              |  60 ++++++---
 drivers/md/dm-crypt.c                              | 129 ++++++++++++++++--
 drivers/md/dm-dust.c                               |  58 ++++++--
 drivers/md/dm-ebs-target.c                         |   2 +-
 drivers/md/dm-init.c                               |   2 +-
 drivers/md/dm-ioctl.c                              |   2 +-
 drivers/md/dm-mpath.c                              | 146 ++++++++++++++-------
 drivers/md/dm-raid.c                               |   2 -
 drivers/md/dm-rq.c                                 |   3 -
 drivers/md/dm-verity-target.c                      |  13 +-
 drivers/md/dm-verity-verify-sig.h                  |  14 +-
 drivers/md/dm-verity.h                             |   3 +-
 drivers/md/dm.c                                    |   3 +-
 15 files changed, 355 insertions(+), 118 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

