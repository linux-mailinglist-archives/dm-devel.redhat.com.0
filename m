Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 204ED12E45A
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jan 2020 10:20:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577956832;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3H/7yUhZw5U0xjnImSp7+ccN6IAC1e8bNNbjDN0x66o=;
	b=bUg/bi+5xvQDqu4Bvs3vo/GOHfY2DtzfCmH8yxNfJSCTFO1L8ylRTifhvr2eboqCJ97A7n
	WxXObvtwxietYK7Uw96r8iktIHKVxgT4IPJxMGm4fZQcjqgLudgALT7cAV652YXHsUDAzF
	HqKoOSCAd3Z4LokcpK+SujzEoOmgEww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-4Ty_AwsfM-GLgf1KVVFQ9w-1; Thu, 02 Jan 2020 04:20:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A9D38024EB;
	Thu,  2 Jan 2020 09:20:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5E0D10840D8;
	Thu,  2 Jan 2020 09:20:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D853218089CD;
	Thu,  2 Jan 2020 09:19:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBU2spWq016355 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 29 Dec 2019 21:54:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6EB7610F1C00; Mon, 30 Dec 2019 02:54:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A26710F1BE1
	for <dm-devel@redhat.com>; Mon, 30 Dec 2019 02:54:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9026510197E6
	for <dm-devel@redhat.com>; Mon, 30 Dec 2019 02:54:48 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07488;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=4; SR=0;
	TI=SMTPD_---0TmDbJu5_1577674472;
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-243-KJCn9FysOjSQgg7ZPdtuZQ-1;
	Sun, 29 Dec 2019 21:54:44 -0500
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0TmDbJu5_1577674472) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 30 Dec 2019 10:54:33 +0800
From: Jeffle Xu <jefflexu@linux.alibaba.com>
To: snitzer@redhat.com, dm-devel@redhat.com, agk@redhat.com
Date: Mon, 30 Dec 2019 10:54:32 +0800
Message-Id: <1577674472-14110-1-git-send-email-jefflexu@linux.alibaba.com>
X-MC-Unique: KJCn9FysOjSQgg7ZPdtuZQ-1
X-MC-Unique: 4Ty_AwsfM-GLgf1KVVFQ9w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBU2spWq016355
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 02 Jan 2020 04:19:37 -0500
Cc: joseph.qi@linux.alibaba.com
Subject: [dm-devel] [PATCH] dm-thin: Fix trivial error in comment
	documentation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's a trivial error in comment documentation, but it may be
confusing to new developers. So just fix it.

Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
---
 drivers/md/dm-thin-metadata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index b88d6d7..df8b804 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -28,7 +28,7 @@
  *
  * - A hierarchical btree, with 2 levels which effectively maps (thin
  *   dev id, virtual block) -> block_time.  Block time is a 64-bit
- *   field holding the time in the low 24 bits, and block in the top 48
+ *   field holding the time in the low 24 bits, and block in the top 40
  *   bits.
  *
  * BTrees consist solely of btree_nodes, that fill a block.  Some are
-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

