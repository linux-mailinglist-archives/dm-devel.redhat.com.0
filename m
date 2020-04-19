Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A1E6A1B023F
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 09:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587366449;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lU7Rt/rsoOJWezeU1/5IL+uEA/a3dqrwF0THpgTQcyg=;
	b=eDB+XBII0BrgWL7CpJpSI+h9gC9MBhbS/2v3Q5y6BzboEpHxari8WvIxgYr0YQc0nDmG3N
	PmZxJxjo0QMYKAK49caJoIh1X1WQ7iEM9Rztk5SMxcoB7Nwu7XD2TFKNtlpSYEqhiC3plB
	KmTLxRqxR9PMMVVKjaQvnZrdedANdpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-lr3gux66OuS0SjLefv_eMw-1; Mon, 20 Apr 2020 03:07:26 -0400
X-MC-Unique: lr3gux66OuS0SjLefv_eMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00BBD801E70;
	Mon, 20 Apr 2020 07:07:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C98E51001B2B;
	Mon, 20 Apr 2020 07:07:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5680B18089CD;
	Mon, 20 Apr 2020 07:07:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03J7jQm2003013 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Apr 2020 03:45:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9BCD71003215; Sun, 19 Apr 2020 07:45:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9643E1003345
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 07:45:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 383C48EE331
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 07:45:24 +0000 (UTC)
Received: from master.debian.org (master.debian.org [82.195.75.110]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-353-rClfPctUNNSNQkXh4J3KpQ-1; Sun, 19 Apr 2020 03:45:20 -0400
X-MC-Unique: rClfPctUNNSNQkXh4J3KpQ-1
Received: from pabs by master.debian.org with local (Exim 4.92)
	(envelope-from <pabs@master.debian.org>)
	id 1jQ4Q9-00040e-4Q; Sun, 19 Apr 2020 07:31:17 +0000
From: Paul Wise <pabs3@bonedaddy.net>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org
Date: Sun, 19 Apr 2020 15:30:25 +0800
Message-Id: <20200419073026.197967-3-pabs3@bonedaddy.net>
In-Reply-To: <20200419073026.197967-1-pabs3@bonedaddy.net>
References: <20200419073026.197967-1-pabs3@bonedaddy.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03J7jQm2003013
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 03:06:56 -0400
Cc: Paul Wise <pabs3@bonedaddy.net>
Subject: [dm-devel] [PATCH 2/3] dm raid: only check for RAID 4/5/6 once
	during discard support setup
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The RAID level 4/5/6 check no longer looks at the devices in the array,
so it isn't necessary for it to be checked once for each device,
so check it before the loop over the devices.

This makes the code cleaner and easier to understand since it
disentangles whole-array checks from per-device checks.

Commit 48920ff2a5a9 ("block: remove the discard_zeroes_data flag") removed
the per-device discard_zeroes_data check since REQ_OP_WRITE_ZEROES
operation was used everywhere and commit 48cf06bc5f50 ("dm raid: add
discard support for RAID levels 4, 5 and 6") introduced the RAID 4/5/6
check.

Signed-off-by: Paul Wise <pabs3@bonedaddy.net>
---
 drivers/md/dm-raid.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 9a18bef0a5ff..0f95e50e62a8 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -2944,13 +2944,16 @@ static int rs_setup_reshape(struct raid_set *rs)
 static void configure_discard_support(struct raid_set *rs)
 {
 	int i;
-	bool raid456;
 	struct dm_target *ti = rs->ti;
 
 	/*
 	 * XXX: RAID level 4,5,6 require zeroing for safety.
 	 */
-	raid456 = rs_is_raid456(rs);
+	if (rs_is_raid456(rs) && !devices_handle_discard_safely) {
+		DMERR("raid456 discard support disabled due to discard_zeroes_data uncertainty.");
+		DMERR("Set dm-raid.devices_handle_discard_safely=Y to override.");
+		return;
+	}
 
 	for (i = 0; i < rs->raid_disks; i++) {
 		struct request_queue *q;
@@ -2961,14 +2964,6 @@ static void configure_discard_support(struct raid_set *rs)
 		q = bdev_get_queue(rs->dev[i].rdev.bdev);
 		if (!q || !blk_queue_discard(q))
 			return;
-
-		if (raid456) {
-			if (!devices_handle_discard_safely) {
-				DMERR("raid456 discard support disabled due to discard_zeroes_data uncertainty.");
-				DMERR("Set dm-raid.devices_handle_discard_safely=Y to override.");
-				return;
-			}
-		}
 	}
 
 	ti->num_discard_bios = 1;
-- 
2.26.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

