Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 890EA1C8C9F
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 15:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588858840;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yEjFWcZfLgSkotGANBqc05SVn2zTNTae8hmsqUQOtBk=;
	b=STD1fqFE2XD1vZdNOzjbRirDp9LYjfN3Hx5Zu1Niho4R3CuZby3JbGrySD77Kvgt4+QRIU
	bGwHRon7uuQCpUCxdeUbVTamIjOCDOPD05Zp2+6DKUPpxr9sDp3ppHA2xz+tAEWIDMsvky
	o8S5LHUEQgusZZ3+G3hD9AsUpm7J/pI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-n5XLe0ZGPuqdFAyLNsFbYw-1; Thu, 07 May 2020 09:40:36 -0400
X-MC-Unique: n5XLe0ZGPuqdFAyLNsFbYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A5D1009625;
	Thu,  7 May 2020 13:40:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21657707A9;
	Thu,  7 May 2020 13:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A19B2180954D;
	Thu,  7 May 2020 13:40:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0477uBSi024006 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 03:56:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81F362029F62; Thu,  7 May 2020 07:56:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DD802026D5D
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E74287277E
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:11 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-435-AxtliJbcMnS2QeF-BdUg-w-1; Thu, 07 May 2020 03:56:07 -0400
X-MC-Unique: AxtliJbcMnS2QeF-BdUg-w-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 87404B39D9B1A9A81104;
	Thu,  7 May 2020 15:56:03 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 7 May 2020 15:55:52 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Matthew Wilcox
	<willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, Coly Li
	<colyli@suse.de>, Kent Overstreet <kent.overstreet@gmail.com>, "Alasdair
	Kergon" <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, linux-block
	<linux-block@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	linux-mm <linux-mm@kvack.org>, dm-devel <dm-devel@redhat.com>, Song Liu
	<song@kernel.org>, linux-raid <linux-raid@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Date: Thu, 7 May 2020 15:51:00 +0800
Message-ID: <20200507075100.1779-11-thunder.leizhen@huawei.com>
In-Reply-To: <20200507075100.1779-1-thunder.leizhen@huawei.com>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0477uBSi024006
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 09:40:06 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH v2 10/10] md: use PAGE_SECTORS to clean up code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Execute the following shell script:

C_FILES=`find drivers/md/ -name "*.c"`

for file in $C_FILES
do
        #with brace
        sed -i 's/(PAGE_SIZE \/ 512)/PAGE_SECTORS/g' $file
        sed -i 's/(PAGE_SIZE\/512)/PAGE_SECTORS/g' $file
        sed -i 's/(PAGE_SIZE >> 9)/PAGE_SECTORS/g' $file
        sed -i 's/(PAGE_SIZE>>9)/PAGE_SECTORS/g' $file

        #without brace
        sed -i 's/PAGE_SIZE \/ 512/PAGE_SECTORS/g' $file
        sed -i 's/PAGE_SIZE\/512/PAGE_SECTORS/g' $file
        sed -i 's/PAGE_SIZE >> 9/PAGE_SECTORS/g' $file
        sed -i 's/PAGE_SIZE>>9/PAGE_SECTORS/g' $file
done

In addition, eliminate below scripts/checkpatch.pl warning:
#44: FILE: drivers/md/dm-kcopyd.c:587:
+       unsigned nr_pages = dm_div_up(job->dests[0].count, PAGE_SECTORS);

