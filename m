Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 501D1112D39
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 15:08:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575468487;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4OP1aPZ7dY9qkqy+6VsHo3HvKjYNau4GZh3AkWlFRlM=;
	b=exBYbfZSudGNglEiRLQbCwNZ2c0+RTNz29b9Xgz1pA0o5GlTLJm2zxkgTE5tMFUu+UjT4T
	lFwBSWXWja+p87z9KKOnqyvNHbYF2QT7QzJL4gvuj1k1Bufi4SRbfX+N4cozfHeHrZ4ciI
	iHnhNH5h1a3suezcHZtP+Ictep5Y7dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-ZzDWkUueOrSrrbtrJiDa1A-1; Wed, 04 Dec 2019 09:08:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57BE1104ECC7;
	Wed,  4 Dec 2019 14:07:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2664C5DA60;
	Wed,  4 Dec 2019 14:07:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3B8B5BC09;
	Wed,  4 Dec 2019 14:07:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4E7qws007070 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 09:07:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 986B820899F4; Wed,  4 Dec 2019 14:07:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93FB82026D68
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67E26802FF5
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:52 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-12-cLCR-SFjOE2ZCJPrjXam9Q-1; Wed, 04 Dec 2019 09:07:48 -0500
Received: by mail-lj1-f193.google.com with SMTP id h23so8240079ljc.8
	for <dm-devel@redhat.com>; Wed, 04 Dec 2019 06:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GbVW51uGGUA9zYmXh+XLbV7Bbm2WrgiiCZpfqnLU31I=;
	b=XnOINMh4sP1tHLj5aYNOLxTAWZEOPbjascYAFYrmTyNp8wt00LmPCIso/lRG5SG1t7
	2N8hjYqy2Rs4kgvPaNFDdBcXvsttIYmXxZSSJvlmCDMybOaWVQbYR30RbV40SUmACRD9
	pxfc/4MiZQzO1oGxg3PED3Dwy+uRjZQGnDZ6VJqUdlfxDLJJIZoIKVqMff+1XaVES/5Z
	gFGAaNawJauhHj+k2n7aeWS6X09si7TvK9auR8RaMIFLhgzJEEpdCwfSfF1gv2jorf8E
	NByY4ae9VwGXYMVdp1yPrtZq97L4po4HLirBiE/p4xKK0OtXoD1e5yDuelXWIuOT82wb
	HxmQ==
X-Gm-Message-State: APjAAAXq+oYHFUvakapavhfCUvuOFKleMR+juhfmI1Yz6EKgohVlkLdk
	EW3GSo+pWf4YE8kxnyoNP2LxlA==
X-Google-Smtp-Source: APXvYqy7gP8L9Ojjr5/TMzB8GfZwuPuxTSvPrpf+JPNBzEJ9rpRfTa29OBWtkwDU5vOJVFke5EE7Ng==
X-Received: by 2002:a05:651c:153:: with SMTP id
	c19mr2212376ljd.237.1575468467125; 
	Wed, 04 Dec 2019 06:07:47 -0800 (PST)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id n3sm3350450lfk.61.2019.12.04.06.07.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2019 06:07:46 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed,  4 Dec 2019 16:07:41 +0200
Message-Id: <20191204140742.26273-2-ntsironis@arrikto.com>
In-Reply-To: <20191204140742.26273-1-ntsironis@arrikto.com>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
X-MC-Unique: cLCR-SFjOE2ZCJPrjXam9Q-1
X-MC-Unique: ZzDWkUueOrSrrbtrJiDa1A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB4E7qws007070
X-loop: dm-devel@redhat.com
Cc: thornber@redhat.com, ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 1/2] dm thin metadata: Add support for a
	pre-commit callback
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support for one pre-commit callback which is run right before the
metadata are committed.

This allows the thin provisioning target to run a callback before the
metadata are committed and is required by the next commit.

Cc: stable@vger.kernel.org
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-thin-metadata.c | 29 +++++++++++++++++++++++++++++
 drivers/md/dm-thin-metadata.h |  7 +++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index 4c68a7b93d5e..b88d6d701f5b 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -189,6 +189,15 @@ struct dm_pool_metadata {
 	sector_t data_block_size;
 
 	/*
+	 * Pre-commit callback.
+	 *
+	 * This allows the thin provisioning target to run a callback before
+	 * the metadata are committed.
+	 */
+	dm_pool_pre_commit_fn pre_commit_fn;
+	void *pre_commit_context;
+
+	/*
 	 * We reserve a section of the metadata for commit overhead.
 	 * All reported space does *not* include this.
 	 */
@@ -826,6 +835,14 @@ static int __commit_transaction(struct dm_pool_metadata *pmd)
 	if (unlikely(!pmd->in_service))
 		return 0;
 
+	if (pmd->pre_commit_fn) {
+		r = pmd->pre_commit_fn(pmd->pre_commit_context);
+		if (r < 0) {
+			DMERR("pre-commit callback failed");
+			return r;
+		}
+	}
+
 	r = __write_changed_details(pmd);
 	if (r < 0)
 		return r;
@@ -892,6 +909,8 @@ struct dm_pool_metadata *dm_pool_metadata_open(struct block_device *bdev,
 	pmd->in_service = false;
 	pmd->bdev = bdev;
 	pmd->data_block_size = data_block_size;
+	pmd->pre_commit_fn = NULL;
+	pmd->pre_commit_context = NULL;
 
 	r = __create_persistent_data_objects(pmd, format_device);
 	if (r) {
@@ -2044,6 +2063,16 @@ int dm_pool_register_metadata_threshold(struct dm_pool_metadata *pmd,
 	return r;
 }
 
+void dm_pool_register_pre_commit_callback(struct dm_pool_metadata *pmd,
+					  dm_pool_pre_commit_fn fn,
+					  void *context)
+{
+	pmd_write_lock_in_core(pmd);
+	pmd->pre_commit_fn = fn;
+	pmd->pre_commit_context = context;
+	pmd_write_unlock(pmd);
+}
+
 int dm_pool_metadata_set_needs_check(struct dm_pool_metadata *pmd)
 {
 	int r = -EINVAL;
diff --git a/drivers/md/dm-thin-metadata.h b/drivers/md/dm-thin-metadata.h
index f6be0d733c20..7ef56bd2a7e3 100644
--- a/drivers/md/dm-thin-metadata.h
+++ b/drivers/md/dm-thin-metadata.h
@@ -230,6 +230,13 @@ bool dm_pool_metadata_needs_check(struct dm_pool_metadata *pmd);
  */
 void dm_pool_issue_prefetches(struct dm_pool_metadata *pmd);
 
+/* Pre-commit callback */
+typedef int (*dm_pool_pre_commit_fn)(void *context);
+
+void dm_pool_register_pre_commit_callback(struct dm_pool_metadata *pmd,
+					  dm_pool_pre_commit_fn fn,
+					  void *context);
+
 /*----------------------------------------------------------------*/
 
 #endif
-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

