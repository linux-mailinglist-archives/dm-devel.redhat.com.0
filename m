Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F21961659D1
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ehi4dC3yKjNne6Iq/iTc2f36m0Ie1kiLdgrOY93UWb8=;
	b=DL+mFB8dvoJMvAdTjP7mTjvhNXbt65PrgyGFjx4wB7ZA2zO9wSoTFLXPtjspjBjQct9vJY
	yQzHspHDtgzkEfOeZMdQ6dLJqy7/NYzwSpBIg8rcCJjGG8GqqEhEvhhb5pxop5aLD0Cq4H
	EZwJs1VGvIyM40DLr7qg28f8ePm4XF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-hO2BJ7gCMhyQkxO1bOqAuQ-1; Thu, 20 Feb 2020 04:06:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51015100727C;
	Thu, 20 Feb 2020 09:06:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1256B60C99;
	Thu, 20 Feb 2020 09:06:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C33618034ED;
	Thu, 20 Feb 2020 09:06:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01EG8hDo027607 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Feb 2020 11:08:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 77C8A176F5; Fri, 14 Feb 2020 16:08:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73CCAF4974
	for <dm-devel@redhat.com>; Fri, 14 Feb 2020 16:08:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 436F3803896
	for <dm-devel@redhat.com>; Fri, 14 Feb 2020 16:08:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-82-3akn7hE2PWmcyacbPULdtg-1; 
	Fri, 14 Feb 2020 11:08:33 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 77DB524676;
	Fri, 14 Feb 2020 16:08:31 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:59:24 -0500
Message-Id: <20200214160149.11681-314-sashal@kernel.org>
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: 3akn7hE2PWmcyacbPULdtg-1
X-MC-Unique: hO2BJ7gCMhyQkxO1bOqAuQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01EG8hDo027607
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: Sasha Levin <sashal@kernel.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH AUTOSEL 5.4 314/459] dm thin: don't allow
	changing data device during thin-pool reload
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Mikulas Patocka <mpatocka@redhat.com>

[ Upstream commit 873937e75f9a8ea231a502c3d29d9cb6ad91b3ef ]

The existing code allows changing the data device when the thin-pool
target is reloaded.

This capability is not required and only complicates device lifetime
guarantees. This can cause crashes like the one reported here:
	https://bugzilla.redhat.com/show_bug.cgi?id=1788596
where the kernel tries to issue a flush bio located in a structure that
was already freed.

Take the first step to simplifying the thin-pool's data device lifetime
by disallowing changing it. Like the thin-pool's metadata device, the
data device is now set in pool_create() and it cannot be changed for a
given thin-pool.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-thin.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 69201bdf7f4c6..1b2c98b43519f 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -231,6 +231,7 @@ struct pool {
 	struct dm_target *ti;	/* Only set if a pool target is bound */
 
 	struct mapped_device *pool_md;
+	struct block_device *data_dev;
 	struct block_device *md_dev;
 	struct dm_pool_metadata *pmd;
 
@@ -2945,6 +2946,7 @@ static struct kmem_cache *_new_mapping_cache;
 
 static struct pool *pool_create(struct mapped_device *pool_md,
 				struct block_device *metadata_dev,
+				struct block_device *data_dev,
 				unsigned long block_size,
 				int read_only, char **error)
 {
@@ -3052,6 +3054,7 @@ static struct pool *pool_create(struct mapped_device *pool_md,
 	pool->last_commit_jiffies = jiffies;
 	pool->pool_md = pool_md;
 	pool->md_dev = metadata_dev;
+	pool->data_dev = data_dev;
 	__pool_table_insert(pool);
 
 	return pool;
@@ -3093,6 +3096,7 @@ static void __pool_dec(struct pool *pool)
 
 static struct pool *__pool_find(struct mapped_device *pool_md,
 				struct block_device *metadata_dev,
+				struct block_device *data_dev,
 				unsigned long block_size, int read_only,
 				char **error, int *created)
 {
@@ -3103,19 +3107,23 @@ static struct pool *__pool_find(struct mapped_device *pool_md,
 			*error = "metadata device already in use by a pool";
 			return ERR_PTR(-EBUSY);
 		}
+		if (pool->data_dev != data_dev) {
+			*error = "data device already in use by a pool";
+			return ERR_PTR(-EBUSY);
+		}
 		__pool_inc(pool);
 
 	} else {
 		pool = __pool_table_lookup(pool_md);
 		if (pool) {
-			if (pool->md_dev != metadata_dev) {
+			if (pool->md_dev != metadata_dev || pool->data_dev != data_dev) {
 				*error = "different pool cannot replace a pool";
 				return ERR_PTR(-EINVAL);
 			}
 			__pool_inc(pool);
 
 		} else {
-			pool = pool_create(pool_md, metadata_dev, block_size, read_only, error);
+			pool = pool_create(pool_md, metadata_dev, data_dev, block_size, read_only, error);
 			*created = 1;
 		}
 	}
@@ -3368,7 +3376,7 @@ static int pool_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		goto out;
 	}
 
-	pool = __pool_find(dm_table_get_md(ti->table), metadata_dev->bdev,
+	pool = __pool_find(dm_table_get_md(ti->table), metadata_dev->bdev, data_dev->bdev,
 			   block_size, pf.mode == PM_READ_ONLY, &ti->error, &pool_created);
 	if (IS_ERR(pool)) {
 		r = PTR_ERR(pool);
@@ -4114,7 +4122,7 @@ static struct target_type pool_target = {
 	.name = "thin-pool",
 	.features = DM_TARGET_SINGLETON | DM_TARGET_ALWAYS_WRITEABLE |
 		    DM_TARGET_IMMUTABLE,
-	.version = {1, 21, 0},
+	.version = {1, 22, 0},
 	.module = THIS_MODULE,
 	.ctr = pool_ctr,
 	.dtr = pool_dtr,
@@ -4493,7 +4501,7 @@ static void thin_io_hints(struct dm_target *ti, struct queue_limits *limits)
 
 static struct target_type thin_target = {
 	.name = "thin",
-	.version = {1, 21, 0},
+	.version = {1, 22, 0},
 	.module	= THIS_MODULE,
 	.ctr = thin_ctr,
 	.dtr = thin_dtr,
-- 
2.20.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

