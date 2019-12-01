Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7563710E81E
	for <lists+dm-devel@lfdr.de>; Mon,  2 Dec 2019 11:03:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575281026;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VqDlPJ3XHyudwLO1GFFXcs9OvHncyGdafCCUwrWf+8M=;
	b=gtjek48ZyFYYU9syyg88ue0XK8HiqUsqisWvGgBFO0bRPMnuQ5i+qqcbS6hIx7HHBJoILg
	FafwK8DWSUOwt4fPCBfxxAQ+YInM37xQZ7RYdFAO5zRiePn+Sh3USFmMWpT2o2/CzCZxjZ
	Jj/3zr6N5XXeTDIEwHmIdCB63x9hp88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-cwH3iYmkPsujwZ5e00CrPQ-1; Mon, 02 Dec 2019 05:03:44 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AAB3801E76;
	Mon,  2 Dec 2019 10:03:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC14460C05;
	Mon,  2 Dec 2019 10:03:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DE4118089CD;
	Mon,  2 Dec 2019 10:03:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB1LXLGe016026 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 1 Dec 2019 16:33:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 640FE1005E21; Sun,  1 Dec 2019 21:33:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F2A01000DA6
	for <dm-devel@redhat.com>; Sun,  1 Dec 2019 21:33:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EE778012A0
	for <dm-devel@redhat.com>; Sun,  1 Dec 2019 21:33:19 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-PWDztne4PdOelyPzlbGyjA-1; Sun, 01 Dec 2019 16:33:16 -0500
Received: by mail-oi1-f195.google.com with SMTP id x195so1413103oix.4
	for <dm-devel@redhat.com>; Sun, 01 Dec 2019 13:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=z2T5g4Tg2NwzwsjQX8o/Wl7zYag1qO3crG2/AoWz8OY=;
	b=nkHYsUUBmF5xXgUbTK0L8sS3oyLM5p+SlPjmWjY8mTLeEoLzM77rLtRYGnqvDCA+Xk
	O3LIXYLoenO77jyAMvmVlhFM/yOV3BG+tc21PPIbFoBaIAWwoS1kHF7EZkFGyNS4mZ0d
	yjYn8idGyDGLwyqr5vHxZt0V4yfyb5pawf11zzOWHImAvR14SYbcMtbLcEPfcW4IuLZI
	ml40MsYULSGhn9l6Gieeke2sgew6NV1XPrz+aUiyZNm/Lv1BATprG4mO+6W/bmhrlRZf
	xuRzcWhGHtflujwpfNCA6S5hjWEUWUJzDQDedfYU0hDcUXT/VwcfX9Fp3vOcswnhmJsR
	HwZA==
X-Gm-Message-State: APjAAAXWvUh3Y/m/UAQ67wua0PPLx3uAtHvzqJcoYTSGKF8S1zVfX8SO
	FD9pi1Yf0zKnFOUd5v50keu2J5XHdBK/Ffm0TfA42QYc
X-Google-Smtp-Source: APXvYqxU2GODG0s09Kkk0EhP0GcqJc4xhnOH0ssPVfsNqHwxHO95w3iUrEXlfApxRZFrrZZGYRl4vwmSsPvpzPHQiaY=
X-Received: by 2002:aca:53c6:: with SMTP id h189mr13496050oib.11.1575235995312;
	Sun, 01 Dec 2019 13:33:15 -0800 (PST)
MIME-Version: 1.0
From: sekhar satapathy soumendu <satapathy.soumendu@gmail.com>
Date: Sun, 1 Dec 2019 16:32:39 -0500
Message-ID: <CA+v+z+WDbzgrMtq=AYn203h-9W+EK5j7w1AduuivfmmHtzgejw@mail.gmail.com>
To: dm-devel@redhat.com, linux-kernel@vger.kernel.org
X-MC-Unique: PWDztne4PdOelyPzlbGyjA-1
X-MC-Unique: cwH3iYmkPsujwZ5e00CrPQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB1LXLGe016026
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Dec 2019 05:03:09 -0500
Subject: [dm-devel] [PATCH 1/1] md dm-dust: Functionality for write error
 emulation along with the existing read error functionality
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi there,

