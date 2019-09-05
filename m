Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A2A9EEC
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 11:53:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0539E3007C23;
	Thu,  5 Sep 2019 09:53:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C66E41001947;
	Thu,  5 Sep 2019 09:53:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 335B9180B536;
	Thu,  5 Sep 2019 09:53:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x859rh4J026844 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 05:53:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2EC39194B9; Thu,  5 Sep 2019 09:53:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3568E19C6A;
	Thu,  5 Sep 2019 09:53:37 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0735190C007;
	Thu,  5 Sep 2019 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567677208; x=1599213208;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=PErFhJdbRHZCrM47arWeyOIBOCDRRRHkAOiFwGGBAlU=;
	b=qzj/vbIvV+PyLV/qcpxDxxFdjnFf7yCQhsPbUQt22Ku99NJih+6ox8H9
	Ew8E1RFhdkuQ9qOpqDcgtTbQ1C55GlNYO4UyRkm4ZcceOD1mhZIATSA11
	pp4aLDX4Fz7LYdGwhTdf90Ii4KYVGdzJDUiMyg6O3mFCdyvIEuuD5Rhdl
	q0/udN1+aJ719Yn0aTPI/EcE08V0tHlrfqL36iM52lfRKuMhrU1IA4eCE
	99MP3tdBH7V/EaVzgvpmNZFNO6xMvsvMpytuJJ+vw7/r+04GWJvcF8/cV
	2MJmVOXjGgVneB8n0676jl/Jhr6NIedAgM+vzTBjNrWFta6VIupJwNy4i g==;
IronPort-SDR: bylpV20pNRiCj8U3i5vfpawKIQfwa5Qfx9RtQ/rJR4Uqby/MqfKTQmHtDHMBzoGyfUlcQPWYMK
	6BBR72cR4Q+6VJfR/QIxKbIbkGEqKYb53+MXgCYyUmhLgURO/pET9h3CmQDLPdMbD93nRbOwQM
	328i8ZPLiJb5rg1NfYEeT6xSTmDhhzmnlN8fUd+h7wV/WFzbDAagx7EcnV21ZgIjqCyhRwBKHH
	E7qT72z71mX7a7Pi5MdewPd9U2D+78YSBpOwhuBuast2OGE+gAtzD90xpWob09AFz1VZJkTFk9
	d7U=
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="119106273"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 05 Sep 2019 17:51:44 +0800
IronPort-SDR: 2Ws7hNqt9XUGmlP15fi1SjrC73CWYGLJNzBnI9vT39lzoCWYju4kvslSy/fQ7s7zawxcofmhwU
	0bfzZcqur3Gbd4a9vPdiqGlh8SAfbsQ1BM/g+cmMlvbJtbmTfCDm6HlldtYQdyB+CwudOrc8uh
	jd5m2klNRc06vA50HSMaQJFMKnjBWyx2/B/2XAIMfKrkJlo1ON/QvGX5pFRGpLvKXQ9JPi8DKK
	gienWmyCyNl/ZXqI6BlxDJNLsill4rCKclGT9Is6zezn9GvUfF3LLzj/+q5e9MdNd+yZM7txkY
	Hg9A0THLQ1mwNOwRwsmANIJ+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 02:48:40 -0700
IronPort-SDR: W0iMItwJl+ZikypMnIqWii/vG5T4FLldmcZVG8h+aJmUfwZSH5seHXYPjySsjO8bbPIwhTCv8A
	jBPS2uYscziQRnY/8tUEr6LFBJOimsCeqXo38Vi6EvPWy1zMmMxPmU3ex8kS2IdK1tmGl3hEiF
	SF4vhznaXt90rqZhneKKcGV6S1lvHDY++qEYrDwgpKiyQLIu7fR5bF7E66myaA9iTYa+BkZo65
	Ve6wCjshlslQTpYuPDPGS70VniGp/DSlrfep05asPiF5JsY0hM2N96rkf4yRRRRzRqIgvHhcz5
	zKA=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Sep 2019 02:51:43 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu,  5 Sep 2019 18:51:33 +0900
Message-Id: <20190905095135.26026-6-damien.lemoal@wdc.com>
In-Reply-To: <20190905095135.26026-1-damien.lemoal@wdc.com>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.70]); Thu, 05 Sep 2019 09:53:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Thu, 05 Sep 2019 09:53:28 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=1441e10e1=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v5 5/7] block: Delay default elevator
	initialization
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 05 Sep 2019 09:53:47 +0000 (UTC)

When elevator_init_mq() is called from blk_mq_init_allocated_queue(),
the only information known about the device is the number of hardware
queues as the block device scan by the device driver is not completed
yet for most drivers. The device type and elevator required features
are not set yet, preventing to correctly select the default elevator
most suitable for the device.

