Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5B4FD31F
	for <lists+dm-devel@lfdr.de>; Tue, 12 Apr 2022 10:57:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649753844;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3icUmd176o97ELEaf+bWqv6t3mzigSy6jJ2H7Fj4CK8=;
	b=H9v8rHCptetZQgDwJcKBE0bmJu0TvYXwnnk/S0wVcvCOlRjZd3YNfQDxN7oHvm4ebOW21I
	sWVYdEpK4w7umRMeXiJGeQrEG1VnzSW7tayiRAx0LEUZ4DtVA2Y7NZbSCRgYNXjx6lU5UP
	/9Z/WEYDkgVmzxJ7dOjkjAdocoioUKU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-q4O20G0-McmGsSnjjINTnw-1; Tue, 12 Apr 2022 04:57:23 -0400
X-MC-Unique: q4O20G0-McmGsSnjjINTnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BDAE803524;
	Tue, 12 Apr 2022 08:57:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 471D92166BDC;
	Tue, 12 Apr 2022 08:57:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 291221940374;
	Tue, 12 Apr 2022 08:57:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CA6D11947BBF
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Apr 2022 08:57:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A9DAF401DFD; Tue, 12 Apr 2022 08:57:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-19.pek2.redhat.com [10.72.8.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5922401DF3;
 Tue, 12 Apr 2022 08:57:17 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Mike Snitzer <snitzer@redhat.com>
Date: Tue, 12 Apr 2022 16:56:14 +0800
Message-Id: <20220412085616.1409626-7-ming.lei@redhat.com>
In-Reply-To: <20220412085616.1409626-1-ming.lei@redhat.com>
References: <20220412085616.1409626-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH 6/8] dm: don't grab target io reference in
 dm_zone_map_bio
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ming Lei <ming.lei@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm_zone_map_bio() is only called from __map_bio in which the io's
reference is grabbed already, and the reference won't be released
until the bio is submitted, so no necessary to do it dm_zone_map_bio
any more.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Tested-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/md/dm-core.h |  7 -------
 drivers/md/dm-zone.c | 10 ----------
 drivers/md/dm.c      |  7 ++++++-
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index aefb080c230d..811c0ccbc63d 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -283,13 +283,6 @@ static inline void dm_io_set_flag(struct dm_io *io, unsigned int bit)
 	io->flags |= (1U << bit);
 }
 
-static inline void dm_io_inc_pending(struct dm_io *io)
-{
-	atomic_inc(&io->io_count);
-}
-
-void dm_io_dec_pending(struct dm_io *io, blk_status_t error);
-
 static inline struct completion *dm_get_completion_from_kobject(struct kobject *kobj)
 {
 	return &container_of(kobj, struct dm_kobject_holder, kobj)->completion;
diff --git a/drivers/md/dm-zone.c b/drivers/md/dm-zone.c
index c1ca9be4b79e..85d3c158719f 100644
--- a/drivers/md/dm-zone.c
+++ b/drivers/md/dm-zone.c
@@ -545,13 +545,6 @@ int dm_zone_map_bio(struct dm_target_io *tio)
 		return DM_MAPIO_KILL;
 	}
 
-	/*
-	 * The target map function may issue and complete the IO quickly.
-	 * Take an extra reference on the IO to make sure it does disappear
-	 * until we run dm_zone_map_bio_end().
-	 */
-	dm_io_inc_pending(io);
-
 	/* Let the target do its work */
 	r = ti->type->map(ti, clone);
 	switch (r) {
@@ -580,9 +573,6 @@ int dm_zone_map_bio(struct dm_target_io *tio)
 		break;
 	}
 
-	/* Drop the extra reference on the IO */
-	dm_io_dec_pending(io, sts);
-
 	if (sts != BLK_STS_OK)
 		return DM_MAPIO_KILL;
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index df1d013fb793..3c3ba6b4e19b 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -937,11 +937,16 @@ static inline bool dm_tio_is_normal(struct dm_target_io *tio)
 		!dm_tio_flagged(tio, DM_TIO_IS_DUPLICATE_BIO));
 }
 
+static void dm_io_inc_pending(struct dm_io *io)
+{
+	atomic_inc(&io->io_count);
+}
+
 /*
  * Decrements the number of outstanding ios that a bio has been
  * cloned into, completing the original io if necc.
  */
-void dm_io_dec_pending(struct dm_io *io, blk_status_t error)
+static void dm_io_dec_pending(struct dm_io *io, blk_status_t error)
 {
 	/* Push-back supersedes any I/O errors */
 	if (unlikely(error)) {
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

