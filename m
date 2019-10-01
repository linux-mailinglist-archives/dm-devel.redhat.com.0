Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E47C41DB
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 22:38:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A17B10DCC92;
	Tue,  1 Oct 2019 20:38:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 256A260619;
	Tue,  1 Oct 2019 20:38:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BACDB180085A;
	Tue,  1 Oct 2019 20:38:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91KbrxT018887 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 16:37:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AFD7D1001B22; Tue,  1 Oct 2019 20:37:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (ovpn-117-201.ams2.redhat.com [10.36.117.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8307F1001B11;
	Tue,  1 Oct 2019 20:37:47 +0000 (UTC)
From: Heinz Mauelshagen <heinzm@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com
Date: Tue,  1 Oct 2019 22:37:47 +0200
Message-Id: <53c8e7d1576cb4471cb399a3630d021087a150f3.1569962154.git.heinzm@redhat.com>
In-Reply-To: <c38233bcdbd0d33e1bcf71bf0ad01335e79c845e.1569962154.git.heinzm@redhat.com>
References: <c38233bcdbd0d33e1bcf71bf0ad01335e79c845e.1569962154.git.heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: heinzm@redhat.com
Subject: [dm-devel] [PATCH 5/4] dm raid: revert recovery offset definition
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Tue, 01 Oct 2019 20:38:06 +0000 (UTC)

Previous patch "dm raid: streamline rs_get_progress() and its
raid_status() caller side" mistakenly simplified the definition
of the recovery offset.  This caused the offset to immediately be
resync maximum when checks or repairs are requested.

Revert to the old definition.

Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
---
 drivers/md/dm-raid.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 63a4a26fae3e..13fa90546a0f 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -3426,7 +3426,10 @@ static sector_t rs_get_progress(struct raid_set *rs, unsigned long recovery,
 		set_bit(RT_FLAG_RS_IN_SYNC, &rs->runtime_flags);
 
 	} else {
-		r = max(mddev->recovery_cp, mddev->curr_resync_completed);
+		if (state == st_idle && !test_bit(MD_RECOVERY_INTR, &recovery))
+			r = mddev->recovery_cp;
+		else
+			r = mddev->curr_resync_completed;
 
 		if (state == st_idle && r >= resync_max_sectors) {
 			/*
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
