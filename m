Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6AF12CA90
	for <lists+dm-devel@lfdr.de>; Sun, 29 Dec 2019 20:13:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577646794;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TKmt+SNkKiWDaqup48IT8wparIKv0HbuMlfjff6q3Aw=;
	b=RyKwi++wWcMA/jFMxNyRTBtYFsgzKVmMIUJuoV+2Jvf2lrk3gj3/oG4pRG79QysQWgZV2w
	SwE7K3KhVngoiD9uX8QjfRSbuPHdhyHupOOgPh4RU3F5et0xQfdCOBoTpSp5Q5kBO6Hub3
	dHwMztcjPzLFJgnEyxfxOWogZdhxzmo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-LrpJLIhhM0KAsIm44YtNxQ-1; Sun, 29 Dec 2019 14:13:11 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D699800D4C;
	Sun, 29 Dec 2019 19:13:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B52785C54A;
	Sun, 29 Dec 2019 19:13:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6A6E18089D0;
	Sun, 29 Dec 2019 19:12:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBO6V0GL027274 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Dec 2019 01:31:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5ABD82026D68; Tue, 24 Dec 2019 06:31:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 561592026D67
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:30:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 622B885A306
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:30:58 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-156-jnpe9ba3P3mZ0z_7NCtt7A-1; Tue, 24 Dec 2019 01:30:55 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id E9F88C601DFD7EE973F0;
	Tue, 24 Dec 2019 14:30:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Dec 2019
	14:30:43 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Tue, 24 Dec 2019 14:38:02 +0800
Message-ID: <1577169483-138896-4-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1577169483-138896-1-git-send-email-zhengbin13@huawei.com>
References: <1577169483-138896-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-MC-Unique: jnpe9ba3P3mZ0z_7NCtt7A-1
X-MC-Unique: LrpJLIhhM0KAsIm44YtNxQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBO6V0GL027274
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:12:32 -0500
Cc: zhengbin13@huawei.com
Subject: [dm-devel] [PATCH 3/4] dm snapshot: use true,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixes coccicheck warning:

drivers/md/dm-snap.c:1064:3-18: WARNING: Assignment of 0/1 to bool variable
drivers/md/dm-snap.c:1152:1-16: WARNING: Assignment of 0/1 to bool variable
drivers/md/dm-snap.c:1317:1-16: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/md/dm-snap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 4fb1a40..6b11a26 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -1061,7 +1061,7 @@ static void snapshot_merge_next_chunks(struct dm_snapshot *s)
 			DMERR("Read error in exception store: "
 			      "shutting down merge");
 			down_write(&s->lock);
-			s->merge_failed = 1;
+			s->merge_failed = true;
 			up_write(&s->lock);
 		}
 		goto shut;
@@ -1149,7 +1149,7 @@ static void merge_callback(int read_err, unsigned long write_err, void *context)

 shut:
 	down_write(&s->lock);
-	s->merge_failed = 1;
+	s->merge_failed = true;
 	b = __release_queued_bios_after_merge(s);
 	up_write(&s->lock);
 	error_bios(b);
@@ -1314,7 +1314,7 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	INIT_LIST_HEAD(&s->list);
 	spin_lock_init(&s->pe_lock);
 	s->state_bits = 0;
-	s->merge_failed = 0;
+	s->merge_failed = false;
 	s->first_merging_chunk = 0;
 	s->num_merging_chunks = 0;
 	bio_list_init(&s->bios_queued_during_merge);
--
2.7.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

