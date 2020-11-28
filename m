Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8085E2C7E59
	for <lists+dm-devel@lfdr.de>; Mon, 30 Nov 2020 08:03:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-eQBlnJuYPrGiMJkx_3JiCg-1; Mon, 30 Nov 2020 02:03:08 -0500
X-MC-Unique: eQBlnJuYPrGiMJkx_3JiCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD9528144E3;
	Mon, 30 Nov 2020 07:03:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9DAB5D9D2;
	Mon, 30 Nov 2020 07:03:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E8FF5002E;
	Mon, 30 Nov 2020 07:03:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ASAXcrg021449 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 28 Nov 2020 05:33:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 28FE75EDF6; Sat, 28 Nov 2020 10:33:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2397B5D233
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 10:33:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB7A48007DF
	for <dm-devel@redhat.com>; Sat, 28 Nov 2020 10:33:35 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-387-k-SsjxPKMmK43XiEbjy_WQ-1; Sat, 28 Nov 2020 05:33:31 -0500
X-MC-Unique: k-SsjxPKMmK43XiEbjy_WQ-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CjnSD3CVZzkWdf;
	Sat, 28 Nov 2020 18:15:24 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.487.0; Sat, 28 Nov 2020 18:15:46 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	<dm-devel@redhat.com>
Date: Sat, 28 Nov 2020 18:19:59 +0800
Message-ID: <20201128101959.95277-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0ASAXcrg021449
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 30 Nov 2020 02:02:38 -0500
Cc: linux-kernel@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>
Subject: [dm-devel] [PATCH 1/3] dm ioctl: fix error return code in
	target_message
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

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 2ca4c92f58f9 ("dm ioctl: prevent empty message")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/md/dm-ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index cd0478d44..5e306bba4 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -1600,6 +1600,7 @@ static int target_message(struct file *filp, struct dm_ioctl *param, size_t para
 
 	if (!argc) {
 		DMWARN("Empty message received.");
+		r = -EINVAL;
 		goto out_argv;
 	}
 
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

