Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661D59F891
	for <lists+dm-devel@lfdr.de>; Wed, 24 Aug 2022 13:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661340247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0tBLUwVlQBg2xutP/Qqso8BGlqUKIlLAvKFSZuKpPSc=;
	b=QpGN5TVhieJs7ZsRyi8u6tD0XK4nuVTCgbokmwV8c0Tk1b+ZhWFfdb1K4j81ApgbjImErz
	uR9NZVUl8onoB3spVvFaZZOiRK7yXXAfQL5WWHiWElbPgUmQGrxN3nhTxmEga6BgCQe0Xh
	w3Z/JnG6w6LHCSawU9/CiPARun5oZgI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-HoU8SbWiPYeEq1V54Rmjhg-1; Wed, 24 Aug 2022 07:24:04 -0400
X-MC-Unique: HoU8SbWiPYeEq1V54Rmjhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BEEF811E83;
	Wed, 24 Aug 2022 11:24:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A38540D2830;
	Wed, 24 Aug 2022 11:23:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4DBFA1946A5D;
	Wed, 24 Aug 2022 11:23:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 045921946A42
 for <dm-devel@listman.corp.redhat.com>; Wed, 24 Aug 2022 11:23:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D940E2026D2D; Wed, 24 Aug 2022 11:23:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA3952026D4C;
 Wed, 24 Aug 2022 11:23:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 27OBNuhc031717; Wed, 24 Aug 2022 07:23:56 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 27OBNu2n031713; Wed, 24 Aug 2022 07:23:56 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Wed, 24 Aug 2022 07:23:56 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2208240720520.31584@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [dm-devel] [PATCH] dm-ioctl: make an option to return an error
 string
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
Cc: David Teigland <teigland@redhat.com>, dm-devel@redhat.com,
 Joe Thornber <thornber@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a possibility to return an error string to userspace. We introduce a
