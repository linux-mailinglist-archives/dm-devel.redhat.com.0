Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5C61027BE7C
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 09:56:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-q9u0MfZsM_W7jLwd1_G1XA-1; Tue, 29 Sep 2020 03:55:28 -0400
X-MC-Unique: q9u0MfZsM_W7jLwd1_G1XA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2E911018F64;
	Tue, 29 Sep 2020 07:55:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A00E65D9E8;
	Tue, 29 Sep 2020 07:55:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 574511826D29;
	Tue, 29 Sep 2020 07:55:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08RCABd5014093 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Sep 2020 08:10:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 19D34200A7CD; Sun, 27 Sep 2020 12:10:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B60202B169
	for <dm-devel@redhat.com>; Sun, 27 Sep 2020 12:10:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D8468582A2
	for <dm-devel@redhat.com>; Sun, 27 Sep 2020 12:10:09 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
	(out30-56.freemail.mail.aliyun.com [115.124.30.56]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-23-CGXJxwVNO5e6ohAj_LmRQQ-1;
	Sun, 27 Sep 2020 08:10:03 -0400
X-MC-Unique: CGXJxwVNO5e6ohAj_LmRQQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R741e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
	TI=SMTPD_---0UAD-.cp_1601208275
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UAD-.cp_1601208275) by smtp.aliyun-inc.com(127.0.0.1);
	Sun, 27 Sep 2020 20:04:35 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com
Date: Sun, 27 Sep 2020 20:04:35 +0800
Message-Id: <20200927120435.44118-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 03:54:59 -0400
Cc: joseph.qi@linux.alibaba.com, dm-devel@redhat.com
Subject: [dm-devel] [RFC] dm: fix imposition of queue_limits in dm_wq_work()
	thread
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Mike, would you mind further expalin why bio processed by dm_wq_work()
always gets a previous ->submit_bio. Considering the following call graph:

->submit_bio, that is, dm_submit_bio
  DMF_BLOCK_IO_FOR_SUSPEND set, thus queue_io()

then worker thread dm_wq_work()
  dm_process_bio  // at this point. the input bio is the original bio
                     submitted to dm device

Please let me know if I missed something.

Thanks.
Jeffle


Original commit log:
dm_process_bio() can be called by dm_wq_work(), and if the currently
processing bio is the very beginning bio submitted to the dm device,
that is it has not been handled by previous ->submit_bio, then we also
need to impose the queue_limits when it's in thread (dm_wq_work()).

Fixes: cf9c37865557 ("dm: fix comment in dm_process_bio()")
Fixes: 568c73a355e0 ("dm: update dm_process_bio() to split bio if in ->make_request_fn()")
Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 drivers/md/dm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 6ed05ca65a0f..54471c75ddef 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1744,17 +1744,13 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
 	}
 
 	/*
-	 * If in ->submit_bio we need to use blk_queue_split(), otherwise
-	 * queue_limits for abnormal requests (e.g. discard, writesame, etc)
-	 * won't be imposed.
-	 * If called from dm_wq_work() for deferred bio processing, bio
-	 * was already handled by following code with previous ->submit_bio.
+	 * Call blk_queue_split() so that queue_limits for abnormal requests
+	 * (e.g. discard, writesame, etc) are ensured to be imposed, while
+	 * it's not needed for regular IO, since regular IO will be split by
+	 * following __split_and_process_bio.
 	 */
-	if (current->bio_list) {
-		if (is_abnormal_io(bio))
-			blk_queue_split(&bio);
-		/* regular IO is split by __split_and_process_bio */
-	}
+	if (is_abnormal_io(bio))
+		blk_queue_split(&bio);
 
 	if (dm_get_md_type(md) == DM_TYPE_NVME_BIO_BASED)
 		return __process_bio(md, map, bio, ti);
-- 
2.27.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

