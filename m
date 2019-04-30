Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E054F1C9
	for <lists+dm-devel@lfdr.de>; Tue, 30 Apr 2019 10:08:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4E9B30833A3;
	Tue, 30 Apr 2019 08:08:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1AD7600C2;
	Tue, 30 Apr 2019 08:08:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C854018089C9;
	Tue, 30 Apr 2019 08:08:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3U1pHIE017268 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 21:51:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F200469731; Tue, 30 Apr 2019 01:51:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 631244CE;
	Tue, 30 Apr 2019 01:51:12 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 567713082E06;
	Tue, 30 Apr 2019 01:51:11 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id B023F5F571EDF2019DEF;
	Tue, 30 Apr 2019 09:51:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
	DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server
	id 14.3.439.0; Tue, 30 Apr 2019 09:51:01 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Date: Tue, 30 Apr 2019 02:01:02 +0000
Message-ID: <20190430020102.56234-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Tue, 30 Apr 2019 01:51:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 30 Apr 2019 01:51:11 +0000 (UTC) for IP:'45.249.212.190'
	DOMAIN:'szxga04-in.huawei.com' HELO:'huawei.com'
	FROM:'yuehaibing@huawei.com' RCPT:''
X-RedHat-Spam-Score: -0.702  (RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.190 szxga04-in.huawei.com
	45.249.212.190 szxga04-in.huawei.com <yuehaibing@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Apr 2019 04:08:25 -0400
Cc: kernel-janitors@vger.kernel.org, dm-devel@redhat.com,
	YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH -next] dm: remove unused including
	<linux/version.h>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 30 Apr 2019 08:08:47 +0000 (UTC)

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/md/dm-dust.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 997830984893..df011da50b50 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -10,7 +10,6 @@
 
 #include <linux/device-mapper.h>
 #include <linux/module.h>
-#include <linux/version.h>
 #include <linux/rbtree.h>
 
 #define DM_MSG_PREFIX "dust"





--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
