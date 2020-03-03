Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D069917715E
	for <lists+dm-devel@lfdr.de>; Tue,  3 Mar 2020 09:38:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583224722;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ytTYnmuxJeVoeXcV7jUBgy3A7QLOkhNGfyKJFpgIe5A=;
	b=OY/iMKwES+S/MZnXcmTwALDTGQJl1pecMPNRBzQ1ubpuCkCdB4MWKBGjnVBmj76Bwebw2Z
	wbYlvGtqGdfX/7MA3P5LzydX9q+9LLrTx8cLsUVH1pc8iId6Aipu0hgv+Y5TIDneuBIaOZ
	JAzYrAEsoZB7GjvwDGWt7JL7TqBpl4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-ooWFchPRPu252hiHOn2Dmw-1; Tue, 03 Mar 2020 03:38:40 -0500
X-MC-Unique: ooWFchPRPu252hiHOn2Dmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CEC418B5FA1;
	Tue,  3 Mar 2020 08:38:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4076560BF3;
	Tue,  3 Mar 2020 08:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 745CD1803C33;
	Tue,  3 Mar 2020 08:38:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0238c2Ov004655 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Mar 2020 03:38:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BE50AEB33C; Tue,  3 Mar 2020 08:38:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA650EB34C
	for <dm-devel@redhat.com>; Tue,  3 Mar 2020 08:38:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2790B8001EA
	for <dm-devel@redhat.com>; Tue,  3 Mar 2020 08:38:00 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-193-CQclJFYJPlCMKAnm7JXqVw-1; Tue, 03 Mar 2020 03:37:57 -0500
X-MC-Unique: CQclJFYJPlCMKAnm7JXqVw-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 12B83D25906FAD98CE4F;
	Tue,  3 Mar 2020 16:37:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
	16:37:46 +0800
From: Hou Tao <houtao1@huawei.com>
To: <dm-devel@redhat.com>
Date: Tue, 3 Mar 2020 16:45:01 +0800
Message-ID: <20200303084501.8912-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0238c2Ov004655
X-loop: dm-devel@redhat.com
Cc: tj@kernel.org, agk@redhat.com, snitzer@redhat.com
Subject: [dm-devel] [PATCH] dm: fix congested_fn for request-based device
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

We neither assign congested_fn for requested-based blk-mq device
nor implement it correctly. So fix both.

Fixes: 4aa9c692e052 ("bdi: separate out congested state into a separate struct")
Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/md/dm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index b89f07ee2eff..80b95e21db43 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1784,11 +1784,13 @@ static int dm_any_congested(void *congested_data, int bdi_bits)
 
 	if (!test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags)) {
 		if (dm_request_based(md)) {
+			struct backing_dev_info *bdi =
+				md->queue->backing_dev_info;
 			/*
 			 * With request-based DM we only need to check the
 			 * top-level queue for congestion.
 			 */
-			r = md->queue->backing_dev_info->wb.state & bdi_bits;
+			r = bdi->wb.congested->state & bdi_bits;
 		} else {
 			map = dm_get_live_table_fast(md);
 			if (map)
@@ -2265,6 +2267,7 @@ int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t)
 			DMERR("Cannot initialize queue for request-based dm-mq mapped device");
 			return r;
 		}
+		dm_init_normal_md_queue(md);
 		break;
 	case DM_TYPE_BIO_BASED:
 	case DM_TYPE_DAX_BIO_BASED:
-- 
2.25.0.4.g0ad7144999


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

