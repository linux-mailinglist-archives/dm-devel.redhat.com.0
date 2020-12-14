Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 14A5B2D9E15
	for <lists+dm-devel@lfdr.de>; Mon, 14 Dec 2020 18:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607968107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0765mT6NUdXtWBL8y7O4GnXrRe8YIgCa4IDDeQ5iNPQ=;
	b=WatPm+VPhPYCI564LoU6l7HAj2fwMym3HM/kmJn3ioVPSrQPW9E8Jc727ifegCy871wUG6
	pj7vhfW6jBHetEMc6LjgPfHtGFeb9DCaM4QaWZrirUHvEeC38UO1SIAgiLKkBQ+nf5SQdS
	yLsajSMPi3Juc8tmTHabgt8eoBruqHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-PQilyLKaOj2SA2tjtWjtTw-1; Mon, 14 Dec 2020 12:48:24 -0500
X-MC-Unique: PQilyLKaOj2SA2tjtWjtTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF909100C608;
	Mon, 14 Dec 2020 17:48:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 121A75D9DC;
	Mon, 14 Dec 2020 17:48:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0F364BB7B;
	Mon, 14 Dec 2020 17:48:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BEHm1va009737 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 12:48:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7905A5D6D5; Mon, 14 Dec 2020 17:48:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51AD66267C;
	Mon, 14 Dec 2020 17:47:58 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:47:57 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20201214174757.GC2290@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-raid@vger.kernel.org, davej@codemonkey.org.uk,
	gregkh@linuxfoundation.org, linux-block@vger.kernel.org,
	song@kernel.org, dm-devel@redhat.com
Subject: [dm-devel] [git pull] 2 reverts for 5.11 to fix v5.10 MD regression
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

The following changes since commit 2c85ebc57b3e1817b6ce1a6b703928e113a90442:

  Linux 5.10 (2020-12-13 14:41:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.11/revert-problem-v5.10-raid-changes

for you to fetch changes up to 0941e3b0653fef1ea68287f6a948c6c68a45c9ba:

  Revert "dm raid: fix discard limits for raid1 and raid10" (2020-12-14 12:12:08 -0500)

Please pull, thanks.
Mike

----------------------------------------------------------------
A cascade of MD reverts occurred late in the v5.10-rcX cycle due to MD
raid10 discard optimizations having introduced potential for
corruption. Those reverts exposed a dm-raid.c compiler warning that
wasn't ever knowingly introduced. That min_not_zero() type mismatch
warning was thought to be safely fixed simply by changing 'struct
mddev' to use 'unsigned int' rather than int for chunk_sectors members
in that struct. I proposed either using a cast local to dm-raid.c but
thought changing the type to 'unsigned int' more correct. While that
may be, not enough testing was paired with code review associated with
making that change. As such we were left exposed and the result was a
report that with v5.10 btrfs on MD RAID6 failed to mount:
https://lkml.org/lkml/2020/12/14/7

Given that report, it is justified to simply revert these offending
commits. stable@ has already taken steps to revert these for 5.10.1 -
this pull request just makes sure mainline does so too.

----------------------------------------------------------------
Mike Snitzer (2):
      Revert "md: change mddev 'chunk_sectors' from int to unsigned"
      Revert "dm raid: fix discard limits for raid1 and raid10"

 drivers/md/dm-raid.c | 12 +++++-------
 drivers/md/md.h      |  4 ++--
 2 files changed, 7 insertions(+), 9 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