Change to "unsigned int nr_pages".

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/md/dm-kcopyd.c |  2 +-
 drivers/md/md-bitmap.c | 16 ++++++++--------
 drivers/md/md.c        |  6 +++---
 drivers/md/raid1.c     | 10 +++++-----
 drivers/md/raid10.c    | 20 ++++++++++----------
 drivers/md/raid5.c     |  4 ++--
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
index 1bbe4a34ef4c..ad861a3d648e 100644
--- a/drivers/md/dm-kcopyd.c
+++ b/drivers/md/dm-kcopyd.c
@@ -584,7 +584,7 @@ static int run_io_job(struct kcopyd_job *job)
 static int run_pages_job(struct kcopyd_job *job)
 {
 	int r;
-	unsigned nr_pages = dm_div_up(job->dests[0].count, PAGE_SIZE >> 9);
+	unsigned int nr_pages = dm_div_up(job->dests[0].count, PAGE_SECTORS);
 
 	r = kcopyd_get_pages(job->kc, nr_pages, &job->pages);
 	if (!r) {
diff --git a/drivers/md/md-bitmap.c b/drivers/md/md-bitmap.c
index b952bd45bd6a..12ccf1c81661 100644
--- a/drivers/md/md-bitmap.c
+++ b/drivers/md/md-bitmap.c
@@ -161,7 +161,7 @@ static int read_sb_page(struct mddev *mddev, loff_t offset,
 		    || test_bit(Bitmap_sync, &rdev->flags))
 			continue;
 
-		target = offset + index * (PAGE_SIZE/512);
+		target = offset + index * PAGE_SECTORS;
 
 		if (sync_page_io(rdev, target,
 				 roundup(size, bdev_logical_block_size(rdev->bdev)),
@@ -237,17 +237,17 @@ static int write_sb_page(struct bitmap *bitmap, struct page *page, int wait)
 		if (mddev->external) {
 			/* Bitmap could be anywhere. */
 			if (rdev->sb_start + offset + (page->index
-						       * (PAGE_SIZE/512))
+						       * PAGE_SECTORS)
 			    > rdev->data_offset
 			    &&
 			    rdev->sb_start + offset
 			    < (rdev->data_offset + mddev->dev_sectors
-			     + (PAGE_SIZE/512)))
+			     + PAGE_SECTORS))
 				goto bad_alignment;
 		} else if (offset < 0) {
 			/* DATA  BITMAP METADATA  */
 			if (offset
-			    + (long)(page->index * (PAGE_SIZE/512))
+			    + (long)(page->index * PAGE_SECTORS)
 			    + size/512 > 0)
 				/* bitmap runs in to metadata */
 				goto bad_alignment;
@@ -259,7 +259,7 @@ static int write_sb_page(struct bitmap *bitmap, struct page *page, int wait)
 			/* METADATA BITMAP DATA */
 			if (rdev->sb_start
 			    + offset
-			    + page->index*(PAGE_SIZE/512) + size/512
+			    + page->index*PAGE_SECTORS + size/512
 			    > rdev->data_offset)
 				/* bitmap runs in to data */
 				goto bad_alignment;
@@ -268,7 +268,7 @@ static int write_sb_page(struct bitmap *bitmap, struct page *page, int wait)
 		}
 		md_super_write(mddev, rdev,
 			       rdev->sb_start + offset
-			       + page->index * (PAGE_SIZE/512),
+			       + page->index * PAGE_SECTORS,
 			       size,
 			       page);
 	}
