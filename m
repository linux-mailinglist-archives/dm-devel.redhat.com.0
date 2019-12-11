Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1F511A5EB
	for <lists+dm-devel@lfdr.de>; Wed, 11 Dec 2019 09:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576053237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zYu3K70MnN6PJzCG03GRIjik6K/7KZf18zWzcCYqq5o=;
	b=E+Y8e2YovykTIFQIKMXkWLWgT0C//uCyT/ZDyumGamUfgNBtmesl4MFA98tJPPChvxRB2f
	YfcWQYpVT+vlm/HCLV68F9wBg4MVNPB9YGfciwhd5hbPoqdqXprzDdF23cmiJHmXXVsiv6
	HTo0a5Fd4JsxruimMbfPej5s1y5NyBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-LvWh06oePNKNZ-XKjvRKzA-1; Wed, 11 Dec 2019 03:33:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7790E100551B;
	Wed, 11 Dec 2019 08:33:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F2360BAE;
	Wed, 11 Dec 2019 08:33:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3497A18089CD;
	Wed, 11 Dec 2019 08:33:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBB43ZX8026432 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Dec 2019 23:03:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 686CD2026D68; Wed, 11 Dec 2019 04:03:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63F8E2026D67
	for <dm-devel@redhat.com>; Wed, 11 Dec 2019 04:03:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36A841024261
	for <dm-devel@redhat.com>; Wed, 11 Dec 2019 04:03:33 +0000 (UTC)
Received: from m131-177.yeah.net (m131-177.yeah.net [123.58.177.131]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-338-fIRNtIwRN3yrrXFuPlPZmQ-1; Tue, 10 Dec 2019 23:03:30 -0500
Received: from 10-zhouzhurong.transsion.com (unknown [27.115.62.146])
	by smtp1 (Coremail) with SMTP id ClUQrABXUxNjY_Bdgx2CBA--.53268S4;
	Wed, 11 Dec 2019 11:32:55 +0800 (CST)
From: zhou xianrong <zhou_xianrong@yeah.net>
To: dm-devel@redhat.com
Date: Wed, 11 Dec 2019 11:32:40 +0800
Message-Id: <20191211033240.169-1-zhou_xianrong@yeah.net>
MIME-Version: 1.0
X-CM-TRANSID: ClUQrABXUxNjY_Bdgx2CBA--.53268S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFy7XrW5CFWxKw43ZFy3twb_yoW8Ar4rpa
	4q9ryY93WDGFZru3W3Ar17ZF1Fk3yktFy7KryxXwn8ZF909r13Jr1kJFW3ZFW2yFnxXFna
	vF13ZrW3Ka1qv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bY73kUUUUU=
X-Originating-IP: [27.115.62.146]
X-CM-SenderInfo: 52kr3sh0ld02xrqjq5hhdkh0dhw/1tbiFgiIeVUefPlfSwAAs1
X-MC-Unique: fIRNtIwRN3yrrXFuPlPZmQ-1
X-MC-Unique: LvWh06oePNKNZ-XKjvRKzA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBB43ZX8026432
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 11 Dec 2019 03:33:13 -0500
Cc: weimin.mao@transsion.com, haizhou.song@transsion.com, snitzer@redhat.com,
	wanbin.wang@transsion.com, xianrong.zhou@transsion.com,
	linux-kernel@vger.kernel.org, yuanjiong.gao@transsion.com,
	ruxian.feng@transsion.com, agk@redhat.com
Subject: [dm-devel] [PATCH] dm-verity: unnecessary data blocks that need not
	read hash blocks
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

If check_at_most_once enabled, just like verity work the prefetching work
should check for data block bitmap firstly before reading hash block
as well. Skip bit-set data blocks from both ends of data block range
by testing the validated bitmap. This can reduce the amounts of data 
blocks which need to read hash blocks.

Launching 91 apps every 15s and repeat 21 rounds on Android Q.
In prefetching work we can let only 2602/360312 = 0.72% data blocks
really need to read hash blocks.

But the reduced data blocks range would be enlarged again by
dm_verity_prefetch_cluster later.

Signed-off-by: xianrong.zhou <xianrong.zhou@transsion.com>
Signed-off-by: yuanjiong.gao <yuanjiong.gao@transsion.com>
Tested-by: ruxian.feng <ruxian.feng@transsion.com>
---
 drivers/md/dm-verity-target.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 4fb33e7562c5..7b8eb754c0b6 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -581,6 +581,22 @@ static void verity_prefetch_io(struct work_struct *work)
 	struct dm_verity *v = pw->v;
 	int i;
 
+	if (v->validated_blocks) {
+		while (pw->n_blocks) {
+			if (unlikely(!test_bit(pw->block, v->validated_blocks)))
+				break;
+			pw->block++;
+			pw->n_blocks--;
+		}
+		while (pw->n_blocks) {
+			if (unlikely(!test_bit(pw->block + pw->n_blocks - 1,
+				v->validated_blocks)))
+				break;
+			pw->n_blocks--;
+		}
+		if (!pw->n_blocks)
+			return;
+	}
 	for (i = v->levels - 2; i >= 0; i--) {
 		sector_t hash_block_start;
 		sector_t hash_block_end;
-- 
2.17.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

