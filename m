Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A81F1241566
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 05:44:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-C6VgTQANMoa8rRlZlmrjWg-1; Mon, 10 Aug 2020 23:44:38 -0400
X-MC-Unique: C6VgTQANMoa8rRlZlmrjWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7C49106B242;
	Tue, 11 Aug 2020 03:44:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C72341A7D8;
	Tue, 11 Aug 2020 03:44:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84CFAA5521;
	Tue, 11 Aug 2020 03:44:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07B3gb5q001902 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 23:42:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2313EAF82; Tue, 11 Aug 2020 03:42:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADDB0F49CD
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 03:42:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B385805F40
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 03:42:35 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-187-5k2uV87xNTG9DCvgTWiH8A-1; Mon, 10 Aug 2020 23:42:33 -0400
X-MC-Unique: 5k2uV87xNTG9DCvgTWiH8A-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C3BE58832AC2D5E877BA;
	Tue, 11 Aug 2020 11:23:09 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.249) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 11 Aug 2020 11:23:02 +0800
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	<christophe.varoqui@opensvc.com>, <kabelac@redhat.com>
From: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Message-ID: <7556f86a-0b45-8274-b9e7-0576813ca1fe@huawei.com>
Date: Tue, 11 Aug 2020 11:23:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.179.249]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: [dm-devel] [PATCH V2] vector: return false if realloc fails in
 vector_alloc_slot func
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


In vector_alloc_slot func, if REALLOC fails, it means new slot
allocation fails. However, it just update v->allocated and then
return the old v->slot without new slot. So, the caller will take
the last old slot as the new allocated slot, and use it by calling
vector_set_slot func. Finally, the data of last slot is lost.

Here, we rewrite vector_alloc_slot as suggested by Martin Wilck:
 - increment v->allocated only after successful allocation,
 - avoid the "if (v->slot)" conditional by just calling realloc(),
 - make sure all newly allocated vector elements are set to NULL,
 - change return value to bool.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
---
 libmultipath/config.c       |  2 +-
 libmultipath/foreign.c      |  2 +-
 libmultipath/foreign/nvme.c |  6 +++---
 libmultipath/vector.c       | 22 +++++++++-------------
 libmultipath/vector.h       |  6 ++++--
 5 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index 49723add..4f5cefda 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -131,7 +131,7 @@ find_hwe (const struct _vector *hwtable,
 	vector_foreach_slot_backwards (hwtable, tmp, i) {
 		if (hwe_regmatch(tmp, vendor, product, revision))
 			continue;
-		if (vector_alloc_slot(result) != NULL) {
+		if (vector_alloc_slot(result)) {
 			vector_set_slot(result, tmp);
 			n++;
 		}
diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
index 26f92672..c2335ed5 100644
--- a/libmultipath/foreign.c
+++ b/libmultipath/foreign.c
@@ -236,7 +236,7 @@ static int _init_foreign(const char *multipath_dir, const char *const enable)
 			goto dl_err;
 		}

-		if (vector_alloc_slot(foreigns) == NULL) {
+		if (!vector_alloc_slot(foreigns)) {
 			goto dl_err;
 		}

diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
index da85e515..88b6aee2 100644
--- a/libmultipath/foreign/nvme.c
+++ b/libmultipath/foreign/nvme.c
@@ -731,12 +731,12 @@ static void _find_controllers(struct context *ctx, struct nvme_map *map)
 		test_ana_support(map, path->ctl);

 		path->pg.gen.ops = &nvme_pg_ops;
-		if (vector_alloc_slot(&path->pg.pathvec) == NULL) {
+		if (!vector_alloc_slot(&path->pg.pathvec)) {
 			cleanup_nvme_path(path);
 			continue;
 		}
 		vector_set_slot(&path->pg.pathvec, path);
-		if (vector_alloc_slot(&map->pgvec) == NULL) {
+		if (!vector_alloc_slot(&map->pgvec)) {
 			cleanup_nvme_path(path);
 			continue;
 		}
@@ -792,7 +792,7 @@ static int _add_map(struct context *ctx, struct udev_device *ud,
 	map->subsys = subsys;
 	map->gen.ops = &nvme_map_ops;

-	if (vector_alloc_slot(ctx->mpvec) == NULL) {
+	if (!vector_alloc_slot(ctx->mpvec)) {
 		cleanup_nvme_map(map);
 		return FOREIGN_ERR;
 	}
diff --git a/libmultipath/vector.c b/libmultipath/vector.c
index 501cf4c5..39e2c20f 100644
--- a/libmultipath/vector.c
+++ b/libmultipath/vector.c
@@ -35,26 +35,22 @@ vector_alloc(void)
 }

 /* allocated one slot */
-void *
+bool
 vector_alloc_slot(vector v)
 {
 	void *new_slot = NULL;

 	if (!v)
-		return NULL;
-
-	v->allocated += VECTOR_DEFAULT_SIZE;
-	if (v->slot)
-		new_slot = REALLOC(v->slot, sizeof (void *) * v->allocated);
-	else
-		new_slot = (void *) MALLOC(sizeof (void *) * v->allocated);
+		return false;

+	new_slot = REALLOC(v->slot, sizeof (void *) * (v->allocated + VECTOR_DEFAULT_SIZE));
 	if (!new_slot)
-		v->allocated -= VECTOR_DEFAULT_SIZE;
-	else
-		v->slot = new_slot;
+		return false;

-	return v->slot;
+	v->slot = new_slot;
+	v->allocated += VECTOR_DEFAULT_SIZE;
+	v->slot[VECTOR_SIZE(v) - 1] = NULL;
+	return true;
 }

 int
@@ -203,7 +199,7 @@ int vector_find_or_add_slot(vector v, void *value)

 	if (n >= 0)
 		return n;
-	if (vector_alloc_slot(v) == NULL)
+	if (!vector_alloc_slot(v))
 		return -1;
 	vector_set_slot(v, value);
 	return VECTOR_SIZE(v) - 1;
diff --git a/libmultipath/vector.h b/libmultipath/vector.h
index e16ec461..cb64b7d6 100644
--- a/libmultipath/vector.h
+++ b/libmultipath/vector.h
@@ -23,6 +23,8 @@
 #ifndef _VECTOR_H
 #define _VECTOR_H

+#include <stdbool.h>
+
 /* vector definition */
 struct _vector {
 	int allocated;
@@ -60,7 +62,7 @@ typedef struct _vector *vector;
 			__t = vector_alloc();				\
 		if (__t != NULL) {					\
 			vector_foreach_slot(__v, __j, __i) {		\
-				if (vector_alloc_slot(__t) == NULL) {	\
+				if (!vector_alloc_slot(__t)) {	\
 					vector_free(__t);		\
 					__t = NULL;			\
 					break;				\
@@ -73,7 +75,7 @@ typedef struct _vector *vector;

 /* Prototypes */
 extern vector vector_alloc(void);
-extern void *vector_alloc_slot(vector v);
+extern bool vector_alloc_slot(vector v);
 vector vector_reset(vector v);
 extern void vector_free(vector v);
 #define vector_free_const(x) vector_free((vector)(long)(x))
-- 
2.24.0.windows.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

