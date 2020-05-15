Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9336C1D46DE
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 09:15:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589526954;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fzeWhdq919JkNfHkKRW06m1eQQIQzP62gq0eofTSRXs=;
	b=ENF7lhsxyrWjja/3rv662YHUmeU7r7m0WinvvFtPc2dildM/1Nua22KBIw0mO8X3uAwKOt
	IsYhPFPmZVThOEaffJqileVd23ehPU7GmIVNzlZAbCGx8txAJ/0X5V6nFi61sABNbXWZF3
	ibPmgoOsr2oT8LvJKmqHnHvNN891Bfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-9NUHGdT7Ory1a-NoYpe-CA-1; Fri, 15 May 2020 03:15:52 -0400
X-MC-Unique: 9NUHGdT7Ory1a-NoYpe-CA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9307464AD4;
	Fri, 15 May 2020 07:15:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F1E562B1E;
	Fri, 15 May 2020 07:15:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D6E51809547;
	Fri, 15 May 2020 07:15:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04F25PhQ004372 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 22:05:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D90F310336F3; Fri, 15 May 2020 02:05:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C37104FAB3
	for <dm-devel@redhat.com>; Fri, 15 May 2020 02:05:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B3398008A3
	for <dm-devel@redhat.com>; Fri, 15 May 2020 02:05:21 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-490-EK2yQ3VfOhSAZi-eA-AP3Q-1; Thu, 14 May 2020 22:05:17 -0400
X-MC-Unique: EK2yQ3VfOhSAZi-eA-AP3Q-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 88013B5C8678E9F93395;
	Fri, 15 May 2020 10:05:05 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.55) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
	10:05:04 +0800
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Matthew Wilcox
	<willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, Coly Li
	<colyli@suse.de>, Kent Overstreet <kent.overstreet@gmail.com>, "Alasdair
	Kergon" <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, linux-block
	<linux-block@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	linux-mm <linux-mm@kvack.org>, dm-devel <dm-devel@redhat.com>, Song Liu
	<song@kernel.org>, linux-raid <linux-raid@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <34fa4c00-9860-ca09-da4d-c5b20aad81b7@huawei.com>
Date: Fri, 15 May 2020 10:05:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200507075100.1779-1-thunder.leizhen@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 15 May 2020 03:15:32 -0400
Subject: Re: [dm-devel] [PATCH v2 00/10] clean up SECTOR related macros and
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, all:
   It seems no one take care about these patches. But I think patch 1 is need. And
the main discussion points of others is whether we should add
sectors_to_npage()/npage_to_sectors() or keep PAGE_SECTORS_SHIFT. And which marco
name do we prefer: PAGE_SECTORS vs SECTORS_PER_PAGE, PAGE_SECTORS_SHIFT vs
SECTORS_PER_PAGE_SHIFT.

Hi, Jens Axboe, Coly Li, Kent Overstreet,Alasdair Kergon. Mike Snitzer:
   Can you take a look at patch 1?

On 2020/5/7 15:50, Zhen Lei wrote:
> v1 --> v2:
> As Matthew Wilcox's suggestion, add sectors_to_npage()/npage_to_sectors()
> helpers to eliminate SECTORS_PER_PAGE_SHIFT, because it's quite hard to read.
> In further, I also eliminated PAGE_SECTORS_SHIFT.
> 
> I tried to eliminate all magic number "9" and "512", but it's too many, maybe
> no one want to review it, so I gave up. In the process of searching, I found
> the existing macro PAGE_SECTORS, it's equivalent to SECTORS_PER_PAGE. Because
> PAGE_SECTORS was defined in include/linux/device-mapper.h, and SECTORS_PER_PAGE
> was defined in drivers/block/zram/zram_drv.h, so I discarded SECTORS_PER_PAGE,
> althrough I prefer it so much.
> 
> v1:
> When I studied the code of mm/swap, I found "1 << (PAGE_SHIFT - 9)" appears
> many times. So I try to clean up it.
> 
> 1. Replace "1 << (PAGE_SHIFT - 9)" or similar with SECTORS_PER_PAGE
> 2. Replace "PAGE_SHIFT - 9" with SECTORS_PER_PAGE_SHIFT
> 3. Replace "9" with SECTOR_SHIFT
> 4. Replace "512" with SECTOR_SIZE
> 
> Zhen Lei (10):
>   block: move PAGE_SECTORS definition into <linux/blkdev.h>
>   zram: abolish macro SECTORS_PER_PAGE
>   block: add sectors_to_npage()/npage_to_sectors() helpers
>   zram: abolish macro SECTORS_PER_PAGE_SHIFT
>   block: abolish macro PAGE_SECTORS_SHIFT
>   mm/swap: use npage_to_sectors() and PAGE_SECTORS to clean up code
>   block: use sectors_to_npage() and PAGE_SECTORS to clean up code
>   md: use sectors_to_npage() and npage_to_sectors() to clean up code
>   md: use existing definition RESYNC_SECTORS
>   md: use PAGE_SECTORS to clean up code
> 
>  block/blk-settings.c          |  6 +++---
>  block/partitions/core.c       |  5 ++---
>  drivers/block/brd.c           |  7 ++-----
>  drivers/block/null_blk_main.c | 10 ++++------
>  drivers/block/zram/zram_drv.c |  8 ++++----
>  drivers/block/zram/zram_drv.h |  2 --
>  drivers/md/bcache/util.h      |  2 --
>  drivers/md/dm-kcopyd.c        |  2 +-
>  drivers/md/dm-table.c         |  2 +-
>  drivers/md/md-bitmap.c        | 16 ++++++++--------
>  drivers/md/md.c               |  6 +++---
>  drivers/md/raid1.c            | 10 +++++-----
>  drivers/md/raid10.c           | 28 ++++++++++++++--------------
>  drivers/md/raid5-cache.c      | 11 +++++------
>  drivers/md/raid5.c            |  4 ++--
>  include/linux/blkdev.h        |  7 +++++--
>  include/linux/device-mapper.h |  1 -
>  mm/page_io.c                  |  4 ++--
>  mm/swapfile.c                 | 12 ++++++------
>  19 files changed, 67 insertions(+), 76 deletions(-)
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

