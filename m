Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 605F333CBEB
	for <lists+dm-devel@lfdr.de>; Tue, 16 Mar 2021 04:19:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615864739;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FpcUjJ7/fJDqoootrbskBQfcxN6t2nGsx9M73Yczq0g=;
	b=DCyHOkHpt2qbSnB0ByJutO4VSWWrj1j/M7jRDeUY+hhg67kOrCRqHv+zD/brdfl0aKjseh
	j2qz4WJS68CTKn3m2zzBRohxmAtLVIKmWlFvymayPrYOH/b3iJApWRvtvA2Wwyo/jDHUBM
	pEWVmhwpIXPtVOQZq8pxuNTeS6prTOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-CwZ_GC1dO8CBrpBxNaGiaA-1; Mon, 15 Mar 2021 23:18:57 -0400
X-MC-Unique: CwZ_GC1dO8CBrpBxNaGiaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6B1C1074659;
	Tue, 16 Mar 2021 03:18:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2073F5C3E6;
	Tue, 16 Mar 2021 03:18:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 68CB218095C9;
	Tue, 16 Mar 2021 03:18:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12G3H7CD002636 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Mar 2021 23:17:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4BD551B472; Tue, 16 Mar 2021 03:17:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-86.pek2.redhat.com [10.72.12.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85D6E614FB;
	Tue, 16 Mar 2021 03:16:56 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 16 Mar 2021 11:15:12 +0800
Message-Id: <20210316031523.864506-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>, Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH 00/11] block: support bio based io polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Add per-task io poll context for holding HIPRI blk-mq/underlying bios
queued from bio based driver's io submission context, and reuse one bio
padding field for storing 'cookie' returned from submit_bio() for these
bios. Also explicitly end these bios in poll context by adding two
new bio flags.

In this way, we needn't to poll all underlying hw queues any more,
which is implemented in Jeffle's patches. And we can just poll hw queues
in which there is HIPRI IO queued.

Usually io submission and io poll share same context, so the added io
poll context data is just like one stack variable, and the cost for
saving bios is cheap.

Any comments are welcome.


Jeffle Xu (4):
  block/mq: extract one helper function polling hw queue
  block: add queue_to_disk() to get gendisk from request_queue
  block: add poll_capable method to support bio-based IO polling
  dm: support IO polling for bio-based dm device

Ming Lei (7):
  block: add helper of blk_queue_poll
  block: add one helper to free io_context
  block: add helper of blk_create_io_context
  block: create io poll context for submission and poll task
  block: add req flag of REQ_TAG
  block: add new field into 'struct bvec_iter'
  block: use per-task poll context to implement bio based io poll

 block/bio.c                   |   5 +
 block/blk-core.c              | 161 ++++++++++++++++++++++++++---
 block/blk-ioc.c               |  12 ++-
 block/blk-mq.c                | 189 ++++++++++++++++++++++++++++++++--
 block/blk-sysfs.c             |  14 ++-
 block/blk.h                   |  45 ++++++++
 drivers/md/dm-table.c         |  24 +++++
 drivers/md/dm.c               |  14 +++
 drivers/nvme/host/core.c      |   2 +-
 include/linux/blk_types.h     |   7 ++
 include/linux/blkdev.h        |   4 +
 include/linux/bvec.h          |   9 ++
 include/linux/device-mapper.h |   1 +
 include/linux/iocontext.h     |   2 +
 include/trace/events/kyber.h  |   6 +-
 15 files changed, 466 insertions(+), 29 deletions(-)

-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