new flag DM_RETURN_ERROR_FLAG. This flag should be set on table load
ioctl. When this flag is present and table load fails, we return the error
string in the "name" field of the ioctl.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-ioctl.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-ioctl.c
+++ linux-2.6/drivers/md/dm-ioctl.c
@@ -1377,7 +1377,8 @@ static int next_target(struct dm_target_
 }
 
 static int populate_table(struct dm_table *table,
-			  struct dm_ioctl *param, size_t param_size)
+			  struct dm_ioctl *param, size_t param_size,
+			  char **ti_error)
 {
 	int r;
 	unsigned int i = 0;
@@ -1388,6 +1389,8 @@ static int populate_table(struct dm_tabl
 
 	if (!param->target_count) {
 		DMWARN("populate_table: no targets specified");
+		if (ti_error)
+			*ti_error = "no targets specified";
 		return -EINVAL;
 	}
 
@@ -1396,13 +1399,15 @@ static int populate_table(struct dm_tabl
 		r = next_target(spec, next, end, &spec, &target_params);
 		if (r) {
 			DMWARN("unable to find target");
+			if (ti_error)
+				*ti_error = "unable to find target";
 			return r;
 		}
 
 		r = dm_table_add_target(table, spec->target_type,
 					(sector_t) spec->sector_start,
 					(sector_t) spec->length,
-					target_params);
+					target_params, ti_error);
 		if (r) {
 			DMWARN("error adding target to table");
 			return r;
@@ -1430,18 +1435,24 @@ static int table_load(struct file *filp,
 	struct dm_table *t, *old_map = NULL;
 	struct mapped_device *md;
 	struct target_type *immutable_target_type;
+	char *ti_error;
 
 	md = find_device(param);
-	if (!md)
-		return -ENXIO;
+	if (!md) {
+		r = -ENXIO;
+		ti_error = "unable to find device";
+		goto err0;
+	}
 
 	r = dm_table_create(&t, get_mode(param), param->target_count, md);
-	if (r)
+	if (r) {
+		ti_error = "unable to create table";
 		goto err;
+	}
 
 	/* Protect md->type and md->queue against concurrent table loads. */
 	dm_lock_md_type(md);
-	r = populate_table(t, param, param_size);
+	r = populate_table(t, param, param_size, &ti_error);
 	if (r)
 		goto err_unlock_md_type;
 
@@ -1454,6 +1465,7 @@ static int table_load(struct file *filp,
 		DMWARN("can't replace immutable target type %s",
 		       immutable_target_type->name);
 		r = -EINVAL;
+		ti_error = "can't replace immutable target";
 		goto err_unlock_md_type;
 	}
 
@@ -1462,12 +1474,14 @@ static int table_load(struct file *filp,
 		r = dm_setup_md_queue(md, t);
 		if (r) {
 			DMWARN("unable to set up device queue for new table.");
+			ti_error = "unable to set up device queue for new table";
 			goto err_unlock_md_type;
 		}
 	} else if (!is_valid_type(dm_get_md_type(md), dm_table_get_type(t))) {
 		DMWARN("can't change device type (old=%u vs new=%u) after initial table load.",
 		       dm_get_md_type(md), dm_table_get_type(t));
 		r = -EINVAL;
+		ti_error = "can't change device type after initial table load";
 		goto err_unlock_md_type;
 	}
 
@@ -1480,6 +1494,7 @@ static int table_load(struct file *filp,
 		DMWARN("device has been removed from the dev hash table.");
 		up_write(&_hash_lock);
 		r = -ENXIO;
+		ti_error = "device has been removed from the dev hash table";
 		goto err_destroy_table;
 	}
 
@@ -1506,7 +1521,9 @@ err_destroy_table:
 	dm_table_destroy(t);
 err:
 	dm_put(md);
-
+err0:
+	if (param->flags & DM_RETURN_ERROR_FLAG)
+		strlcpy(param->name, ti_error, sizeof param->name);
 	return r;
 }
 
@@ -2201,7 +2218,7 @@ int __init dm_early_create(struct dm_ioc
 		r = dm_table_add_target(t, spec_array[i]->target_type,
 					(sector_t) spec_array[i]->sector_start,
 					(sector_t) spec_array[i]->length,
-					target_params_array[i]);
+					target_params_array[i], NULL);
 		if (r) {
 			DMWARN("error adding target to table");
 			goto err_destroy_table;
Index: linux-2.6/drivers/md/dm-table.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-table.c
+++ linux-2.6/drivers/md/dm-table.c
@@ -631,56 +631,58 @@ static int validate_hardware_logical_blo
 }
 
 int dm_table_add_target(struct dm_table *t, const char *type,
-			sector_t start, sector_t len, char *params)
+			sector_t start, sector_t len, char *params,
+			char **ti_error)
 {
 	int r = -EINVAL, argc;
 	char **argv;
 	struct dm_target *ti;
 
-	if (t->singleton) {
-		DMERR("%s: target type %s must appear alone in table",
-		      dm_device_name(t->md), t->targets->type->name);
-		return -EINVAL;
-	}
-
 	BUG_ON(t->num_targets >= t->num_allocated);
-
 	ti = t->targets + t->num_targets;
 	memset(ti, 0, sizeof(*ti));
 
+	if (t->singleton) {
+		ti->error =  "singleton target must appear alone in table";
+		r = -EINVAL;
+		goto bad0;
+	}
+
 	if (!len) {
-		DMERR("%s: zero-length target", dm_device_name(t->md));
-		return -EINVAL;
+		ti->error =  "zero-length target";
+		r = -EINVAL;
+		goto bad0;
 	}
 
 	ti->type = dm_get_target_type(type);
 	if (!ti->type) {
-		DMERR("%s: %s: unknown target type", dm_device_name(t->md), type);
-		return -EINVAL;
+		ti->error = "unknown target type";
+		r = -EINVAL;
+		goto bad0;
 	}
 
 	if (dm_target_needs_singleton(ti->type)) {
 		if (t->num_targets) {
 			ti->error = "singleton target type must appear alone in table";
-			goto bad;
+			goto bad1;
 		}
 		t->singleton = true;
 	}
 
 	if (dm_target_always_writeable(ti->type) && !(t->mode & FMODE_WRITE)) {
 		ti->error = "target type may not be included in a read-only table";
-		goto bad;
+		goto bad1;
 	}
 
 	if (t->immutable_target_type) {
 		if (t->immutable_target_type != ti->type) {
 			ti->error = "immutable target type cannot be mixed with other target types";
-			goto bad;
+			goto bad1;
 		}
 	} else if (dm_target_is_immutable(ti->type)) {
 		if (t->num_targets) {
 			ti->error = "immutable target type cannot be mixed with other target types";
-			goto bad;
+			goto bad1;
 		}
 		t->immutable_target_type = ti->type;
 	}
@@ -698,19 +700,19 @@ int dm_table_add_target(struct dm_table
 	 */
 	if (!adjoin(t, ti)) {
 		ti->error = "Gap in table";
-		goto bad;
+		goto bad1;
 	}
 
 	r = dm_split_args(&argc, &argv, params);
 	if (r) {
 		ti->error = "couldn't split parameters";
-		goto bad;
+		goto bad1;
 	}
 
 	r = ti->type->ctr(ti, argc, argv);
 	kfree(argv);
 	if (r)
-		goto bad;
+		goto bad1;
 
 	t->highs[t->num_targets++] = ti->begin + ti->len - 1;
 
@@ -723,9 +725,12 @@ int dm_table_add_target(struct dm_table
 
 	return 0;
 
- bad:
-	DMERR("%s: %s: %s (%pe)", dm_device_name(t->md), type, ti->error, ERR_PTR(r));
+bad1:
 	dm_put_target_type(ti->type);
+bad0:
+	DMERR("%s: %s: %s (%pe)", dm_device_name(t->md), type, ti->error, ERR_PTR(r));
+	if (ti_error)
+		*ti_error = ti->error;
 	return r;
 }
 
Index: linux-2.6/include/linux/device-mapper.h
===================================================================
--- linux-2.6.orig/include/linux/device-mapper.h
+++ linux-2.6/include/linux/device-mapper.h
@@ -531,7 +531,8 @@ int dm_table_create(struct dm_table **re
  * Then call this once for each target.
  */
 int dm_table_add_target(struct dm_table *t, const char *type,
-			sector_t start, sector_t len, char *params);
+			sector_t start, sector_t len, char *params,
+			char **ti_error);
 
 /*
  * Target can use this to set the table's type.
Index: linux-2.6/include/uapi/linux/dm-ioctl.h
===================================================================
--- linux-2.6.orig/include/uapi/linux/dm-ioctl.h
+++ linux-2.6/include/uapi/linux/dm-ioctl.h
@@ -286,9 +286,9 @@ enum {
 #define DM_DEV_SET_GEOMETRY	_IOWR(DM_IOCTL, DM_DEV_SET_GEOMETRY_CMD, struct dm_ioctl)
 
 #define DM_VERSION_MAJOR	4
-#define DM_VERSION_MINOR	47
+#define DM_VERSION_MINOR	48
 #define DM_VERSION_PATCHLEVEL	0
-#define DM_VERSION_EXTRA	"-ioctl (2022-07-28)"
+#define DM_VERSION_EXTRA	"-ioctl (2022-08-19)"
 
 /* Status bits */
 #define DM_READONLY_FLAG	(1 << 0) /* In/Out */
@@ -382,4 +382,10 @@ enum {
  */
 #define DM_IMA_MEASUREMENT_FLAG	(1 << 19) /* In */
 
+/*
+ * If this flag is set, the caller wants to receive the error string.
+ * The error string is returned in the "name" field of the ioctl.
+ */
+#define DM_RETURN_ERROR_FLAG	(1 << 20) /* In */
+
 #endif				/* _LINUX_DM_IOCTL_H */
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

