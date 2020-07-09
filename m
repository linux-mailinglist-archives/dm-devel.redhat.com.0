Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4D30D21A824
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 21:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594324217;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l2qgsjovMWgnijpL57hQVfN1OD+7D++08RqcHT/ovHw=;
	b=TMr3/FswDvxT3sTx45aKUXCLudVDOn3I5vyKsuU0VDCd47NYhXyTBAZhExsK3BXH2uRoqu
	1BTcg4YsuQirW44YpsdMt9vQKxwIJUyDw4RIHH0Ok3me5e7UEbRQxTb+8tOvgxXC6P3deP
	saHGK/Z32HEHMqezZKbkl9FflBdVeAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-AdoTmwShOtmPDhF41zNsNg-1; Thu, 09 Jul 2020 15:50:14 -0400
X-MC-Unique: AdoTmwShOtmPDhF41zNsNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DEBC18FF662;
	Thu,  9 Jul 2020 19:50:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E372D6FEE7;
	Thu,  9 Jul 2020 19:50:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FA5B84349;
	Thu,  9 Jul 2020 19:49:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069JhblZ031721 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 15:43:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C36079CEE; Thu,  9 Jul 2020 19:43:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E117C7981F;
	Thu,  9 Jul 2020 19:43:30 +0000 (UTC)
Date: Thu, 9 Jul 2020 15:43:30 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200709194329.GA14653@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Wei Yongjun <weiyongjun1@huawei.com>, Michal Suchanek <msuchanek@suse.de>,
	Christoph Hellwig <hch@lst.de>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.8-rc5
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

The following changes since commit dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258:

  Linux 5.8-rc4 (2020-07-05 16:20:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.8/dm-fixes-2

for you to fetch changes up to 6958c1c640af8c3f40fa8a2eee3b5b905d95b677:

  dm: use noio when sending kobject event (2020-07-08 12:50:51 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- A request-based DM fix to not use a waitqueue to wait for blk-mq IO
  completion because doing so is racey.

- A couple more DM zoned target fixes to address issues introduced
  during the 5.8 cycle.

- A DM core fix to use proper interface to cleanup DM's static flush
  bio.

- A DM core fix to prevent mm recursion during memory allocation
  needed by dm_kobject_uevent.

----------------------------------------------------------------
Christoph Hellwig (1):
      dm: use bio_uninit instead of bio_disassociate_blkg

Damien Le Moal (1):
      dm zoned: Fix zone reclaim trigger

Michal Suchanek (1):
      dm writecache: reject asynchronous pmem devices

Mikulas Patocka (1):
      dm: use noio when sending kobject event

Ming Lei (1):
      dm: do not use waitqueue for request-based DM

Wei Yongjun (1):
      dm zoned: fix unused but set variable warnings

 drivers/md/dm-rq.c             |  4 --
 drivers/md/dm-writecache.c     |  6 +++
 drivers/md/dm-zoned-metadata.c |  9 ++++-
 drivers/md/dm-zoned-reclaim.c  |  7 ++--
 drivers/md/dm-zoned-target.c   | 10 +----
 drivers/md/dm.c                | 84 ++++++++++++++++++++++++++----------------
 6 files changed, 71 insertions(+), 49 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