I have modified the existing dm-dust functionality(all changes have
been applied  to one file drivers/md/dust.c ) to add write error
emulation along with the existing read error. Intention was not to
change the existing functionality but to have a add-on write error
emulation along with it.I thought this may be a good to have
modification for the testers who would like to have a functionality to
add/remove bad blocks at will for "write error" and be able to
modulate it along with the existing "read error" emulation
functionality that dm-dust already has.

Thank you all for you time. The following is the patch.


Signed-off-by: Soumendu Sekhar Satapathy <satapathy.soumendu@gmail.com>



--- linux-5.4.1.old/drivers/md/dm-dust.c    2019-11-29 04:10:32.000000000 -0500
+++ linux-5.4.1.new/drivers/md/dm-dust.c    2019-12-01 15:19:32.784275979 -0500
@@ -1,3 +1,4 @@
+
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2018 Red Hat, Inc.
@@ -6,6 +7,22 @@
  * sectors, emulating the behavior of a hard disk drive sending
  * a "Read Medium Error" sense.
  *
+ *
+ *
+ *
+ * Soumendu Sekhar Satapathy email satapathy.soumendu@gmail.com
+ * 30th Nov 2019
+ * I  have modified  the  ~/drivers/md/dm-dust.c  file present in the
+ * linux kernel stable ver 5.4.1 (version as of writing this comment)
+ * and have added functionality for emulating disk with "write errors"
+ * also. The added functionality does not intend to change the existing
+ * read error functionality. The added functionality which is added is
+ * in same lines as the already existing read error functionality.
+ *
+ * Soumendu Sekhar Satapathy email satapathy.soumendu@gmail.com
+ * 01 Dec 2019
+ * Did some code cleanups
+ *
  */

 #include <linux/device-mapper.h>
@@ -14,20 +31,27 @@

 #define DM_MSG_PREFIX "dust"

+#define RD false
+#define WR true
+
 struct badblock {
     struct rb_node node;
     sector_t bb;
+    unsigned char wr_fail_cnt;
 };

 struct dust_device {
     struct dm_dev *dev;
-    struct rb_root badblocklist;
-    unsigned long long badblock_count;
+    struct rb_root badblocklist_read;
+    struct rb_root badblocklist_write;
+    unsigned long long badblock_count_read;
+    unsigned long long badblock_count_write;
     spinlock_t dust_lock;
     unsigned int blksz;
     int sect_per_block_shift;
     unsigned int sect_per_block;
     sector_t start;
+    bool fail_write_on_bb:1;
     bool fail_read_on_bb:1;
     bool quiet_mode:1;
 };
@@ -50,6 +74,7 @@
     return NULL;
 }

+
 static bool dust_rb_insert(struct rb_root *root, struct badblock *new)
 {
     struct badblock *bblk;
@@ -74,25 +99,34 @@
     return true;
 }

