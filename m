Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B7794274
	for <lists+dm-devel@lfdr.de>; Wed,  6 Sep 2023 19:55:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694022912;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Qr4e9JqsvkKFY58HSX9wpe7MMVWtJ3hcdQPa9szhV7g=;
	b=hNXISO+6fDdiwBw0Ax0z0BRd2vYhvqNPCYkhOK1gSOL5C/V5Etiqom+RjiX8706qQSQhvJ
	wYXt3D60GBlPysjgCDunGquVfp8RdpeeNAH5JNzTnw8e/TPiE9mBRut8Ps5uYpicj3GKkn
	h2dAaDhghWNOPelV+fvNC6CJBDip2FI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-6NAKsdRmOAChmAGPAimx1w-1; Wed, 06 Sep 2023 13:55:09 -0400
X-MC-Unique: 6NAKsdRmOAChmAGPAimx1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E20F816528;
	Wed,  6 Sep 2023 17:55:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 85F26C03292;
	Wed,  6 Sep 2023 17:55:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A4B819465B9;
	Wed,  6 Sep 2023 17:55:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 73F82194658F
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Sep 2023 17:55:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 64D15412F2D3; Wed,  6 Sep 2023 17:55:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D5A2400F26A
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 17:55:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E56F105EEE2
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 17:55:04 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-6TIt2EHNPKemz_RhtYkPqQ-1; Wed, 06 Sep 2023 13:55:01 -0400
X-MC-Unique: 6TIt2EHNPKemz_RhtYkPqQ-1
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20230906175458epoutp01b84cb63118748e64539f2c74b11df2d1~CYNnekTDZ0555705557epoutp01K
 for <dm-devel@redhat.com>; Wed,  6 Sep 2023 17:54:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20230906175458epoutp01b84cb63118748e64539f2c74b11df2d1~CYNnekTDZ0555705557epoutp01K
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230906175457epcas5p3e40cf2dc7f36ca3dc29f627ca2d0c850~CYNmy6YzI0403304033epcas5p3z;
 Wed,  6 Sep 2023 17:54:57 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4RgqlN5QSBz4x9Pr; Wed,  6 Sep
 2023 17:54:56 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B8.04.19094.0FCB8F46; Thu,  7 Sep 2023 02:54:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230906164434epcas5p16135fb4935a62519360ede42e137bbbb~CXQJnL5me2858128581epcas5p13;
 Wed,  6 Sep 2023 16:44:34 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230906164434epsmtrp2c61a29bfc02ad96c90cf2a36a2e638f0~CXQJl8TUs1133211332epsmtrp28;
 Wed,  6 Sep 2023 16:44:34 +0000 (GMT)
X-AuditID: b6c32a50-39fff70000004a96-e8-64f8bcf089d7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 07.86.08649.27CA8F46; Thu,  7 Sep 2023 01:44:34 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230906164431epsmtip26102af277c288b1f2ebdb34160b3a6b8~CXQGjrhju0395803958epsmtip2N;
 Wed,  6 Sep 2023 16:44:31 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>
