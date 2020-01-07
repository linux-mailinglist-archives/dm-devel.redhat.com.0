Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DAF29131EAB
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jan 2020 05:37:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578371872;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wrHZ5ahJGxbp+g8edpwcQRQ+fCNwfypzO/0Mficd5Cc=;
	b=TIBmW6L16BmsnU5ML+TaMVSTzxy8lyG4/jxpqBJoG909+U49OKuXupY8O1Dgtj4miHhfvV
	mKE1T66zcI5l+qizNLCTiv2TEc0xEg8yu3sGgui5a5H8OGrZZcXeAXFBmWKCnVxvFno5Dm
	n1Zg0WD58dlOOD8xVBCEP+wtaNRfwVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-2-GG6sOyOpWxd6AsKF0YKw-1; Mon, 06 Jan 2020 23:37:50 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9496D477;
	Tue,  7 Jan 2020 04:37:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 353C47EF77;
	Tue,  7 Jan 2020 04:37:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D305781C84;
	Tue,  7 Jan 2020 04:37:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0074bDlr030781 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jan 2020 23:37:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0E73110F9BE; Tue,  7 Jan 2020 04:37:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09C5210F9B7
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 04:37:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05688802066
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 04:37:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-289-XBw-6V27Mw-Ro3E8KKba9g-1;
	Mon, 06 Jan 2020 23:37:00 -0500
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 104CD2075A;
	Tue,  7 Jan 2020 04:36:58 +0000 (UTC)
From: Eric Biggers <ebiggers@kernel.org>
To: dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Date: Mon,  6 Jan 2020 20:34:24 -0800
Message-Id: <20200107043424.18668-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-MC-Unique: XBw-6V27Mw-Ro3E8KKba9g-1
X-MC-Unique: 2-GG6sOyOpWxd6AsKF0YKw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0074bDlr030781
X-loop: dm-devel@redhat.com
Cc: "yuanjiong . gao" <yuanjiong.gao@transsion.com>,
	"ruxian . feng" <ruxian.feng@transsion.com>,
	"xianrong.zhou" <xianrong.zhou@transsion.com>,
	Patrik Torstensson <totte@google.com>, Eric Biggers <ebiggers@google.com>
Subject: [dm-devel] [PATCH v3] dm verity: don't prefetch hash blocks for
	already-verified data
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "xianrong.zhou" <xianrong.zhou@transsion.com>

Try to skip prefetching hash blocks that won't be needed due to the
"check_at_most_once" option being enabled and the corresponding data
blocks already having been verified.

Since prefetching operates on a range of data blocks, do this by just
trimming the two ends of the range.  This doesn't skip every unneeded
hash block, since data blocks in the middle of the range could also be
unneeded, and hash blocks are still prefetched in large clusters as
controlled by dm_verity_prefetch_cluster.  But it can still help a lot.

In a test on Android Q launching 91 apps every 15s repeated 21 times,
prefetching was only done for 447177/4776629 = 9.36% of data blocks.

Tested-by: ruxian.feng <ruxian.feng@transsion.com>
Co-developed-by: yuanjiong.gao <yuanjiong.gao@transsion.com>
Signed-off-by: yuanjiong.gao <yuanjiong.gao@transsion.com>
Signed-off-by: xianrong.zhou <xianrong.zhou@transsion.com>
[EB: simplified the 'while' loops and improved the commit message]
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/md/dm-verity-target.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 4fb33e7562c5..0d61e9c67986 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -611,8 +611,22 @@ static void verity_prefetch_io(struct work_struct *work)
 
 static void verity_submit_prefetch(struct dm_verity *v, struct dm_verity_io *io)
 {
+	sector_t block = io->block;
+	unsigned int n_blocks = io->n_blocks;
 	struct dm_verity_prefetch_work *pw;
 
+	if (v->validated_blocks) {
+		while (n_blocks && test_bit(block, v->validated_blocks)) {
+			block++;
+			n_blocks--;
+		}
+		while (n_blocks && test_bit(block + n_blocks - 1,
+					    v->validated_blocks))
+			n_blocks--;
+		if (!n_blocks)
+			return;
+	}
+
 	pw = kmalloc(sizeof(struct dm_verity_prefetch_work),
 		GFP_NOIO | __GFP_NORETRY | __GFP_NOMEMALLOC | __GFP_NOWARN);
 
@@ -621,8 +635,8 @@ static void verity_submit_prefetch(struct dm_verity *v, struct dm_verity_io *io)
 
 	INIT_WORK(&pw->work, verity_prefetch_io);
 	pw->v = v;
-	pw->block = io->block;
-	pw->n_blocks = io->n_blocks;
+	pw->block = block;
+	pw->n_blocks = n_blocks;
 	queue_work(v->verify_wq, &pw->work);
 }
 
-- 
2.24.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

