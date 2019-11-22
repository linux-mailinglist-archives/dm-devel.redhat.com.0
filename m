Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 91101107505
	for <lists+dm-devel@lfdr.de>; Fri, 22 Nov 2019 16:38:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574437111;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FrO6HyNpYDplQhqj3WxbDw897HNiD302twb6KkEa25c=;
	b=Kt3UH7VOkZ0PausAWf8ztJ5y5+42Mkky0lgnfZ3YPvXlGKs4oJOGq5dvfYjM6uJwig1aXY
	QxzUy31yr3Aqytjfp2f0PtHlYQrf7+CZSrbEaWBD1v1MsmbpYfKR3d57nJIxWejDZYfVBD
	Ifkkwv9baYFCxfmX/L4tOgIUPu6gTXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-9YBSwA4tOz6OTEvtyKT4KA-1; Fri, 22 Nov 2019 10:38:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45D64804901;
	Fri, 22 Nov 2019 15:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DEF8600C6;
	Fri, 22 Nov 2019 15:38:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E264A1803C32;
	Fri, 22 Nov 2019 15:38:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAMFbqLI020586 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 10:37:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A401E8164; Fri, 22 Nov 2019 15:37:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ECE02934B;
	Fri, 22 Nov 2019 15:37:48 +0000 (UTC)
Date: Fri, 22 Nov 2019 10:37:47 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191122153747.GA23143@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Maged Mokhtar <mmokhtar@petasan.org>, Alasdair G Kergon <agk@redhat.com>,
	Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [git pull] device mapper changes for 5.5
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
X-MC-Unique: 9YBSwA4tOz6OTEvtyKT4KA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

The following changes since commit a99d8080aaf358d5d23581244e5da23b35e340b9:

  Linux 5.4-rc6 (2019-11-03 14:07:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.5/dm-changes

for you to fetch changes up to f612b2132db529feac4f965f28a1b9258ea7c22b:

  Revert "dm crypt: use WQ_HIGHPRI for the IO and crypt workqueues" (2019-11-20 17:27:39 -0500)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Fix DM core to disallow stacking request-based DM on partitions.

- Fix DM raid target to properly resync raidset even if bitmap needed
  additional pages.

- Fix DM crypt performance regression due to use of WQ_HIGHPRI for the
  IO and crypt workqueues.

- Fix DM integrity metadata layout that was aligned on 128K boundary
  rather than the intended 4K boundary (removes 124K of wasted space for
  each metadata block).

- Improve the DM thin, cache and clone targets to use spin_lock_irq
  rather than spin_lock_irqsave where possible.

- Fix DM thin single thread performance that was lost due to needless
  workqueue wakeups.

- Fix DM zoned target performance that was lost due to excessive backing
  device checks.

- Add ability to trigger write failure with the DM dust test target.

- Fix whitespace indentation in drivers/md/Kconfig.

- Various smalls fixes and cleanups (e.g. use struct_size, fix
  uninitialized variable, variable renames, etc).

----------------------------------------------------------------
Bryan Gurney (3):
      dm dust: change result vars to r
      dm dust: change ret to r in dust_map_read and dust_map
      dm dust: add limited write failure mode

Dmitry Fomichev (1):
      dm zoned: reduce overhead of backing device checks

Gustavo A. R. Silva (1):
      dm stripe: use struct_size() in kmalloc()

Heinz Mauelshagen (4):
      dm raid: change rs_set_dev_and_array_sectors API and callers
      dm raid: to ensure resynchronization, perform raid set grow in preresume
      dm raid: simplify rs_setup_recovery call chain
      dm raid: streamline rs_get_progress() and its raid_status() caller side

Jeffle Xu (1):
      dm thin: wakeup worker only when deferred bios exist

Krzysztof Kozlowski (1):
      dm: Fix Kconfig indentation

Maged Mokhtar (1):
      dm writecache: handle REQ_FUA

Mike Snitzer (2):
      dm table: do not allow request-based DM to stack on partitions
      Revert "dm crypt: use WQ_HIGHPRI for the IO and crypt workqueues"

Mikulas Patocka (6):
      dm writecache: fix uninitialized variable warning
      dm clone: replace spin_lock_irqsave with spin_lock_irq
      dm thin: replace spin_lock_irqsave with spin_lock_irq
      dm bio prison: replace spin_lock_irqsave with spin_lock_irq
      dm cache: replace spin_lock_irqsave with spin_lock_irq
      dm integrity: fix excessive alignment of metadata runs

Nathan Chancellor (1):
      dm raid: Remove unnecessary negation of a shift in raid10_format_to_md_layout

Nikos Tsironis (1):
      dm clone: add bucket_lock_irq/bucket_unlock_irq helpers

 .../admin-guide/device-mapper/dm-integrity.rst     |   5 +
 .../admin-guide/device-mapper/dm-raid.rst          |   2 +
 drivers/md/Kconfig                                 |  54 +++----
 drivers/md/dm-bio-prison-v1.c                      |  27 ++--
 drivers/md/dm-bio-prison-v2.c                      |  26 ++--
 drivers/md/dm-cache-target.c                       |  77 ++++------
 drivers/md/dm-clone-metadata.c                     |  29 ++--
 drivers/md/dm-clone-metadata.h                     |   4 +-
 drivers/md/dm-clone-target.c                       |  62 ++++----
 drivers/md/dm-crypt.c                              |   9 +-
 drivers/md/dm-dust.c                               |  97 ++++++++----
 drivers/md/dm-integrity.c                          |  28 +++-
 drivers/md/dm-raid.c                               | 164 +++++++++++----------
 drivers/md/dm-stripe.c                             |  15 +-
 drivers/md/dm-table.c                              |  27 +---
 drivers/md/dm-thin.c                               | 118 +++++++--------
 drivers/md/dm-writecache.c                         |   5 +-
 drivers/md/dm-zoned-metadata.c                     |  29 ++--
 drivers/md/dm-zoned-reclaim.c                      |   8 +-
 drivers/md/dm-zoned-target.c                       |  54 +++++--
 drivers/md/dm-zoned.h                              |   2 +
 include/linux/device-mapper.h                      |   3 -
 22 files changed, 433 insertions(+), 412 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

