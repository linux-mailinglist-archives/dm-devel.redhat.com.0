Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AC47225D6
	for <lists+dm-devel@lfdr.de>; Mon,  5 Jun 2023 14:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685968235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5cKlF/H2ZWvU3sQiuMCGH+OclTgHzBydHdwoBvhXPww=;
	b=AsRj3YKqD2eJZNWT1Se7n/cjAo3EEupiE5tzZsyExXR9/0J4B0TFpZiStPaQYcvMWR/Xk0
	GcYdEa6lTa4jHBfMirGeaN8AtIwOQDgLyVnRTmyNTSsuGu1WewMV37Aa9OlqQSR47Qlp3+
	yyXOiLqy1lkGQ7buTqP4nqvnKqNCpAM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-pe8icg0HP5SH6mlgOndTWQ-1; Mon, 05 Jun 2023 08:30:33 -0400
X-MC-Unique: pe8icg0HP5SH6mlgOndTWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 287A62A5956F;
	Mon,  5 Jun 2023 12:30:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CA57140E954;
	Mon,  5 Jun 2023 12:30:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 06DF119465A4;
	Mon,  5 Jun 2023 12:30:19 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4CE1919465A0
 for <dm-devel@listman.corp.redhat.com>; Mon,  5 Jun 2023 12:30:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3CD26140E954; Mon,  5 Jun 2023 12:30:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34EE31410F26
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 12:30:05 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12001101AA44
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 12:30:05 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-7qDeIPJ7MOW-kVG2VQq74w-1; Mon, 05 Jun 2023 08:30:03 -0400
X-MC-Unique: 7qDeIPJ7MOW-kVG2VQq74w-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230605123000epoutp04b4c5412622fcbfec28326176aa4e1f9d~lwyU5FPaA1857918579epoutp045
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 12:30:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230605123000epoutp04b4c5412622fcbfec28326176aa4e1f9d~lwyU5FPaA1857918579epoutp045
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20230605122959epcas5p19650c5e46b41292eb1c31b9f6432d755~lwyUPcDrR2755927559epcas5p1X;
 Mon,  5 Jun 2023 12:29:59 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4QZXxL1NZgz4x9Pw; Mon,  5 Jun
 2023 12:29:58 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 09.07.44881.645DD746; Mon,  5 Jun 2023 21:29:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20230605122416epcas5p3b37c08a7bf7ad57361b22be0f30d3bf7~lwtUX_CAR0800608006epcas5p33;
 Mon,  5 Jun 2023 12:24:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230605122415epsmtrp11bd9a11fb9f4c12a0751ff4cdb618775~lwtUW6YFY1611816118epsmtrp1r;
 Mon,  5 Jun 2023 12:24:15 +0000 (GMT)
X-AuditID: b6c32a4a-ea9fa7000001af51-bb-647dd546e72a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3F.BC.27706.FE3DD746; Mon,  5 Jun 2023 21:24:15 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230605122411epsmtip20cac9b9b910a1f71d950a511e1a00c94~lwtQSajIv2526925269epsmtip2i;
 Mon,  5 Jun 2023 12:24:11 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, James Smart
 <james.smart@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Mon,  5 Jun 2023 17:47:25 +0530
