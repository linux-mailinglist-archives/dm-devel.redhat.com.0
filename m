Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DBADD1867A2
	for <lists+dm-devel@lfdr.de>; Mon, 16 Mar 2020 10:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584350184;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5Dx7mL2jS0WgS6JvwRLSFG2cWC/fNKq3rbWonkSSprI=;
	b=hVSk2Tn0UMGIVhDhnylajiE7Ak5KnEyS5pbulBMx//U+QuoyetuwuJ7wkH0UUU/cCey6L5
	gkUeblT75BhH7jWvHDhKsgVweN1mlGlewB6r7MeVl6ed03WcvUxSTWwmDXxJWOte7P1UOM
	chWpBtl2n2D1YOx9dp1rSclJeMioSsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-gshwG5cRNluPHOB6EyanhA-1; Mon, 16 Mar 2020 05:02:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7648E18C43C3;
	Mon, 16 Mar 2020 08:56:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7970C60BF3;
	Mon, 16 Mar 2020 08:56:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7508D18095FF;
	Mon, 16 Mar 2020 08:56:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02G2XxYR017128 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Mar 2020 22:33:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 22CB310F8E04; Mon, 16 Mar 2020 02:33:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E06210F8E02
	for <dm-devel@redhat.com>; Mon, 16 Mar 2020 02:33:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A2C7800299
	for <dm-devel@redhat.com>; Mon, 16 Mar 2020 02:33:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-399-tPNoM2_dNeq0cR2m5AzloQ-1;
	Sun, 15 Mar 2020 22:33:52 -0400
X-MC-Unique: tPNoM2_dNeq0cR2m5AzloQ-1
X-MC-Unique: gshwG5cRNluPHOB6EyanhA-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 732D82076B;
	Mon, 16 Mar 2020 02:33:50 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 15 Mar 2020 22:33:04 -0400
Message-Id: <20200316023319.749-26-sashal@kernel.org>
In-Reply-To: <20200316023319.749-1-sashal@kernel.org>
References: <20200316023319.749-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02G2XxYR017128
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 16 Mar 2020 04:56:16 -0400
Cc: Sasha Levin <sashal@kernel.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH AUTOSEL 5.5 26/41] dm bio record: save/restore
	bi_end_io and bi_integrity
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

From: Mike Snitzer <snitzer@redhat.com>

[ Upstream commit 1b17159e52bb31f982f82a6278acd7fab1d3f67b ]

Also, save/restore __bi_remaining in case the bio was used in a
BIO_CHAIN (e.g. due to blk_queue_split).

Suggested-by: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-bio-record.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/md/dm-bio-record.h b/drivers/md/dm-bio-record.h
index c82578af56a5b..2ea0360108e1d 100644
--- a/drivers/md/dm-bio-record.h
+++ b/drivers/md/dm-bio-record.h
@@ -20,8 +20,13 @@
 struct dm_bio_details {
 	struct gendisk *bi_disk;
 	u8 bi_partno;
+	int __bi_remaining;
 	unsigned long bi_flags;
 	struct bvec_iter bi_iter;
+	bio_end_io_t *bi_end_io;
+#if defined(CONFIG_BLK_DEV_INTEGRITY)
+	struct bio_integrity_payload *bi_integrity;
+#endif
 };
 
 static inline void dm_bio_record(struct dm_bio_details *bd, struct bio *bio)
@@ -30,6 +35,11 @@ static inline void dm_bio_record(struct dm_bio_details *bd, struct bio *bio)
 	bd->bi_partno = bio->bi_partno;
 	bd->bi_flags = bio->bi_flags;
 	bd->bi_iter = bio->bi_iter;
+	bd->__bi_remaining = atomic_read(&bio->__bi_remaining);
+	bd->bi_end_io = bio->bi_end_io;
+#if defined(CONFIG_BLK_DEV_INTEGRITY)
+	bd->bi_integrity = bio_integrity(bio);
+#endif
 }
 
 static inline void dm_bio_restore(struct dm_bio_details *bd, struct bio *bio)
@@ -38,6 +48,11 @@ static inline void dm_bio_restore(struct dm_bio_details *bd, struct bio *bio)
 	bio->bi_partno = bd->bi_partno;
 	bio->bi_flags = bd->bi_flags;
 	bio->bi_iter = bd->bi_iter;
+	atomic_set(&bio->__bi_remaining, bd->__bi_remaining);
+	bio->bi_end_io = bd->bi_end_io;
+#if defined(CONFIG_BLK_DEV_INTEGRITY)
+	bio->bi_integrity = bd->bi_integrity;
+#endif
 }
 
 #endif
-- 
2.20.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

