Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AEDAE2761AA
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 22:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600891659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jeWEnWFgK/7+GVVBUgKB8O9XAa6/cPBhIxXQvhSxqLk=;
	b=J1u0N11UGkGVYR6+QOwu/sPIHPBFbGClP15mNCBoeQ6CmTrBmPecKavl+IDOttr/lFaxRR
	+5/GQENEAvxzMkla9cHC5T6OtUJSM8fVk270pfpIwgtlLJnPPTe4mhY6m3pEQNw1OWkmfV
	3k6pyEcGovAcmDDW5UkhE/I1kp509gE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-jsOOq4dgNQ-bTzN57GetVQ-1; Wed, 23 Sep 2020 16:07:37 -0400
X-MC-Unique: jsOOq4dgNQ-bTzN57GetVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF29B64094;
	Wed, 23 Sep 2020 20:07:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9332055783;
	Wed, 23 Sep 2020 20:07:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00EC518095FF;
	Wed, 23 Sep 2020 20:07:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NK6xuG027866 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 16:06:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 733B010769D; Wed, 23 Sep 2020 20:06:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EC0310769A
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 20:06:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5678A801184
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 20:06:59 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-227-v3aFEOwKNzSkOmnvM0mZ0w-1; Wed, 23 Sep 2020 16:06:57 -0400
X-MC-Unique: v3aFEOwKNzSkOmnvM0mZ0w-1
Received: by mail-qt1-f196.google.com with SMTP id b2so998847qtp.8
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 13:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=HONrzBdI9DpoxCRFwugtgwBfWYcioGP4sYYVCknfP9M=;
	b=OIvJc72x5pvc12RKK80nzwWblhHphr4kQq1sdGZNekXbGZxLNlqFJ06rJ+Wy3vNFed
	msx5iJYKB4MZXI0UnT5cP7yrUQA58hypKAsNcvDO02pYnAmsH/pa+Pq8ZXSEHTgayv+Z
	CxxyjuXL7Noed/396bbllD9xE/nzsVBDQDMquy6jdRi+H7sQ7Paa7Hy5TG2AWqvHMNpm
	vL5OZrkWZ3/6dDWs5Wa6DRY95An5qRkVgv8meLE2t79KfqHVFKON1c0Pcokpm2Qz2RPG
	RentAHiJs4Cp2CqeljNz/wKZ96qi8CXr++6RMQDQ9267+I0fM7C/iAwfQuCyFlPrBFnQ
	wg3w==
X-Gm-Message-State: AOAM533wm4quXtvgHS98xF0M8EUIhPvPS1s/b0S2E+lUytTBpoGHpYmQ
	NRIvr+ZmVjPH/c3pLP9O0U8=
X-Google-Smtp-Source: ABdhPJwpLw9FIyba3sFP5Emu/a5Qy5slUFAK7OpphUveSgDQP2azOPSP+DLQfimaU0DBD9qMPynDgg==
X-Received: by 2002:ac8:44a7:: with SMTP id a7mr1883594qto.173.1600891616592; 
	Wed, 23 Sep 2020 13:06:56 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id p20sm623842qtk.21.2020.09.23.13.06.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Sep 2020 13:06:55 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 23 Sep 2020 16:06:52 -0400
Message-Id: <20200923200652.11082-3-snitzer@redhat.com>
In-Reply-To: <20200923200652.11082-1-snitzer@redhat.com>
References: <20200923200652.11082-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-block@vger.kernel.org, dm-devel@redhat.com, hch@lst.de
Subject: [dm-devel] [PATCH 2/2] dm: add support for REQ_NOWAIT and enable it
	for linear target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>

Add DM target feature flag DM_TARGET_NOWAIT which advertises that
target works with REQ_NOWAIT bios.

Add dm_table_supports_nowait() and update dm_table_set_restrictions()
to set/clear QUEUE_FLAG_NOWAIT accordingly.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm-linear.c        |  5 +++--
 drivers/md/dm-table.c         | 32 ++++++++++++++++++++++++++++++++
 drivers/md/dm.c               |  4 +++-
 include/linux/device-mapper.h |  6 ++++++
 4 files changed, 44 insertions(+), 3 deletions(-)

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
index acba92500c12..17fb9b96d18e 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1719,6 +1719,33 @@ static bool dm_table_supports_write_zeroes(struct dm_table *t)
 	return true;
 }
 
+static int device_not_nowait_capable(struct dm_target *ti, struct dm_dev *dev,
+				     sector_t start, sector_t len, void *data)
+{
+	struct request_queue *q = bdev_get_queue(dev->bdev);
+
+	return q && !blk_queue_nowait(q);
+}
+
+static bool dm_table_supports_nowait(struct dm_table *t)
+{
+	struct dm_target *ti;
+	unsigned i = 0;
+
+	while (i < dm_table_get_num_targets(t)) {
+		ti = dm_table_get_target(t, i++);
+
+		if (!dm_target_supports_nowait(ti->type))
+			return false;
+
+		if (!ti->type->iterate_devices ||
+		    ti->type->iterate_devices(ti, device_not_nowait_capable, NULL))
+			return false;
+	}
+
+	return true;
+}
+
 static int device_not_discard_capable(struct dm_target *ti, struct dm_dev *dev,
 				      sector_t start, sector_t len, void *data)
 {
@@ -1821,6 +1848,11 @@ void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 	 */
 	q->limits = *limits;
 
+	if (dm_table_supports_nowait(t))
+		blk_queue_flag_set(QUEUE_FLAG_NOWAIT, q);
+	else
+		blk_queue_flag_clear(QUEUE_FLAG_NOWAIT, q);
+
 	if (!dm_table_supports_discards(t)) {
 		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
 		/* Must also clear discard limits... */
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index b110b5eb99a5..3ad4a8da8b15 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1733,7 +1733,9 @@ static blk_qc_t dm_submit_bio(struct bio *bio)
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
index 57610fc3013e..ba3b0979e09f 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -252,6 +252,12 @@ struct target_type {
 #define DM_TARGET_ZONED_HM		0x00000040
 #define dm_target_supports_zoned_hm(type) ((type)->features & DM_TARGET_ZONED_HM)
 
+/*
+ * A target handles REQ_NOWAIT
+ */
+#define DM_TARGET_NOWAIT		0x00000080
+#define dm_target_supports_nowait(type) ((type)->features & DM_TARGET_NOWAIT)
+
 struct dm_target {
 	struct dm_table *table;
 	struct target_type *type;
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

