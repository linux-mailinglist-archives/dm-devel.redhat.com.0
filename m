Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD972CF5F0
	for <lists+dm-devel@lfdr.de>; Fri,  4 Dec 2020 22:06:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607115978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wlIBFeLpx+zk4t/z4rddkoyfZYJxwFyhL2RatxZi8IY=;
	b=alMKSz6VeHbr2MLmGM+TniolhZ9FOwhCvpsnRmAL42UJ1yCh4MzS4W8d6OLhukxxUvi+u4
	0O9cwLk2B5Cd22B8DYNVEPHz7WZXMfVpKKqcw0DRLpIGSx3PKju+P8pqSG7O+t2gk8QJNg
	61GbtTOWLWJFHPq8TstSM0505NK+u2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-YXyHcRIDPSSnhMnR5uuyfg-1; Fri, 04 Dec 2020 16:06:15 -0500
X-MC-Unique: YXyHcRIDPSSnhMnR5uuyfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2161858181;
	Fri,  4 Dec 2020 21:06:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A609919C46;
	Fri,  4 Dec 2020 21:06:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6AA27180954D;
	Fri,  4 Dec 2020 21:05:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4L5P0l005345 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 16:05:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF94D10002A6; Fri,  4 Dec 2020 21:05:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2C81002391;
	Fri,  4 Dec 2020 21:05:22 +0000 (UTC)
Date: Fri, 4 Dec 2020 16:05:21 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20201204210521.GA3937@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, Nick Desaulniers <ndesaulniers@google.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, vgoyal@redhat.com,
	Sergei Shtepa <sergei.shtepa@veeam.com>,
	Thomas Gleixner <tglx@linutronix.de>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.10-rc7
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:

  Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.10/dm-fixes

for you to fetch changes up to bde3808bc8c2741ad3d804f84720409aee0c2972:

  dm: remove invalid sparse __acquires and __releases annotations (2020-12-04 15:25:18 -0500)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Fix DM's bio splitting changes that were made during v5.9.
  Restores splitting in terms of varied per-target ti->max_io_len
  rather than use block core's single stacked 'chunk_sectors' limit.

- Like DM crypt, update DM integrity to not use crypto drivers that
  have CRYPTO_ALG_ALLOCATES_MEMORY set.

- Fix DM writecache target's argument parsing and status display.

- Remove needless BUG() from dm writecache's persistent_memory_claim()

- Remove old gcc workaround in DM cache target's block_div() for ARM
  link errors now that gcc >= 4.9 is required.

- Fix RCU locking in dm_blk_report_zones and dm_dax_zero_page_range.

- Remove old, and now frowned upon, BUG_ON(in_interrupt()) in
  dm_table_event().

- Remove invalid sparse annotations from dm_prepare_ioctl() and
  dm_unprepare_ioctl().

----------------------------------------------------------------
Mike Snitzer (4):
      dm writecache: remove BUG() and fail gracefully instead
      dm: fix IO splitting
      dm: fix double RCU unlock in dm_dax_zero_page_range() error path
      dm: remove invalid sparse __acquires and __releases annotations

Mikulas Patocka (3):
      dm integrity: don't use drivers that have CRYPTO_ALG_ALLOCATES_MEMORY
      dm writecache: advance the number of arguments when reporting max_age
      dm writecache: fix the maximum number of arguments

Nick Desaulniers (1):
      Revert "dm cache: fix arm link errors with inline"

Sergei Shtepa (1):
      dm: fix bug with RCU locking in dm_blk_report_zones

Thomas Gleixner (1):
      dm table: Remove BUG_ON(in_interrupt())

 block/blk-merge.c            |  2 +-
 drivers/md/dm-cache-target.c |  4 ----
 drivers/md/dm-integrity.c    |  4 ++--
 drivers/md/dm-table.c        | 11 -----------
 drivers/md/dm-writecache.c   |  6 ++++--
 drivers/md/dm.c              | 29 +++++++++++++++--------------
 include/linux/blkdev.h       | 11 ++++++-----
 7 files changed, 28 insertions(+), 39 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

