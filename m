Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D241D25913
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 22:38:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4CE388309;
	Tue, 21 May 2019 20:37:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80C1F5E7D0;
	Tue, 21 May 2019 20:37:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E32971833002;
	Tue, 21 May 2019 20:36:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LJxQlj011476 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 15:59:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F157608C2; Tue, 21 May 2019 19:59:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A13F643F2
	for <dm-devel@redhat.com>; Tue, 21 May 2019 19:59:23 +0000 (UTC)
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2A83308219E
	for <dm-devel@redhat.com>; Tue, 21 May 2019 19:58:34 +0000 (UTC)
Received: from Lass-MB.fritz.box (aftr-95-222-30-100.unity-media.net
	[95.222.30.100])
	by voltaic.bi-co.net (Postfix) with ESMTPSA id D998C20BA8;
	Tue, 21 May 2019 21:58:21 +0200 (CEST)
From: Michael Lass <bevan@bi-co.net>
To: dm-devel@redhat.com
Date: Tue, 21 May 2019 21:58:07 +0200
Message-Id: <20190521195807.81035-1-bevan@bi-co.net>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Tue, 21 May 2019 19:59:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Tue, 21 May 2019 19:59:01 +0000 (UTC) for IP:'134.119.3.22'
	DOMAIN:'voltaic.bi-co.net' HELO:'voltaic.bi-co.net'
	FROM:'bevan@bi-co.net' RCPT:''
X-RedHat-Spam-Score: 0.001 (SPF_HELO_NONE) 134.119.3.22 voltaic.bi-co.net
	134.119.3.22 voltaic.bi-co.net <bevan@bi-co.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Michael Lass <bevan@bi-co.net>
Subject: [dm-devel] [PATCH] dm: make sure to obey max_io_len_target_boundary
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 21 May 2019 20:38:07 +0000 (UTC)

In 61697a6abd24 __send_changing_extent_only() was simplified as splitting
discards is no longer necessary. However, we still need to obey
max_io_len_target_boundary.

Signed-off-by: Michael Lass <bevan@bi-co.net>
---
 drivers/md/dm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 1fb1333fefec..997385c1ca54 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1469,7 +1469,7 @@ static unsigned get_num_write_zeroes_bios(struct dm_target *ti)
 static int __send_changing_extent_only(struct clone_info *ci, struct dm_target *ti,
 				       unsigned num_bios)
 {
-	unsigned len = ci->sector_count;
+	unsigned len;
 
 	/*
 	 * Even though the device advertised support for this type of
@@ -1480,6 +1480,8 @@ static int __send_changing_extent_only(struct clone_info *ci, struct dm_target *
 	if (!num_bios)
 		return -EOPNOTSUPP;
 
+	len = min((sector_t)ci->sector_count, max_io_len_target_boundary(ci->sector, ti));
+
 	__send_duplicate_bios(ci, ti, num_bios, &len);
 
 	ci->sector += len;
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
