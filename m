Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E58163909ED
	for <lists+dm-devel@lfdr.de>; Tue, 25 May 2021 21:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621972235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MCxkG+M0qEZfPBNprf7QOJ4LtsQ6KUibSJMLnz2mZvE=;
	b=b6Lo66lq/KHL5jtBkgqUG+mj86kjyoMwWfOnFNT3OUYwePE39Khieagc/fuaL1qZDUSszn
	4S2scrAneTyFR+GJdOOjR4EEIMEQXqeV6jRky+HgfncCx1xd6tYXm50RJL3V3w5/uryHVe
	Osw2Ub1SrmCOK8CSuB2RvkQ2JNsEI2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-NZv4QQYQM-ChC4Xku35ldQ-1; Tue, 25 May 2021 15:50:32 -0400
X-MC-Unique: NZv4QQYQM-ChC4Xku35ldQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82F1D10082E0;
	Tue, 25 May 2021 19:50:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 965FB5D9C0;
	Tue, 25 May 2021 19:50:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFB481801029;
	Tue, 25 May 2021 19:50:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14PJnxX7026797 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 15:49:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1A625C1B4; Tue, 25 May 2021 19:49:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46AB95C1A1;
	Tue, 25 May 2021 19:49:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 14PJnt8W030787; Tue, 25 May 2021 15:49:55 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 14PJntcO030783; Tue, 25 May 2021 15:49:55 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 25 May 2021 15:49:55 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2105251548340.29706@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-kcopyd: avoid useless atomic operations
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The functions set_bit and clear_bit are atomic. We don't need atomicity
when making flags for dm-kcopyd. So, change them to direct manipulation of
the flags.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-kcopyd.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-kcopyd.c
+++ linux-2.6/drivers/md/dm-kcopyd.c
@@ -812,7 +812,7 @@ void dm_kcopyd_copy(struct dm_kcopyd_cli
 	if (!test_bit(DM_KCOPYD_WRITE_SEQ, &job->flags)) {
 		for (i = 0; i < job->num_dests; i++) {
 			if (bdev_zoned_model(dests[i].bdev) == BLK_ZONED_HM) {
-				set_bit(DM_KCOPYD_WRITE_SEQ, &job->flags);
+				job->flags |= 1UL << DM_KCOPYD_WRITE_SEQ;
 				break;
 			}
 		}
@@ -823,7 +823,7 @@ void dm_kcopyd_copy(struct dm_kcopyd_cli
 	 */
 	if (test_bit(DM_KCOPYD_WRITE_SEQ, &job->flags) &&
 	    test_bit(DM_KCOPYD_IGNORE_ERROR, &job->flags))
-		clear_bit(DM_KCOPYD_IGNORE_ERROR, &job->flags);
+		job->flags &= ~(1UL << DM_KCOPYD_IGNORE_ERROR);
 
 	if (from) {
 		job->source = *from;
Index: linux-2.6/drivers/md/dm-raid1.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-raid1.c
+++ linux-2.6/drivers/md/dm-raid1.c
@@ -364,7 +364,7 @@ static void recover(struct mirror_set *m
 
 	/* hand to kcopyd */
 	if (!errors_handled(ms))
-		set_bit(DM_KCOPYD_IGNORE_ERROR, &flags);
+		flags |= 1UL << DM_KCOPYD_IGNORE_ERROR;
 
 	dm_kcopyd_copy(ms->kcopyd_client, &from, ms->nr_mirrors - 1, to,
 		       flags, recovery_complete, reg);
Index: linux-2.6/drivers/md/dm-zoned-reclaim.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-zoned-reclaim.c
+++ linux-2.6/drivers/md/dm-zoned-reclaim.c
@@ -134,7 +134,7 @@ static int dmz_reclaim_copy(struct dmz_r
 	dst_zone_block = dmz_start_block(zmd, dst_zone);
 
 	if (dmz_is_seq(dst_zone))
-		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
+		flags |= 1UL << DM_KCOPYD_WRITE_SEQ;
 
 	while (block < end_block) {
 		if (src_zone->dev->flags & DMZ_BDEV_DYING)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