This currently affects all multi-queue zoned block devices which default
to the "none" elevator instead of the required "mq-deadline" elevator.
These drives currently include host-managed SMR disks connected to a
smartpqi HBA and null_blk block devices with zoned mode enabled.
Upcoming NVMe Zoned Namespace devices will also be affected.

Fix this by adding the boolean elevator_init argument to
blk_mq_init_allocated_queue() to control the execution of
elevator_init_mq(). Two cases exist:
1) elevator_init = false is used for calls to
   blk_mq_init_allocated_queue() within blk_mq_init_queue(). In this
   case, a call to elevator_init_mq() is added to __device_add_disk(),
   resulting in the delayed initialization of the queue elevator
   after the device driver finished probing the device information. This
   effectively allows elevator_init_mq() access to more information
   about the device.
2) elevator_init = true preserves the current behavior of initializing
   the elevator directly from blk_mq_init_allocated_queue(). This case
   is used for the special request based DM devices where the device
   gendisk is created before the queue initialization and device
   information (e.g. queue limits) is already known when the queue
   initialization is executed.

Additionally, to make sure that the elevator initialization is never
done while requests are in-flight (there should be none when the device
driver calls device_add_disk()), freeze and quiesce the device request
queue before calling blk_mq_init_sched() in elevator_init_mq().

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-mq.c         | 12 +++++++++---
 block/elevator.c       |  7 +++++++
 block/genhd.c          |  9 +++++++++
 drivers/md/dm-rq.c     |  2 +-
 include/linux/blk-mq.h |  3 ++-
 5 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index ee4caf0c0807..240416057f28 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2689,7 +2689,11 @@ struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *set)
 	if (!uninit_q)
 		return ERR_PTR(-ENOMEM);
 
-	q = blk_mq_init_allocated_queue(set, uninit_q);
+	/*
+	 * Initialize the queue without an elevator. device_add_disk() will do
+	 * the initialization.
+	 */
+	q = blk_mq_init_allocated_queue(set, uninit_q, false);
 	if (IS_ERR(q))
 		blk_cleanup_queue(uninit_q);
 
@@ -2840,7 +2844,8 @@ static unsigned int nr_hw_queues(struct blk_mq_tag_set *set)
 }
 
 struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
-						  struct request_queue *q)
+						  struct request_queue *q,
+						  bool elevator_init)
 {
 	/* mark the queue as mq asap */
 	q->mq_ops = set->ops;
@@ -2902,7 +2907,8 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	blk_mq_add_queue_tag_set(set, q);
 	blk_mq_map_swqueue(q);
 
-	elevator_init_mq(q);
+	if (elevator_init)
+		elevator_init_mq(q);
 
 	return q;
 
diff --git a/block/elevator.c b/block/elevator.c
index 520d6b224b74..096a670d22d7 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -712,7 +712,14 @@ void elevator_init_mq(struct request_queue *q)
 	if (!e)
 		return;
 
+	blk_mq_freeze_queue(q);
+	blk_mq_quiesce_queue(q);
+
 	err = blk_mq_init_sched(q, e);
+
+	blk_mq_unquiesce_queue(q);
+	blk_mq_unfreeze_queue(q);
+
 	if (err) {
 		pr_warn("\"%s\" elevator initialization failed, "
 			"falling back to \"none\"\n", e->elevator_name);
diff --git a/block/genhd.c b/block/genhd.c
index 54f1f0d381f4..26b31fcae217 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -695,6 +695,15 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 	dev_t devt;
 	int retval;
 
+	/*
+	 * The disk queue should now be all set with enough information about
+	 * the device for the elevator code to pick an adequate default
+	 * elevator if one is needed, that is, for devices requesting queue
+	 * registration.
+	 */
+	if (register_queue)
+		elevator_init_mq(disk->queue);
+
 	/* minors == 0 indicates to use ext devt from part0 and should
 	 * be accompanied with EXT_DEVT flag.  Make sure all
 	 * parameters make sense.
diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 21d5c1784d0c..3f8577e2c13b 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -563,7 +563,7 @@ int dm_mq_init_request_queue(struct mapped_device *md, struct dm_table *t)
 	if (err)
 		goto out_kfree_tag_set;
 
-	q = blk_mq_init_allocated_queue(md->tag_set, md->queue);
+	q = blk_mq_init_allocated_queue(md->tag_set, md->queue, true);
 	if (IS_ERR(q)) {
 		err = PTR_ERR(q);
 		goto out_tag_set;
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 62a3bb715899..0bf056de5cc3 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -248,7 +248,8 @@ enum {
 
 struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *);
 struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
-						  struct request_queue *q);
+						  struct request_queue *q,
+						  bool elevator_init);
 struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
 						const struct blk_mq_ops *ops,
 						unsigned int queue_depth,
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
