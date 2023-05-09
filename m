Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F436FBC4D
	for <lists+dm-devel@lfdr.de>; Tue,  9 May 2023 03:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683594418;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QaWl6Tz+dlG+qVbZWeLAg8/zd/OveeyZe+QYrbG1jBY=;
	b=NLHAXGJCzWGfzqozomweHe6BjJ3Y/jYd0UqyqEcImOflTzK6qrX0waNi+awCE2BeL4A9nr
	1hNJGwBGV4rCKQf2fD3VLsNd9l3H5Ezwm0T2M5mYpNddZvfWJpnAAokDt2zP1BomYl1BSR
	8j0HqYMLTd+1U3RwLoo5ICvs/n+V0nk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-Ll6bO1F_NJugc4KMJbVzew-1; Mon, 08 May 2023 21:06:54 -0400
X-MC-Unique: Ll6bO1F_NJugc4KMJbVzew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0528B811E7C;
	Tue,  9 May 2023 01:06:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E92F63F86;
	Tue,  9 May 2023 01:06:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4BF0719452C5;
	Tue,  9 May 2023 01:06:51 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6227B19452C5
 for <dm-devel@listman.corp.redhat.com>; Tue,  9 May 2023 01:06:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54836492B08; Tue,  9 May 2023 01:06:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost.localdomain (unknown [10.22.11.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EA7C492C13;
 Tue,  9 May 2023 01:06:48 +0000 (UTC)
From: "J. corwin Coburn" <corwin@redhat.com>
To: dm-devel@redhat.com,
	linux-block@vger.kernel.org
Date: Mon,  8 May 2023 21:05:45 -0400
Message-Id: <20230509010545.72448-6-corwin@redhat.com>
In-Reply-To: <20230509010545.72448-1-corwin@redhat.com>
References: <20230509010545.72448-1-corwin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [dm-devel] [PATCH 5/5] Enable configuration and building of dm-vdo.
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
Cc: corwin <corwin@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: corwin <corwin@redhat.com>

This adds dm-vdo to the drivers/md Kconfig and Makefile.

Signed-off-by: corwin <corwin@redhat.com>
---
 drivers/md/Kconfig  | 16 ++++++++++++++++
 drivers/md/Makefile |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index b0a22e99bad..9fa9dec1029 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -521,6 +521,22 @@ config DM_FLAKEY
 	help
 	 A target that intermittently fails I/O for debugging purposes.
 
+config DM_VDO
+	tristate "VDO: deduplication and compression target"
+	depends on 64BIT
+	depends on BLK_DEV_DM
+	select DM_BUFIO
+	select LZ4_COMPRESS
+	select LZ4_DECOMPRESS
+	help
+	  This device mapper target presents a block device with
+	  deduplication, compression and thin-provisioning.
+
+	  To compile this code as a module, choose M here: the module will
+	  be called dm-vdo.
+
+	  If unsure, say N.
+
 config DM_VERITY
 	tristate "Verity target support"
 	depends on BLK_DEV_DM
diff --git a/drivers/md/Makefile b/drivers/md/Makefile
index 84291e38dca..47444b393ab 100644
--- a/drivers/md/Makefile
+++ b/drivers/md/Makefile
@@ -25,6 +25,7 @@ dm-ebs-y	+= dm-ebs-target.o
 dm-era-y	+= dm-era-target.o
 dm-clone-y	+= dm-clone-target.o dm-clone-metadata.o
 dm-verity-y	+= dm-verity-target.o
+dm-vdo-y	+= dm-vdo-target.o $(patsubst drivers/md/dm-vdo/%.c,dm-vdo/%.o,$(wildcard $(src)/dm-vdo/*.c))
 dm-zoned-y	+= dm-zoned-target.o dm-zoned-metadata.o dm-zoned-reclaim.o
 
 md-mod-y	+= md.o md-bitmap.o
@@ -74,6 +75,7 @@ obj-$(CONFIG_DM_ZERO)		+= dm-zero.o
 obj-$(CONFIG_DM_RAID)		+= dm-raid.o
 obj-$(CONFIG_DM_THIN_PROVISIONING) += dm-thin-pool.o
 obj-$(CONFIG_DM_VERITY)		+= dm-verity.o
+obj-$(CONFIG_DM_VDO)            += dm-vdo.o
 obj-$(CONFIG_DM_CACHE)		+= dm-cache.o
 obj-$(CONFIG_DM_CACHE_SMQ)	+= dm-cache-smq.o
 obj-$(CONFIG_DM_EBS)		+= dm-ebs.o
-- 
2.40.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

