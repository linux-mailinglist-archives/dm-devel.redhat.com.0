Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2839F778D7A
	for <lists+dm-devel@lfdr.de>; Fri, 11 Aug 2023 13:21:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691752863;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YIsMxY6KZqIqb4pKTplOQcp66T1uEZl5HtWKP+h/WG0=;
	b=CV+bxlWHRLTMUxBnAn1ru0ZUnFcc49mZpnve6j+ITnbQMp7aWgDoVwcCHsUP2faf7oeQSO
	4jXQgMqNu2oplP1KJKEzdCARALoDtLoHDj9YeecIWfwtdv5Gy7j4x8jlvb0NEzXsDuY25O
	f+Scx5B/13CYWQxBhR7aOYCQl0wOq/k=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-GvBM12hnOFCpmGeCzcgrpw-1; Fri, 11 Aug 2023 07:21:01 -0400
X-MC-Unique: GvBM12hnOFCpmGeCzcgrpw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A64251C0726C;
	Fri, 11 Aug 2023 11:20:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B8C1401E6A;
	Fri, 11 Aug 2023 11:20:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 544D81946588;
	Fri, 11 Aug 2023 11:20:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0F88B1946588
 for <dm-devel@listman.corp.redhat.com>; Fri, 11 Aug 2023 11:20:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9123140E96E; Fri, 11 Aug 2023 11:20:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D04AC140E96D
 for <dm-devel@redhat.com>; Fri, 11 Aug 2023 11:20:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAB2A85D064
 for <dm-devel@redhat.com>; Fri, 11 Aug 2023 11:20:56 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-phTnnPslMaGxjXTFTTwEDQ-1; Fri, 11 Aug 2023 07:20:54 -0400
X-MC-Unique: phTnnPslMaGxjXTFTTwEDQ-1
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230811112051epoutp0131c91e780d8d7066c75d75a10f4eda8b~6UEFVWlN_3045830458epoutp01c
 for <dm-devel@redhat.com>; Fri, 11 Aug 2023 11:20:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230811112051epoutp0131c91e780d8d7066c75d75a10f4eda8b~6UEFVWlN_3045830458epoutp01c
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20230811112050epcas5p2866916af63009e0aaa3e3a0185ad31e3~6UEEn1OXr0511305113epcas5p25;
 Fri, 11 Aug 2023 11:20:50 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4RMhDd4MKqz4x9Pv; Fri, 11 Aug
 2023 11:20:49 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 69.7D.55522.19916D46; Fri, 11 Aug 2023 20:20:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20230811105830epcas5p37a477e5e7b006613549647bebdf4d028~6TwkO0CPt2989329893epcas5p3F;
 Fri, 11 Aug 2023 10:58:30 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230811105830epsmtrp2da1a8fadbde3e617e6438c330a5bbfa1~6TwkN0yzv2549525495epsmtrp2c;
 Fri, 11 Aug 2023 10:58:30 +0000 (GMT)
X-AuditID: b6c32a49-419ff7000000d8e2-1d-64d619914d89
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 65.23.64355.65416D46; Fri, 11 Aug 2023 19:58:30 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230811105824epsmtip2d8dc512097dbe28fc313202aa2f0faf2~6Twe3QMcV1482514825epsmtip2R;
 Fri, 11 Aug 2023 10:58:24 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>
