Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CBC70D7F9
	for <lists+dm-devel@lfdr.de>; Tue, 23 May 2023 10:56:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684832164;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FzNtdhcsZYCTXbnBM7kho4Abm+ERTMdt+41Xys4MFAc=;
	b=fNaHDiFs4Y8/+hd/JKXo3Lt6cEB3Y6JHYrpls9iK8zOphGZ9NQtHRk7DnCc+MtKD0W05sn
	bjlCDnZyslNLLjwXHHz/IW8gjlOQEs/GY/aprW1ahsGyZD7r3S8jslIQuDSL41phqXKJDs
	D/sv1AZ4DEm52k22PpFpP/VtTfTo6aM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-uQXMHvDpOLmDB0c6FC9qGg-1; Tue, 23 May 2023 04:56:00 -0400
X-MC-Unique: uQXMHvDpOLmDB0c6FC9qGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 557553C17C68;
	Tue, 23 May 2023 08:55:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D11F40D1B63;
	Tue, 23 May 2023 08:55:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC08819465BA;
	Tue, 23 May 2023 08:55:57 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 02DFB1946595
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 08:55:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BFAA4492B0B; Tue, 23 May 2023 08:55:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8102492B0A
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:55:56 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 967E385A5B5
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-DkC_SEwXPB6zp6G_a37qBw-1; Tue, 23 May 2023 04:55:54 -0400
X-MC-Unique: DkC_SEwXPB6zp6G_a37qBw-1
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1Mij-009GsI-0p; Tue, 23 May 2023 07:46:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 23 May 2023 09:45:24 +0200
Message-Id: <20230523074535.249802-14-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [dm-devel] [PATCH 13/24] init: improve the name_to_dev_t interface
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

name_to_dev_t has a very misleading name, that doesn't make clear
it should only be used by the early init code, and also has a bad
calling convention that doesn't allow returning different kinds of
errors.  Rename it to early_lookup_bdev to make the use case clear,
and return an errno, where -EINVAL means the string could not be
parsed, and -ENODEV means it the string was valid, but there was
no device found for it.

Also stub out the whole call for !CONFIG_BLOCK as all the non-block
root cases are always covered in the caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 .../admin-guide/kernel-parameters.txt         |   2 +-
 drivers/md/dm-table.c                         |   5 +-
 drivers/md/md-autodetect.c                    |   3 +-
 drivers/mtd/devices/block2mtd.c               |   3 +-
 fs/pstore/blk.c                               |   4 +-
 include/linux/blkdev.h                        |   5 +
 include/linux/mount.h                         |   1 -
 init/do_mounts.c                              | 102 +++++++++---------
 kernel/power/hibernate.c                      |  22 ++--
 9 files changed, 73 insertions(+), 74 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9e5bab29685ff0..f08b83e62c6222 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5452,7 +5452,7 @@
 			port and the regular usb controller gets disabled.
 
 	root=		[KNL] Root filesystem
-			See name_to_dev_t comment in init/do_mounts.c.
+			See early_lookup_bdev comment in init/do_mounts.c.
 
 	rootdelay=	[KNL] Delay (in seconds) to pause before attempting to
 			mount the root filesystem
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 1398f1d6e83e7f..05aa16da43b0d5 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -330,8 +330,9 @@ dev_t dm_get_dev_t(const char *path)
 {
 	dev_t dev;
 
-	if (lookup_bdev(path, &dev))
-		dev = name_to_dev_t(path);
+	if (lookup_bdev(path, &dev) &&
+	    early_lookup_bdev(path, &dev))
+		return 0;
 	return dev;
 }
 EXPORT_SYMBOL_GPL(dm_get_dev_t);
diff --git a/drivers/md/md-autodetect.c b/drivers/md/md-autodetect.c
index 91836e6de3260f..6eaa0eab40f962 100644
--- a/drivers/md/md-autodetect.c
+++ b/drivers/md/md-autodetect.c
@@ -147,7 +147,8 @@ static void __init md_setup_drive(struct md_setup_args *args)
 		if (p)
 			*p++ = 0;
 