Date: Wed,  6 Sep 2023 22:08:37 +0530
Message-Id: <20230906163844.18754-13-nj.shetty@samsung.com>
In-Reply-To: <20230906163844.18754-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0xbZRj2O6c9PRA7DrfwWZGRbugACy2X8jGHunDJyeAHxmicJmKhZ4VQ
 2tLLQBNDO2yHkHHZZmDdHMVVGJcBAyTAgCAI5TLEhTtm8kNwMjZASKbCmFJadP+e93mf9/K8
 Xz4S9zBxeGSGQsuoFRI5n3BltQ8EvibY6P5LKhypP4KaRodwdK50F0f190sItDqwCdBS33mA
 dsYncNSzdpWN5vs6MVRbP4ihi/0zAC1PmzHUsxCMqkxWFuruGWGhya5rBKqsXuagGtszDM2V
 LgPUvlOJo8bVdRYaXngZ/VpUANDEro39tg898cttFj05rqNb6r4k6FZrHn1nXk/QN4ovsekL
 +WsE3WlcZNN/LC+w6PXeaYIubqsD9FaLH92y9BhL5n6YeSKdkUgZtT+jSFNKMxSyGH7iuymx
 KZFioUggikZRfH+FJIuJ4cclJQsSMuR71vn+ZyVy3R6VLNFo+KFvnlArdVrGP12p0cbwGZVU
 ropQhWgkWRqdQhaiYLTHRUJhWOSe8JPM9J9qy1gqa0JuT9cWoQem44XAhYRUBPzNvAIKgSvp
 QXUDeN2yzXIEmwC2leudwRMAr0wMEQclG41FhCPRA2Bv9RbHERgx2L26iBUCkiSoYDj2D2nn
 vSg9Dpvv3NgfglMFOFwsbiXsIk/qJHz09HV7VxYVACt7DSw75lJvwArTzL4EUqGwZNHdTrvs
 0ecM94BD4g5Hrizty3HqMMz/7ipubw+pchfY0LeNOTaNg/O/X3JiT/jQ1sZxYB7cWutxusmB
 tZdvEo7iLwA0z5qBI/EWNI6W4PYlcCoQNnWFOuhX4FejjZhj8CF4YWfJ2Z8LO64f4COwocni
 7P8SnPnT4MQ07Kj9nu04VjGAt0qeYaXA3/ycIfNzhsz/j7YAvA7wGJUmS8akRapEAgWT8987
 pymzWsD+hwhK7gD1zbsh/QAjQT+AJM734q4dfiL14Eoln37GqJUpap2c0fSDyL2Ll+E87zTl
 3o9SaFNEEdHCCLFYHBEdLhbxfbirxq+lHpRMomUyGUbFqA/qMNKFp8cSzT8HG6kfq2OqcsaP
 yd190+ml8I12ck7cmjQmeFHvF/+CX1Re+CFFmDwo/pGooyxuhVckTlztLIa+3sb8gpu8zdn8
 B1Ge04JG3WAq15Q5OQa2hTWNrb7z2cFnq/rdUpLvVeGBH5x3td4+UxzinVuQ+kBspd3Md7NT
 DUF3y8w2b6+P430CUy//fTrN+oPt1TxZrPKjU7GP7/MLKvrqYlNXTp5O9AqQiSrZAWuWYQsU
 Gh6G5plqlskhS5/h2/ebAzhh+lBiYu5U0dGpp0K37MpbsztkwsSZo7J3PkffTL2XZFXQfbbM
 /AbfCnAtJHdqvby6gu2nHuAY5MODmo1jfJYmXSIKwtUayb+luE8cmQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsWy7bCSvG7Rmh8pBs2HlCzWnzrGbNE04S+z
 xeq7/WwWrw9/YrR4cqCd0eL32fPMFnvfzWa1uHlgJ5PFytVHmSwmHbrGaPH06iwmi723tC0W
 ti1hsdiz9ySLxeVdc9gs5i97ym6x/Pg/JosbE54yWmz7PZ/ZYt3r9ywWJ25JWzzu7mC0OP/3
 OKuDuMf5extZPC6fLfXYtKqTzWPzknqP3Tcb2DwW901m9ehtfsfmsbP1PqvHx6e3WDze77vK
 5tG3ZRWjx+dNch6bnrxlCuCN4rJJSc3JLEst0rdL4Mq4sHIiS8ESt4q9uz6zNTC2WXUxcnJI
 CJhIfFjXzdbFyMUhJLCbUeJO5zlGiISkxLK/R5ghbGGJlf+es0MUNTNJvL6xDijBwcEmoC1x
 +j8HSFxEoItZonPnOxYQh1lgCrPE/8O9YEXCAo4Sb/7ogAxiEVCVmL+vkQXE5hWwlpjRdo0N
 pERCQF+i/74gSJgTKNzUeBHsBiEBK4k7q14zQpQLSpyc+QSslVlAXqJ562zmCYwCs5CkZiFJ
 LWBkWsUomVpQnJuem2xYYJiXWq5XnJhbXJqXrpecn7uJERy9Who7GO/N/6d3iJGJg/EQowQH
 s5II7zv5bylCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeQ1nzE4REkhPLEnNTk0tSC2CyTJxcEo1
 MD3V+XuVb45H0owJS71Omv/b/2n9qYMvu1OvfVj9OFBRRK+MMUzPf8auKOOHJ2PFWD3FX/A2
 rnVWYDj5epn9la1Gend29FSF2fVJJM8Om2KtLbFS0eRg4HNOLrmD0zrf5zaf6n67MLgzyLAr
 KXM5d6q7Qe+zlRHCKtKzO3h1tN1uS113V2YQCBNjcnzst9hI/ZRqVY3pKr/7jJ7L7x8oqZ3w
 5MdV90v/t888lcme9sZpl6+Z62bd6dzt7vOeHVQq+173RlmNee+mLEN5jp/6tnNlXoTY/jsm
 2GT08krXt0ou/rRLlnVnHq0ynnD8Tehp/eM3A3OlH2o7e5aUblPU9RWU4mf9NHWt2sSZ/oJB
 SizFGYmGWsxFxYkAnfin2U0DAAA=
