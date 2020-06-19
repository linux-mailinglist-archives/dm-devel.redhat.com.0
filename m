Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E62FE2008DD
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570371;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IkLTzBl7vyMrzKuLqiBbZN/g5RvqfnSnI0xnRvXrRvQ=;
	b=R0ZldHdM87RJZ8STvw/y25LkoTqT6HMjRdfSeTWk5IsMHSnwJoiadnKUDSsi2StHKHYx2k
	YLWvjzLTrX2F+sSnGQITywLgD/SCpbJDGtnO5O8HZp82YnkR3zfkrPxkKqnVZTnQSeMiTQ
	inR6tmO8JGMvGRuhqAmYtG53JUlq7WM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-ANipB5UZPL6ZDuym0B1svg-1; Fri, 19 Jun 2020 08:39:29 -0400
X-MC-Unique: ANipB5UZPL6ZDuym0B1svg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 384516A2BE;
	Fri, 19 Jun 2020 12:39:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18DCA7C1F3;
	Fri, 19 Jun 2020 12:39:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D12E5833D3;
	Fri, 19 Jun 2020 12:39:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JCbBnL027930 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 08:37:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2CB52103CCA; Fri, 19 Jun 2020 12:37:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 280BA103CD5
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 394F21859162
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:09 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-tKeqzOK-OpigpGHLKdg1qQ-1; Fri, 19 Jun 2020 08:37:04 -0400
X-MC-Unique: tKeqzOK-OpigpGHLKdg1qQ-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id B200125A4E6271E030DA;
	Fri, 19 Jun 2020 20:36:59 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 19 Jun 2020 20:36:52 +0800
From: yangerkun <yangerkun@huawei.com>
To: <snitzer@redhat.com>, <bgurney@redhat.com>, <agk@redhat.com>,
	<bmr@redhat.com>
Date: Fri, 19 Jun 2020 20:38:00 +0800
Message-ID: <20200619123803.1441373-2-yangerkun@huawei.com>
In-Reply-To: <20200619123803.1441373-1-yangerkun@huawei.com>
References: <20200619123803.1441373-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05JCbBnL027930
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH v3 1/4] dm dust: report some message results back
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some type of message(queryblock/countbadblocks/removebadblock) may better
report results to user directly. Do it with DMEMIT.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 drivers/md/dm-dust.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index ff03b90072c5..a0c75c104de0 100644
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
+		DMEMIT("block %llu found in badblocklist", block);
 	else
-		DMINFO("%s: block %llu not found in badblocklist", __func__, block);
+		DMEMIT("block %llu not found in badblocklist", block);
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
+		DMEMIT("no badblocks found");
 	else
-		DMINFO("%s: badblocks cleared", __func__);
+		DMEMIT("badblocks cleared");
 
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

