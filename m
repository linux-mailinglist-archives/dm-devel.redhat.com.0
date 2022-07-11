Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDBB56088D
	for <lists+dm-devel@lfdr.de>; Wed, 29 Jun 2022 20:06:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656525960;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l0VV6KKqhVfJoPM2XEyac2bFpFyvf7ILovkcObAVWVk=;
	b=YdDVD7Xmu57LNylU7dmn1IBpF4kzptf+y2hhjDedbMO72ZaJGxpAzGHI6pvePev+19i8fI
	xvE8ipWmH1QSaFgdHHUaBOuQybjx1NSTmJlKOwRtPiQBHylknMLCFAlPMzxMsFkBY/5xvF
	CzKVORM30lYYv2GLKyZDDkzmputcRiI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-I5pZFwMROUO5RgOh0JhWGA-1; Wed, 29 Jun 2022 14:05:58 -0400
X-MC-Unique: I5pZFwMROUO5RgOh0JhWGA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA3FE802C17;
	Wed, 29 Jun 2022 18:05:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D76CD492C3B;
	Wed, 29 Jun 2022 18:05:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C95E51947068;
	Wed, 29 Jun 2022 18:05:52 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 53D741947058
 for <dm-devel@listman.corp.redhat.com>; Wed, 29 Jun 2022 17:40:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0FF7BC15D42; Wed, 29 Jun 2022 17:40:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07599C28115;
 Wed, 29 Jun 2022 17:40:58 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 25THevOg018812; Wed, 29 Jun 2022 13:40:57 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 25THevEk018809; Wed, 29 Jun 2022 13:40:57 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Wed, 29 Jun 2022 13:40:57 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: song@kernel.org, Mike Snitzer <msnitzer@redhat.com>,
 Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <alpine.LRH.2.02.2206291340050.18482@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [dm-devel] [PATCH] dm-raid: fix KASAN warning in raid5_add_disks
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-raid@vger.kernel.org, dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There's a KASAN warning in raid5_add_disk when running the LVM testsuite.
The warning happens in the test
lvconvert-raid-reshape-linear_to_raid6-single-type.sh. We fix the warning
by verifying that rdev->saved_raid_disk is within limits.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/raid5.c |    1 +
 1 file changed, 1 insertion(+)

Index: linux-2.6/drivers/md/raid5.c
===================================================================
--- linux-2.6.orig/drivers/md/raid5.c	2022-06-24 18:45:53.000000000 +0200
+++ linux-2.6/drivers/md/raid5.c	2022-06-24 18:46:59.000000000 +0200
@@ -8065,6 +8065,7 @@ static int raid5_add_disk(struct mddev *
 	 */
 	if (rdev->saved_raid_disk >= 0 &&
 	    rdev->saved_raid_disk >= first &&
+	    rdev->saved_raid_disk <= last &&
 	    conf->disks[rdev->saved_raid_disk].rdev == NULL)
 		first = rdev->saved_raid_disk;
 
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