Date: Fri, 11 Aug 2023 16:22:54 +0530
Message-Id: <20230811105300.15889-12-nj.shetty@samsung.com>
In-Reply-To: <20230811105300.15889-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxjOufdyKSzVK2J2YEObbiZDxkcV8AACmxh3nbCQEbLJftQ7egUC
 tE1bFCfRAiII8i1LrHwGIoIbxQ5UigUGDuRrzDJgsFTYaAeOCCLZ2CTAKBen/57nOe/7Pnne
 k5eHO1y2debFSVWsQsokCEl74k6X63vuhU6jEq/V0reRtq8bR2kFqzi6Zcon0VzXc4DMHZkA
 rQwO4WiqPRgZ5q/boPGOFgzV3foBQ0WdowBZRjQYMky4oapLNQS6b+gl0LC+lEQVNyy2qLZn
 DUO/FFgAurNSgaOGuQUCPZx4C03nZAE0tNpj8wGkhx7fJujhwSRaV3+ZpL+ruUC3jqtJujqv
 2IbOTZ8n6ZaMSRt60TJB0AttIySd11QP6CXdblpnfoqF86PiD8WyjIRVCFhptEwSJ40JFB6P
 EIeIfXy9RO4iP3RQKJAyiWyg8EhouPvRuISN+ELBaSYhaUMKZ5RKoWfQIYUsScUKYmVKVaCQ
 lUsS5N5yDyWTqEySxnhIWZW/yMtrv89G4cn42LaGGUz+8KPkxX9nbNUgIyAb2PEg5Q0f1S9j
 2cCe50C1Atid227DkecA/lo2/4qMF/2DZwPeZssD/aec3gLgelYjwZEMDM4MlAFrEUm5wf51
 nlV3pNQ4bGytBlaCU6U4tPxdTlrNd1IfwmaLibBigtoLv39xcRPzqQBoSGsDnJsnzJ/cYZXt
 NuQFnZHkSnbA3mvmzXKc2gPTm6/j1vmQKraDD5b0OBfuCEyr7Cc4vBP+2dNky2FnuDRvIDl8
 BtZdvUlyzRcB1IxpAPcQDDP68jcj45Qr1Oo9OdkFlvQ1YJzxNpi7YsY4nQ/vlb/E78BvtJVb
 853g6HLqFqZh0WzB1krzAFyoniQKgEDzWiDNa4E0r6wrAV4PnFi5MjGGVfrIRVL2zP/fHC1L
 1IHNm9h37B4wTT3z6AQYD3QCyMOFjvzACKPEgS9hzn7FKmRiRVICq+wEPhsLL8Sdd0XLNo5K
 qhKLvP28vH19fb39DviKhG/y5zLKJA5UDKNi41lWzipe9mE8O2c1FvL4sxN6Y45Ya7l7bpda
 TjWemvO4krx+YHvUsZww49kgQVW33tWsetowm7n2ZVXSj1G9I37Ka1dHO8j7nX7tq46SMXvF
 TJkpzD4lJHLtfDjx6PCJvTcZqW7wgkzvf6P89rMmrUvr9GwpQ0Umn473l1zSuppMY18Mv5Fa
 5LbbRZAZOhVm20lKQltUrc1GcfaLJSLl836/kuX5FM/J2p8NhHTK0LV9oCZglFH3PdnWGox+
 q5mu3JNZ2JR3cm3q3Y9jS2rfr3I4OHQkJqKu4ZTZrPg99bzg24qvjws/iRctBiXuByXjheee
 zI1G3h0w/hW1okgvvmL6yecP50GBLCvmcEGLkFDGMqJ9uELJ/Ac8yfAfnAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsWy7bCSvG6YyLUUg45ZXBbrTx1jtmia8JfZ
 YvXdfjaL14c/MVo8OdDOaPH77Hlmiwf77S32vpvNanHzwE4mi5WrjzJZTDp0jdHi6dVZTBZ7
 b2lbLGxbwmKxZ+9JFovLu+awWcxf9pTdYvnxf0wWNyY8ZbTY9ns+s8W61+9ZLE7ckrZ43N3B
 aHH+73FWBwmP8/c2snhcPlvqsWlVJ5vH5iX1HrtvNrB5LO6bzOrR2/yOzWNn631Wj49Pb7F4
 vN93lc2jb8sqRo/Pm+Q8Nj15yxTAG8Vlk5Kak1mWWqRvl8CVsW/dc6aCE+4VH38+Z29gbLXu
 YuTgkBAwkTiyK6iLkYtDSGA7o8TDG31sXYycQHFJiWV/jzBD2MISK/89Z4coamaS+LnxDDtI
 M5uAtsTp/xwgcRGBLmaJzp3vWEAamAVWMUssuWcDYgsLOEpsfXoXLM4ioCpx8FcLmM0rYC2x
 t2kfI8QR+hL99wVBwpxA4febLoHdICRgJfFh2UFGiHJBiZMzn0CNl5do3jqbeQKjwCwkqVlI
 UgsYmVYxiqYWFOem5yYXGOoVJ+YWl+al6yXn525iBMeuVtAOxmXr/+odYmTiYDzEKMHBrCTC
 axt8KUWINyWxsiq1KD++qDQntfgQozQHi5I4r3JOZ4qQQHpiSWp2ampBahFMlomDU6qBSaTg
 457zFrF3Tux6zFz9SD7Ifv2V2x/7Nj9fU9ZkL+FRzZxxavnD1z0R8p9k99WFGpXbbnF7tNt3
 +4MN0XwnHp37yfzfInX7m62LFLpSdh5N2XtCsy1aek8BT29E3Y25mnusbtQe1T7E6G735+P/
 lsyce6Kb1wRp6/F9/HmnqE/ezPx2wav4lQ3/1kfKMGyyyktOVJ0Qfv16uUTKqjqeoNKpNu6i
 qZJl7beuJqeIf7qsq7R13s2VPReSRbLSGaa7vHFbGr9NZ8KOCxWbqx5yLij6W63ZoXS1VirL
 3/5DPWeuqenMGauqtq97frG2aMUnp13P5xW+lhLV523U6mHr+7br87eLZ5adnnJlyZ7Ne5RY
 ijMSDbWYi4oTAbrrnr9MAwAA
