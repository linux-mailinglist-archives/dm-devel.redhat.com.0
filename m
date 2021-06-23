Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7167B3B14FF
	for <lists+dm-devel@lfdr.de>; Wed, 23 Jun 2021 09:42:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624434143;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yU3Gh06DbY9OqH65n9K4iwlNgu8I949Vu/jUSm5eCzw=;
	b=YfLjf9PHswuBGHjL6qiU3mwzk4G87atlQkv0mam1Q9FpLxyHLR9RkiTo5Etpq20HqF/qhS
	wNK2HxlZGNZCPaJ8zqdmtuigOc/izTHq2x4cjlWyvnsDqPC0wMox4KhE+IGZ4RchLIG2cg
	smCst3DRY5zyh3+RTsx8EMu4UI7qLd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-6D3texlmOiiFAoRDXCBG_g-1; Wed, 23 Jun 2021 03:41:41 -0400
X-MC-Unique: 6D3texlmOiiFAoRDXCBG_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB439F92F;
	Wed, 23 Jun 2021 07:41:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F10560C05;
	Wed, 23 Jun 2021 07:41:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABA941809C99;
	Wed, 23 Jun 2021 07:41:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15N7ewGU008251 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 03:40:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77C0C5D705; Wed, 23 Jun 2021 07:40:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-52.pek2.redhat.com [10.72.12.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C58375D6D1;
	Wed, 23 Jun 2021 07:40:46 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 23 Jun 2021 15:40:29 +0800
Message-Id: <20210623074032.1484665-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [PATCH V3 0/3] block/dm: support bio polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Guys,

Based on Christoph's bio based polling model[1], implement DM bio polling
with one very simple approach.

Patch 1 adds helper of blk_queue_poll().

Patch 2 adds .bio_poll() callback to block_device_operations, so bio
driver can implement its own logic for io polling.

Patch 3 implements bio polling for device mapper.


V3:
	- patch style change as suggested by Christoph(2/3)
	- fix kernel panic issue caused by nested dm polling, which is found
	  & figured out by Jeffle Xu (3/3)
	- re-organize setup polling code (3/3)
	- remove RFC

V2:
	- drop patch to add new fields into bio
	- support io polling for dm native bio splitting
	- add comment

Ming Lei (3):
  block: add helper of blk_queue_poll
  block: add ->poll_bio to block_device_operations
  dm: support bio polling

 block/blk-core.c         |  18 +++---
 block/blk-sysfs.c        |   4 +-
 block/genhd.c            |   2 +
 drivers/md/dm-table.c    |  24 +++++++
 drivers/md/dm.c          | 131 ++++++++++++++++++++++++++++++++++++++-
 drivers/nvme/host/core.c |   2 +-
 include/linux/blkdev.h   |   2 +
 7 files changed, 170 insertions(+), 13 deletions(-)

-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

