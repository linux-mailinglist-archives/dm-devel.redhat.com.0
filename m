Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CE33635EF20
	for <lists+dm-devel@lfdr.de>; Wed, 14 Apr 2021 10:15:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-AnIpTRFpNtGNYVHOU4JHtA-1; Wed, 14 Apr 2021 04:15:16 -0400
X-MC-Unique: AnIpTRFpNtGNYVHOU4JHtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A458181746E;
	Wed, 14 Apr 2021 08:15:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD3AD101E24F;
	Wed, 14 Apr 2021 08:15:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E15741806D0F;
	Wed, 14 Apr 2021 08:15:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13E23dVl014556 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 13 Apr 2021 22:03:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52571E2022; Wed, 14 Apr 2021 02:03:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C9E8BDC58
	for <dm-devel@redhat.com>; Wed, 14 Apr 2021 02:03:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0A15185A7A5
	for <dm-devel@redhat.com>; Wed, 14 Apr 2021 02:03:36 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-422-2VVbADDROv-102dWraggxw-1; Tue, 13 Apr 2021 22:03:33 -0400
X-MC-Unique: 2VVbADDROv-102dWraggxw-1
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FKlYh6WdhzB07K;
	Wed, 14 Apr 2021 09:41:12 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
	DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server
	id 14.3.498.0; Wed, 14 Apr 2021 09:43:23 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <agk@redhat.com>, <snitzer@redhat.com>
Date: Wed, 14 Apr 2021 09:43:44 +0800
Message-ID: <1618364624-36545-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
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
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 14 Apr 2021 04:14:49 -0400
Cc: Tian Tao <tiantao6@hisilicon.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm integrity: fix the unused variables
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The value of r is not used, so fixes this as add a goto statement.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/md/dm-integrity.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index fed8a7c..6977422 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -4049,6 +4049,7 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 			if (val >= (uint64_t)UINT_MAX * 1000 / HZ) {
 				r = -EINVAL;
 				ti->error = "Invalid bitmap_flush_interval argument";
+				goto bad;
 			}
 			ic->bitmap_flush_interval = msecs_to_jiffies(val);
 		} else if (!strncmp(opt_string, "internal_hash:", strlen("internal_hash:"))) {
-- 
2.7.4

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

