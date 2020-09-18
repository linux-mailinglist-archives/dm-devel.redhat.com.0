Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 91F4E26EC33
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 04:11:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-E8xfYXZHM_GO7dCF0P6BDA-1; Thu, 17 Sep 2020 22:11:10 -0400
X-MC-Unique: E8xfYXZHM_GO7dCF0P6BDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B37261074661;
	Fri, 18 Sep 2020 02:11:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4C0119930;
	Fri, 18 Sep 2020 02:10:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB35844A79;
	Fri, 18 Sep 2020 02:10:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08I2AcXf016666 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 22:10:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D7032068534; Fri, 18 Sep 2020 02:10:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 391022166B27
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 02:10:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FC8E8116B2
	for <dm-devel@redhat.com>; Fri, 18 Sep 2020 02:10:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-560-uS9ur_MHOOOkjNkLFIpeSQ-1;
	Thu, 17 Sep 2020 22:10:33 -0400
X-MC-Unique: uS9ur_MHOOOkjNkLFIpeSQ-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A390B2311C;
	Fri, 18 Sep 2020 02:01:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Thu, 17 Sep 2020 21:56:06 -0400
Message-Id: <20200918020110.2063155-26-sashal@kernel.org>
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08I2AcXf016666
X-loop: dm-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH AUTOSEL 5.4 026/330] dm table: do not allow
	request-based DM to stack on partitions
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Mike Snitzer <snitzer@redhat.com>

[ Upstream commit 6ba01df72b4b63a26b4977790f58d8f775d2992c ]

Partitioned request-based devices cannot be used as underlying devices
for request-based DM because no partition offsets are added to each
incoming request.  As such, until now, stacking on partitioned devices
would _always_ result in data corruption (e.g. wiping the partition
table, writing to other partitions, etc).  Fix this by disallowing
request-based stacking on partitions.

While at it, since all .request_fn support has been removed from block
core, remove legacy dm-table code that differentiated between blk-mq and
.request_fn request-based.

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-table.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 52e049554f5cd..2ae0c19137667 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -918,21 +918,15 @@ bool dm_table_supports_dax(struct dm_table *t,
 
 static bool dm_table_does_not_support_partial_completion(struct dm_table *t);
 
-struct verify_rq_based_data {
-	unsigned sq_count;
-	unsigned mq_count;
-};
-
-static int device_is_rq_based(struct dm_target *ti, struct dm_dev *dev,
-			      sector_t start, sector_t len, void *data)
+static int device_is_rq_stackable(struct dm_target *ti, struct dm_dev *dev,
+				  sector_t start, sector_t len, void *data)
 {
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-	struct verify_rq_based_data *v = data;
+	struct block_device *bdev = dev->bdev;
+	struct request_queue *q = bdev_get_queue(bdev);
 
-	if (queue_is_mq(q))
-		v->mq_count++;
-	else
-		v->sq_count++;
+	/* request-based cannot stack on partitions! */
+	if (bdev != bdev->bd_contains)
+		return false;
 
 	return queue_is_mq(q);
 }
@@ -941,7 +935,6 @@ static int dm_table_determine_type(struct dm_table *t)
 {
 	unsigned i;
 	unsigned bio_based = 0, request_based = 0, hybrid = 0;
-	struct verify_rq_based_data v = {.sq_count = 0, .mq_count = 0};
 	struct dm_target *tgt;
 	struct list_head *devices = dm_table_get_devices(t);
 	enum dm_queue_mode live_md_type = dm_get_md_type(t->md);
@@ -1045,14 +1038,10 @@ verify_rq_based:
 
 	/* Non-request-stackable devices can't be used for request-based dm */
 	if (!tgt->type->iterate_devices ||
-	    !tgt->type->iterate_devices(tgt, device_is_rq_based, &v)) {
+	    !tgt->type->iterate_devices(tgt, device_is_rq_stackable, NULL)) {
 		DMERR("table load rejected: including non-request-stackable devices");
 		return -EINVAL;
 	}
-	if (v.sq_count > 0) {
-		DMERR("table load rejected: not all devices are blk-mq request-stackable");
-		return -EINVAL;
-	}
 
 	return 0;
 }
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

