Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B681B48EF9A
	for <lists+dm-devel@lfdr.de>; Fri, 14 Jan 2022 19:04:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642183454;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8uom+7ImmsoUF2B0YzyEmknootl+Q1IrHCfP9jfLQoM=;
	b=On8Dsmr/YqBFQSUiYF1JHKKMlZOjHpjVdyZY1WY/sgOoWFSgGmiqdxJgnmxw7y0hIw6wl1
	W3ZIidZBcHAU2Bf2friJjBWYzKt2b3aJmK0eQ7ZTjRRqrFoc4FA+FjcMwlsZsdRJMbla3s
	JQ5N9MgQG1fVkQUtWk+EMq0ljL/ZXRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-ULlj5p85PPixebRRAERo3A-1; Fri, 14 Jan 2022 13:04:13 -0500
X-MC-Unique: ULlj5p85PPixebRRAERo3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 678E51083F62;
	Fri, 14 Jan 2022 18:04:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC1F7DE43;
	Fri, 14 Jan 2022 18:04:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D62341809CB9;
	Fri, 14 Jan 2022 18:03:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20EHx7iE018499 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Jan 2022 12:59:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 44E7310A33C9; Fri, 14 Jan 2022 17:59:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E2241002EFB;
	Fri, 14 Jan 2022 17:58:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 20EHwnnY017915; 
	Fri, 14 Jan 2022 11:58:49 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 20EHwmFa017914;
	Fri, 14 Jan 2022 11:58:48 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 14 Jan 2022 11:58:48 -0600
Message-Id: <1642183128-17875-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH] dm rq: clear cloned bio ->bi_bdev to fix I/O
	accounting
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bio_clone_fast() sets the cloned bio to have the same ->bi_bdev as the
source bio. This means that when request-based dm called setup_clone(),
the cloned bio had its ->bi_bdev pointing to the dm device. After Commit
0b6e522cdc4a ("blk-mq: use ->bi_bdev for I/O accounting")
__blk_account_io_start() started using the request's ->bio->bi_bdev for
I/O accounting, if it was set. This caused IO going to the underlying
devices to use the dm device for their I/O accounting.

Request-based dm can't be used on top of partitions, so
dm_rq_bio_constructor() can just clear the cloned bio's ->bi_bdev and
have __blk_account_io_start() fall back to using rq->rq_disk->part0 for
the I/O accounting.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 drivers/md/dm-rq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 579ab6183d4d..42099dc76e3c 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -328,6 +328,7 @@ static int dm_rq_bio_constructor(struct bio *bio, struct bio *bio_orig,
 	info->orig = bio_orig;
 	info->tio = tio;
 	bio->bi_end_io = end_clone_bio;
+	bio->bi_bdev = NULL;
 
 	return 0;
 }
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

