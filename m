Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAF21C8CAC
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 15:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588858846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T5FOwD6vr3LPr7F6nNx4qYdaFKb5kcjkV2lUt9ht8Yw=;
	b=DMr3RCd5kXMuoAqgtnFzFUsMPbLF52OKZcskNPdc31yX+qjs/hDWH5PTmt612fb0AwoZfN
	njJIVrA88s4u1yizhWsD058u2H56nlfSt8yvfmVCz1OJriypnSgVJvADF+engmFSRRSB0x
	hkRHhF4WL99eDEuVDW0hRXyjDqumq2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-b76e3QCfNDC2IMZgfRUGiw-1; Thu, 07 May 2020 09:40:43 -0400
X-MC-Unique: b76e3QCfNDC2IMZgfRUGiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6440835B52;
	Thu,  7 May 2020 13:40:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ABD75D9E5;
	Thu,  7 May 2020 13:40:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F5E81809554;
	Thu,  7 May 2020 13:40:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0477u9vt023983 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 03:56:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BBB892166B28; Thu,  7 May 2020 07:56:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B82712166B27
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9079811E77
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:08 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-130-hwMilWRfMZSOJ-x6gJ6UBg-1; Thu, 07 May 2020 03:56:00 -0400
X-MC-Unique: hwMilWRfMZSOJ-x6gJ6UBg-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 67FFC5C86ABFCE12BA9B;
	Thu,  7 May 2020 15:55:53 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 7 May 2020 15:55:44 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Matthew Wilcox
	<willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, Coly Li
	<colyli@suse.de>, Kent Overstreet <kent.overstreet@gmail.com>, "Alasdair
	Kergon" <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, linux-block
	<linux-block@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	linux-mm <linux-mm@kvack.org>, dm-devel <dm-devel@redhat.com>, Song Liu
	<song@kernel.org>, linux-raid <linux-raid@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Date: Thu, 7 May 2020 15:50:50 +0800
Message-ID: <20200507075100.1779-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0477u9vt023983
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 09:40:06 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH v2 00/10] clean up SECTOR related macros and
	sectors/pages conversions
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v1 --> v2:
As Matthew Wilcox's suggestion, add sectors_to_npage()/npage_to_sectors()
helpers to eliminate SECTORS_PER_PAGE_SHIFT, because it's quite hard to read.
In further, I also eliminated PAGE_SECTORS_SHIFT.

I tried to eliminate all magic number "9" and "512", but it's too many, maybe
no one want to review it, so I gave up. In the process of searching, I found
the existing macro PAGE_SECTORS, it's equivalent to SECTORS_PER_PAGE. Because
PAGE_SECTORS was defined in include/linux/device-mapper.h, and SECTORS_PER_PAGE
was defined in drivers/block/zram/zram_drv.h, so I discarded SECTORS_PER_PAGE,
althrough I prefer it so much.

v1:
When I studied the code of mm/swap, I found "1 << (PAGE_SHIFT - 9)" appears
many times. So I try to clean up it.

1. Replace "1 << (PAGE_SHIFT - 9)" or similar with SECTORS_PER_PAGE
2. Replace "PAGE_SHIFT - 9" with SECTORS_PER_PAGE_SHIFT
3. Replace "9" with SECTOR_SHIFT
4. Replace "512" with SECTOR_SIZE

Zhen Lei (10):
  block: move PAGE_SECTORS definition into <linux/blkdev.h>
  zram: abolish macro SECTORS_PER_PAGE
  block: add sectors_to_npage()/npage_to_sectors() helpers
  zram: abolish macro SECTORS_PER_PAGE_SHIFT
  block: abolish macro PAGE_SECTORS_SHIFT
  mm/swap: use npage_to_sectors() and PAGE_SECTORS to clean up code
  block: use sectors_to_npage() and PAGE_SECTORS to clean up code
  md: use sectors_to_npage() and npage_to_sectors() to clean up code
  md: use existing definition RESYNC_SECTORS
  md: use PAGE_SECTORS to clean up code

 block/blk-settings.c          |  6 +++---
 block/partitions/core.c       |  5 ++---
 drivers/block/brd.c           |  7 ++-----
 drivers/block/null_blk_main.c | 10 ++++------
 drivers/block/zram/zram_drv.c |  8 ++++----
 drivers/block/zram/zram_drv.h |  2 --
 drivers/md/bcache/util.h      |  2 --
 drivers/md/dm-kcopyd.c        |  2 +-
 drivers/md/dm-table.c         |  2 +-
 drivers/md/md-bitmap.c        | 16 ++++++++--------
 drivers/md/md.c               |  6 +++---
 drivers/md/raid1.c            | 10 +++++-----
 drivers/md/raid10.c           | 28 ++++++++++++++--------------
 drivers/md/raid5-cache.c      | 11 +++++------
 drivers/md/raid5.c            |  4 ++--
 include/linux/blkdev.h        |  7 +++++--
 include/linux/device-mapper.h |  1 -
 mm/page_io.c                  |  4 ++--
 mm/swapfile.c                 | 12 ++++++------
 19 files changed, 67 insertions(+), 76 deletions(-)

-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

