Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAEAC396A
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 17:48:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C554F308402D;
	Tue,  1 Oct 2019 15:48:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AA4560C63;
	Tue,  1 Oct 2019 15:48:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFC654E58A;
	Tue,  1 Oct 2019 15:48:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91Fm4b2002149 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 11:48:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A9BF5D713; Tue,  1 Oct 2019 15:48:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (ovpn-117-201.ams2.redhat.com [10.36.117.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2A695D6D0;
	Tue,  1 Oct 2019 15:48:03 +0000 (UTC)
From: Heinz Mauelshagen <heinzm@redhat.com>
To: heinzm@redhat.com, dm-devel@redhat.com, snitzer@redhat.com
Date: Tue,  1 Oct 2019 17:47:53 +0200
Message-Id: <0674778d4e47c7cdbee92c2164a31f0dc789d71a.1569888100.git.heinzm@redhat.com>
In-Reply-To: <cover.1569888100.git.heinzm@redhat.com>
References: <cover.1569888100.git.heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/4] dm raid: to ensure resynchronization,
	perform raid set grow in preresume
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 01 Oct 2019 15:48:12 +0000 (UTC)

This fixes a flaw causing raid set extensions not to be synchronized
in case the MD bitmap resize required additional pages to be allocated.

Also share resize code in the raid constructor between
new size changes and those occuring during recovery.

Bump the target version to define the change and document
it in Documentation/admin-guide/device-mapper/dm-raid.rst.

Reported-by: Steve D <steved424@gmail.com>
Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
---
 .../admin-guide/device-mapper/dm-raid.rst     |  2 +
 drivers/md/dm-raid.c                          | 81 ++++++++++++++-----
 2 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-raid.rst b/Documentation/admin-guide/device-mapper/dm-raid.rst
index 2fe255b130fb..f6344675e395 100644
--- a/Documentation/admin-guide/device-mapper/dm-raid.rst
+++ b/Documentation/admin-guide/device-mapper/dm-raid.rst
@@ -417,3 +417,5 @@ Version History
 	deadlock/potential data corruption.  Update superblock when
 	specific devices are requested via rebuild.  Fix RAID leg
 	rebuild errors.
+ 1.15.0 Fix size extensions not being synchronized in case of new MD bitmap
+        pages allocated;  also fix those not occuring after previous reductions
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 89f805e851cf..b600b335ce88 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -209,6 +209,7 @@ struct raid_dev {
 #define RT_FLAG_RS_SUSPENDED		5
 #define RT_FLAG_RS_IN_SYNC		6
 #define RT_FLAG_RS_RESYNCING		7
+#define RT_FLAG_RS_GROW			8
 
 /* Array elements of 64 bit needed for rebuild/failed disk bits */
 #define DISKS_ARRAY_ELEMS ((MAX_RAID_DEVICES + (sizeof(uint64_t) * 8 - 1)) / sizeof(uint64_t) / 8)
@@ -241,6 +242,9 @@ struct raid_set {
 	struct raid_type *raid_type;
 	struct dm_target_callbacks callbacks;
 
+	sector_t array_sectors;
+	sector_t dev_sectors;
+
 	/* Optional raid4/5/6 journal device */
 	struct journal_dev {
 		struct dm_dev *dev;
@@ -3004,7 +3008,7 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	bool resize = false;
 	struct raid_type *rt;
 	unsigned int num_raid_params, num_raid_devs;
-	sector_t calculated_dev_sectors, rdev_sectors, reshape_sectors;
+	sector_t sb_array_sectors, rdev_sectors, reshape_sectors;
 	struct raid_set *rs = NULL;
 	const char *arg;
 	struct rs_layout rs_layout;
@@ -3067,7 +3071,9 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	if (r)
 		goto bad;
 
-	calculated_dev_sectors = rs->md.dev_sectors;
+	/* Memorize just calculated, potentially larger sizes to grow the raid set in preresume */
+	rs->array_sectors = rs->md.array_sectors;
+	rs->dev_sectors = rs->md.dev_sectors;
 
 	/*
 	 * Backup any new raid set level, layout, ...
@@ -3080,6 +3086,8 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	if (r)
 		goto bad;
 
+	/* All in-core metadata now as of current superblocks after calling analyse_superblocks() */
+	sb_array_sectors = rs->md.array_sectors;
 	rdev_sectors = __rdev_sectors(rs);
 	if (!rdev_sectors) {
 		ti->error = "Invalid rdev size";
@@ -3089,8 +3097,11 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 
 	reshape_sectors = _get_reshape_sectors(rs);
-	if (calculated_dev_sectors != rdev_sectors)
-		resize = calculated_dev_sectors != (reshape_sectors ? rdev_sectors - reshape_sectors : rdev_sectors);
+	if (rs->dev_sectors != rdev_sectors) {
+		resize = (rs->dev_sectors != rdev_sectors - reshape_sectors);
+		if (rs->dev_sectors > rdev_sectors - reshape_sectors)
+			set_bit(RT_FLAG_RS_GROW, &rs->runtime_flags);
+	}
 
 	INIT_WORK(&rs->md.event_work, do_table_event);
 	ti->private = rs;
@@ -3117,13 +3128,8 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		set_bit(RT_FLAG_UPDATE_SBS, &rs->runtime_flags);
 		rs_set_new(rs);
 	} else if (rs_is_recovering(rs)) {
-		/* Rebuild particular devices */
-		if (test_bit(__CTR_FLAG_REBUILD, &rs->ctr_flags)) {
-			set_bit(RT_FLAG_UPDATE_SBS, &rs->runtime_flags);
-			rs_setup_recovery(rs, MaxSector);
-		}
 		/* A recovering raid set may be resized */
-		; /* skip setup rs */
+		goto size_check;
 	} else if (rs_is_reshaping(rs)) {
 		/* Have to reject size change request during reshape */
 		if (resize) {
@@ -3167,6 +3173,9 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		rs_setup_recovery(rs, MaxSector);
 		rs_set_new(rs);
 	} else if (rs_reshape_requested(rs)) {
+		/* Only on size extensions, not on reshapes. */
+		clear_bit(RT_FLAG_RS_GROW, &rs->runtime_flags);
+
 		/*
 		 * No need to check for 'ongoing' takeover here, because takeover
 		 * is an instant operation as oposed to an ongoing reshape.
@@ -3197,13 +3206,30 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		}
 		rs_set_cur(rs);
 	} else {
+size_check:
 		/* May not set recovery when a device rebuild is requested */
 		if (test_bit(__CTR_FLAG_REBUILD, &rs->ctr_flags)) {
-			rs_setup_recovery(rs, MaxSector);
+			clear_bit(RT_FLAG_RS_GROW, &rs->runtime_flags);
 			set_bit(RT_FLAG_UPDATE_SBS, &rs->runtime_flags);
-		} else
-			rs_setup_recovery(rs, test_bit(__CTR_FLAG_SYNC, &rs->ctr_flags) ?
-					      0 : (resize ? calculated_dev_sectors : MaxSector));
+		} else if (test_bit(RT_FLAG_RS_GROW, &rs->runtime_flags)) {
+			/*
+			 * Set raid set to current size, i.e. non-grown size
+			 * as of superblocks to grow to new size in preresume.
+			 */
+			r = rs_set_dev_and_array_sectors(rs, sb_array_sectors, false);
+			if (r)
+				goto bad;
+
+			rs_setup_recovery(rs, rs->md.recovery_cp < rs->md.dev_sectors ? rs->md.recovery_cp : rs->md.dev_sectors);
+		} else {
+			/* This is no size change or it is shrinking, update size and record in superblocks */
+			r = rs_set_dev_and_array_sectors(rs, rs->ti->len, false);
+			if (r)
+				goto bad;
+
+			if (sb_array_sectors > rs->array_sectors)
+				set_bit(RT_FLAG_UPDATE_SBS, &rs->runtime_flags);
+		}
 		rs_set_cur(rs);
 	}
 
@@ -3951,11 +3977,22 @@ static int raid_preresume(struct dm_target *ti)
 	if (r)
 		return r;
 
-	/* Resize bitmap to adjust to changed region size (aka MD bitmap chunksize) */
-	if (test_bit(RT_FLAG_RS_BITMAP_LOADED, &rs->runtime_flags) && mddev->bitmap &&
-	    mddev->bitmap_info.chunksize != to_bytes(rs->requested_bitmap_chunk_sectors)) {
-		r = md_bitmap_resize(mddev->bitmap, mddev->dev_sectors,
-				     to_bytes(rs->requested_bitmap_chunk_sectors), 0);
+	/* We are extending the raid set size, adjust mddev/md_rdev sizes and set capacity. */
+	if (test_bit(RT_FLAG_RS_GROW, &rs->runtime_flags)) {
+		mddev->array_sectors = rs->array_sectors;
+		mddev->dev_sectors = rs->dev_sectors;
+		rs_set_rdev_sectors(rs);
+		rs_set_capacity(rs);
+	}
+
+	/* Resize bitmap to adjust to changed region size (aka MD bitmap chunksize) or grown device size */
+        if (test_bit(RT_FLAG_RS_BITMAP_LOADED, &rs->runtime_flags) && mddev->bitmap &&
+	    (test_bit(RT_FLAG_RS_GROW, &rs->runtime_flags) ||
+	     (rs->requested_bitmap_chunk_sectors &&
+	       mddev->bitmap_info.chunksize != to_bytes(rs->requested_bitmap_chunk_sectors)))) {
+		int chunksize = to_bytes(rs->requested_bitmap_chunk_sectors) ?: mddev->bitmap_info.chunksize;
+
+		r = md_bitmap_resize(mddev->bitmap, mddev->dev_sectors, chunksize, 0);
 		if (r)
 			DMERR("Failed to resize bitmap");
 	}
@@ -3964,8 +4001,10 @@ static int raid_preresume(struct dm_target *ti)
 	/* Be prepared for mddev_resume() in raid_resume() */
 	set_bit(MD_RECOVERY_FROZEN, &mddev->recovery);
 	if (mddev->recovery_cp && mddev->recovery_cp < MaxSector) {
-		set_bit(MD_RECOVERY_SYNC, &mddev->recovery);
+		set_bit(MD_RECOVERY_REQUESTED, &mddev->recovery);
 		mddev->resync_min = mddev->recovery_cp;
+		if (test_bit(RT_FLAG_RS_GROW, &rs->runtime_flags))
+			mddev->resync_max_sectors = mddev->dev_sectors;
 	}
 
 	/* Check for any reshape request unless new raid set */
@@ -4013,7 +4052,7 @@ static void raid_resume(struct dm_target *ti)
 
 static struct target_type raid_target = {
 	.name = "raid",
-	.version = {1, 14, 0},
+	.version = {1, 15, 0},
 	.module = THIS_MODULE,
 	.ctr = raid_ctr,
 	.dtr = raid_dtr,
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
