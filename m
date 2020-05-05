Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3571C1C633C
	for <lists+dm-devel@lfdr.de>; Tue,  5 May 2020 23:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588714871;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mn/tf3gxrP0oYG0+wkMO9Ax1dquO2e0PNVUA7lp3usw=;
	b=gGM4Fp2BzFK8obMFXH6UFEu1bEuEN3VgkgHdzcZkcPso1aENZvyFYG/AK6ytYqJomkBCmd
	2FOvqgRMv6H73/CEyCk5QMzipNQR0aNARC6buWSmvmIzhtNQq5J4K6AmzFI0M7FXDYwKZw
	QbjVYJ3TTWWCyC8c5Oj9c3CFi1OX508=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-FBfJptxmOBiLM7Duek7CZA-1; Tue, 05 May 2020 17:41:09 -0400
X-MC-Unique: FBfJptxmOBiLM7Duek7CZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D18318FF663;
	Tue,  5 May 2020 21:41:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 831886442C;
	Tue,  5 May 2020 21:41:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A3081809542;
	Tue,  5 May 2020 21:40:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045CCqSF010908 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 08:12:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4695BB3007; Tue,  5 May 2020 12:12:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42CB81131E
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:12:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E8E01859162
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:12:52 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-QIqKqdnkM5WTrc7XqQweKA-1; Tue, 05 May 2020 08:12:47 -0400
X-MC-Unique: QIqKqdnkM5WTrc7XqQweKA-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id D52B2ECE72F96FF1ABBA;
	Tue,  5 May 2020 19:56:03 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 5 May 2020 19:55:54 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Jens Axboe
	<axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, linux-mm <linux-mm@kvack.org>, Alasdair Kergon
	<agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, dm-devel
	<dm-devel@redhat.com>, Song Liu <song@kernel.org>, linux-raid
	<linux-raid@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Date: Tue, 5 May 2020 19:55:39 +0800
Message-ID: <20200505115543.1660-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045CCqSF010908
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 May 2020 17:40:30 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH 0/4] eliminate SECTOR related magic numbers and
	duplicated conversions
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

When I studied the code of mm/swap, I found "1 << (PAGE_SHIFT - 9)" appears
many times. So I try to clean up it.

1. Replace "1 << (PAGE_SHIFT - 9)" or similar with SECTORS_PER_PAGE
2. Replace "PAGE_SHIFT - 9" with SECTORS_PER_PAGE_SHIFT
3. Replace "9" with SECTOR_SHIFT
4. Replace "512" with SECTOR_SIZE

No functional change.

Zhen Lei (4):
  block: Move SECTORS_PER_PAGE and SECTORS_PER_PAGE_SHIFT definitions
    into <linux/blkdev.h>
  mm/swap: use SECTORS_PER_PAGE_SHIFT to clean up code
  block: use SECTORS_PER_PAGE_SHIFT and SECTORS_PER_PAGE to clean up
    code
  mtd: eliminate SECTOR related magic numbers

 block/blk-settings.c          |  8 ++++----
 block/partitions/core.c       |  4 ++--
 drivers/block/zram/zram_drv.h |  2 --
 drivers/md/dm-table.c         |  2 +-
 drivers/md/raid1.c            |  4 ++--
 drivers/md/raid10.c           | 10 +++++-----
 drivers/md/raid5-cache.c      | 10 +++++-----
 include/linux/blkdev.h        | 10 ++++++++--
 mm/page_io.c                  |  4 ++--
 mm/swapfile.c                 | 12 ++++++------
 10 files changed, 35 insertions(+), 31 deletions(-)

-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

