Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13E7184BC
	for <lists+dm-devel@lfdr.de>; Wed, 31 May 2023 16:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685542912;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1DwCwT88Ebo+BB66dCstIexDOHLVQuP1wOuBLbl5CJw=;
	b=HHG/YUtV4I0KXrzKIkfPs5XLk9sXmkuxT1n0mfQrHNNFACSOLuiHYZdjpUCHwKxJ+5iyHZ
	koGAIQogmTcKTEgVf+FIVeLEZhMehRME8h6a1lqN57rha88ppk/zluIV4+o4jCWKDTcNf7
	+HQrEQnPMyBKlfGN5RCrKuwPd3MUdKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-avxfqv7XPuiz89VsXDIQng-1; Wed, 31 May 2023 10:21:51 -0400
X-MC-Unique: avxfqv7XPuiz89VsXDIQng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E9C0101A52C;
	Wed, 31 May 2023 14:21:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A406140E965;
	Wed, 31 May 2023 14:21:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4695B19451CA;
	Wed, 31 May 2023 14:21:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 462211946595
 for <dm-devel@listman.corp.redhat.com>; Wed, 31 May 2023 13:53:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F99140CFD46; Wed, 31 May 2023 13:53:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1877A40CFD45
 for <dm-devel@redhat.com>; Wed, 31 May 2023 13:53:45 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E330B185A78B
 for <dm-devel@redhat.com>; Wed, 31 May 2023 13:53:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-c5zkwAhhOTSzVhg085eenQ-1; Wed, 31 May 2023 09:53:43 -0400
X-MC-Unique: c5zkwAhhOTSzVhg085eenQ-1
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4LNG-00HRDS-1i; Wed, 31 May 2023 12:56:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 14:55:19 +0200
Message-Id: <20230531125535.676098-9-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [PATCH 08/24] init: pass root_device_name explicitly
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of declaring root_device_name as a global variable pass it as an
argument to the functions using it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c        | 29 ++++++++++++++++-------------
 init/do_mounts.h        | 14 +++++++-------
 init/do_mounts_initrd.c | 11 ++++++-----
 3 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index e708b02d9d6566..1405ee7218bf00 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -28,7 +28,6 @@
 #include "do_mounts.h"
 
 int root_mountflags = MS_RDONLY | MS_SILENT;
-static char * __initdata root_device_name;
 static char __initdata saved_root_name[64];
 static int root_wait;
 
@@ -391,7 +390,7 @@ static int __init do_mount_root(const char *name, const char *fs,
 	return ret;
 }
 
-void __init mount_root_generic(char *name, int flags)
+void __init mount_root_generic(char *name, char *pretty_name, int flags)
 {
 	struct page *page = alloc_page(GFP_KERNEL);
 	char *fs_names = page_address(page);
@@ -425,7 +424,7 @@ void __init mount_root_generic(char *name, int flags)
 		 * and give them a list of the available devices
 		 */
 		printk("VFS: Cannot open root device \"%s\" or %s: error %d\n",
-				root_device_name, b, err);
+				pretty_name, b, err);
 		printk("Please append a correct \"root=\" boot option; here are the available partitions:\n");
 
 		printk_all_partitions();
@@ -541,7 +540,7 @@ static bool __init fs_is_nodev(char *fstype)
 	return ret;
 }
 
-static int __init mount_nodev_root(void)
+static int __init mount_nodev_root(char *root_device_name)
 {
 	char *fs_names, *fstype;
 	int err = -EINVAL;
@@ -569,21 +568,21 @@ static int __init mount_nodev_root(void)
 }
 
 #ifdef CONFIG_BLOCK
-static void __init mount_block_root(void)
+static void __init mount_block_root(char *root_device_name)
 {
 	int err = create_dev("/dev/root", ROOT_DEV);
 
 	if (err < 0)
 		pr_emerg("Failed to create /dev/root: %d\n", err);
-	mount_root_generic("/dev/root", root_mountflags);
+	mount_root_generic("/dev/root", root_device_name, root_mountflags);
 }
 #else
-static inline void mount_block_root(void)
+static inline void mount_block_root(char *root_device_name)
 {
 }
 #endif /* CONFIG_BLOCK */
 
