Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BCE718175
	for <lists+dm-devel@lfdr.de>; Wed, 31 May 2023 15:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685539410;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KuC6Ai2uhq8Sw+nHSjatgpknpgw0ZbQhmnuOkNMUUoc=;
	b=CMBuO7rzIWH9CkNX9cehgIqdMs8ZnvtEQP3BFJQNgV5VM+hWmm3A/OUdARHdeCzTnBxSTg
	mXhTimn/tQocDd0VPfr8Khh3cXWrqbmw6aLDffmz1X8FpEWaQPR7PshAq6Hnf3RytFiRlr
	z72jZJDuTGME8Mx1Qq1uGEQde2z1dws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-yVxG6Gx4P-KErZfg5xaGHQ-1; Wed, 31 May 2023 09:23:28 -0400
X-MC-Unique: yVxG6Gx4P-KErZfg5xaGHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2221811E91;
	Wed, 31 May 2023 13:23:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D589407DEC0;
	Wed, 31 May 2023 13:23:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E1A861946A44;
	Wed, 31 May 2023 13:23:24 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 41C601946595
 for <dm-devel@listman.corp.redhat.com>; Wed, 31 May 2023 12:57:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 20435400DFF; Wed, 31 May 2023 12:57:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17A9B492B00
 for <dm-devel@redhat.com>; Wed, 31 May 2023 12:57:50 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F07A485A5A8
 for <dm-devel@redhat.com>; Wed, 31 May 2023 12:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-bgfsIfOPOjGAhNVZns80_g-1; Wed, 31 May 2023 08:57:47 -0400
X-MC-Unique: bgfsIfOPOjGAhNVZns80_g-1
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4LOV-00HSJ1-14; Wed, 31 May 2023 12:57:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 14:55:35 +0200
Message-Id: <20230531125535.676098-25-hch@lst.de>
In-Reply-To: <20230531125535.676098-1-hch@lst.de>
References: <20230531125535.676098-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [dm-devel] [PATCH 24/24] block: mark early_lookup_bdev as __init
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
Cc: Loic Poulain <loic.poulain@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Joern Engel <joern@lazybastard.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

early_lookup_bdev is now only used during the early boot code as it
should, so mark it __init to not waste run time memory on it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/early-lookup.c   | 19 +++++++++----------
 include/linux/blkdev.h |  2 +-
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/block/early-lookup.c b/block/early-lookup.c
index 6016e781b6a0e2..3ff0d2e4dcbfb8 100644
--- a/block/early-lookup.c
+++ b/block/early-lookup.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Code for looking up block devices in the early boot code before mounting the
- * root file system.  Unfortunately currently also abused in a few other places.
+ * root file system.
  */
 #include <linux/blkdev.h>
 #include <linux/ctype.h>
@@ -18,7 +18,7 @@ struct uuidcmp {
  *
  * Returns 1 if the device matches, and 0 otherwise.
  */
-static int match_dev_by_uuid(struct device *dev, const void *data)
+static int __init match_dev_by_uuid(struct device *dev, const void *data)
 {
 	struct block_device *bdev = dev_to_bdev(dev);
 	const struct uuidcmp *cmp = data;
@@ -42,7 +42,7 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
  *
  * Returns the matching dev_t on success or 0 on failure.
  */
-static int devt_from_partuuid(const char *uuid_str, dev_t *devt)
+static int __init devt_from_partuuid(const char *uuid_str, dev_t *devt)
 {
 	struct uuidcmp cmp;
 	struct device *dev = NULL;
@@ -98,7 +98,7 @@ static int devt_from_partuuid(const char *uuid_str, dev_t *devt)
  *
  * Returns 1 if the device matches, and 0 otherwise.
  */
-static int match_dev_by_label(struct device *dev, const void *data)
+static int __init match_dev_by_label(struct device *dev, const void *data)
 {
 	struct block_device *bdev = dev_to_bdev(dev);
 	const char *label = data;
@@ -108,7 +108,7 @@ static int match_dev_by_label(struct device *dev, const void *data)
 	return 1;
 }
 
-static int devt_from_partlabel(const char *label, dev_t *devt)
+static int __init devt_from_partlabel(const char *label, dev_t *devt)
 {
 	struct device *dev;
 
@@ -120,7 +120,7 @@ static int devt_from_partlabel(const char *label, dev_t *devt)
 	return 0;
 }
 
-static dev_t blk_lookup_devt(const char *name, int partno)
+static dev_t __init blk_lookup_devt(const char *name, int partno)
 {
 	dev_t devt = MKDEV(0, 0);
 	struct class_dev_iter iter;
@@ -149,7 +149,7 @@ static dev_t blk_lookup_devt(const char *name, int partno)
 	return devt;
 }
 
-static int devt_from_devname(const char *name, dev_t *devt)
+static int __init devt_from_devname(const char *name, dev_t *devt)
 {
 	int part;
 	char s[32];
@@ -193,7 +193,7 @@ static int devt_from_devname(const char *name, dev_t *devt)
 	return -EINVAL;
 }
 
-static int devt_from_devnum(const char *name, dev_t *devt)
+static int __init devt_from_devnum(const char *name, dev_t *devt)
 {
 	unsigned maj, min, offset;
 	char *p, dummy;
@@ -240,7 +240,7 @@ static int devt_from_devnum(const char *name, dev_t *devt)
  *	name contains slashes, the device name has them replaced with
  *	bangs.
  */
-int early_lookup_bdev(const char *name, dev_t *devt)
+int __init early_lookup_bdev(const char *name, dev_t *devt)
 {
 	if (strncmp(name, "PARTUUID=", 9) == 0)
 		return devt_from_partuuid(name + 9, devt);
@@ -250,7 +250,6 @@ int early_lookup_bdev(const char *name, dev_t *devt)
 		return devt_from_devname(name + 5, devt);
 	return devt_from_devnum(name, devt);
 }
-EXPORT_SYMBOL_GPL(early_lookup_bdev);
 
 static char __init *bdevt_str(dev_t devt, char *buf)
 {
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 0ce09ecfa3a7af..ca84a135ddc80f 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1494,7 +1494,7 @@ int sync_blockdev_nowait(struct block_device *bdev);
 void sync_bdevs(bool wait);
 void bdev_statx_dioalign(struct inode *inode, struct kstat *stat);
 void printk_all_partitions(void);
-int early_lookup_bdev(const char *pathname, dev_t *dev);
+int __init early_lookup_bdev(const char *pathname, dev_t *dev);
 #else
 static inline void invalidate_bdev(struct block_device *bdev)
 {
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

