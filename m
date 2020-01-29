Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D04B614CF6C
	for <lists+dm-devel@lfdr.de>; Wed, 29 Jan 2020 18:18:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580318285;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7b3UK+hx02RmubPVdn5eEdkO35tVqgStVmYetmaC++Q=;
	b=GHbrUAW5RD4vFY2GbBexOE808M8FgOZ1kr+MliFdtDgP19gGA/xDSoSKp3Q/exN8sAXYks
	pcu/tCQ+JsFDGpy61WrC5qkRC42imaCp8ehYDZNb27xXlawQK2ur1UUGr2E+xRqnf9cjbL
	8X4zPJ2J7qr+2ZDPxcsCXBkUDbdPHc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-0ZNbvuJPN9eYgwkGY9U-vA-1; Wed, 29 Jan 2020 12:18:02 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2154B800D55;
	Wed, 29 Jan 2020 17:17:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 772615D9C5;
	Wed, 29 Jan 2020 17:17:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8297987A62;
	Wed, 29 Jan 2020 17:17:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00THHC79027130 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Jan 2020 12:17:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B80245DA7B; Wed, 29 Jan 2020 17:17:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1CCF5D9C5;
	Wed, 29 Jan 2020 17:17:04 +0000 (UTC)
Date: Wed, 29 Jan 2020 12:17:03 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200129171703.GA26110@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: zhengbin <zhengbin13@huawei.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	"xianrong.zhou" <xianrong.zhou@transsion.com>,
	Joe Thornber <ejt@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Anatol Pomazau <anatol@google.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Mikulas Patocka <mpatocka@redhat.com>, Milan Broz <gmazyland@gmail.com>,
	Alasdair G Kergon <agk@redhat.com>, Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [git pull] device mapper changes for 5.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 0ZNbvuJPN9eYgwkGY9U-vA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.6/dm-changes

for you to fetch changes up to 47ace7e012b9f7ad71d43ac9063d335ea3d6820b:

  dm: fix potential for q->make_request_fn NULL pointer (2020-01-27 14:52:36 -0500)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Fix DM core's potential for q->make_request_fn NULL pointer in the
  unlikely case that a DM device is created without a DM table and
  then accessed due to upper-layer userspace code or user error.

- Fix DM thin-provisioning's metadata_pre_commit_callback to not use
  memory after it is free'd.  Also refactor code to disallow changing
  the thin-pool's data device once in use -- doing so guarantees smae
  lifetime of pool's data device relative to the pool metadata.

- Fix DM space maps used by DM thinp and DM cache to avoid reuse of a
  already used block. This race was identified with extremely heavy
  snapshot use in the context of DM thin provisioning.

- Fix DM raid's table status relative to an active rebuild.

- Fix DM crypt to use GFP_NOIO rather than GFP_NOFS in call to
  skcipher_request_alloc(). Also fix benbi IV constructor crash if
  used in authenticated mode.

- Add DM crypt support for Elephant diffuser to allow for Bitlocker
  compatibility.

- Fix DM verity target to not prefetch hash blocks for data that has
  already been verified.

- Fix DM writecache's incorrect flush sequence during commit when in
  SSD mode.

- Improve DM writecache's sequential write performance on SSDs.

- Add DM zoned target support for zone sizes smaller than 128MiB.

- Add DM multipath 'queue_if_no_path_timeout_secs' module param to
  allow timeout if path isn't reinstated. This allows users a kernel
  safety-net against IO hanging indefinitely, due to no active paths,
  that has historically only been provided by multipathd userspace.

- Various DM code cleanups to use true/false rather than 1/0, a
  variable rename in dm-dust, and fix for a math error in comment for
  DM thin metadata's ondisk format.

----------------------------------------------------------------
Anatol Pomazau (1):
      dm mpath: Add timeout mechanism for queue_if_no_path

Bryan Gurney (1):
      dm dust: change ret to r in dust_map_write

Dmitry Fomichev (1):
      dm zoned: support zone sizes smaller than 128MiB

Heinz Mauelshagen (1):
      dm raid: table line rebuild status fixes

Jeffle Xu (1):
      dm thin metadata: Fix trivial math error in on-disk format documentation

Joe Thornber (1):
      dm space map common: fix to ensure new block isn't already in use

Mike Snitzer (3):
      dm thin metadata: use pool locking at end of dm_pool_metadata_close
      dm thin: fix use-after-free in metadata_pre_commit_callback
      dm: fix potential for q->make_request_fn NULL pointer

Mikulas Patocka (5):
      dm crypt: fix GFP flags passed to skcipher_request_alloc()
      dm writecache: fix incorrect flush sequence when doing SSD mode commit
      dm thin: don't allow changing data device during thin-pool reload
      dm thin: change data device's flush_bio to be member of struct pool
      dm writecache: improve performance of large linear writes on SSDs

Milan Broz (2):
      dm crypt: Implement Elephant diffuser for Bitlocker compatibility
      dm crypt: fix benbi IV constructor crash if used in authenticated mode

xianrong.zhou (1):
      dm verity: don't prefetch hash blocks for already-verified data

zhengbin (4):
      dm mpath: use true/false for bool variable
      dm bio prison v2: use true/false for bool variable
      dm snapshot: use true/false for bool variable
      dm thin metadata: use true/false for bool variable

 .../admin-guide/device-mapper/dm-raid.rst          |   2 +
 drivers/md/dm-bio-prison-v2.c                      |   2 +-
 drivers/md/dm-crypt.c                              | 335 ++++++++++++++++++++-
 drivers/md/dm-dust.c                               |   6 +-
 drivers/md/dm-mpath.c                              |  68 ++++-
 drivers/md/dm-raid.c                               |  43 +--
 drivers/md/dm-snap.c                               |   6 +-
 drivers/md/dm-thin-metadata.c                      |  22 +-
 drivers/md/dm-thin.c                               |  36 ++-
 drivers/md/dm-verity-target.c                      |  18 +-
 drivers/md/dm-writecache.c                         |  71 +++--
 drivers/md/dm-zoned-metadata.c                     |  23 +-
 drivers/md/dm.c                                    |   9 +-
 drivers/md/persistent-data/dm-space-map-common.c   |  27 ++
 drivers/md/persistent-data/dm-space-map-common.h   |   2 +
 drivers/md/persistent-data/dm-space-map-disk.c     |   6 +-
 drivers/md/persistent-data/dm-space-map-metadata.c |   5 +-
 17 files changed, 580 insertions(+), 101 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

