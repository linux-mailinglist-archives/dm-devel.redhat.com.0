Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E659C5AD633
	for <lists+dm-devel@lfdr.de>; Mon,  5 Sep 2022 17:22:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662391349;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1pnd6/1GeA2fODmP24QbkamnghycJcdk1AgTxHd3aso=;
	b=fm44MDEnJ2vBnrz7+qHMeiwfd0FeTQlSFMwsCXH64Sp72KN6lc2RJ3UzXnhVJBVggfXNwL
	F75/JC9raAduyu6ZzVgLbQUsRRMdvd0vWq/MbZjk6mteFv/V0luxGy6HZ9ahHyX0ShS6Bk
	r7Xz43DxHj6Pp9mWPfV7tQCVYDB3xsI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-5pZTJBPKP2CZNKfYUZJ-1w-1; Mon, 05 Sep 2022 11:22:28 -0400
X-MC-Unique: 5pZTJBPKP2CZNKfYUZJ-1w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CA50858EFF;
	Mon,  5 Sep 2022 15:22:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03B66492C3B;
	Mon,  5 Sep 2022 15:22:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD5DB1940379;
	Mon,  5 Sep 2022 15:22:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9DCCD1946A47
 for <dm-devel@listman.corp.redhat.com>; Mon,  5 Sep 2022 15:22:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8E9B02166B2A; Mon,  5 Sep 2022 15:22:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 854522166B26;
 Mon,  5 Sep 2022 15:22:24 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 285FMONQ008725; Mon, 5 Sep 2022 11:22:24 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 285FMO4r008722; Mon, 5 Sep 2022 11:22:24 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 5 Sep 2022 11:22:24 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2209051121410.8614@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [dm-devel] [PATCH 2/2] dm: make it possible to allocate error
 strings
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Previously, ti->error and ti_error strings were pointing to statically
allocated memory (the .rodata section) and it was not possible to add
parameters to the error strings.

This patch makes possible to allocate error strings dynamically using the
"kasprintf" function, so we can add arbitrary parameters to the strings.

We need to free the error string only if is allocated with kasprintf. So,
we introduce a function "dm_free_error" that tests if the string points to
the module area (and doesn't free the string if it does), then it calls
kfree_const. kfree_const detects if the string points to the kernel
.rodata section and frees the string if it is not in .rodata.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-ioctl.c         |    8 +++++++-
 drivers/md/dm-table.c         |   16 ++++++++++------
 include/linux/device-mapper.h |    6 ++++++
 3 files changed, 23 insertions(+), 7 deletions(-)

Index: linux-dm/drivers/md/dm-ioctl.c
===================================================================
--- linux-dm.orig/drivers/md/dm-ioctl.c	2022-09-05 14:31:51.000000000 +0200
+++ linux-dm/drivers/md/dm-ioctl.c	2022-09-05 14:31:51.000000000 +0200
@@ -1465,7 +1465,8 @@ static int table_load(struct file *filp,
 		DMERR("can't replace immutable target type %s",
 		      immutable_target_type->name);
 		r = -EINVAL;
-		ti_error = "can't replace immutable target";
+		ti_error = kasprintf(GFP_NOIO, "can't replace immutable target type %s",
+			immutable_target_type->name);
 		goto err_unlock_md_type;
 	}
 
@@ -1521,11 +1522,16 @@ err_destroy_table:
 err:
 	dm_put(md);
 err0:
+	if (!ti_error)
+		ti_error = "can't allocte error string";
 	if (param->flags & DM_RETURN_ERROR_FLAG) {
 		param->flags &= ~DM_RETURN_ERROR_FLAG;
 		strlcpy(param->name, ti_error, sizeof param->name);
 		param->error = r;
+		dm_free_error(ti_error);
 		return 0;
+	} else {
+		dm_free_error(ti_error);
 	}
 	return r;
 }
Index: linux-dm/drivers/md/dm-table.c
===================================================================
--- linux-dm.orig/drivers/md/dm-table.c	2022-09-05 14:31:51.000000000 +0200
+++ linux-dm/drivers/md/dm-table.c	2022-09-05 14:31:51.000000000 +0200
@@ -656,32 +656,32 @@ int dm_table_add_target(struct dm_table
 
 	ti->type = dm_get_target_type(type);
 	if (!ti->type) {
-		ti->error = "unknown target type";
+		ti->error = kasprintf(GFP_NOIO, "unknown target type %s", type);
 		r = -EINVAL;
 		goto bad0;
 	}
 
 	if (dm_target_needs_singleton(ti->type)) {
 		if (t->num_targets) {
-			ti->error = "singleton target type must appear alone in table";
+			ti->error = kasprintf(GFP_NOIO, "singleton target type %s must appear alone in table", type);
 			goto bad1;
 		}
 		t->singleton = true;
 	}
 
 	if (dm_target_always_writeable(ti->type) && !(t->mode & FMODE_WRITE)) {
-		ti->error = "target type may not be included in a read-only table";
+		ti->error = kasprintf(GFP_NOIO, "target type %s may not be included in a read-only table", type);
 		goto bad1;
 	}
 
 	if (t->immutable_target_type) {
 		if (t->immutable_target_type != ti->type) {
-			ti->error = "immutable target type cannot be mixed with other target types";
+			ti->error = kasprintf(GFP_NOIO, "immutable target type %s cannot be mixed with other target types", type);
 			goto bad1;
 		}
 	} else if (dm_target_is_immutable(ti->type)) {
 		if (t->num_targets) {
-			ti->error = "immutable target type cannot be mixed with other target types";
+			ti->error = kasprintf(GFP_NOIO, "immutable target type %s cannot be mixed with other target types", type);
 			goto bad1;
 		}
 		t->immutable_target_type = ti->type;
@@ -705,7 +705,7 @@ int dm_table_add_target(struct dm_table
 
 	r = dm_split_args(&argc, &argv, params);
 	if (r) {
-		ti->error = "couldn't split parameters";
+		ti->error = kasprintf(GFP_NOIO, "couldn't split parameters for target %s", type);
 		goto bad1;
 	}
 
@@ -728,9 +728,13 @@ int dm_table_add_target(struct dm_table
 bad1:
 	dm_put_target_type(ti->type);
 bad0:
+	if (!ti->error)
+		ti->error = "can't allocte error string";
 	DMERR("%s: %s: %s (%pe)", dm_device_name(t->md), type, ti->error, ERR_PTR(r));
 	if (ti_error)
 		*ti_error = ti->error;
+	else
+		dm_free_error(ti->error);
 	return r;
 }
 
Index: linux-dm/include/linux/device-mapper.h
===================================================================
--- linux-dm.orig/include/linux/device-mapper.h	2022-09-05 14:31:51.000000000 +0200
+++ linux-dm/include/linux/device-mapper.h	2022-09-05 14:31:51.000000000 +0200
@@ -679,4 +679,10 @@ static inline unsigned long to_bytes(sec
 	return (n << SECTOR_SHIFT);
 }
 
+static void dm_free_error(char *ti_error)
+{
+	if (!is_vmalloc_or_module_addr(ti_error))
+		kfree_const(ti_error);
+}
+
 #endif	/* _LINUX_DEVICE_MAPPER_H */
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

