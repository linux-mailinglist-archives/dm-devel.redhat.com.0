Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DD8F81A2345
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 15:45:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586353507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vM2jHuuxyjdXnggp4Nd1ZJ+azSb5uAEk31SWb7LYnjg=;
	b=BcaE8f6o9uvSG2Vgk1f3B04DcefUr9c9BxHSCqr7bcTHHJ33E9OnsUSyUOGEmIfskPWuLi
	ay0oy7w4V7vxbgKt66e1uBuR9bpnjtaWLf4MoAyzSVnD5wOJhllHn20Fj2Nhl5dvcZeZzU
	h9ISAJmiU3tOp/eF4V+UA95RxBWh3OI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-C73tboRGMIWW7X7IEw7VLw-1; Wed, 08 Apr 2020 09:45:04 -0400
X-MC-Unique: C73tboRGMIWW7X7IEw7VLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FEFE1005513;
	Wed,  8 Apr 2020 13:44:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0525E010;
	Wed,  8 Apr 2020 13:44:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A54D18089C8;
	Wed,  8 Apr 2020 13:44:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0387RijT019231 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Apr 2020 03:27:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B490108BED; Wed,  8 Apr 2020 07:27:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76D03108BE9
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 07:27:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA66980029A
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 07:27:41 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-376-2g3ysYhfPIqDPrfrl8NtrA-1; Wed, 08 Apr 2020 03:27:39 -0400
X-MC-Unique: 2g3ysYhfPIqDPrfrl8NtrA-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 7CF5A5AEDFCA8666080F;
	Wed,  8 Apr 2020 15:27:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.487.0; Wed, 8 Apr 2020 15:27:27 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 8 Apr 2020 07:29:48 +0000
Message-ID: <20200408072948.156175-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0387RijT019231
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 08 Apr 2020 09:37:20 -0400
Cc: kernel-janitors@vger.kernel.org, dm-devel@redhat.com,
	YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
	Hulk Robot <hulkci@huawei.com>
Subject: [dm-devel] [PATCH -next] dm integrity: remove set but not used
	variables
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/md/dm-integrity.c: In function 'integrity_metadata':
drivers/md/dm-integrity.c:1557:12: warning:
 variable 'save_metadata_offset' set but not used [-Wunused-but-set-variable]
drivers/md/dm-integrity.c:1556:12: warning:
 variable 'save_metadata_block' set but not used [-Wunused-but-set-variable]

They are never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/md/dm-integrity.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index b989d109d55d..94fb584854b8 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -1553,8 +1553,6 @@ static void integrity_metadata(struct work_struct *w)
 		char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
 		sector_t sector;
 		unsigned sectors_to_process;
-		sector_t save_metadata_block;
-		unsigned save_metadata_offset;
 
 		if (unlikely(ic->mode == 'R'))
 			goto skip_io;
@@ -1605,8 +1603,6 @@ static void integrity_metadata(struct work_struct *w)
 			goto skip_io;
 		}
 
-		save_metadata_block = dio->metadata_block;
-		save_metadata_offset = dio->metadata_offset;
 		sector = dio->range.logical_sector;
 		sectors_to_process = dio->range.n_sectors;




--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

