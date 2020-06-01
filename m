Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DD16A1ED0B8
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 15:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591190764;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MLuam0iMP8WNRXQXNVQFdKmvbUwGBUh0W+GPkJ9fAKE=;
	b=Ox23zBbjKevPD/Nyq5Ntwu2WxJDQSupUhXUKdrvkZLHJyAa9i9ijiuR3lV4+WcAOREfd+A
	VNakM+zegPesgWmgi28T4eLu8hd3xje1r4NtdUa8kduTKFntARMUhkNNebvq47WVPZ6Yyy
	Yk2v+KWB9f7L1T7V37dXwAtndWZQQMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-EcAyQJ-pNFG5C3fpc6jvIg-1; Wed, 03 Jun 2020 09:26:02 -0400
X-MC-Unique: EcAyQJ-pNFG5C3fpc6jvIg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86663835B44;
	Wed,  3 Jun 2020 13:25:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA6989323;
	Wed,  3 Jun 2020 13:25:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67C371809543;
	Wed,  3 Jun 2020 13:25:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051CbMH7013373 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 08:37:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC87E8A4AA; Mon,  1 Jun 2020 12:37:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D77368A4A9
	for <dm-devel@redhat.com>; Mon,  1 Jun 2020 12:37:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B09EB1914A26
	for <dm-devel@redhat.com>; Mon,  1 Jun 2020 12:37:21 +0000 (UTC)
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
	[77.88.29.217]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-23-QQjYVp6fN66L5iSVjS0K7A-1; Mon, 01 Jun 2020 08:37:19 -0400
X-MC-Unique: QQjYVp6fN66L5iSVjS0K7A-1
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
	[IPv6:2a02:6b8:0:1402::301])
	by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id B906A2E150E;
	Mon,  1 Jun 2020 15:37:17 +0300 (MSK)
Received: from myt4-18a966dbd9be.qloud-c.yandex.net
	(myt4-18a966dbd9be.qloud-c.yandex.net
	[2a02:6b8:c00:12ad:0:640:18a9:66db])
	by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
	ai6aEALE3J-bGICEg7u; Mon, 01 Jun 2020 15:37:17 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
	[2a02:6b8:b080:6420::1:8])
	by myt4-18a966dbd9be.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA
	id ugeF6tCqFx-bGWetb0e; Mon, 01 Jun 2020 15:37:16 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-raid@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Mon, 01 Jun 2020 15:37:16 +0300
Message-ID: <159101503621.180989.6036577504611218020.stgit@buzz>
In-Reply-To: <159101473169.180989.12175693728191972447.stgit@buzz>
References: <159101473169.180989.12175693728191972447.stgit@buzz>
User-Agent: StGit/0.22-39-gd257
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 03 Jun 2020 09:25:45 -0400
Cc: Christoph Hellwig <hch@infradead.org>
Subject: [dm-devel] [PATCH RFC 3/3] dm: add support for REQ_NOWAIT and
 enable for target dm-linear
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add dm target feature flag DM_TARGET_NOWAIT which tells that target
has no problem with REQ_NOWAIT.

Set limits.nowait_requests if all targets and backends handle REQ_NOWAIT.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 drivers/md/dm-linear.c        |    5 +++--
 drivers/md/dm-table.c         |    3 +++
 drivers/md/dm.c               |    4 +++-
 include/linux/device-mapper.h |    6 ++++++
 4 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index e1db43446327..00774b5d7668 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -228,10 +228,11 @@ static struct target_type linear_target = {
 	.name   = "linear",
 	.version = {1, 4, 0},
 #ifdef CONFIG_BLK_DEV_ZONED
-	.features = DM_TARGET_PASSES_INTEGRITY | DM_TARGET_ZONED_HM,
+	.features = DM_TARGET_PASSES_INTEGRITY | DM_TARGET_NOWAIT |
+		    DM_TARGET_ZONED_HM,
 	.report_zones = linear_report_zones,
 #else
-	.features = DM_TARGET_PASSES_INTEGRITY,
+	.features = DM_TARGET_PASSES_INTEGRITY | DM_TARGET_NOWAIT,
 #endif
 	.module = THIS_MODULE,
 	.ctr    = linear_ctr,
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 0a2cc197f62b..f4610f79ebd6 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1500,12 +1500,15 @@ int dm_calculate_queue_limits(struct dm_table *table,
 	unsigned int zone_sectors = 0;
 
 	blk_set_stacking_limits(limits);
+	limits->nowait_requests = 1;
 
 	for (i = 0; i < dm_table_get_num_targets(table); i++) {
 		blk_set_stacking_limits(&ti_limits);
 
 		ti = dm_table_get_target(table, i);
 
+		ti_limits.nowait_requests = dm_target_supports_nowait(ti->type);
+
 		if (!ti->type->iterate_devices)
 			goto combine_limits;
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index db9e46114653..767cd4d70341 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1794,7 +1794,9 @@ static blk_qc_t dm_make_request(struct request_queue *q, struct bio *bio)
 	if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags))) {
 		dm_put_live_table(md, srcu_idx);
 
-		if (!(bio->bi_opf & REQ_RAHEAD))
+		if (bio->bi_opf & REQ_NOWAIT)
+			bio_wouldblock_error(bio);
+		else if (!(bio->bi_opf & REQ_RAHEAD))
 			queue_io(md, bio);
 		else
 			bio_io_error(bio);
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index af48d9da3916..4d4af1eeeba4 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -252,6 +252,12 @@ struct target_type {
 #define DM_TARGET_ZONED_HM		0x00000040
 #define dm_target_supports_zoned_hm(type) ((type)->features & DM_TARGET_ZONED_HM)
 
+/*
+ * A target handles REQ_NOWAIT
+ */
+#define DM_TARGET_NOWAIT		0x00000080
+#define dm_target_supports_nowait(type) (!!((type)->features & DM_TARGET_NOWAIT))
+
 struct dm_target {
 	struct dm_table *table;
 	struct target_type *type;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

