Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EB2C120BFC4
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243471;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cSmhcINJTxiP/FmdC+LZFWkqKNfkfhAh1nqXfOJ6yO0=;
	b=H6lyqVkLPuCG4Jogj72owgpNhlrJTKuGs3M4ENjf7JRgA4HlZ5+vcKU+QdsgLjVKDu4ZUX
	N1m0BOOgJpRBrufukPneUhpRZQzadEv2Yyxq+aRnutE13Ohe1Y56mskz9YW3GxDuF1EmI6
	5LxNNmeGr1YnfoyLZCCh8txGE8h6IPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-9IHuuOmdPae5fwmZPUAiAw-1; Sat, 27 Jun 2020 03:37:48 -0400
X-MC-Unique: 9IHuuOmdPae5fwmZPUAiAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 109B28014D4;
	Sat, 27 Jun 2020 07:37:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C4BA8205F;
	Sat, 27 Jun 2020 07:37:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D0461809554;
	Sat, 27 Jun 2020 07:37:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7bVMH004401 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2CA31AF51A; Sat, 27 Jun 2020 07:37:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE86F1AF519
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35076185A78B
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:28 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-11-lYVZHUXoPcWIAjc2iQXbAg-1; Sat, 27 Jun 2020 03:37:19 -0400
X-MC-Unique: lYVZHUXoPcWIAjc2iQXbAg-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5Jg-0006lM-6A; Sat, 27 Jun 2020 07:32:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:45 +0200
Message-Id: <20200627073159.2447325-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Dennis Zhou <dennis@kernel.org>
Subject: [dm-devel] drive-by blk-cgroup cleanups
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

Hi all,

while looking into another "project" I ended up wading through the
blkcq code for research and found a bunch of lose ends.  So here is
a bunch of drive-by cleanups for the code.

Diffstat:
 block/bio.c                |  143 +----------------------------------
 block/blk-cgroup.c         |  182 +++++++++++++++++++++++++++++++++++++--------
 block/blk-core.c           |    7 +
 block/blk-throttle.c       |   10 +-
 block/blk.h                |    2 
 drivers/md/dm.c            |    5 -
 include/linux/bio.h        |    9 --
 include/linux/blk-cgroup.h |  101 ------------------------
 kernel/cgroup/rstat.c      |    1 
 mm/page_io.c               |   17 ++++
 10 files changed, 192 insertions(+), 285 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

