Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F5589C3
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 20:21:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA388883BA;
	Thu, 27 Jun 2019 18:21:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFB5860126;
	Thu, 27 Jun 2019 18:20:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F6E2E160;
	Thu, 27 Jun 2019 18:20:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RIJDR0024642 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 14:19:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 577A160C64; Thu, 27 Jun 2019 18:19:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94AE460BE0;
	Thu, 27 Jun 2019 18:19:07 +0000 (UTC)
Date: Thu, 27 Jun 2019 14:19:06 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190627181904.GA10850@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jerome Marchand <jmarchan@redhat.com>, zhangyi <yi.zhang@huawei.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Gen Zhang <blackgod016574@gmail.com>,
	Milan Broz <gmazyland@gmail.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.2 final
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 27 Jun 2019 18:21:54 +0000 (UTC)

Hi Linus,

The following changes since commit 9e0babf2c06c73cda2c0cd37a1653d823adb40ec:

  Linux 5.2-rc5 (2019-06-16 08:49:45 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.2/dm-fixes-2

for you to fetch changes up to 2eba4e640b2c4161e31ae20090a53ee02a518657:

  dm verity: use message limit for data block corruption message (2019-06-25 14:09:14 -0400)

Please pull, thanks.
Mike

----------------------------------------------------------------
- Fix incorrect uses of kstrndup and DM logging macros in DM's early
  init code.

- Fix DM log-writes target's handling of super block sectors so updates
  are made in order through use of completion.

- Fix DM core's argument splitting code to avoid undefined behaviour
  reported as a side-effect of UBSAN analysis on ppc64le.

- Fix DM verity target to limit the amount of error messages that can
  result from a corrupt block being found.

----------------------------------------------------------------
Gen Zhang (1):
      dm init: fix incorrect uses of kstrndup()

Jerome Marchand (1):
      dm table: don't copy from a NULL pointer in realloc_argv()

Milan Broz (1):
      dm verity: use message limit for data block corruption message

Stephen Boyd (1):
      dm init: remove trailing newline from calls to DMERR() and DMINFO()

zhangyi (F) (1):
      dm log writes: make sure super sector log updates are written in order

 drivers/md/dm-init.c          | 10 +++++-----
 drivers/md/dm-log-writes.c    | 23 +++++++++++++++++++++--
 drivers/md/dm-table.c         |  2 +-
 drivers/md/dm-verity-target.c |  4 ++--
 4 files changed, 29 insertions(+), 10 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
