Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56B1BDDE
	for <lists+dm-devel@lfdr.de>; Mon, 13 May 2019 21:26:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B2883087950;
	Mon, 13 May 2019 19:26:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 578D71001E87;
	Mon, 13 May 2019 19:26:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2BA518089CB;
	Mon, 13 May 2019 19:26:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4DJQ2Nr024192 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 May 2019 15:26:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01BFB63B86; Mon, 13 May 2019 19:26:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99A4787D3;
	Mon, 13 May 2019 19:25:57 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52F723078AA0;
	Mon, 13 May 2019 19:25:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
	[IPv6:2804:431:9719:d573:a076:d1fd:3417:b195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: koike)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C545F281DC5;
	Mon, 13 May 2019 20:25:52 +0100 (BST)
From: Helen Koike <helen.koike@collabora.com>
To: dm-devel@redhat.com
Date: Mon, 13 May 2019 16:25:30 -0300
Message-Id: <20190513192530.1167-1-helen.koike@collabora.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Mon, 13 May 2019 19:25:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 13 May 2019 19:25:56 +0000 (UTC) for IP:'46.235.227.227'
	DOMAIN:'bhuna.collabora.co.uk' HELO:'bhuna.collabora.co.uk'
	FROM:'helen.koike@collabora.com' RCPT:''
X-RedHat-Spam-Score: -0.012  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 46.235.227.227 bhuna.collabora.co.uk
	46.235.227.227 bhuna.collabora.co.uk
	<helen.koike@collabora.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Helen Koike <helen.koike@collabora.com>,
	kernel@collabora.com, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH] dm ioctl: fix hang in early create error
	condition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 13 May 2019 19:26:18 +0000 (UTC)

The dm_early_create() function (which deals with "dm-mod.create=" kernel
command line option) calls dm_hash_insert() who gets an extra reference
to the md object.

In case of failure, this reference wasn't being released, causing
dm_destroy() to hang, thus hanging the whole boot process.

Fix this by calling __hash_remove() in the error path.

Fixes: 6bbc923dfcf57d ("dm: add support to directly boot to a mapped device")
Cc: stable@vger.kernel.org
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
Hi,

I tested this patch by adding a new test case in the following test
script:

https://gitlab.collabora.com/koike/dm-cmdline-test/commit/d2d7a0ee4a49931cdb59f08a837b516c2d5d743d

This test was failing, but with this patch it works correctly.

Thanks
Helen

 drivers/md/dm-ioctl.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index c740153b4e52..31da18611a21 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -205,7 +205,8 @@ static void free_cell(struct hash_cell *hc)
  * The kdev_t and uuid of a device can never change once it is
  * initially inserted.
  */
-static int dm_hash_insert(const char *name, const char *uuid, struct mapped_device *md)
+static struct hash_cell *dm_hash_insert(const char *name, const char *uuid,
+					struct mapped_device *md)
 {
 	struct hash_cell *cell, *hc;
 
@@ -214,7 +215,7 @@ static int dm_hash_insert(const char *name, const char *uuid, struct mapped_devi
 	 */
 	cell = alloc_cell(name, uuid, md);
 	if (!cell)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	/*
 	 * Insert the cell into both hash tables.
@@ -243,12 +244,12 @@ static int dm_hash_insert(const char *name, const char *uuid, struct mapped_devi
 	mutex_unlock(&dm_hash_cells_mutex);
 	up_write(&_hash_lock);
 
-	return 0;
+	return cell;
 
  bad:
 	up_write(&_hash_lock);
 	free_cell(cell);
-	return -EBUSY;
+	return ERR_PTR(-EBUSY);
 }
 
 static struct dm_table *__hash_remove(struct hash_cell *hc)
@@ -747,6 +748,7 @@ static int dev_create(struct file *filp, struct dm_ioctl *param, size_t param_si
 {
 	int r, m = DM_ANY_MINOR;
 	struct mapped_device *md;
+	struct hash_cell *hc;
 
 	r = check_name(param->name);
 	if (r)
@@ -759,11 +761,11 @@ static int dev_create(struct file *filp, struct dm_ioctl *param, size_t param_si
 	if (r)
 		return r;
 
-	r = dm_hash_insert(param->name, *param->uuid ? param->uuid : NULL, md);
-	if (r) {
+	hc = dm_hash_insert(param->name, *param->uuid ? param->uuid : NULL, md);
+	if (IS_ERR(hc)) {
 		dm_put(md);
 		dm_destroy(md);
-		return r;
+		return PTR_ERR(hc);
 	}
 
 	param->flags &= ~DM_INACTIVE_PRESENT_FLAG;
@@ -2044,6 +2046,7 @@ int __init dm_early_create(struct dm_ioctl *dmi,
 	int r, m = DM_ANY_MINOR;
 	struct dm_table *t, *old_map;
 	struct mapped_device *md;
+	struct hash_cell *hc;
 	unsigned int i;
 
 	if (!dmi->target_count)
@@ -2062,14 +2065,14 @@ int __init dm_early_create(struct dm_ioctl *dmi,
 		return r;
 
 	/* hash insert */
-	r = dm_hash_insert(dmi->name, *dmi->uuid ? dmi->uuid : NULL, md);
-	if (r)
+	hc = dm_hash_insert(dmi->name, *dmi->uuid ? dmi->uuid : NULL, md);
+	if (IS_ERR(hc))
 		goto err_destroy_dm;
 
 	/* alloc table */
 	r = dm_table_create(&t, get_mode(dmi), dmi->target_count, md);
 	if (r)
-		goto err_destroy_dm;
+		goto err_hash_remove;
 
 	/* add targets */
 	for (i = 0; i < dmi->target_count; i++) {
@@ -2116,6 +2119,8 @@ int __init dm_early_create(struct dm_ioctl *dmi,
 
 err_destroy_table:
 	dm_table_destroy(t);
+err_hash_remove:
+	__hash_remove(hc);
 err_destroy_dm:
 	dm_put(md);
 	dm_destroy(md);
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