X-CMS-MailID: 20230811105830epcas5p37a477e5e7b006613549647bebdf4d028
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230811105830epcas5p37a477e5e7b006613549647bebdf4d028
References: <20230811105300.15889-1-nj.shetty@samsung.com>
 <CGME20230811105830epcas5p37a477e5e7b006613549647bebdf4d028@epcas5p3.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH v14 11/11] null_blk: add support for copy offload
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
Cc: Anuj Gupta <anuj20.g@samsung.com>, Vincent Fu <vincent.fu@samsung.com>,
 martin.petersen@oracle.com, linux-doc@vger.kernel.org, gost.dev@samsung.com,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, mcgrof@kernel.org, dlemoal@kernel.org,
 linux-fsdevel@vger.kernel.org, Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implementation is based on existing read and write infrastructure.
copy_max_bytes: A new configfs and module parameter is introduced, which
can be used to set hardware/driver supported maximum copy limit.
Only request based queue mode will support for copy offload.
Added tracefs support to copy IO tracing.

Suggested-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Vincent Fu <vincent.fu@samsung.com>
---
 Documentation/block/null_blk.rst  |  5 ++
 drivers/block/null_blk/main.c     | 99 ++++++++++++++++++++++++++++++-
 drivers/block/null_blk/null_blk.h |  1 +
 drivers/block/null_blk/trace.h    | 23 +++++++
 4 files changed, 125 insertions(+), 3 deletions(-)

diff --git a/Documentation/block/null_blk.rst b/Documentation/block/null_blk.rst
index 4dd78f24d10a..6153e02fcf13 100644
--- a/Documentation/block/null_blk.rst
+++ b/Documentation/block/null_blk.rst
@@ -149,3 +149,8 @@ zone_size=[MB]: Default: 256
 zone_nr_conv=[nr_conv]: Default: 0
   The number of conventional zones to create when block device is zoned.  If
   zone_nr_conv >= nr_zones, it will be reduced to nr_zones - 1.
+
+copy_max_bytes=[size in bytes]: Default: COPY_MAX_BYTES
+  A module and configfs parameter which can be used to set hardware/driver
+  supported maximum copy offload limit.
+  COPY_MAX_BYTES(=128MB at present) is defined in fs.h
diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 864013019d6b..afc14aa20305 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -11,6 +11,8 @@
 #include <linux/init.h>
 #include "null_blk.h"
 
+#include "trace.h"
+
 #undef pr_fmt
 #define pr_fmt(fmt)	"null_blk: " fmt
 
@@ -157,6 +159,10 @@ static int g_max_sectors;
 module_param_named(max_sectors, g_max_sectors, int, 0444);
 MODULE_PARM_DESC(max_sectors, "Maximum size of a command (in 512B sectors)");
 
+static unsigned long g_copy_max_bytes = COPY_MAX_BYTES;
+module_param_named(copy_max_bytes, g_copy_max_bytes, ulong, 0444);
+MODULE_PARM_DESC(copy_max_bytes, "Maximum size of a copy command (in bytes)");
+
 static unsigned int nr_devices = 1;
 module_param(nr_devices, uint, 0444);
 MODULE_PARM_DESC(nr_devices, "Number of devices to register");
@@ -409,6 +415,7 @@ NULLB_DEVICE_ATTR(home_node, uint, NULL);
 NULLB_DEVICE_ATTR(queue_mode, uint, NULL);
 NULLB_DEVICE_ATTR(blocksize, uint, NULL);
 NULLB_DEVICE_ATTR(max_sectors, uint, NULL);