Message-Id: <20230605121732.28468-10-nj.shetty@samsung.com>
In-Reply-To: <20230605121732.28468-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTZxT3u7e9FLa6y2t8QphNJ25AeBSBfaAMzFCvsEwCLpuSDCu9AUJp
 m7bopjLAjsdgtAhjbNWJCCqvSAZKShEwRXkjc4gPGMON4iI4Xk5gVGAthc3/fr9zfuc75/y+
 HBZuo7FwZCWI5LRUxBdyCStGQ5urq8fewRSBd2snA9V2t+PodP4yjqpHVASabJsD6LuZf3Ck
 v5kFkKGvH0cD+s3ocWswap46y0SPbjZi6MbFAgxVVt/GUFPpLIYKdPcBGh9UY6h5yB2VZpYz
 0I3mLgYa0J4jUMnlcQuU+0BDoCsdKxjSFSowpNGnA9RgKMHR1clpBuocckJjudkA9S93MJFh
 8RwRspUauBdOqUf7CKpRPWJB9f/2E4Oqr3CjBvqSqbqqrwmqvjyVanqURlBlykImlaeYMioz
 RpnU7PgQg5puGSQo5bUqQNX3nIywOZy4K57mC2gphxbFigUJorggbnhUzAcxfv7ePA9eAHqP
 yxHxk+ggbuiHER57E4RGt7icY3xhsjEUwZfJuF7v75KKk+U0J14skwdxaYlAKPGVeMr4SbJk
 UZyniJYH8ry9ffyMwiOJ8cWna5iSidDPx6sqQBpoC8gBlixI+sKf035l5gArlg3ZBOAtQysw
 kzkApwvqLMxkHsCsxovYRklLaw9hTjQDmPnLM9xMMjBYc2fOqGKxCNId9qyyTHE7sgKH6Qu9
 DBPByVIGHH7yDTA9ZUsGw5HnStyEGaQLvDSWRpiK2eRO2Pt9lAlC0guqRq1NCktj9Gmfbk3N
 Jq1h1w96hgnj5FaouH52bQZITljC1VuXCfOkofCPphqmGdvCiY5rFmbsCJ+qMtfxcVj5bQVh
 Lv4KQPUDNTAngmFGtwo3DYGTrrBW62UOO8Oi7quYufFmmGfQr7vChprzG/htWFN7YX2GLfD+
 Qvo6pmD53F3MbJbS2Ku/hZkPOOpXFlK/spD6/9YXAF4FttASWVIcLfOT+Ijo4/99c6w4qQ6s
 nZBbmAb8/njGUwcwFtAByMK5dmxt2EmBDVvA/+IELRXHSJOFtEwH/Ix+n8Ed7WPFxhsUyWN4
 vgHevv7+/r4BO/x5XAf2O0FdsTZkHF9OJ9K0hJZu1GEsS8c0bL9D4CeNXxrsh7vkpYt7xos/
 fuboHr2kEAonU10IJ69PF1/6WB0DVs050YNaWX7q0dlDR4vpfWHS8KmUwsLOity0ot0h8pKC
 h0V1VMsY6n234c6OwwtHBJPV1dkPh18G8ZTN+5VO00kc1fwb2rdWrrjM/RVkbKHofz3zniyy
 /qPC7Q1v9v+dZZWQmnvXp8xzKc+zbzAKBp9hupC9T3LnBaJWzWtl27vGDmisX2xz7oj8M6Ry
 Hz916PlydvWLyEMrA+kxbPxg3u4T6dtUe0ZX4w/mBvPCfQKvK2Y2DdvZtq/sDEupvmSoLzgl
 PqU94Lz02dCPDnm3O2tSVmbs26P14TPnN3EZsng+zw2Xyvj/AnmzEAjLBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsWy7bCSvO77y7UpBie/GVmsP3WM2aJpwl9m
 i9V3+9ksXh/+xGgx7cNPZosnB9oZLX6fPc9scfkJn8WD/fYWe9/NZrW4eWAnk8WeRZOYLFau
 PspksXvhRyaLSYeuMVo8vTqLyWLvLW2LhW1LWCz27D3JYnF51xw2i/nLnrJbdF/fwWax/Pg/
 JotDk5uZLHY8aWS02PZ7PrPFutfvWSxO3JK2eNzdwWhx/u9xVovfP+awOch7XL7i7THr/lk2
 j52z7rJ7nL+3kcVj8wotj8tnSz02repk89i8pN5j980GNo/FfZNZPXqb3wFVtt5n9fj49BaL
 x/t9V9k8+rasYvTYfLo6QCiKyyYlNSezLLVI3y6BK2N60xrWglcuFU9XrWBsYDxs2cXIySEh
 YCKxb/9pti5GLg4hgd2MEv/PPGSHSEhKLPt7hBnCFpZY+e85O0RRM5PEs5tHWbsYOTjYBLQl
 Tv/nAImLCGxhljj7azIriMMssJ1FYsn6pawg3cIC9hJ3P/eBTWIRUJVY+riBDaSZV8Ba4syM
 YBBTQkBfov++IEgFJ1D05dlDzCBhIQEriavvbUDCvAKCEidnPmEBsZkF5CWat85mnsAoMAtJ
 ahaS1AJGplWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMEJQktzB+P2VR/0DjEycTAe
 YpTgYFYS4d3lVZ0ixJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQimCwT
 B6dUA9PO2Bkd5eIck7INnlrP6bnyleE0l0RO8JOfn/Z8NHP5HPjj1O5gZhUTH8XXJhkRf/Tf
 lCR9KLlexq1Y5fmObc9s5cblHt9y5iSaz55v9GzFooyLfKvtI+9nXch+I+1uKbre+q1R2803
 d8+v74usFP69IvpluAnLcmOFqoPBX+zvvDnBFGrX++U422xOP2+P07WBF/K/vlWeOWvt3POP
 Nhh9kPK6e+Z+R/DUhjlWHSlMv48aCMetKhNJZvGan5l3IvDetq+Ghaq3mpUlrO7sPJy28F2L
 s8DDzWdV6xecPS2ot0uh+e0jq+UsofeNza9ckCqLbsgJUVpWM9dJ0Hj+cttGEeETH5dF+HS8
 SK5RWa3EUpyRaKjFXFScCAD58AP4fwMAAA==
