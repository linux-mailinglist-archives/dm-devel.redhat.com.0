Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D60DB70D7F8
	for <lists+dm-devel@lfdr.de>; Tue, 23 May 2023 10:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684832163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jv0HNN4Q0MAghLboIHmdjhTZcl8it6uT1AslwJ+95KI=;
	b=AZkS0uKEeh6AbsGpzi/HW2mXimfuNzkipnwYiNpkXZDfXBhsVavfgQtdImBYQGHf+jeUs9
	20G2EDvxPgQ6Pb8UfvyUkhn9ajOSlkhZngplVQRkoxHqJ2FSkK7WwqYWLkY9EGVCegNGj5
	nthfLba9jXsnf4EU+IwES5zfQEylknU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-rQFJtXfMN4WQOo4z_VRYNQ-1; Tue, 23 May 2023 04:56:00 -0400
X-MC-Unique: rQFJtXfMN4WQOo4z_VRYNQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CA7A1C01E98;
	Tue, 23 May 2023 08:55:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0776C9D73;
	Tue, 23 May 2023 08:55:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8370319465BA;
	Tue, 23 May 2023 08:55:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 490BF1946595
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 08:55:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 22309140E95D; Tue, 23 May 2023 08:55:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AA79140EBB8
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:55:55 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F17CF811E78
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:55:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-tECTqtfAP4OOGR5Spw6ptw-1; Tue, 23 May 2023 04:55:50 -0400
X-MC-Unique: tECTqtfAP4OOGR5Spw6ptw-1
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1MiN-009GXt-1X; Tue, 23 May 2023 07:45:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 23 May 2023 09:45:16 +0200
Message-Id: <20230523074535.249802-6-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH 05/24] init: remove pointless Root_* values
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove all unused defines, and just use the expanded versions for
the scsi disk majors.

I've decided to keep Root_RAM0 even if it could be expanded as there
is a lot of special casing for it in the init code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/kernel/setup.c               | 2 +-
 arch/ia64/kernel/setup.c                | 2 +-
 arch/powerpc/platforms/powermac/setup.c | 3 ++-
 include/linux/root_dev.h                | 8 --------
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 33bf3a62700270..b650ff1cb022ee 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -658,7 +658,7 @@ setup_arch(char **cmdline_p)
 #endif
 
 	/* Default root filesystem to sda2.  */
-	ROOT_DEV = Root_SDA2;
+	ROOT_DEV = MKDEV(SCSI_DISK0_MAJOR, 2);
 
 #ifdef CONFIG_EISA
 	/* FIXME:  only set this when we actually have EISA in this box? */
diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
index c0572804427275..becdb4f33c2195 100644
--- a/arch/ia64/kernel/setup.c
+++ b/arch/ia64/kernel/setup.c
@@ -627,7 +627,7 @@ setup_arch (char **cmdline_p)
 	 * is physical disk 1 partition 1 and the Linux root disk is
 	 * physical disk 1 partition 2.
 	 */
-	ROOT_DEV = Root_SDA2;		/* default to second partition on first drive */
+	ROOT_DEV = MKDEV(SCSI_DISK0_MAJOR, 2);
 
 	if (is_uv_system())
 		uv_setup(cmdline_p);
diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index 193cc9c394221b..0c41f4b005bcf3 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -76,7 +76,8 @@ int pmac_newworld;
 
 static int current_root_goodness = -1;
 
-#define DEFAULT_ROOT_DEVICE Root_SDA1	/* sda1 - slightly silly choice */
+/* sda1 - slightly silly choice */
+#define DEFAULT_ROOT_DEVICE	MKDEV(SCSI_DISK0_MAJOR, 1)
 
 sys_ctrler_t sys_ctrler = SYS_CTRLER_UNKNOWN;
 EXPORT_SYMBOL(sys_ctrler);
diff --git a/include/linux/root_dev.h b/include/linux/root_dev.h
index 4e78651371ba92..ed3ea8da642972 100644
--- a/include/linux/root_dev.h
+++ b/include/linux/root_dev.h
@@ -10,14 +10,6 @@ enum {
 	Root_NFS = MKDEV(UNNAMED_MAJOR, 255),
 	Root_CIFS = MKDEV(UNNAMED_MAJOR, 254),
 	Root_RAM0 = MKDEV(RAMDISK_MAJOR, 0),
-	Root_RAM1 = MKDEV(RAMDISK_MAJOR, 1),
-	Root_FD0 = MKDEV(FLOPPY_MAJOR, 0),
-	Root_HDA1 = MKDEV(IDE0_MAJOR, 1),
-	Root_HDA2 = MKDEV(IDE0_MAJOR, 2),
-	Root_SDA1 = MKDEV(SCSI_DISK0_MAJOR, 1),
-	Root_SDA2 = MKDEV(SCSI_DISK0_MAJOR, 2),
-	Root_HDC1 = MKDEV(IDE1_MAJOR, 1),
-	Root_SR0 = MKDEV(SCSI_CDROM_MAJOR, 0),
 };
 
 extern dev_t ROOT_DEV;
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

