Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 91EDE347837
	for <lists+dm-devel@lfdr.de>; Wed, 24 Mar 2021 13:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616588414;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Db5BOlROFBBLmpQJU2GpLnHuE/jqS2uiUfFwWgUL6kk=;
	b=IkXqabSVXurODh9b2T94f4PsibzCdL/QrvW2ZVNXctp8Su7Jg2Ul7vpZHPetkMofpCKapw
	6KmgXljkc3uLXqTsSbNZghkTagF35M8BufMc/AlqxG8CxCVHwTywUt2mbdpAmZ8WprFI0E
	Uz3QWovApFnQCeJWIW7ZXeYo+jIrKcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-QSqgfya5OYmfIVIktQgExw-1; Wed, 24 Mar 2021 08:20:12 -0400
X-MC-Unique: QSqgfya5OYmfIVIktQgExw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2F7218C89DD;
	Wed, 24 Mar 2021 12:20:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0F901037E80;
	Wed, 24 Mar 2021 12:20:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5F1C1809C83;
	Wed, 24 Mar 2021 12:19:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12OCJfM8005030 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 08:19:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 434D01037E80; Wed, 24 Mar 2021 12:19:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-13-127.pek2.redhat.com [10.72.13.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D932D1001281;
	Wed, 24 Mar 2021 12:19:32 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 24 Mar 2021 20:19:14 +0800
Message-Id: <20210324121927.362525-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH V3 00/13] block: support bio based io polling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

V3:
	- fix cookie returned for bio based driver, as suggested by Jeffle
	  Xu
	- draining pending bios when submission context is exiting
	- patch style and comment fix, as suggested by Mike
	- allow poll context data to be NULL by always polling on submission
	  queue
	- remove RFC, and reviewed-by

V2:
	- address queue depth scalability issue reported by Jeffle via bio
	group list. Reuse .bi_end_io for linking bios which share same
	.bi_end_io, and support 32 such groups in submit queue. With this way,
	the scalability issue caused by kfifio is solved. Before really
	ending bio, .bi_end_io is recovered from the group head.

Jeffle Xu (4):
  block/mq: extract one helper function polling hw queue
  block: add queue_to_disk() to get gendisk from request_queue
  block: add poll_capable method to support bio-based IO polling
  dm: support IO polling for bio-based dm device

Ming Lei (9):
  block: add helper of blk_queue_poll
  block: add one helper to free io_context
  block: add helper of blk_create_io_context
  block: create io poll context for submission and poll task
  block: add req flag of REQ_POLL_CTX
  block: add new field into 'struct bvec_iter'
  block: prepare for supporting bio_list via other link
  block: use per-task poll context to implement bio based io polling
  blk-mq: limit hw queues to be polled in each blk_poll()

 block/bio.c                   |   5 +
 block/blk-core.c              | 251 ++++++++++++++++++++++++++--
 block/blk-ioc.c               |  14 +-
 block/blk-mq.c                | 300 +++++++++++++++++++++++++++++++++-
 block/blk-sysfs.c             |  14 +-
 block/blk.h                   |  65 ++++++++
 drivers/md/dm-table.c         |  24 +++
 drivers/md/dm.c               |  14 ++
 drivers/nvme/host/core.c      |   2 +-
 include/linux/bio.h           | 132 +++++++--------
 include/linux/blk_types.h     |  22 ++-
 include/linux/blkdev.h        |   4 +
 include/linux/bvec.h          |   8 +
 include/linux/device-mapper.h |   1 +
 include/linux/iocontext.h     |   2 +
 include/trace/events/kyber.h  |   6 +-
 16 files changed, 770 insertions(+), 94 deletions(-)

-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