X-CMS-MailID: 20230605122416epcas5p3b37c08a7bf7ad57361b22be0f30d3bf7
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230605122416epcas5p3b37c08a7bf7ad57361b22be0f30d3bf7
References: <20230605121732.28468-1-nj.shetty@samsung.com>
 <CGME20230605122416epcas5p3b37c08a7bf7ad57361b22be0f30d3bf7@epcas5p3.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH v12 9/9] null_blk: add support for copy offload
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
Cc: Anuj Gupta <anuj20.g@samsung.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-nvme@lists.infradead.org, bvanassche@acm.org, linux-scsi@vger.kernel.org,
 Vincent Fu <vincent.fu@samsung.com>, djwong@kernel.org,
 nitheshshetty@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, ming.lei@redhat.com,
 linux-block@vger.kernel.org, dlemoal@kernel.org, martin.petersen@oracle.com,
 linux-fsdevel@vger.kernel.org, gost.dev@samsung.com,
 Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implementaion is based on existing read and write infrastructure.
copy_max_bytes: A new configfs and module parameter is introduced, which
can be used to set hardware/driver supported maximum copy limit.

Suggested-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Vincent Fu <vincent.fu@samsung.com>
---
 Documentation/block/null_blk.rst  |   5 ++
 drivers/block/null_blk/main.c     | 108 ++++++++++++++++++++++++++++--
 drivers/block/null_blk/null_blk.h |   8 +++
 3 files changed, 116 insertions(+), 5 deletions(-)

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
index b3fedafe301e..34e009b3ebd5 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -157,6 +157,10 @@ static int g_max_sectors;
 module_param_named(max_sectors, g_max_sectors, int, 0444);
 MODULE_PARM_DESC(max_sectors, "Maximum size of a command (in 512B sectors)");
 
+static unsigned long g_copy_max_bytes = COPY_MAX_BYTES;
+module_param_named(copy_max_bytes, g_copy_max_bytes, ulong, 0444);
+MODULE_PARM_DESC(copy_max_bytes, "Maximum size of a copy command (in bytes)");
+
 static unsigned int nr_devices = 1;
 module_param(nr_devices, uint, 0444);
 MODULE_PARM_DESC(nr_devices, "Number of devices to register");
@@ -409,6 +413,7 @@ NULLB_DEVICE_ATTR(home_node, uint, NULL);
 NULLB_DEVICE_ATTR(queue_mode, uint, NULL);
 NULLB_DEVICE_ATTR(blocksize, uint, NULL);
 NULLB_DEVICE_ATTR(max_sectors, uint, NULL);
+NULLB_DEVICE_ATTR(copy_max_bytes, uint, NULL);
 NULLB_DEVICE_ATTR(irqmode, uint, NULL);
 NULLB_DEVICE_ATTR(hw_queue_depth, uint, NULL);
 NULLB_DEVICE_ATTR(index, uint, NULL);