@@ -1548,14 +1548,14 @@ int md_bitmap_start_sync(struct bitmap *bitmap, sector_t offset, sector_t *block
 	 * pages, otherwise resync (which is very PAGE_SIZE based) will
 	 * get confused.
 	 * So call __bitmap_start_sync repeatedly (if needed) until
-	 * At least PAGE_SIZE>>9 blocks are covered.
+	 * At least PAGE_SECTORS blocks are covered.
 	 * Return the 'or' of the result.
 	 */
 	int rv = 0;
 	sector_t blocks1;
 
 	*blocks = 0;
-	while (*blocks < (PAGE_SIZE>>9)) {
+	while (*blocks < PAGE_SECTORS) {
 		rv |= __bitmap_start_sync(bitmap, offset,
 					  &blocks1, degraded);
 		offset += blocks1;
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 271e8a587354..a7572b17cf2e 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1736,7 +1736,7 @@ static int super_1_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor_
 		__le64 *bbp;
 		int i;
 		int sectors = le16_to_cpu(sb->bblog_size);
-		if (sectors > (PAGE_SIZE / 512))
+		if (sectors > PAGE_SECTORS)
 			return -EINVAL;
 		offset = le32_to_cpu(sb->bblog_offset);
 		if (offset == 0)
@@ -2223,7 +2223,7 @@ super_1_allow_new_offset(struct md_rdev *rdev,
 	bitmap = rdev->mddev->bitmap;
 	if (bitmap && !rdev->mddev->bitmap_info.file &&
 	    rdev->sb_start + rdev->mddev->bitmap_info.offset +
-	    bitmap->storage.file_pages * (PAGE_SIZE>>9) > new_offset)
+	    bitmap->storage.file_pages * PAGE_SECTORS > new_offset)
 		return 0;
 	if (rdev->badblocks.sector + rdev->badblocks.size > new_offset)
 		return 0;
@@ -8734,7 +8734,7 @@ void md_do_sync(struct md_thread *thread)
 	/*
 	 * Tune reconstruction:
 	 */
-	window = 32 * (PAGE_SIZE / 512);
+	window = 32 * PAGE_SECTORS;
 	pr_debug("md: using %dk window, over a total of %lluk.\n",
 		 window/2, (unsigned long long)max_sectors/2);
 
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 44ffe1b6d77a..717c6e397cad 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -2021,8 +2021,8 @@ static int fix_sync_read_error(struct r1bio *r1_bio)
 		int success = 0;
 		int start;
 
-		if (s > (PAGE_SIZE>>9))
-			s = PAGE_SIZE >> 9;
+		if (s > PAGE_SECTORS)
+			s = PAGE_SECTORS;
 		do {
 			if (r1_bio->bios[d]->bi_end_io == end_sync_read) {
 				/* No rcu protection needed here devices
@@ -2129,7 +2129,7 @@ static void process_checks(struct r1bio *r1_bio)
 	int vcnt;
 
 	/* Fix variable parts of all bios */
-	vcnt = sectors_to_npage(r1_bio->sectors + PAGE_SIZE / 512 - 1);
+	vcnt = sectors_to_npage(r1_bio->sectors + PAGE_SECTORS - 1);
 	for (i = 0; i < conf->raid_disks * 2; i++) {
 		blk_status_t status;
 		struct bio *b = r1_bio->bios[i];
@@ -2264,8 +2264,8 @@ static void fix_read_error(struct r1conf *conf, int read_disk,
 		int start;
 		struct md_rdev *rdev;
 
-		if (s > (PAGE_SIZE>>9))
-			s = PAGE_SIZE >> 9;
+		if (s > PAGE_SECTORS)
+			s = PAGE_SECTORS;
 
 		do {
 			sector_t first_bad;
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index ac4273f804e8..21bc6e33c093 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -2029,7 +2029,7 @@ static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
 	fbio->bi_iter.bi_idx = 0;
 	fpages = get_resync_pages(fbio)->pages;
 
-	vcnt = sectors_to_npage(r10_bio->sectors + (PAGE_SIZE >> 9) - 1);
+	vcnt = sectors_to_npage(r10_bio->sectors + PAGE_SECTORS - 1);
 	/* now find blocks with errors */
 	for (i=0 ; i < conf->copies ; i++) {
 		int  j, d;
@@ -2163,8 +2163,8 @@ static void fix_recovery_read_error(struct r10bio *r10_bio)
 		sector_t addr;
 		int ok;
 
-		if (s > (PAGE_SIZE>>9))
-			s = PAGE_SIZE >> 9;
+		if (s > PAGE_SECTORS)
+			s = PAGE_SECTORS;
 
 		rdev = conf->mirrors[dr].rdev;
 		addr = r10_bio->devs[0].addr + sect,
@@ -2367,8 +2367,8 @@ static void fix_read_error(struct r10conf *conf, struct mddev *mddev, struct r10
 		int success = 0;
 		int start;
 
-		if (s > (PAGE_SIZE>>9))
-			s = PAGE_SIZE >> 9;
+		if (s > PAGE_SECTORS)
+			s = PAGE_SECTORS;
 
 		rcu_read_lock();
 		do {
@@ -3597,7 +3597,7 @@ static int setup_geo(struct geom *geo, struct mddev *mddev, enum geo_type new)
 	}
 	if (layout >> 19)
 		return -1;
-	if (chunk < (PAGE_SIZE >> 9) ||
+	if (chunk < PAGE_SECTORS ||
 	    !is_power_of_2(chunk))
 		return -2;
 	nc = layout & 255;
@@ -4632,8 +4632,8 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
 
 	nr_sectors = 0;
 	pages = get_resync_pages(r10_bio->devs[0].bio)->pages;
-	for (s = 0 ; s < max_sectors; s += PAGE_SIZE >> 9) {
-		struct page *page = pages[s / (PAGE_SIZE >> 9)];
+	for (s = 0 ; s < max_sectors; s += PAGE_SECTORS) {
+		struct page *page = pages[s / PAGE_SECTORS];
 		int len = (max_sectors - s) << 9;
 		if (len > PAGE_SIZE)
 			len = PAGE_SIZE;
@@ -4789,8 +4789,8 @@ static int handle_reshape_read_error(struct mddev *mddev,
 		int success = 0;
 		int first_slot = slot;
 
-		if (s > (PAGE_SIZE >> 9))
-			s = PAGE_SIZE >> 9;
+		if (s > PAGE_SECTORS)
+			s = PAGE_SECTORS;
 
 		rcu_read_lock();
 		while (!success) {
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index ba00e9877f02..5b316538b9ea 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -8197,7 +8197,7 @@ static int raid5_check_reshape(struct mddev *mddev)
 	if (new_chunk > 0) {
 		if (!is_power_of_2(new_chunk))
 			return -EINVAL;
-		if (new_chunk < (PAGE_SIZE>>9))
+		if (new_chunk < PAGE_SECTORS)
 			return -EINVAL;
 		if (mddev->array_sectors & (new_chunk-1))
 			/* not factor of array size */
@@ -8231,7 +8231,7 @@ static int raid6_check_reshape(struct mddev *mddev)
 	if (new_chunk > 0) {
 		if (!is_power_of_2(new_chunk))
 			return -EINVAL;
-		if (new_chunk < (PAGE_SIZE >> 9))
+		if (new_chunk < PAGE_SECTORS)
 			return -EINVAL;
 		if (mddev->array_sectors & (new_chunk-1))
 			/* not factor of array size */
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

