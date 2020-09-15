Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 18B5626D49D
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 09:25:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-JKr0xB8dP8ezVAd9KG1IJw-1; Thu, 17 Sep 2020 03:25:49 -0400
X-MC-Unique: JKr0xB8dP8ezVAd9KG1IJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69C2264142;
	Thu, 17 Sep 2020 07:25:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C69B19D6C;
	Thu, 17 Sep 2020 07:25:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7489F183D03D;
	Thu, 17 Sep 2020 07:25:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08F9Bn1c029797 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 05:11:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 43CBF2166B44; Tue, 15 Sep 2020 09:11:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F46E2166B28
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 09:11:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 543BD801213
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 09:11:46 +0000 (UTC)
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
	[136.143.188.92]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-201-c_GOzYApPW-p0mlrYuQDzg-1; Tue, 15 Sep 2020 05:11:44 -0400
X-MC-Unique: c_GOzYApPW-p0mlrYuQDzg-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=DvdrCa2LwGY4Hi7SqqGeqrpgUEhl0KpS+MRLlHqcdfTYtZl6IEwCGvuFR1PGw3xFEUF0ukUTwDb5
	XgANupyT7OMG2MwRxgQmaCJesfVcXjIBQJ5fraQPhGbbVUV2XSip
Received: from YEHS1XPF1D05WL.lenovo.com (60.247.104.78 [60.247.104.78]) by
	mx.zohomail.com with SMTPS id 1600160188862947.0236886693741;
	Tue, 15 Sep 2020 01:56:28 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: snitzer@redhat.com, agk@redhat.com
Date: Tue, 15 Sep 2020 16:56:08 +0800
Message-Id: <20200915085608.13776-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 17 Sep 2020 03:25:18 -0400
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org, tyu1@lenovo.com,
	Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] [PATCH] dm thin metadata: Remove unused local variable
	when create thin and snap
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Huaisheng Ye <yehs1@lenovo.com>

The local variable disk details is not used during the creating of thin & snap
devices. Remove them from dm-thin-metadata, and add pointer validity check for
pointer value in btree_lookup_raw. Skip memory copy when the caller doesn't need
the value.

Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
---
 drivers/md/dm-thin-metadata.c         | 6 ++----
 drivers/md/persistent-data/dm-btree.c | 3 ++-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index b461836..6ebb212 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -1051,12 +1051,11 @@ static int __create_thin(struct dm_pool_metadata *pmd,
 	int r;
 	dm_block_t dev_root;
 	uint64_t key = dev;
-	struct disk_device_details details_le;
 	struct dm_thin_device *td;
 	__le64 value;
 
 	r = dm_btree_lookup(&pmd->details_info, pmd->details_root,
-			    &key, &details_le);
+			    &key, NULL);
 	if (!r)
 		return -EEXIST;
 
@@ -1129,12 +1128,11 @@ static int __create_snap(struct dm_pool_metadata *pmd,
 	dm_block_t origin_root;
 	uint64_t key = origin, dev_key = dev;
 	struct dm_thin_device *td;
-	struct disk_device_details details_le;
 	__le64 value;
 
 	/* check this device is unused */
 	r = dm_btree_lookup(&pmd->details_info, pmd->details_root,
-			    &dev_key, &details_le);
+			    &dev_key, NULL);
 	if (!r)
 		return -EEXIST;
 
diff --git a/drivers/md/persistent-data/dm-btree.c b/drivers/md/persistent-data/dm-btree.c
index 8aae062..ef6e78d 100644
--- a/drivers/md/persistent-data/dm-btree.c
+++ b/drivers/md/persistent-data/dm-btree.c
@@ -366,7 +366,8 @@ static int btree_lookup_raw(struct ro_spine *s, dm_block_t block, uint64_t key,
 	} while (!(flags & LEAF_NODE));
 
 	*result_key = le64_to_cpu(ro_node(s)->keys[i]);
-	memcpy(v, value_ptr(ro_node(s), i), value_size);
+	if (v)
+		memcpy(v, value_ptr(ro_node(s), i), value_size);
 
 	return 0;
 }
-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

