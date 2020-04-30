Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCBB1C0A0B
	for <lists+dm-devel@lfdr.de>; Fri,  1 May 2020 00:08:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588284495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UaCoDIWy/EuQqoUgkfbNb47+jE3zUf1oVpCUqPtBPJQ=;
	b=g7ESEnkfHJrAZseRZhp5x9F9g1csW768/Xa2GS9Fz54Uq40KvL0NGjhZv0MY4iuGja2UFJ
	0w8SMd3ZW6DkCPUkhguE4jutfwQIjbko98A1A2m9D9PqhuAmA1tZswRlyB9ETe3RfY48/Q
	0061mZLzRDUUOjEhnfTEPZtA2LhNsNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-rMY0RAJgOPOvNwKffPm5BQ-1; Thu, 30 Apr 2020 18:08:12 -0400
X-MC-Unique: rMY0RAJgOPOvNwKffPm5BQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62626107ACCA;
	Thu, 30 Apr 2020 22:08:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE4225EDF4;
	Thu, 30 Apr 2020 22:08:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A38001809542;
	Thu, 30 Apr 2020 22:07:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03UM7dto004850 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Apr 2020 18:07:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8BBE5EE05; Thu, 30 Apr 2020 22:07:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E201E5D777;
	Thu, 30 Apr 2020 22:07:36 +0000 (UTC)
Date: Thu, 30 Apr 2020 18:07:36 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200430220735.GA30584@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Sunwook Eom <speed.eom@samsung.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Milan Broz <gmazyland@gmail.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.7-rc4
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

The following changes since commit 8267d8fb4819afa76b2a54dca48efdda6f0b1910:

  dm integrity: fix logic bug in integrity tag testing (2020-04-03 13:07:41 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.7/dm-fixes-2

for you to fetch changes up to 5686dee34dbfe0238c0274e0454fa0174ac0a57a:

  dm multipath: use updated MPATHF_QUEUE_IO on mapping for bio-based mpath (2020-04-28 19:51:46 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Document DM integrity allow_discard feature that was added during
  5.7 merge window.

- Fix potential for DM writecache data corruption during DM table
  reloads.

- Fix DM verity's FEC support's hash block number calculation in
  verity_fec_decode().

- Fix bio-based DM multipath crash due to use of stale copy of
  MPATHF_QUEUE_IO flag state in __map_bio().

----------------------------------------------------------------
Gabriel Krisman Bertazi (1):
      dm multipath: use updated MPATHF_QUEUE_IO on mapping for bio-based mpath

Mikulas Patocka (1):
      dm writecache: fix data corruption when reloading the target

Milan Broz (1):
      dm integrity: document allow_discard option

Sunwook Eom (1):
      dm verity fec: fix hash block number in verity_fec_decode

 .../admin-guide/device-mapper/dm-integrity.rst     | 15 ++++---
 drivers/md/dm-mpath.c                              |  6 ++-
 drivers/md/dm-verity-fec.c                         |  2 +-
 drivers/md/dm-writecache.c                         | 52 +++++++++++++++-------
 4 files changed, 51 insertions(+), 24 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

