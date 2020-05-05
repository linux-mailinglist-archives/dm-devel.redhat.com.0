Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BF8471C6342
	for <lists+dm-devel@lfdr.de>; Tue,  5 May 2020 23:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588714880;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9xTELKg0V6ytwmoFUV+sg4vEzFKBVdpMukNERUApbu0=;
	b=IJXiK8LpyKURN+ss7/1EyiDZfubUDS8ofd7ITUr3Qb4+/eYIH7rdBJtZSROEs1yY2d2WG8
	bAF3heZqkuyt99GiMbreIzVLcfzlYG4N07agmbCEa7boNwOODgWMrJYyzqgDvSG71k+LNx
	b6KSd41dSzVq0rHAcW+HBTScNFSfR+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-nOMk8QwXO-2zYWGztbsBVg-1; Tue, 05 May 2020 17:41:11 -0400
X-MC-Unique: nOMk8QwXO-2zYWGztbsBVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9ADE8C4669;
	Tue,  5 May 2020 21:41:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A651C5C3E7;
	Tue,  5 May 2020 21:41:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E3034CAA7;
	Tue,  5 May 2020 21:41:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 045CBlTA010813 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 08:11:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34030B3007; Tue,  5 May 2020 12:11:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3074EB5503
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:11:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0B661859171
	for <dm-devel@redhat.com>; Tue,  5 May 2020 12:11:44 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-84-zxEWpWmjMkC-qi9xcSj8tg-1; Tue, 05 May 2020 08:11:41 -0400
X-MC-Unique: zxEWpWmjMkC-qi9xcSj8tg-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id BFF33195B7D63AF9828D;
	Tue,  5 May 2020 19:56:03 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.487.0; Tue, 5 May 2020 19:55:57 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Jens Axboe
	<axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, linux-mm <linux-mm@kvack.org>, Alasdair Kergon
	<agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, dm-devel
	<dm-devel@redhat.com>, Song Liu <song@kernel.org>, linux-raid
	<linux-raid@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Date: Tue, 5 May 2020 19:55:43 +0800
Message-ID: <20200505115543.1660-5-thunder.leizhen@huawei.com>
In-Reply-To: <20200505115543.1660-1-thunder.leizhen@huawei.com>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 045CBlTA010813
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 May 2020 17:40:30 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH 4/4] mtd: eliminate SECTOR related magic numbers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

1. Replace "1 << (PAGE_SHIFT - 9)" or similar with SECTORS_PER_PAGE
2. Replace "PAGE_SHIFT - 9" with SECTORS_PER_PAGE_SHIFT
3. Replace "9" with SECTOR_SHIFT
4. Replace "512" with SECTOR_SIZE

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/md/dm-table.c    |  2 +-
 drivers/md/raid1.c       |  4 ++--
 drivers/md/raid10.c      | 10 +++++-----
 drivers/md/raid5-cache.c | 10 +++++-----
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 0a2cc197f62b..cf9d85ec66fd 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1964,7 +1964,7 @@ void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 #endif
 
 	/* Allow reads to exceed readahead limits */
-	q->backing_dev_info->io_pages = limits->max_sectors >> (PAGE_SHIFT - 9);
+	q->backing_dev_info->io_pages = limits->max_sectors >> SECTORS_PER_PAGE_SHIFT;
 }
 
 unsigned int dm_table_get_num_targets(struct dm_table *t)
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index cd810e195086..35d3fa22dd54 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -2129,7 +2129,7 @@ static void process_checks(struct r1bio *r1_bio)
 	int vcnt;
 
 	/* Fix variable parts of all bios */
