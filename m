Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E214FD31D
	for <lists+dm-devel@lfdr.de>; Tue, 12 Apr 2022 10:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649753835;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vMhjms0E2gSV96dapVnhhioWpXGd9PiB2zNNauuoono=;
	b=OnDS4l038JlbuUNKuERUXBbOR9UDiPeEx/2RO237kMH+nl9M9RQb6ljlmzOWPZVSsg83WN
	k9whIP1X6xbEl1Ha4gGUavi0OT4PHS6YpnwAoNESbC+cc8r13ukKx+I3GUZR5aRkpvwVS2
	tlta+1J0DvEiohPktAIXo3cpdPrYi0E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-7bheJZk2NpmyIdClf7KEvQ-1; Tue, 12 Apr 2022 04:57:11 -0400
X-MC-Unique: 7bheJZk2NpmyIdClf7KEvQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB3851C07836;
	Tue, 12 Apr 2022 08:57:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4D4B54ACAF;
	Tue, 12 Apr 2022 08:57:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 51EB71940376;
	Tue, 12 Apr 2022 08:57:08 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E8151947BBF
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Apr 2022 08:57:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F2A111400AFB; Tue, 12 Apr 2022 08:57:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-19.pek2.redhat.com [10.72.8.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D73E145BA42;
 Tue, 12 Apr 2022 08:57:05 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Mike Snitzer <snitzer@redhat.com>
Date: Tue, 12 Apr 2022 16:56:11 +0800
Message-Id: <20220412085616.1409626-4-ming.lei@redhat.com>
In-Reply-To: <20220412085616.1409626-1-ming.lei@redhat.com>
References: <20220412085616.1409626-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [dm-devel] [PATCH 3/8] dm: pass 'dm_io' instance to dm_io_acct
 directly
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

All the other 4 parameters are retrieved from the 'dm_io' instance, so
not necessary to pass all four to dm_io_acct().

Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/md/dm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 62f7af815ef8..ed85cd1165a4 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -498,9 +498,12 @@ static bool bio_is_flush_with_data(struct bio *bio)
 	return ((bio->bi_opf & REQ_PREFLUSH) && bio->bi_iter.bi_size);
 }
 
-static void dm_io_acct(bool end, struct mapped_device *md, struct bio *bio,
-		       unsigned long start_time, struct dm_stats_aux *stats_aux)
+static void dm_io_acct(struct dm_io *io, bool end)
 {
+	struct dm_stats_aux *stats_aux = &io->stats_aux;
+	unsigned long start_time = io->start_time;
+	struct mapped_device *md = io->md;
+	struct bio *bio = io->orig_bio;
 	bool is_flush_with_data;
 	unsigned int bi_size;
 
@@ -528,7 +531,7 @@ static void dm_io_acct(bool end, struct mapped_device *md, struct bio *bio,
 
 static void __dm_start_io_acct(struct dm_io *io)
 {
-	dm_io_acct(false, io->md, io->orig_bio, io->start_time, &io->stats_aux);
+	dm_io_acct(io, false);
 }
 
 static void dm_start_io_acct(struct dm_io *io, struct bio *clone)
@@ -557,7 +560,7 @@ static void dm_start_io_acct(struct dm_io *io, struct bio *clone)
 
 static void dm_end_io_acct(struct dm_io *io)
 {
-	dm_io_acct(true, io->md, io->orig_bio, io->start_time, &io->stats_aux);
+	dm_io_acct(io, true);
 }
 
 static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