@@ -550,6 +555,7 @@ static struct configfs_attribute *nullb_device_attrs[] = {
 	&nullb_device_attr_queue_mode,
 	&nullb_device_attr_blocksize,
 	&nullb_device_attr_max_sectors,
+	&nullb_device_attr_copy_max_bytes,
 	&nullb_device_attr_irqmode,
 	&nullb_device_attr_hw_queue_depth,
 	&nullb_device_attr_index,
@@ -656,7 +662,8 @@ static ssize_t memb_group_features_show(struct config_item *item, char *page)
 			"poll_queues,power,queue_mode,shared_tag_bitmap,size,"
 			"submit_queues,use_per_node_hctx,virt_boundary,zoned,"
 			"zone_capacity,zone_max_active,zone_max_open,"
-			"zone_nr_conv,zone_offline,zone_readonly,zone_size\n");
+			"zone_nr_conv,zone_offline,zone_readonly,zone_size,"
+			"copy_max_bytes\n");
 }
 
 CONFIGFS_ATTR_RO(memb_group_, features);
@@ -722,6 +729,7 @@ static struct nullb_device *null_alloc_dev(void)
 	dev->queue_mode = g_queue_mode;
 	dev->blocksize = g_bs;
 	dev->max_sectors = g_max_sectors;
+	dev->copy_max_bytes = g_copy_max_bytes;
 	dev->irqmode = g_irqmode;
 	dev->hw_queue_depth = g_hw_queue_depth;
 	dev->blocking = g_blocking;
@@ -1271,6 +1279,78 @@ static int null_transfer(struct nullb *nullb, struct page *page,
 	return err;
 }
 
