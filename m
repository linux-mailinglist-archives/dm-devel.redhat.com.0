Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 338EDDCA59
	for <lists+dm-devel@lfdr.de>; Fri, 18 Oct 2019 18:09:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C9683086E23;
	Fri, 18 Oct 2019 16:09:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D674F60BF1;
	Fri, 18 Oct 2019 16:08:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F3174EE68;
	Fri, 18 Oct 2019 16:08:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9IG8bW1004305 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Oct 2019 12:08:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4FDD7600C4; Fri, 18 Oct 2019 16:08:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A315B600C1;
	Fri, 18 Oct 2019 16:08:34 +0000 (UTC)
Date: Fri, 18 Oct 2019 12:08:33 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20191018160833.GA5763@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>, YueHaibing <yuehaibing@huawei.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.4-rc4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 18 Oct 2019 16:09:02 +0000 (UTC)

Hi Linus,

The following changes since commit da0c9ea146cbe92b832f1b0f694840ea8eb33cce:

  Linux 5.4-rc2 (2019-10-06 14:27:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.4/dm-fixes

for you to fetch changes up to 13bd677a472d534bf100bab2713efc3f9e3f5978:

  dm cache: fix bugs when a GFP_NOWAIT allocation fails (2019-10-17 11:13:50 -0400)

Please pull, thanks.
Mike

----------------------------------------------------------------
- Fix DM snapshot deadlock that can occur due to COW throttling
  preventing locks from being released.

- Fix DM cache's GFP_NOWAIT allocation failure error paths by switching
  to GFP_NOIO.

- Make __hash_find() static in the DM clone target.

----------------------------------------------------------------
Mikulas Patocka (3):
      dm snapshot: introduce account_start_copy() and account_end_copy()
      dm snapshot: rework COW throttling to fix deadlock
      dm cache: fix bugs when a GFP_NOWAIT allocation fails

YueHaibing (1):
      dm clone: Make __hash_find static

 drivers/md/dm-cache-target.c | 28 +------------
 drivers/md/dm-clone-target.c |  4 +-
 drivers/md/dm-snap.c         | 94 ++++++++++++++++++++++++++++++++++++--------
 3 files changed, 81 insertions(+), 45 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