-static int dust_remove_block(struct dust_device *dd, unsigned long long block)
+static int dust_remove_block(struct dust_device *dd, unsigned long
long block, bool mode)
 {
     struct badblock *bblock;
     unsigned long flags;

     spin_lock_irqsave(&dd->dust_lock, flags);
-    bblock = dust_rb_search(&dd->badblocklist, block);
+    if(mode == RD)
+        bblock = dust_rb_search(&dd->badblocklist_read, block);
+    else
+        bblock = dust_rb_search(&dd->badblocklist_write, block);

     if (bblock == NULL) {
         if (!dd->quiet_mode) {
-            DMERR("%s: block %llu not found in badblocklist",
+            DMERR("%s: block %llu not found in badblocklist_read",
                   __func__, block);
         }
         spin_unlock_irqrestore(&dd->dust_lock, flags);
         return -EINVAL;
     }

-    rb_erase(&bblock->node, &dd->badblocklist);
-    dd->badblock_count--;
+    if(mode == RD)
+        rb_erase(&bblock->node, &dd->badblocklist_read);
+    else
+        rb_erase(&bblock->node, &dd->badblocklist_write);
+    if(mode == RD)
+        dd->badblock_count_read--;
+    else
+        dd->badblock_count_write--;
     if (!dd->quiet_mode)
         DMINFO("%s: badblock removed at block %llu", __func__, block);
     kfree(bblock);
@@ -101,7 +135,8 @@
     return 0;
 }

-static int dust_add_block(struct dust_device *dd, unsigned long long block)
+static int dust_add_block(struct dust_device *dd, unsigned long long block,
+              unsigned char wr_fail_cnt, bool mode)
 {
     struct badblock *bblock;
     unsigned long flags;
@@ -115,31 +150,55 @@

     spin_lock_irqsave(&dd->dust_lock, flags);
     bblock->bb = block;
-    if (!dust_rb_insert(&dd->badblocklist, bblock)) {
-        if (!dd->quiet_mode) {
-            DMERR("%s: block %llu already in badblocklist",
-                  __func__, block);
+    bblock->wr_fail_cnt = wr_fail_cnt;
+    if(mode == RD) {
+        if (!dust_rb_insert(&dd->badblocklist_read, bblock)) {
+            if (!dd->quiet_mode) {
+                DMERR("%s: block %llu already in badblocklist",
+                          __func__, block);
+            }
+            spin_unlock_irqrestore(&dd->dust_lock, flags);
+            kfree(bblock);
+            return -EINVAL;
+        }
+    }
+    else {
+        if (!dust_rb_insert(&dd->badblocklist_write, bblock)) {
+            if (!dd->quiet_mode) {
+                DMERR("%s: block %llu already in badblocklist",
+                          __func__, block);
+            }
+            spin_unlock_irqrestore(&dd->dust_lock, flags);
+            kfree(bblock);
+            return -EINVAL;
         }
-        spin_unlock_irqrestore(&dd->dust_lock, flags);
-        kfree(bblock);
-        return -EINVAL;
     }

-    dd->badblock_count++;
-    if (!dd->quiet_mode)
-        DMINFO("%s: badblock added at block %llu", __func__, block);
+    if(mode == RD)
+        dd->badblock_count_read++;
+    else
+        dd->badblock_count_write++;
+
+    if (!dd->quiet_mode) {
+        DMINFO("%s: badblock added at block %llu with write fail count %hhu",
+               __func__, block, wr_fail_cnt);
+    }
     spin_unlock_irqrestore(&dd->dust_lock, flags);

     return 0;
 }

-static int dust_query_block(struct dust_device *dd, unsigned long long block)
+
+static int dust_query_block(struct dust_device *dd, unsigned long
long block, bool mode)
 {
     struct badblock *bblock;
     unsigned long flags;

     spin_lock_irqsave(&dd->dust_lock, flags);
-    bblock = dust_rb_search(&dd->badblocklist, block);
+    if(mode == RD)
+        bblock = dust_rb_search(&dd->badblocklist_read, block);
+    else
+        bblock = dust_rb_search(&dd->badblocklist_write, block);
     if (bblock != NULL)
         DMINFO("%s: block %llu found in badblocklist", __func__, block);
     else
@@ -151,7 +210,7 @@

 static int __dust_map_read(struct dust_device *dd, sector_t thisblock)
 {
-    struct badblock *bblk = dust_rb_search(&dd->badblocklist, thisblock);
+    struct badblock *bblk = dust_rb_search(&dd->badblocklist_read, thisblock);

     if (bblk)
         return DM_MAPIO_KILL;
@@ -163,63 +222,85 @@
              bool fail_read_on_bb)
 {
     unsigned long flags;
-    int ret = DM_MAPIO_REMAPPED;
+    int r = DM_MAPIO_REMAPPED;

     if (fail_read_on_bb) {
         thisblock >>= dd->sect_per_block_shift;
         spin_lock_irqsave(&dd->dust_lock, flags);
-        ret = __dust_map_read(dd, thisblock);
+        r = __dust_map_read(dd, thisblock);
         spin_unlock_irqrestore(&dd->dust_lock, flags);
     }

-    return ret;
+    return r;
 }

-static void __dust_map_write(struct dust_device *dd, sector_t thisblock)
+static int __dust_map_write(struct dust_device *dd, sector_t thisblock)
 {
-    struct badblock *bblk = dust_rb_search(&dd->badblocklist, thisblock);
+    struct badblock *bblk_r = dust_rb_search(&dd->badblocklist_read,
thisblock);
+    struct badblock *bblk_w = dust_rb_search(&dd->badblocklist_write,
thisblock);

-    if (bblk) {
-        rb_erase(&bblk->node, &dd->badblocklist);
-        dd->badblock_count--;
-        kfree(bblk);
-        if (!dd->quiet_mode) {
-            sector_div(thisblock, dd->sect_per_block);
-            DMINFO("block %llu removed from badblocklist by write",
-                   (unsigned long long)thisblock);
+    if(dd->fail_write_on_bb) {
+        if (bblk_w)
+            return DM_MAPIO_KILL;
+    }
+
+    if(dd->fail_read_on_bb) {
+        if (bblk_r && bblk_r->wr_fail_cnt > 0) {
+            bblk_r->wr_fail_cnt--;
+            return DM_MAPIO_KILL;
+        }
+
+        if (bblk_r) {
+            rb_erase(&bblk_r->node, &dd->badblocklist_read);
+            dd->badblock_count_read--;
+            kfree(bblk_r);
+            if (!dd->quiet_mode) {
+                sector_div(thisblock, dd->sect_per_block);
+                DMINFO("block %llu removed from badblocklist_read by write",
+                           (unsigned long long)thisblock);
+            }
         }
     }
+
+    return DM_MAPIO_REMAPPED;
 }

 static int dust_map_write(struct dust_device *dd, sector_t thisblock,
-              bool fail_read_on_bb)
+              bool fail_read_on_bb, bool fail_write_on_bb)
 {
     unsigned long flags;
+    int ret = DM_MAPIO_REMAPPED;

-    if (fail_read_on_bb) {
+    if (fail_write_on_bb) {
         thisblock >>= dd->sect_per_block_shift;
         spin_lock_irqsave(&dd->dust_lock, flags);
-        __dust_map_write(dd, thisblock);
+        ret = __dust_map_write(dd, thisblock);
+        spin_unlock_irqrestore(&dd->dust_lock, flags);
+    }
+    else if (fail_read_on_bb) {
+        thisblock >>= dd->sect_per_block_shift;
+        spin_lock_irqsave(&dd->dust_lock, flags);
+        ret = __dust_map_write(dd, thisblock);
         spin_unlock_irqrestore(&dd->dust_lock, flags);
     }

-    return DM_MAPIO_REMAPPED;
+    return ret;
 }

 static int dust_map(struct dm_target *ti, struct bio *bio)
 {
     struct dust_device *dd = ti->private;
-    int ret;
+    int r;

     bio_set_dev(bio, dd->dev->bdev);
     bio->bi_iter.bi_sector = dd->start + dm_target_offset(ti,
bio->bi_iter.bi_sector);

     if (bio_data_dir(bio) == READ)
-        ret = dust_map_read(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
+        r = dust_map_read(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
     else
-        ret = dust_map_write(dd, bio->bi_iter.bi_sector, dd->fail_read_on_bb);
+        r = dust_map_write(dd, bio->bi_iter.bi_sector,
dd->fail_read_on_bb, dd->fail_write_on_bb);

-    return ret;
+    return r;
 }

 static bool __dust_clear_badblocks(struct rb_root *tree,
@@ -246,23 +327,41 @@
     return true;
 }

-static int dust_clear_badblocks(struct dust_device *dd)
+static int dust_clear_badblocks(struct dust_device *dd, bool mode)
 {
     unsigned long flags;
-    struct rb_root badblocklist;
-    unsigned long long badblock_count;
+    struct rb_root badblocklist_read;
+    struct rb_root badblocklist_write;
+    unsigned long long badblock_count_read;
+    unsigned long long badblock_count_write;

     spin_lock_irqsave(&dd->dust_lock, flags);
-    badblocklist = dd->badblocklist;
-    badblock_count = dd->badblock_count;
-    dd->badblocklist = RB_ROOT;
-    dd->badblock_count = 0;
+    if(mode == RD) {
+        badblocklist_read = dd->badblocklist_read;
+        badblock_count_read = dd->badblock_count_read;
+        dd->badblocklist_read = RB_ROOT;
+        dd->badblock_count_read = 0;
+    }
+    else {
+        badblocklist_write = dd->badblocklist_write;
+        badblock_count_write = dd->badblock_count_write;
+        dd->badblocklist_write = RB_ROOT;
+        dd->badblock_count_write = 0;
+    }
     spin_unlock_irqrestore(&dd->dust_lock, flags);

-    if (!__dust_clear_badblocks(&badblocklist, badblock_count))
-        DMINFO("%s: no badblocks found", __func__);
-    else
-        DMINFO("%s: badblocks cleared", __func__);
+    if(mode == RD) {
+        if (!__dust_clear_badblocks(&badblocklist_read, badblock_count_read))
+            DMINFO("%s: no read badblocks found", __func__);
+        else
+            DMINFO("%s: read badblocks cleared", __func__);
+    }
+    else {
+        if (!__dust_clear_badblocks(&badblocklist_write, badblock_count_write))
+            DMINFO("%s: no write badblocks found", __func__);
+        else
+            DMINFO("%s: write badblocks cleared", __func__);
+    }

     return 0;
 }
@@ -343,10 +442,18 @@
     dd->fail_read_on_bb = false;

     /*
+     * Fail a write on a "bad" block.
+     * Defaults to false; enabled later by message.
+     */
+    dd->fail_write_on_bb = false;
+
+    /*
      * Initialize bad block list rbtree.
      */
-    dd->badblocklist = RB_ROOT;
-    dd->badblock_count = 0;
+    dd->badblocklist_read = RB_ROOT;
+    dd->badblock_count_read = 0;
+    dd->badblocklist_write = RB_ROOT;
+    dd->badblock_count_write = 0;
     spin_lock_init(&dd->dust_lock);

     dd->quiet_mode = false;
@@ -364,7 +471,8 @@
 {
     struct dust_device *dd = ti->private;

-    __dust_clear_badblocks(&dd->badblocklist, dd->badblock_count);
+    __dust_clear_badblocks(&dd->badblocklist_read, dd->badblock_count_read);
+    __dust_clear_badblocks(&dd->badblocklist_write, dd->badblock_count_write);
     dm_put_device(ti, dd->dev);
     kfree(dd);
 }
@@ -375,8 +483,10 @@
     struct dust_device *dd = ti->private;
     sector_t size = i_size_read(dd->dev->bdev->bd_inode) >> SECTOR_SHIFT;
     bool invalid_msg = false;
-    int result = -EINVAL;
+    int r = -EINVAL;
     unsigned long long tmp, block;
+    unsigned char wr_fail_cnt;
+    unsigned int tmp_ui;
     unsigned long flags;
     char dummy;

@@ -384,59 +494,204 @@
         if (!strcasecmp(argv[0], "addbadblock") ||
             !strcasecmp(argv[0], "removebadblock") ||
             !strcasecmp(argv[0], "queryblock")) {
-            DMERR("%s requires an additional argument", argv[0]);
+            DMERR("%s requires 2 additional argument", argv[0]);
         } else if (!strcasecmp(argv[0], "disable")) {
-            DMINFO("disabling read failures on bad sectors");
-            dd->fail_read_on_bb = false;
-            result = 0;
+            DMERR("%s requires 1 additional argument", argv[0]);
         } else if (!strcasecmp(argv[0], "enable")) {
-            DMINFO("enabling read failures on bad sectors");
-            dd->fail_read_on_bb = true;
-            result = 0;
+            DMERR("%s requires 1 additional argument", argv[0]);
         } else if (!strcasecmp(argv[0], "countbadblocks")) {
-            spin_lock_irqsave(&dd->dust_lock, flags);
-            DMINFO("countbadblocks: %llu badblock(s) found",
-                   dd->badblock_count);
-            spin_unlock_irqrestore(&dd->dust_lock, flags);
-            result = 0;
+            DMERR("%s requires 1 additional argument", argv[0]);
         } else if (!strcasecmp(argv[0], "clearbadblocks")) {
-            result = dust_clear_badblocks(dd);
+            DMERR("%s requires 1 additional argument", argv[0]);
         } else if (!strcasecmp(argv[0], "quiet")) {
             if (!dd->quiet_mode)
                 dd->quiet_mode = true;
             else
                 dd->quiet_mode = false;
-            result = 0;
+            r = 0;
         } else {
             invalid_msg = true;
         }
     } else if (argc == 2) {
-        if (sscanf(argv[1], "%llu%c", &tmp, &dummy) != 1)
-            return result;
+        if (!strcasecmp(argv[0], "addbadblock")) {
+            if (!strcasecmp(argv[1], "read"))
+                DMERR("%s requires 1 additional argument", argv[0]);
+            else if (!strcasecmp(argv[1], "write"))
+                DMERR("%s requires 1 additional argument", argv[0]);
+            else
+                invalid_msg = true;
+        }
+        else if (!strcasecmp(argv[0], "enable")) {
+            if (!strcasecmp(argv[1], "read")) {
+                DMINFO("enabling read failures on bad sectors");
+                dd->fail_read_on_bb = true;
+                r = 0;
+                invalid_msg = false;
+            }
+            else if (!strcasecmp(argv[1], "write")) {
+                DMINFO("enabling write failures on bad sectors");
+                dd->fail_write_on_bb = true;
+                r = 0;
+                invalid_msg = false;
+            }
+            else
+                invalid_msg = true;
+        }
+        else if (!strcasecmp(argv[0], "disable")) {
+            if (!strcasecmp(argv[1], "read")) {
+                DMINFO("disabling read failures on bad sectors");
+                dd->fail_read_on_bb = false;
+                r = 0;
+                invalid_msg = false;
+            }
+            else if (!strcasecmp(argv[1], "write")) {
+                DMINFO("disabling write failures on bad sectors");
+                dd->fail_write_on_bb = false;
+                r = 0;
+                invalid_msg = false;
+            }
+            else
+                invalid_msg = true;
+        }
+        else if (!strcasecmp(argv[0], "removebadblock")) {
+            if (!strcasecmp(argv[1], "read"))
+                DMERR("%s requires 1 additional argument", argv[0]);
+            else if (!strcasecmp(argv[1], "write"))
+                DMERR("%s requires 1 additional argument", argv[0]);
+            else
+                invalid_msg = true;
+        }
+        else if (!strcasecmp(argv[0], "queryblock")) {
+            if (!strcasecmp(argv[1], "read"))
+                DMERR("%s requires 1 additional argument", argv[0]);
+            else if (!strcasecmp(argv[1], "write"))
+                DMERR("%s requires 1 additional argument", argv[0]);
+            else
+                invalid_msg = true;
+        }
+        else if (!strcasecmp(argv[0], "clearbadblocks")) {
+            if (!strcasecmp(argv[1], "read")) {
+                r = dust_clear_badblocks(dd,false);
+                invalid_msg = false;
+            }
+            else if (!strcasecmp(argv[1], "write")) {
+                r = dust_clear_badblocks(dd,true);
+                invalid_msg = false;
+            }
+            else
+                invalid_msg = true;
+        }
+        else if (!strcasecmp(argv[0], "countbadblocks")) {
+            if (!strcasecmp(argv[1], "read")) {
+                spin_lock_irqsave(&dd->dust_lock, flags);
+                DMINFO("countbadblocks: %llu read badblock(s) found",
+                           dd->badblock_count_read);
+                spin_unlock_irqrestore(&dd->dust_lock, flags);
+                r = 0;
+                invalid_msg = false;
+            }
+            else if (!strcasecmp(argv[1], "write")) {
+                spin_lock_irqsave(&dd->dust_lock, flags);
+                DMINFO("countbadblocks: %llu write badblock(s) found",
+                           dd->badblock_count_write);
+                spin_unlock_irqrestore(&dd->dust_lock, flags);
+                r = 0;
+                invalid_msg = false;
+            }
+            else
+                invalid_msg = true;
+        }
+        else
+            invalid_msg = true;
+    } else if (argc == 3) {
+        if (sscanf(argv[2], "%llu%c", &tmp, &dummy) != 1)
+            return r;

         block = tmp;
         sector_div(size, dd->sect_per_block);
         if (block > size) {
             DMERR("selected block value out of range");
-            return result;
+            return r;
         }

-        if (!strcasecmp(argv[0], "addbadblock"))
-            result = dust_add_block(dd, block);
-        else if (!strcasecmp(argv[0], "removebadblock"))
-            result = dust_remove_block(dd, block);
-        else if (!strcasecmp(argv[0], "queryblock"))
-            result = dust_query_block(dd, block);
+        if (!strcasecmp(argv[0], "addbadblock")) {
+            if (!strcasecmp(argv[1], "read")) {
+                r = dust_add_block(dd, block, 0, false);
+                invalid_msg = false;
+            }
+            else if (!strcasecmp(argv[1], "write")) {
+                r = dust_add_block(dd, block, 0, true);
+                invalid_msg = false;
+            }
+            else
+                invalid_msg = true;
+        }
+        else if (!strcasecmp(argv[0], "removebadblock")) {
+            if (!strcasecmp(argv[1], "read")) {
+                r = dust_remove_block(dd, block, false);
+                invalid_msg = false;
+            }
+            else if (!strcasecmp(argv[1], "write")) {
+                r = dust_remove_block(dd, block, true);
+                invalid_msg = false;
+            }
+            else
+                invalid_msg = true;
+        }
+        else if (!strcasecmp(argv[0], "queryblock")) {
+            if (!strcasecmp(argv[1], "read")) {
+                r = dust_query_block(dd, block, false);
+                invalid_msg = false;
+            }
+            else if (!strcasecmp(argv[1], "write")) {
+                r = dust_query_block(dd, block, true);
+                invalid_msg = false;
+            }
+            else
+                invalid_msg = true;
+        }
         else
             invalid_msg = true;
-
+    } else if (argc == 4) {
+            if (sscanf(argv[2], "%llu%c", &tmp, &dummy) != 1)
+                        return r;
+
+                if (sscanf(argv[3], "%u%c", &tmp_ui, &dummy) != 1)
+                        return r;
+
+                block = tmp;
+                if (tmp_ui > 255) {
+                        DMERR("selected write fail count out of range");
+                        return r;
+                }
+                wr_fail_cnt = tmp_ui;
+                sector_div(size, dd->sect_per_block);
+                if (block > size) {
+                        DMERR("selected block value out of range");
+                        return r;
+                }
+
+                if (!strcasecmp(argv[0], "addbadblock")) {
+            if (!strcasecmp(argv[1], "read")) {
+                r = dust_add_block(dd, block, wr_fail_cnt, false);
+                invalid_msg = false;
+            }
+            else if (!strcasecmp(argv[1], "write")) {
+                r = dust_add_block(dd, block, wr_fail_cnt, true);
+                invalid_msg = false;
+            }
+            else
+                invalid_msg = true;
+        }
+                else
+                        invalid_msg = true;
     } else
         DMERR("invalid number of arguments '%d'", argc);

     if (invalid_msg)
         DMERR("unrecognized message '%s' received", argv[0]);

-    return result;
+    return r;
 }

 static void dust_status(struct dm_target *ti, status_type_t type,
@@ -450,6 +705,9 @@
         DMEMIT("%s %s %s", dd->dev->name,
                dd->fail_read_on_bb ? "fail_read_on_bad_block" : "bypass",
                dd->quiet_mode ? "quiet" : "verbose");
+        DMEMIT("\n%s %s %s", dd->dev->name,
+               dd->fail_write_on_bb ? "fail_write_on_bad_block" : "bypass",
+               dd->quiet_mode ? "quiet" : "verbose");
         break;

     case STATUSTYPE_TABLE:
@@ -499,12 +757,12 @@

 static int __init dm_dust_init(void)
 {
-    int result = dm_register_target(&dust_target);
+    int r = dm_register_target(&dust_target);

-    if (result < 0)
-        DMERR("dm_register_target failed %d", result);
+    if (r < 0)
+        DMERR("dm_register_target failed %d", r);

-    return result;
+    return r;
 }

 static void __exit dm_dust_exit(void)


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

