Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B617D12CA91
	for <lists+dm-devel@lfdr.de>; Sun, 29 Dec 2019 20:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577646796;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lblx7UZRxetuyOHtuowYZITktPUWzufqyf4r5Q4/8RI=;
	b=YOq364O3RgEnYbVZIQQxLQv9b7Xs+YkzxcTO/0Uj218yPXhHz31KBtLIDi7jkIcXFjXG86
	0/sbNltSpwn8fZa8L/J5rz9MDfW9wzamhjItRtpSpL7tv7vH7xCXwVthlCGfWDXicnlasI
	lM8Q55/66rQKeIfTohSMKErFmJArpLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-oc82RAfrOtC8x9fBf0qk0Q-1; Sun, 29 Dec 2019 14:13:14 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA1C9801E70;
	Sun, 29 Dec 2019 19:13:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67F5A81E06;
	Sun, 29 Dec 2019 19:13:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0011F819D2;
	Sun, 29 Dec 2019 19:13:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBO6Vdu2027312 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Dec 2019 01:31:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B87E42026D68; Tue, 24 Dec 2019 06:31:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3B142026D67
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:31:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB8C51018C49
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:31:37 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-74-vvSvz0cqMluImAn_OH_7CA-1; Tue, 24 Dec 2019 01:30:55 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id E2728ED7D818DE878FBB;
	Tue, 24 Dec 2019 14:30:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Dec 2019
	14:30:43 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Tue, 24 Dec 2019 14:38:03 +0800
Message-ID: <1577169483-138896-5-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1577169483-138896-1-git-send-email-zhengbin13@huawei.com>
References: <1577169483-138896-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-MC-Unique: vvSvz0cqMluImAn_OH_7CA-1
X-MC-Unique: oc82RAfrOtC8x9fBf0qk0Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBO6Vdu2027312
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:12:33 -0500
Cc: zhengbin13@huawei.com
Subject: [dm-devel] [PATCH 4/4] dm thin metadata: use true,
	false for bool variable
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixes coccicheck warning:

drivers/md/dm-thin-metadata.c:814:3-14: WARNING: Assignment of 0/1 to bool variable
drivers/md/dm-thin-metadata.c:1109:1-12: WARNING: Assignment of 0/1 to bool variable
drivers/md/dm-thin-metadata.c:1621:1-12: WARNING: Assignment of 0/1 to bool variable
drivers/md/dm-thin-metadata.c:1652:1-12: WARNING: Assignment of 0/1 to bool variable
drivers/md/dm-thin-metadata.c:1706:1-12: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/md/dm-thin-metadata.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index b88d6d7..ca03b38 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -811,7 +811,7 @@ static int __write_changed_details(struct dm_pool_metadata *pmd)
 			return r;

 		if (td->open_count)
-			td->changed = 0;
+			td->changed = false;
 		else {
 			list_del(&td->list);
 			kfree(td);
@@ -1106,7 +1106,7 @@ static int __set_snapshot_details(struct dm_pool_metadata *pmd,
 	if (r)
 		return r;

-	td->changed = 1;
+	td->changed = true;
 	td->snapshotted_time = time;

 	snap->mapped_blocks = td->mapped_blocks;
@@ -1618,7 +1618,7 @@ static int __insert(struct dm_thin_device *td, dm_block_t block,
 	if (r)
 		return r;

-	td->changed = 1;
+	td->changed = true;
 	if (inserted)
 		td->mapped_blocks++;

@@ -1649,7 +1649,7 @@ static int __remove(struct dm_thin_device *td, dm_block_t block)
 		return r;

 	td->mapped_blocks--;
-	td->changed = 1;
+	td->changed = true;

 	return 0;
 }
@@ -1703,7 +1703,7 @@ static int __remove_range(struct dm_thin_device *td, dm_block_t begin, dm_block_
 	}

 	td->mapped_blocks -= total_count;
-	td->changed = 1;
+	td->changed = true;

 	/*
 	 * Reinsert the mapping tree.
--
2.7.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

