Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A2676360737
	for <lists+dm-devel@lfdr.de>; Thu, 15 Apr 2021 12:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618482861;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xRjYMUhs9WEhOkpCdT1WM3ARomV5WEfF4SBll3djADM=;
	b=D0C0dEKxDf3+ZmV6WqC+TXItYySdEw9b0DL6g5eGEBJaPdFcoKRlzcrZj86ZYwHCxrFIEO
	lPBWTqtqk5jieoMt4OZB6IFsVcOEGSBk2gC8FPzWtPULEL9Yon8B3rt72zZB6KuSnoRuRd
	bKxfdol5ZybP/BEhgXO6XCyc+oBW2OI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-jEE-R_BJM3mnSiY1ltGJAA-1; Thu, 15 Apr 2021 06:34:19 -0400
X-MC-Unique: jEE-R_BJM3mnSiY1ltGJAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0E6118B9F4A;
	Thu, 15 Apr 2021 10:34:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F21FB6064B;
	Thu, 15 Apr 2021 10:34:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7B6D44A5B;
	Thu, 15 Apr 2021 10:34:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13FAXsR9032066 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 06:33:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 714EE22E57; Thu, 15 Apr 2021 10:33:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-13-200.pek2.redhat.com [10.72.13.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE8835D9DC;
	Thu, 15 Apr 2021 10:33:40 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 15 Apr 2021 18:33:08 +0800
Message-Id: <20210415103310.1513841-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: [dm-devel] [RFC PATCH 0/2] block: support to freeze bio based queue
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

For bio based request queue, the queue usage refcnt is only grabbed
during submission, which isn't consistent with request base queue.

Queue freezing has been used widely, and turns out it is very useful
to quiesce queue activity.

So try to support to freeze bio based queue by ->q_usage_counter.

Any comment are welcome!


Ming Lei (2):
  percpu_ref: add percpu_ref_tryget_many_live
  block: support to freeze bio based request queue

 block/bio.c                     | 12 ++++++++++--
 block/blk-core.c                | 23 +++++++++++++++++------
 drivers/nvme/host/core.c        | 16 ++++++++++++++++
 drivers/nvme/host/multipath.c   |  6 ++++++
 include/linux/blk-mq.h          |  2 ++
 include/linux/blk_types.h       |  1 +
 include/linux/blkdev.h          |  7 ++++++-
 include/linux/percpu-refcount.h | 30 ++++++++++++++++++++++++++----
 8 files changed, 84 insertions(+), 13 deletions(-)

-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

