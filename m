Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 914685340C6
	for <lists+dm-devel@lfdr.de>; Wed, 25 May 2022 17:53:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-TgxH-NWSOASWSiq6GtpobA-1; Wed, 25 May 2022 11:53:52 -0400
X-MC-Unique: TgxH-NWSOASWSiq6GtpobA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2BE93C0D197;
	Wed, 25 May 2022 15:53:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98BE7492C3B;
	Wed, 25 May 2022 15:53:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 421BF194EB83;
	Wed, 25 May 2022 15:53:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC7CC194EB82
 for <dm-devel@listman.corp.redhat.com>; Wed, 25 May 2022 15:50:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C184D401E63; Wed, 25 May 2022 15:50:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA06400F38
 for <dm-devel@redhat.com>; Wed, 25 May 2022 15:50:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0E2485A5BC
 for <dm-devel@redhat.com>; Wed, 25 May 2022 15:50:06 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-ltZZtdQQM5CMnZ5Vfi1mUw-1; Wed, 25 May 2022 11:50:04 -0400
X-MC-Unique: ltZZtdQQM5CMnZ5Vfi1mUw-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220525155003euoutp02d6158adc55e40cfa9be2b01072022c2f~yY9qR36Tr0326803268euoutp021
 for <dm-devel@redhat.com>; Wed, 25 May 2022 15:50:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220525155003euoutp02d6158adc55e40cfa9be2b01072022c2f~yY9qR36Tr0326803268euoutp021
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220525155001eucas1p1d45325ccf59057b8a8e4f7aff428fca3~yY9ouHCB01682916829eucas1p1n;
 Wed, 25 May 2022 15:50:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id FA.5B.10009.9205E826; Wed, 25
 May 2022 16:50:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220525155001eucas1p13e64a05367144fc6965f486bb07b55a2~yY9oBV-bz1682916829eucas1p1m;
 Wed, 25 May 2022 15:50:01 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220525155001eusmtrp1e300515e2f759f717d24a8034d0e684c~yY9oAQs8L1510315103eusmtrp13;
 Wed, 25 May 2022 15:50:01 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-38-628e50294712
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 19.17.09522.9205E826; Wed, 25
 May 2022 16:50:01 +0100 (BST)
