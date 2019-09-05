Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 676D1A9EED
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 11:53:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 742C07FDCC;
	Thu,  5 Sep 2019 09:53:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 473A35D9E2;
	Thu,  5 Sep 2019 09:53:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE67C2551B;
	Thu,  5 Sep 2019 09:53:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x859rhPa026845 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 05:53:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3050C167A3; Thu,  5 Sep 2019 09:53:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35ACC19C77;
	Thu,  5 Sep 2019 09:53:35 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7DD318C893C;
	Thu,  5 Sep 2019 09:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567677203; x=1599213203;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=lXmNGw+0DXKWd3/CW5QfLTARK01VfROVWdtvZQJsTFQ=;
	b=c4l2tmJqDPpXn/Zlia+BG8n2WrTFKYnMIchDZXq8SdNs2w2JCHSfc1KE
	NrXo8LWpxRLBaO35Fc4GFeZVKD4PNwjJALKNIlhJxdqO6aDBFkj3EqPpe
	BDWO+SPjwzmR3lkx4hAQnk6KjpjfXVzK4F2bNSnKBybI9hAnZJIN7zGqH
	WVvWk91ble/uExQxQfs4rHC+ueqbY3Cj7v1pqnJrN23PPxoot/xatKYk4
	gCcAujt1oETPBmUVa29zQzohNDmlKQna3jd+TQUVbKBcwDmHW3mAXorMS
	ZUhIH1LkTX7AcJKQmaShShRPbNr9EAxdzIZRrHKfQaNNgFpL4RiCe1BMm Q==;
IronPort-SDR: 4ea3oLLK6GrhEg1jdSrQFzD8U1dBaBsXRhOS5Fm6G7YR1krTPQJgHi7w+j2Ujx8n5K+2/4MkKU
	J5Fbd9TFQogvPjMFSIYQOd//tAyysKnMShpB2h6Fu7u5Dby7KnKdZSejK4m5UFmrqBP8ekRBxz
	OCOGDK/M5DMRtyTfxpM1O4PMQQon7UXgV2OAvKJCUxqonsiOOLeF0gKigQAdaL8SrARv/y4jso
	jZN3ZflU0Ug8/ZsKaOwyDXdTRao48vYPd6kggkpMXkGUzlUQNDMfwGm0LJDYAYr0jgvpoulmD0
	70o=
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="119106259"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 05 Sep 2019 17:51:41 +0800
IronPort-SDR: 9D5sovGr8PzpOrI90f2VHM1a4mxOkpbFm/LZWBRFyUf3IGlEEfh1GTpRbd8R06L4f98G8SIDwp
	pcuBObWErin4TvF2a5c8SHQlWuKdRAlSYF/XtQik3zNva9iqFCjExrk9CybquMlFp9l6F6O6rS
	9cm5DWe+UX9BiCfV0BWpKudyBdlrVnTDDeMWbhxoehzsywqjz40qQZNW9c38lSArxRbJCI4RyA
	SWes0RB3mkZDGeCwkuNFm3nmPLtpQ6DSTEhqlBfJTtfoD88NXJP3JAgpYbY+J7193sLDirVt8m
	72fmfG6ZBOPgNX1mrLYkWXsH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 02:48:38 -0700
IronPort-SDR: BXnLMIJWTPTDJVKVkqGiX3Pm3W77w+cFRGiV5qS407CiAIIkRQA1tMvRvO1XpK11Bt3xNmaAIA
	c8RT+WpHE6bP2OzfH1zYR7gKFWmwpYX1UWQtjTfgOSQKqpsUgZohHZUAYBWkjwP3f6+ZYmIGQi
	mwKAPH7HeQTeLYAns0GXWA75IKPKVtZvW6ivsaM0qG3BVWJIU182LGfhScGC2AKh3++p2rlwb8
	VQtmZ2n/DsgxyasQlIO3OYeiWKC+jTQd6pSIDwf4MDsVFB+3FzS8LAds+5cROStM0xhO+2OjDR
	apI=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Sep 2019 02:51:41 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu,  5 Sep 2019 18:51:31 +0900
Message-Id: <20190905095135.26026-4-damien.lemoal@wdc.com>
In-Reply-To: <20190905095135.26026-1-damien.lemoal@wdc.com>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.70]); Thu, 05 Sep 2019 09:53:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Thu, 05 Sep 2019 09:53:23 +0000 (UTC) for IP:'216.71.154.45'
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
Subject: [dm-devel] [PATCH v5 3/7] block: Introduce elevator features
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 05 Sep 2019 09:53:48 +0000 (UTC)

