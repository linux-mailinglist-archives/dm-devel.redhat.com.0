Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF78AFB3C
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 13:13:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 845D33003C52;
	Wed, 11 Sep 2019 11:13:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5694860852;
	Wed, 11 Sep 2019 11:13:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90FD32551B;
	Wed, 11 Sep 2019 11:13:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BBD2sb027467 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 07:13:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1EC1B5DA60; Wed, 11 Sep 2019 11:13:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-24.pek2.redhat.com [10.72.8.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F0935D9E2;
	Wed, 11 Sep 2019 11:12:53 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
Date: Wed, 11 Sep 2019 19:12:49 +0800
Message-Id: <20190911111249.19772-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH] dm-raid: fix updating of max_discard_sectors
	limit
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 11 Sep 2019 11:13:45 +0000 (UTC)

Unit of 'chunk_size' is byte, instead of sector, so fix it.

Without this fix, too big max_discard_sectors is applied on the request queue
of dm-raid, finally raid code has to split the bio again.

This re-split by raid may cause the following nested clone_endio:

1) one big bio 'A' is submitted to dm queue, and served as the original
bio

2) one new bio 'B' is cloned from the original bio 'A', and .map()
is run on this bio of 'B', and B's original bio points to 'A'

3) raid code sees that 'B' is too big, and split 'B' and re-submit
the remainded part of 'B' to dm-raid queue via generic_make_request().

4) now dm will hanlde 'B' as new original bio, then allocate a new
clone bio of 'C' and run .map() on 'C'. Meantime C's original bio
points to 'B'.

5) suppose now 'C' can be completed by raid direclty, then the following
clone_endio() is called recursively:

	clone_endio(C)
		->clone_endio(B)		#B is original bio of 'C'
			->clone_endio(A)	#A is original bio of 'B'

'A' can be big enough to make such handreds of nested clone_endio(), then
stack is corrupted.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/md/dm-raid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 8a60a4a070ac..c26aa4e8207a 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -3749,7 +3749,7 @@ static void raid_io_hints(struct dm_target *ti, struct queue_limits *limits)
 	 */
 	if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
 		limits->discard_granularity = chunk_size;
-		limits->max_discard_sectors = chunk_size;
+		limits->max_discard_sectors = chunk_size >> 9;
 	}
 }
 
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
