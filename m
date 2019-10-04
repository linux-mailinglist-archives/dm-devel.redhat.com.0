Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 41866CBF84
	for <lists+dm-devel@lfdr.de>; Fri,  4 Oct 2019 17:43:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 218B730675B0;
	Fri,  4 Oct 2019 15:43:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E885060468;
	Fri,  4 Oct 2019 15:43:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 735A94E58B;
	Fri,  4 Oct 2019 15:43:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94Fh1oq031347 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 11:43:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 99D4A5B69A; Fri,  4 Oct 2019 15:43:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (unknown [10.18.25.99])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECCF45D6A5;
	Fri,  4 Oct 2019 15:42:47 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri,  4 Oct 2019 11:42:09 -0400
Message-Id: <1570203729-22034-3-git-send-email-bgurney@redhat.com>
In-Reply-To: <1570203729-22034-1-git-send-email-bgurney@redhat.com>
References: <1570203729-22034-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH 2/2] dm dust: change ret to r in dust_map_read
	and dust_map
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 04 Oct 2019 15:43:05 +0000 (UTC)

In the dust_map_read() and dust_map() functions, change the
return code variable "ret" to "r", to match the convention of the
other device-mapper targets.

Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 drivers/md/dm-dust.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 29626ff8b8e8..9a926a799fb4 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -163,16 +163,16 @@ static int dust_map_read(struct dust_device *dd, sector_t thisblock,
 			 bool fail_read_on_bb)
 {
 	unsigned long flags;
-	int ret = DM_MAPIO_REMAPPED;
+	int r = DM_MAPIO_REMAPPED;
 
 	if (fail_read_on_bb) {
 		thisblock >>= dd->sect_per_block_shift;
 		spin_lock_irqsave(&dd->dust_lock, flags);
-		ret = __dust_map_read(dd, thisblock);
+		r = __dust_map_read(dd, thisblock);
 		spin_unlock_irqrestore(&dd->dust_lock, flags);
 	}
 
-	return ret;
+	return r;
 }
 
 static void __dust_map_write(struct dust_device *dd, sector_t thisblock)
@@ -209,17 +209,17 @@ static int dust_map_write(struct dust_device *dd, sector_t thisblock,
 static int dust_map(struct dm_target *ti, struct bio *bio)
 {
 	struct dust_device *dd = ti->private;
-	int ret;
+	int r;
 
 	bio_set_dev(bio, dd->dev->bdev);
 	bio->bi_iter.bi_sector = dd->start + dm_target_offset(ti, bio->bi_iter.bi_sector);
 
 	if (bio_data_dir(bio) == READ)
-		ret = dust_map_read(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
+		r = dust_map_read(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
 	else
-		ret = dust_map_write(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
+		r = dust_map_write(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
 
-	return ret;
+	return r;
 }
 
 static bool __dust_clear_badblocks(struct rb_root *tree,
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
