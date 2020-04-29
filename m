Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ECAAD1BE188
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 16:47:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588171665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uElYbCtEguR7fobm6BQOjDKBUELmIgWLARoc3fNMcXs=;
	b=Uofuo2/yRGCC2Zu1EiG98+rJHXm9A3Q3Ns26vB/yWj/19Jhnro7akbzjGmopYYyT+d+1Hd
	LKw+aqnOg5axjiQ21ST+asGR8NTsj1fKtp7d/DRtFbl1uqY7MW1d0ea+7VtKYduvIJWezJ
	c4SeUhv54TTBn3yEfOvDjMx+0nFyn1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-_68NY8iyPTmZZ5-znA4OrA-1; Wed, 29 Apr 2020 10:47:43 -0400
X-MC-Unique: _68NY8iyPTmZZ5-znA4OrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F3084B871;
	Wed, 29 Apr 2020 14:47:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1F6E60A9E;
	Wed, 29 Apr 2020 14:47:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2849180954D;
	Wed, 29 Apr 2020 14:47:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TElAkf012476 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 10:47:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B32301E4; Wed, 29 Apr 2020 14:47:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (unknown [10.40.193.136])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29AED50FE4;
	Wed, 29 Apr 2020 14:47:04 +0000 (UTC)
From: heinzm@redhat.com
To: dm-devel@redhat.com, snitzer@redhat.com
Date: Wed, 29 Apr 2020 16:47:03 +0200
Message-Id: <976f321e48432fbb7ae4e3776a9eef1f1906fb79.1588171508.git.heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm ebs: use new dm-bufo dm_bufio_issue_discard()
	API
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

Enhance new dm-ebs target as of v4 submitted on 3/9/2020
to actually pass discarding blocks down to the underlying
device now that the new dm-bufio API is available.

Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
---
 .../admin-guide/device-mapper/dm-ebs.rst      |  6 +++
 drivers/md/dm-ebs-target.c                    | 37 ++++++++++++++++---
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-ebs.rst b/Documentation/admin-guide/device-mapper/dm-ebs.rst
index 9e7abd3e0ae1..d42627e06924 100644
--- a/Documentation/admin-guide/device-mapper/dm-ebs.rst
+++ b/Documentation/admin-guide/device-mapper/dm-ebs.rst
@@ -49,3 +49,9 @@ offset 128 sectors, enforce 2KiB underlying device block size.
 This presumes 2KiB logical blocksize on /dev/sda or less to work:
 
 ebs /dev/sda 128 2 4
+
+Version History
+---------------
+
+V1.0.0 - initial version
+V1.0.1 - pass down discard requests
diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
index 1ba45946d4a6..97703c31771f 100644
--- a/drivers/md/dm-ebs-target.c
+++ b/drivers/md/dm-ebs-target.c
@@ -128,7 +128,33 @@ static int __ebs_rw_bio(struct ebs_c *ec, int rw, struct bio *bio)
 	return r;
 }
 
-/* 'Discard' blocks, i.e. release them from the bufio cache. */
+/*
+ * Discard bio's blocks, i.e. pass discards down.
+ *
+ * Avoid discarding partial blocks at beginning and end;
+ * return 0 in case no blocks can be discarded as a result.
+ */
+static int __ebs_discard_bio(struct ebs_c *ec, struct bio *bio)
+{
+	sector_t block, blocks, sector = bio->bi_iter.bi_sector;;
+
+	block = __sector_to_block(ec, sector);
+	blocks = __nr_blocks(ec, bio);
+
+	/* Partial first underlying block (__nr_blocks() may have resulted in one block). */
+	if (__block_mod(sector, ec->u_bs)) {
+		block++;
+		blocks--;
+	}
+
+	/* Partial last underlying block if any. */
+	if (blocks && __block_mod(bio_end_sector(bio), ec->u_bs))
+		blocks--;
+
+	return blocks ? dm_bufio_issue_discard(ec->bufio, block, blocks) : 0;
+}
+
+/* Release blocks them from the bufio cache. */
 static int __ebs_forget_bio(struct ebs_c *ec, struct bio *bio)
 {
 	sector_t blocks, sector = bio->bi_iter.bi_sector;;
@@ -179,9 +205,10 @@ static void __ebs_process_bios(struct work_struct *ws)
 		else if (bio_op(bio) == REQ_OP_WRITE) {
 			write = true;
 			r = __ebs_rw_bio(ec, WRITE, bio);
-		} else if (bio_op(bio) == REQ_OP_DISCARD)
-			/* FIXME: (optionally) call dm_bufio_discard_buffers() once upstream. */
-			r = __ebs_forget_bio(ec, bio);
+		} else if (bio_op(bio) == REQ_OP_DISCARD) {
+			__ebs_forget_bio(ec, bio);
+			r = __ebs_discard_bio(ec, bio);
+		}
 
 		bio->bi_status = r;
 	}
@@ -404,7 +431,7 @@ static int ebs_iterate_devices(struct dm_target *ti,
 
 static struct target_type ebs_target = {
 	.name		 = "ebs",
-	.version	 = {1, 0, 0},
+	.version	 = {1, 0, 1},
 	.features	 = DM_TARGET_PASSES_INTEGRITY,
 	.module		 = THIS_MODULE,
 	.ctr		 = ebs_ctr,
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

