Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51F272CF755
	for <lists+dm-devel@lfdr.de>; Sat,  5 Dec 2020 00:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607123571;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2qRlcv02999KaJqfIqhzR2xNguqWRz3yc1w3kIQnNcc=;
	b=KPGcqdFpiQ5vNwQCv3ukAKi2/ZMDuKL746op8FFTZKOtFOfl2ulady2AaUh5pkgj81XBD5
	iG5tLprmiorQB1O1m7jjBIfptLcolEYhPxIbTp3ot0so+KjZiPO0xoJToShQGxDGNZpDv1
	Y5SWXLEiPpNxZOcFhVnahIK8V7wEQhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-uNCWUohNPNWT_bST5rES6A-1; Fri, 04 Dec 2020 18:12:49 -0500
X-MC-Unique: uNCWUohNPNWT_bST5rES6A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F093EC1A5;
	Fri,  4 Dec 2020 23:12:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 096E75D9DB;
	Fri,  4 Dec 2020 23:12:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A897180954D;
	Fri,  4 Dec 2020 23:12:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4NCUpE018485 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 18:12:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 028C060861; Fri,  4 Dec 2020 23:12:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E857660918;
	Fri,  4 Dec 2020 23:12:26 +0000 (UTC)
Date: Fri, 4 Dec 2020 18:12:26 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20201204231225.GA4574@redhat.com>
References: <20201204210521.GA3937@redhat.com>
	<160711773655.16738.13830016046956700847.pr-tracker-bot@kernel.org>
	<20201204223742.GA82260@lobo>
MIME-Version: 1.0
In-Reply-To: <20201204223742.GA82260@lobo>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, dm-devel@redhat.com
Subject: [dm-devel] [git pull] device mapper induced block fix for 5.10-rc7
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

Hi Linus (and Jens),

Apologies for the glaring bug I introduced with my previous pull request!

The following changes since commit bde3808bc8c2741ad3d804f84720409aee0c2972:

  dm: remove invalid sparse __acquires and __releases annotations (2020-12-04 15:25:18 -0500)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.10/dm-fixes-2

for you to fetch changes up to 65f33b35722952fa076811d5686bfd8a611a80fa:

  block: fix incorrect branching in blk_max_size_offset() (2020-12-04 17:27:42 -0500)

Please pull, thanks!
Mike

----------------------------------------------------------------
Fix incorrect branching at top of blk_max_size_offset().

----------------------------------------------------------------
Mike Snitzer (1):
      block: fix incorrect branching in blk_max_size_offset()

 include/linux/blkdev.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

