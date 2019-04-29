Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FBDE329
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 14:58:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F055BC04959E;
	Mon, 29 Apr 2019 12:58:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D9AC177A6;
	Mon, 29 Apr 2019 12:58:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D976241F3C;
	Mon, 29 Apr 2019 12:58:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TCvxFj023645 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 08:57:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F41A46CE65; Mon, 29 Apr 2019 12:57:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A33DE6CE52;
	Mon, 29 Apr 2019 12:57:56 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.89)
	(envelope-from <mpatocka@redhat.com>)
	id 1hL5r0-00081G-3i; Mon, 29 Apr 2019 14:57:55 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 29 Apr 2019 14:57:42 +0200
Message-Id: <20190429125742.218227600@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 29 Apr 2019 14:57:21 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-integrity-large-range.patch
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 05/10] dm-integrity: allow large ranges
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 29 Apr 2019 12:58:10 +0000 (UTC)

This patch changes the type of the variable n_sectors from unsigned to
n_sectors. The following patches will need to lock large ranges.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2019-04-16 21:21:14.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2019-04-16 21:21:14.000000000 +0200
@@ -246,7 +246,7 @@ struct dm_integrity_c {
 
 struct dm_integrity_range {
 	sector_t logical_sector;
-	unsigned n_sectors;
+	sector_t n_sectors;
 	bool waiting;
 	union {
 		struct rb_node node;
@@ -1695,7 +1695,7 @@ retry:
 			unsigned ws, we, range_sectors;
 
 			dio->range.n_sectors = min(dio->range.n_sectors,
-						   ic->free_sectors << ic->sb->log2_sectors_per_block);
+						   (sector_t)ic->free_sectors << ic->sb->log2_sectors_per_block);
 			if (unlikely(!dio->range.n_sectors)) {
 				if (from_map)
 					goto offload_to_thread;
@@ -2153,7 +2153,7 @@ next_chunk:
 	get_area_and_offset(ic, range.logical_sector, &area, &offset);
 	range.n_sectors = min((sector_t)RECALC_SECTORS, ic->provided_data_sectors - range.logical_sector);
 	if (!ic->meta_dev)
-		range.n_sectors = min(range.n_sectors, (1U << ic->sb->log2_interleave_sectors) - (unsigned)offset);
+		range.n_sectors = min(range.n_sectors, ((sector_t)1U << ic->sb->log2_interleave_sectors) - (unsigned)offset);
 
 	if (unlikely(!add_new_range(ic, &range, true)))
 		wait_and_add_new_range(ic, &range);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
