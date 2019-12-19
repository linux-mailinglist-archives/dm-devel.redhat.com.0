Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7282A126786
	for <lists+dm-devel@lfdr.de>; Thu, 19 Dec 2019 17:59:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576774781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UD6RS3PXE6A4YJ/2XURXT3iE1jD2gE9VSImzuXDnLkU=;
	b=EVBgEYJkib7cE2C8Qchlg2Rw2/qDt7mLknAlZ/zjBxKR37Nmp8tlRi5Uu9io4xuGgC7aMd
	7ldUrt45vBBd3AUJj0ocbrI2MqERvowVOLQdfubUd+FuQe/FbKTPrNzQZdV3r1KbcyS0j2
	HokQhINdghB3Ic98h1IJKBlp6McHxpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-MyBssURbONGTV32N8ub71Q-1; Thu, 19 Dec 2019 11:59:38 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1186B801E6D;
	Thu, 19 Dec 2019 16:59:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25D8E19C68;
	Thu, 19 Dec 2019 16:59:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D903252CC;
	Thu, 19 Dec 2019 16:59:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBJGwrco025435 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 19 Dec 2019 11:58:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8EEEA38A; Thu, 19 Dec 2019 16:58:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (unknown [10.36.117.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E75319C69;
	Thu, 19 Dec 2019 16:58:47 +0000 (UTC)
From: Heinz Mauelshagen <heinzm@redhat.com>
To: dm-devel@redhat.com
Date: Thu, 19 Dec 2019 17:58:46 +0100
Message-Id: <f5f97e95f2856dff42aff1a1e807fff9dc2f2db7.1576774631.git.heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com
Subject: [dm-devel] [PATCH] dm raid: table line rebuild status fix
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: MyBssURbONGTV32N8ub71Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

raid_status() wasn't emitting rebuild flags on the table line properly because
the rdev number in doing so is not yet set properly; index raid component
devices array directly to solve.

Also fix wrong argument count on emitted table line caused by 1 too many
rebuild/write_mostly argument and consider any journal_(dev|mode) pairs.

Related: https://bugzilla.redhat.com/1782045
Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
---
 .../admin-guide/device-mapper/dm-raid.rst     |  2 +
 drivers/md/dm-raid.c                          | 40 +++++++++----------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-raid.rst b/Documentation/admin-guide/device-mapper/dm-raid.rst
index f6344675e395..695a2ea1d1ae 100644
--- a/Documentation/admin-guide/device-mapper/dm-raid.rst
+++ b/Documentation/admin-guide/device-mapper/dm-raid.rst
@@ -419,3 +419,5 @@ Version History
 	rebuild errors.
  1.15.0 Fix size extensions not being synchronized in case of new MD bitmap
         pages allocated;  also fix those not occuring after previous reductions
+ 1.15.1 Fix argument count and arguments for rebuild/write_mostly/journal_(dev|mode)
+        on the status line.
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index c412eaa975fc..85b374ee3326 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -129,7 +129,9 @@ struct raid_dev {
 				  CTR_FLAG_RAID10_COPIES | \
 				  CTR_FLAG_RAID10_FORMAT | \
 				  CTR_FLAG_DELTA_DISKS | \
-				  CTR_FLAG_DATA_OFFSET)
+				  CTR_FLAG_DATA_OFFSET | \
+				  CTR_FLAG_JOURNAL_DEV | \
+				  CTR_FLAG_JOURNAL_MODE)
 
 /* Valid options definitions per raid level... */
 
@@ -3001,7 +3003,6 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		{ 1, 254, "Cannot understand number of raid devices parameters" }
 	};
 
