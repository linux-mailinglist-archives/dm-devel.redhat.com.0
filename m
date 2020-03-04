Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A169D1792EF
	for <lists+dm-devel@lfdr.de>; Wed,  4 Mar 2020 16:03:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583334226;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2mxnIbCusXIBWKZd/aoV9WefTUR01VJ+gF/HLIFXoi4=;
	b=BBCfF3g90kjmCfmVp9u0MllH/8CqQncTMH9HneZ3MnRnxn8J1SXulA/Ufzu8qNbvhOt99e
	AeuiFu2RizRoLY74t9SSazROHc1WJaUiBduv5W6E7xgW+NpgQTU7h0Ti78vkFT666LIGdP
	GKvk/5we7Bs4dSAMORf6/anS3rbPrTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-nrd9nSkENTqgJ8xbromEZQ-1; Wed, 04 Mar 2020 10:03:43 -0500
X-MC-Unique: nrd9nSkENTqgJ8xbromEZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FBBA18C43CB;
	Wed,  4 Mar 2020 15:03:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B916A8B570;
	Wed,  4 Mar 2020 15:03:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E49DE86A04;
	Wed,  4 Mar 2020 15:03:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 024F31hI015992 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Mar 2020 10:03:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC58290CC3; Wed,  4 Mar 2020 15:03:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4445691D8C;
	Wed,  4 Mar 2020 15:02:58 +0000 (UTC)
Date: Wed, 4 Mar 2020 10:02:57 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200304150257.GA19885@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Theodore Ts'o <tytso@mit.edu>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Hou Tao <houtao1@huawei.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.6-rc5
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
Content-Disposition: inline

Hi Linus,

The following changes since commit 47ace7e012b9f7ad71d43ac9063d335ea3d6820b:

  dm: fix potential for q->make_request_fn NULL pointer (2020-01-27 14:52:36 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.6/dm-fixes

for you to fetch changes up to 636be4241bdd88fec273b38723e44bad4e1c4fae:

  dm: bump version of core and various targets (2020-03-03 11:10:21 -0500)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Fix request-based DM's congestion_fn and actually wire it up to the
  bdi.

- Extend dm-bio-record to track additional struct bio members needed
  by DM integrity target.

- Fix DM core to properly advertise that a device is suspended during
  unload (between the presuspend and postsuspend hooks).  This change
  is a prereq for related DM integrity and DM writecache fixes.  It
  elevates DM integrity's 'suspending' state tracking to DM core.

- Four stable fixes for DM integrity target.

- Fix crash in DM cache target due to incorrect work item cancelling.

- Fix DM thin metadata lockdep warning that was introduced during 5.6
  merge window.

- Fix DM zoned target's chunk work refcounting that regressed during
  recent conversion to refcount_t.

- Bump the minor version for DM core and all target versions that have
  seen interface changes or important fixes during the 5.6 cycle.

----------------------------------------------------------------
Hou Tao (1):
      dm: fix congested_fn for request-based device

Mike Snitzer (3):
      dm bio record: save/restore bi_end_io and bi_integrity
      dm integrity: use dm_bio_record and dm_bio_restore
      dm: bump version of core and various targets

Mikulas Patocka (6):
      dm integrity: fix recalculation when moving from journal mode to bitmap mode
      dm integrity: fix a deadlock due to offloading to an incorrect workqueue
      dm integrity: fix invalid table returned due to argument count mismatch
      dm cache: fix a crash due to incorrect work item cancelling
      dm: report suspended device during destroy
      dm writecache: verify watermark during resume

Shin'ichiro Kawasaki (1):
      dm zoned: Fix reference counter initial value of chunk works

Theodore Ts'o (1):
      dm thin metadata: fix lockdep complaint

 drivers/md/dm-bio-record.h    | 15 ++++++++
 drivers/md/dm-cache-target.c  |  6 ++--
 drivers/md/dm-integrity.c     | 84 ++++++++++++++++++++++---------------------
 drivers/md/dm-mpath.c         |  2 +-
 drivers/md/dm-thin-metadata.c |  2 +-
 drivers/md/dm-verity-target.c |  2 +-
 drivers/md/dm-writecache.c    | 16 ++++++---
 drivers/md/dm-zoned-target.c  | 10 +++---
 drivers/md/dm.c               | 22 ++++++------
 include/uapi/linux/dm-ioctl.h |  4 +--
 10 files changed, 94 insertions(+), 69 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