Introduce the definition of elevator features through the
elevator_features flags in the elevator_type structure. Each flag can
represent a feature supported by an elevator. The first feature defined
by this patch is support for zoned block device sequential write
constraint with the flag ELEVATOR_F_ZBD_SEQ_WRITE, which is implemented
by the mq-deadline elevator using zone write locking.

Other possible features are IO priorities, write hints, latency targets
or single-LUN dual-actuator disks (for which the elevator could maintain
one LBA ordered list per actuator).

The required_elevator_features field is also added to the request_queue
structure to allow a device driver to specify elevator feature flags
that an elevator must support for the correct operation of the device
(e.g. device drivers for zoned block devices can have the
ELEVATOR_F_ZBD_SEQ_WRITE flag as a required feature).
The helper function blk_queue_required_elevator_features() is
defined for setting this new field.

With these two new fields in place, the elevator functions
elevator_match() and elevator_find() are modified to allow a user to set
only an elevator with a set of features that satisfies the device
required features. Elevators not matching the device requirements are
not shown in the device sysfs queue/scheduler file to prevent their use.

The "none" elevator can always be selected as before.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c     | 16 +++++++++++++
 block/elevator.c         | 49 +++++++++++++++++++++++++++++++---------
 block/mq-deadline.c      |  1 +
 include/linux/blkdev.h   |  4 ++++
 include/linux/elevator.h |  8 +++++++
 5 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index a058997b9cce..6bd1e3b082d8 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -832,6 +832,22 @@ void blk_queue_write_cache(struct request_queue *q, bool wc, bool fua)
 }
 EXPORT_SYMBOL_GPL(blk_queue_write_cache);
 
+/**
+ * blk_queue_required_elevator_features - Set a queue required elevator features
+ * @q:		the request queue for the target device
+ * @features:	Required elevator features OR'ed together
+ *
+ * Tell the block layer that for the device controlled through @q, only the
+ * only elevators that can be used are those that implement at least the set of
+ * features specified by @features.
+ */
+void blk_queue_required_elevator_features(struct request_queue *q,
+					  unsigned int features)
+{
+	q->required_elevator_features = features;
+}
+EXPORT_SYMBOL_GPL(blk_queue_required_elevator_features);
+
 static int __init blk_settings_init(void)
 {
 	blk_max_low_pfn = max_low_pfn - 1;
diff --git a/block/elevator.c b/block/elevator.c
index 2944c129760c..ac7c8ad580ba 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -83,8 +83,26 @@ bool elv_bio_merge_ok(struct request *rq, struct bio *bio)
 }
 EXPORT_SYMBOL(elv_bio_merge_ok);
 
-static bool elevator_match(const struct elevator_type *e, const char *name)
+static inline bool elv_support_features(unsigned int elv_features,
+					unsigned int required_features)
 {
+	return (required_features & elv_features) == required_features;
+}
+
+/**
+ * elevator_match - Test an elevator name and features
+ * @e: Scheduler to test
+ * @name: Elevator name to test
+ * @required_features: Features that the elevator must provide
+ *
+ * Return true is the elevator @e name matches @name and if @e provides all the
+ * the feratures spcified by @required_features.
+ */
+static bool elevator_match(const struct elevator_type *e, const char *name,
+			   unsigned int required_features)
+{
+	if (!elv_support_features(e->elevator_features, required_features))
+		return false;
 	if (!strcmp(e->elevator_name, name))
 		return true;
 	if (e->elevator_alias && !strcmp(e->elevator_alias, name))
@@ -93,15 +111,21 @@ static bool elevator_match(const struct elevator_type *e, const char *name)
 	return false;
 }
 
-/*
- * Return scheduler with name 'name'
+/**
+ * elevator_find - Find an elevator
+ * @name: Name of the elevator to find
+ * @required_features: Features that the elevator must provide
+ *
+ * Return the first registered scheduler with name @name and supporting the
+ * features @required_features and NULL otherwise.
  */
