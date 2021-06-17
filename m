Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DC0C03AB178
	for <lists+dm-devel@lfdr.de>; Thu, 17 Jun 2021 12:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623926211;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NJlSW3Km3lvUE/1jV/kAGFp162xIBPz79JtbQqELnuI=;
	b=Q9sI7CZzGedF8n1WMMh/lGC7vZ/0RGaAv+jDB1PcI7V/Sayi1jxDIMHnz78hZECGzgtUR7
	grcZ7ystBF3HHlMm/eEFxcDFyUcIGoVFJJC+sDCpfkHn2yo2+nWak5h7pwKh+KT28gyV3N
	phZRRSov3nWtsjO+iVGOEdJsYVcmPZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-y5pbf1PfNIqAtnNnTIdYWA-1; Thu, 17 Jun 2021 06:36:46 -0400
X-MC-Unique: y5pbf1PfNIqAtnNnTIdYWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E99110C1ADC;
	Thu, 17 Jun 2021 10:36:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CC2760C03;
	Thu, 17 Jun 2021 10:36:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC1DE4A717;
	Thu, 17 Jun 2021 10:36:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15HAaHZl018118 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Jun 2021 06:36:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B50295C233; Thu, 17 Jun 2021 10:36:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-12-77.pek2.redhat.com [10.72.12.77])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F8CC5C22A;
	Thu, 17 Jun 2021 10:35:57 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 17 Jun 2021 18:35:46 +0800
Message-Id: <20210617103549.930311-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [RFC PATCH V2 0/3] block/dm: support bio polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Any comments are welcome.

V2:
	- drop patch to add new fields into bio
	- support io polling for dm native bio splitting
	- add comment

Ming Lei (3):
  block: add helper of blk_queue_poll
  block: add ->poll_bio to block_device_operations
  dm: support bio polling

 block/blk-core.c         |  21 +++++---
 block/blk-sysfs.c        |   4 +-
 block/genhd.c            |   3 ++
 drivers/md/dm-table.c    |  24 +++++++++
 drivers/md/dm.c          | 111 +++++++++++++++++++++++++++++++++++++--
 drivers/nvme/host/core.c |   2 +-
 include/linux/blkdev.h   |   3 ++
 7 files changed, 155 insertions(+), 13 deletions(-)

-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

