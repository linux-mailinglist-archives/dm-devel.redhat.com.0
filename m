Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C16906ACD9D
	for <lists+dm-devel@lfdr.de>; Mon,  6 Mar 2023 20:10:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678129855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Qm7UW2WCXOfvYexWE3jkBtnzQ27ZfaurK7twMHWUdbQ=;
	b=OwL5i7Gu8Xv/NUHD1WlMhhXymZz1nYx4q46mk7KmSS/ScQecTUAMGTX6IYZ9WoqlXZTA6V
	fvaJ3SAou1rze8ONolM7CxtzHvR7iXBcZ5trRv8hBQYV2Eu1nycWVv6IAI0q0MT8RkV/M6
	hyKUJWWY/Y3R4Qh/VWRY/SEv1PnTxCQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-O50YAc0CPS-42-_oY2h2oQ-1; Mon, 06 Mar 2023 14:10:53 -0500
X-MC-Unique: O50YAc0CPS-42-_oY2h2oQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 977F03C10ED3;
	Mon,  6 Mar 2023 19:10:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F09E112132E;
	Mon,  6 Mar 2023 19:10:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 49F5619465A4;
	Mon,  6 Mar 2023 19:10:27 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D464C1946589
 for <dm-devel@listman.corp.redhat.com>; Mon,  6 Mar 2023 19:10:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C34BB112132D; Mon,  6 Mar 2023 19:10:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2BE41121314;
 Mon,  6 Mar 2023 19:10:25 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 326JAP9P005973; Mon, 6 Mar 2023 14:10:25 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 326JAPnn005969; Mon, 6 Mar 2023 14:10:25 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 6 Mar 2023 14:10:25 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@kernel.org>, Milan Broz <gmazyland@gmail.com>
Message-ID: <alpine.LRH.2.21.2303061407210.5778@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH] dm-zero: support discards
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds discard support to dm-zero. The discards are ignored.
It is useful when the user combines dm-zero with other discard-supporting
targets in the same table; without dm-zero support, discards would be
disabled for the whole combined device.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-table.c |    9 ++++++++-
 drivers/md/dm-zero.c  |    4 +++-
 2 files changed, 11 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-zero.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-zero.c
+++ linux-2.6/drivers/md/dm-zero.c
@@ -27,6 +27,7 @@ static int zero_ctr(struct dm_target *ti
 	 * Silently drop discards, avoiding -EOPNOTSUPP.
 	 */
 	ti->num_discard_bios = 1;
+	ti->discards_supported = true;
 
 	return 0;
 }
@@ -45,6 +46,7 @@ static int zero_map(struct dm_target *ti
 		zero_fill_bio(bio);
 		break;
 	case REQ_OP_WRITE:
+	case REQ_OP_DISCARD:
 		/* writes get silently dropped */
 		break;
 	default:
@@ -59,7 +61,7 @@ static int zero_map(struct dm_target *ti
 
 static struct target_type zero_target = {
 	.name   = "zero",
-	.version = {1, 1, 0},
+	.version = {1, 2, 0},
 	.features = DM_TARGET_NOWAIT,
 	.module = THIS_MODULE,
 	.ctr    = zero_ctr,
Index: linux-2.6/drivers/md/dm-table.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-table.c
+++ linux-2.6/drivers/md/dm-table.c
@@ -1670,8 +1670,15 @@ int dm_calculate_queue_limits(struct dm_
 
 		blk_set_stacking_limits(&ti_limits);
 
-		if (!ti->type->iterate_devices)
+		if (!ti->type->iterate_devices) {
+			if (ti->discards_supported) {
+				ti_limits.max_discard_sectors = UINT_MAX;
+				ti_limits.max_hw_discard_sectors = UINT_MAX;
+				ti_limits.discard_granularity = 512;
+				ti_limits.discard_alignment = 0;
+			}
 			goto combine_limits;
+		}
 
 		/*
 		 * Combine queue limits of all the devices this target uses.
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

