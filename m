Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31E727DDD
	for <lists+dm-devel@lfdr.de>; Thu,  8 Jun 2023 13:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686222288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LBkygzOl8S0blZ+vxp3QQt+V4Sbkha8kK2wKXEWSNf0=;
	b=J7VxEBbUplSD4rAQ8qTPouVJbdeZtjjgceSruyRmIpp18CiPsZW7cMVTERpS1OR8Bhj0qD
	WY4ckd/tFyF9n7pZz39P/9JEDwi13NnV0OtG5fkJw9PnhktJi0Fgixh6PudvgWAlEKVTz6
	XRbeVNT7Co6CYQ0AYiVCg4YOi71UVDs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-y_tuSEmXME2_KYn1bUKvXg-1; Thu, 08 Jun 2023 07:04:46 -0400
X-MC-Unique: y_tuSEmXME2_KYn1bUKvXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E83723C0F366;
	Thu,  8 Jun 2023 11:04:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1C0E140E957;
	Thu,  8 Jun 2023 11:04:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D9F9819451DB;
	Thu,  8 Jun 2023 11:04:37 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E89D719451C4
 for <dm-devel@listman.corp.redhat.com>; Thu,  8 Jun 2023 11:04:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB39F2026D6A; Thu,  8 Jun 2023 11:04:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3A792026D49
 for <dm-devel@redhat.com>; Thu,  8 Jun 2023 11:04:34 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B840885A5BE
 for <dm-devel@redhat.com>; Thu,  8 Jun 2023 11:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Z0FXRf_6MuSzvyb3y1KAKw-1; Thu, 08 Jun 2023 07:04:30 -0400
X-MC-Unique: Z0FXRf_6MuSzvyb3y1KAKw-1
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q7DR0-0092dV-19; Thu, 08 Jun 2023 11:04:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  8 Jun 2023 13:02:50 +0200
Message-Id: <20230608110258.189493-23-hch@lst.de>
In-Reply-To: <20230608110258.189493-1-hch@lst.de>
References: <20230608110258.189493-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH 22/30] mtd: block: use a simple bool to track
 open for write
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of propagating the fmode_t, just use a bool to track if a mtd
block device was opened for writing.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Christian Brauner <brauner@kernel.org>
Acked-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtd_blkdevs.c    | 2 +-
 drivers/mtd/mtdblock.c       | 2 +-
 include/linux/mtd/blktrans.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index f0bb09fde95e3a..bd0b7545364349 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -208,7 +208,7 @@ static int blktrans_open(struct gendisk *disk, fmode_t mode)
 	ret = __get_mtd_device(dev->mtd);
 	if (ret)
 		goto error_release;
-	dev->file_mode = mode;
+	dev->writable = mode & FMODE_WRITE;
 
 unlock:
 	dev->open++;
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index a0a1194dc1d902..fa476fb4dffb6c 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -294,7 +294,7 @@ static void mtdblock_release(struct mtd_blktrans_dev *mbd)
 		 * It was the last usage. Free the cache, but only sync if
 		 * opened for writing.
 		 */
-		if (mbd->file_mode & FMODE_WRITE)
+		if (mbd->writable)
 			mtd_sync(mbd->mtd);
 		vfree(mtdblk->cache_data);
 	}
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index 15cc9b95e32b52..6e471436bba556 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -34,7 +34,7 @@ struct mtd_blktrans_dev {
 	struct blk_mq_tag_set *tag_set;
 	spinlock_t queue_lock;
 	void *priv;
-	fmode_t file_mode;
+	bool writable;
 };
 
 struct mtd_blktrans_ops {
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