-	vcnt = (r1_bio->sectors + PAGE_SIZE / 512 - 1) >> (PAGE_SHIFT - 9);
+	vcnt = (r1_bio->sectors + SECTORS_PER_PAGE - 1) >> SECTORS_PER_PAGE_SHIFT;
 	for (i = 0; i < conf->raid_disks * 2; i++) {
 		blk_status_t status;
 		struct bio *b = r1_bio->bios[i];
@@ -2148,7 +2148,7 @@ static void process_checks(struct r1bio *r1_bio)
 		b->bi_private = rp;
 
 		/* initialize bvec table again */
-		md_bio_reset_resync_pages(b, rp, r1_bio->sectors << 9);
+		md_bio_reset_resync_pages(b, rp, r1_bio->sectors << SECTOR_SHIFT);
 	}
 	for (primary = 0; primary < conf->raid_disks * 2; primary++)
 		if (r1_bio->bios[primary]->bi_end_io == end_sync_read &&
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index ec136e44aef7..3202953a800d 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -2025,11 +2025,11 @@ static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
 
 	first = i;
 	fbio = r10_bio->devs[i].bio;
-	fbio->bi_iter.bi_size = r10_bio->sectors << 9;
+	fbio->bi_iter.bi_size = r10_bio->sectors << SECTOR_SHIFT;
 	fbio->bi_iter.bi_idx = 0;
 	fpages = get_resync_pages(fbio)->pages;
 
-	vcnt = (r10_bio->sectors + (PAGE_SIZE >> 9) - 1) >> (PAGE_SHIFT - 9);
+	vcnt = (r10_bio->sectors + SECTORS_PER_PAGE - 1) >> SECTORS_PER_PAGE_SHIFT;
 	/* now find blocks with errors */
 	for (i=0 ; i < conf->copies ; i++) {
 		int  j, d;
@@ -2054,13 +2054,13 @@ static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
 			int sectors = r10_bio->sectors;
 			for (j = 0; j < vcnt; j++) {
 				int len = PAGE_SIZE;
-				if (sectors < (len / 512))
-					len = sectors * 512;
+				if (sectors < (len / SECTOR_SIZE))
+					len = sectors * SECTOR_SIZE;
 				if (memcmp(page_address(fpages[j]),
 					   page_address(tpages[j]),
 					   len))
 					break;
-				sectors -= len/512;
+				sectors -= len / SECTOR_SIZE;
 			}
 			if (j == vcnt)
 				continue;
diff --git a/drivers/md/raid5-cache.c b/drivers/md/raid5-cache.c
index 9b6da759dca2..5bd8e2b51341 100644
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@ -833,7 +833,7 @@ static void r5l_append_payload_meta(struct r5l_log *log, u16 type,
 	payload->header.type = cpu_to_le16(type);
 	payload->header.flags = cpu_to_le16(0);
 	payload->size = cpu_to_le32((1 + !!checksum2_valid) <<
-				    (PAGE_SHIFT - 9));
+				    SECTORS_PER_PAGE_SHIFT);
 	payload->location = cpu_to_le64(location);
 	payload->checksum[0] = cpu_to_le32(checksum1);
 	if (checksum2_valid)
@@ -1042,7 +1042,7 @@ int r5l_write_stripe(struct r5l_log *log, struct stripe_head *sh)
 
 	mutex_lock(&log->io_mutex);
 	/* meta + data */
-	reserve = (1 + write_disks) << (PAGE_SHIFT - 9);
+	reserve = (1 + write_disks) << SECTORS_PER_PAGE_SHIFT;
 
 	if (log->r5c_journal_mode == R5C_JOURNAL_MODE_WRITE_THROUGH) {
 		if (!r5l_has_free_space(log, reserve)) {
@@ -2053,7 +2053,7 @@ r5l_recovery_verify_data_checksum_for_mb(struct r5l_log *log,
 						  le32_to_cpu(payload->size));
 			mb_offset += sizeof(struct r5l_payload_data_parity) +
 				sizeof(__le32) *
-				(le32_to_cpu(payload->size) >> (PAGE_SHIFT - 9));
+				(le32_to_cpu(payload->size) >> SECTORS_PER_PAGE_SHIFT);
 		}
 
 	}
@@ -2199,7 +2199,7 @@ r5c_recovery_analyze_meta_block(struct r5l_log *log,
 
 		mb_offset += sizeof(struct r5l_payload_data_parity) +
 			sizeof(__le32) *
-			(le32_to_cpu(payload->size) >> (PAGE_SHIFT - 9));
+			(le32_to_cpu(payload->size) >> SECTORS_PER_PAGE_SHIFT);
 	}
 
 	return 0;
@@ -2916,7 +2916,7 @@ int r5c_cache_data(struct r5l_log *log, struct stripe_head *sh)
 
 	mutex_lock(&log->io_mutex);
 	/* meta + data */
-	reserve = (1 + pages) << (PAGE_SHIFT - 9);
+	reserve = (1 + pages) << SECTORS_PER_PAGE_SHIFT;
 
 	if (test_bit(R5C_LOG_CRITICAL, &conf->cache_state) &&
 	    sh->log_start == MaxSector)
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

