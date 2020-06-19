Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C05E7201CE5
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 23:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592601098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L0irZmP/E0f3jg7m5n31az7Dmg1vYecHZc9BKOnCd1Y=;
	b=d/l/nDVkUZbn83uKD4s/sWotSeKzN6MNqQDNVZHQyDfYb8zohOLKBu8oIWh2E54ilXurvU
	SIq7Nvf3yfmcjkhNbSLXXess0Yy33GG09c1WU3s2DzBJARG9pWZO6D2frr/HA+Jj3+ncin
	X8Gnhrkl03UabDsdi/bBZ9b07CigR3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-xRFizxX_OMCmaAdba1ClIw-1; Fri, 19 Jun 2020 17:11:35 -0400
X-MC-Unique: xRFizxX_OMCmaAdba1ClIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37AD9107ACCA;
	Fri, 19 Jun 2020 21:11:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D17C10027A6;
	Fri, 19 Jun 2020 21:11:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 924BB1809547;
	Fri, 19 Jun 2020 21:11:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JLB3t8005979 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 17:11:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DF865BAC7; Fri, 19 Jun 2020 21:11:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (ovpn-115-194.rdu2.redhat.com
	[10.10.115.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE0425BAC3;
	Fri, 19 Jun 2020 21:10:57 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri, 19 Jun 2020 17:10:39 -0400
Message-Id: <1592601039-3868-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: yangerkun <yangerkun@huawei.com>, Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH v4 1/4] dm dust: report some message results back
	to user directly
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: yangerkun <yangerkun@huawei.com>

From: yangerkun <yangerkun@huawei.com>

Some type of message(queryblock/countbadblocks/removebadblock) may better
report results to user directly. Do it with DMEMIT.

[Bryan: maintain __func__ output in DMEMIT messages]

Signed-off-by: yangerkun <yangerkun@huawei.com>
Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 drivers/md/dm-dust.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index ff03b90072c5..f1f2dd6a4e84 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -138,20 +138,22 @@ static int dust_add_block(struct dust_device *dd, unsigned long long block,
 	return 0;
 }
 
-static int dust_query_block(struct dust_device *dd, unsigned long long block)
+static int dust_query_block(struct dust_device *dd, unsigned long long block, char *result,
+			    unsigned int maxlen, unsigned int *sz_ptr)
 {
 	struct badblock *bblock;
 	unsigned long flags;
+	unsigned int sz = *sz_ptr;
 
 	spin_lock_irqsave(&dd->dust_lock, flags);
 	bblock = dust_rb_search(&dd->badblocklist, block);
 	if (bblock != NULL)
-		DMINFO("%s: block %llu found in badblocklist", __func__, block);
+		DMEMIT("%s: block %llu found in badblocklist", __func__, block);
 	else
-		DMINFO("%s: block %llu not found in badblocklist", __func__, block);
+		DMEMIT("%s: block %llu not found in badblocklist", __func__, block);
 	spin_unlock_irqrestore(&dd->dust_lock, flags);
 
-	return 0;
+	return 1;
 }
 
 static int __dust_map_read(struct dust_device *dd, sector_t thisblock)
@@ -259,11 +261,13 @@ static bool __dust_clear_badblocks(struct rb_root *tree,
 	return true;
 }
 
-static int dust_clear_badblocks(struct dust_device *dd)
+static int dust_clear_badblocks(struct dust_device *dd, char *result, unsigned int maxlen,
+				unsigned int *sz_ptr)
 {
 	unsigned long flags;
 	struct rb_root badblocklist;
 	unsigned long long badblock_count;
+	unsigned int sz = *sz_ptr;
 
 	spin_lock_irqsave(&dd->dust_lock, flags);
 	badblocklist = dd->badblocklist;
@@ -273,11 +277,11 @@ static int dust_clear_badblocks(struct dust_device *dd)
 	spin_unlock_irqrestore(&dd->dust_lock, flags);
 
 	if (!__dust_clear_badblocks(&badblocklist, badblock_count))
-		DMINFO("%s: no badblocks found", __func__);
+		DMEMIT("%s: no badblocks found", __func__);
 	else
-		DMINFO("%s: badblocks cleared", __func__);
+		DMEMIT("%s: badblocks cleared", __func__);
 
-	return 0;
+	return 1;
 }
 
 /*
@@ -383,7 +387,7 @@ static void dust_dtr(struct dm_target *ti)
 }
 
 static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
-			char *result_buf, unsigned int maxlen)
+			char *result, unsigned int maxlen)
 {
 	struct dust_device *dd = ti->private;
 	sector_t size = i_size_read(dd->dev->bdev->bd_inode) >> SECTOR_SHIFT;
@@ -393,6 +397,7 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 	unsigned char wr_fail_cnt;
 	unsigned int tmp_ui;
 	unsigned long flags;
+	unsigned int sz = 0;
 	char dummy;
 
 	if (argc == 1) {
@@ -410,12 +415,12 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 			r = 0;
 		} else if (!strcasecmp(argv[0], "countbadblocks")) {
 			spin_lock_irqsave(&dd->dust_lock, flags);
-			DMINFO("countbadblocks: %llu badblock(s) found",
+			DMEMIT("countbadblocks: %llu badblock(s) found",
 			       dd->badblock_count);
 			spin_unlock_irqrestore(&dd->dust_lock, flags);
-			r = 0;
+			r = 1;
 		} else if (!strcasecmp(argv[0], "clearbadblocks")) {
-			r = dust_clear_badblocks(dd);
+			r = dust_clear_badblocks(dd, result, maxlen, &sz);
 		} else if (!strcasecmp(argv[0], "quiet")) {
 			if (!dd->quiet_mode)
 				dd->quiet_mode = true;
@@ -441,7 +446,7 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 		else if (!strcasecmp(argv[0], "removebadblock"))
 			r = dust_remove_block(dd, block);
 		else if (!strcasecmp(argv[0], "queryblock"))
-			r = dust_query_block(dd, block);
+			r = dust_query_block(dd, block, result, maxlen, &sz);
 		else
 			invalid_msg = true;
 
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

