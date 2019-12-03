Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id E434310FC8E
	for <lists+dm-devel@lfdr.de>; Tue,  3 Dec 2019 12:36:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575373001;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GCZQgrBTh0MyX2ShmMmLmf3qFS+qG9CvGPOOrxQSZMI=;
	b=HtqLemSK1esWlzapHrF06xjqBbtfnw7XftzaGNYhG3kWcEu1EyvduYPJ3aVhQgbS9jlTM3
	0mBrN1ax4Bu1eb0s36OUWFFCiCkaIOqp+52C76uDaaQhBLDaB5NmF0rfSoXuSXRxaG5FtO
	vajHc8u/v55539CRqZoqyVFXgpuh4Kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-LfYm64mPMjSSAlj8sVUQDg-1; Tue, 03 Dec 2019 06:36:39 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25F9C107ACE8;
	Tue,  3 Dec 2019 11:36:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A383819C69;
	Tue,  3 Dec 2019 11:36:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40C985BBFB;
	Tue,  3 Dec 2019 11:36:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB3BZvK0009659 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 06:35:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 364F320316EB; Tue,  3 Dec 2019 11:35:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31D0320316E0
	for <dm-devel@redhat.com>; Tue,  3 Dec 2019 11:35:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62FF085A30D
	for <dm-devel@redhat.com>; Tue,  3 Dec 2019 11:35:53 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-256-C7Tyl06bPj63-3pNoSSwNg-1; Tue, 03 Dec 2019 06:35:49 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 159845D8FAC6798ECC27;
	Tue,  3 Dec 2019 19:35:44 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Dec 2019
	19:35:36 +0800
From: Hou Tao <houtao1@huawei.com>
To: <dm-devel@redhat.com>
Date: Tue, 3 Dec 2019 19:42:58 +0800
Message-ID: <20191203114258.8912-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-MC-Unique: C7Tyl06bPj63-3pNoSSwNg-1
X-MC-Unique: LfYm64mPMjSSAlj8sVUQDg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB3BZvK0009659
X-loop: dm-devel@redhat.com
Cc: thornber@redhat.com, snitzer@redhat.com, agk@redhat.com, houtao1@huawei.com
Subject: [dm-devel] [PATCH] dm btree: increase rebalance threshold in
	__rebalance2()
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We got the following warnings from thin_check during thin-pool setup:

  $ thin_check /dev/vdb
  examining superblock
  examining devices tree
    missing devices: [1, 84]
      too few entries in btree_node: 41, expected at least 42 (block 138, max_entries = 126)
  examining mapping tree

The phenomenon is the number of entries in one node of details_info tree is
less than (max_entries / 3). And it can be easily reproduced by the following
procedures:

  $ new a thin pool
  $ presume the max entries of details_info tree is 126
  $ new 127 thin devices (e.g. 1~127) to make the root node being full
    and then split
  $ remove the first 43 (e.g. 1~43) thin devices to make the children
    reblance repeatedly
  $ stop the thin pool
  $ thin_check

The root cause is that the B-tree removal procedure in __rebalance2()
doesn't guarantee the invariance: the minimal number of entries in
non-root node should be >= (max_entries / 3).

Simply fix the problem by increasing the rebalance threshold to
make sure the number of entries in each child will be greater
than or equal to (max_entries / 3 + 1), so no matter which
child is used for removal, the number will still be valid.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/md/persistent-data/dm-btree-remove.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/md/persistent-data/dm-btree-remove.c b/drivers/md/persistent-data/dm-btree-remove.c
index 21ea537bd55e..eff04fa23dfa 100644
--- a/drivers/md/persistent-data/dm-btree-remove.c
+++ b/drivers/md/persistent-data/dm-btree-remove.c
@@ -203,7 +203,13 @@ static void __rebalance2(struct dm_btree_info *info, struct btree_node *parent,
 	struct btree_node *right = r->n;
 	uint32_t nr_left = le32_to_cpu(left->header.nr_entries);
 	uint32_t nr_right = le32_to_cpu(right->header.nr_entries);
-	unsigned threshold = 2 * merge_threshold(left) + 1;
+	/*
+	 * Ensure the number of entries in each child will be greater
+	 * than or equal to (max_entries / 3 + 1), so no matter which
+	 * child is used for removal, the number will still be not
+	 * less than (max_entries / 3).
+	 */
+	unsigned int threshold = 2 * (merge_threshold(left) + 1);
 
 	if (nr_left + nr_right < threshold) {
 		/*
-- 
2.22.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

