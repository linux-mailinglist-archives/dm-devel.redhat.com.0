Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78131559B51
	for <lists+dm-devel@lfdr.de>; Fri, 24 Jun 2022 16:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656080307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qxUN02pQ43RTvcogTzStJfwrHj9cg6bEdhZvZuo3hS8=;
	b=hdMRHeon+Z1JTKYDrZ3iRiQO/XV8yIALOfWA1fimjxLmzVhplgB3v+zZfl4geNbHj4rhKR
	G02NOri1zUKZxJxX3Iy0LKsAwmfSGu2Vv9y4svEH6+4k+9xLjgOrGHyzkCEEe2JJ20gDCE
	6T1M2hG/I8ggSicwouxyzgPLfIt1Ofg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-PNw1NxGWMMKEVQnHybVpig-1; Fri, 24 Jun 2022 10:16:22 -0400
X-MC-Unique: PNw1NxGWMMKEVQnHybVpig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92F318032EC;
	Fri, 24 Jun 2022 14:14:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 924322166B29;
	Fri, 24 Jun 2022 14:14:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 61341194B94B;
	Fri, 24 Jun 2022 14:14:40 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B7C65194B946
 for <dm-devel@listman.corp.redhat.com>; Fri, 24 Jun 2022 14:14:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A93BB1730C; Fri, 24 Jun 2022 14:14:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-21.pek2.redhat.com [10.72.8.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B250F10725;
 Fri, 24 Jun 2022 14:14:38 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Mike Snitzer <snitzer@redhat.com>
Date: Fri, 24 Jun 2022 22:12:53 +0800
Message-Id: <20220624141255.2461148-3-ming.lei@redhat.com>
In-Reply-To: <20220624141255.2461148-1-ming.lei@redhat.com>
References: <20220624141255.2461148-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [dm-devel] [PATCH 5.20 2/4] dm: add new helper for handling dm_io
 requeue
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
 Ming Lei <ming.lei@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add helper of dm_handle_requeue() for handling dm_io requeue.

Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/md/dm.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 2b75f1ef7386..a9e5e429c150 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -884,13 +884,11 @@ static int __noflush_suspending(struct mapped_device *md)
 	return test_bit(DMF_NOFLUSH_SUSPENDING, &md->flags);
 }
 
-static void dm_io_complete(struct dm_io *io)
+static void dm_handle_requeue(struct dm_io *io)
 {
-	blk_status_t io_error;
-	struct mapped_device *md = io->md;
-	struct bio *bio = io->split_bio ? io->split_bio : io->orig_bio;
-
 	if (io->status == BLK_STS_DM_REQUEUE) {
+		struct bio *bio = io->split_bio ? io->split_bio : io->orig_bio;
+		struct mapped_device *md = io->md;
 		unsigned long flags;
 		/*
 		 * Target requested pushing back the I/O.
@@ -909,6 +907,15 @@ static void dm_io_complete(struct dm_io *io)
 		}
 		spin_unlock_irqrestore(&md->deferred_lock, flags);
 	}
+}
+
+static void dm_io_complete(struct dm_io *io)
+{
+	struct bio *bio = io->split_bio ? io->split_bio : io->orig_bio;
+	struct mapped_device *md = io->md;
+	blk_status_t io_error;
+
+	dm_handle_requeue(io);
 
 	io_error = io->status;
 	if (dm_io_flagged(io, DM_IO_ACCOUNTED))
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

