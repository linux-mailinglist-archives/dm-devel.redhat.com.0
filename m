Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E634B28A5
	for <lists+dm-devel@lfdr.de>; Fri, 11 Feb 2022 16:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644591762;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MapYX8Eq8nDgPSphkpRxhTfdfBltzPeSzSDAyqrXd2U=;
	b=JFP0ncVqSD22wJYU1QKY+3eF83t+sKU5Po58xnTOOoMxm530JIqOczib9pbrHOAENHOpaw
	qye/2ZzqqSS+NLKGIbWYi8LyoLirpGyfqoq4SZ+07g9dP3Kj7yOPLhZf9dMZIoBE+Ac5uH
	7Glg+YZ4W9iyWDI9vD3saNfLjWNIdHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-Q8Cmf73tP86PjHgcgLHxMw-1; Fri, 11 Feb 2022 10:02:40 -0500
X-MC-Unique: Q8Cmf73tP86PjHgcgLHxMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 782632F48;
	Fri, 11 Feb 2022 15:02:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B46412B5BF;
	Fri, 11 Feb 2022 15:02:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD1391809CB8;
	Fri, 11 Feb 2022 15:02:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BF21a2025298 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 10:02:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B5E758379A; Fri, 11 Feb 2022 15:02:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ED3E7DE5A;
	Fri, 11 Feb 2022 15:01:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 21BF1tn5032054; Fri, 11 Feb 2022 10:01:55 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 21BF1tNS032049; Fri, 11 Feb 2022 10:01:55 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 11 Feb 2022 10:01:55 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2202110959350.30005@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm: fix dm_stats accounting
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Exactly the same sector number and length must be passed to both calls of
dm_stats_account_io, otherwise its per-zone in_flight counters go out of
sync. This patch fixes it.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

Index: linux-dm/drivers/md/dm.c
===================================================================
--- linux-dm.orig/drivers/md/dm.c	2022-02-11 15:32:56.000000000 +0100
+++ linux-dm/drivers/md/dm.c	2022-02-11 15:40:11.000000000 +0100
@@ -487,16 +487,20 @@ EXPORT_SYMBOL_GPL(dm_start_time_ns_from_
 
 static void start_io_acct(struct dm_io *io, struct bio *bio)
 {
+	struct bio *orig_bio;
+
 	/* Ensure IO accounting is only ever started once */
 	if (xchg(&io->was_accounted, 1) == 1)
 		return;
 
+	orig_bio = io->orig_bio;
+
 	bio_start_io_acct_remapped(bio, io->start_time,
-				   io->orig_bio->bi_bdev);
+				   orig_bio->bi_bdev);
 
 	if (unlikely(dm_stats_used(&io->md->stats)))
-		dm_stats_account_io(&io->md->stats, bio_data_dir(bio),
-				    bio->bi_iter.bi_sector, bio_sectors(bio),
+		dm_stats_account_io(&io->md->stats, bio_data_dir(orig_bio),
+				    orig_bio->bi_iter.bi_sector, bio_sectors(orig_bio),
 				    false, 0, &io->stats_aux);
 }
 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

