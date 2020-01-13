Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 285CC139A9E
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jan 2020 21:15:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578946547;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uuZ0+uqjC8VShneUEBb6uqh0SZbxH4lr9wsj8FglM2s=;
	b=XsXI0mINEB6eaWrG9upYyLzF+9tDg/cWJJbyflKEo4bXUEnIoN3hEBIjBIBQlY9rCBQLWn
	VWfHYxAOgvgdhKS9xn/+UKwuuVNbuZ3+i43En4dTdyBy54XBCwLOZOw9ybzkiFmvKJPmDp
	30HOk0LWOE8h29RUyMGa5vmRsA4QIy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-UO_L9RSyNVS8F4oaxJGS1Q-1; Mon, 13 Jan 2020 15:15:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0BBE1922962;
	Mon, 13 Jan 2020 20:15:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1272A80F58;
	Mon, 13 Jan 2020 20:15:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C34582514;
	Mon, 13 Jan 2020 20:15:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DKF9Do010053 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 15:15:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5695F5DA32; Mon, 13 Jan 2020 20:15:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0FE5DA76;
	Mon, 13 Jan 2020 20:15:01 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 00DKF0at015933; Mon, 13 Jan 2020 15:15:00 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 00DKF0V3015929; Mon, 13 Jan 2020 15:15:00 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 13 Jan 2020 15:15:00 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, 
	Joe Thornber <thornber@redhat.com>
Message-ID: <alpine.LRH.2.02.2001131514060.15900@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 1/2] dm-thin: don't allow changing the data device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: UO_L9RSyNVS8F4oaxJGS1Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The existing code allow changing the data device when the dm-thin-pool
target is reloaded.

This can cause crashes like the one reported here:
	https://bugzilla.redhat.com/show_bug.cgi?id=1788596
where the kernel tries to issue a flush bio located in a structure that
was already freed.

Locking the data device would be quite tricky, so a better solution is to
disallow changing it - it is set in pool_create and it can never be
changed for the given pool.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org
Fixes: 694cfe7f31db ("dm thin: Flush data device before committing metadata")

---
 drivers/md/dm-thin.c |   16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-thin.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-thin.c	2020-01-13 16:13:42.000000000 +0100
+++ linux-2.6/drivers/md/dm-thin.c	2020-01-13 18:47:50.000000000 +0100
@@ -231,6 +231,7 @@ struct pool {
 	struct dm_target *ti;	/* Only set if a pool target is bound */
 
 	struct mapped_device *pool_md;
+	struct block_device *data_dev;
 	struct block_device *md_dev;
 	struct dm_pool_metadata *pmd;
 
@@ -2933,6 +2934,7 @@ static struct kmem_cache *_new_mapping_c
 
 static struct pool *pool_create(struct mapped_device *pool_md,
 				struct block_device *metadata_dev,
+				struct block_device *data_dev,
 				unsigned long block_size,
 				int read_only, char **error)
 {
@@ -3040,6 +3042,7 @@ static struct pool *pool_create(struct m
 	pool->last_commit_jiffies = jiffies;
 	pool->pool_md = pool_md;
 	pool->md_dev = metadata_dev;
+	pool->data_dev = data_dev;
 	__pool_table_insert(pool);
 
 	return pool;
@@ -3081,6 +3084,7 @@ static void __pool_dec(struct pool *pool
 
 static struct pool *__pool_find(struct mapped_device *pool_md,
 				struct block_device *metadata_dev,
+				struct block_device *data_dev,
 				unsigned long block_size, int read_only,
 				char **error, int *created)
 {
@@ -3091,6 +3095,10 @@ static struct pool *__pool_find(struct m
 			*error = "metadata device already in use by a pool";
 			return ERR_PTR(-EBUSY);
 		}
+		if (pool->data_dev != data_dev) {
+			*error = "data device already in use by a pool";
+			return ERR_PTR(-EBUSY);
+		}
 		__pool_inc(pool);
 
 	} else {
@@ -3100,10 +3108,14 @@ static struct pool *__pool_find(struct m
 				*error = "different pool cannot replace a pool";
 				return ERR_PTR(-EINVAL);
 			}
+			if (pool->data_dev != data_dev) {
+				*error = "different pool cannot replace a pool";
+				return ERR_PTR(-EINVAL);
+			}
 			__pool_inc(pool);
 
 		} else {
-			pool = pool_create(pool_md, metadata_dev, block_size, read_only, error);
+			pool = pool_create(pool_md, metadata_dev, data_dev, block_size, read_only, error);
 			*created = 1;
 		}
 	}
@@ -3356,7 +3368,7 @@ static int pool_ctr(struct dm_target *ti
 		goto out;
 	}
 
-	pool = __pool_find(dm_table_get_md(ti->table), metadata_dev->bdev,
+	pool = __pool_find(dm_table_get_md(ti->table), metadata_dev->bdev, data_dev->bdev,
 			   block_size, pf.mode == PM_READ_ONLY, &ti->error, &pool_created);
 	if (IS_ERR(pool)) {
 		r = PTR_ERR(pool);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

