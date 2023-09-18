Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AAF7A4C6F
	for <lists+dm-devel@lfdr.de>; Mon, 18 Sep 2023 17:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695051230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WztBL13wFnXzCiLCcUjHN4rLv8g8x8hxVgDa5/KAXq8=;
	b=ZAFBsbknu8RWNa69/fSH0cR8CLlRAyb96HU13zaZkVKq1etInIGkKESns/okhyTofE3l13
	7fu4hpSNdJQR2/2ttNsBARwO9eAPqbXV1E7Qok5V5VEgMHkgcG1krOGoqTI4rOOBTenVxG
	4ZP8e/K+mZSo5sGpGqIoT1bYPFzLYwY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-U_eFbUF7OqWEkiYwMYwiLw-1; Mon, 18 Sep 2023 11:33:47 -0400
X-MC-Unique: U_eFbUF7OqWEkiYwMYwiLw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8DF729AA2C4;
	Mon, 18 Sep 2023 15:33:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F314649BB9A;
	Mon, 18 Sep 2023 15:33:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B4F2E19466F0;
	Mon, 18 Sep 2023 15:33:30 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3BA5B19466EE
 for <dm-devel@listman.corp.redhat.com>; Mon, 18 Sep 2023 15:33:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3233BC154CB; Mon, 18 Sep 2023 15:33:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BBCAC154CA;
 Mon, 18 Sep 2023 15:33:29 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id 0F8C130C1C0A; Mon, 18 Sep 2023 15:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 09DDC3FD53; Mon, 18 Sep 2023 17:33:29 +0200 (CEST)
Date: Mon, 18 Sep 2023 17:33:29 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <dffcbbd-ba15-b088-6021-4af5d58c5865@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH] dm: shortcut the calls to linear_map and
 stripe_map
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Shortcut the calls to linear_map and stripe_map, so that they don't suffer 
the overhead of retpolines used for indirect calls.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-linear.c |    2 +-
 drivers/md/dm-stripe.c |    2 +-
 drivers/md/dm.c        |   11 +++++++++--
 drivers/md/dm.h        |    2 ++
 4 files changed, 13 insertions(+), 4 deletions(-)

Index: linux-2.6/drivers/md/dm-linear.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-linear.c
+++ linux-2.6/drivers/md/dm-linear.c
@@ -85,7 +85,7 @@ static sector_t linear_map_sector(struct
 	return lc->start + dm_target_offset(ti, bi_sector);
 }
 
-static int linear_map(struct dm_target *ti, struct bio *bio)
+int linear_map(struct dm_target *ti, struct bio *bio)
 {
 	struct linear_c *lc = ti->private;
 
Index: linux-2.6/drivers/md/dm-stripe.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-stripe.c
+++ linux-2.6/drivers/md/dm-stripe.c
@@ -268,7 +268,7 @@ static int stripe_map_range(struct strip
 	return DM_MAPIO_SUBMITTED;
 }
 
-static int stripe_map(struct dm_target *ti, struct bio *bio)
+int stripe_map(struct dm_target *ti, struct bio *bio)
 {
 	struct stripe_c *sc = ti->private;
 	uint32_t stripe;
Index: linux-2.6/drivers/md/dm.c
===================================================================
--- linux-2.6.orig/drivers/md/dm.c
+++ linux-2.6/drivers/md/dm.c
@@ -1424,9 +1424,16 @@ static void __map_bio(struct bio *clone)
 		if (unlikely(dm_emulate_zone_append(md)))
 			r = dm_zone_map_bio(tio);
 		else
+			goto do_map;
+	} else {
+do_map:
+		if (likely(ti->type->map == linear_map))
+			r = linear_map(ti, clone);
+		else if (ti->type->map == stripe_map)
+			r = stripe_map(ti, clone);
+		else
 			r = ti->type->map(ti, clone);
-	} else
-		r = ti->type->map(ti, clone);
+	}
 
 	switch (r) {
 	case DM_MAPIO_SUBMITTED:
Index: linux-2.6/drivers/md/dm.h
===================================================================
--- linux-2.6.orig/drivers/md/dm.h
+++ linux-2.6/drivers/md/dm.h
@@ -188,9 +188,11 @@ void dm_kobject_release(struct kobject *
 /*
  * Targets for linear and striped mappings
  */
+int linear_map(struct dm_target *ti, struct bio *bio);
 int dm_linear_init(void);
 void dm_linear_exit(void);
 
+int stripe_map(struct dm_target *ti, struct bio *bio);
 int dm_stripe_init(void);
 void dm_stripe_exit(void);
 
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