+NULLB_DEVICE_ATTR(copy_max_bytes, uint, NULL);
 NULLB_DEVICE_ATTR(irqmode, uint, NULL);
 NULLB_DEVICE_ATTR(hw_queue_depth, uint, NULL);
 NULLB_DEVICE_ATTR(index, uint, NULL);
@@ -550,6 +557,7 @@ static struct configfs_attribute *nullb_device_attrs[] = {
 	&nullb_device_attr_queue_mode,
 	&nullb_device_attr_blocksize,
 	&nullb_device_attr_max_sectors,
+	&nullb_device_attr_copy_max_bytes,
 	&nullb_device_attr_irqmode,
 	&nullb_device_attr_hw_queue_depth,
 	&nullb_device_attr_index,
@@ -656,7 +664,8 @@ static ssize_t memb_group_features_show(struct config_item *item, char *page)
 			"poll_queues,power,queue_mode,shared_tag_bitmap,size,"
 			"submit_queues,use_per_node_hctx,virt_boundary,zoned,"
 			"zone_capacity,zone_max_active,zone_max_open,"
-			"zone_nr_conv,zone_offline,zone_readonly,zone_size\n");
+			"zone_nr_conv,zone_offline,zone_readonly,zone_size,"
+			"copy_max_bytes\n");
 }
 
 CONFIGFS_ATTR_RO(memb_group_, features);
@@ -722,6 +731,7 @@ static struct nullb_device *null_alloc_dev(void)
 	dev->queue_mode = g_queue_mode;
 	dev->blocksize = g_bs;
 	dev->max_sectors = g_max_sectors;
+	dev->copy_max_bytes = g_copy_max_bytes;
 	dev->irqmode = g_irqmode;
 	dev->hw_queue_depth = g_hw_queue_depth;
 	dev->blocking = g_blocking;
@@ -1271,6 +1281,81 @@ static int null_transfer(struct nullb *nullb, struct page *page,
 	return err;
 }
 
+static inline int nullb_setup_copy(struct nullb *nullb, struct request *req,
+				   bool is_fua)
+{
+	sector_t sector_in, sector_out;
+	loff_t offset_in, offset_out;
+	void *in, *out;
+	ssize_t chunk, rem = 0;
+	struct bio *bio;
+	struct nullb_page *t_page_in, *t_page_out;
+	u16 seg = 1;
+	int status = -EIO;
+
+	if (blk_rq_nr_phys_segments(req) != COPY_MAX_SEGMENTS)
+		return status;
+
+	/*
+	 * First bio contains information about source and last bio contains
+	 * information about destination.
+	 */
+	__rq_for_each_bio(bio, req) {
+		if (seg == blk_rq_nr_phys_segments(req)) {
+			sector_out = bio->bi_iter.bi_sector;
+			if (rem != bio->bi_iter.bi_size)
+				return status;
+		} else {
+			sector_in = bio->bi_iter.bi_sector;
+			rem = bio->bi_iter.bi_size;
+		}
+		seg++;
+	}
+
+	trace_nullb_copy_op(req, sector_out << SECTOR_SHIFT,
+			    sector_in << SECTOR_SHIFT, rem);
+
+	spin_lock_irq(&nullb->lock);
+	while (rem > 0) {
+		chunk = min_t(size_t, nullb->dev->blocksize, rem);
+		offset_in = (sector_in & SECTOR_MASK) << SECTOR_SHIFT;
+		offset_out = (sector_out & SECTOR_MASK) << SECTOR_SHIFT;
+
+		if (null_cache_active(nullb) && !is_fua)
+			null_make_cache_space(nullb, PAGE_SIZE);
+
+		t_page_in = null_lookup_page(nullb, sector_in, false,
+					     !null_cache_active(nullb));
+		if (!t_page_in)
+			goto err;
+		t_page_out = null_insert_page(nullb, sector_out,
+					      !null_cache_active(nullb) ||
+					      is_fua);
+		if (!t_page_out)
+			goto err;
+
+		in = kmap_local_page(t_page_in->page);
+		out = kmap_local_page(t_page_out->page);
+
+		memcpy(out + offset_out, in + offset_in, chunk);
+		kunmap_local(out);
+		kunmap_local(in);
+		__set_bit(sector_out & SECTOR_MASK, t_page_out->bitmap);
+
+		if (is_fua)
+			null_free_sector(nullb, sector_out, true);
+
+		rem -= chunk;
+		sector_in += chunk >> SECTOR_SHIFT;
+		sector_out += chunk >> SECTOR_SHIFT;
+	}
+
+	status = 0;
+err:
+	spin_unlock_irq(&nullb->lock);
+	return status;
+}
+
 static int null_handle_rq(struct nullb_cmd *cmd)
 {
 	struct request *rq = cmd->rq;
@@ -1280,13 +1365,16 @@ static int null_handle_rq(struct nullb_cmd *cmd)
 	sector_t sector = blk_rq_pos(rq);
 	struct req_iterator iter;
 	struct bio_vec bvec;
+	bool fua = rq->cmd_flags & REQ_FUA;
+
+	if (op_is_copy(req_op(rq)))
+		return nullb_setup_copy(nullb, rq, fua);
 
 	spin_lock_irq(&nullb->lock);
 	rq_for_each_segment(bvec, rq, iter) {
 		len = bvec.bv_len;
 		err = null_transfer(nullb, bvec.bv_page, len, bvec.bv_offset,
-				     op_is_write(req_op(rq)), sector,
-				     rq->cmd_flags & REQ_FUA);
+				    op_is_write(req_op(rq)), sector, fua);
 		if (err) {
 			spin_unlock_irq(&nullb->lock);
 			return err;
@@ -2042,6 +2130,9 @@ static int null_validate_conf(struct nullb_device *dev)
 		return -EINVAL;
 	}
 
+	if (dev->queue_mode == NULL_Q_BIO)
+		dev->copy_max_bytes = 0;
+
 	return 0;
 }
 