-		dev = name_to_dev_t(devname);
+		if (early_lookup_bdev(devname, &dev))
+			dev = 0;
 		if (strncmp(devname, "/dev/", 5) == 0)
 			devname += 5;
 		snprintf(comp_name, 63, "/dev/%s", devname);
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 4cd37ec45762b6..4c21e9f13bead5 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -254,8 +254,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 			msleep(1000);
 		wait_for_device_probe();
 
-		devt = name_to_dev_t(devname);
-		if (!devt)
+		if (early_lookup_bdev(devname, &devt))
 			continue;
 		bdev = blkdev_get_by_dev(devt, mode, dev);
 	}
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 4ae0cfcd15f20b..de8cf5d75f34d5 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -263,9 +263,9 @@ static __init const char *early_boot_devpath(const char *initial_devname)
 	 * same scheme to find the device that we use for mounting
 	 * the root file system.
 	 */
-	dev_t dev = name_to_dev_t(initial_devname);
+	dev_t dev;
 
-	if (!dev) {
+	if (early_lookup_bdev(initial_devname, &dev)) {
 		pr_err("failed to resolve '%s'!\n", initial_devname);
 		return initial_devname;
 	}
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index fe99948688dfda..dd00e9cf840da5 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1494,6 +1494,7 @@ int sync_blockdev_nowait(struct block_device *bdev);
 void sync_bdevs(bool wait);
 void bdev_statx_dioalign(struct inode *inode, struct kstat *stat);
 void printk_all_partitions(void);
+int early_lookup_bdev(const char *pathname, dev_t *dev);
 #else
 static inline void invalidate_bdev(struct block_device *bdev)
 {
@@ -1515,6 +1516,10 @@ static inline void bdev_statx_dioalign(struct inode *inode, struct kstat *stat)
 static inline void printk_all_partitions(void)
 {
 }
+static inline int early_lookup_bdev(const char *pathname, dev_t *dev)
+{
+	return -EINVAL;
+}
 #endif /* CONFIG_BLOCK */
 
 int fsync_bdev(struct block_device *bdev);
diff --git a/include/linux/mount.h b/include/linux/mount.h
index 1ea326c368f726..4b81ea90440e45 100644
--- a/include/linux/mount.h
+++ b/include/linux/mount.h
@@ -107,7 +107,6 @@ extern struct vfsmount *vfs_submount(const struct dentry *mountpoint,
 extern void mnt_set_expiry(struct vfsmount *mnt, struct list_head *expiry_list);
 extern void mark_mounts_for_expiry(struct list_head *mounts);
 
-extern dev_t name_to_dev_t(const char *name);
 extern bool path_is_mountpoint(const struct path *path);
 
 extern bool our_mnt(struct vfsmount *mnt);
diff --git a/init/do_mounts.c b/init/do_mounts.c
index 86599faf2bf8a1..f1953aeb321978 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -96,11 +96,10 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
  *
  * Returns the matching dev_t on success or 0 on failure.
  */
-static dev_t devt_from_partuuid(const char *uuid_str)
+static int devt_from_partuuid(const char *uuid_str, dev_t *devt)
 {
 	struct uuidcmp cmp;
 	struct device *dev = NULL;
-	dev_t devt = 0;
 	int offset = 0;
 	char *slash;
 
@@ -124,21 +123,21 @@ static dev_t devt_from_partuuid(const char *uuid_str)
 
 	dev = class_find_device(&block_class, NULL, &cmp, &match_dev_by_uuid);
 	if (!dev)
-		return 0;
+		return -ENODEV;
 
 	if (offset) {
 		/*
 		 * Attempt to find the requested partition by adding an offset
 		 * to the partition number found by UUID.
 		 */
-		devt = part_devt(dev_to_disk(dev),
-				 dev_to_bdev(dev)->bd_partno + offset);
+		*devt = part_devt(dev_to_disk(dev),
+				  dev_to_bdev(dev)->bd_partno + offset);
 	} else {
-		devt = dev->devt;
+		*devt = dev->devt;
 	}
 
 	put_device(dev);
-	return devt;
+	return 0;
 
 clear_root_wait:
 	pr_err("VFS: PARTUUID= is invalid.\n"
@@ -146,7 +145,7 @@ static dev_t devt_from_partuuid(const char *uuid_str)
 	if (root_wait)
 		pr_err("Disabling rootwait; root= is invalid.\n");
 	root_wait = 0;
-	return 0;
+	return -EINVAL;
 }
 
 /**
@@ -166,38 +165,35 @@ static int match_dev_by_label(struct device *dev, const void *data)
 	return 1;
 }
 
-static dev_t devt_from_partlabel(const char *label)
+static int devt_from_partlabel(const char *label, dev_t *devt)
 {
 	struct device *dev;
-	dev_t devt = 0;
 
 	dev = class_find_device(&block_class, NULL, label, &match_dev_by_label);
-	if (dev) {
-		devt = dev->devt;
-		put_device(dev);
-	}
-
-	return devt;
+	if (!dev)
+		return -ENODEV;
+	*devt = dev->devt;
+	put_device(dev);
+	return 0;
 }
 
-static dev_t devt_from_devname(const char *name)
+static int devt_from_devname(const char *name, dev_t *devt)
 {
-	dev_t devt = 0;
 	int part;
 	char s[32];
 	char *p;
 
 	if (strlen(name) > 31)
-		return 0;
+		return -EINVAL;
 	strcpy(s, name);
 	for (p = s; *p; p++) {
 		if (*p == '/')
 			*p = '!';
 	}
 
-	devt = blk_lookup_devt(s, 0);
-	if (devt)
-		return devt;
+	*devt = blk_lookup_devt(s, 0);
+	if (*devt)
+		return 0;
 
 	/*
 	 * Try non-existent, but valid partition, which may only exist after
@@ -206,41 +202,42 @@ static dev_t devt_from_devname(const char *name)
 	while (p > s && isdigit(p[-1]))
 		p--;
 	if (p == s || !*p || *p == '0')
-		return 0;
+		return -EINVAL;
 
 	/* try disk name without <part number> */
 	part = simple_strtoul(p, NULL, 10);
 	*p = '\0';
-	devt = blk_lookup_devt(s, part);
-	if (devt)
-		return devt;
+	*devt = blk_lookup_devt(s, part);
+	if (*devt)
+		return 0;
 
 	/* try disk name without p<part number> */
 	if (p < s + 2 || !isdigit(p[-2]) || p[-1] != 'p')
-		return 0;
+		return -EINVAL;
 	p[-1] = '\0';
-	return blk_lookup_devt(s, part);
+	*devt = blk_lookup_devt(s, part);
+	if (*devt)
+		return 0;
+	return -EINVAL;
 }
-#endif /* CONFIG_BLOCK */
 
-static dev_t devt_from_devnum(const char *name)
+static int devt_from_devnum(const char *name, dev_t *devt)
 {
 	unsigned maj, min, offset;
-	dev_t devt = 0;
 	char *p, dummy;
 
 	if (sscanf(name, "%u:%u%c", &maj, &min, &dummy) == 2 ||
 	    sscanf(name, "%u:%u:%u:%c", &maj, &min, &offset, &dummy) == 3) {
-		devt = MKDEV(maj, min);
-		if (maj != MAJOR(devt) || min != MINOR(devt))
-			return 0;
+		*devt = MKDEV(maj, min);
+		if (maj != MAJOR(*devt) || min != MINOR(*devt))
+			return -EINVAL;
 	} else {
-		devt = new_decode_dev(simple_strtoul(name, &p, 16));
+		*devt = new_decode_dev(simple_strtoul(name, &p, 16));
 		if (*p)
-			return 0;
+			return -EINVAL;
 	}
 
-	return devt;
+	return 0;
 }
 
 /*
@@ -271,19 +268,18 @@ static dev_t devt_from_devnum(const char *name)
  *	name contains slashes, the device name has them replaced with
  *	bangs.
  */
-dev_t name_to_dev_t(const char *name)
+int early_lookup_bdev(const char *name, dev_t *devt)
 {
-#ifdef CONFIG_BLOCK
 	if (strncmp(name, "PARTUUID=", 9) == 0)
-		return devt_from_partuuid(name + 9);
+		return devt_from_partuuid(name + 9, devt);
 	if (strncmp(name, "PARTLABEL=", 10) == 0)
-		return devt_from_partlabel(name + 10);
+		return devt_from_partlabel(name + 10, devt);
 	if (strncmp(name, "/dev/", 5) == 0)
-		return devt_from_devname(name + 5);
-#endif
-	return devt_from_devnum(name);
+		return devt_from_devname(name + 5, devt);
+	return devt_from_devnum(name, devt);
 }
-EXPORT_SYMBOL_GPL(name_to_dev_t);
+EXPORT_SYMBOL_GPL(early_lookup_bdev);
+#endif
 
 static int __init root_dev_setup(char *line)
 {
@@ -606,20 +602,17 @@ static void __init wait_for_root(char *root_device_name)
 
 	pr_info("Waiting for root device %s...\n", root_device_name);
 
-	for (;;) {
-		if (driver_probe_done()) {
-			ROOT_DEV = name_to_dev_t(root_device_name);
-			if (ROOT_DEV)
-				break;
-		}
+	while (!driver_probe_done() ||
+	       early_lookup_bdev(root_device_name, &ROOT_DEV) < 0)
 		msleep(5);
-	}
 	async_synchronize_full();
 
 }
 
 static dev_t __init parse_root_device(char *root_device_name)
 {
+	dev_t dev;
+
 	if (!strncmp(root_device_name, "mtd", 3) ||
 	    !strncmp(root_device_name, "ubi", 3))
 		return Root_Generic;
@@ -629,7 +622,10 @@ static dev_t __init parse_root_device(char *root_device_name)
 		return Root_CIFS;
 	if (strcmp(root_device_name, "/dev/ram") == 0)
 		return Root_RAM0;
-	return name_to_dev_t(root_device_name);
+
+	if (early_lookup_bdev(root_device_name, &dev))
+		return 0;
+	return dev;
 }
 
 /*
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index 45e24b02cd50b6..c52dedb9f7c8e8 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -11,6 +11,7 @@
 
 #define pr_fmt(fmt) "PM: hibernation: " fmt
 
+#include <linux/blkdev.h>
 #include <linux/export.h>
 #include <linux/suspend.h>
 #include <linux/reboot.h>
@@ -921,8 +922,7 @@ static int __init find_resume_device(void)
 	}
 
 	/* Check if the device is there */
-	swsusp_resume_device = name_to_dev_t(resume_file);
-	if (swsusp_resume_device)
+	if (!early_lookup_bdev(resume_file, &swsusp_resume_device))
 		return 0;
 
 	/*
@@ -931,15 +931,12 @@ static int __init find_resume_device(void)
 	 */
 	wait_for_device_probe();
 	if (resume_wait) {
-		while (!(swsusp_resume_device = name_to_dev_t(resume_file)))
+		while (early_lookup_bdev(resume_file, &swsusp_resume_device))
 			msleep(10);
 		async_synchronize_full();
 	}
 
-	swsusp_resume_device = name_to_dev_t(resume_file);
-	if (!swsusp_resume_device)
-		return -ENODEV;
-	return 0;
+	return early_lookup_bdev(resume_file, &swsusp_resume_device);
 }
 
 static int software_resume(void)
@@ -1169,7 +1166,8 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	unsigned int sleep_flags;
 	int len = n;
 	char *name;
-	dev_t res;
+	dev_t dev;
+	int error;
 
 	if (!hibernation_available())
 		return 0;
@@ -1180,13 +1178,13 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (!name)
 		return -ENOMEM;
 
-	res = name_to_dev_t(name);
+	error = early_lookup_bdev(name, &dev);
 	kfree(name);
-	if (!res)
-		return -EINVAL;
+	if (error)
+		return error;
 
 	sleep_flags = lock_system_sleep();
-	swsusp_resume_device = res;
+	swsusp_resume_device = dev;
 	unlock_system_sleep(sleep_flags);
 
 	pm_pr_dbg("Configured hibernation resume from disk to %u\n",
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

