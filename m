Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 53332CBF82
	for <lists+dm-devel@lfdr.de>; Fri,  4 Oct 2019 17:42:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E35CC05AA63;
	Fri,  4 Oct 2019 15:42:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CE1D60C5D;
	Fri,  4 Oct 2019 15:42:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD0154E589;
	Fri,  4 Oct 2019 15:42:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94FgYSR031323 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 11:42:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 186075D6B7; Fri,  4 Oct 2019 15:42:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (unknown [10.18.25.99])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90F955D6A5;
	Fri,  4 Oct 2019 15:42:33 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri,  4 Oct 2019 11:42:08 -0400
Message-Id: <1570203729-22034-2-git-send-email-bgurney@redhat.com>
In-Reply-To: <1570203729-22034-1-git-send-email-bgurney@redhat.com>
References: <1570203729-22034-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH 1/2] dm dust: change result vars to r
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 04 Oct 2019 15:42:41 +0000 (UTC)

Change the "result" variables to "r" in dust_status() and
dust_message().

Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 drivers/md/dm-dust.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 8288887b7f94..29626ff8b8e8 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -375,7 +375,7 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 	struct dust_device *dd = ti->private;
 	sector_t size = i_size_read(dd->dev->bdev->bd_inode) >> SECTOR_SHIFT;
 	bool invalid_msg = false;
-	int result = -EINVAL;
+	int r = -EINVAL;
 	unsigned long long tmp, block;
 	unsigned long flags;
 	char dummy;
@@ -388,45 +388,45 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 		} else if (!strcasecmp(argv[0], "disable")) {
 			DMINFO("disabling read failures on bad sectors");
 			dd->fail_read_on_bb = false;
-			result = 0;
+			r = 0;
 		} else if (!strcasecmp(argv[0], "enable")) {
 			DMINFO("enabling read failures on bad sectors");
 			dd->fail_read_on_bb = true;
-			result = 0;
+			r = 0;
 		} else if (!strcasecmp(argv[0], "countbadblocks")) {
 			spin_lock_irqsave(&dd->dust_lock, flags);
 			DMINFO("countbadblocks: %llu badblock(s) found",
 			       dd->badblock_count);
 			spin_unlock_irqrestore(&dd->dust_lock, flags);
-			result = 0;
+			r = 0;
 		} else if (!strcasecmp(argv[0], "clearbadblocks")) {
-			result = dust_clear_badblocks(dd);
+			r = dust_clear_badblocks(dd);
 		} else if (!strcasecmp(argv[0], "quiet")) {
 			if (!dd->quiet_mode)
 				dd->quiet_mode = true;
 			else
 				dd->quiet_mode = false;
-			result = 0;
+			r = 0;
 		} else {
 			invalid_msg = true;
 		}
 	} else if (argc == 2) {
 		if (sscanf(argv[1], "%llu%c", &tmp, &dummy) != 1)
-			return result;
+			return r;
 
 		block = tmp;
 		sector_div(size, dd->sect_per_block);
 		if (block > size) {
 			DMERR("selected block value out of range");
-			return result;
+			return r;
 		}
 
 		if (!strcasecmp(argv[0], "addbadblock"))
-			result = dust_add_block(dd, block);
+			r = dust_add_block(dd, block);
 		else if (!strcasecmp(argv[0], "removebadblock"))
-			result = dust_remove_block(dd, block);
+			r = dust_remove_block(dd, block);
 		else if (!strcasecmp(argv[0], "queryblock"))
-			result = dust_query_block(dd, block);
+			r = dust_query_block(dd, block);
 		else
 			invalid_msg = true;
 
@@ -436,7 +436,7 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 	if (invalid_msg)
 		DMERR("unrecognized message '%s' received", argv[0]);
 
-	return result;
+	return r;
 }
 
 static void dust_status(struct dm_target *ti, status_type_t type,
@@ -499,12 +499,12 @@ static struct target_type dust_target = {
 
 static int __init dm_dust_init(void)
 {
-	int result = dm_register_target(&dust_target);
+	int r = dm_register_target(&dust_target);
 
-	if (result < 0)
-		DMERR("dm_register_target failed %d", result);
+	if (r < 0)
+		DMERR("dm_register_target failed %d", r);
 
-	return result;
+	return r;
 }
 
 static void __exit dm_dust_exit(void)
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
