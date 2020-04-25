Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DE7C31B848A
	for <lists+dm-devel@lfdr.de>; Sat, 25 Apr 2020 10:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587802200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9eCk1QVTuNwjlrh8f6wXn9u7Y99Wyr3gfLSgGYNij9A=;
	b=jPtfYCctV3w5ayemTCt+u1ZtEPriGqf61stD3nDADQRA850hM1OmR7rP7bJyXJmRQ5z63u
	9sFZTLD3CdhG6MHKk3KrpHYtrK8PhPLOY9UUfimrb2W7VtlO353UGqxkg2SOdz3doBJvgP
	gl78dnnZml5nFgKWXQWbNb758IyDt+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-5PQ6RoQWPoivo_QV9ywIew-1; Sat, 25 Apr 2020 04:09:58 -0400
X-MC-Unique: 5PQ6RoQWPoivo_QV9ywIew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 344BB45F;
	Sat, 25 Apr 2020 08:09:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B7E96109F;
	Sat, 25 Apr 2020 08:09:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED0041809542;
	Sat, 25 Apr 2020 08:09:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03P89Abc015422 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 25 Apr 2020 04:09:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10617103F27A; Sat, 25 Apr 2020 08:09:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B21610F1C09
	for <dm-devel@redhat.com>; Sat, 25 Apr 2020 08:09:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AE7085A59E
	for <dm-devel@redhat.com>; Sat, 25 Apr 2020 08:09:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-467-yF1nfhnWMSawustgmuc9bA-1; Sat, 25 Apr 2020 04:09:06 -0400
X-MC-Unique: yF1nfhnWMSawustgmuc9bA-1
Received: from [2001:4bb8:193:f203:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSFd9-0007dT-M3; Sat, 25 Apr 2020 07:53:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat, 25 Apr 2020 09:53:35 +0200
Message-Id: <20200425075336.721021-3-hch@lst.de>
In-Reply-To: <20200425075336.721021-1-hch@lst.de>
References: <20200425075336.721021-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03P89Abc015422
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-bcache@vger.kernel.org
Subject: [dm-devel] [PATCH 2/3] dm: remove the make_request_fn check in
	device_area_is_invalid
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-table.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 0a2cc197f62b4..8277b959e00bd 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -279,7 +279,6 @@ static struct dm_dev_internal *find_device(struct list_head *l, dev_t dev)
 static int device_area_is_invalid(struct dm_target *ti, struct dm_dev *dev,
 				  sector_t start, sector_t len, void *data)
 {
-	struct request_queue *q;
 	struct queue_limits *limits = data;
 	struct block_device *bdev = dev->bdev;
 	sector_t dev_size =
@@ -288,22 +287,6 @@ static int device_area_is_invalid(struct dm_target *ti, struct dm_dev *dev,
 		limits->logical_block_size >> SECTOR_SHIFT;
 	char b[BDEVNAME_SIZE];
 
-	/*
-	 * Some devices exist without request functions,
-	 * such as loop devices not yet bound to backing files.
-	 * Forbid the use of such devices.
-	 */
-	q = bdev_get_queue(bdev);
-	if (!q || !q->make_request_fn) {
-		DMWARN("%s: %s is not yet initialised: "
-		       "start=%llu, len=%llu, dev_size=%llu",
-		       dm_device_name(ti->table->md), bdevname(bdev, b),
-		       (unsigned long long)start,
-		       (unsigned long long)len,
-		       (unsigned long long)dev_size);
-		return 1;
-	}
-
 	if (!dev_size)
 		return 0;
 
-- 
2.26.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