@@ -2161,6 +2252,8 @@ static int null_add_dev(struct nullb_device *dev)
 		dev->max_sectors = queue_max_hw_sectors(nullb->q);
 	dev->max_sectors = min(dev->max_sectors, BLK_DEF_MAX_SECTORS);
 	blk_queue_max_hw_sectors(nullb->q, dev->max_sectors);
+	blk_queue_max_copy_hw_sectors(nullb->q,
+				      dev->copy_max_bytes >> SECTOR_SHIFT);
 
 	if (dev->virt_boundary)
 		blk_queue_virt_boundary(nullb->q, PAGE_SIZE - 1);
diff --git a/drivers/block/null_blk/null_blk.h b/drivers/block/null_blk/null_blk.h
index 929f659dd255..e82e53a2e2df 100644
--- a/drivers/block/null_blk/null_blk.h
+++ b/drivers/block/null_blk/null_blk.h
@@ -107,6 +107,7 @@ struct nullb_device {
 	unsigned int queue_mode; /* block interface */
 	unsigned int blocksize; /* block size */
 	unsigned int max_sectors; /* Max sectors per command */
+	unsigned long copy_max_bytes; /* Max copy offload length in bytes */
 	unsigned int irqmode; /* IRQ completion handler */
 	unsigned int hw_queue_depth; /* queue depth */
 	unsigned int index; /* index of the disk, only valid with a disk */
diff --git a/drivers/block/null_blk/trace.h b/drivers/block/null_blk/trace.h
index 6b2b370e786f..431c33e11a49 100644
--- a/drivers/block/null_blk/trace.h
+++ b/drivers/block/null_blk/trace.h
@@ -68,6 +68,29 @@ TRACE_EVENT(nullb_report_zones,
 		      __print_disk_name(__entry->disk), __entry->nr_zones)
 );
 
+TRACE_EVENT(nullb_copy_op,
+		TP_PROTO(struct request *req,
+			 sector_t dst, sector_t src, size_t len),
+		TP_ARGS(req, dst, src, len),
+		TP_STRUCT__entry(
+				 __array(char, disk, DISK_NAME_LEN)
+				 __field(enum req_op, op)
+				 __field(sector_t, dst)
+				 __field(sector_t, src)
+				 __field(size_t, len)
+		),
+		TP_fast_assign(
+			       __entry->op = req_op(req);
+			       __assign_disk_name(__entry->disk, req->q->disk);
+			       __entry->dst = dst;
+			       __entry->src = src;
+			       __entry->len = len;
+		),
+		TP_printk("%s req=%-15s: dst=%llu, src=%llu, len=%lu",
+			  __print_disk_name(__entry->disk),
+			  blk_op_str(__entry->op),
+			  __entry->dst, __entry->src, __entry->len)
+);
 #endif /* _TRACE_NULLB_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

