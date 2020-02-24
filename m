Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 08F1916A1FE
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582536095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=93GJLxiOtW42feouOodg/nWU957AHn+o/IDArNevYV8=;
	b=hA6LXYrJYP/x9ooa2R56DHceug9RNNGyAzh7XlmlXR4BMH0c8GBMAFutJjdYpFNW4W+Vby
	Py8W4OLvuYm/b60GqbFAwKC/IMBkqX2x9kt/2+rWySy1CrA83dmeccdi3ghtFy1ttcA66g
	YLLySMSrD4P6e2i7fMqaKE/xmqx0hso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-Q1qPGc1hMX2ypvt62ZVwKQ-1; Mon, 24 Feb 2020 04:21:33 -0500
X-MC-Unique: Q1qPGc1hMX2ypvt62ZVwKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC65F1084432;
	Mon, 24 Feb 2020 09:21:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A107C5DA7C;
	Mon, 24 Feb 2020 09:21:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24F94860EC;
	Mon, 24 Feb 2020 09:21:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O9L0KL002030 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 04:21:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 03F942718F; Mon, 24 Feb 2020 09:21:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-115.brq.redhat.com
	[10.40.205.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22FDD2718C;
	Mon, 24 Feb 2020 09:20:57 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1j69v4-0001WW-Kz; Mon, 24 Feb 2020 10:20:55 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 24 Feb 2020 10:20:54 +0100
Message-Id: <20200224092054.372276200@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 24 Feb 2020 10:20:34 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, 
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 7/7] dm writecache: optimize superblock write
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=dm-writecache-use-fua.patch

If we write a superblock in writecache_flush, we don't need to set bit and
scan the bitmap for it - we can just write the superblock directly. Also,
we can set the flag REQ_FUA on the write bio, so that we don't need to
submit a flush bio afterwards.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-writecache.c |   34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-02-24 10:19:14.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-02-24 10:19:14.000000000 +0100
@@ -508,6 +508,34 @@ static void ssd_commit_flushed(struct dm
 	memset(wc->dirty_bitmap, 0, wc->dirty_bitmap_size);
 }
 
+static void ssd_commit_superblock(struct dm_writecache *wc)
+{
+	int r;
+	struct dm_io_region region;
+	struct dm_io_request req;
+
+	region.bdev = wc->ssd_dev->bdev;
+	region.sector = 0;
+	region.count = PAGE_SIZE;
+
+	if (unlikely(region.sector + region.count > wc->metadata_sectors))
+		region.count = wc->metadata_sectors - region.sector;
+
+	region.sector += wc->start_sector;
+
+	req.bi_op = REQ_OP_WRITE;
+	req.bi_op_flags = REQ_SYNC | REQ_FUA;
+	req.mem.type = DM_IO_VMA;
+	req.mem.ptr.vma = (char *)wc->memory_map;
+	req.client = wc->dm_io;
+	req.notify.fn = NULL;
+	req.notify.context = NULL;
+
+	r = dm_io(&req, 1, &region, NULL);
+	if (unlikely(r))
+		writecache_error(wc, r, "error writing superblock");
+}
+
 static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
 {
 	if (WC_MODE_PMEM(wc))
@@ -757,8 +785,10 @@ static void writecache_flush(struct dm_w
 
 	wc->seq_count++;
 	pmem_assign(sb(wc)->seq_count, cpu_to_le64(wc->seq_count));
-	writecache_flush_region(wc, &sb(wc)->seq_count, sizeof sb(wc)->seq_count);
-	writecache_commit_flushed(wc, false);
+	if (WC_MODE_PMEM(wc))
+		writecache_commit_flushed(wc, false);
+	else
+		ssd_commit_superblock(wc);
 
 	wc->overwrote_committed = false;
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

