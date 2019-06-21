Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3EF503E2
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:43:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C67D22F8BE3;
	Mon, 24 Jun 2019 07:43:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93DA0600C4;
	Mon, 24 Jun 2019 07:43:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FB8F206D3;
	Mon, 24 Jun 2019 07:43:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5LD7r9O014243 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 09:07:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9874D5C225; Fri, 21 Jun 2019 13:07:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93DB05C21E
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:51 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3970B804F2
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:35 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k18so5881628ljc.11
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KIxiEPjPFTJ+1vxbl5yjwf7laBnZVBburPM3Qsvxjsc=;
	b=jAkjttrkDBc5StTWyglwMWmrFO5xfZMZEC4/aXMujoVsmJjiVumNp87/zZAkoldEE8
	owN6HkrMnD9li+fb0BQuGz+pdNmonPApcLo2UC5s/As+WvpPXm6Ae4a9KqIRojiU04cX
	KKYXnVSTkkmIUcdOIY1IwzqKt9bIBvIOjMfEsmvnNiPEMhQkCWDAIHC7oGmqIM0MfWSx
	2lMX0vWAOdnCAFaWuQgX4llUeqNe/dWyQT5F9eirTWV3QTSeiK0Lg0x+5IvLmbg9jxqa
	GVVr15lFJs3acP1kyx5aRviZYeEn7le4EWriJvOYYdS3MhRmRuUdX0X5C2NNu1pVZlZ/
	FMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KIxiEPjPFTJ+1vxbl5yjwf7laBnZVBburPM3Qsvxjsc=;
	b=cyUCcQ7VfVKtYj6x2e5F7jmF3BLyKU1Jy3vyWAmqM9296SX4jXrCgGVoT2qrrgPnRF
	lZn/WFIhDcCZy4y+P59TPteww9RcAgd1NNO/FrNNjkfI6piJnBq8Va+P3ql4ElD8SKe1
	ig39Mvy3dklvqIbAVoH4YPhlzcGyGAtZM/5rv5+H8knWYvqMDktqsxiyPIhFyw0qyffL
	T7xe0M/5NlcnZJFeBNo7u6Sn2TvuU6BSwE+hJGYykyT/z5zarBvCfdr3lYAVMZfPfNyj
	PWZjwBbwlBPibGAjE4G7bXLFl212GEazZKrB06UeIKjjdzBznTkLX+uhcuZZcf5XChiC
	/U1Q==
X-Gm-Message-State: APjAAAXokP8pJ2FZTTjFlh6kBC+34vcdtguXjFEVDCcewn1DzuOuWvWW
	Jo9hKnbILwOUCC9H8q8vDamUYQ==
X-Google-Smtp-Source: APXvYqztGCnsvf/snvO0fvZpXnEV5w6WCjbqDHG4Xxb6KNLNPuizWdxlt0NMN+AmNi/deF5LAXFr2A==
X-Received: by 2002:a2e:8847:: with SMTP id z7mr10590901ljj.51.1561122453679; 
	Fri, 21 Jun 2019 06:07:33 -0700 (PDT)
Received: from skyninja.webspeed.dk (2-111-91-225-cable.dk.customer.tdc.net.
	[2.111.91.225])
	by smtp.gmail.com with ESMTPSA id r2sm387100lfi.51.2019.06.21.06.07.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 06:07:33 -0700 (PDT)
From: =?UTF-8?q?Matias=20Bj=C3=B8rling?= <mb@lightnvm.io>
To: axboe@fb.com, hch@lst.de, damien.lemoal@wdc.com,
	chaitanya.kulkarni@wdc.com, dmitry.fomichev@wdc.com,
	ajay.joshi@wdc.com, aravind.ramesh@wdc.com, martin.petersen@oracle.com, 
	James.Bottomley@HansenPartnership.com, agk@redhat.com, snitzer@redhat.com
Date: Fri, 21 Jun 2019 15:07:11 +0200
Message-Id: <20190621130711.21986-5-mb@lightnvm.io>
In-Reply-To: <20190621130711.21986-1-mb@lightnvm.io>
References: <20190621130711.21986-1-mb@lightnvm.io>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 21 Jun 2019 13:07:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 21 Jun 2019 13:07:35 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: 0.19  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 24 Jun 2019 03:43:21 -0400
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: [dm-devel] [PATCH 4/4] dm: add zone open, close and finish support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 24 Jun 2019 07:43:56 +0000 (UTC)