-static struct elevator_type *elevator_find(const char *name)
+static struct elevator_type *elevator_find(const char *name,
+					   unsigned int required_features)
 {
 	struct elevator_type *e;
 
 	list_for_each_entry(e, &elv_list, list) {
-		if (elevator_match(e, name))
+		if (elevator_match(e, name, required_features))
 			return e;
 	}
 
@@ -120,12 +144,12 @@ static struct elevator_type *elevator_get(struct request_queue *q,
 
 	spin_lock(&elv_list_lock);
 
-	e = elevator_find(name);
+	e = elevator_find(name, q->required_elevator_features);
 	if (!e && try_loading) {
 		spin_unlock(&elv_list_lock);
 		request_module("%s-iosched", name);
 		spin_lock(&elv_list_lock);
-		e = elevator_find(name);
+		e = elevator_find(name, q->required_elevator_features);
 	}
 
 	if (e && !try_module_get(e->elevator_owner))
@@ -525,7 +549,7 @@ int elv_register(struct elevator_type *e)
 
 	/* register, don't allow duplicate names */
 	spin_lock(&elv_list_lock);
-	if (elevator_find(e->elevator_name)) {
+	if (elevator_find(e->elevator_name, 0)) {
 		spin_unlock(&elv_list_lock);
 		kmem_cache_destroy(e->icq_cache);
 		return -EBUSY;
@@ -709,7 +733,8 @@ static int __elevator_change(struct request_queue *q, const char *name)
 	if (!e)
 		return -EINVAL;
 
-	if (q->elevator && elevator_match(q->elevator->type, elevator_name)) {
+	if (q->elevator &&
+	    elevator_match(q->elevator->type, elevator_name, 0)) {
 		elevator_put(e);
 		return 0;
 	}
@@ -749,11 +774,13 @@ ssize_t elv_iosched_show(struct request_queue *q, char *name)
 
 	spin_lock(&elv_list_lock);
 	list_for_each_entry(__e, &elv_list, list) {
-		if (elv && elevator_match(elv, __e->elevator_name)) {
+		if (elv && elevator_match(elv, __e->elevator_name, 0)) {
 			len += sprintf(name+len, "[%s] ", elv->elevator_name);
 			continue;
 		}
-		if (elv_support_iosched(q))
+		if (elv_support_iosched(q) &&
+		    elevator_match(__e, __e->elevator_name,
+				   q->required_elevator_features))
 			len += sprintf(name+len, "%s ", __e->elevator_name);
 	}
 	spin_unlock(&elv_list_lock);
diff --git a/block/mq-deadline.c b/block/mq-deadline.c
index 35e84bc0ec8c..b490f47fd553 100644
--- a/block/mq-deadline.c
+++ b/block/mq-deadline.c
@@ -794,6 +794,7 @@ static struct elevator_type mq_deadline = {
 	.elevator_attrs = deadline_attrs,
 	.elevator_name = "mq-deadline",
 	.elevator_alias = "deadline",
+	.elevator_features = ELEVATOR_F_ZBD_SEQ_WRITE,
 	.elevator_owner = THIS_MODULE,
 };
 MODULE_ALIAS("mq-deadline-iosched");
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d0ad21e4771b..b196124e3240 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -496,6 +496,8 @@ struct request_queue {
 
 	struct queue_limits	limits;
 
+	unsigned int		required_elevator_features;
+
 #ifdef CONFIG_BLK_DEV_ZONED
 	/*
 	 * Zoned block device information for request dispatch control.
@@ -1097,6 +1099,8 @@ extern void blk_queue_dma_alignment(struct request_queue *, int);
 extern void blk_queue_update_dma_alignment(struct request_queue *, int);
 extern void blk_queue_rq_timeout(struct request_queue *, unsigned int);
 extern void blk_queue_write_cache(struct request_queue *q, bool enabled, bool fua);
+extern void blk_queue_required_elevator_features(struct request_queue *q,
+						 unsigned int features);
 
 /*
  * Number of physical segments as sent to the device.
diff --git a/include/linux/elevator.h b/include/linux/elevator.h
index 1dd014c9c87b..901bda352dcb 100644
--- a/include/linux/elevator.h
+++ b/include/linux/elevator.h
@@ -76,6 +76,7 @@ struct elevator_type
 	struct elv_fs_entry *elevator_attrs;
 	const char *elevator_name;
 	const char *elevator_alias;
+	const unsigned int elevator_features;
 	struct module *elevator_owner;
 #ifdef CONFIG_BLK_DEBUG_FS
 	const struct blk_mq_debugfs_attr *queue_debugfs_attrs;
@@ -165,5 +166,12 @@ extern struct request *elv_rb_find(struct rb_root *, sector_t);
 #define rq_entry_fifo(ptr)	list_entry((ptr), struct request, queuelist)
 #define rq_fifo_clear(rq)	list_del_init(&(rq)->queuelist)
 
+/*
+ * Elevator features.
+ */
+
+/* Supports zoned block devices sequential write constraint */
+#define ELEVATOR_F_ZBD_SEQ_WRITE	(1U << 0)
+
 #endif /* CONFIG_BLOCK */
 #endif
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
