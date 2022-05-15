Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D94527A4B
	for <lists+dm-devel@lfdr.de>; Sun, 15 May 2022 23:06:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652648814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=15iAATIRVIk75i+/+00zveziDb+cMBLLi0LLqMyuUWs=;
	b=PuraOA7Uh1w0Myi3WEf0lgEOhqDY1F9wQDMiBA42UWQTAjhw8mUuIZlQETXm6W4cjNTKWt
	OEnY3NloM3hUQzqI2b8yhZ0DocLbKUcOvs15w1Hk80ytGdDGEZq3nWUsZ0Dsu4aHQ/22PP
	iZ8brQ5mYO22bPEkE+L2Pu9u6lYa9JA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-E3dCLvQlP3y6zQRyhPqhJA-1; Sun, 15 May 2022 17:06:52 -0400
X-MC-Unique: E3dCLvQlP3y6zQRyhPqhJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6368C1C05EA9;
	Sun, 15 May 2022 21:06:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1CD520296AC;
	Sun, 15 May 2022 21:06:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1DA971947067;
	Sun, 15 May 2022 21:06:43 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 199AD194704D
 for <dm-devel@listman.corp.redhat.com>; Sun, 15 May 2022 21:06:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB9B240D2973; Sun, 15 May 2022 21:06:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7A8D40D296C;
 Sun, 15 May 2022 21:06:41 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 24FL6fiV016750; Sun, 15 May 2022 17:06:41 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 24FL6fpq016746; Sun, 15 May 2022 17:06:41 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Sun, 15 May 2022 17:06:41 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>, 
 Zdenek Kabelac <zkabelac@redhat.com>, Song Liu <song@kernel.org>,
 Bruno Goncalves <bgoncalv@redhat.com>
Message-ID: <alpine.LRH.2.02.2205151635090.15212@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [dm-devel] [PATCH] dm-raid: fix address sanitizer warning in
 raid_status
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is this warning when using a kernel with the address sanitizer and
running this testsuite:
https://gitlab.com/cki-project/kernel-tests/-/tree/main/storage/swraid/scsi_raid

==================================================================
BUG: KASAN: slab-out-of-bounds in raid_status+0x1747/0x2820 [dm_raid]
Read of size 4 at addr ffff888079d2c7e8 by task lvcreate/13319
CPU: 0 PID: 13319 Comm: lvcreate Not tainted 5.18.0-0.rc3.20220421gitb253435746d9a4a.30.eln117.x86_64 #1
Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
Call Trace:
 <TASK>
 dump_stack_lvl+0x6a/0x9c
 print_address_description.constprop.0+0x1f/0x1e0
 print_report.cold+0x55/0x244
 kasan_report+0xc9/0x100
 raid_status+0x1747/0x2820 [dm_raid]
 dm_ima_measure_on_table_load+0x4b8/0xca0 [dm_mod]
 table_load+0x35c/0x630 [dm_mod]
 ctl_ioctl+0x411/0x630 [dm_mod]
 dm_ctl_ioctl+0xa/0x10 [dm_mod]
 __x64_sys_ioctl+0x12a/0x1a0
 do_syscall_64+0x5b/0x80

The warning is caused by reading conf->max_nr_stripes in raid_status. The
code in raid_status reads mddev->private, casts it to struct r5conf and
reads the entry max_nr_stripes.

However, if we have different raid type than 4/5/6, mddev->private doesn't
point to struct r5conf; it may point to struct r0conf, struct r1conf,
struct r10conf or struct mpconf. If we cast a pointer to one of these
structs to struct r5conf, we will be reading invalid memory and KASAN
warns about it.

This patch fixes the bug by reading struct r5conf only if raid type is 4,
5 or 6.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm-raid.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-raid.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-raid.c	2022-05-15 22:08:59.000000000 +0200
+++ linux-2.6/drivers/md/dm-raid.c	2022-05-15 22:08:59.000000000 +0200
@@ -3512,7 +3512,7 @@ static void raid_status(struct dm_target
 {
 	struct raid_set *rs = ti->private;
 	struct mddev *mddev = &rs->md;
-	struct r5conf *conf = mddev->private;
+	struct r5conf *conf = rs_is_raid456(rs) ? mddev->private : NULL;
 	int i, max_nr_stripes = conf ? conf->max_nr_stripes : 0;
 	unsigned long recovery;
 	unsigned int raid_param_cnt = 1; /* at least 1 for chunksize */
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

