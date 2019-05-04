Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091D146CA
	for <lists+dm-devel@lfdr.de>; Mon,  6 May 2019 10:50:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 372E587633;
	Mon,  6 May 2019 08:50:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0999D26E71;
	Mon,  6 May 2019 08:50:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 927CF3FB12;
	Mon,  6 May 2019 08:50:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x44AUsit032007 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 4 May 2019 06:30:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6E1060A35; Sat,  4 May 2019 10:30:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7184660C4D;
	Sat,  4 May 2019 10:30:50 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A59B308FC20;
	Sat,  4 May 2019 10:30:49 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 0AED3270C2C608783DE6;
	Sat,  4 May 2019 18:30:47 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Sat, 4 May 2019
	18:30:38 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>
Date: Sat, 4 May 2019 18:30:36 +0800
Message-ID: <20190504103036.34436-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Sat, 04 May 2019 10:30:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sat, 04 May 2019 10:30:49 +0000 (UTC) for IP:'45.249.212.191'
	DOMAIN:'szxga05-in.huawei.com' HELO:'huawei.com'
	FROM:'yuehaibing@huawei.com' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.191 szxga05-in.huawei.com
	45.249.212.191 szxga05-in.huawei.com <yuehaibing@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 May 2019 04:49:36 -0400
Cc: dm-devel@redhat.com, YueHaibing <yuehaibing@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH -next] dm dust: Make dm_dust_init and
	dm_dust_exit static
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 06 May 2019 08:50:38 +0000 (UTC)

Fix sparse warnings:

drivers/md/dm-dust.c:495:12: warning: symbol 'dm_dust_init' was not declared. Should it be static?
drivers/md/dm-dust.c:505:13: warning: symbol 'dm_dust_exit' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/md/dm-dust.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 178587b..3d42e40 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -492,7 +492,7 @@ static struct target_type dust_target = {
 	.prepare_ioctl = dust_prepare_ioctl,
 };
 
-int __init dm_dust_init(void)
+static int __init dm_dust_init(void)
 {
 	int result = dm_register_target(&dust_target);
 
@@ -502,7 +502,7 @@ int __init dm_dust_init(void)
 	return result;
 }
 
-void __exit dm_dust_exit(void)
+static void __exit dm_dust_exit(void)
 {
 	dm_unregister_target(&dust_target);
 }
-- 
2.7.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
