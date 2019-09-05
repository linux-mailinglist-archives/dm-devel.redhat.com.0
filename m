Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BE1A9EE8
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 11:53:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1623B190C012;
	Thu,  5 Sep 2019 09:53:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B16805D717;
	Thu,  5 Sep 2019 09:53:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2AF3E1802218;
	Thu,  5 Sep 2019 09:53:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x859r6Go026791 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 05:53:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 193CE1F8; Thu,  5 Sep 2019 09:53:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23CC219C77;
	Thu,  5 Sep 2019 09:52:58 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E113190C022;
	Thu,  5 Sep 2019 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567677167; x=1599213167;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=qtVWwALxJeFLEm5MyqWAjj8rH1FAELNGevTMV0H6ZXk=;
	b=RiOEbnJ+1UljfRYuUZcqZmrXcZG1Nxtq/n4yb1Am4REWQv1tUwwkRK/E
	+zjl7Qq3h0qnsar0ossB4stcVJNvg/61I7HLprZEqi/fWjqhszAQcXf8K
	ZODOtrfTu5DpEl0jHBQn5J6o9Mnpe85mP9NTCYbnhe17gi54+jd3S0qJr
	Op5AsQmJJkDBuGHHMKc9l7TzkOEryHmIodXGgod40RtAJbMOCmYjcvLLT
	C2e3nFrn4XS4aOXHfnwXAV8lZKecE6+qahI0OImzbX63KpazXvkXSiY1F
	4hFjUow5PaXOotYSKY5Hjsi5qT49T4UfsCb6QkgZMswZUbp2XErx52gl+ Q==;
IronPort-SDR: WaDuECSa9gZMQ2El/iq8YEfVMvtWbDAAlI7sMM7TqqgWDdw0Xow00DVcxx4syfHk4SIP2E59ZP
	9+LRTEjOx+ig6L+h1oW7iQNVYBUdCimsD4jXgYEXs3ZGpM3PVAxe758XO6Ya2CyPNBc7JgpXK8
	5NF+T/JY3qQ5wrZWy05uLyi7YCKH5SCQOvXNJYw8qfeJhXapyLpLnmefIljcYHsWiuQgJVtwn0
	A5pSYJcydKwAz3A9uanRSA6BANkjDfhzUuoVlJqg+ob3/W/XsJKEbNwe+VM7aQfDYioAP9FQwp
	Cgg=
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="119106241"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 05 Sep 2019 17:51:39 +0800
IronPort-SDR: AnpXV6aOLX18J0n1bbd5Ky1+r2hAq9KC0/kB4npyrRWB5ARedOhXxfhKgIypMIHzfRd2S1ubBK
	x0TQk8wFY7T/hma73Zs/jyrpWcTqQlsZsxCd9hAdaOVQQpxO9J+8a4hyb6Cw7Zo41DKXLfZ0UI
	CdKJCyg/8dTgyNA7+XahBF4eJP7mwx0Iao7BUjHvMYsjIDROXgBoOGXYyPiRLTe55d7ZBUroWT
	5FQVuvqmxxUcpTnZNEJ0I/OvXrFXJIFM3AGSbBDmCTWnDkUdtpp4AG5eWwmNSmO3p9YRsPuyfx
	aCbycyL6G3zT/fIDshEWmo9j
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 02:48:35 -0700
IronPort-SDR: a1602K9Xn5CMGYi4tWl9GfmJctXCTvgg9oOLhQh2hZXPZidyOEm0kgYUMAP7D5yngTAM/SXCXo
	R8TNXefFDNmQMEFZMjt1vvGY6smMg5m2ZEac3gi/nEdfdlRvKIY3XHzSrUcrZyvZz0Hk0/TNTF
	usVvTu1I5y5EdpIQEHMvHPCjQYboeyqZiy0sXeIKs7KDA5lKLsD/8/d3wH5yE0wdxa/VXdHALY
	kDdW38JPIFKQnssywVfp67mCEjcL0+SGTETYQJ83aU4f/FEWPLZ/ze+rbE5ilanMkz3xWMvhKB
	AF0=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Sep 2019 02:51:38 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu,  5 Sep 2019 18:51:29 +0900
Message-Id: <20190905095135.26026-2-damien.lemoal@wdc.com>
In-Reply-To: <20190905095135.26026-1-damien.lemoal@wdc.com>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.70]); Thu, 05 Sep 2019 09:52:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Thu, 05 Sep 2019 09:52:46 +0000 (UTC) for IP:'216.71.154.45'
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
Subject: [dm-devel] [PATCH v5 1/7] block: Cleanup elevator_init_mq() use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Thu, 05 Sep 2019 09:53:10 +0000 (UTC)

Instead of checking a queue tag_set BLK_MQ_F_NO_SCHED flag before
calling elevator_init_mq() to make sure that the queue supports IO
scheduling, use the elevator.c function elv_support_iosched() in
elevator_init_mq(). This does not introduce any functional change but
ensure that elevator_init_mq() does the right thing based on the queue
settings.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c   |  8 +++-----
 block/elevator.c | 23 +++++++++++++----------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index b622029b19ea..13923630e00a 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2904,11 +2904,9 @@ struct request_queue *blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 	blk_mq_add_queue_tag_set(set, q);
 	blk_mq_map_swqueue(q);
 
-	if (!(set->flags & BLK_MQ_F_NO_SCHED)) {
-		ret = elevator_init_mq(q);
-		if (ret)
-			goto err_tag_set;
-	}
+	ret = elevator_init_mq(q);
+	if (ret)
+		goto err_tag_set;
 
 	return q;
 
diff --git a/block/elevator.c b/block/elevator.c
index 86100de88883..4721834815bb 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -619,16 +619,26 @@ int elevator_switch_mq(struct request_queue *q,
 	return ret;
 }
 
+static inline bool elv_support_iosched(struct request_queue *q)
+{
+	if (q->tag_set && (q->tag_set->flags & BLK_MQ_F_NO_SCHED))
+		return false;
+	return true;
+}
+
 /*
- * For blk-mq devices, we default to using mq-deadline, if available, for single
- * queue devices.  If deadline isn't available OR we have multiple queues,
- * default to "none".
+ * For blk-mq devices supporting IO scheduling, we default to using mq-deadline,
+ * if available, for single queue devices. If deadline isn't available OR we
+ * have multiple queues, default to "none".
  */
 int elevator_init_mq(struct request_queue *q)
 {
 	struct elevator_type *e;
 	int err = 0;
 
+	if (!elv_support_iosched(q))
+		return 0;
+
 	if (q->nr_hw_queues != 1)
 		return 0;
 
@@ -706,13 +716,6 @@ static int __elevator_change(struct request_queue *q, const char *name)
 	return elevator_switch(q, e);
 }
 
-static inline bool elv_support_iosched(struct request_queue *q)
-{
-	if (q->tag_set && (q->tag_set->flags & BLK_MQ_F_NO_SCHED))
-		return false;
-	return true;
-}
-
 ssize_t elv_iosched_store(struct request_queue *q, const char *name,
 			  size_t count)
 {
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
