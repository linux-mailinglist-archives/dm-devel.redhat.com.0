Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44FE927741B
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 16:35:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600958123;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RgCew2H1etZ8PMqo3H26rgBfia43FXmtgb8q8RRVANQ=;
	b=M0nY1TwiA/70IJShdF8+szROpC6gKZRQlf5bnK9r48WjFAn31LOPZlk9FTuA3mWnsfE1y6
	qKIog0JFIgJ+vh60NKr9QwvV0meSkGlAt1YCDlFR44QDlmA4OiOL2NGLNAkZ2WgP1N3Jcl
	UQXDZBVOjx4EwNu+tgYDod4iex0bylU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-9c_DJmTLMIO4MTVAXaxuMA-1; Thu, 24 Sep 2020 10:35:21 -0400
X-MC-Unique: 9c_DJmTLMIO4MTVAXaxuMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6A411891E80;
	Thu, 24 Sep 2020 14:35:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37F351002C05;
	Thu, 24 Sep 2020 14:35:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67F978C7A0;
	Thu, 24 Sep 2020 14:35:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OEZ1vD001315 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 10:35:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3DAB27368B; Thu, 24 Sep 2020 14:35:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AD0073684;
	Thu, 24 Sep 2020 14:34:57 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 08OEYvTS017268; Thu, 24 Sep 2020 10:34:57 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 08OEYvvX017263; Thu, 24 Sep 2020 10:34:57 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 24 Sep 2020 10:34:57 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <alpine.LRH.2.02.2009241032510.3485@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-table: set non-zero
	q->limits.discard_granularity
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Mike

Could you send this to Linus before v5.9 is released?

Mikulas



From: Mikulas Patocka <mpatocka@redhat.com>

If q->limits.discard_granularity is zero, the block core will warn in
__blkdev_issue_discard. This patch sets it to a minimum - 512 bytes.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: b35fd7422c2f ("block: check queue's limits.discard_granularity in __blkdev_issue_discard()")
Fixes: 9b15d109a6b2 ("block: improve discard bio alignment in __blkdev_issue_discard()")
Fixes: c52abf563049 ("loop: Better discard support for block devices")

---
 drivers/md/dm-table.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-table.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-table.c	2020-08-31 12:08:27.000000000 +0200
+++ linux-2.6/drivers/md/dm-table.c	2020-09-24 16:23:55.000000000 +0200
@@ -1858,8 +1858,11 @@ void dm_table_set_restrictions(struct dm
 		q->limits.discard_granularity = 0;
 		q->limits.discard_alignment = 0;
 		q->limits.discard_misaligned = 0;
-	} else
+	} else {
 		blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
+		if (q->limits.discard_granularity < 512)
+			q->limits.discard_granularity = 512;
+	}
 
 	if (dm_table_supports_secure_erase(t))
 		blk_queue_flag_set(QUEUE_FLAG_SECERASE, q);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

