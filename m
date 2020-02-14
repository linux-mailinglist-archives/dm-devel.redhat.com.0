Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E3E001659CF
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jhDkAQcMAKcKll3pva6SAgkXJQkDRAzA3sxn9ixnOyQ=;
	b=LAgjoHFrG+qyUm32XftYQojAC/gg1HWl+gIHQ6lzPt6SKmrP/6Tp8gpnvcG3TVc8gBVy0u
	8l1Z70NobvaHV6RHeyMq9pitg9mvZ+2T0mqVtU1AaxW95OVrM6nZdGYQHgYYTyrQw7QIwR
	RLtTNi7a0OqvgfTlj5apr+EiAQ5UO9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-jpfRtrevNcGzWKBPBRjLIA-1; Thu, 20 Feb 2020 04:06:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03BA81007277;
	Thu, 20 Feb 2020 09:06:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBBAC90781;
	Thu, 20 Feb 2020 09:06:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B2334EBDE;
	Thu, 20 Feb 2020 09:06:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01EFoCSW026821 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Feb 2020 10:50:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6BA72166B2A; Fri, 14 Feb 2020 15:50:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1C332166B30
	for <dm-devel@redhat.com>; Fri, 14 Feb 2020 15:50:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD6DC1011A78
	for <dm-devel@redhat.com>; Fri, 14 Feb 2020 15:50:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-340-V2ByZzvRPuC_WRfhCTw5-Q-1;
	Fri, 14 Feb 2020 10:50:06 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BB79124689;
	Fri, 14 Feb 2020 15:50:03 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:40:45 -0500
Message-Id: <20200214154854.6746-53-sashal@kernel.org>
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: V2ByZzvRPuC_WRfhCTw5-Q-1
X-MC-Unique: jpfRtrevNcGzWKBPBRjLIA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01EFoCSW026821
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: Sasha Levin <sashal@kernel.org>, Heinz Mauelshagen <heinzm@redhat.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-doc@vger.kernel.org
Subject: [dm-devel] [PATCH AUTOSEL 5.5 053/542] dm raid: table line rebuild
	status fixes
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

From: Heinz Mauelshagen <heinzm@redhat.com>

[ Upstream commit 43f3952a51f8198d365acb7f51fe42d578fe5d0a ]

raid_status() wasn't emitting rebuild flags on the table line properly
because the rdev number was not yet set properly; index raid component
devices array directly to solve.

Also fix wrong argument count on emitted table line caused by 1 too
many rebuild/write_mostly argument and consider any journal_(dev|mode)
pairs.

Link: https://bugzilla.redhat.com/1782045
Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../admin-guide/device-mapper/dm-raid.rst     |  2 +
 drivers/md/dm-raid.c                          | 43 ++++++++++---------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-raid.rst b/Documentation/admin-guide/device-mapper/dm-raid.rst
index f6344675e3951..695a2ea1d1ae2 100644
--- a/Documentation/admin-guide/device-mapper/dm-raid.rst
+++ b/Documentation/admin-guide/device-mapper/dm-raid.rst
@@ -419,3 +419,5 @@ Version History
 	rebuild errors.
  1.15.0 Fix size extensions not being synchronized in case of new MD bitmap
         pages allocated;  also fix those not occuring after previous reductions
+ 1.15.1 Fix argument count and arguments for rebuild/write_mostly/journal_(dev|mode)
+        on the status line.
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index c412eaa975fc0..9a18bef0a5ff0 100644
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
@@ -3593,18 +3593,20 @@ static void raid_status(struct dm_target *ti, status_type_t type,
 	case STATUSTYPE_TABLE:
 		/* Report the table line string you would use to construct this raid set */
 
-		/* Calculate raid parameter count */
-		for (i = 0; i < rs->raid_disks; i++)
-			if (test_bit(WriteMostly, &rs->dev[i].rdev.flags))
-				write_mostly_params += 2;
-		rebuild_disks = memweight(rs->rebuild_disks, DISKS_ARRAY_ELEMS * sizeof(*rs->rebuild_disks));
-		raid_param_cnt += rebuild_disks * 2 +
-				  write_mostly_params +
+		/*
+		 * Count any rebuild or writemostly argument pairs and subtract the
+		 * hweight count being added below of any rebuild and writemostly ctr flags.
+		 */
+		for (i = 0; i < rs->raid_disks; i++) {
+			rebuild_writemostly_count += (test_bit(i, (void *) rs->rebuild_disks) ? 2 : 0) +
+						     (test_bit(WriteMostly, &rs->dev[i].rdev.flags) ? 2 : 0);
+		}
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
@@ -3612,11 +3614,10 @@ static void raid_status(struct dm_target *ti, status_type_t type,
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
@@ -3626,7 +3627,7 @@ static void raid_status(struct dm_target *ti, status_type_t type,
 		if (test_bit(__CTR_FLAG_MAX_RECOVERY_RATE, &rs->ctr_flags))
 			DMEMIT(" %s %d", dm_raid_arg_name_by_flag(CTR_FLAG_MAX_RECOVERY_RATE),
 					 mddev->sync_speed_max);
-		if (write_mostly_params)
+		if (test_bit(__CTR_FLAG_WRITE_MOSTLY, &rs->ctr_flags))
 			for (i = 0; i < rs->raid_disks; i++)
 				if (test_bit(WriteMostly, &rs->dev[i].rdev.flags))
 					DMEMIT(" %s %d", dm_raid_arg_name_by_flag(CTR_FLAG_WRITE_MOSTLY),
@@ -4029,7 +4030,7 @@ static void raid_resume(struct dm_target *ti)
 
 static struct target_type raid_target = {
 	.name = "raid",
-	.version = {1, 15, 0},
+	.version = {1, 15, 1},
 	.module = THIS_MODULE,
 	.ctr = raid_ctr,
 	.dtr = raid_dtr,
-- 
2.20.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