+static inline void nullb_setup_copy_read(struct nullb *nullb, struct bio *bio)
+{
+	struct nullb_copy_token *token = bvec_kmap_local(&bio->bi_io_vec[0]);
+
+	token->subsys = "nullb";
+	token->sector_in = bio->bi_iter.bi_sector;
+	token->nullb = nullb;
+	token->sectors = bio->bi_iter.bi_size >> SECTOR_SHIFT;
+}
+
+static inline int nullb_setup_copy_write(struct nullb *nullb,
+		struct bio *bio, bool is_fua)
+{
+	struct nullb_copy_token *token = bvec_kmap_local(&bio->bi_io_vec[0]);
+	sector_t sector_in, sector_out;
+	void *in, *out;
+	size_t rem, temp;
+	unsigned long offset_in, offset_out;
+	struct nullb_page *t_page_in, *t_page_out;
+	int ret = -EIO;
+
+	if (unlikely(memcmp(token->subsys, "nullb", 5)))
+		return -EINVAL;
+	if (unlikely(token->nullb != nullb))
+		return -EINVAL;
+	if (WARN_ON(token->sectors != bio->bi_iter.bi_size >> SECTOR_SHIFT))
+		return -EINVAL;
+
+	sector_in = token->sector_in;
+	sector_out = bio->bi_iter.bi_sector;
+	rem = token->sectors << SECTOR_SHIFT;
+
+	spin_lock_irq(&nullb->lock);
+	while (rem > 0) {
+		temp = min_t(size_t, nullb->dev->blocksize, rem);
+		offset_in = (sector_in & SECTOR_MASK) << SECTOR_SHIFT;
+		offset_out = (sector_out & SECTOR_MASK) << SECTOR_SHIFT;
+
+		if (null_cache_active(nullb) && !is_fua)
+			null_make_cache_space(nullb, PAGE_SIZE);
+
+		t_page_in = null_lookup_page(nullb, sector_in, false,
+			!null_cache_active(nullb));
+		if (!t_page_in)
+			goto err;
+		t_page_out = null_insert_page(nullb, sector_out,
+			!null_cache_active(nullb) || is_fua);
+		if (!t_page_out)
+			goto err;
+
+		in = kmap_local_page(t_page_in->page);
+		out = kmap_local_page(t_page_out->page);
+
+		memcpy(out + offset_out, in + offset_in, temp);
+		kunmap_local(out);
+		kunmap_local(in);
+		__set_bit(sector_out & SECTOR_MASK, t_page_out->bitmap);
+
+		if (is_fua)
+			null_free_sector(nullb, sector_out, true);
+
+		rem -= temp;
+		sector_in += temp >> SECTOR_SHIFT;
+		sector_out += temp >> SECTOR_SHIFT;
+	}
+
+	ret = 0;
+err:
+	spin_unlock_irq(&nullb->lock);
+	return ret;
+}
+
 static int null_handle_rq(struct nullb_cmd *cmd)
 {
 	struct request *rq = cmd->rq;
@@ -1280,13 +1360,20 @@ static int null_handle_rq(struct nullb_cmd *cmd)
 	sector_t sector = blk_rq_pos(rq);
 	struct req_iterator iter;
 	struct bio_vec bvec;
+	bool fua = rq->cmd_flags & REQ_FUA;
+
+	if (rq->cmd_flags & REQ_COPY) {
+		if (op_is_write(req_op(rq)))
+			return nullb_setup_copy_write(nullb, rq->bio, fua);
+		nullb_setup_copy_read(nullb, rq->bio);
+		return 0;
+	}
 
 	spin_lock_irq(&nullb->lock);
 	rq_for_each_segment(bvec, rq, iter) {
 		len = bvec.bv_len;
 		err = null_transfer(nullb, bvec.bv_page, len, bvec.bv_offset,
-				     op_is_write(req_op(rq)), sector,
-				     rq->cmd_flags & REQ_FUA);
+				     op_is_write(req_op(rq)), sector, fua);
 		if (err) {
 			spin_unlock_irq(&nullb->lock);
 			return err;
@@ -1307,13 +1394,20 @@ static int null_handle_bio(struct nullb_cmd *cmd)
 	sector_t sector = bio->bi_iter.bi_sector;
 	struct bio_vec bvec;
 	struct bvec_iter iter;
+	bool fua = bio->bi_opf & REQ_FUA;
+
+	if (bio->bi_opf & REQ_COPY) {
+		if (op_is_write(bio_op(bio)))
+			return nullb_setup_copy_write(nullb, bio, fua);
+		nullb_setup_copy_read(nullb, bio);
+		return 0;
+	}
 
 	spin_lock_irq(&nullb->lock);
 	bio_for_each_segment(bvec, bio, iter) {
 		len = bvec.bv_len;
 		err = null_transfer(nullb, bvec.bv_page, len, bvec.bv_offset,
-				     op_is_write(bio_op(bio)), sector,
-				     bio->bi_opf & REQ_FUA);
+				     op_is_write(bio_op(bio)), sector, fua);
 		if (err) {
 			spin_unlock_irq(&nullb->lock);
 			return err;
@@ -2161,6 +2255,10 @@ static int null_add_dev(struct nullb_device *dev)
 		dev->max_sectors = queue_max_hw_sectors(nullb->q);
 	dev->max_sectors = min(dev->max_sectors, BLK_DEF_MAX_SECTORS);
 	blk_queue_max_hw_sectors(nullb->q, dev->max_sectors);
+	blk_queue_max_copy_sectors_hw(nullb->q,
+			       dev->copy_max_bytes >> SECTOR_SHIFT);
+	if (dev->copy_max_bytes)
+		blk_queue_flag_set(QUEUE_FLAG_COPY, nullb->disk->queue);
 
 	if (dev->virt_boundary)
 		blk_queue_virt_boundary(nullb->q, PAGE_SIZE - 1);
diff --git a/drivers/block/null_blk/null_blk.h b/drivers/block/null_blk/null_blk.h
index 929f659dd255..3dda593b0747 100644
--- a/drivers/block/null_blk/null_blk.h
+++ b/drivers/block/null_blk/null_blk.h
@@ -67,6 +67,13 @@ enum {
 	NULL_Q_MQ	= 2,
 };
 
+struct nullb_copy_token {
+	char *subsys;
+	struct nullb *nullb;
+	sector_t sector_in;
+	sector_t sectors;
+};
+
 struct nullb_device {
 	struct nullb *nullb;
 	struct config_group group;
@@ -107,6 +114,7 @@ struct nullb_device {
 	unsigned int queue_mode; /* block interface */
 	unsigned int blocksize; /* block size */
 	unsigned int max_sectors; /* Max sectors per command */
+	unsigned long copy_max_bytes; /* Max copy offload length in bytes */
 	unsigned int irqmode; /* IRQ completion handler */
 	unsigned int hw_queue_depth; /* queue depth */
 	unsigned int index; /* index of the disk, only valid with a disk */
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

