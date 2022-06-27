Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E143755BA2E
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jun 2022 15:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656338169;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6seFpXLKJKz7fFooS/zmo0E6Ygri8jb3aF16U8f8GMk=;
	b=BQHOEydApU8hQfctSWnFE8/v0WX4/C3rBV1hlXf0gJmhGKlzsXFEMlpNvcgQBcprayC3fU
	Tn/bGupUVtlr9Btn8Ks/EsFs5ffDAv4pX2vQvrr9NNJIO8Bs4o+syAruFwbfqsLy2U32w+
	vFUisTgU4jxLMeJ7Z2m/5EJ2/qNTWGQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-k4SArXJGOEqLmzu0PSZ6lg-1; Mon, 27 Jun 2022 09:56:05 -0400
X-MC-Unique: k4SArXJGOEqLmzu0PSZ6lg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BD7E101A588;
	Mon, 27 Jun 2022 13:56:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0B01415F5E;
	Mon, 27 Jun 2022 13:56:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8B9081947052;
	Mon, 27 Jun 2022 13:56:02 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8CF3619466DF
 for <dm-devel@listman.corp.redhat.com>; Mon, 27 Jun 2022 13:56:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7C74F492CAA; Mon, 27 Jun 2022 13:56:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 651F0492CA3;
 Mon, 27 Jun 2022 13:56:00 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 25RDu0Av016820; Mon, 27 Jun 2022 09:56:00 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 25RDu06O016816; Mon, 27 Jun 2022 09:56:00 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 27 Jun 2022 09:56:00 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Heinz Mauelshagen <heinzm@redhat.com>
In-Reply-To: <CAM23VxqOH9SeZFvfbFD2zUF_WFDUVY1Xh0ngp_1E+7n=7+7TUQ@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2206270954570.16147@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2206270858520.13562@file01.intranet.prod.int.rdu2.redhat.com>
 <CAM23VxqOH9SeZFvfbFD2zUF_WFDUVY1Xh0ngp_1E+7n=7+7TUQ@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH v2] dm-raid: fix out of memory accesses in dm-raid
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
Cc: Mike Snitzer <msnitzer@redhat.com>, Marian Csontos <mcsontos@redhat.com>,
 linux-raid <linux-raid@vger.kernel.org>, Song Liu <song@kernel.org>,
 dm-devel@redhat.com, Ming Lei <minlei@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-raid allocates the array of devices with rs->raid_disks entries and
then accesses it in a loop for rs->md.raid_disks. During reshaping,
rs->md.raid_disks may be greater than rs->raid_disks, so it accesses
entries beyond the end of the array.

We fix this bug by limiting the iteration to rs->raid_disks.

The bug is triggered when running lvm test shell/lvconvert-raid.sh and the
kernel is compiled with kasan.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm-raid.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

Index: linux-2.6/drivers/md/dm-raid.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-raid.c	2022-06-27 15:44:12.000000000 +0200
+++ linux-2.6/drivers/md/dm-raid.c	2022-06-27 15:44:12.000000000 +0200
@@ -1004,7 +1004,7 @@ static int validate_raid_redundancy(stru
 	unsigned int rebuilds_per_group = 0, copies;
 	unsigned int group_size, last_group_start;
 
-	for (i = 0; i < rs->md.raid_disks; i++)
+	for (i = 0; i < rs->raid_disks; i++)
 		if (!test_bit(In_sync, &rs->dev[i].rdev.flags) ||
 		    !rs->dev[i].rdev.sb_page)
 			rebuild_cnt++;
@@ -1047,7 +1047,7 @@ static int validate_raid_redundancy(stru
 		 *	    C	 D    D	   E	E
 		 */
 		if (__is_raid10_near(rs->md.new_layout)) {
-			for (i = 0; i < rs->md.raid_disks; i++) {
+			for (i = 0; i < rs->raid_disks; i++) {
 				if (!(i % copies))
 					rebuilds_per_group = 0;
 				if ((!rs->dev[i].rdev.sb_page ||
@@ -1073,7 +1073,7 @@ static int validate_raid_redundancy(stru
 		group_size = (rs->md.raid_disks / copies);
 		last_group_start = (rs->md.raid_disks / group_size) - 1;
 		last_group_start *= group_size;
-		for (i = 0; i < rs->md.raid_disks; i++) {
+		for (i = 0; i < rs->raid_disks; i++) {
 			if (!(i % copies) && !(i > last_group_start))
 				rebuilds_per_group = 0;
 			if ((!rs->dev[i].rdev.sb_page ||
@@ -1588,7 +1588,7 @@ static sector_t __rdev_sectors(struct ra
 {
 	int i;
 
-	for (i = 0; i < rs->md.raid_disks; i++) {
+	for (i = 0; i < rs->raid_disks; i++) {
 		struct md_rdev *rdev = &rs->dev[i].rdev;
 
 		if (!test_bit(Journal, &rdev->flags) &&
@@ -3766,7 +3766,7 @@ static int raid_iterate_devices(struct d
 	unsigned int i;
 	int r = 0;
 
-	for (i = 0; !r && i < rs->md.raid_disks; i++)
+	for (i = 0; !r && i < rs->raid_disks; i++)
 		if (rs->dev[i].data_dev)
 			r = fn(ti,
 				 rs->dev[i].data_dev,
@@ -3817,7 +3817,7 @@ static void attempt_restore_of_faulty_de
 
 	memset(cleared_failed_devices, 0, sizeof(cleared_failed_devices));
 
-	for (i = 0; i < mddev->raid_disks; i++) {
+	for (i = 0; i < rs->raid_disks; i++) {
 		r = &rs->dev[i].rdev;
 		/* HM FIXME: enhance journal device recovery processing */
 		if (test_bit(Journal, &r->flags))

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

