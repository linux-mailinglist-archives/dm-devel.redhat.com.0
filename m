Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AADCA12CA8F
	for <lists+dm-devel@lfdr.de>; Sun, 29 Dec 2019 20:13:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577646794;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a6I28coIh1j7m/KNadWCRz2SE8gflww4cqHjM35+5DE=;
	b=NmS7UOsWb3UAgrDp18GwzQ5UkEBS3NSLtF3UCxASZOTcSn5TdCMCXeVYKgnuC86iyERl+R
	9LyjG1+Fyz3rFtkr+Bztyejx93khvZqW1kBl1ShwBpFVy7JrW4eYKLHDpph6xOcL9Wbssg
	Q/+NOra7Iy0vT+0Bv3phaSh0pkyrnd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-6uZD4CdyNVGsysHeTY65lw-1; Sun, 29 Dec 2019 14:13:12 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAE13180417C;
	Sun, 29 Dec 2019 19:13:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B317F19C69;
	Sun, 29 Dec 2019 19:13:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B093818089CD;
	Sun, 29 Dec 2019 19:12:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBO6V3QG027289 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Dec 2019 01:31:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0A7472166B29; Tue, 24 Dec 2019 06:31:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 064262166B27
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:31:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C70A81018C47
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:31:00 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-369-oKIfwtjcOLmO9WSEr3Dg3Q-1; Tue, 24 Dec 2019 01:30:56 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id E660F8C38BAFDB3A9E18;
	Tue, 24 Dec 2019 14:30:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Dec 2019
	14:30:43 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Tue, 24 Dec 2019 14:38:01 +0800
Message-ID: <1577169483-138896-3-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1577169483-138896-1-git-send-email-zhengbin13@huawei.com>
References: <1577169483-138896-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-MC-Unique: oKIfwtjcOLmO9WSEr3Dg3Q-1
X-MC-Unique: 6uZD4CdyNVGsysHeTY65lw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBO6V3QG027289
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:12:32 -0500
Cc: zhengbin13@huawei.com
Subject: [dm-devel] [PATCH 2/4] dm bio prison v2: use true,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixes coccicheck warning:

drivers/md/dm-bio-prison-v2.c:327:2-22: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/md/dm-bio-prison-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-bio-prison-v2.c b/drivers/md/dm-bio-prison-v2.c
index 8ee019e..9dec3b6 100644
--- a/drivers/md/dm-bio-prison-v2.c
+++ b/drivers/md/dm-bio-prison-v2.c
@@ -324,7 +324,7 @@ static bool __unlock(struct dm_bio_prison_v2 *prison,
 	bio_list_init(&cell->bios);

 	if (cell->shared_count) {
-		cell->exclusive_lock = 0;
+		cell->exclusive_lock = false;
 		return false;
 	}

--
2.7.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