-void __init mount_root(void)
+void __init mount_root(char *root_device_name)
 {
 	switch (ROOT_DEV) {
 	case Root_NFS:
@@ -593,11 +592,12 @@ void __init mount_root(void)
 		mount_cifs_root();
 		break;
 	case 0:
-		if (root_device_name && root_fs_names && mount_nodev_root() == 0)
+		if (root_device_name && root_fs_names &&
+		    mount_nodev_root(root_device_name) == 0)
 			break;
 		fallthrough;
 	default:
-		mount_block_root();
+		mount_block_root(root_device_name);
 		break;
 	}
 }
@@ -607,6 +607,8 @@ void __init mount_root(void)
  */
 void __init prepare_namespace(void)
 {
+	char *root_device_name;
+
 	if (root_delay) {
 		printk(KERN_INFO "Waiting %d sec before mounting root device...\n",
 		       root_delay);
@@ -628,7 +630,8 @@ void __init prepare_namespace(void)
 		root_device_name = saved_root_name;
 		if (!strncmp(root_device_name, "mtd", 3) ||
 		    !strncmp(root_device_name, "ubi", 3)) {
-			mount_root_generic(root_device_name, root_mountflags);
+			mount_root_generic(root_device_name, root_device_name,
+					   root_mountflags);
 			goto out;
 		}
 		ROOT_DEV = name_to_dev_t(root_device_name);
@@ -636,7 +639,7 @@ void __init prepare_namespace(void)
 			root_device_name += 5;
 	}
 
-	if (initrd_load())
+	if (initrd_load(root_device_name))
 		goto out;
 
 	/* wait for any asynchronous scanning to complete */
@@ -649,7 +652,7 @@ void __init prepare_namespace(void)
 		async_synchronize_full();
 	}
 
-	mount_root();
+	mount_root(root_device_name);
 out:
 	devtmpfs_mount();
 	init_mount(".", "/", NULL, MS_MOVE, NULL);
diff --git a/init/do_mounts.h b/init/do_mounts.h
index 33623025f6951a..15e372b00ce704 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -10,8 +10,8 @@
 #include <linux/root_dev.h>
 #include <linux/init_syscalls.h>
 
-void  mount_root_generic(char *name, int flags);
-void  mount_root(void);
+void  mount_root_generic(char *name, char *pretty_name, int flags);
+void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
 static inline __init int create_dev(char *name, dev_t dev)
@@ -33,11 +33,11 @@ static inline int rd_load_image(char *from) { return 0; }
 #endif
 
 #ifdef CONFIG_BLK_DEV_INITRD
-
-bool __init initrd_load(void);
-
+bool __init initrd_load(char *root_device_name);
 #else
-
-static inline bool initrd_load(void) { return false; }
+static inline bool initrd_load(char *root_device_name)
+{
+	return false;
+	}
 
 #endif
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 686d1ff3af4bb1..425f4bcf4b77e0 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -83,7 +83,7 @@ static int __init init_linuxrc(struct subprocess_info *info, struct cred *new)
 	return 0;
 }
 
-static void __init handle_initrd(void)
+static void __init handle_initrd(char *root_device_name)
 {
 	struct subprocess_info *info;
 	static char *argv[] = { "linuxrc", NULL, };
@@ -95,7 +95,8 @@ static void __init handle_initrd(void)
 	real_root_dev = new_encode_dev(ROOT_DEV);
 	create_dev("/dev/root.old", Root_RAM0);
 	/* mount initrd on rootfs' /root */
-	mount_root_generic("/dev/root.old", root_mountflags & ~MS_RDONLY);
+	mount_root_generic("/dev/root.old", root_device_name,
+			   root_mountflags & ~MS_RDONLY);
 	init_mkdir("/old", 0700);
 	init_chdir("/old");
 
@@ -117,7 +118,7 @@ static void __init handle_initrd(void)
 
 	init_chdir("/");
 	ROOT_DEV = new_decode_dev(real_root_dev);
-	mount_root();
+	mount_root(root_device_name);
 
 	printk(KERN_NOTICE "Trying to move old root to /initrd ... ");
 	error = init_mount("/old", "/root/initrd", NULL, MS_MOVE, NULL);
@@ -133,7 +134,7 @@ static void __init handle_initrd(void)
 	}
 }
 
-bool __init initrd_load(void)
+bool __init initrd_load(char *root_device_name)
 {
 	if (mount_initrd) {
 		create_dev("/dev/ram", Root_RAM0);
@@ -145,7 +146,7 @@ bool __init initrd_load(void)
 		 */
 		if (rd_load_image("/initrd.image") && ROOT_DEV != Root_RAM0) {
 			init_unlink("/initrd.image");
-			handle_initrd();
+			handle_initrd(root_device_name);
 			return true;
 		}
 	}
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

