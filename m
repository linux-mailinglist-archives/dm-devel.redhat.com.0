Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0AF11D050
	for <lists+dm-devel@lfdr.de>; Thu, 12 Dec 2019 15:59:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576162781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GAAgA0L9KDwqzcPTEZ0gK/3DShqw/YJ52wFvBWMg4ZU=;
	b=PqvSNOaNpb7CMqlxvVyX2Q0+jq2rvGNyHGjq1IEoVjy4YxdStNNxedpnjgUyKLg8CGqEc/
	n0MiUEXrIY1ySpwEf7k/1YTcA3oM37oEt+jed9YX0Hon3P96y/1jjFTbAVw3m0PTmjUkgZ
	lbNThl2zHXFWxEnb5foPsq5Ak9dCkcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-wZ6pYKP2PmqxfIGvbNXOkw-1; Thu, 12 Dec 2019 09:59:39 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 626F292EAA;
	Thu, 12 Dec 2019 14:59:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E3E861F37;
	Thu, 12 Dec 2019 14:59:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 908AE8372F;
	Thu, 12 Dec 2019 14:59:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBCEx1BW017371 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Dec 2019 09:59:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 49A1560C05; Thu, 12 Dec 2019 14:59:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B859960BE1;
	Thu, 12 Dec 2019 14:58:58 +0000 (UTC)
Date: Thu, 12 Dec 2019 09:58:57 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191212145857.GA27301@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Diego Calleja <diegocg@gmail.com>, Nikos Tsironis <ntsironis@arrikto.com>,
	Eric Biggers <ebiggers@google.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Hou Tao <houtao1@huawei.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.5-rc2
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
X-MC-Unique: wZ6pYKP2PmqxfIGvbNXOkw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

The following changes since commit f612b2132db529feac4f965f28a1b9258ea7c22b:

  Revert "dm crypt: use WQ_HIGHPRI for the IO and crypt workqueues" (2019-11-20 17:27:39 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.5/dm-fixes

for you to fetch changes up to 7fc979f8204fb763e203d3e716c17d352eb96b35:

  docs: dm-integrity: remove reference to ARC4 (2019-12-10 10:02:43 -0500)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Fix DM multipath by restoring full path selector functionality for
  bio-based configurations that don't haave a SCSI device handler.

- Fix dm-btree removal to ensure non-root btree nodes have at least
  (max_entries / 3) entries.  This resolves userspace thin_check
  utility's report of "too few entries in btree_node".

- Fix both the DM thin-provisioning and dm-clone targets to properly
  flush the data device prior to metadata commit.  This resolves the
  potential for inconsistency across a power loss event when the data
  device has a volatile writeback cache.

- Small documentation fixes to dm-clone and dm-integrity.

----------------------------------------------------------------
Diego Calleja (1):
      dm: add dm-clone to the documentation index

Eric Biggers (1):
      docs: dm-integrity: remove reference to ARC4

Hou Tao (1):
      dm btree: increase rebalance threshold in __rebalance2()

Mike Snitzer (1):
      dm mpath: remove harmful bio-based optimization

Nikos Tsironis (5):
      dm clone metadata: Track exact changes per transaction
      dm clone metadata: Use a two phase commit
      dm clone: Flush destination device before committing metadata
      dm thin metadata: Add support for a pre-commit callback
      dm thin: Flush data device before committing metadata

 .../admin-guide/device-mapper/dm-integrity.rst     |   2 +-
 Documentation/admin-guide/device-mapper/index.rst  |   1 +
 drivers/md/dm-clone-metadata.c                     | 136 +++++++++++++++------
 drivers/md/dm-clone-metadata.h                     |  17 +++
 drivers/md/dm-clone-target.c                       |  53 ++++++--
 drivers/md/dm-mpath.c                              |  37 +-----
 drivers/md/dm-thin-metadata.c                      |  29 +++++
 drivers/md/dm-thin-metadata.h                      |   7 ++
 drivers/md/dm-thin.c                               |  42 ++++++-
 drivers/md/persistent-data/dm-btree-remove.c       |   8 +-
 10 files changed, 248 insertions(+), 84 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

