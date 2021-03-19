Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0D203417B8
	for <lists+dm-devel@lfdr.de>; Fri, 19 Mar 2021 09:50:41 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-1wcwvNFRO7Squp9n_eT9SA-1; Fri, 19 Mar 2021 04:50:38 -0400
X-MC-Unique: 1wcwvNFRO7Squp9n_eT9SA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A6D887A841;
	Fri, 19 Mar 2021 08:50:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 740966F983;
	Fri, 19 Mar 2021 08:50:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F30F4A7C8;
	Fri, 19 Mar 2021 08:50:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12J8PBBn015732 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 04:25:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65E4F2157F24; Fri, 19 Mar 2021 08:25:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60EFC2166B44
	for <dm-devel@redhat.com>; Fri, 19 Mar 2021 08:25:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6BCF800B30
	for <dm-devel@redhat.com>; Fri, 19 Mar 2021 08:25:08 +0000 (UTC)
Received: from out30-132.freemail.mail.aliyun.com
	(out30-132.freemail.mail.aliyun.com [115.124.30.132]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-417-4GOSbdtMNhGIBNdaLG6g8A-1;
	Fri, 19 Mar 2021 04:25:04 -0400
X-MC-Unique: 4GOSbdtMNhGIBNdaLG6g8A-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
	MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0USZ52Gl_1616141975
Received: from
	j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
	fp:SMTPD_---0USZ52Gl_1616141975) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 19 Mar 2021 16:19:38 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: agk@redhat.com
Date: Fri, 19 Mar 2021 16:19:30 +0800
Message-Id: <1616141970-123042-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Mar 2021 04:50:24 -0400
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, snitzer@redhat.com
Subject: [dm-devel] [PATCH] dm persistent data: Remove unused variable ret
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix the following coccicheck warnings:

./drivers/md/persistent-data/dm-btree-spine.c:188:5-6: Unneeded
variable: "r". Return "0" on line 194.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/md/persistent-data/dm-btree-internal.h | 2 +-
 drivers/md/persistent-data/dm-btree-spine.c    | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/md/persistent-data/dm-btree-internal.h b/drivers/md/persistent-data/dm-btree-internal.h
index fe073d9..d0c5591 100644
--- a/drivers/md/persistent-data/dm-btree-internal.h
+++ b/drivers/md/persistent-data/dm-btree-internal.h
@@ -83,7 +83,7 @@ struct shadow_spine {
 };
 
 void init_shadow_spine(struct shadow_spine *s, struct dm_btree_info *info);
-int exit_shadow_spine(struct shadow_spine *s);
+void exit_shadow_spine(struct shadow_spine *s);
 
 int shadow_step(struct shadow_spine *s, dm_block_t b,
 		struct dm_btree_value_type *vt);
diff --git a/drivers/md/persistent-data/dm-btree-spine.c b/drivers/md/persistent-data/dm-btree-spine.c
index 8a2bfbf..dd2ff3c 100644
--- a/drivers/md/persistent-data/dm-btree-spine.c
+++ b/drivers/md/persistent-data/dm-btree-spine.c
@@ -183,15 +183,13 @@ void init_shadow_spine(struct shadow_spine *s, struct dm_btree_info *info)
 	s->count = 0;
 }
 
-int exit_shadow_spine(struct shadow_spine *s)
+void exit_shadow_spine(struct shadow_spine *s)
 {
-	int r = 0, i;
+	int i;
 
 	for (i = 0; i < s->count; i++) {
 		unlock_block(s->info, s->nodes[i]);
 	}
-
-	return r;
 }
 
 int shadow_step(struct shadow_spine *s, dm_block_t b,
-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

