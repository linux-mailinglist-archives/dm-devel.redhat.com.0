Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E54EA70D7F7
	for <lists+dm-devel@lfdr.de>; Tue, 23 May 2023 10:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684832163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=imLExTPdJ97UFy0p9LCRRfToygQRmnCVM/hAmI3/spY=;
	b=TXuNSjbsUngwiKO/sGewqDnkUAJm+m6H4m7dLmQQKW1WH5Pu8gpy+w8Bd0V0I3OWBLvs0+
	wt6CUgbieH3Ize1cDiLL6Lfw3hiJBs2sHsCUcSljSdT8kZa7yRr/J1UC4S1LvoF1aZ+bgh
	7VAiUZ39SWaFwDqWNHnyJPZne8AWieQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-4cI8xM07OCeF-gnxUXfVPg-1; Tue, 23 May 2023 04:55:09 -0400
X-MC-Unique: 4cI8xM07OCeF-gnxUXfVPg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06F893C17C6C;
	Tue, 23 May 2023 08:55:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E33DA492B0B;
	Tue, 23 May 2023 08:55:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9FA4F19465BC;
	Tue, 23 May 2023 08:55:04 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5B8B51946595
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 08:55:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EB8B40D1B62; Tue, 23 May 2023 08:55:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4770B40D1B60
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:55:03 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BB6F85A5AA
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:55:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-D5qF7dC4NbuQfI7eVM3fUg-1; Tue, 23 May 2023 04:55:01 -0400
X-MC-Unique: D5qF7dC4NbuQfI7eVM3fUg-1
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1Mj4-009HEh-16; Tue, 23 May 2023 07:46:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 23 May 2023 09:45:31 +0200
Message-Id: <20230523074535.249802-21-hch@lst.de>
In-Reply-To: <20230523074535.249802-1-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH 20/24] dm: only call early_lookup_bdev from early
 boot context
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Joern Engel <joern@lazybastard.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

early_lookup_bdev is supposed to only be called from the early boot
code, but dm_get_device calls it as a general fallback when lookup_bdev
fails, which is problematic because early_lookup_bdev bypasses all normal
path based permission checking, and might cause problems with certain
container environments renaming devices.

Switch to only call early_lookup_bdev when dm is built-in and the system
state in not running yet.  This means it is still available when tables
are constructed by dm-init.c from the kernel command line, but not
otherwise.

Note that this strictly speaking changes the kernel ABI as the PARTUUID=
and PARTLABEL= style syntax is now not available during a running
systems.  They never were intended for that, but this breaks things
we'll have to figure out a way to make them available again.  But if
avoidable in any way I'd rather avoid that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-table.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index e997f4322a9967..c230241a76b374 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -326,8 +326,11 @@ static int upgrade_mode(struct dm_dev_internal *dd, fmode_t new_mode,
 /*
  * Add a device to the list, or just increment the usage count if
  * it's already present.
+ *
+ * Note: the __ref annotation is because this function can call the __init
+ * marked early_lookup_bdev when called during early boot code from dm-init.c.
  */
-int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
+int __ref dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
 		  struct dm_dev **result)
 {
 	int r;
@@ -346,8 +349,10 @@ int dm_get_device(struct dm_target *ti, const char *path, fmode_t mode,
 			return -EOVERFLOW;
 	} else {
 		r = lookup_bdev(path, &dev);
-		if (r)
+#ifndef MODULE
+		if (r && system_state < SYSTEM_RUNNING)
 			r = early_lookup_bdev(path, &dev);
+#endif
 		if (r)
 			return -ENODEV;
 	}
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