Received: from localhost (unknown [106.210.248.20]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220525155000eusmtip14618fa38abc8c0316d04639cb06a9481~yY9nuExE31817318173eusmtip1C;
 Wed, 25 May 2022 15:50:00 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: axboe@kernel.dk, damien.lemoal@opensource.wdc.com, snitzer@redhat.com,
 Johannes.Thumshirn@wdc.com, hch@lst.de, hare@suse.de
Date: Wed, 25 May 2022 17:49:51 +0200
Message-Id: <20220525154957.393656-3-p.raghav@samsung.com>
In-Reply-To: <20220525154957.393656-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFKsWRmVeSWpSXmKPExsWy7djPc7qaAX1JBs+/GlusvtvPZvH77Hlm
 i73vZrNaXPjRyGRx88BOJos9iyYxWaxcfZTJ4sn6WcwWPQc+sFj87brHZLH3lrbF5V1z2Czm
 L3vKbnFjwlNGi89LW9gt2jZ+ZXQQ8Ph3Yg2bx+WzpR6bVnWyeWxeUu+x+2YDm8fO1vusHu/3
 XWXz6NuyitFj/ZarLB6bT1d7fN4k59F+oJspgCeKyyYlNSezLLVI3y6BK+Pis+XsBcdUKz49
 72dqYNwv18XIySEhYCKx4MJ5dhBbSGAFo8S9/0xdjFxA9hdGiecXnkI5nxklFjzsZOli5ADr
 +H6QBaJhOaPEwUZ9CPsFo8T/VW4gJWwCWhKNnewgrSICjYwSU1+eYARxmAVmM0nM+zaZEaRB
 WCBSovHZFlYQm0VAVeL82k3MIDavgJXE2Qt/WSCuk5eYeek72HWcAtYS8/d/hqoRlDg58wlY
 DTNQTfPW2cwgCyQEVnNKbF8+lxWi2UVi4oG3zBC2sMSr41vYIWwZidOTe6AWVEs8vfEbqrmF
 UaJ/53o2iC+tJfrO5ICYzAKaEut36UOUO0rMmzCZCaKCT+LGW0GIE/gkJm2bzgwR5pXoaBOC
 qFaS2PnzCdRSCYnLTXOglnpIPHr8hGUCo+IsJM/MQvLMLIS9CxiZVzGKp5YW56anFhvmpZbr
 FSfmFpfmpesl5+duYgQmv9P/jn/awTj31Ue9Q4xMHIyHGCU4mJVEeC887U0S4k1JrKxKLcqP
 LyrNSS0+xCjNwaIkzpucuSFRSCA9sSQ1OzW1ILUIJsvEwSnVwGQpdPr1s9XhC23u5DXdKW18
 UCQi979NdbXFfqNmu76zYpO/P/16+MKW2EOrth+U+8R35vtTdiGNlVmebrv3LMyrqVkUmF1/
 7YaoIpPmPEdXvcx73/p/WF4VTZZU6DBhX1UetUJY1Tn5HktO0pIp/O8qpE8b24k76pwoWrE6
 tjfyp1hy/LULUb3HlE5sv5awdvb9vLXF7ccmt1zX1c2Q4l6Y9ty3KvHi3fOXv7J/8XgzK3jz
 bPM79p/1tuhq5x/eYXQ//3TtvAXcR2JbjT3fc0sXbvJJPLBx96V3M1bJTY35pDzrzK6+gr/7
 JiTttd+a52ikI/xjG8PKxd89fi3qjJ7I3NV8PFO0dE778b1X7sUqsRRnJBpqMRcVJwIA9hj9
 6u0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xu7qaAX1JBtNOs1isvtvPZvH77Hlm
 i73vZrNaXPjRyGRx88BOJos9iyYxWaxcfZTJ4sn6WcwWPQc+sFj87brHZLH3lrbF5V1z2Czm
 L3vKbnFjwlNGi89LW9gt2jZ+ZXQQ8Ph3Yg2bx+WzpR6bVnWyeWxeUu+x+2YDm8fO1vusHu/3
 XWXz6NuyitFj/ZarLB6bT1d7fN4k59F+oJspgCdKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/I
 xFLP0Ng81srIVEnfziYlNSezLLVI3y5BL+Pis+XsBcdUKz4972dqYNwv18XIwSEhYCLx/SBL
 FyMXh5DAUkaJZUs+ADmcQHEJidsLmxghbGGJP9e62CCKnjFKfOo9ww7SzCagJdHYyQ4SFxHo
 ZJSYs68VzGEWWM4k8fzTImaQbmGBcInHc08wgdgsAqoS59duAovzClhJnL3wF2qbvMTMS9/Z
 QWxOAWuJ+fs/g9UIAdV8vfOVFaJeUOLkzCdg9cxA9c1bZzNPYBSYhSQ1C0lqASPTKkaR1NLi
 3PTcYkO94sTc4tK8dL3k/NxNjMBo3Xbs5+YdjPNefdQ7xMjEwXiIUYKDWUmE98LT3iQh3pTE
 yqrUovz4otKc1OJDjKZAd09klhJNzgemi7ySeEMzA1NDEzNLA1NLM2MlcV7Pgo5EIYH0xJLU
 7NTUgtQimD4mDk6pBqapu/t2VWbZ7IkW/94qsbWJPfLL0mXhCr69TsWrV7itCt7iqZQkErRy
 wXP1y56LlUWn893j2pPLef6yVP0M+XbX6ZKiOzYVetWuXvno7rO7/DvENUrljDuX6/f2FHXc
 MZeYMdnmkoj9cuXsuC8PLidOFtrrIvPzYvwSHfGZPB+LLALUJZcyOsutaZNv7FpZ6vPIRTdp
 Ltuve5vi857s9tWfu8HYMmH5leLnVx+vfn1o48IUvofZf/Z8WftNs+JHSB2bgehytVn/g+Jc
 9H3W7LjQtqWdI2j27IrVF49n71Lkapav6N0j0tFsEbxc7+4ahxf6hv7Z1UtyDn7jnaOw9aGd
 0t+lWTod16b3ZT5Zt0SJpTgj0VCLuag4EQALrYxWXwMAAA==
X-CMS-MailID: 20220525155001eucas1p13e64a05367144fc6965f486bb07b55a2
X-Msg-Generator: CA
X-RootMTR: 20220525155001eucas1p13e64a05367144fc6965f486bb07b55a2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220525155001eucas1p13e64a05367144fc6965f486bb07b55a2
References: <20220525154957.393656-1-p.raghav@samsung.com>
 <CGME20220525155001eucas1p13e64a05367144fc6965f486bb07b55a2@eucas1p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [dm-devel] [PATCH v6 2/8] block: allow blk-zoned devices to have
 non-power-of-2 zone size
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, gost.dev@samsung.com,
 jiangbo.365@bytedance.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, dm-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>, dsterba@suse.com, jaegeuk@kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Checking if a given sector is aligned to a zone is a common
operation that is performed for zoned devices. Add
blk_queue_is_zone_start helper to check for this instead of opencoding it
everywhere.

Convert the calculations on zone size to be generic instead of relying on
power_of_2 based logic in the block layer using the helpers wherever
possible.

The only hot path affected by this change for power_of_2 zoned devices
is in blk_check_zone_append() but blk_queue_is_zone_start() helper is
used to optimize the calculation for po2 zone sizes. Note that the append
path cannot be accessed by direct raw access to the block device but only
through a filesystem abstraction.

Finally, allow non power of 2 zoned devices provided that their zone
capacity and zone size are equal. The main motivation to allow non
power_of_2 zoned device is to remove the unmapped LBA between zcap and
zsze for devices that cannot have a power_of_2 zcap.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 block/blk-core.c       |  3 +--
 block/blk-zoned.c      | 25 +++++++++++++++++++------
 include/linux/blkdev.h | 21 +++++++++++++++++++++
 3 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index bc0506772152..bf1eae142118 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -630,8 +630,7 @@ static inline blk_status_t blk_check_zone_append(struct request_queue *q,
 		return BLK_STS_NOTSUPP;
 
 	/* The bio sector must point to the start of a sequential zone */
-	if (pos & (blk_queue_zone_sectors(q) - 1) ||
-	    !blk_queue_zone_is_seq(q, pos))
+	if (!blk_queue_is_zone_start(q, pos) || !blk_queue_zone_is_seq(q, pos))
 		return BLK_STS_IOERR;
 
 	/*
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 8b0615287cd3..7957eec04ff6 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -288,10 +288,10 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 		return -EINVAL;
 
 	/* Check alignment (handle eventual smaller last zone) */
-	if (sector & (zone_sectors - 1))
+	if (!blk_queue_is_zone_start(q, sector))
 		return -EINVAL;
 
-	if ((nr_sectors & (zone_sectors - 1)) && end_sector != capacity)
+	if (!blk_queue_is_zone_start(q, nr_sectors) && end_sector != capacity)
 		return -EINVAL;
 
 	/*
@@ -489,14 +489,27 @@ static int blk_revalidate_zone_cb(struct blk_zone *zone, unsigned int idx,
 	 * smaller last zone.
 	 */
 	if (zone->start == 0) {
-		if (zone->len == 0 || !is_power_of_2(zone->len)) {
-			pr_warn("%s: Invalid zoned device with non power of two zone size (%llu)\n",
-				disk->disk_name, zone->len);
+		if (zone->len == 0) {
+			pr_warn("%s: Invalid zone size", disk->disk_name);
+			return -ENODEV;
+		}
+
+		/*
+		 * Don't allow zoned device with non power_of_2 zone size with
+		 * zone capacity less than zone size.
+		 */
+		if (!is_power_of_2(zone->len) && zone->capacity < zone->len) {
+			pr_warn("%s: Invalid zone capacity for non power of 2 zone size",
+				disk->disk_name);
 			return -ENODEV;
 		}
 
 		args->zone_sectors = zone->len;
-		args->nr_zones = (capacity + zone->len - 1) >> ilog2(zone->len);
+		/*
+		 * Division is used to calculate nr_zones for both power_of_2
+		 * and non power_of_2 zone sizes as it is not in the hot path.
+		 */
+		args->nr_zones = div64_u64(capacity + zone->len - 1, zone->len);
 	} else if (zone->start + args->zone_sectors < capacity) {
 		if (zone->len != args->zone_sectors) {
 			pr_warn("%s: Invalid zoned device with non constant zone size\n",
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index c4e4c7071b7b..f5c7a41032ba 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -676,6 +676,21 @@ static inline unsigned int blk_queue_zone_no(struct request_queue *q,
 	return div64_u64(sector, zone_sectors);
 }
 
+static inline bool blk_queue_is_zone_start(struct request_queue *q, sector_t sec)
+{
+	sector_t zone_sectors = blk_queue_zone_sectors(q);
+	u64 remainder = 0;
+
+	if (!blk_queue_is_zoned(q))
+		return false;
+
+	if (is_power_of_2(zone_sectors))
+		return IS_ALIGNED(sec, zone_sectors);
+
+	div64_u64_rem(sec, zone_sectors, &remainder);
+	return remainder == 0;
+}
+
 static inline bool blk_queue_zone_is_seq(struct request_queue *q,
 					 sector_t sector)
 {
@@ -722,6 +737,12 @@ static inline unsigned int blk_queue_zone_no(struct request_queue *q,
 {
 	return 0;
 }
+
+static inline bool blk_queue_is_zone_start(struct request_queue *q, sector_t sec)
+{
+	return false;
+}
+
 static inline unsigned int queue_max_open_zones(const struct request_queue *q)
 {
 	return 0;
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

