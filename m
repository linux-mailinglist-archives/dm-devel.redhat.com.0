Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.145.221.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA00462547E
	for <lists+dm-devel@lfdr.de>; Fri, 11 Nov 2022 08:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668152412;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1C4f4rFFEbUEThdOj0BRT1S8oGuS4COo6yrErBQSmN0=;
	b=fzgiT+VxY1aEOoLVGo5UVHyBoV1WbYpHOPYF3Eh6TsnjBtHPxai1uaaQbo6LiJHXfHP9I2
	oKbn0aTYREqZ9gQ7NXhSk4QjNx9rNH5QVPh2FbCmAursdjOSsbW7DAuBtS9ISEmxrBE04S
	EpXQrrJKO/tWzzcHrbFSl1scdckBSfM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-N085g7ixMdm71sN2hpKQyw-1; Fri, 11 Nov 2022 02:39:28 -0500
X-MC-Unique: N085g7ixMdm71sN2hpKQyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 373CA8630C4;
	Fri, 11 Nov 2022 07:39:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27464200BA7C;
	Fri, 11 Nov 2022 07:39:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 140591946A48;
	Fri, 11 Nov 2022 07:39:22 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 148241946587
 for <dm-devel@listman.corp.redhat.com>; Thu, 10 Nov 2022 18:45:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E66284B4010; Thu, 10 Nov 2022 18:45:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE0D54B400F
 for <dm-devel@redhat.com>; Thu, 10 Nov 2022 18:45:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF3A93C0F236
 for <dm-devel@redhat.com>; Thu, 10 Nov 2022 18:45:57 +0000 (UTC)
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-IK__jym1NJ6U8uzRzJDKoQ-1; Thu, 10 Nov 2022 13:45:50 -0500
X-MC-Unique: IK__jym1NJ6U8uzRzJDKoQ-1
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 2AAIf4Zv024716
 for <dm-devel@redhat.com>; Thu, 10 Nov 2022 10:45:50 -0800
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3krmwrferb-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dm-devel@redhat.com>; Thu, 10 Nov 2022 10:45:50 -0800
Received: from twshared27579.05.ash9.facebook.com (2620:10d:c085:108::8) by
 mail.thefacebook.com (2620:10d:c085:21d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 10:45:33 -0800
Received: by devbig007.nao1.facebook.com (Postfix, from userid 544533)
 id C6B08B08CDEB; Thu, 10 Nov 2022 10:45:03 -0800 (PST)
From: Keith Busch <kbusch@meta.com>
To: <linux-block@vger.kernel.org>, <dm-devel@redhat.com>, <axboe@kernel.dk>
Date: Thu, 10 Nov 2022 10:44:59 -0800
Message-ID: <20221110184501.2451620-4-kbusch@meta.com>
In-Reply-To: <20221110184501.2451620-1-kbusch@meta.com>
References: <20221110184501.2451620-1-kbusch@meta.com>
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-GUID: pU1loyxT7PB5BK1NwxGzRCyEkIsF4eQR
X-Proofpoint-ORIG-GUID: pU1loyxT7PB5BK1NwxGzRCyEkIsF4eQR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_12,2022-11-09_01,2022-06-22_01
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Fri, 11 Nov 2022 07:39:20 +0000
Subject: [dm-devel] [PATCHv2 3/5] block: make blk_set_default_limits()
 private
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
Cc: Christoph Hellwig <hch@lst.de>, ebiggers@kernel.org, mpatocka@redhat.com,
 stefanha@redhat.com, Keith Busch <kbusch@kernel.org>, me@demsh.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Keith Busch <kbusch@kernel.org>

There are no external users of this function.

Signed-off-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c   | 1 -
 block/blk.h            | 1 +
 include/linux/blkdev.h | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 4949ed3ce7c9..8ac1038d0c79 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -59,7 +59,6 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->zone_write_granularity = 0;
 	lim->dma_alignment = 511;
 }
-EXPORT_SYMBOL(blk_set_default_limits);
 
 /**
  * blk_set_stacking_limits - set default limits for stacking devices
diff --git a/block/blk.h b/block/blk.h
index d6ea0d1a6db0..a186ea20f39d 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -331,6 +331,7 @@ void blk_rq_set_mixed_merge(struct request *rq);
 bool blk_rq_merge_ok(struct request *rq, struct bio *bio);
 enum elv_merge blk_try_merge(struct request *rq, struct bio *bio);
 
+void blk_set_default_limits(struct queue_limits *lim);
 int blk_dev_init(void);
 
 /*
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 9898e34b2c2d..891f8cbcd043 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -945,7 +945,6 @@ extern void blk_queue_io_min(struct request_queue *q, unsigned int min);
 extern void blk_limits_io_opt(struct queue_limits *limits, unsigned int opt);
 extern void blk_queue_io_opt(struct request_queue *q, unsigned int opt);
 extern void blk_set_queue_depth(struct request_queue *q, unsigned int depth);
-extern void blk_set_default_limits(struct queue_limits *lim);
 extern void blk_set_stacking_limits(struct queue_limits *lim);
 extern int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 			    sector_t offset);
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

