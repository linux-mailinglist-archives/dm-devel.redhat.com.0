Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AAD4FD323
	for <lists+dm-devel@lfdr.de>; Tue, 12 Apr 2022 10:58:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649753881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KtxJr51rdJ/8zkVd3HiHAHlCtKhYX5OOlOe62y4vEa4=;
	b=azLIWleqU10+y2mtV/AmeECTpOdvzE4YbOR4P1X1LXfStO8VNkq9n+f//ds00AtOut+aHz
	a6OlTXz0U0wiV32fygRGFV3uMGjLpo17obv2iCbFKTVF8Jqh9NgrOr+XeDVt0gswD5fdBG
	sx+6i4E5kjTeqEJtBokzHU0nsYFfEQA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-VdHOL-z4MACZBp37ODmZog-1; Tue, 12 Apr 2022 04:57:07 -0400
X-MC-Unique: VdHOL-z4MACZBp37ODmZog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACBC0811E83;
	Tue, 12 Apr 2022 08:57:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97DD040D2821;
	Tue, 12 Apr 2022 08:57:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0CDAD1947BBF;
	Tue, 12 Apr 2022 08:57:04 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1C5691947BBF
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Apr 2022 08:57:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E0A922166B1E; Tue, 12 Apr 2022 08:57:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-19.pek2.redhat.com [10.72.8.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 540482166B1B;
 Tue, 12 Apr 2022 08:56:39 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Mike Snitzer <snitzer@redhat.com>
Date: Tue, 12 Apr 2022 16:56:10 +0800
Message-Id: <20220412085616.1409626-3-ming.lei@redhat.com>
In-Reply-To: <20220412085616.1409626-1-ming.lei@redhat.com>
References: <20220412085616.1409626-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [dm-devel] [PATCH 2/8] dm: don't pass bio to __dm_start_io_acct and
 dm_end_io_acct
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ming Lei <ming.lei@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm->orig_bio is always passed to __dm_start_io_acct and dm_end_io_acct,
so it isn't necessary to take one bio parameter for the two helpers.

Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/md/dm.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 3c5fad7c4ee6..62f7af815ef8 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -526,16 +526,13 @@ static void dm_io_acct(bool end, struct mapped_device *md, struct bio *bio,
 		bio->bi_iter.bi_size = bi_size;
 }
 
-static void __dm_start_io_acct(struct dm_io *io, struct bio *bio)
+static void __dm_start_io_acct(struct dm_io *io)
 {
-	dm_io_acct(false, io->md, bio, io->start_time, &io->stats_aux);
+	dm_io_acct(false, io->md, io->orig_bio, io->start_time, &io->stats_aux);
 }
 
 static void dm_start_io_acct(struct dm_io *io, struct bio *clone)
 {
-	/* Must account IO to DM device in terms of orig_bio */
-	struct bio *bio = io->orig_bio;
-
 	/*
 	 * Ensure IO accounting is only ever started once.
 	 * Expect no possibility for race unless DM_TIO_IS_DUPLICATE_BIO.
@@ -555,12 +552,12 @@ static void dm_start_io_acct(struct dm_io *io, struct bio *clone)
 		spin_unlock_irqrestore(&io->lock, flags);
 	}
 
-	__dm_start_io_acct(io, bio);
+	__dm_start_io_acct(io);
 }
 
-static void dm_end_io_acct(struct dm_io *io, struct bio *bio)
+static void dm_end_io_acct(struct dm_io *io)
 {
-	dm_io_acct(true, io->md, bio, io->start_time, &io->stats_aux);
+	dm_io_acct(true, io->md, io->orig_bio, io->start_time, &io->stats_aux);
 }
 
 static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
@@ -875,14 +872,14 @@ static void dm_io_complete(struct dm_io *io)
 
 	io_error = io->status;
 	if (dm_io_flagged(io, DM_IO_ACCOUNTED))
-		dm_end_io_acct(io, bio);
+		dm_end_io_acct(io);
 	else if (!io_error) {
 		/*
 		 * Must handle target that DM_MAPIO_SUBMITTED only to
 		 * then bio_endio() rather than dm_submit_bio_remap()
 		 */
-		__dm_start_io_acct(io, bio);
-		dm_end_io_acct(io, bio);
+		__dm_start_io_acct(io);
+		dm_end_io_acct(io);
 	}
 	free_io(io);
 	smp_wmb();
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

