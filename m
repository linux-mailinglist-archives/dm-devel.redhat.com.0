Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0F21A1E3842
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 07:33:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590557594;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C6aa29D54mleexvTCPI6Udr12udnJ5ZHAii7HYFUBWA=;
	b=cLxgM/1/860X4oklg63v39IL64m7x4vr24AKNIDRAznafG6zr2xkCd0b8MFSYo9z5VL3XP
	yptC0oQF41ahewfn06miQ8EsmEsOcdBEB1VDE+qUO4Uv5NtWn2QcypbBF4rjjwakpUbCLo
	0bqZ3jmaZdQANI9KPHR3BH55iMUIXGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-uq4cHvkXN-yyZEX1Ps7BPA-1; Wed, 27 May 2020 01:33:11 -0400
X-MC-Unique: uq4cHvkXN-yyZEX1Ps7BPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EA2F1801800;
	Wed, 27 May 2020 05:33:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 459F812A4D;
	Wed, 27 May 2020 05:33:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 206606B498;
	Wed, 27 May 2020 05:33:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R5X1JZ012113 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 01:33:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74A62951D7; Wed, 27 May 2020 05:33:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 708A6AB580
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:33:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56E4282882B
	for <dm-devel@redhat.com>; Wed, 27 May 2020 05:33:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-293-x5pQcy09O7SZbT1J5fFSPA-1; Wed, 27 May 2020 01:32:57 -0400
X-MC-Unique: x5pQcy09O7SZbT1J5fFSPA-1
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoYY-0000qw-W9; Wed, 27 May 2020 05:24:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:12 +0200
Message-Id: <20200527052419.403583-10-hch@lst.de>
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, drbd-dev@tron.linbit.com,
	Nitin Gupta <ngupta@vflare.org>
Subject: [dm-devel] [PATCH 09/16] block: remove generic_{start, end}_io_acct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove these now unused functions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 block/bio.c         | 39 ---------------------------------------
 include/linux/bio.h |  6 ------
 2 files changed, 45 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 9c101a0572ca2..3e89c7b37855a 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1392,45 +1392,6 @@ void update_io_ticks(struct hd_struct *part, unsigned long now, bool end)
 	}
 }
 
-void generic_start_io_acct(struct request_queue *q, int op,
-			   unsigned long sectors, struct hd_struct *part)
-{
-	const int sgrp = op_stat_group(op);
-	int rw = op_is_write(op);
-
-	part_stat_lock();
-
-	update_io_ticks(part, jiffies, false);
-	part_stat_inc(part, ios[sgrp]);
-	part_stat_add(part, sectors[sgrp], sectors);
-	part_stat_local_inc(part, in_flight[rw]);
-	if (part->partno)
-		part_stat_local_inc(&part_to_disk(part)->part0, in_flight[rw]);
-
-	part_stat_unlock();
-}
-EXPORT_SYMBOL(generic_start_io_acct);
-
-void generic_end_io_acct(struct request_queue *q, int req_op,
-			 struct hd_struct *part, unsigned long start_time)
-{
-	unsigned long now = jiffies;
-	unsigned long duration = now - start_time;
-	const int sgrp = op_stat_group(req_op);
-	int rw = op_is_write(req_op);
-
-	part_stat_lock();
-
-	update_io_ticks(part, now, true);
-	part_stat_add(part, nsecs[sgrp], jiffies_to_nsecs(duration));
-	part_stat_local_dec(part, in_flight[rw]);
-	if (part->partno)
-		part_stat_local_dec(&part_to_disk(part)->part0, in_flight[rw]);
-
-	part_stat_unlock();
-}
-EXPORT_SYMBOL(generic_end_io_acct);
-
 static inline bool bio_remaining_done(struct bio *bio)
 {
 	/*
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 950c9dc44c4f2..941378ec5b39f 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -444,12 +444,6 @@ void bio_release_pages(struct bio *bio, bool mark_dirty);
 extern void bio_set_pages_dirty(struct bio *bio);
 extern void bio_check_pages_dirty(struct bio *bio);
 
-void generic_start_io_acct(struct request_queue *q, int op,
-				unsigned long sectors, struct hd_struct *part);
-void generic_end_io_acct(struct request_queue *q, int op,
-				struct hd_struct *part,
-				unsigned long start_time);
-
 extern void bio_copy_data_iter(struct bio *dst, struct bvec_iter *dst_iter,
 			       struct bio *src, struct bvec_iter *src_iter);
 extern void bio_copy_data(struct bio *dst, struct bio *src);
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

