Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 607F7A9EEA
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 11:53:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D0E6308FED5;
	Thu,  5 Sep 2019 09:53:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 043E01F8;
	Thu,  5 Sep 2019 09:53:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B5412551D;
	Thu,  5 Sep 2019 09:53:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x859rcrk026830 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 05:53:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D9955DA21; Thu,  5 Sep 2019 09:53:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7BC05D9E1;
	Thu,  5 Sep 2019 09:53:31 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D18CC1DB0;
	Thu,  5 Sep 2019 09:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567677204; x=1599213204;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=q/G6ummKELIlmalkh9GPUWsUwphqsgUz0VruqeowzEs=;
	b=qPxz3VeFs1V3L0o35AdXQl9sV8stcCDKbxOs2tZEx4IkDRS57vHT1eMQ
	WuOT7ESsd1oxk4bPOafU3BAcXBYUzEe8Q1a9bYV/el3rOt0GZdmAIfdlg
	TaJ6ZFOYm8uYnpyrv/fEOezsIztGwV7Y4qnt7qrqtH2BO+XxX4O0M+4y4
	ykksPShlnBOyc/N+qpKBHwSQx+q+VUNGMVsSni38fp0ysyrJqwcxkvs0d
	4VmmRcFsg0bIyKxizFwJb3VzoZBZfTbTm84+mh5SM2C8KmhsFDhGuwFM/
	bFfb9peIBwETbjpaGNJ5XIE6n1JphWAOiLrNMzDEmqIBpQfzpgSXE0BaJ g==;
IronPort-SDR: jvu5ZKeTORkiXfUvLVhpsBgrCl9P0awmZ0S4BdGeW7QMtSdkdmnUh60UnVoM9CmAf3zkscM/pj
	KSyYCufpHk1VNHH+X96ekSsxIEM2VdnEETlHD3r4EpYCzDuXB8Hg8UVq5H9jeACeRBXtmDR0qV
	wAJCy76MwSPMghCqd5ngJahLxxS0h3N6DFQxS9TRLSUKMJ1WheVNC6pF8fOWYFCALpyns57r7P
	8B3JDLe8FYLhuGodB/QbberRisBmSVUmvIyIEz7AYg4aeOVsUXCKg+ceq9o7jl/av0FwNJhUAe
	4UI=
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="119106267"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 05 Sep 2019 17:51:43 +0800
IronPort-SDR: tuL0NDoTuNXr3DQhhhXe6ZceHkI6OKBUTLc6APLUM90bKhOLEcI05RH5FxgeUe8bO4/BuYrCzs
	YFZEI3VmjWnmkgGpRG3r1rZZfIxjYIYi9KpxwOqHMtrA/lcxMnqjrrpHn+lqWbKSmqMNjyd/2z
	uttzzsDqQpLQP8qBJxEwHHnqn2uW6A5n34BPeTfuXFwADUXXREseu8raUczNqK2CAP0O/xWkFZ
	pzQD8EiiR55/b7p7bYHG7mCRCNTJMmuP7VbiGXFsmn8mKyrEb5H0V7YbcfoTsV8C/gRV+aPd4k
	c9BQxOZBLFBX0SMx0+9I+PvO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 02:48:39 -0700
IronPort-SDR: K1Ex14M6z8Ubl9VJIjS/Kv0LAFi/XUeURed2Nlsc0HXRxx6xbqs0ezsNxLfm51qmj288kf7U/T
	e1fpJUE3BpYNEHrHiM0ykEUIRJ8W4FlcPT0pgMszxKLoxNDnNa5MKO/X+RULqk0NmBwp1dMqSE
	EfMKRX5u8UsG6ZzyAxs5xSsNYRyUlmtMMtsVdK3vkAb2707oRzJT4snUEglwHgpX/n+uG3rAhY
	2rnhvhhrILPr+qPNpN5U2VwjTVXv6jPR9cMzmR0HChFqJR28vwz+btMmGlftTmkbtU3+6L+90U
	OVs=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Sep 2019 02:51:42 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu,  5 Sep 2019 18:51:32 +0900
Message-Id: <20190905095135.26026-5-damien.lemoal@wdc.com>
In-Reply-To: <20190905095135.26026-1-damien.lemoal@wdc.com>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Thu, 05 Sep 2019 09:53:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 05 Sep 2019 09:53:24 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=1441e10e1=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v5 4/7] block: Improve default elevator selection
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 05 Sep 2019 09:53:43 +0000 (UTC)

For block devices that do not specify required features, preserve the
current default elevator selection (mq-deadline for single queue
devices, none for multi-queue devices). However, for devices specifying
required features (e.g. zoned block devices ELEVATOR_F_ZBD_SEQ_WRITE
feature), select the first available elevator providing the required
features.

In all cases, default to "none" if no elevator is available or if the
initialization of the default elevator fails.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 block/elevator.c | 51 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/block/elevator.c b/block/elevator.c
index ac7c8ad580ba..520d6b224b74 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -651,9 +651,46 @@ static inline bool elv_support_iosched(struct request_queue *q)
 }
 
 /*
- * For blk-mq devices supporting IO scheduling, we default to using mq-deadline,
- * if available, for single queue devices. If deadline isn't available OR
- * deadline initialization fails OR we have multiple queues, default to "none".
+ * For single queue devices, default to using mq-deadline. If we have multiple
+ * queues or mq-deadline is not available, default to "none".
+ */
+static struct elevator_type *elevator_get_default(struct request_queue *q)
+{
+	if (q->nr_hw_queues != 1)
+		return NULL;
+
+	return elevator_get(q, "mq-deadline", false);
+}
+
+/*
+ * Get the first elevator providing the features required by the request queue.
+ * Default to "none" if no matching elevator is found.
+ */
+static struct elevator_type *elevator_get_by_features(struct request_queue *q)
+{
+	struct elevator_type *e;
+
+	spin_lock(&elv_list_lock);
+
+	list_for_each_entry(e, &elv_list, list) {
+		if (elv_support_features(e->elevator_features,
+					 q->required_elevator_features))
+			break;
+	}
+
+	if (e && !try_module_get(e->elevator_owner))
+		e = NULL;
+
+	spin_unlock(&elv_list_lock);
+
+	return e;
+}
+
+/*
+ * For a device queue that has no required features, use the default elevator
+ * settings. Otherwise, use the first elevator available matching the required
+ * features. If no suitable elevator is find or if the chosen elevator
+ * initialization fails, fall back to the "none" elevator (no elevator).
  */
 void elevator_init_mq(struct request_queue *q)
 {
@@ -663,15 +700,15 @@ void elevator_init_mq(struct request_queue *q)
 	if (!elv_support_iosched(q))
 		return;
 
-	if (q->nr_hw_queues != 1)
-		return;
-
 	WARN_ON_ONCE(test_bit(QUEUE_FLAG_REGISTERED, &q->queue_flags));
 
 	if (unlikely(q->elevator))
 		return;
 
-	e = elevator_get(q, "mq-deadline", false);
+	if (!q->required_elevator_features)
+		e = elevator_get_default(q);
+	else
+		e = elevator_get_by_features(q);
 	if (!e)
 		return;
 
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