-	/* Must have <raid_type> */
 	arg = dm_shift_arg(&as);
 	if (!arg) {
 		ti->error = "No arguments";
@@ -3508,8 +3509,7 @@ static void raid_status(struct dm_target *ti, status_type_t type,
 	unsigned long recovery;
 	unsigned int raid_param_cnt = 1; /* at least 1 for chunksize */
 	unsigned int sz = 0;
-	unsigned int rebuild_disks;
-	unsigned int write_mostly_params = 0;
+	unsigned int rebuild_writemostly_count = 0;
 	sector_t progress, resync_max_sectors, resync_mismatches;
 	enum sync_state state;
 	struct raid_type *rt;
@@ -3593,18 +3593,19 @@ static void raid_status(struct dm_target *ti, status_type_t type,
 	case STATUSTYPE_TABLE:
 		/* Report the table line string you would use to construct this raid set */
 
-		/* Calculate raid parameter count */
+		/*
+		 * Count any rebuild or writemostly argument pairs and subtract the
+		 * hweight count being added below of any rebuild and writemostly ctr flags.
+		 */
 		for (i = 0; i < rs->raid_disks; i++)
-			if (test_bit(WriteMostly, &rs->dev[i].rdev.flags))
-				write_mostly_params += 2;
-		rebuild_disks = memweight(rs->rebuild_disks, DISKS_ARRAY_ELEMS * sizeof(*rs->rebuild_disks));
-		raid_param_cnt += rebuild_disks * 2 +
-				  write_mostly_params +
+			rebuild_writemostly_count += (test_bit(i, (void *) rs->rebuild_disks) ? 2 : 0) +
+						     (test_bit(WriteMostly, &rs->dev[i].rdev.flags) ? 2 : 0);
+		rebuild_writemostly_count -= (test_bit(__CTR_FLAG_REBUILD, &rs->ctr_flags) ? 2 : 0) +
+					     (test_bit(__CTR_FLAG_WRITE_MOSTLY, &rs->ctr_flags) ? 2 : 0);
+		/* Calculate raid parameter count based on ^ rebuild/writemostly argument counts and ctr flags set. */
+		raid_param_cnt += rebuild_writemostly_count +
 				  hweight32(rs->ctr_flags & CTR_FLAG_OPTIONS_NO_ARGS) +
-				  hweight32(rs->ctr_flags & CTR_FLAG_OPTIONS_ONE_ARG) * 2 +
-				  (test_bit(__CTR_FLAG_JOURNAL_DEV, &rs->ctr_flags) ? 2 : 0) +
-				  (test_bit(__CTR_FLAG_JOURNAL_MODE, &rs->ctr_flags) ? 2 : 0);
-
+				  hweight32(rs->ctr_flags & CTR_FLAG_OPTIONS_ONE_ARG) * 2;
 		/* Emit table line */
 		/* This has to be in the documented order for userspace! */
 		DMEMIT("%s %u %u", rs->raid_type->name, raid_param_cnt, mddev->new_chunk_sectors);
@@ -3612,11 +3613,10 @@ static void raid_status(struct dm_target *ti, status_type_t type,
 			DMEMIT(" %s", dm_raid_arg_name_by_flag(CTR_FLAG_SYNC));
 		if (test_bit(__CTR_FLAG_NOSYNC, &rs->ctr_flags))
 			DMEMIT(" %s", dm_raid_arg_name_by_flag(CTR_FLAG_NOSYNC));
-		if (rebuild_disks)
+		if (test_bit(__CTR_FLAG_REBUILD, &rs->ctr_flags))
 			for (i = 0; i < rs->raid_disks; i++)
-				if (test_bit(rs->dev[i].rdev.raid_disk, (void *) rs->rebuild_disks))
-					DMEMIT(" %s %u", dm_raid_arg_name_by_flag(CTR_FLAG_REBUILD),
-							 rs->dev[i].rdev.raid_disk);
+				if (test_bit(i, (void *) rs->rebuild_disks))
+					DMEMIT(" %s %u", dm_raid_arg_name_by_flag(CTR_FLAG_REBUILD), i);
 		if (test_bit(__CTR_FLAG_DAEMON_SLEEP, &rs->ctr_flags))
 			DMEMIT(" %s %lu", dm_raid_arg_name_by_flag(CTR_FLAG_DAEMON_SLEEP),
 					  mddev->bitmap_info.daemon_sleep);
@@ -3626,7 +3626,7 @@ static void raid_status(struct dm_target *ti, status_type_t type,
 		if (test_bit(__CTR_FLAG_MAX_RECOVERY_RATE, &rs->ctr_flags))
 			DMEMIT(" %s %d", dm_raid_arg_name_by_flag(CTR_FLAG_MAX_RECOVERY_RATE),
 					 mddev->sync_speed_max);
-		if (write_mostly_params)
+		if (test_bit(__CTR_FLAG_WRITE_MOSTLY, &rs->ctr_flags))
 			for (i = 0; i < rs->raid_disks; i++)
 				if (test_bit(WriteMostly, &rs->dev[i].rdev.flags))
 					DMEMIT(" %s %d", dm_raid_arg_name_by_flag(CTR_FLAG_WRITE_MOSTLY),
@@ -4029,7 +4029,7 @@ static void raid_resume(struct dm_target *ti)
 
 static struct target_type raid_target = {
 	.name = "raid",
-	.version = {1, 15, 0},
+	.version = {1, 15, 1},
 	.module = THIS_MODULE,
 	.ctr = raid_ctr,
 	.dtr = raid_dtr,
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