From: Ajay Joshi <ajay.joshi@wdc.com>

Implement REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH
support to allow explicit control of zone states.

Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
---
 drivers/md/dm-flakey.c    | 7 +++----
 drivers/md/dm-linear.c    | 2 +-
 drivers/md/dm.c           | 5 +++--
 include/linux/blk_types.h | 8 ++++++++
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-flakey.c b/drivers/md/dm-flakey.c
index a9bc518156f2..fff529c0732c 100644
--- a/drivers/md/dm-flakey.c
+++ b/drivers/md/dm-flakey.c
@@ -280,7 +280,7 @@ static void flakey_map_bio(struct dm_target *ti, struct bio *bio)
 	struct flakey_c *fc = ti->private;
 
 	bio_set_dev(bio, fc->dev->bdev);
-	if (bio_sectors(bio) || bio_op(bio) == REQ_OP_ZONE_RESET)
+	if (bio_sectors(bio) || bio_is_zone_mgmt_op(bio))
 		bio->bi_iter.bi_sector =
 			flakey_map_sector(ti, bio->bi_iter.bi_sector);
 }
@@ -322,8 +322,7 @@ static int flakey_map(struct dm_target *ti, struct bio *bio)
 	struct per_bio_data *pb = dm_per_bio_data(bio, sizeof(struct per_bio_data));
 	pb->bio_submitted = false;
 
-	/* Do not fail reset zone */
-	if (bio_op(bio) == REQ_OP_ZONE_RESET)
+	if (bio_is_zone_mgmt_op(bio))
 		goto map_bio;
 
 	/* Are we alive ? */
@@ -384,7 +383,7 @@ static int flakey_end_io(struct dm_target *ti, struct bio *bio,
 	struct flakey_c *fc = ti->private;
 	struct per_bio_data *pb = dm_per_bio_data(bio, sizeof(struct per_bio_data));
 
-	if (bio_op(bio) == REQ_OP_ZONE_RESET)
+	if (bio_is_zone_mgmt_op(bio))
 		return DM_ENDIO_DONE;
 
 	if (!*error && pb->bio_submitted && (bio_data_dir(bio) == READ)) {
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index ad980a38fb1e..217a1dee8197 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -90,7 +90,7 @@ static void linear_map_bio(struct dm_target *ti, struct bio *bio)
 	struct linear_c *lc = ti->private;
 
 	bio_set_dev(bio, lc->dev->bdev);
-	if (bio_sectors(bio) || bio_op(bio) == REQ_OP_ZONE_RESET)
+	if (bio_sectors(bio) || bio_is_zone_mgmt_op(bio))
 		bio->bi_iter.bi_sector =
 			linear_map_sector(ti, bio->bi_iter.bi_sector);
 }
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 5475081dcbd6..f4507ec20a57 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1176,7 +1176,8 @@ static size_t dm_dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff,
 
 /*
  * A target may call dm_accept_partial_bio only from the map routine.  It is
- * allowed for all bio types except REQ_PREFLUSH and REQ_OP_ZONE_RESET.
+ * allowed for all bio types except REQ_PREFLUSH, REQ_OP_ZONE_RESET,
+ * REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH.
  *
  * dm_accept_partial_bio informs the dm that the target only wants to process
  * additional n_sectors sectors of the bio and the rest of the data should be
@@ -1629,7 +1630,7 @@ static blk_qc_t __split_and_process_bio(struct mapped_device *md,
 		ci.sector_count = 0;
 		error = __send_empty_flush(&ci);
 		/* dec_pending submits any data associated with flush */
-	} else if (bio_op(bio) == REQ_OP_ZONE_RESET) {
+	} else if (bio_is_zone_mgmt_op(bio)) {
 		ci.bio = bio;
 		ci.sector_count = 0;
 		error = __split_and_process_non_flush(&ci);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 067ef9242275..fd2458cd1a49 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -398,6 +398,14 @@ static inline bool op_is_zone_mgmt_op(enum req_opf op)
 	}
 }
 
+/*
+ * Check if the bio is zoned operation.
+ */
+static inline bool bio_is_zone_mgmt_op(struct bio *bio)
+{
+	return op_is_zone_mgmt_op(bio_op(bio));
+}
+
 static inline bool op_is_write(unsigned int op)
 {
 	return (op & 1);
-- 
2.19.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
