Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4484892BA
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jan 2022 08:57:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641801452;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ww18KCuJaYSuwv32iT6qfyxNaHPqhxdNWxeqXip1GS8=;
	b=cPnh2TCMWQHIXYfI4LvvTjUJ1llOPUFBNakA3v7J5uLCaZ9BdxjLSrSJjqzlUwUMjrumeW
	JbnX1jVylDyVzaOjOVue//lWhMzjG2Kj3hsdJ3S34TxHggLAkn+2Yn1BcqejTTsuMBfShu
	aGVRF89mcFM+wHJxtegd75qDZF+jmzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-6rlVvMgGN12IRzPx1SpogQ-1; Mon, 10 Jan 2022 02:57:29 -0500
X-MC-Unique: 6rlVvMgGN12IRzPx1SpogQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E99EC3E745;
	Mon, 10 Jan 2022 07:57:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D5DA7A22A;
	Mon, 10 Jan 2022 07:57:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6426F1809CB8;
	Mon, 10 Jan 2022 07:57:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20A7qMRm015265 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Jan 2022 02:52:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 65BAA78C20; Mon, 10 Jan 2022 07:52:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-24.pek2.redhat.com [10.72.8.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51C3B7B9D7;
	Mon, 10 Jan 2022 07:51:56 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>
Date: Mon, 10 Jan 2022 15:51:39 +0800
Message-Id: <20220110075141.389532-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, lining <lining2020x@163.com>,
	Tejun Heo <tj@kernel.org>, Chunguang Xu <brookxu@tencent.com>
Subject: [dm-devel] [PATCH 0/2] block/dm: add resubmit_bio_noacct for fixing
	iops throttling
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

Hello Guys,

Commit 4f1e9630afe6 ("blk-throtl: optimize IOPS throttle for large IO scenarios")
only fixes iops throttle for blk-mq drivers. This patchset adds API of resubmit_bio_noacct
so that we can use it for fixing the same issue on bio based drivers.

Meantime fix the issue on device mapper via the added API, and the issue
is reported by lining.

Ming Lei (2):
  block: add resubmit_bio_noacct()
  dm: use resubmit_bio_noacct to submit split bio

 block/blk-core.c       | 12 ++++++++++++
 block/blk-merge.c      |  4 +---
 drivers/md/dm.c        |  2 +-
 include/linux/blkdev.h |  1 +
 4 files changed, 15 insertions(+), 4 deletions(-)

Cc: lining <lining2020x@163.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Chunguang Xu <brookxu@tencent.com>
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

