Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B14AC396C
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 17:48:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 340CC10C0947;
	Tue,  1 Oct 2019 15:48:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E84B5D9C9;
	Tue,  1 Oct 2019 15:48:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D7E74EBC9;
	Tue,  1 Oct 2019 15:48:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91Fm5V4002161 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 11:48:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9C1945D713; Tue,  1 Oct 2019 15:48:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (ovpn-117-201.ams2.redhat.com [10.36.117.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C661D5D6D0;
	Tue,  1 Oct 2019 15:48:04 +0000 (UTC)
From: Heinz Mauelshagen <heinzm@redhat.com>
To: heinzm@redhat.com, dm-devel@redhat.com, snitzer@redhat.com
Date: Tue,  1 Oct 2019 17:47:54 +0200
Message-Id: <c1c8b850f2b3ad5eb11fac92e1716187f65a57ea.1569888100.git.heinzm@redhat.com>
In-Reply-To: <cover.1569888100.git.heinzm@redhat.com>
References: <cover.1569888100.git.heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 3/4] dm raid: simplify rs_setup_recovery call
	chain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Tue, 01 Oct 2019 15:48:15 +0000 (UTC)

rs_setup_recovery() sets the starting recovery offset.

Drop superfluous rs_setup_recovery() and replace with __rs_setup_recovery().

Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
---
 drivers/md/dm-raid.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index b600b335ce88..9aa830c53844 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -1670,7 +1670,7 @@ static int rs_set_dev_and_array_sectors(struct raid_set *rs, sector_t sectors, b
 }
 
 /* Setup recovery on @rs */
-static void __rs_setup_recovery(struct raid_set *rs, sector_t dev_sectors)
+static void rs_setup_recovery(struct raid_set *rs, sector_t dev_sectors)
 {
 	/* raid0 does not recover */
 	if (rs_is_raid0(rs))
@@ -1691,22 +1691,6 @@ static void __rs_setup_recovery(struct raid_set *rs, sector_t dev_sectors)
 				     ? MaxSector : dev_sectors;
 }
 
-/* Setup recovery on @rs based on raid type, device size and 'nosync' flag */
-static void rs_setup_recovery(struct raid_set *rs, sector_t dev_sectors)
-{
-	if (!dev_sectors)
-		/* New raid set or 'sync' flag provided */
-		__rs_setup_recovery(rs, 0);
-	else if (dev_sectors == MaxSector)
-		/* Prevent recovery */
-		__rs_setup_recovery(rs, MaxSector);
-	else if (__rdev_sectors(rs) < dev_sectors)
-		/* Grown raid set */
-		__rs_setup_recovery(rs, __rdev_sectors(rs));
-	else
-		__rs_setup_recovery(rs, MaxSector);
-}
-
 static void do_table_event(struct work_struct *ws)
 {
 	struct raid_set *rs = container_of(ws, struct raid_set, md.event_work);
@@ -2474,7 +2458,7 @@ static int super_validate(struct raid_set *rs, struct md_rdev *rdev)
 		return -EINVAL;
 	}
 
-	/* Enable bitmap creation for RAID levels != 0 */
+	/* Enable bitmap creation on @rs unless no metadevs or raid0 or journaled raid4/5/6 set. */
 	mddev->bitmap_info.offset = (rt_is_raid0(rs->raid_type) || rs->journal_dev.dev) ? 0 : to_sector(4096);
 	mddev->bitmap_info.default_offset = mddev->bitmap_info.offset;
 
@@ -3173,7 +3157,7 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		rs_setup_recovery(rs, MaxSector);
 		rs_set_new(rs);
 	} else if (rs_reshape_requested(rs)) {
-		/* Only on size extensions, not on reshapes. */
+		/* Only request grow on raid set size extensions, not on reshapes. */
 		clear_bit(RT_FLAG_RS_GROW, &rs->runtime_flags);
 
 		/*
@@ -3211,10 +3195,11 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		if (test_bit(__CTR_FLAG_REBUILD, &rs->ctr_flags)) {
 			clear_bit(RT_FLAG_RS_GROW, &rs->runtime_flags);
 			set_bit(RT_FLAG_UPDATE_SBS, &rs->runtime_flags);
+			rs_setup_recovery(rs, MaxSector);
 		} else if (test_bit(RT_FLAG_RS_GROW, &rs->runtime_flags)) {
 			/*
-			 * Set raid set to current size, i.e. non-grown size
-			 * as of superblocks to grow to new size in preresume.
+			 * Set raid set to current size, i.e. size as of
+			 * superblocks to grow to larger size in preresume.
 			 */
 			r = rs_set_dev_and_array_sectors(rs, sb_array_sectors, false);
 			if (r)
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