X-CMS-MailID: 20230906164434epcas5p16135fb4935a62519360ede42e137bbbb
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230906164434epcas5p16135fb4935a62519360ede42e137bbbb
References: <20230906163844.18754-1-nj.shetty@samsung.com>
 <CGME20230906164434epcas5p16135fb4935a62519360ede42e137bbbb@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH v15 12/12] null_blk: add support for copy offload
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
Cc: Vincent Fu <vincent.fu@samsung.com>, martin.petersen@oracle.com,
 linux-doc@vger.kernel.org, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Nitesh Shetty <nj.shetty@samsung.com>,
 linux-block@vger.kernel.org, mcgrof@kernel.org, linux-fsdevel@vger.kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
 drivers/block/null_blk/main.c     | 97 ++++++++++++++++++++++++++++++-
 drivers/block/null_blk/null_blk.h |  1 +
 drivers/block/null_blk/trace.h    | 23 ++++++++
 4 files changed, 123 insertions(+), 3 deletions(-)

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
index b48901b2b573..26124f2baadc 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -160,6 +160,10 @@ static int g_max_sectors;
 module_param_named(max_sectors, g_max_sectors, int, 0444);
 MODULE_PARM_DESC(max_sectors, "Maximum size of a command (in 512B sectors)");
 
+static unsigned long g_copy_max_bytes = BLK_COPY_MAX_BYTES;
+module_param_named(copy_max_bytes, g_copy_max_bytes, ulong, 0444);
+MODULE_PARM_DESC(copy_max_bytes, "Maximum size of a copy command (in bytes)");
+
 static unsigned int nr_devices = 1;
 module_param(nr_devices, uint, 0444);
 MODULE_PARM_DESC(nr_devices, "Number of devices to register");
@@ -412,6 +416,7 @@ NULLB_DEVICE_ATTR(home_node, uint, NULL);
 NULLB_DEVICE_ATTR(queue_mode, uint, NULL);
 NULLB_DEVICE_ATTR(blocksize, uint, NULL);
 NULLB_DEVICE_ATTR(max_sectors, uint, NULL);
+NULLB_DEVICE_ATTR(copy_max_bytes, uint, NULL);
 NULLB_DEVICE_ATTR(irqmode, uint, NULL);
 NULLB_DEVICE_ATTR(hw_queue_depth, uint, NULL);
 NULLB_DEVICE_ATTR(index, uint, NULL);
@@ -553,6 +558,7 @@ static struct configfs_attribute *nullb_device_attrs[] = {
 	&nullb_device_attr_queue_mode,
 	&nullb_device_attr_blocksize,
 	&nullb_device_attr_max_sectors,
+	&nullb_device_attr_copy_max_bytes,
 	&nullb_device_attr_irqmode,
 	&nullb_device_attr_hw_queue_depth,
 	&nullb_device_attr_index,
@@ -659,7 +665,8 @@ static ssize_t memb_group_features_show(struct config_item *item, char *page)
 			"poll_queues,power,queue_mode,shared_tag_bitmap,size,"
 			"submit_queues,use_per_node_hctx,virt_boundary,zoned,"
 			"zone_capacity,zone_max_active,zone_max_open,"
-			"zone_nr_conv,zone_offline,zone_readonly,zone_size\n");
+			"zone_nr_conv,zone_offline,zone_readonly,zone_size,"
+			"copy_max_bytes\n");
 }
 
 CONFIGFS_ATTR_RO(memb_group_, features);
@@ -725,6 +732,7 @@ static struct nullb_device *null_alloc_dev(void)
 	dev->queue_mode = g_queue_mode;
 	dev->blocksize = g_bs;
 	dev->max_sectors = g_max_sectors;
+	dev->copy_max_bytes = g_copy_max_bytes;
 	dev->irqmode = g_irqmode;
 	dev->hw_queue_depth = g_hw_queue_depth;
 	dev->blocking = g_blocking;
@@ -1274,6 +1282,81 @@ static int null_transfer(struct nullb *nullb, struct page *page,
 	return err;
 }
 
+static inline int nullb_setup_copy(struct nullb *nullb, struct request *req,
+				   bool is_fua)
+{
+	sector_t sector_in = 0, sector_out = 0;
+	loff_t offset_in, offset_out;
+	void *in, *out;
+	ssize_t chunk, rem = 0;
+	struct bio *bio;
+	struct nullb_page *t_page_in, *t_page_out;
+	u16 seg = 1;
+	int status = -EIO;
+
+	if (blk_rq_nr_phys_segments(req) != BLK_COPY_MAX_SEGMENTS)
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
@@ -1283,13 +1366,16 @@ static int null_handle_rq(struct nullb_cmd *cmd)
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
@@ -2045,6 +2131,9 @@ static int null_validate_conf(struct nullb_device *dev)
 		return -EINVAL;
 	}
 
+	if (dev->queue_mode == NULL_Q_BIO)
+		dev->copy_max_bytes = 0;
+
 	return 0;
 }
 
@@ -2164,6 +2253,8 @@ static int null_add_dev(struct nullb_device *dev)
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
index 91446c34eac2..2f2c1d1c2b48 100644
--- a/drivers/block/null_blk/trace.h
+++ b/drivers/block/null_blk/trace.h
@@ -70,6 +70,29 @@ TRACE_EVENT(nullb_report_zones,
 );
 #endif /* CONFIG_BLK_DEV_ZONED */
 
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

