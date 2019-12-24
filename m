Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2E61312CA93
	for <lists+dm-devel@lfdr.de>; Sun, 29 Dec 2019 20:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577646843;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2P676K7EeKwSxUI2QQR0R9/qyyTEk9nCab9lzQcdoSs=;
	b=YN1p4pntwA/LRg/fruZkHa4JcUeExsfbIh+vmKYj2VjpG2ZlDiZ0igtjxSMpUhIVZQ1/c7
	zg9ZZZLJAoJfXcmdrRjMrAC5+/TZ2j0tJHmacWfRTiZ9/BSavUxwpzK7lq0iQFTR5bsh2f
	Qn8MAlPeVJCYujjwkOMaQGfyfmKQZXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-c_sTy7Q5M0Cg9hLDBkZAHA-1; Sun, 29 Dec 2019 14:13:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D75D1804166;
	Sun, 29 Dec 2019 19:13:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6571763B83;
	Sun, 29 Dec 2019 19:13:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF4D8819C9;
	Sun, 29 Dec 2019 19:13:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBO6V2dI027284 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Dec 2019 01:31:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 89EFA20316E0; Tue, 24 Dec 2019 06:31:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 855A12026D67
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:31:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67FA380209E
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:31:02 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-187-IAoZ9YhZO36oOeefWi4DQQ-1; Tue, 24 Dec 2019 01:30:58 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id EDD35D23C1DD01A429B5;
	Tue, 24 Dec 2019 14:30:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Dec 2019
	14:30:42 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Tue, 24 Dec 2019 14:38:00 +0800
Message-ID: <1577169483-138896-2-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1577169483-138896-1-git-send-email-zhengbin13@huawei.com>
References: <1577169483-138896-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-MC-Unique: IAoZ9YhZO36oOeefWi4DQQ-1
X-MC-Unique: c_sTy7Q5M0Cg9hLDBkZAHA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBO6V2dI027284
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:12:32 -0500
Cc: zhengbin13@huawei.com
Subject: [dm-devel] [PATCH 1/4] dm mpath: use true,false for bool variable
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

Fixes coccicheck warning:

drivers/md/dm-mpath.c:1447:2-13: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/md/dm-mpath.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index e0c3279..97c0952 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -1444,7 +1444,7 @@ static void pg_init_done(void *data, int errors)
 		break;
 	case SCSI_DH_RETRY:
 		/* Wait before retrying. */
-		delay_retry = 1;
+		delay_retry = true;
 		/* fall through */
 	case SCSI_DH_IMM_RETRY:
 	case SCSI_DH_RES_TEMP_UNAVAIL:
--
2.7.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

