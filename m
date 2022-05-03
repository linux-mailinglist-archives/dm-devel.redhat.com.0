Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A282B518EE0
	for <lists+dm-devel@lfdr.de>; Tue,  3 May 2022 22:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651610113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GTCuV1sKbsqIgo6L1y67chP5V3KfFTGzhHI8E0zeaGU=;
	b=dobyvCioYuP64MDuk7fEPXE9GvIjuDux6+tkBnMp035ay4Z++kgn2NVWL7Yj9xK6Kwim4N
	+B6XlViAhMNYf7yqzy+x1R1oHRzref4q5QbBJKWHqw1G8z0vWojvbedmbEtGrTdvh+A9FM
	Q9Z5tFy5wE/vValb56pZKbtaveZdThw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-4EF8OJMmOVuHqRwgxeHB3g-1; Tue, 03 May 2022 16:35:11 -0400
X-MC-Unique: 4EF8OJMmOVuHqRwgxeHB3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 057A694C441;
	Tue,  3 May 2022 20:35:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 842294010121;
	Tue,  3 May 2022 20:34:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 82BCF1947079;
	Tue,  3 May 2022 20:34:53 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26BFF1947043
 for <dm-devel@listman.corp.redhat.com>; Tue,  3 May 2022 20:34:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 16519551E9F; Tue,  3 May 2022 20:34:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FBAF54CAF3;
 Tue,  3 May 2022 20:34:52 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 243KYqdR011517; Tue, 3 May 2022 16:34:52 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 243KYpdb011513; Tue, 3 May 2022 16:34:51 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 3 May 2022 16:34:51 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <alpine.LRH.2.02.2205031632560.11434@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH v4.9] dm: fix mempool NULL pointer race when
 completing IO
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Mike Snitzer <msnitzer@redhat.com>, dm-devel@redhat.com,
 stable@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is backport of the patch d208b89401e0 ("dm: fix mempool NULL pointer
race when completing IO") for the kernel 4.9.

The bugs fixed by this patch can cause random crashing when reloading dm
table, so it is eligible for stable backport.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reviewed-by: Mike Snitzer <snitzer@kernel.org>

---
 drivers/md/dm.c |   17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

Index: linux-stable/drivers/md/dm.c
===================================================================
--- linux-stable.orig/drivers/md/dm.c	2022-04-30 18:51:49.000000000 +0200
+++ linux-stable/drivers/md/dm.c	2022-04-30 19:03:08.000000000 +0200
@@ -524,20 +524,19 @@ static void start_io_acct(struct dm_io *
 				    false, 0, &io->stats_aux);
 }
 
-static void end_io_acct(struct dm_io *io)
+static void end_io_acct(struct mapped_device *md, struct bio *bio,
+			unsigned long start_time, struct dm_stats_aux *stats_aux)
 {
-	struct mapped_device *md = io->md;
-	struct bio *bio = io->bio;
-	unsigned long duration = jiffies - io->start_time;
+	unsigned long duration = jiffies - start_time;
 	int pending;
 	int rw = bio_data_dir(bio);
 
-	generic_end_io_acct(rw, &dm_disk(md)->part0, io->start_time);
+	generic_end_io_acct(rw, &dm_disk(md)->part0, start_time);
 
 	if (unlikely(dm_stats_used(&md->stats)))
 		dm_stats_account_io(&md->stats, bio_data_dir(bio),
 				    bio->bi_iter.bi_sector, bio_sectors(bio),
-				    true, duration, &io->stats_aux);
+				    true, duration, stats_aux);
 
 	/*
 	 * After this is decremented the bio must not be touched if it is
@@ -768,6 +767,8 @@ static void dec_pending(struct dm_io *io
 	int io_error;
 	struct bio *bio;
 	struct mapped_device *md = io->md;
+	unsigned long start_time = 0;
+	struct dm_stats_aux stats_aux;
 
 	/* Push-back supersedes any I/O errors */
 	if (unlikely(error)) {
@@ -793,8 +794,10 @@ static void dec_pending(struct dm_io *io
 
 		io_error = io->error;
 		bio = io->bio;
-		end_io_acct(io);
+		start_time = io->start_time;
+		stats_aux = io->stats_aux;
 		free_io(md, io);
+		end_io_acct(md, bio, start_time, &stats_aux);
 
 		if (io_error == DM_ENDIO_REQUEUE)
 			return;
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

